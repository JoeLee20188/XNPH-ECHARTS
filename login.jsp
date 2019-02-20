<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome To NEO</title>
    <link href="./css/animate_l.css" rel="stylesheet">
    <link href="./css/style_l.css" rel="stylesheet">
    <link href="./css/init_l.css" rel="stylesheet">
  </head>
  <body>
    <div class="decal"></div>
		<div class="jumbotron">
			<div class="container">
  		  <h2 class="glow in tlt">小牛普惠投资管理有限公司</h2>
  		  <p class="tlt" data-in-effect="bounceInDown">
  		  </p>
  		</div>
  	</div>
    <div class="decal"></div>
  	<div class="container fade in">
      <div class="grid grid-pad">
        <section class="col-1-1">
            <h2>Welcome</h2>
            <div class="playground grid">
              <div class="col-1-1 viewport">
                  <div class="tlt">
                    <ul class="texts" style="display: none">
                      <li>总裁办-经营分析</li>
                    </ul>
                  </div>
              </div>
              <div class="col-1-1 controls" style="padding-right: 0">
                <form class="grid grid-pad" action="" method="post">
                </form>
                  <div class="control col-1-2">
                    <label>Username(用户名)</label>
                    <input id="user" type="text" name="username" placeholder="username" autocomplete="off">
                  </div>
                  <div class="control col-1-2">
                    <label>Password(密码)</label>
                    <input id="pw" type="password" name="password" placeholder="password" autocomplete="off">
                  </div>
                  <div class="control col-1-2">
                    <input type="button" id="login" name="login" onclick="submit(document.getElementById('login').value)" value="登录"/>
                  </div>
              </div>
            </div>
        </section>
      </div>
  	</div>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.fittext.js"></script>
    <script src="js/jquery.lettering.js"></script>
    <script src="js/highlight.min.js"></script>
    <script src="js/jquery.textillate.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
    <script type="text/javascript">
            function submit(name){
              if(name == "登录"){
                var user = document.getElementById('user').value;
                var password = document.getElementById('pw').value;
                function setCookie(c_name,value,expiredays)
                {
                var exdate=new Date()
                exdate.setDate(exdate.getDate()+expiredays)
                document.cookie=c_name+ "=" +escape(value)+
                ((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
                };
                setCookie('Username',user,1);
                setCookie('Password',password,1);
                if(user == "" || password == "") {
                  alert("请输入完整的用户名和密码方可登录");
                  return ;
                }
                var para={"username":user,"password":password,"login":"登录"};
                $.post("login_helper.jsp",para,function(msg,status){
                  console.log(msg.res);
                  if(msg.res == 'success'){
                    location.href="./ph_main.jsp";
                  }/*登录成功跳转到主界面*/
                  else{
                    alert(msg.res);
                  }
                });
              }
              else location.href="./register.jsp";
            }/*跳转到注册界面*/
    </script>
    <script>
      $(function (){
        var log = function (msg) {
          return function () {
            if (console) console.log(msg);
          }
        }

        var $form = $('.playground form')
          , $viewport = $('.playground .viewport');

        var getFormData = function () {
          var data = { 
            loop: true, 
            in: { callback: log('in callback called.') }, 
            out: { callback: log('out callback called.') }
          };

          return data;
        };

        var $tlt = $viewport.find('.tlt')
          .on('start.tlt', log('start.tlt triggered.'))
          .on('inAnimationBegin.tlt', log('inAnimationBegin.tlt triggered.'))
          .on('inAnimationEnd.tlt', log('inAnimationEnd.tlt triggered.'))
          .on('outAnimationBegin.tlt', log('outAnimationBegin.tlt triggered.'))
          .on('outAnimationEnd.tlt', log('outAnimationEnd.tlt triggered.'))
          .on('end.tlt', log('end.tlt'));
        
        $form.on('change', function () {
          var obj = getFormData();
          $tlt.textillate(obj);
        }).trigger('change');
      });
    </script>
  </body>
</html>
