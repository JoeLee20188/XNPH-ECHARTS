<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "SELECT a.day,day_sum,day1,day_sum1 FROM liushui a";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray X_seri = new JSONArray();
JSONArray money = new JSONArray();
JSONArray X_seri1 = new JSONArray();
JSONArray money1 = new JSONArray();
JSONObject all=new JSONObject();
try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/echart_db","root","");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
				
	while (rs.next())
	{
		X_seri.add(rs.getString("day"));
		money.add(rs.getDouble("day_sum"));
		X_seri1.add(rs.getString("day1"));
		money1.add(rs.getDouble("day_sum1"));
	};
}catch (Exception e) {
	e.printStackTrace();
}
all.put("X_seri", X_seri);
all.put("money", money);
all.put("X_seri1", X_seri1);
all.put("money1", money1);
all.write(pageContext.getOut());
%>