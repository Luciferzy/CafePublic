<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="LogIn1" %>


<html>
<head>
  <meta http-equiv=”Content-Type” content=”text/html;charset=utf-8″>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title>Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
 <%-- <link rel="stylesheet" href="dist/css/AdminLTE.min.css">--%>
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

  <script src="bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js" type="text/javascript"></script>

 <script src="Scripts/RSearchEngine.js" type="text/javascript"></script>
 <script src="Scripts/RXmlHttpRequest.js" type="text/javascript"></script>
  <script src="Scripts/md5.js" type="text/javascript"></script>
  <style type="text/css">
      a:link { 
font-size: 12px; 
color: #444; 
text-decoration: none; 
} 
a:visited { 
font-size: 12px; 
color: #444; 
text-decoration: none; 
} 
a:hover { 
font-size: 12px; 
color: #444; 
text-decoration: none; 
} 
  </style>
<script type="text/javascript">
    var engine = new RSearchEngine('GetXml.aspx');
    //验证用户名和密码是否为空

    function keyLogin() {

        if (event.keyCode == 13) {  //回车键的键值为13
            document.getElementById("loginbt").click();  //调用登录按钮的登录事件
        }
    }

    

    function Login() {

       

        var mbrname = document.getElementById("MbrName").value;
        var password = document.getElementById("PassWord").value;
    //  document.Session["name"] ="dddd";

     // alert(Session["name"].ToString());
        if (mbrname == "") {
            alert("用户名不能为空");
            exit;
        }
        if (password == "") {
            alert("密码不能为空");
            exit;
        } else {
            GetInfo();
        }
        document.cookie = "name=" + mbrname;

   //  alert(document.cookie);
    }
    //验证用户名和密码是否正确
    function GetInfo() {
        var mbrname1 = document.getElementById("MbrName").value;
        var password1 = document.getElementById("PassWord").value;

        var Str = "?act=getinfo&mbrName=" + mbrname1;
        engine.PostStringInfo(Str, this, this.GetInfoBack);
      
    }

    function GetInfoBack() {
        var xmlHttp = engine.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;

                var mbrname1 = document.getElementById("MbrName").value;
                var password1 = $.md5(document.getElementById("PassWord").value); //加密成md5
               
                var gradeNote = xmldoc.getElementsByTagName("Grade");
                var authorityNote = xmldoc.getElementsByTagName("Authority");
                var managerNode = xmldoc.getElementsByTagName("Manager");
                var deptNameNode = xmldoc.getElementsByTagName("DeptName");
                var MemberNameNode = xmldoc.getElementsByTagName("MemberName");
                var passwordNote = xmldoc.getElementsByTagName("PassWord");
                var ChildrenNode = xmldoc.getElementsByTagName("Children");
                if (ChildrenNode.length == 0) {
                    var Children = 0;
                }
                if (ChildrenNode.length != 0) {
                    var Children = ChildrenNode.length > 0 ? ChildrenNode[0].firstChild.nodeValue : "";
                    document.cookie = "children=" + Children;
                }
                var password2 = passwordNote.length > 0 ? passwordNote[0].firstChild.nodeValue : "";
                var MemberName = MemberNameNode.length > 0 ? MemberNameNode[0].firstChild.nodeValue : "";
                var grade = gradeNote.length > 0 ? gradeNote[0].firstChild.nodeValue : "";
                var authority = authorityNote.length > 0 ? authorityNote[0].firstChild.nodeValue : "";
                var manager = managerNode.length > 0 ? managerNode[0].firstChild.nodeValue : "";
                var deptName = deptNameNode.length > 0 ? deptNameNode[0].firstChild.nodeValue : "";

                document.cookie = "grade=" + grade;
                document.cookie = "authority=" + authority;
                document.cookie = "membername=" + MemberName;
                document.cookie = "deptName=" + deptName;

                if (mbrname1 != MemberName) {
                    alert(mbrname1);
                    alert(mbrname2);
                    alert("用户不存在");
                }
                else {

                    if (password1 == password2 && mbrname1 == MemberName) {
                        document.cookie = "grade=" + grade;
                        document.cookie = "authority=" + authority;
                        document.cookie = "membername=" + MemberName;
                        document.cookie = "deptName=" + deptName;
                        document.cookie = "manager" + manager;

                        if (grade == 0) {
                            window.location.href = "IndexD.aspx";
                        }
                        else if (grade == 1) {
                            document.cookie = "children=" + Children;

                            window.location.href = "IndexD.aspx";
                        }
                        else {
                            window.location.href = "IndexD.aspx";
                        }


                    } else if (password1 != password2 && mbrname1 == MemberName) {

                        alert("密码不正确");
                    }
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
<body  onkeydown="keyLogin()">
<div style="margin:100px auto;width:360px;">
  <div style="height:80px">
    <a href="LogIn.aspx" style="font-size:25pt;padding:30px 110px 20px 110px;width:360px"><b>Brighten</b></a>
  </div>
  <!-- /.login-logo -->
  <div style=" padding:20px;border:1px solid #ccc">
    <p style="text-align:center;padding:0 20px 20px 20px;color:lightgray">请填写您的信息</p>

 <!--   <form action="../../index2.html" method="post">-->
      <div style="display:block;width:100%;padding:6px 12px;margin:15px 0;font-size:14px;border:1px solid #ccc; background:white; position:relative">
        <input style="border:none; width:100%; outline:none; color:#e7e7e7" id="MbrName" type="text" placeholder="会员名" onkeyup="this.value=this.value.replace(/[^\w\/]/ig,'')"/>
        <span class="glyphicon glyphicon-pencil form-control-feedback"></span>
      </div>
      <div style="display:block;width:100%;padding:6px 12px;margin:15px 0;font-size:14px;border:1px solid #ccc; background:white; position:relative">
        <input style="border:none; width:100%; outline:none; color:#e7e7e7" id="PassWord" type="password" placeholder="密码" />
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div >
        <%--<div >
          <div>
            <label>
              <input type="checkbox" style="width:"/> 记住密码
            </label>
          </div>
        </div>--%>
        <!-- /.col -->
        <div >
          <button type="button" onclick="Login()" class="btn btn-primary btn-block btn-flat" id="loginbt" style="height:40px; margin:20px 0">登录</button>
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

<%--    <a href="#">忘记密码？</a><br/>
    <a href="register.html" class="text-center">注册</a>--%>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->

</body>
</html>
