<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select a.pass_date,a.pass_num,b.pass_num1,c.pass_num2,d.pass_num3,e.pass_num4,f.pass_num5,g.pass_num6,h.pass_num7,i.pass_num8,j.pass_num9,k.pass_num10,l.pass_num11 from (select count(a.apply_id) as pass_num,a.pass_date from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null) or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null) group by a.APPLY_ID having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.pass_date) a left join (select count(a.apply_id) as pass_num1,a.pass_date from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微一区') or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微一区') group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.pass_date) b on a.pass_date=b.pass_date left join (select count(a.apply_id) as pass_num2,a.pass_date from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微二区') or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微二区') group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.pass_date) c on a.pass_date=c.pass_date left join (select count(a.apply_id) as pass_num3,a.pass_date from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微三区') or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微三区') group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.pass_date) d on a.pass_date=d.pass_date left join (select count(a.apply_id) as pass_num4,a.pass_date from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微四区') or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微四区') group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.pass_date) e on a.pass_date=e.pass_date left join (select count(a.apply_id) as pass_num5,a.pass_date from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微五区') or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微五区') group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.pass_date) f on a.pass_date=f.pass_date left join (select count(a.apply_id) as pass_num6,a.pass_date from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微六区') or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微六区') group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.pass_date) g on a.pass_date=g.pass_date left join (select count(a.apply_id) as pass_num7,a.pass_date from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微七区') or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微七区') group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.pass_date) h on a.pass_date=h.pass_date left join (select count(a.apply_id) as pass_num8,a.pass_date from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微八区') or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微八区') group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.pass_date) i on a.pass_date=i.pass_date left join (select count(a.apply_id) as pass_num9,a.pass_date from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微九区') or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微九区') group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.pass_date) j on a.pass_date=j.pass_date left join (select count(a.apply_id) as pass_num10,a.pass_date from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微十区') or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微十区') group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.pass_date) k on a.pass_date=k.pass_date left join (select count(a.apply_id) as pass_num11,a.pass_date from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微十一区') or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is  not null and b.region_area_='小微十一区') group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(max(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.pass_date) l on a.pass_date=l.pass_date order by pass_date";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray pass_date = new JSONArray();
JSONArray pass_num = new JSONArray();
JSONArray pass_num1 = new JSONArray();
JSONArray pass_num2 = new JSONArray();
JSONArray pass_num3 = new JSONArray();
JSONArray pass_num4 = new JSONArray();
JSONArray pass_num5 = new JSONArray();
JSONArray pass_num6 = new JSONArray();
JSONArray pass_num7 = new JSONArray();
JSONArray pass_num8 = new JSONArray();
JSONArray pass_num9 = new JSONArray();
JSONArray pass_num10 = new JSONArray();
JSONArray pass_num11 = new JSONArray();
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
		pass_num5.add(rs.getInt("pass_num5"));
		pass_num6.add(rs.getInt("pass_num6"));
		pass_num7.add(rs.getInt("pass_num7"));
		pass_num8.add(rs.getInt("pass_num8"));
		pass_num9.add(rs.getInt("pass_num9"));
		pass_num10.add(rs.getInt("pass_num10"));
		pass_num11.add(rs.getInt("pass_num11"));
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
data.put("pass_num5", pass_num5);
data.put("pass_num6", pass_num6);
data.put("pass_num7", pass_num7);
data.put("pass_num8", pass_num8);
data.put("pass_num9", pass_num9);
data.put("pass_num10", pass_num10);
data.put("pass_num11", pass_num11);
data.write(pageContext.getOut());
%>