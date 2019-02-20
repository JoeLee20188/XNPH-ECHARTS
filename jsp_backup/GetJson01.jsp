<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select a.month,a.data1,a.data2,a.data3 from payment a";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray X_seri = new JSONArray();
JSONArray n2014 = new JSONArray();
JSONArray n2015 = new JSONArray();
JSONArray n2016 = new JSONArray();
JSONObject all=new JSONObject();
try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/echart_db","root","");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
				
	while (rs.next())
	{
		X_seri.add(rs.getString("month"));
		n2014.add(rs.getString("data1"));
		n2015.add(rs.getString("data2"));
		n2016.add(rs.getString("data3"));
	};
}catch (Exception e) {
	e.printStackTrace();
}
all.put("X_seri", X_seri);
all.put("n2014", n2014);
all.put("n2015", n2015);
all.put("n2016", n2016);
all.write(pageContext.getOut());
%>