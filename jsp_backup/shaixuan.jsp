<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script type="text/javascript">
function test(selObj)
{
  //获得下拉列表框的数据
  var number = selObj.options[selObj.selectedIndex].value;
  alert(number);
  //筛选数据的方法，筛选出大于number 的所有数据
  writeDate(number);
  
}
//筛选数据的方法
function writeDate(number)
{
  var arrs = new Array(1,2,6,8,12);
  var str = "";
  for(var i=0;i<arrs.length;i++)
  {
      if(number < arrs[i])
   str = str + arrs[i] + ",";
  }
  document.getElementById("date").innerHTML=str;
}
</script>
</head>

<body>
 筛选大于 <select id="number" onchange="test(this)">
<option value="0">0</option>
<option value="5">5</option>
<option value="10">10</option>
</select>的所有数据。
<div id="date"></div>
<script>
writeDate(0);
</script>
</body>
</html>
