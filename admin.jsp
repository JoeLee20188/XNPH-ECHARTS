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
    <title>管理员</title>  
	<script src="./js/jquery-1.7.2.min.js"></script>
  </head>  
  <body>      
 	<a href="./GetExcel/GE_fast_table.jsp">下载小牛普惠快报数据</a>
 	<br>
 	<br>
 	<a href="./GetExcel/GE_fast_table_xw.jsp">下载小微贷事业部快报数据</a>
 	<br>
 	<br>
 	<a href="./GetExcel/GE_fast_table_sn.jsp">下载三农贷事业部快报数据</a>
 	<br>
 	<br>
 	<a href="./GetExcel/GE_fast_table_ns.jsp">下载农商贷事业部快报数据</a>
 	<br>
 	<br>
 	<a href="./GetExcel/GE_fast_table_hlw.jsp">下载互联网服务事业部快报数据</a>
  </body>  
</html>