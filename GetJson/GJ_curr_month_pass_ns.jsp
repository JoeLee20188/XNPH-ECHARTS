<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select a.pass_date,a.pass_num,b.pass_num1,c.pass_num2 from (select count(a.apply_id) as pass_num,a.pass_date from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='农商贷事业部' and b.region_area_ is  not null) or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='农商贷事业部' and b.region_area_ is  not null) group by a.APPLY_ID having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.pass_date) a left join (select count(a.apply_id) as pass_num1,a.pass_date from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='农商贷事业部' and b.region_area_ is  not null and b.region_area_='农商一区') or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='农商贷事业部' and b.region_area_ is  not null and b.region_area_='农商一区') group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.pass_date) b on a.pass_date=b.pass_date left join (select count(a.apply_id) as pass_num2,a.pass_date from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='农商贷事业部' and b.region_area_ is  not null and b.region_area_='农商二区') or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='农商贷事业部' and b.region_area_ is  not null and b.region_area_='农商二区') group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.pass_date) c on a.pass_date=c.pass_date order by pass_date";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray pass_date = new JSONArray();
JSONArray pass_num = new JSONArray();
JSONArray pass_num1 = new JSONArray();
JSONArray pass_num2 = new JSONArray();
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
	};
}catch (Exception e) {
	e.printStackTrace();
}
data.put("pass_date", pass_date);
data.put("pass_num", pass_num);
data.put("pass_num1", pass_num1);
data.put("pass_num2", pass_num2);
data.write(pageContext.getOut());
%>