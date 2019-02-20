<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "SELECT a.prov1,sum1,prov2,sum2,prov3,sum3,prov4,sum4,prov5,sum5 FROM xiaoliang a";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray array1 = new JSONArray();
JSONArray array2 = new JSONArray();
JSONArray array3 = new JSONArray();
JSONArray array4 = new JSONArray();
JSONArray array5 = new JSONArray();
try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/echart_db","root","");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
				
	while (rs.next())
	{
		JSONObject jsonObj1 = new JSONObject();
		String columnName ="name";
		String valueName ="value";
		String value1 = rs.getString("prov1"); 
		Double zhi1 = rs.getDouble("sum1"); 
		jsonObj1.put(columnName, value1);
		jsonObj1.put(valueName, zhi1);
		array1.add(jsonObj1);
		
		JSONObject jsonObj2 = new JSONObject();
		String value2 = rs.getString("prov2"); 
		Double zhi2 = rs.getDouble("sum2"); 
		jsonObj2.put(columnName, value2);
		jsonObj2.put(valueName, zhi2);
		array2.add(jsonObj2);
		
		JSONObject jsonObj3 = new JSONObject();
		String value3 = rs.getString("prov3"); 
		Double zhi3 = rs.getDouble("sum3"); 
		jsonObj3.put(columnName, value3);
		jsonObj3.put(valueName, zhi3);
		array3.add(jsonObj3);
		
		JSONObject jsonObj4 = new JSONObject();
		String value4 = rs.getString("prov4"); 
		Double zhi4 = rs.getDouble("sum4"); 
		jsonObj4.put(columnName, value4);
		jsonObj4.put(valueName, zhi4);
		array4.add(jsonObj4);
		
		JSONObject jsonObj5 = new JSONObject();
		String value5 = rs.getString("prov5"); 
		Double zhi5 = rs.getDouble("sum5"); 
		jsonObj5.put(columnName, value5);
		jsonObj5.put(valueName, zhi5);
		array5.add(jsonObj5);
	};
}catch (Exception e) {
	e.printStackTrace();
}
JSONObject oo=new JSONObject();
oo.put("小微贷", array1);
oo.put("三农贷", array2);
oo.put("网商贷", array3);
oo.put("农商贷", array4);
oo.put("互联网", array5);
oo.write(pageContext.getOut());
%>