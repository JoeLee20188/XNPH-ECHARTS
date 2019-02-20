<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>录入</title>
<link rel="stylesheet" href="css/style_r.css">
<link rel="stylesheet" href="css/fort_r.css">
<link rel="stylesheet" href="css/init_r.css">
<style>
.top-banner {
	background-color: #333;
}
</style>
<script src="js/fort.js"></script>
</head>
<body>
<div class="form-wrapper">
	<div class="top"><div class="colors"></div></div>
	<form name="form" action="register_helper.jsp" method="post">
		<div class="form">
			<h2></h2>
			<div class="form-item">
				<br/>
				<table>
				<tr><td>用户名：</td><td width="85%" height="70px"><input type="text" name="username" required="required" placeholder="username" autocomplete="off"></td></tr>
				<tr><td>密码：</td><td width="85%" height="70px"><input type="password" name="password1" required="required" placeholder="password" autocomplete="off"></td></tr>
				<tr><td>确认密码：</td><td width="85%" height="70px"><input type="password" name="password2" required="required" placeholder="confirm-password" autocomplete="off"></td></tr>
				<tr><td>工号：</td><td width="85%" height="70px"><input type="text" name="dom" required="required" placeholder="domID" autocomplete="off"></td></tr>
			</table>

			楼栋号：<select name="building" required="required" width="85%" height="70px"><option value="R">榕园</option><option value="L">荔园</option> </select>
				
			<select name="buildingNum" required="required"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option></select>
				<br/>

			</div>
			<div class="form-item">
				<table>宿舍成员1：<tr>
					<td height="70px"><input type="text" name="member1ID" required="required" placeholder="学号" autocomplete="off"></td>
					<td height="70px"><input type="text" name="member1Name" required="required" placeholder="姓名" autocomplete="off"></td>
					<td height="70px"><input type="text" name="member1Phone" required="required" placeholder="电话" autocomplete="off"></td>
				</tr></table>
			</div>
			<div class="button-panel">
				<input type="submit" name="submit" class="button" title="submit" value="提交">
				<input type="reset" name="reset" class="button" title="reset" value="清空">
			</div>
		</div>
	</form>
</div>
<script>
    solid();
</script>
<script type="text/javascript" src="js/jquery.min.js"></script>
</body>
</html>
