<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select a.apply_date,a.apply_num,b.apply_num1,c.apply_num2,d.apply_num3,e.apply_num4 from (select b.apply_date,count(b.apply_id) as apply_num from (select a.APPLY_ID,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a where a.ACTIVITY_ID='utask_apply_review' group by a.APPLY_ID having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) b left join xndb.apply_info c on b.apply_id=c.apply_id group by b.apply_date order by apply_date) a left join (select b.apply_date,count(b.apply_id) as apply_num1 from (select a.APPLY_ID,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a where a.ACTIVITY_ID='utask_apply_review' group by a.APPLY_ID having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) b left join xndb.apply_info c on b.apply_id=c.apply_id where c.BUSINESS_UNIT_SOURCE='小微贷事业部' group by b.apply_date order by apply_date) b on a.apply_date=b.apply_date left join (select b.apply_date,count(b.apply_id) as apply_num2 from (select a.APPLY_ID,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a where a.ACTIVITY_ID='utask_apply_review' group by a.APPLY_ID having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) b left join xndb.apply_info c on b.apply_id=c.apply_id where c.BUSINESS_UNIT_SOURCE='三农贷事业部' group by b.apply_date order by apply_date) c on a.apply_date=c.apply_date left join (select b.apply_date,count(b.apply_id) as apply_num3 from (select a.APPLY_ID,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a where a.ACTIVITY_ID='utask_apply_review' group by a.APPLY_ID having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) b left join xndb.apply_info c on b.apply_id=c.apply_id where c.BUSINESS_UNIT_SOURCE='农商贷事业部' group by b.apply_date order by apply_date) d on a.apply_date=d.apply_date left join (select b.apply_date,count(b.apply_id) as apply_num4 from (select a.APPLY_ID,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a where a.ACTIVITY_ID='utask_apply_review' group by a.APPLY_ID having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) b left join xndb.apply_info c on b.apply_id=c.apply_id where c.BUSINESS_UNIT_SOURCE='互联网服务事业部' group by b.apply_date order by apply_date) e on a.apply_date=e.apply_date";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray apply_date = new JSONArray();
JSONArray apply_num = new JSONArray();
JSONArray apply_num1 = new JSONArray();
JSONArray apply_num2 = new JSONArray();
JSONArray apply_num3 = new JSONArray();
JSONArray apply_num4 = new JSONArray();
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
data.write(pageContext.getOut());
%>