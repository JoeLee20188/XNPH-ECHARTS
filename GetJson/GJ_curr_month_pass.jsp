<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select a.pass_date,a.pass_num,b.pass_num1,c.pass_num2,d.pass_num3,e.pass_num4 from (select b.pass_date,count(b.apply_id) as pass_num from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null) or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null) group by a.APPLY_ID having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) b left join xndb.apply_info c on b.apply_id=c.apply_id group by b.pass_date order by pass_date) a left join (select b.pass_date,count(b.apply_id) as pass_num1 from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null) or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null) group by a.APPLY_ID having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) b left join xndb.apply_info c on b.apply_id=c.apply_id where c.BUSINESS_UNIT_SOURCE='小微贷事业部' group by b.pass_date order by pass_date) b on a.pass_date=b.pass_date left join (select b.pass_date,count(b.apply_id) as pass_num2 from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null) or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null) group by a.APPLY_ID having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) b left join xndb.apply_info c on b.apply_id=c.apply_id where c.BUSINESS_UNIT_SOURCE='三农贷事业部' group by b.pass_date order by pass_date) c on a.pass_date=c.pass_date left join (select b.pass_date,count(b.apply_id) as pass_num3 from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null) or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null) group by a.APPLY_ID having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) b left join xndb.apply_info c on b.apply_id=c.apply_id where c.BUSINESS_UNIT_SOURCE='农商贷事业部' group by b.pass_date order by pass_date) d on a.pass_date=d.pass_date left join (select b.pass_date,count(b.apply_id) as pass_num4 from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null) or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null) group by a.APPLY_ID having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) b left join xndb.apply_info c on b.apply_id=c.apply_id where c.BUSINESS_UNIT_SOURCE='互联网服务事业部' group by b.pass_date order by pass_date) e on a.pass_date=e.pass_date";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray pass_date = new JSONArray();
JSONArray pass_num = new JSONArray();
JSONArray pass_num1 = new JSONArray();
JSONArray pass_num2 = new JSONArray();
JSONArray pass_num3 = new JSONArray();
JSONArray pass_num4 = new JSONArray();
JSONObject data = new JSONObject();
try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.8.96.6:1521:xnph","jhjy","tsumugi_hs");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
				
	while (rs.next())
	{
		
		pass_date.add(rs.getString("pass_date"));
		pass_num.add(rs.getInt("pass_num"));
		pass_num1.add(rs.getInt("pass_num1"));
		pass_num2.add(rs.getInt("pass_num2"));
		pass_num3.add(rs.getInt("pass_num3"));
		pass_num4.add(rs.getInt("pass_num4"));
	};
}catch (Exception e) {
	e.printStackTrace();
}
data.put("pass_date", pass_date);
data.put("pass_num", pass_num);
data.put("pass_num1", pass_num1);
data.put("pass_num2", pass_num2);
data.put("pass_num3", pass_num3);
data.put("pass_num4", pass_num4);
data.write(pageContext.getOut());
%>