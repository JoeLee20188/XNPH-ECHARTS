<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%request.setCharacterEncoding("UTF-8");%> 
<%response.setCharacterEncoding("UTF-8");%> 
<!DOCTYPE HTML>  

<html>
  <head>
    <title>小牛普惠回款统计报表</title>  
    <script src="./js/echarts.js"></script> 
    <script src="./js/china.js"></script> 
	<script src="./js/jquery-1.7.2.min.js"></script>
  </head>  
  <body>    
    <div id="Capital" style="height:500px;border:1px solid #ccc;padding:10px;"></div>   
    
    <script type="text/javascript">                      
            var myChart = echarts.init(document.getElementById('Capital'));  
            var option = {
                tooltip: {
                    trigger: 'axis',
                    position: function (pt) {
                        return [pt[0], '10%'];
                    }
                },
                title: {
                    left: 'left',
                    text: '小微贷各营业部经营情况',
                    subtext: 'Data From Xndb',
                },
                legend: {
                    top: 'bottom',
                    data:['意向']
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataView: {show: true, readOnly: false},
                        magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: []
                },
                yAxis: {
                    type: 'value',
                    boundaryGap: [0, '100%']
                },
                dataZoom: [{
                    type: 'inside',
                    start: 0,
                    end: 99
                }, {
                    start: 0,
                    end: 10
                }],
                series: [
                    {
                        name:'今日申请笔数（笔）',
                        type:'line',
                        smooth:true,
                        symbol: 'none',
                        sampling: 'average',
                        itemStyle: {
                            normal: {
                                color: 'rgb(255, 70, 131)'
                            }
                        },
                        areaStyle: {
                            normal: {
                                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                    offset: 0,
                                    color: 'rgb(10, 158, 68)'
                                }, {
                                    offset: 1,
                                    color: 'rgb(255, 70, 131)'
                                }])
                            }
                        },
                        data: []
                    },
                    {
                        name:'今日放款笔数（笔）',
                        type:'line',
                        smooth:true,
                        symbol: 'none',
                        sampling: 'average',
                        itemStyle: {
                            normal: {
                                color: 'rgb(255, 70, 131)'
                            }
                        },
                        areaStyle: {
                            normal: {
                                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                    offset: 0,
                                    color: 'rgb(255, 158, 68)'
                                }, {
                                    offset: 1,
                                    color: 'rgb(255, 70, 131)'
                                }])
                            }
                        },
                        data: []
                    },
                    {
                        name:'今日放款合同金额（万元）',
                        type:'line',
                        smooth:true,
                        symbol: 'none',
                        sampling: 'average',
                        itemStyle: {
                            normal: {
                                color: 'rgb(255, 70, 131)'
                            }
                        },
                        areaStyle: {
                            normal: {
                                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                    offset: 0,
                                    color: 'rgb(255, 158, 68)'
                                }, {
                                    offset: 1,
                                    color: 'rgb(255, 70, 131)'
                                }])
                            }
                        },
                        data: []
                    }               
                ]
            };
				myChart.showLoading(); 
        		
        		$.ajax( {
            	    url:'GetJson/GJ_XW_today.jsp',
            	    type:'post',  
            	    cache:false,
            	    dataType:'json',
            	    success:function(result) {
            	    	myChart.hideLoading();
            	    	myChart.setOption(	
            	    			{
            	    				xAxis:[{data:result.branch_name}],
            	    				series: [
            	    				         {data:result.apply_num},
            	    				         {data:result.loan_num},
            	    				         {data:result.loan_money}
            	    				         ]
            	        }); 
            	    },  
            	     error : function() {  
            	          alert("异常！");  
            	     }  
            		});
        		myChart.setOption(option);  
    </script>  
    
