<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<title>总裁办·数据管理系统</title>
	<link rel="stylesheet" href="css/all_m.css" type="text/css" media="all" />
	<link rel="stylesheet" href="css/init_m.css">
	<link rel="stylesheet" href="css/fort_m.css">
	<style>
	body {
		margin-top: 0px;
	}
	</style>
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/jquery.main.js"></script>
	<script src="js/fort.js"></script>
</head>
<body>
	<div><img src="images/zhuhai.jpg" margin-top="20px" text-align="left" width="100%" height="200px"/></div>
	<div id="wrapper">
		<div id="content">
			<div class="c1">
				<div class="controls">
					<div class="profile-box">
						<span class="profile">
							<a href="#" class="section">
								<img class="image" src="images/img1.png" alt="image description" width="26" height="26" />
								<span class="text-box">
									Welcome
									<strong class="name">hello</strong>
								</span>
							</a>
							<a href="#" class="opener">opener</a>
						</span>
						<a href="logout_helper.jsp" class="btn-on" onclick="logout()">On</a>
					</div>
				</div>
				<div class="tabs">
					<div id="tab-1" class="tab">
						<article>
							<a href="./echart_demo01.jsp">客户回款情况</a>
						</article>
					</div>
					<div id="tab-5" class="tab">
						<article>
							<div class="text-section">
								<h1>放款客户明细</h1>
								<p>客户明细如下：</p>
							</div>
							事业部：<select name="depart" required="required" width="85%" height="70px"><option value="0">请选择事业部</option><option value="xwd">小微贷事业部</option><option value="wsd">网商贷事业部</option><option value="snd">三农贷事业部</option><option value="nsd">农商贷事业部</option><option value="fd">房贷事业部</option> </select>
							大区：<input id="domid" type="text" name="domid" value="">
							营业部：<input id="buildid" type="text" name="buildid" value="">
							客户经理：<input id="buildid" type="text" name="buildid" value="">
							<input type="button" name="find" onclick="findByDate('fees')" value="搜索"> 
							<div id="fees">
							</div>
						</article>
					</div>
					<div id="tab-2" class="tab">
						<article>
							<table>
								<tr><td>用户名：</td><td width="85%" height="50px"><input type="text" name="username" required="required" placeholder="username" autocomplete="off"></td></tr>
								<tr><td>密码：</td><td height="50px"><input type="password" name="password1" required="required" placeholder="password" autocomplete="off"></td></tr>
								<tr><td>确认密码：</td><td height="50px"><input type="password" name="password2" required="required" placeholder="password" autocomplete="off"></td></tr>
							</table>
						</article>
					</div>
				</div>
			</div>
		</div>
		<aside id="sidebar">
			<ul class="tabset buttons">
				<li class="active">
					<a href="#tab-1" class="ico5"><span>每日报表</span><em></em></a>
					<span class="tooltip"><span>每日报表</span></span>
				</li>
				<li>
					<a href="#tab-5" class="ico4"><span>客户明细</span><em></em></a>
					<span class="tooltip"><span>客户明细</span></span>
				</li>
				<li>
					<a href="#tab-2" class="ico3"><span>业务人员管理</span><em></em></a>
					<span class="tooltip"><span>业务人员管理</span></span>
				</li>
			</ul>
			<span class="shadow"></span>
		</aside>
	</div>
</body>

</html>