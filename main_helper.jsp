<%@page import="java.util.*"%>
<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="mydbHelper.*"%>
<%@page import="net.sf.json.*"%>
<%
String username = session.getAttribute("username").toString();
String password = session.getAttribute("password").toString();
String date = session.getAttribute("login_time").toString();
String type = session.getAttribute("type").toString();
Database db = new Database();

ArrayList<HashMap<String, String>> all_letters, all_messages, all_fees;

if (type.equals("manager")) {
	all_letters = db.getAllLetter();
	all_messages = db.getAllMessage();
	all_fees = db.getAllFees();
} else if (type.equals("dormitory")) {
	all_letters = db.getLetterforUser(username);
	all_messages = db.getAllMessage();
	all_fees = db.getFeesForUser(username);
} else return;


JSONObject total = new JSONObject();
total.put("letters", all_letters);
total.put("messages", all_messages);
total.put("fees", all_fees);

total.write(pageContext.getOut());

/*
header("Content-Type: application/json; charset=utf-8");
	include('db.php');
	session_start();
	$username = $_SESSION['username'];
	$password = $_SESSION['password'];
	$date = $_SESSION['loginTime'];

	$type = $_POST['user'];

	$db = new Database();

	if ($type == "manager"){
		$all_letters = $db->getAllLetter();
		$all_messages = $db->getAllMessage();
		$all_fees = $db->getAllFees();
		$total['letters'] = $all_letters;
		$total['messages'] = $all_messages;
		$total['fees'] = $all_fees;
		echo json_encode($total);
	}
	else if($type == "dormitory") {
		$all_letters = $db->getLetterforUser($username);
		$all_messages = $db->getAllMessage();
		$all_fees = $db-> getFeesForUser($username);
		$total['letters'] = $all_letters;
		$total['messages'] = $all_messages;
		$total['fees'] = $all_fees;
		echo json_encode($total);
	}
*/
%>