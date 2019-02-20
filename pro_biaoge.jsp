<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%request.setCharacterEncoding("UTF-8");%> 
<%response.setCharacterEncoding("UTF-8");%> 
<!DOCTYPE html>

<html>

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
    <td width="160" id="title">产品名称</td>  
    <td width="160" id="title">放款件数</td>  
    <td width="160" id="title">放款金额</td>  
    <td width="160" id="title">合同金额</td>  
  </tr>  
      
<%  
    //把表格第二行的显示放到while循环中，就可以根据查询结果画出表格了。参数则放在<td>内的相应位置。  
    ResultSet rs = st.executeQuery("select product_name,count(contract_no) as num,round(sum(loan_amount)/10000,0) as loan_amount,round(sum(con_amount)/10000,0) as con_amount from (select a.app_product_name as product_name,a.cust_name as real_customer,a.id_num as cert_id,b.curr_app_amount as loan_amount,b.period_value as periods_num,to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,a.contract_no,c.curr_capital_remain_amount as con_amount,c.repay_amount as mon_pay,c.repay_capital_amount as mon_pri,c.interest_amount as mon_int,c.repay_amount-c.repay_capital_amount-c.interest_amount as mon_man from xndb.apply_contract a,xndb.apply_status b,xndb.apply_repay_plan c where a.apply_id=b.apply_id and a.apply_id=c.apply_id and c.period_num='1' and a.contract_state in('PASS','STPASS','STFAILER') and a.app_product_name not like '首付贷%') a group by product_name order by num");  
    while(rs.next()){%>  
      
  <tr>  
    <td width="160" ><%=rs.getString("PRODUCT_NAME") %></td>  
    <td width="160" ><%=rs.getInt("num") %></td>  
    <td width="160"><%=rs.getString("loan_amount") %></td>  
    <td width="160"><%=rs.getString("con_amount") %></td> 
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
