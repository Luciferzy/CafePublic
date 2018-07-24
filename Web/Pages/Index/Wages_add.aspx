<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Wages_add.aspx.cs" Inherits="Wages_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
  <meta http-equiv=”Content-Type” content=”text/html;charset=utf-8″>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title>工资福利新增</title>
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
 <script src="../../Scripts/laydate/laydate.js" type="text/javascript"></script>
<script src="../../Scripts/My97DatePicker/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
    var engine = new RSearchEngine('../../GetXml.aspx');

    mname = getCookie("name");
   // Grade = getCookie("grade");
    DeptName = getCookie("deptName");



    function InitWages() {
        
        if (mname == "" || mname == null) {
            window.open("../../LogIn.aspx", "_top");
        }
       

    }

    function Add() {

        var WagesClass = document.getElementById("WagesClass").value;
        var WagesName = document.getElementById("WagesName").value;
        var WagesBz = document.getElementById("WagesBz").value;
        var cYear = document.getElementById("cYear").value;
        var JanPlan = document.getElementById("JanPlan").value;
        var FebPlan = document.getElementById("FebPlan").value;
        var MarPlan = document.getElementById("MarPlan").value;
        var AprPlan = document.getElementById("AprPlan").value;
        var MayPlan = document.getElementById("MayPlan").value;
        var JunPlan = document.getElementById("JunPlan").value;
        var JulPlan = document.getElementById("JulPlan").value;
        var AugPlan = document.getElementById("AugPlan").value;
        var SepPlan = document.getElementById("SepPlan").value;
        var OctPlan = document.getElementById("OctPlan").value;

        var NovPlan = document.getElementById("NovPlan").value;
        var DecPlan = document.getElementById("DecPlan").value;

        if (WagesClass == "") {
            alert("请选取劳务类别！");
            document.form.WagesClass.focus();
            return false;
            exit;
        }
        if (WagesName == "") {
            alert("项目名/姓名不能为空！");
            document.form.WagesName.focus();
            return false;
            exit;
        }

        if (cYear == "") {
            alert("请选取年份！");
            document.form.cYear.focus();
            return false;
            exit;
        }



        if (JanPlan == "" || JanPlan < 0) {
            alert("一月福利格式输入不正确！");
            document.form.JanPlan.focus();
            return false;
            exit;
        }

        if (FebPlan == "" || FebPlan <0) {
            alert("二月福利格式输入不正确！");
            document.form.FebPlan.focus();
            return false;
            exit;
        }

        if (MarPlan == "" || MarPlan < 0) {
            alert("三月福利格式输入不正确！");
            document.form.MarPlan.focus();
            return false;
            exit;
        }

        if (AprPlan == "" || AprPlan < 0) {
            alert("四月福利格式输入不正确！");
            document.form.AprPlan.focus();
            return false;
            exit;
        }
        if (MayPlan == "" || MayPlan < 0) {
            alert("五月福利格式输入不正确！");
            document.form.MayPlan.focus();
            return false;
            exit;
        }

        if (JunPlan == "" || JunPlan < 0) {
            alert("六月福利格式输入不正确！");
            document.form.JunPlan.focus();
            return false;
            exit;
        }
        if (JulPlan == "" || JulPlan < 0) {
            alert("七月福利格式输入不正确！");
            document.form.JulPlan.focus();
            return false;
            exit;
        }

        if (AugPlan == "" || AugPlan < 0) {
            alert("八月福利格式输入不正确！");
            document.form.AugPlan.focus();
            return false;
            exit;
        }
        if (SepPlan == "" || SepPlan < 0) {
            alert("九月福利格式输入不正确！");
            document.form.SepPlan.focus();
            return false;
            exit;
        }

        if (OctPlan == "" || OctPlan < 0) {
            alert("十月福利格式输入不正确！");
            document.form.OctPlan.focus();
            return false;
            exit;
        }

        if (NovPlan == "" || NovPlan < 0) {
            alert("十一月福利格式输入不正确！");
            document.form.NovPlan.focus();
            return false;
            exit;
        }

        if (DecPlan == "" || DecPlan < 0) {
            alert("十二月福利格式输入不正确！");
            document.form.DecPlan.focus();
            return false;
            exit;
        }
        //var DepreciationTime=DepreciationTime.substr(0, 7);

        var Str = "?act=add_wages&DeptName=" + DeptName + "&MemberName=" + mname + "&WagesClass=" + WagesClass + "&WagesName=" + WagesName + "&WagesBz=" + WagesBz + "&cYear=" + cYear + "&JanPlan=" + JanPlan + "&FebPlan=" + FebPlan + "&MarPlan=" + MarPlan + "&AprPlan=" + AprPlan + "&MayPlan=" + MayPlan + "&JunPlan=" + JunPlan + "&JulPlan=" + JulPlan + "&AugPlan=" + AugPlan + "&SepPlan=" + SepPlan + "&OctPlan=" + OctPlan + "&NovPlan=" + NovPlan + "&DecPlan=" + DecPlan;
       // alert(Str);
      engine.PostStringInfo(Str, this, this.Add_Wages_CallBack);
      
      
    }




    function Add_Wages_CallBack() {
        var xmlHttp = engine.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var stateNode = xmldoc.getElementsByTagName("state");
                if (stateNode.length > 0) {
                    var state = stateNode[0].firstChild.nodeValue;
                    if (state == "新增成功") {
                        alert("工资福利新增成功！");

                        window.opener.location.reload();

                        window.close();
                        //window.status = state;
                    } else {
                        alert(state);
                    }
                   
                }
                else {
                    alert("工资福利新增失败");
                }
            }
            else {
                window.status = '正在写入信息，请稍候...';
            }
        }
   }


   function Count() {

       var PurchaseNum = document.getElementById("PurchaseNum").value == "" ? "0" : parseFloat(document.getElementById("PurchaseNum").value);
       var PurchasePrice = document.getElementById("PurchasePrice").value == "" ? "0" : parseFloat(document.getElementById("PurchasePrice").value);
       var PurchaseMoney = parseFloat(PurchaseNum * PurchasePrice);
       var ProductValue = PurchaseMoney * 0.1;
       document.getElementById("PurchaseMoney").value = PurchaseMoney.toFixed(2);
       document.getElementById("ProductValue").value = parseFloat(ProductValue.toFixed(2));

       Count_a();


   }

   function Count_a() {
       var PurchaseMoney = document.getElementById("PurchaseMoney").value == "" ? "0" : parseFloat(document.getElementById("PurchaseMoney").value);
       var ProductValue = document.getElementById("ProductValue").value == "" ? "0" : parseFloat(document.getElementById("ProductValue").value);
       var DepreciationYear = document.getElementById("DepreciationYear").value == "" ? "0" : parseFloat(document.getElementById("DepreciationYear").value);

       var DepreciationMonth = 12 * DepreciationYear;
       var MDMoney=(PurchaseMoney - ProductValue) / DepreciationMonth;

       document.getElementById("DepreciationMonth").value = DepreciationMonth;
       document.getElementById("MDMoney").value = parseFloat(MDMoney.toFixed(2));


   }


   function isNumber(str) {
       var re = /^(-|\+)?\d+(\.\d+)?$/;
       if (!re.test(str)) {
           alert("输入的不是数字，请重输！");

       }

   }



   function GetDeptName(n) {

       //获取部门名称
       $.ajax({
           type: "post",
           async: false,
           url: "../Ashx/GetDept.ashx",
           data: { "admin": mname },
           datatype: "json",
           success: function (result) {
               eval("var transult=" + result);
               if (n == 1) {
                  var DeptName = transult[0].data;
               }
               if (n == 2) {
                   var DeptName = transult[0].data;
               }
           },
           error: function (errorMsg) {
               alert(errorMsg.responseText);
               alert(errorMsg.status);
               alert("request data failed!!!");
           }
       });
   }

   function getCookie(name) {
       var strCookie = document.cookie;
       var arrCookie = strCookie.split("; ");
       for (var i = 0; i < arrCookie.length; i++) {
           var arr = arrCookie[i].split("=");
           if (arr[0] == name) return arr[1];
       }
       return "";
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
<body onload="InitWages()" class="hold-transition login-page">

  <table width="600" border="0" cellspacing="1" cellpadding="0" bgcolor="#FFFFFF">
  <tr height="30"><td colspan='2' bgcolor="#000000"><font color="#FFFFFF">请填写工资福利信息</font></td></tr>
  <tr><td bgcolor="#FFFFFF">
 <div class="login-box-body">  
 <form action="" method="post" id="form" name="form">
<table width="600" border="0" cellspacing="1" cellpadding="0">
<tr height="40"  bgcolor="#FFFFFF"><td align="right"> 劳务类别 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4">
<select name="WagesClass" id="WagesClass" style="width:80" class="form-control">
    <option value="" selected="selected">请选取类别</option>
     <option value="工资">工资</option>
      <option value="社保">社保</option>
       <option value="公积金">公积金</option>
       <option value="房租">房租</option>
       <option value="降温费">降温费</option>
       <option value="聚餐">聚餐</option>
       <option value="其它">其它</option>
       
  </select> 

  </div>  </td></tr>
<tr height="40" bgcolor="#FFFFFF"><td width="100" align="right">项目名/姓名 <font color="#FF0000">*</font></td><td valign="baseline"><div class="col-xs-8"><input id="WagesName" type="text" class="form-control"   size="20"/></div></td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">备注 <font color="#FF0000"></font></td><td>  <div class="col-xs-8"><input id="WagesBz" type="text" class="form-control" />  </div> </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right"> 年 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4">
<select name="cYear" id="cYear" style="width:80" class="form-control">
    <option value="" selected="selected">请选取年份</option>
     <option value="2017">2017</option>
      <option value="2018">2018</option>
       <option value="2019">2019</option>
       <option value="2020">2020</option>
       <option value="2021">2021</option>
       <option value="2022">2022</option>
       <option value="2023">2023</option>
       
  </select> 

  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">一月 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="JanPlan" type="text" class="form-control"  onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0"/>  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">二月 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="FebPlan" type="text" class="form-control" onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0" />  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">三月 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="MarPlan" type="text" class="form-control"  onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0" />  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">四月<font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="AprPlan" type="text" class="form-control"  onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0"/>  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">五月 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="MayPlan" type="text" class="form-control" onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0" />  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">六月 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="JunPlan" type="text" class="form-control" onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0"/>  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">七月 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="JulPlan" type="text" class="form-control"  onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0"/>  </div> 
  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">八月 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="AugPlan" type="text" class="form-control"  onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0"/>  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">九月 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="SepPlan" type="text" class="form-control" onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0" />  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">十月 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="OctPlan" type="text" class="form-control" onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0" />  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">十一月<font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="NovPlan" type="text" class="form-control" onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0"/>  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">十二月<font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="DecPlan" type="text" class="form-control" onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0" />  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right"></td><td><div class="col-xs-4">
          <button type="button" onclick="Add()" class="btn btn-primary btn-block btn-flat">新 增</button>
          </div>   </td></tr>

</table>
 </form>
    

</div>
      </td></tr>    
  </table>      
     



</body>
</html>
