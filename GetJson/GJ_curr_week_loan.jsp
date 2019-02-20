<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select * from (select b.loan_date,count(b.contract_no) as loan_num,round(sum(b.CONTRACT_AMOUNT)/10000,0) as loan_money from (select a.contract_no,to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,a.CONTRACT_AMOUNT from xndb.apply_contract a where a.contract_state in('PASS','STPASS','STFAILER') and a.real_pay_date is not null) b group by b.loan_date order by loan_date desc) where rownum<=7 order by loan_date";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray loan_date = new JSONArray();
JSONArray loan_num = new JSONArray();
JSONArray loan_money = new JSONArray();
JSONObject data = new JSONObject();
try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.8.96.6:1521:xnph","jhjy","tsumugi_hs");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
				
	while (rs.next())
	{
		
		loan_date.add(rs.getString("loan_date"));
		loan_num.add(rs.getInt("loan_num"));
		loan_money.add(rs.getInt("loan_money"));
	};
}catch (Exception e) {
	e.printStackTrace();
}
data.put("loan_date", loan_date);
data.put("loan_num", loan_num);
data.put("loan_money", loan_money);
data.write(pageContext.getOut());
%>