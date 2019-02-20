<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>sample page!</title>
<script type="text/javascript">
<!--
function test1(obj){
	var String=obj.test.value;
	var myregex=new RegExp("abc");
	if (myregex.test(myString))
		alert("\n搜索结果：\n\n目标字符串中存在字串"abc"!");
	else 
		alert("\n搜索结果：\n\n目标字符串中存在字串"abc"!");  	
}
-->
</script>
</head>
<body>
<center>
<p>判断输入字符串是否含特定字串</p>
<p>目标字符串
<form onSubmit="return test1(this)">
<input type="text" name="text" value="target string">
<input type="submit" value="提交">
</form>
</p>
</center>
</body>
</html>