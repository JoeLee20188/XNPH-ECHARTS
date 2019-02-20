<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select a.apply_date,a.apply_num,b.apply_num1,c.apply_num2,d.apply_num3,e.apply_num4,f.apply_num5,g.apply_num6,h.apply_num7,i.apply_num8,j.apply_num9,k.apply_num10,l.apply_num11 from (select count(a.apply_id) as apply_num,a.apply_date from (select a.APPLY_ID,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where b.BUSINESS_UNIT_SOURCE='小微贷事业部' and a.ACTIVITY_ID='utask_apply_review' and b.region_area_^='小微十二区' and b.region_area_ is  not null group by a.APPLY_ID having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.apply_date) a left join (select count(a.apply_id) as apply_num1,a.apply_date from (select a.APPLY_ID,b.region_area_,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where b.BUSINESS_UNIT_SOURCE='小微贷事业部' and a.ACTIVITY_ID='utask_apply_review' and b.region_area_^='小微十二区' and b.region_area_ is  not null group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) a where a.region_area_='小微一区' group by a.apply_date,a.region_area_) b on a.apply_date=b.apply_date left join (select count(a.apply_id) as apply_num2,a.apply_date from (select a.APPLY_ID,b.region_area_,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where b.BUSINESS_UNIT_SOURCE='小微贷事业部' and a.ACTIVITY_ID='utask_apply_review' and b.region_area_^='小微十二区' and b.region_area_ is  not null group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) a where a.region_area_='小微二区' group by a.apply_date,a.region_area_) c on a.apply_date=c.apply_date left join (select count(a.apply_id) as apply_num3,a.apply_date from (select a.APPLY_ID,b.region_area_,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where b.BUSINESS_UNIT_SOURCE='小微贷事业部' and a.ACTIVITY_ID='utask_apply_review' and b.region_area_^='小微十二区' and b.region_area_ is  not null group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) a where a.region_area_='小微三区' group by a.apply_date,a.region_area_) d on a.apply_date=d.apply_date left join (select count(a.apply_id) as apply_num4,a.apply_date from (select a.APPLY_ID,b.region_area_,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where b.BUSINESS_UNIT_SOURCE='小微贷事业部' and a.ACTIVITY_ID='utask_apply_review' and b.region_area_^='小微十二区' and b.region_area_ is  not null group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) a where a.region_area_='小微四区' group by a.apply_date,a.region_area_) e on a.apply_date=e.apply_date left join (select count(a.apply_id) as apply_num5,a.apply_date from (select a.APPLY_ID,b.region_area_,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where b.BUSINESS_UNIT_SOURCE='小微贷事业部' and a.ACTIVITY_ID='utask_apply_review' and b.region_area_^='小微十二区' and b.region_area_ is  not null group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) a where a.region_area_='小微五区' group by a.apply_date,a.region_area_) f on a.apply_date=f.apply_date left join (select count(a.apply_id) as apply_num6,a.apply_date from (select a.APPLY_ID,b.region_area_,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where b.BUSINESS_UNIT_SOURCE='小微贷事业部' and a.ACTIVITY_ID='utask_apply_review' and b.region_area_^='小微十二区' and b.region_area_ is  not null group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) a where a.region_area_='小微六区' group by a.apply_date,a.region_area_) g on a.apply_date=g.apply_date left join (select count(a.apply_id) as apply_num7,a.apply_date from (select a.APPLY_ID,b.region_area_,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where b.BUSINESS_UNIT_SOURCE='小微贷事业部' and a.ACTIVITY_ID='utask_apply_review' and b.region_area_^='小微十二区' and b.region_area_ is  not null group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) a where a.region_area_='小微七区' group by a.apply_date,a.region_area_) h on a.apply_date=h.apply_date left join (select count(a.apply_id) as apply_num8,a.apply_date from (select a.APPLY_ID,b.region_area_,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where b.BUSINESS_UNIT_SOURCE='小微贷事业部' and a.ACTIVITY_ID='utask_apply_review' and b.region_area_^='小微十二区' and b.region_area_ is  not null group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) a where a.region_area_='小微八区' group by a.apply_date,a.region_area_) i on a.apply_date=i.apply_date left join (select count(a.apply_id) as apply_num9,a.apply_date from (select a.APPLY_ID,b.region_area_,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where b.BUSINESS_UNIT_SOURCE='小微贷事业部' and a.ACTIVITY_ID='utask_apply_review' and b.region_area_^='小微十二区' and b.region_area_ is  not null group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) a where a.region_area_='小微九区' group by a.apply_date,a.region_area_) j on a.apply_date=j.apply_date left join (select count(a.apply_id) as apply_num10,a.apply_date from (select a.APPLY_ID,b.region_area_,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where b.BUSINESS_UNIT_SOURCE='小微贷事业部' and a.ACTIVITY_ID='utask_apply_review' and b.region_area_^='小微十二区' and b.region_area_ is  not null group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) a where a.region_area_='小微十区' group by a.apply_date,a.region_area_) k on a.apply_date=k.apply_date left join (select count(a.apply_id) as apply_num11,a.apply_date from (select a.APPLY_ID,b.region_area_,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where b.BUSINESS_UNIT_SOURCE='小微贷事业部' and a.ACTIVITY_ID='utask_apply_review' and b.region_area_^='小微十二区' and b.region_area_ is  not null group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) a where a.region_area_='小微十一区' group by a.apply_date,a.region_area_) l on a.apply_date=l.apply_date order by apply_date";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray apply_date = new JSONArray();
JSONArray apply_num = new JSONArray();
JSONArray apply_num1 = new JSONArray();
JSONArray apply_num2 = new JSONArray();
JSONArray apply_num3 = new JSONArray();
JSONArray apply_num4 = new JSONArray();
JSONArray apply_num5 = new JSONArray();
JSONArray apply_num6 = new JSONArray();
JSONArray apply_num7 = new JSONArray();
JSONArray apply_num8 = new JSONArray();
JSONArray apply_num9 = new JSONArray();
JSONArray apply_num10 = new JSONArray();
JSONArray apply_num11 = new JSONArray();
JSONObject data = new JSONObject();
try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.8.96.6:1521:xnph","jhjy","tsumugi_hs");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
				
	while (rs.next())
	{
		
		apply_date.add(rs.getString("apply_date"));
		apply_num.add(rs.getInt("apply_num"));
		apply_num1.add(rs.getInt("apply_num1"));
		apply_num2.add(rs.getInt("apply_num2"));
		apply_num3.add(rs.getInt("apply_num3"));
		apply_num4.add(rs.getInt("apply_num4"));
		apply_num5.add(rs.getInt("apply_num5"));
		apply_num6.add(rs.getInt("apply_num6"));
		apply_num7.add(rs.getInt("apply_num7"));
		apply_num8.add(rs.getInt("apply_num8"));
		apply_num9.add(rs.getInt("apply_num9"));
		apply_num10.add(rs.getInt("apply_num10"));
		apply_num11.add(rs.getInt("apply_num11"));
	};
}catch (Exception e) {
	e.printStackTrace();
}
data.put("apply_date", apply_date);
data.put("apply_num", apply_num);
data.put("apply_num1", apply_num1);
data.put("apply_num2", apply_num2);
data.put("apply_num3", apply_num3);
data.put("apply_num4", apply_num4);
data.put("apply_num5", apply_num5);
data.put("apply_num6", apply_num6);
data.put("apply_num7", apply_num7);
data.put("apply_num8", apply_num8);
data.put("apply_num9", apply_num9);
data.put("apply_num10", apply_num10);
data.put("apply_num11", apply_num11);
data.write(pageContext.getOut());
%>