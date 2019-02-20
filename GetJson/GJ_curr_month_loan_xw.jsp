<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>

<%
String sql = "select a.loan_date,a.loan_money,b.loan_money1,c.loan_money2,d.loan_money3,e.loan_money4,f.loan_money5,g.loan_money6,h.loan_money7,i.loan_money8,j.loan_money9,k.loan_money10,l.loan_money11 from (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is not null group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD')) a left join (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money1 from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is not null and b.region_area_='小微一区' group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD')) b on a.loan_date=b.loan_date left join (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money2 from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is not null and b.region_area_='小微二区' group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD')) c on a.loan_date=c.loan_date left join (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money3 from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is not null and b.region_area_='小微三区' group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD')) d on a.loan_date=d.loan_date left join (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money4 from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is not null and b.region_area_='小微四区' group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD')) e on a.loan_date=e.loan_date left join (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money5 from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is not null and b.region_area_='小微五区' group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD')) f on a.loan_date=f.loan_date left join (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money6 from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is not null and b.region_area_='小微六区' group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD')) g on a.loan_date=g.loan_date left join (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money7 from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is not null and b.region_area_='小微七区' group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD')) h on a.loan_date=h.loan_date left join (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money8 from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is not null and b.region_area_='小微八区' group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD')) i on a.loan_date=i.loan_date left join (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money9 from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is not null and b.region_area_='小微九区' group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD')) j on a.loan_date=j.loan_date left join (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money10 from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is not null and b.region_area_='小微十区' group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD')) k on a.loan_date=k.loan_date left join (select to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money11 from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.BUSINESS_UNIT_SOURCE='小微贷事业部' and b.region_area_^='小微十二区' and b.region_area_ is not null and b.region_area_='小微十一区' group by to_char(a.real_pay_date,'YYYY/MM/DD') having to_char((select sysdate - interval '30' day from dual),'YYYY/MM/DD')<to_char(a.real_pay_date,'YYYY/MM/DD')) l on a.loan_date=l.loan_date order by loan_date";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/
JSONArray loan_date = new JSONArray();
JSONArray loan_money = new JSONArray();
JSONArray loan_money1 = new JSONArray();
JSONArray loan_money2 = new JSONArray();
JSONArray loan_money3 = new JSONArray();
JSONArray loan_money4 = new JSONArray();
JSONArray loan_money5 = new JSONArray();
JSONArray loan_money6 = new JSONArray();
JSONArray loan_money7 = new JSONArray();
JSONArray loan_money8 = new JSONArray();
JSONArray loan_money9 = new JSONArray();
JSONArray loan_money10 = new JSONArray();
JSONArray loan_money11 = new JSONArray();
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
		loan_money5.add(rs.getInt("loan_money5"));
		loan_money6.add(rs.getInt("loan_money6"));
		loan_money7.add(rs.getInt("loan_money7"));
		loan_money8.add(rs.getInt("loan_money8"));
		loan_money9.add(rs.getInt("loan_money9"));
		loan_money10.add(rs.getInt("loan_money10"));
		loan_money11.add(rs.getInt("loan_money11"));
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
data.put("loan_money5", loan_money5);
data.put("loan_money6", loan_money6);
data.put("loan_money7", loan_money7);
data.put("loan_money8", loan_money8);
data.put("loan_money9", loan_money9);
data.put("loan_money10", loan_money10);
data.put("loan_money11", loan_money11);
data.write(pageContext.getOut());
%>