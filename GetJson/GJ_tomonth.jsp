<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql="select x.BUSINESS_UNIT_SOURCE,x.apply_num,y.loan_num,y.loan_money from (select count(b.apply_id)as apply_num,c.BUSINESS_UNIT_SOURCE from (select a.APPLY_ID,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a where a.ACTIVITY_ID='utask_apply_review' group by a.APPLY_ID) b left join xndb.apply_info c on b.APPLY_ID=c.APPLY_ID where b.apply_date<=to_char((select sysdate from dual),'YYYY/MM/DD') and b.apply_date>=to_char((select TRUNC(SYSDATE, 'MM')from dual),'YYYY/MM/DD') group by c.BUSINESS_UNIT_SOURCE) x left join (select c.BUSINESS_UNIT_SOURCE,count(b.contract_no) as loan_num,round(sum(b.CONTRACT_AMOUNT)/10000,0) as loan_money from (select a.apply_id,a.contract_no,to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,a.CONTRACT_AMOUNT from xndb.apply_contract a where a.contract_state in('PASS','STPASS','STFAILER')) b left join xndb.apply_info c on b.APPLY_ID=c.APPLY_ID where loan_date<=to_char((select sysdate from dual),'YYYY/MM/DD') and b.loan_date>=to_char((select TRUNC(SYSDATE, 'MM')from dual),'YYYY/MM/DD') group by c.BUSINESS_UNIT_SOURCE) y on x.BUSINESS_UNIT_SOURCE=y.BUSINESS_UNIT_SOURCE union all select '小牛普惠',sum(apply_num),sum(loan_num),sum(loan_money) from (select x.BUSINESS_UNIT_SOURCE,x.apply_num,y.loan_num,y.loan_money from (select count(b.apply_id)as apply_num,c.BUSINESS_UNIT_SOURCE from (select a.APPLY_ID,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a where a.ACTIVITY_ID='utask_apply_review' group by a.APPLY_ID) b left join xndb.apply_info c on b.APPLY_ID=c.APPLY_ID where b.apply_date<=to_char((select sysdate from dual),'YYYY/MM/DD') and b.apply_date>=to_char((select TRUNC(SYSDATE, 'MM')from dual),'YYYY/MM/DD') group by c.BUSINESS_UNIT_SOURCE) x left join (select c.BUSINESS_UNIT_SOURCE,count(b.contract_no) as loan_num,round(sum(b.CONTRACT_AMOUNT)/10000,0) as loan_money from (select a.apply_id,a.contract_no,to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,a.CONTRACT_AMOUNT from xndb.apply_contract a where a.contract_state in('PASS','STPASS','STFAILER')) b left join xndb.apply_info c on b.APPLY_ID=c.APPLY_ID where loan_date<=to_char((select sysdate from dual),'YYYY/MM/DD') and b.loan_date>=to_char((select TRUNC(SYSDATE, 'MM')from dual),'YYYY/MM/DD') group by c.BUSINESS_UNIT_SOURCE) y on x.BUSINESS_UNIT_SOURCE=y.BUSINESS_UNIT_SOURCE) order by apply_num";
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONObject jsonObj = new JSONObject();
JSONArray syb = new JSONArray();
JSONArray apply = new JSONArray();

JSONArray loan_num = new JSONArray();
JSONArray loan_money = new JSONArray();

JSONArray ph = new JSONArray();
try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.8.96.6:1521:xnph","jhjy","tsumugi_hs");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
	while (rs.next())
	{
		syb.add(rs.getString("BUSINESS_UNIT_SOURCE"));
		apply.add(rs.getInt("apply_num"));
		loan_num.add(rs.getInt("loan_num"));
		loan_money.add(rs.getInt("loan_money"));
	};
}catch (Exception e) {
	e.printStackTrace();
}
jsonObj.put("syb", syb);jsonObj.put("apply", apply);jsonObj.put("loan_num", loan_num);jsonObj.put("loan_money", loan_money);
jsonObj.write(pageContext.getOut());
%>