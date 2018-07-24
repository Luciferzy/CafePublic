<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogIn1.aspx.cs" Inherits="LogIn1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
  <meta http-equiv=”Content-Type” content=”text/html;charset=utf-8″>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title>Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

  <script src="../../bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
<!-- iCheck -->
<script src="../../plugins/iCheck/icheck.min.js" type="text/javascript"></script>

 <script src="../../Scripts/RSearchEngine.js" type="text/javascript"></script>
 <script src="../../Scripts/RXmlHttpRequest.js" type="text/javascript"></script>
<script type="text/javascript">
    var engine = new RSearchEngine('../../GetXml.aspx');
    //验证用户名和密码是否为空
    function Login() {
        var mbrname = document.getElementById("MbrName").value;
        var password = document.getElementById("PassWord").value;

        if (mbrname == "") {
            alert("用户名不能为空");
        }
        if (password == "") {
            alert("密码不能为空");
        } else {
            GetInfo();
        }
        document.cookie = "name=" + mbrname;
    }
    //验证用户名和密码是否正确
    function GetInfo() {
        var mbrname = document.getElementById("MbrName").value;

        var Str = "?act=getinfo&mbrName=" + mbrname;
        engine.PostStringInfo(Str, this, this.GetInfoBack);
    }

    function GetInfoBack() {
        var xmlHttp = engine.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var password1 = document.getElementById("PassWord").value;
                var mbrname = document.getElementById("MbrName").value;
//                alert(password1);
                var passwordNote = xmldoc.getElementsByTagName("PassWord");
                var mbrnameNote = xmldoc.getElementsByTagName("MemberName");
//                alert(passwordNote);
                var passWord2 = passwordNote.length > 0 ? passwordNote[0].firstChild.nodeValue : "";
                var mbrname2 = mbrnameNote.length > 0 ? mbrnameNote[0].firstChild.nodeValue : "";
                //                alert(passWord2);
                if (password1 == passWord2 && mbrname == mbrname2) {
                    window.location.href = "Budget.aspx";

                } else {
                if (password1 != passWord2 && mbrname == mbrname2) {
                    alert("密码不正确");
                } else { alert("用户不存在"); }
                }
            }
        }
    }
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' /* optional */
        });
    });
</script>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="LogIn1.aspx"><b>Brighten</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">请填写您的信息</p>

 <!--   <form action="../../index2.html" method="post">-->
      <div class="form-group has-feedback">
        <input id="MbrName" type="text" class="form-control" placeholder="会员名" onkeyup="this.value=this.value.replace(/[^\w\/]/ig,'')"/>
        <span class="glyphicon glyphicon-pencil form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input id="PassWord" type="password" class="form-control" placeholder="密码" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"/>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"/> 记住密码
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="button" onclick="Login()" class="btn btn-primary btn-block btn-flat">登录</button>
        </div>
        <!-- /.col -->
      </div>
 <!--   </form>-->

   <!-- <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div>-->
    <!-- /.social-auth-links -->

    <a href="#">忘记密码？</a><br/>
    <a href="register.html" class="text-center">注册</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->

</body>
</html>
