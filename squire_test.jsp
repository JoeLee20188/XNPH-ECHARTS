<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%request.setCharacterEncoding("UTF-8");%> 
<%response.setCharacterEncoding("UTF-8");%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>普惠客户还款流水查询</title>
    <script src="js/jquery-3.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/echarts.js"></script>
    <script src="./js/roma.js"></script>
    <script src="./js/china.js"></script>
</head>
<body style="padding-top: 60px;font-family: 'Microsoft YaHei UI'">
<%
 //连接mysql数据库 
 	Class.forName("com.mysql.jdbc.Driver");
  	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/echart_db","root","");
  	Statement st = conn.createStatement();
  	
 %>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="./ph_main.jsp">小牛普惠DataWeb</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="./ph_main.jsp">首页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        业务快报<b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">普惠总览</a></li>
                        <li><a href="#">小微贷</a></li>
                        <li><a href="#">三农贷</a></li>
                        <li><a href="#">农商贷</a></li>
                        <li><a href="#">互联网</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        经营分析 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">月度分析报告</a></li>
                        <li><a href="#">客户专题报告</a></li>
                        <li class="divider"></li>
                        <li><a href="#">产品专题报告</a></li>
                        <li><a href="#">门店专题报告</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">月结报表<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">事业部报表</a></li>
                        <li><a href="#">门店报表</a></li>
                        <li><a href="#">产品报表</a></li>
                        <li><a href="#">逾期报表</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="col-1-1 controls" style="padding-right: 0">
                <form class="grid grid-pad" action="" method="post">
                </form>
                  <div class="control col-1-2">
                    <label>Contract_NO</label>
                    <input id="user" type="text" name="username" placeholder="请输入合同编号" autocomplete="off">
                  </div>
                  <div class="control col-1-2">
                    <label>或者</label>
                  </div>
                  <div class="control col-1-2">
                    <label>ID</label>
                    <input id="pw" type="password" name="password" placeholder="请输入身份证号" autocomplete="off">
                  </div>
                  <div class="control col-1-2">
                    <input type="button" id="login" name="login" onclick="submit(document.getElementById('login').value)" value="查询"/>
                  </div>
              </div>
<div class="container">
    <div class="row">
        <table class="table table-hover table-bordered" style="table-layout: fixed;">
            <caption class="text-center"><h3>普惠客户还款流水</h3></caption>
            <thead>
            <tr class="alert-success">
                <th class="text-center">事业部</th>
                <th class="text-center">申请件数</th>
                <th class="text-center">通过件数</th>
                <th class="text-center">拒绝件数</th>
                <th class="text-center">通过率</th>
                <th class="text-center">放款件数</th>
                <th class="text-center">合同金额</th>
                <th class="text-center">件均</th>
            </tr>
            </thead>
            <tbody>
            <%ResultSet rs = st.executeQuery("SELECT * FROM echart_db.fast_table");  
    while(rs.next()){%>
            <tr class="text-center">
                <td><%=rs.getString("BUSINESS_UNIT_SOURCE") %></td>
                <td><%=rs.getInt("APPLY_NUM") %></td>
                <td><%=rs.getInt("PASS_NUM") %></td>
                <td><%=rs.getInt("REFUSE_NUM") %></td>
                <td><%=rs.getString("PASS_RATE") %></td>
                <td><%=rs.getInt("LOAN_NUM") %></td>
                <td><%=rs.getInt("LOAN_MONEY") %></td>
                <td><%=rs.getDouble("AVE") %></td>
            </tr>
<%}%>
            </tbody>
        </table>
<%  
    rs.close();   
%>
    </div>
    </div>