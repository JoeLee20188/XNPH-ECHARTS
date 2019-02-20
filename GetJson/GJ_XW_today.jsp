<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "(select n.branch_name,m.apply_num,p.loan_num,loan_money from (select distinct branch_name from xndb.apply_info where BUSINESS_UNIT_SOURCE='小微贷事业部' and branch_name is not null) n left join (select count(b.apply_id)as apply_num,c.branch_name from (select a.APPLY_ID,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a where a.ACTIVITY_ID='utask_apply_review' group by a.APPLY_ID having to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')=to_char((select sysdate from dual),'YYYY/MM/DD')) b left join xndb.apply_info c on b.APPLY_ID=c.APPLY_ID where c.BUSINESS_UNIT_SOURCE='小微贷事业部' group by c.branch_name) m on n.branch_name=m.branch_name left join (select c.branch_name,count(b.contract_no) as loan_num,round(sum(b.CONTRACT_AMOUNT)/10000,0) as loan_money from (select a.apply_id,a.contract_no,to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,a.CONTRACT_AMOUNT from xndb.apply_contract a where a.contract_state in('PASS','STPASS','STFAILER') and to_char(a.real_pay_date,'YYYY/MM/DD')=to_char((select sysdate from dual),'YYYY/MM/DD')) b left join xndb.apply_info c on b.APPLY_ID=c.APPLY_ID where c.BUSINESS_UNIT_SOURCE='小微贷事业部' group by c.branch_name) p on n.branch_name=p.branch_name) union all select '小微贷事业部',sum(apply_num),sum(loan_num),sum(loan_money) from (select n.branch_name,m.apply_num,p.loan_num,loan_money from (select distinct branch_name from xndb.apply_info where BUSINESS_UNIT_SOURCE='小微贷事业部' and branch_name is not null) n left join (select count(b.apply_id)as apply_num,c.branch_name from (select a.APPLY_ID,to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD') as apply_date from xndb.app_result a where a.ACTIVITY_ID='utask_apply_review' group by a.APPLY_ID having to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')=to_char((select sysdate from dual),'YYYY/MM/DD')) b left join xndb.apply_info c on b.APPLY_ID=c.APPLY_ID where c.BUSINESS_UNIT_SOURCE='小微贷事业部' group by c.branch_name) m on n.branch_name=m.branch_name left join (select c.branch_name,count(b.contract_no) as loan_num,round(sum(b.CONTRACT_AMOUNT)/10000,0) as loan_money from (select a.apply_id,a.contract_no,to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,a.CONTRACT_AMOUNT from xndb.apply_contract a where a.contract_state in('PASS','STPASS','STFAILER') and to_char(a.real_pay_date,'YYYY/MM/DD')=to_char((select sysdate from dual),'YYYY/MM/DD')) b left join xndb.apply_info c on b.APPLY_ID=c.APPLY_ID where c.BUSINESS_UNIT_SOURCE='小微贷事业部' group by c.branch_name) p on n.branch_name=p.branch_name)";/*存储sql语句*/
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
		branch_name.add(rs.getString("branch_name"));
		apply_num.add(rs.getDouble("apply_num"));
		loan_num.add(rs.getDouble("loan_num"));
		loan_money.add(rs.getDouble("loan_money"));
	};
}catch (Exception e) {
	e.printStackTrace();
}
all.put("branch_name", branch_name);
all.put("apply_num", apply_num);
all.put("loan_num", loan_num);
all.put("loan_money", loan_money);
all.write(pageContext.getOut());
%>