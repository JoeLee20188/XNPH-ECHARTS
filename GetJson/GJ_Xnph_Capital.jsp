<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "SELECT a.term,day_pay,day_pri,day_int,day_man FROM zhaiquan a";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray X_seri = new JSONArray();
JSONArray pay = new JSONArray();
JSONArray pri = new JSONArray();
JSONArray intt = new JSONArray();
JSONArray man = new JSONArray();
JSONObject all=new JSONObject();
try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/echart_db","root","");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
				
	while (rs.next())
	{
		X_seri.add(rs.getString("term"));
		pay.add(rs.getDouble("day_pay"));
		pri.add(rs.getDouble("day_pri"));
		intt.add(rs.getDouble("day_int"));
		man.add(rs.getDouble("day_man"));
	};
}catch (Exception e) {
	e.printStackTrace();
}
all.put("X_seri", X_seri);
all.put("day_pay", pay);
all.put("day_pri", pri);
all.put("day_int", intt);
all.put("day_man", man);
all.write(pageContext.getOut());
%>