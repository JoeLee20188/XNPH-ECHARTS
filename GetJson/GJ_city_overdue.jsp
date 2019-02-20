<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select a.city,a.overdue_rate from city a";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray array = new JSONArray();
try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/echart_db","root","");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
				
	while (rs.next())
	{
		JSONObject jsonObj = new JSONObject();
		String columnName ="name";
		String valueName ="value";
		String value = rs.getString("city"); 
		Double zhi = rs.getDouble("overdue_rate");
		jsonObj.put(columnName, value);
		jsonObj.put(valueName, zhi);
		array.add(jsonObj);	
	};
}catch (Exception e) {
	e.printStackTrace();
}
array.write(pageContext.getOut());
%>