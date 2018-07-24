<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dept_add.aspx.cs" Inherits="Dept_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
  <meta http-equiv=”Content-Type” content=”text/html;charset=utf-8″>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title>独立单位新增</title>
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
    

    function InitDept() {
        getMajordomo();

    }

    function Reg() {
       
        var MemberName = document.getElementById("MemberName").value;
        var PassWord = document.getElementById("PassWord").value;
       var DeptCode = document.getElementById("DeptCode").value;
       var DeptName = document.getElementById("DeptName").value;
       var Manager = document.getElementById("Manager").value;
       var Tel = document.getElementById("Tel").value;
       var Position = document.getElementById("Position").value;
       var Mjordomo_id = document.getElementById("Mjordomo_id").value;
    // alert(MemberName);
        if (MemberName == "") {
            alert("登陆帐号不能为空");
            document.form.MemberName.focus();
            return false;
            exit;
        }
        if (PassWord == "") {
            alert("登陆密码不能为空");
            document.form.PassWord.focus();
            return false;
            exit;
        }

        if (DeptCode == "") {
            alert("独立单位编码不能为空");
            document.form.DeptCode.focus();
            return false;
            exit;
        }

        if (DeptName == "") {
            alert("独立单位名称不能为空");
            document.form.DeptName.focus();
            return false;
            exit;
        }

        if (Manager == "") {
            alert("负责人不能为空");
            document.form.Manager.focus();
            return false;
            exit;
        }

        if (Tel == "") {
            alert("电话不能为空");
            document.form.Tel.focus();
            return false;
            exit;
        }

        if (Position == "") {
            alert("请选取职务");
            document.form.Position.focus();
            return false;
            exit;
        }

        if (Mjordomo_id == "") {
            alert("请选取所属总监");
            document.form.Mjordomo_id.focus();
            return false;
            exit;
        }
        var Grade = 0;
        var Authority = 0;
        var Str = "?act=add_department&MemberName=" + MemberName + "&PassWord=" + PassWord + "&DeptCode=" + DeptCode + "&DeptName=" + DeptName + "&Manager=" + Manager + "&Tel=" + Tel + "&Position=" + Position + "&Mjordomo_id=" + Mjordomo_id + "&Grade=" + Grade + "&Authority=" + Authority;
     // alert(Str);
        engine.PostStringInfo(Str, this, this.Add_Department_CallBack);
      
      
    }
 
   


    function Add_Department_CallBack() {
        var xmlHttp = engine.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var stateNode = xmldoc.getElementsByTagName("state");
                if (stateNode.length > 0) {
                    var state = stateNode[0].firstChild.nodeValue;
                    if (state == "新增成功") {
                        alert("独立单位新增成功！");

                        window.opener.location.reload();

                        window.close();
                        //window.status = state;
                    } else {
                        alert(state);
                    }
                   
                }
                else {
                    alert("独立单位新增失败");
                }
            }
            else {
                window.status = '正在写入信息，请稍候...';
            }
        }
   }





   function getMajordomo() {
       $.ajax({
           url: '../ashx/MajordomoAjax.ashx?opType=GetMajordomo',
           type: 'post',
           async: false,
           success: function (data) {
               $('#Mjordomo_id').html('');
               $('#Mjordomo_id').html(data);
           },
           error: function () {
               alert('服务器出错');
           }
       });
   };
</script>
</head>
<body onload="InitDept()" class="hold-transition login-page">

  <table width="600" border="0" cellspacing="1" cellpadding="0" bgcolor="#FFFFFF">
  <tr height="30"><td colspan='2' bgcolor="#000000"><font color="#FFFFFF">请填写您的信息</font></td></tr>
  <tr><td bgcolor="#FFFFFF">
 <div class="login-box-body">  
 <form action="" method="post" id="form" name="form">
<table width="600" border="0" cellspacing="1" cellpadding="0">
<tr height="40" bgcolor="#FFFFFF"><td width="100" align="right">登陆帐号 <font color="#FF0000">*</font></td><td valign="baseline"><div class="col-xs-4"><input id="MemberName" type="text" class="form-control"  onkeyup="this.value=this.value.replace(/[^\w\/]/ig,'')" size="20"/></div></td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">登陆密码 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="PassWord" type="password" class="form-control" onkeyup="this.value=this.value.replace(/[^\w\/]/ig,'')"/>  </div> </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">独立单位编码 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="DeptCode" type="text" class="form-control" onkeyup="this.value=this.value.replace(/[^\w\/]/ig,'')"/>  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">独立单位名称 <font color="#FF0000">*</font></td><td>  <div class="col-xs-8"><input id="DeptName" type="text" class="form-control" />  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">负责人 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="Manager" type="text" class="form-control" />  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">电话 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="Tel" type="text" class="form-control" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"/>  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right"> 职务 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4">
<select name="Position" id="Position" style="width:80" class="form-control">
    <option value="" selected="selected">请选取职务</option>
     <option value="场长">场长</option>
      <option value="经理">经理</option>
       <option value="总监">总监</option>
        <option value="总经理">总经理</option>
         <option value="执行董事" >执行董事</option>
  </select> 

  </div>  </td></tr>
  <tr height="40"  bgcolor="#FFFFFF"><td align="right"> 所属总监 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4">
<select name="Mjordomo_id" id="Mjordomo_id" style="width:80" class="form-control">

  </select> 

  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right"></td><td><div class="col-xs-4">
          <button type="button" onclick="Reg()" class="btn btn-primary btn-block btn-flat">注 册</button>
          </div>   </td></tr>

</table>
 </form>
    

</div>
      </td></tr>    
  </table>      
     



</body>
</html>
