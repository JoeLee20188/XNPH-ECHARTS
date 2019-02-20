<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFCellStyle"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFRow"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>

<%
String sql = "select TT.region_area_,a.apply_num,b.pass_num,c.refuse_num,to_char(round(b.pass_num*100/(b.pass_num+c.refuse_num),2),'990.99')||'%' as pass_rate,d.loan_num,d.loan_money,round(loan_money/loan_num,2) as ave from (select distinct region_area_ from xndb.apply_info where  business_unit_source='互联网服务事业部') TT,(select b.region_area_,count(a.apply_id) as apply_num from (select a.APPLY_ID from xndb.app_result a where a.ACTIVITY_ID='utask_apply_review' group by a.APPLY_ID having to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')>=(select to_char(TRUNC(SYSDATE, 'MM'),'YYYY/MM/DD')from dual)) a left join xndb.apply_info b on a.apply_id=b.apply_id where b.business_unit_source='互联网服务事业部' group by b.region_area_) a,(select b.region_area_,count(a.apply_id) as pass_num from (select a.APPLY_ID from xndb.app_result a where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null) or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null)  group by a.APPLY_ID having to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')>=(select to_char(TRUNC(SYSDATE, 'MM'),'YYYY/MM/DD')from dual)) a left join xndb.apply_info b on a.apply_id=b.apply_id where b.business_unit_source='互联网服务事业部' group by b.region_area_) b,(select b.region_area_,count(a.apply_id) as refuse_num from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a where (a.ACTIVITY_ID='utask_check2' and a.result='REFUSE' and a.handl_time is not null) or (a.ACTIVITY_ID='utask_check3' and a.result='REFUSE' and a.handl_time is not null)  group by a.APPLY_ID having to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')>=(select to_char(TRUNC(SYSDATE, 'MM'),'YYYY/MM/DD')from dual)) a left join xndb.apply_info b on a.apply_id=b.apply_id where b.business_unit_source='互联网服务事业部' group by b.region_area_) c,(select b.region_area_,count(a.contract_no) as loan_num,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.business_unit_source='互联网服务事业部' and to_char(a.real_pay_date,'YYYY/MM/DD')>=(select to_char(TRUNC(SYSDATE, 'MM'),'YYYY/MM/DD')from dual) group by b.region_area_) d where tt.region_area_=a.region_area_ and tt.region_area_=b.region_area_ and tt.region_area_=c.region_area_ and tt.region_area_=d.region_area_ union all select '互联网服务事业部',sum(apply_num),sum(pass_num),sum(refuse_num),to_char(round(sum(pass_num)*100/(sum(pass_num)+sum(refuse_num)),2),'990.99')||'%',sum(loan_num),sum(loan_money),round(sum(loan_money)/sum(loan_num),2) from (select TT.region_area_,a.apply_num,b.pass_num,c.refuse_num,to_char(round(b.pass_num*100/(b.pass_num+c.refuse_num),2),'990.99')||'%' as pass_rate,d.loan_num,d.loan_money,round(loan_money/loan_num,2) as ave from (select distinct region_area_ from xndb.apply_info where  business_unit_source='互联网服务事业部') TT,(select b.region_area_,count(a.apply_id) as apply_num from (select a.APPLY_ID from xndb.app_result a where a.ACTIVITY_ID='utask_apply_review' group by a.APPLY_ID having to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')>=(select to_char(TRUNC(SYSDATE, 'MM'),'YYYY/MM/DD')from dual)) a left join xndb.apply_info b on a.apply_id=b.apply_id where b.business_unit_source='互联网服务事业部' group by b.region_area_) a,(select b.region_area_,count(a.apply_id) as pass_num from (select a.APPLY_ID from xndb.app_result a where (a.ACTIVITY_ID='utask_check2' and a.result='PASS' and a.handl_time is not null) or (a.ACTIVITY_ID='utask_check3' and a.result='PASS' and a.handl_time is not null)  group by a.APPLY_ID having to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')>=(select to_char(TRUNC(SYSDATE, 'MM'),'YYYY/MM/DD')from dual)) a left join xndb.apply_info b on a.apply_id=b.apply_id where b.business_unit_source='互联网服务事业部' group by b.region_area_) b,(select b.region_area_,count(a.apply_id) as refuse_num from (select a.APPLY_ID,to_char(max(a.HANDL_TIME),'YYYY/MM/DD') as pass_date from xndb.app_result a where (a.ACTIVITY_ID='utask_check2' and a.result='REFUSE' and a.handl_time is not null) or (a.ACTIVITY_ID='utask_check3' and a.result='REFUSE' and a.handl_time is not null)  group by a.APPLY_ID having to_char(MIN(a.HANDL_TIME),'YYYY/MM/DD')>=(select to_char(TRUNC(SYSDATE, 'MM'),'YYYY/MM/DD')from dual)) a left join xndb.apply_info b on a.apply_id=b.apply_id where b.business_unit_source='互联网服务事业部' group by b.region_area_) c,(select b.region_area_,count(a.contract_no) as loan_num,round(sum(a.CONTRACT_AMOUNT)/10000,0) as loan_money from xndb.apply_contract a left join xndb.apply_info b on a.apply_id=b.apply_id where a.contract_state in('PASS','STPASS','STFAILER') and b.business_unit_source='互联网服务事业部' and to_char(a.real_pay_date,'YYYY/MM/DD')>=(select to_char(TRUNC(SYSDATE, 'MM'),'YYYY/MM/DD')from dual) group by b.region_area_) d where tt.region_area_=a.region_area_ and tt.region_area_=b.region_area_ and tt.region_area_=c.region_area_ and tt.region_area_=d.region_area_) order by apply_num desc";
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/


