<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%request.setCharacterEncoding("UTF-8");%> 
<%response.setCharacterEncoding("UTF-8");%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>农商贷每日快报</title>
    <script src="js/jquery-3.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/echarts.js"></script>
    <script src="./js/roma.js"></script>
    <script src="./js/china.js"></script>
</head>
<body style="padding-top: 60px;font-family: 'Microsoft YaHei UI'">
<%
 //连接mysql数据库 
 	Class.forName("com.mysql.jdbc.Driver");
  	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/echart_db","root","");
  	Statement st = conn.createStatement();
  	
 %>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="./ph_main.jsp">小牛普惠DataWeb</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="./ph_main.jsp">首页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        业务快报<b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="./daily_report.jsp">普惠总览</a></li>
                        <li><a href="./daily_report_xw.jsp">小微贷</a></li>
                        <li><a href="./daily_report_sn.jsp">三农贷</a></li>
                        <li><a href="./daily_report_ns.jsp">农商贷</a></li>
                        <li><a href="./daily_report_hlw.jsp">互联网</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        经营分析 （开发ing）<b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">月度分析报告</a></li>
                        <li><a href="#">客户专题报告</a></li>
                        <li class="divider"></li>
                        <li><a href="#">产品专题报告</a></li>
                        <li><a href="#">门店专题报告</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">月结报表（开发ing）<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">事业部报表</a></li>
                        <li><a href="#">门店报表</a></li>
                        <li><a href="#">产品报表</a></li>
                        <li><a href="#">逾期报表</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <table class="table table-hover table-bordered" style="table-layout: fixed;">
            <caption class="text-center"><h3>农商贷业务快报</h3></caption>
            <thead>
            <tr class="alert-success">
                <th class="text-center">区域</th>
                <th class="text-center">申请件数</th>
                <th class="text-center">通过件数</th>
                <th class="text-center">拒绝件数</th>
                <th class="text-center">通过率</th>
                <th class="text-center">放款件数</th>
                <th class="text-center">合同金额</th>
                <th class="text-center">件均</th>
            </tr>
            </thead>
            <tbody>
<%ResultSet rs = st.executeQuery("SELECT * FROM echart_db.fast_table_ns");  
    while(rs.next()){%>
            <tr class="text-center">
                <td><%=rs.getString("REGION_AREA_") %></td>
                <td><%=rs.getInt("APPLY_NUM") %></td>
                <td><%=rs.getInt("PASS_NUM") %></td>
                <td><%=rs.getInt("REFUSE_NUM") %></td>
                <td><%=rs.getString("PASS_RATE") %></td>
                <td><%=rs.getInt("LOAN_NUM") %></td>
                <td><%=rs.getInt("LOAN_MONEY") %></td>
                <td><%=rs.getDouble("AVE") %></td>
            </tr>
<%}%>
            </tbody>
        </table>
<%  
    rs.close();   
%>
    </div>
    <div class="row">
        <table class="table table-hover table-bordered" style="table-layout: fixed;">
            <thead>
             <tr class="alert-success">
                <th class="text-center" style="width:120px;" rowspan="2">区域</th>
                <th class="text-center" colspan="8">逾期率</th>
                <th class="text-center" colspan="8">金额</th>
            </tr>
            <tr class="alert-success">
                <th class="text-center">总逾</th>
                <th class="text-center">M1</th>
                <th class="text-center">M2</th>
                <th class="text-center">M3</th>
                <th class="text-center">M4</th>
                <th class="text-center">M5</th>
                <th class="text-center">M6</th>
                <th class="text-center">M6+</th>
                <th class="text-center">待收</th>
                <th class="text-center">M1</th>
                <th class="text-center">M2</th>
                <th class="text-center">M3</th>
                <th class="text-center">M4</th>
                <th class="text-center">M5</th>
                <th class="text-center">M6</th>
                <th class="text-center">M6+</th>
            </tr>
            </thead>
            <tbody>
