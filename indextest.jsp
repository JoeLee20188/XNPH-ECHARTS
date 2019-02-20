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
    <title>月度报告</title>
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
                        <li><a href="./daily_report.jsp">普惠总览</a></li>
                        <li><a href="./daily_report_xw.jsp">小微贷</a></li>
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
<div id="myCarousel" class="carousel slide">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
        <li data-target="#myCarousel" data-slide-to="5"></li>
        <li data-target="#myCarousel" data-slide-to="6"></li>
        <li data-target="#myCarousel" data-slide-to="7"></li>
        <li data-target="#myCarousel" data-slide-to="8"></li>
        <li data-target="#myCarousel" data-slide-to="9"></li>
        <li data-target="#myCarousel" data-slide-to="10"></li>
        <li data-target="#myCarousel" data-slide-to="11"></li>
        <li data-target="#myCarousel" data-slide-to="12"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <div style="text-align:center;"><img src="images/幻灯片2.JPG" alt="first"></div>
            <div class="carousel-caption">1</div>
        </div>
        <div class="item">
            <div style="text-align:center;"><img src="images/幻灯片3.JPG" alt="first"></div>
            <div class="carousel-caption">2</div>
        </div>
        <div class="item">
        <div style="text-align:center;"><img src="images/幻灯片4.JPG" alt="first"></div>
        <div class="carousel-caption">3</div>
        </div>
        <div class="item">
            <div style="text-align:center;"><img src="images/幻灯片5.JPG" alt="first"></div>
            <div class="carousel-caption">4</div>
        </div>
        <div class="item">
            <div style="text-align:center;"><img src="images/幻灯片6.JPG" alt="first"></div>
            <div class="carousel-caption">5</div>
        </div>
        <div class="item">
            <div style="text-align:center;"><img src="images/幻灯片7.JPG" alt="first"></div>
            <div class="carousel-caption">6</div>
        </div>
        <div class="item">
            <div style="text-align:center;"><img src="images/幻灯片9.JPG" alt="first"></div>
            <div class="carousel-caption">7</div>
        </div>
        <div class="item">
            <div style="text-align:center;"><img src="images/幻灯片10.JPG" alt="first"></div>
            <div class="carousel-caption">8</div>
        </div>
        <div class="item">
            <div style="text-align:center;"><img src="images/幻灯片11.JPG" alt="first"></div>
            <div class="carousel-caption">9</div>
        </div>
        <div class="item">
            <div style="text-align:center;"><img src="images/幻灯片12.JPG" alt="first"></div>
            <div class="carousel-caption">10</div>
        </div>
        <div class="item">
            <div style="text-align:center;"><img src="images/幻灯片13.JPG" alt="first"></div>
            <div class="carousel-caption">11</div>
        </div>
        <div class="item">
            <div style="text-align:center;"><img src="images/幻灯片14.JPG" alt="first"></div>
            <div class="carousel-caption">12</div>
        </div>
    </div>
    <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div>
</body>
</html>