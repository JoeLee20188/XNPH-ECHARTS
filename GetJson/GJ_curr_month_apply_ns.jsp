<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select a.apply_date,a.apply_num,b.apply_num1,c.apply_num2 from (select count(a.apply_id) as apply_num,a.apply_date from (select a.APPLY_ID,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where b.BUSINESS_UNIT_SOURCE='农商贷事业部' and a.ACTIVITY_ID='utask_apply_review' and b.region_area_ is  not null group by a.APPLY_ID having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) a group by a.apply_date) a left join (select count(a.apply_id) as apply_num1,a.apply_date from (select a.APPLY_ID,b.region_area_,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where b.BUSINESS_UNIT_SOURCE='农商贷事业部' and a.ACTIVITY_ID='utask_apply_review' and b.region_area_ is  not null group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) a where a.region_area_='农商一区' group by a.apply_date,a.region_area_) b on a.apply_date=b.apply_date left join (select count(a.apply_id) as apply_num2,a.apply_date from (select a.APPLY_ID,b.region_area_,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a left join xndb.apply_info b on a.apply_id=b.apply_id where b.BUSINESS_UNIT_SOURCE='农商贷事业部' and a.ACTIVITY_ID='utask_apply_review' and b.region_area_ is  not null group by a.APPLY_ID,b.region_area_ having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')) a where a.region_area_='农商二区' group by a.apply_date,a.region_area_) c on a.apply_date=c.apply_date order by apply_date";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray apply_date = new JSONArray();
JSONArray apply_num = new JSONArray();
JSONArray apply_num1 = new JSONArray();
JSONArray apply_num2 = new JSONArray();
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

	};
}catch (Exception e) {
	e.printStackTrace();
}
data.put("apply_date", apply_date);
data.put("apply_num", apply_num);
data.put("apply_num1", apply_num1);
data.put("apply_num2", apply_num2);
data.write(pageContext.getOut());
%>