<%  ResultSet rs1 = st.executeQuery("SELECT * FROM echart_db.overdue_ns order by fengmu desc");
while(rs1.next()){%>
            <tr class="text-center">
                <td><%=rs1.getString("region_name") %></td>
                <td><%=rs1.getString("total_rate") %></td>
                <td><%=rs1.getString("m1_rate") %></td>
                <td><%=rs1.getString("m2_rate") %></td>
                <td><%=rs1.getString("m3_rate") %></td>
                <td><%=rs1.getString("m4_rate") %></td>
                <td><%=rs1.getString("m5_rate") %></td>
                <td><%=rs1.getString("m6_rate") %></td>
                <td><%=rs1.getString("m6_plus_rate") %></td>
                <td><%=rs1.getInt("fengmu") %></td>
                <td><%=rs1.getInt("m1_sum") %></td>
                <td><%=rs1.getInt("m2_sum") %></td>
                <td><%=rs1.getInt("m3_sum") %></td>
                <td><%=rs1.getInt("m4_sum") %></td>
                <td><%=rs1.getInt("m5_sum") %></td>
                <td><%=rs1.getInt("m6_sum") %></td>
                <td><%=rs1.getInt("m6_plus_sum") %></td>
            </tr>
<%}%>
            </tbody>
        </table>
<%  
    rs1.close();
    conn.close();  
%>
    </div>
    <div class="row" id="test">
        <div id="apply" style="width: 100%;height:400px;"></div>
    </div>
    <div class="row" id="test">
        <div id="pass" style="width: 100%;height:400px;"></div>
    </div>
    <div class="row" id="test">
        <div id="loan" style="width: 100%;height:400px;"></div>
    </div>
</div>
<script type="text/javascript">
function myChart01(){
	var myChart01 = echarts.init(document.getElementById('apply'),'roma');
	option = {
	    title: {
	        text: '农商贷最近30天的申请情况'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	    	x: 'right',
	        data:['农商贷','农商一区','农商二区'],
	        selected:{'农商一区':false,'农商二区':false},
	        top:'8%'
	    },
	    xAxis:  {
	        type: 'category',
	        boundaryGap: false,
	        data: []
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value}'
	        },
	        splitLine: {
                show: false
            }
	    },
	    series: [
	        {
	            name:'农商贷',
	            type:'line',
	            data:[],
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'}
	                ]
	            }
	        },
	        {
	            name:'农商一区',
	            type:'line',
	            data:[],
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'}]
	                
	            }
	        },
	        {
	            name:'农商二区',
	            type:'line',
	            data:[],
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'}
	                ]
	            }
	        }
	    ]
	};
	myChart01.showLoading();
	$.ajax( {
	    url:'GetJson/GJ_curr_month_apply_ns.jsp',
	    type:'post',
	    cache:false,
	    dataType:'json',
	    success:function(result) {
	        myChart01.hideLoading();
	        myChart01.setOption(
	                {
	                    xAxis:[{data:result.apply_date}],
	                    series: [
	                        {data:result.apply_num},
	                        {data:result.apply_num1},
	                        {data:result.apply_num2}
	                    ]
	                });
	    },
	    error : function() {
	        alert("异常！");
	    }
	});
	myChart01.setOption(option);}
	</script>
