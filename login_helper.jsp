<%@page import="java.util.HashMap"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mydbHelper.*"%>
<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%
//db dbhelper = new db();
//out.write(dbhelper.getClass().toString());
if (request.getMethod().toLowerCase().equals("post")) {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String register = request.getParameter("register");
	String login = request.getParameter("login");
	Database dbhelper = new Database();
	//out.write(dbhelper.getClass().toString());
	
	if (register != null) {
		response.sendRedirect("register.jsp");
	} else if (login != null && username != null && password != null) {
		session.setAttribute("username", username);
		session.setAttribute("password", password);
		session.setAttribute("login_time", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		JSONObject result = dbhelper.login(username, password);
		String res = result.getString("type").toString();
		session.setAttribute("type", res);
		
		JSONObject r = new JSONObject();
		if (res.equals("manager") || res.equals("dormitory")) {
			r.put("res", "success");
		} else {
			r.put("res", "帐号密码错误，请重新输入！");
		}
		r.put("debug", res);
		r.write(pageContext.getOut());
	}
}
/*header("Content-Type:  application/json; charset=utf-8");
	include('db.php');
	session_start();
	$username = "";
	$password = "";

	if (isset($_POST['username']) == true)
		$username = $_POST['username'];
	if (isset($_POST['password']) == true)
		$password = $_POST['password'];

	if (isset($_POST['register']) == true) header("Location:register.html");
	else if ($_POST['login'] != null)
	{
		$_SESSION["username"] = $username;
		$_SESSION["password"] = $password;
		$_SESSION["loginTime"] = date("Y-m-d-H-i-s");

		$db = new Database();
		$result = $db->login($username, $password);
		$temp = json_decode($result,TRUE);
		$_SESSION["type"] = $temp['type'];
		if ($temp['type'] == 'dormitory' || $temp['type'] == 'manager'){
			$res['res'] = 'success';
			echo json_encode($res);
		}
		else {
			$res['res'] = $_SESSION['failded'];
			echo json_encode($res);
		}
	}*/
%>