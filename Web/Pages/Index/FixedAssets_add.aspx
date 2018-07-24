<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FixedAssets_add.aspx.cs" Inherits="FixedAssets_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
  <meta http-equiv=”Content-Type” content=”text/html;charset=utf-8″>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title>固定资产新增</title>
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
   


    function InitFixedAssets() {
        
        if (mname == "" || mname == null) {
            window.open("../../LogIn.aspx", "_top");
        }
       

    }

    function Add() {
        
        var EquipmentClass = document.getElementById("EquipmentClass").value;
        var EquipmentName = document.getElementById("EquipmentName").value;
        var EquipmentSpec = document.getElementById("EquipmentSpec").value;
        var EquipmentRemarks = document.getElementById("EquipmentRemarks").value;
        var UnitName = document.getElementById("UnitName").value;
        var PurchaseNum = document.getElementById("PurchaseNum").value;
        var PurchasePrice = document.getElementById("PurchasePrice").value;
        var PurchaseMoney = document.getElementById("PurchaseMoney").value;
        var ProductValue = document.getElementById("ProductValue").value;
        var PurchaseDate = document.getElementById("PurchaseDate").value;
        var DepreciationTime = document.getElementById("DepreciationTime").value;
        var DepreciationYear = document.getElementById("DepreciationYear").value;
        var DepreciationMonth = document.getElementById("DepreciationMonth").value;
        var MDMoney = document.getElementById("MDMoney").value;
       
        if (EquipmentClass == "") {
            alert("请选取资产类别！");
            document.form.EquipmentClass.focus();
            return false;
            exit;
        }
        if (EquipmentName == "") {
            alert("资产名称不能为空");
            document.form.EquipmentName.focus();
            return false;
            exit;
        }

        if (UnitName == "") {
            alert("单位不能为空");
            document.form.UnitName.focus();
            return false;
            exit;
        }

    

        if (PurchaseNum == "" || PurchaseNum <=0) {
            alert("采购数量输入不正确！");
            document.form.PurchaseNum.focus();
            return false;
            exit;
        }

        if (PurchasePrice == "" || PurchasePrice <= 0) {
            alert("价格输入不正确！");
            document.form.PurchasePrice.focus();
            return false;
            exit;
        }

        if (PurchaseDate == "") {
            alert("采购日期不能为空");
            document.form.PurchaseDate.focus();
            return false;
            exit;
        }

        if (DepreciationTime == "") {
            alert("折旧开始时间不能为空");
            document.form.DepreciationTime.focus();
            return false;
            exit;
        }
        if (DepreciationYear == "" || DepreciationYear <=0) {
            alert("折旧年限输入不正确！");
            document.form.DepreciationYear.focus();
            return false;
            exit;
        }
        //var DepreciationTime=DepreciationTime.substr(0, 7);

        var Str = "?act=add_fixedassets&DeptName=" + DeptName + "&MemberName=" + mname + "&EquipmentName=" + EquipmentName + "&EquipmentSpec=" + EquipmentSpec + "&EquipmentRemarks=" + EquipmentRemarks + "&UnitName=" + UnitName + "&PurchaseNum=" + PurchaseNum + "&PurchasePrice=" + PurchasePrice + "&PurchaseMoney=" + PurchaseMoney + "&ProductValue=" + ProductValue + "&PurchaseDate=" + PurchaseDate + "&DepreciationTime=" + DepreciationTime + "&DepreciationYear=" + DepreciationYear + "年&DepreciationMonth=" + DepreciationMonth + "&MDMoney=" + MDMoney;
       // alert(Str);
      engine.PostStringInfo(Str, this, this.Add_FixedAssets_CallBack);
      
      
    }




    function Add_FixedAssets_CallBack() {
        var xmlHttp = engine.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var stateNode = xmldoc.getElementsByTagName("state");
                if (stateNode.length > 0) {
                    var state = stateNode[0].firstChild.nodeValue;
                    if (state == "新增成功") {
                        alert("固定资产新增成功！");

                        window.opener.location.reload();

                        window.close();
                        //window.status = state;
                    } else {
                        alert(state);
                    }
                   
                }
                else {
                    alert("固定资产新增失败");
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
<body onload="InitFixedAssets()" class="hold-transition login-page">

  <table width="600" border="0" cellspacing="1" cellpadding="0" bgcolor="#FFFFFF">
  <tr height="30"><td colspan='2' bgcolor="#000000"><font color="#FFFFFF">请填写固定资产信息</font></td></tr>
  <tr><td bgcolor="#FFFFFF">
 <div class="login-box-body">  
 <form action="" method="post" id="form" name="form">
<table width="600" border="0" cellspacing="1" cellpadding="0">
<tr height="40"  bgcolor="#FFFFFF"><td align="right"> 资产类别 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4">
<select name="EquipmentClass" id="EquipmentClass" style="width:80" class="form-control">
    <option value="" selected="selected">请选取类别</option>
     <option value="温室">温室</option>
      <option value="设备">设备</option>
       
  </select> 

  </div>  </td></tr>
<tr height="40" bgcolor="#FFFFFF"><td width="100" align="right">资产名称 <font color="#FF0000">*</font></td><td valign="baseline"><div class="col-xs-8"><input id="EquipmentName" type="text" class="form-control"   size="20"/></div></td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">规格 <font color="#FF0000"></font></td><td>  <div class="col-xs-8"><input id="EquipmentSpec" type="text" class="form-control" />  </div> </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">备注 <font color="#FF0000"></font></td><td>  <div class="col-xs-8"><input id="EquipmentRemarks" type="text" class="form-control" />  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right"> 单位 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4">
<select name="UnitName" id="UnitName" style="width:80" class="form-control">
    <option value="" selected="selected">请选取单位</option>
     <option value="台">台</option>
      <option value="套">套</option>
       
  </select> 

  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">数量 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="PurchaseNum" type="text" class="form-control" onkeyup="Count(this.value)" onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0" />  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">单价 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="PurchasePrice" type="text" class="form-control" onkeyup="Count(this.value)" onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0"/>  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">金额 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="PurchaseMoney" type="text" class="form-control" onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0" readonly="readonly"/>  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">预计残值 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="ProductValue" type="text" class="form-control" onblur="this.value=this.value.replace(/[^?\d+(\.\d+)?]/g,'')" style="text-align: right;" value="0" readonly="readonly"/>  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">采购日期 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="PurchaseDate" type="text" class="form-control"  style="text-align: right;" onfocus="WdatePicker()"/>  </div> 
  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">折旧开始时间 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="DepreciationTime" type="text" class="form-control"  style="text-align: right;" onfocus="WdatePicker()"/>  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">折旧年限 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="DepreciationYear" type="text" class="form-control" onkeyup="Count_a()" onblur="this.value=this.value.replace(/[^\d]/g,'')" style="text-align: right;" value="10" />  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">折旧月数 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="DepreciationMonth" type="text" class="form-control" onblur="this.value=this.value.replace(/[^\d]/g,'')" style="text-align: right;" value="120" readonly="readonly"/>  </div>  </td></tr>
<tr height="40"  bgcolor="#FFFFFF"><td align="right">月折旧额 <font color="#FF0000">*</font></td><td>  <div class="col-xs-4"><input id="MDMoney" type="text" class="form-control" style="text-align: right;" readonly="readonly"/>  </div>  </td></tr>

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
