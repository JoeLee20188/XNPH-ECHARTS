<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select a.MANAGER_CITY_NAME as city,round(sum(b.curr_capital_remain_amount)/10000,0) as city_money from xndb.apply_contract a left join xndb.apply_repay_plan b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.period_num='1' group by a.MANAGER_CITY_NAME";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray array = new JSONArray();
try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.8.96.6:1521:xnph","jhjy","tsumugi_hs");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
				
	while (rs.next())
	{
		JSONObject jsonObj = new JSONObject();
		String columnName ="name";
		String valueName ="value";
		String value = rs.getString("city"); 
		int zhi = rs.getInt("city_money");
		jsonObj.put(columnName, value);
		jsonObj.put(valueName, zhi);
		array.add(jsonObj);	
	};
}catch (Exception e) {
	e.printStackTrace();
}
array.write(pageContext.getOut());
%>