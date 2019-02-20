<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select b.branch_name as yyb ,count(a.apply_id) as apply_num from (select a.APPLY_ID from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where a.ACTIVITY_ID='utask_apply_review' group by a.APPLY_ID having to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')=(select to_char(sysdate,'YYYY/MM/DD') from dual)) a left join xndb.apply_info b on a.apply_id=b.apply_id group by b.branch_name";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray branch_name = new JSONArray();
JSONArray loan_num = new JSONArray();
JSONArray apply_num = new JSONArray();
JSONArray loan_money = new JSONArray();
JSONObject all=new JSONObject();
try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.8.40.10:1521:xnph1","jhjy","jhjy");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
				
	while (rs.next())
	{
		branch_name.add(rs.getString("yyb"));
		apply_num.add(rs.getDouble("apply_num"));
	};
}catch (Exception e) {
	e.printStackTrace();
}
all.put("branch_name", branch_name);
all.put("apply_num", apply_num);
all.write(pageContext.getOut());
%>