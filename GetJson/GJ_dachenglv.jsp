<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select round(sum(b.curr_capital_remain_amount)/166000000,0) as loan_total_money from xndb.apply_contract a left join xndb.apply_repay_plan b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and to_char(a.real_pay_date,'YYYY/MM/DD')>='2016/01/01' and b.period_num='1'";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONObject jsonObj = new JSONObject();
try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.8.96.6:1521:xnph","jhjy","tsumugi_hs");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
	
	while (rs.next())
	{
		
		
		String columnName ="name";
		String valueName ="value";
		String Name ="普惠全年目标达成率";
		int zhi = rs.getInt("loan_total_money");
		jsonObj.put(valueName, zhi);
		jsonObj.put(columnName,Name);
	};
}catch (Exception e) {
	e.printStackTrace();
}
jsonObj.write(pageContext.getOut());
%>