<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Loginc.aspx.cs" Inherits="Loginc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Log in</title>
  <%--<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>--%>
<%--  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css" />
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css" />--%>
<%--  <link rel="stylesheet" href="dist/css/AdminLTE.min.css" />
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css" />--%>

  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic" />

  <script src="bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>

<script src="bower_components/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>

<script src="plugins/iCheck/icheck.min.js" type="text/javascript"></script>

 <script src="Scripts/RSearchEngine.js" type="text/javascript"></script>
 <script src="Scripts/RXmlHttpRequest.js" type="text/javascript"></script>
  <script src="Scripts/md5.js" type="text/javascript"></script>
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
                        if (grade == 1) {
                            document.cookie = "children=" + Children;

                            window.location.href = "IndexD.aspx";
                        }


                    } else if (password1 != password2 && mbrname1 == MemberName) {

                        alert("密码不正确");
                    }
                }
            }
        }
    }
//    $(function () {
//        $('input').iCheck({
//            checkboxClass: 'icheckbox_square-blue',
//            radioClass: 'iradio_square-blue',
//            increaseArea: '20%' /* optional */
//        });
//    });
</script>
</head>
<body>
<div class="login-box">
  <div class="login-logo">
    <a href="LogIn1.aspx"><b>Brighten</b></a>
  </div>

  <div class="login-box-body">
    <p class="login-box-msg">请填写您的信息</p>

      <div class="form-group has-feedback">
        <input id="MbrName" type="text" class="form-control" placeholder="会员名" onkeyup="this.value=this.value.replace(/[^\w\/]/ig,'')"/>
        <span class="glyphicon glyphicon-pencil form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input id="PassWord" type="password" class="form-control" placeholder="密码" />
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

        <div class="col-xs-4">
          <button type="button" onclick="Login()" class="btn btn-primary btn-block btn-flat" id="loginbt">登录</button>
        </div>

      </div>


  </div>

</div>


</body>
</html>
