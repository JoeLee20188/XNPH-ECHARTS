<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select b.business_unit_source as syb,count(a.apply_id) as apply_num from (select a.APPLY_ID from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where a.ACTIVITY_ID='utask_apply_review' group by a.APPLY_ID having to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')=(select to_char(sysdate,'YYYY/MM/DD') from dual)) a left join xndb.apply_info b on a.apply_id=b.apply_id group by b.business_unit_source";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONObject all = new JSONObject();
JSONArray series = new JSONArray();
JSONArray kvdata = new JSONArray();
try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.8.40.10:1521:xnph1","jhjy","jhjy");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
				
	while (rs.next())
	{
		JSONObject jsonObj = new JSONObject();
		String columnName ="name";
		String valueName ="value";
		String value = rs.getString("syb"); 
		series.add(value);
		int zhi = rs.getInt("apply_num");
		jsonObj.put(valueName, zhi);
		jsonObj.put(columnName, value);
		kvdata.add(jsonObj);
	};
}catch (Exception e) {
	e.printStackTrace();
}
all.put("series", series);
all.put("kvdata", kvdata);
all.write(pageContext.getOut());
%>