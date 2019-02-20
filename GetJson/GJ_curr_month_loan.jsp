<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select a.loan_date,loan_money,b.loan_money1,c.loan_money2,d.loan_money3,e.loan_money4 from (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,count(a.contract_no) as loan_num,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money from xndb.apply_contract a where a.contract_state in('PASS','STPASS','STFAILER') group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD') order by loan_date) a left join (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,count(a.contract_no) as loan_num1,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money1 from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='小微贷事业部' group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD') order by loan_date) b on a.loan_date=b.loan_date left join (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,count(a.contract_no) as loan_num2,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money2 from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='三农贷事业部' group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD') order by loan_date) c on a.loan_date=c.loan_date left join (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,count(a.contract_no) as loan_num3,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money3 from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='农商贷事业部' group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD') order by loan_date) d on a.loan_date=d.loan_date left join (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,count(a.contract_no) as loan_num4,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money4 from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='互联网服务事业部' group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD') order by loan_date) e on a.loan_date=e.loan_date";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray loan_date = new JSONArray();
JSONArray loan_money = new JSONArray();
JSONArray loan_money1 = new JSONArray();
JSONArray loan_money2 = new JSONArray();
JSONArray loan_money3 = new JSONArray();
JSONArray loan_money4 = new JSONArray();
JSONObject data = new JSONObject();
try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.8.96.6:1521:xnph","jhjy","tsumugi_hs");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
				
	while (rs.next())
	{
		
		loan_date.add(rs.getString("loan_date"));
		loan_money.add(rs.getInt("loan_money"));
		loan_money1.add(rs.getInt("loan_money1"));
		loan_money2.add(rs.getInt("loan_money2"));
		loan_money3.add(rs.getInt("loan_money3"));
		loan_money4.add(rs.getInt("loan_money4"));
	};
}catch (Exception e) {
	e.printStackTrace();
}
data.put("loan_date", loan_date);
data.put("loan_money", loan_money);
data.put("loan_money1", loan_money1);
data.put("loan_money2", loan_money2);
data.put("loan_money3", loan_money3);
data.put("loan_money4", loan_money4);
data.write(pageContext.getOut());
%>