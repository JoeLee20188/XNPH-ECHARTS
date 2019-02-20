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
String sql = "select distinct a.REGION_CITYY_ as city,count(a.APPLY_ID) as num from XNDB.APPLY_INFO a where a.STATUS='SUBMIT' GROUP BY a.REGION_CITYY_";/*存储sql语句*/
Connection conn = null;/*当前的数据库连接*/
Statement st = null;/*像数据库发送sql语句*/
ResultSet rs = null;/*结果集，封装了从数据库中查询的数据*/


try {	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@10.15.18.11:1521:lsdb1","jhjy","jhjy");
	st = conn.createStatement();
	rs = st.executeQuery(sql);
	XSSFWorkbook wb_test = new XSSFWorkbook();
	XSSFSheet sheet_test = wb_test.createSheet("城市申请量");
	XSSFRow row_test0 = sheet_test.createRow(0);
	XSSFCellStyle style_test = wb_test.createCellStyle();
	style_test.setAlignment(XSSFCellStyle.ALIGN_CENTER);
	XSSFCell cell0 = row_test0.createCell(0);
	cell0.setCellValue("城市");
	cell0.setCellStyle(style_test);
	XSSFCell cell1 = row_test0.createCell(1);
	cell1.setCellValue("申请量");
	cell1.setCellStyle(style_test);
	
	while(rs.next()){
		int hangshu=rs.getRow();
		XSSFRow row_test = sheet_test.createRow(hangshu);
		XSSFCell celli0 = row_test.createCell(0);
		celli0.setCellValue(rs.getString("city"));
		XSSFCell celli1 = row_test.createCell(1);
		celli1.setCellValue(rs.getInt("num"));
	}
	/*FileOutputStream fout = new FileOutputStream("C:/Users/xn005482/workspace/liwenbo/城市_进件_test.xlsx");*/
	response.setContentType("application/vnd.ms-excel; charset=utf-8");
	 response.setHeader("Content-Disposition","attachment;filename=citynum_test.xlsx");
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
