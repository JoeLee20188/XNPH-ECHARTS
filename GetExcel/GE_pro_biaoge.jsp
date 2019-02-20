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
String sql = "select product_name,count(contract_no) as num,round(sum(loan_amount)/10000,0) as loan_amount,round(sum(con_amount)/10000,0) as con_amount from (select a.app_product_name as product_name,a.cust_name as real_customer,a.id_num as cert_id,b.curr_app_amount as loan_amount,b.period_value as periods_num,to_char(a.real_pay_date,'YYYY/MM/DD') as loan_date,a.contract_no,c.curr_capital_remain_amount as con_amount,c.repay_amount as mon_pay,c.repay_capital_amount as mon_pri,c.interest_amount as mon_int,c.repay_amount-c.repay_capital_amount-c.interest_amount as mon_man from xndb.apply_contract a,xndb.apply_status b,xndb.apply_repay_plan c where a.apply_id=b.apply_id and a.apply_id=c.apply_id and c.period_num='1' and a.contract_state in('PASS','STPASS','STFAILER') and a.app_product_name not like '首付贷%') a group by product_name order by num";  
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/


try {	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.15.18.11:1521:lsdb1","jhjy","jhjy");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
	XSSFWorkbook wb_test = new XSSFWorkbook();
	XSSFSheet sheet_test = wb_test.createSheet("产品销量概况");
	
	XSSFRow row_test0 = sheet_test.createRow(0);
	XSSFCellStyle style_test = wb_test.createCellStyle();
	style_test.setAlignment(XSSFCellStyle.ALIGN_CENTER);
	
	XSSFCell cell0 = row_test0.createCell(0);
	cell0.setCellValue("产品名称");
	cell0.setCellStyle(style_test);
	
	XSSFCell cell1 = row_test0.createCell(1);
	cell1.setCellValue("放款件数");
	cell1.setCellStyle(style_test);
	
	XSSFCell cell2 = row_test0.createCell(2);
	cell2.setCellValue("放款金额");
	cell2.setCellStyle(style_test);
	
	XSSFCell cell3 = row_test0.createCell(3);
	cell3.setCellValue("合同金额");
	cell3.setCellStyle(style_test);
	
	while(rs.next()){
		int hangshu=rs.getRow();
		XSSFRow row_test = sheet_test.createRow(hangshu);
		XSSFCell celli0 = row_test.createCell(0);
		celli0.setCellValue(rs.getString("PRODUCT_NAME"));
		XSSFCell celli1 = row_test.createCell(1);
		celli1.setCellValue(rs.getInt("num"));
		XSSFCell celli2 = row_test.createCell(2);
		celli2.setCellValue(rs.getInt("loan_amount"));
		XSSFCell celli3 = row_test.createCell(3);
		celli3.setCellValue(rs.getInt("con_amount"));		
	}
	/*FileOutputStream fout = new FileOutputStream("C:/Users/xn005482/workspace/liwenbo/城市_进件_test.xlsx");*/
	response.setContentType("application/vnd.ms-excel; charset=utf-8");
	 response.setHeader("Content-Disposition","attachment;filename=product_test.xlsx");
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