<script type="text/javascript">
function myChart02(){
	var myChart02 = echarts.init(document.getElementById('pass'),'roma');
	option = {
		    title: {
		        text: '农商贷最近30天的通过情况'
		    },
		    tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		    	x: 'right',
		        data:['农商贷','农商一区','农商二区'],
		        selected:{'农商一区':false,'农商二区':false},
		        top:'8%'
		    },
		    xAxis:  {
		        type: 'category',
		        boundaryGap: false,
		        data: []
		    },
		    yAxis: {
		        type: 'value',
		        axisLabel: {
		            formatter: '{value}'
		        },
		        splitLine: {
	                show: false
	            }
		    },
		    series: [
		        {
		            name:'农商贷',
		            type:'line',
		            data:[],
		            markLine: {
		                data: [
		                    {type: 'average', name: '平均值'}
		                ]
		            }
		        },
		        {
		            name:'农商一区',
		            type:'line',
		            data:[],
		            markLine: {
		                data: [
		                    {type: 'average', name: '平均值'}]
		                
		            }
		        },
		        {
		            name:'农商二区',
		            type:'line',
		            data:[],
		            markLine: {
		                data: [
		                    {type: 'average', name: '平均值'}
		                ]
		            }
		        }
		    ]
		};
	myChart02.showLoading();
	$.ajax( {
	    url:'GetJson/GJ_curr_month_pass_ns.jsp',
	    type:'post',
	    cache:false,
	    dataType:'json',
	    success:function(result) {
	        myChart02.hideLoading();
	        myChart02.setOption(
	                {
	                    xAxis:[{data:result.pass_date}],
	                    series: [
	 	                        {data:result.pass_num},
	 	                        {data:result.pass_num1},
	 	                        {data:result.pass_num2}
	                    ]
	                });
	    },
	    error : function() {
	        alert("异常！");
	    }
	});
	myChart02.setOption(option);}
	</script>
<script type="text/javascript">
function myChart03(){
	var myChart03 = echarts.init(document.getElementById('loan'),'roma');
	option = {
		    title: {
		        text: '农商贷最近30天的申请情况'
		    },
		    tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		    	x: 'right',
		        data:['农商贷','农商一区','农商二区'],
		        selected:{'农商一区':false,'农商二区':false},
		        top:'8%'
		    },
		    xAxis:  {
		        type: 'category',
		        boundaryGap: false,
		        data: []
		    },
		    yAxis: {
		        type: 'value',
		        axisLabel: {
		            formatter: '{value}'
		        },
		        splitLine: {
	                show: false
	            }
		    },
		    series: [
		        {
		            name:'农商贷',
		            type:'line',
		            data:[],
		            markLine: {
		                data: [
		                    {type: 'average', name: '平均值'}
		                ]
		            }
		        },
		        {
		            name:'农商一区',
		            type:'line',
		            data:[],
		            markLine: {
		                data: [
		                    {type: 'average', name: '平均值'}]
		                
		            }
		        },
		        {
		            name:'农商二区',
		            type:'line',
		            data:[],
		            markLine: {
		                data: [
		                    {type: 'average', name: '平均值'}
		                ]
		            }
		        }
		    ]
		};
	myChart03.showLoading();
	$.ajax( {
	    url:'GetJson/GJ_curr_month_loan_ns.jsp',
	    type:'post',
	    cache:false,
	    dataType:'json',
	    success:function(result) {
	        myChart03.hideLoading();
	        myChart03.setOption(
	                {
	                    xAxis:[{data:result.loan_date}],
	                    series: [
	     	 	                        {data:result.loan_money},
	    	 	                        {data:result.loan_money1},
	    	 	                        {data:result.loan_money2},
	                    ]
	                });
	    },
	    error : function() {
	        alert("异常！");
	    }
	});
	myChart03.setOption(option);}
	</script>
	<script type="text/javascript">
      
    function getCookie(sName)
    {
    var aCookie = document.cookie.split("; ");
    for (var i=0; i < aCookie.length; i++)
    {
    var aCrumb = aCookie[i].split("=");
    if (sName == aCrumb[0])
    return unescape(aCrumb[1]);
    }
    return null;
    }

          var user = getCookie('Username');
          var password = getCookie('Password');
          var para={"username":user,"password":password,"login":"登录"};
          $.post("login_helper.jsp",para,function(msg,status){
            console.log(msg.res);
            if(msg.res == 'success'){
            	myChart01();
            	myChart02();myChart03();
            }/*登录成功跳转到主界面*/
            else{
            	location.href="./login.jsp";
            }
          });      
    </script>
</body>
</html>