try {	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.8.96.6:1521:xnph","jhjy","tsumugi_hs");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
	XSSFWorkbook wb_test = new XSSFWorkbook();
	XSSFSheet sheet_test = wb_test.createSheet("每日快报");
	
	XSSFRow row_test0 = sheet_test.createRow(0);
	XSSFCellStyle style_test = wb_test.createCellStyle();
	style_test.setAlignment(XSSFCellStyle.ALIGN_CENTER);
	
	XSSFCell cell0 = row_test0.createCell(0);
	cell0.setCellValue("REGION_AREA_");
	cell0.setCellStyle(style_test);
	
	XSSFCell cell1 = row_test0.createCell(1);
	cell1.setCellValue("APPLY_NUM");
	cell1.setCellStyle(style_test);
	
	XSSFCell cell2 = row_test0.createCell(2);
	cell2.setCellValue("PASS_NUM");
	cell2.setCellStyle(style_test);
	
	XSSFCell cell3 = row_test0.createCell(3);
	cell3.setCellValue("REFUSE_NUM");
	cell3.setCellStyle(style_test);
	
	XSSFCell cell4 = row_test0.createCell(4);
	cell4.setCellValue("PASS_RATE");
	cell4.setCellStyle(style_test);
	
	XSSFCell cell5 = row_test0.createCell(5);
	cell5.setCellValue("LOAN_NUM");
	cell5.setCellStyle(style_test);
	
	XSSFCell cell6 = row_test0.createCell(6);
	cell6.setCellValue("LOAN_MONEY");
	cell6.setCellStyle(style_test);
	
	XSSFCell cell7 = row_test0.createCell(7);
	cell7.setCellValue("AVE");
	cell7.setCellStyle(style_test);
	
	while(rs.next()){
		int hangshu=rs.getRow();
		XSSFRow row_test = sheet_test.createRow(hangshu);
		XSSFCell celli0 = row_test.createCell(0);
		celli0.setCellValue(rs.getString("REGION_AREA_"));
		
		XSSFCell celli1 = row_test.createCell(1);
		celli1.setCellValue(rs.getInt("APPLY_NUM"));
		
		XSSFCell celli2 = row_test.createCell(2);
		celli2.setCellValue(rs.getInt("PASS_NUM"));
		
		XSSFCell celli3 = row_test.createCell(3);
		celli3.setCellValue(rs.getInt("REFUSE_NUM"));
		
		XSSFCell celli4 = row_test.createCell(4);
		celli4.setCellValue(rs.getString("PASS_RATE"));	
		
		XSSFCell celli5 = row_test.createCell(5);
		celli5.setCellValue(rs.getInt("LOAN_NUM"));	
		
		XSSFCell celli6 = row_test.createCell(6);
		celli6.setCellValue(rs.getInt("LOAN_MONEY"));	
		
		XSSFCell celli7 = row_test.createCell(7);
		celli7.setCellValue(rs.getDouble("AVE"));	
	}
	/*FileOutputStream fout = new FileOutputStream("C:/Users/xn005482/workspace/liwenbo/城市_进件_test.xlsx");*/
	response.setContentType("application/vnd.ms-excel; charset=utf-8");
	 response.setHeader("Content-Disposition","attachment;filename=ph_fast_table_hlw.xlsx");
	 response.setCharacterEncoding("utf-8");
	 OutputStream os=response.getOutputStream();
	 out.clear(); out = pageContext.pushBody(); 
	 wb_test.write(os);
	/*wb_test.write(fout);*/
	wb_test.close();
	/*fout.close();*/
} catch (Exception e) {
	e.printStackTrace();
} finally{
	try {
		rs.close();
	} catch (Exception e2) {		
	}
	try {
		st.close();
	} catch (Exception e3) {
	}
	try {
		conn.close();
	} catch (Exception e4) {
	}
}		

%>