<style type="text/css">
table{ width:800px; margin:auto; padding: 5px; font-size:12px; border:0px; background:#00CCFF;}
tr{ background:#fff;}
td{ padding: 5px;}
#title{ text-align:center;}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>产品销售概况</title>
</head>

<body>
 <%
 //连接Oracle数据库 
 	Class.forName("oracle.jdbc.OracleDriver");
  	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@10.8.40.10:1521:xnph1","jhjy","jhjy");
  	Statement st = conn.createStatement();
  	
 %>
     <table >  
  <tr>  
    <td width="260" id="title">营业部名称</td>  
    <td width="260" id="title">今日申请件数</td>  
    <td width="260" id="title">今日放款件数</td>  
    <td width="260" id="title">今日放款合同金额</td>  
  </tr>  
      
<%  
    //把表格第二行的显示放到while循环中，就可以根据查询结果画出表格了。参数则放在<td>内的相应位置。  
    ResultSet rs = st.executeQuery("(select n.branch_name,m.apply_num,p.loan_num,loan_money from (select distinct branch_name from xndb.apply_info where BUSINESS_UNIT_SOURCE='小微贷事业部' and branch_name is not null) n left join (select count(b.apply_id)as apply_num,c.branch_name from (select a.APPLY_ID,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a where a.ACTIVITY_ID='utask_apply_review' group by a.APPLY_ID having to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')=to_char((select sysdate from dual),'YYYY/MM/DD')) b left join xndb.apply_info c on b.APPLY_ID=c.APPLY_ID where c.BUSINESS_UNIT_SOURCE='小微贷事业部' group by c.branch_name) m on n.branch_name=m.branch_name left join (select c.branch_name,count(b.contract_no) as loan_num,round(sum(b.CONTRACT_AMOUNT)/10000,0) as loan_money from (select a.apply_id,a.contract_no,to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,a.CONTRACT_AMOUNT from xndb.apply_contract a where a.contract_state in('PASS','STPASS','STFAILER') and to_char(a.real_pay_date,'YYYY/MM/DD')=to_char((select sysdate from dual),'YYYY/MM/DD')) b left join xndb.apply_info c on b.APPLY_ID=c.APPLY_ID where c.BUSINESS_UNIT_SOURCE='小微贷事业部' group by c.branch_name) p on n.branch_name=p.branch_name) union all select '小微贷事业部',sum(apply_num),sum(loan_num),sum(loan_money) from (select n.branch_name,m.apply_num,p.loan_num,loan_money from (select distinct branch_name from xndb.apply_info where BUSINESS_UNIT_SOURCE='小微贷事业部' and branch_name is not null) n left join (select count(b.apply_id)as apply_num,c.branch_name from (select a.APPLY_ID,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a where a.ACTIVITY_ID='utask_apply_review' group by a.APPLY_ID having to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')=to_char((select sysdate from dual),'YYYY/MM/DD')) b left join xndb.apply_info c on b.APPLY_ID=c.APPLY_ID where c.BUSINESS_UNIT_SOURCE='小微贷事业部' group by c.branch_name) m on n.branch_name=m.branch_name left join (select c.branch_name,count(b.contract_no) as loan_num,round(sum(b.CONTRACT_AMOUNT)/10000,0) as loan_money from (select a.apply_id,a.contract_no,to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,a.CONTRACT_AMOUNT from xndb.apply_contract a where a.contract_state in('PASS','STPASS','STFAILER') and to_char(a.real_pay_date,'YYYY/MM/DD')=to_char((select sysdate from dual),'YYYY/MM/DD')) b left join xndb.apply_info c on b.APPLY_ID=c.APPLY_ID where c.BUSINESS_UNIT_SOURCE='小微贷事业部' group by c.branch_name) p on n.branch_name=p.branch_name)");  
    while(rs.next()){%>  
      
  <tr>  
    <td width="260" ><%=rs.getString("branch_name") %></td>  
    <td width="260" ><%=rs.getInt("apply_num") %></td>  
    <td width="260"><%=rs.getInt("loan_num") %></td>  
    <td width="260"><%=rs.getInt("loan_money") %></td> 
  </tr>  
  
<%}  
//注意"}"的位置 %>  
 </table>  
  
<%  
    rs.close();  
    conn.close();  
 %>
 <a href="./GetExcel/GE_pro_biaoge.jsp">下载数据</a>
  </body>  
</html>