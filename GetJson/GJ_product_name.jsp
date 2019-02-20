<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select a.APP_PRODUCT_NAME as product,round(sum(b.curr_capital_remain_amount)/10000,0) as product_money from xndb.apply_contract a left join xndb.apply_repay_plan b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.period_num='1' and a.APP_PRODUCT_NAME^='首付贷（先息后本）吉莱宝' group by a.APP_PRODUCT_NAME";
String sql1 = "select d.product_sec,sum(d.product_money) as product_sec_money from (select c.product,decode(c.product,'APP工薪贷','APP工薪贷','按揭贷','按揭贷','保单贷','保单贷','小牛车主贷','车主贷','车主贷','车主贷','精英贷','精英贷','小牛精英贷','精英贷','专业贷','精英贷','农经贷','农经贷','小牛工薪贷（快递）','快递贷','助学贷','助学贷','工薪贷','工薪贷','消费贷','工薪贷','小牛工薪贷','工薪贷','工薪贷（业主）','工薪贷（业主）','惠农贷','惠农贷','惠商贷','生意贷','生意贷','生意贷','网商贷','生意贷','小牛生意贷','生意贷','生意贷（业主）','生意贷（业主）','小牛业主贷','业主贷','小牛业主贷（简易）','业主贷','小牛业主贷（优质）','业主贷','业主贷','业主贷','员工贷','员工贷','农商贷','农商贷') as product_sec,decode(c.product,'APP工薪贷','APP','按揭贷','专案','保单贷','专案','小牛车主贷','专案','车主贷','专案','精英贷','专案','小牛精英贷','专案','专业贷','专案','农经贷','专案','小牛工薪贷（快递）','专案','助学贷','专案','工薪贷','常规','消费贷','常规','小牛工薪贷','常规','工薪贷（业主）','常规','惠农贷','常规','惠商贷','常规','生意贷','常规','网商贷','常规','小牛生意贷','常规','生意贷（业主）','常规','小牛业主贷','常规','小牛业主贷（简易）','常规','小牛业主贷（优质）','常规','业主贷','常规','员工贷','常规','农商贷','农商贷') as product_thi,c.product_money from (select a.APP_PRODUCT_NAME as product,round(sum(b.curr_capital_remain_amount)/10000,0) as product_money from xndb.apply_contract a left join xndb.apply_repay_plan b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.period_num='1' and a.APP_PRODUCT_NAME^='首付贷（先息后本）吉莱宝' group by a.APP_PRODUCT_NAME) c) d group by d.product_sec";
String sql2 = "select d.product_thi,sum(d.product_money) as product_thi_money from (select c.product,decode(c.product,'APP工薪贷','APP工薪贷','按揭贷','按揭贷','保单贷','保单贷','小牛车主贷','车主贷','车主贷','车主贷','精英贷','精英贷','小牛精英贷','精英贷','专业贷','精英贷','农经贷','农经贷','小牛工薪贷（快递）','快递贷','助学贷','助学贷','工薪贷','工薪贷','消费贷','工薪贷','小牛工薪贷','工薪贷','工薪贷（业主）','工薪贷（业主）','惠农贷','惠农贷','惠商贷','生意贷','生意贷','生意贷','网商贷','生意贷','小牛生意贷','生意贷','生意贷（业主）','生意贷（业主）','小牛业主贷','业主贷','小牛业主贷（简易）','业主贷','小牛业主贷（优质）','业主贷','业主贷','业主贷','员工贷','员工贷','农商贷','农商贷') as product_sec,decode(c.product,'APP工薪贷','APP','按揭贷','专案','保单贷','专案','小牛车主贷','专案','车主贷','专案','精英贷','专案','小牛精英贷','专案','专业贷','专案','农经贷','专案','小牛工薪贷（快递）','专案','助学贷','专案','工薪贷','常规','消费贷','常规','小牛工薪贷','常规','工薪贷（业主）','常规','惠农贷','常规','惠商贷','常规','生意贷','常规','网商贷','常规','小牛生意贷','常规','生意贷（业主）','常规','小牛业主贷','常规','小牛业主贷（简易）','常规','小牛业主贷（优质）','常规','业主贷','常规','员工贷','常规','农商贷','农商贷') as product_thi,c.product_money from (select a.APP_PRODUCT_NAME as product,round(sum(b.curr_capital_remain_amount)/10000,0) as product_money from xndb.apply_contract a left join xndb.apply_repay_plan b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.period_num='1' and a.APP_PRODUCT_NAME^='首付贷（先息后本）吉莱宝' group by a.APP_PRODUCT_NAME) c) d group by d.product_thi";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
ResultSet rs1 = null;/*结果集，封装了从数据库中查询的数据*/
ResultSet rs2 = null;/*结果集，封装了从数据库中查询的数据*/
JSONObject jsonObj1 = new JSONObject();
JSONArray array0 = new JSONArray();
JSONArray array1 = new JSONArray();

JSONArray array2 = new JSONArray();
JSONArray array3 = new JSONArray();

JSONArray array4 = new JSONArray();
JSONArray array5 = new JSONArray();
try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.8.96.6:1521:xnph","jhjy","tsumugi_hs");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
	while (rs.next())
	{
		JSONObject jsonObj = new JSONObject();
		String columnName ="name";
		String valueName ="value";
		String value = rs.getString("product"); 
		array1.add(value);
		int zhi = rs.getInt("product_money");
		jsonObj.put(valueName, zhi);
		jsonObj.put(columnName, value);
		array0.add(jsonObj);
	};
}catch (Exception e) {
	e.printStackTrace();
}
try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.8.96.6:1521:xnph","jhjy","tsumugi_hs");
	st = conn.createStatement();
	rs1 = st.executeQuery(sql1);
	while (rs1.next())
	{
		JSONObject jsonObj = new JSONObject();
		String columnName ="name";
		String valueName ="value";
		String value = rs1.getString("product_sec"); 
		array3.add(value);
		int zhi = rs1.getInt("product_sec_money");
		jsonObj.put(valueName, zhi);
		jsonObj.put(columnName, value);
		array2.add(jsonObj);
	};
}catch (Exception e) {
	e.printStackTrace();
}
try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.8.96.6:1521:xnph","jhjy","tsumugi_hs");
	st = conn.createStatement();
	rs2 = st.executeQuery(sql2);
	while (rs2.next())
	{
		JSONObject jsonObj = new JSONObject();
		String columnName ="name";
		String valueName ="value";
		String value = rs2.getString("product_thi"); 
		array5.add(value);
		int zhi = rs2.getInt("product_thi_money");
		jsonObj.put(valueName, zhi);
		jsonObj.put(columnName, value);
		array4.add(jsonObj);
	};
}catch (Exception e) {
	e.printStackTrace();
}
jsonObj1.put("S_data", array0);
jsonObj1.put("leng", array1);

jsonObj1.put("S_data0", array2);
jsonObj1.put("leng0", array3);

jsonObj1.put("S_data1", array4);
jsonObj1.put("leng1", array5);
jsonObj1.write(pageContext.getOut());
%>