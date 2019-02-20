<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="mydbHelper.*"%>
<%@page import="net.sf.json.*"%>
<%
String submit=request.getParameter("submit");
if (request.getMethod().toLowerCase().equals("post") && submit!=null) {
	String username = request.getParameter("username");
	String password = request.getParameter("password1");
	String domID = request.getParameter("dom");
	String buildID = request.getParameter("building") + request.getParameter("buildingNum");
	
	Database db = new Database();
	JSONObject result = db.addDormitory(buildID, domID, username, password);
	if (result.get("state").toString().equals("register_succeeded")) {
		for (int i = 1; i <= 4; ++i) {
			String id = request.getParameter("member" + i + "ID");
			String name = request.getParameter("member" + i + "Name");
			String phone = request.getParameter("member" + i + "Phone");
			if (id.equals("") && name.equals("") && phone.equals("")) continue;
			JSONObject ans = db.addMember(id, name, phone, buildID, domID);
			if (!ans.get("state").toString().equals("succeeded")) {
				response.sendRedirect("register.jsp?register_failed");
				return;
			}
		}
	}
	response.sendRedirect("register.jsp?register_succeeded");
	return;
}
	/*include 'db.php';

	$submit = $_REQUEST['submit'];
	echo "sumbit:$submit!<br>";
	if ($submit != null)
	{
		$username = $_REQUEST['username'];
		$password = $_REQUEST['password1'];
		$domID = $_REQUEST['dom'];
		$buildID = $_REQUEST['building'] . $_REQUEST['buildingNum'];

		$db = new Database();
		$result = $db->addDormitory($buildID, $domID, $username, $password);
		$temp = json_decode($response,TRUE);
		echo "result1:$result<br>";
		if ($temp['state'] == 'register_succeeded')
		{
			for ($i = 1; $i <= 4; $i++)
			{
				$id = $_REQUEST['member'.$i.'ID'];
				$name = $_REQUEST['member'.$i.'Name'];
				$phone = $_REQUEST['member'.$i.'Phone'];
				if($id=="" && $name=="" && $phone=="") continue;
				echo "$id-$name-$phone<br>";
				$ans = $db->addMember($id, $name, $phone, $buildID, $domID);
				echo "add result:$ans<br>";
				$temp = json_decode($response,TRUE);
				if ($temp['state'] != 'succeeded')
				{
					header("Location:register.html?register_failed");
					exit();
				}
			}
		}

		header("Location:login.html?register_succeeded");
		exit();
	}
	else echo '<h1>Some Error Happened!</h1>';*/
%>