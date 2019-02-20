<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select distinct a.REGION_CITYY_ as city,count(a.APPLY_ID) as num from XNDB.APPLY_INFO a where a.STATUS='SUBMIT' and REGION_CITYY_^=' ' GROUP BY a.REGION_CITYY_";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray array = new JSONArray();
try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.15.18.11:1521:lsdb1","jhjy","jhjy");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
				
	while (rs.next())
	{
		JSONObject jsonObj = new JSONObject();
		String columnName ="name";
		String valueName ="value";
		String value = rs.getString("city"); 
		int zhi = rs.getInt("num");
		jsonObj.put(columnName, value);
		jsonObj.put(valueName, zhi);
		array.add(jsonObj);	
	};
}catch (Exception e) {
	e.printStackTrace();
}
array.write(pageContext.getOut());
%>