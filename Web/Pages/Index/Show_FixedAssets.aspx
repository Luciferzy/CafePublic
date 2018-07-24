<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Show_FixedAssets.aspx.cs" Inherits="Show_FixedAssets" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>固定资产表</title>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css"/>
    <link rel="stylesheet" href="../../dist/css/AdminLTE.css"/>
    <link rel="stylesheet" href="../../dist/css/skins/skin-blue.min.css"/>
    <link rel="stylesheet" href="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>
     <%--<script src="../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>--%>
     <script src="../../Scripts/jquery.js" type="text/javascript"></script>
     <script src="../../Scripts/jquery.min.js" type="text/javascript"></script>
     <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
     <style type="text/css">
         
         .jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;box-sizing: content-box;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}
     
     .InsertCol
     {
         text-align:right ;
         }
     
 .choBt
 {  
     height:30px;
     float:left;
     padding-left:10px;
     padding-right:10px;
 }
 
     </style>
     
<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->
<script type="text/javascript" src="../../Scripts/echarts.js"></script>
<script src="../../Scripts/RSearchEngine.js" type="text/javascript"></script>
<script src="../../Scripts/RXmlHttpRequest.js" type="text/javascript"></script>	

<!-- Bootstrap 3.3.7 -->
  <script type="text/javascript" src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
  <script type="text/javascript" src="../../dist/js/adminlte.js"></script>
<!-- ChartJS -->
 <script type="text/javascript" src="../../bower_components/chart.js/Chart.js"></script>
<!--Fastclick-->
 <script type="text/javascript" src="../../dist/js/pages/dashboard2.js"></script>
 <script type="text/javascript" src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script type="text/javascript" src="../../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="../../dist/js/demo.js"></script>
<script type="text/javascript" src="../../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" language="javascript">
    var entity = new RSearchEngine('../../GetXml.aspx');
    mname = "";
    state = "";
    Info = new Array();
    var nowDate = new Date();
    var nowyear = nowDate.getFullYear();
    var nowmonth = nowDate.getMonth() + 1;
    //var month = nowDate.getMonth() + 1 < 10 ? "0" + (nowDate.getMonth() + 1): nowDate.getMonth() + 1;
    //var day = nowDate.getDate() < 10 ? "0" + nowDate.getDate() : nowDate.getDate();
    //var Now_dateStr = year + "-" + month + "-" + day;

    //var a = Now_dateStr - 1;


    mname = getCookie("name");
       
    Grade = getCookie("grade");
    DeptName = getCookie("eptName");
   Manager = getCookie("manager");
   //   membername = getUrlParam("membername");
   membername = getCookie("checkname");

   function InitFixedAssets() {
      //alert(a);
       var EquipmentName = "";

        if (mname == "" || mname == null) {
            window.open("../../LogIn.aspx", "_top");
        }
        else {
            if (Grade == 0) {
                var Str = "?act=initfixedassets&mname=" + membername + "&equipmentname=" + EquipmentName;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            if (Grade == 1) {
                var Str = "?act=initfixedassets&mname=" + membername + "&equipmentname=" + EquipmentName;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            if (Grade == 5) {
                var Str = "?act=initfixedassets&mname=" + membername + "&equipmentname=" + EquipmentName;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            
        }


    }

    function LogOut() {
        if (confirm("确定退出系统？")) {
            window.open("../../LogIn.aspx", "_top");
        }
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


    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return unescape(r[2]); return null; //返回参数值
    }

   

    function InfoCallBack() {

        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {

                
                var xmldoc = xmlHttp.responseXML;
                var IdNode = xmldoc.getElementsByTagName("Id");
                var DeptNameNode = xmldoc.getElementsByTagName("DeptName");
                var EquipmentNameNode = xmldoc.getElementsByTagName("EquipmentName");
                var EquipmentSpecNode = xmldoc.getElementsByTagName("EquipmentSpec");
                var EquipmentRemarksNode = xmldoc.getElementsByTagName("EquipmentRemarks");
                var UnitNameNode = xmldoc.getElementsByTagName("UnitName");
                var PurchaseNumNode = xmldoc.getElementsByTagName("PurchaseNum");
                var PurchasePriceNode = xmldoc.getElementsByTagName("PurchasePrice");

                var PurchaseMoneyNode = xmldoc.getElementsByTagName("PurchaseMoney");
                var ProductValueNode = xmldoc.getElementsByTagName("ProductValue");

                var PurchaseDateNode = xmldoc.getElementsByTagName("PurchaseDate");

                var DepreciationTimeNode = xmldoc.getElementsByTagName("DepreciationTime");
               

                var DepreciationYearNode = xmldoc.getElementsByTagName("DepreciationYear");

                var DepreciationMonthNode = xmldoc.getElementsByTagName("DepreciationMonth");

                var MDMoneyNode = xmldoc.getElementsByTagName("MDMoney");
                var DepreciationEndTimeNode = xmldoc.getElementsByTagName("DepreciationEndTime");





                for (var i = 0; i < EquipmentNameNode.length; i++) {
                    
                    Info[i] = new Object();
                    Info[i].Id = IdNode[i].childNodes.length > 0 ? IdNode[i].firstChild.nodeValue : "";
                   
                    Info[i].DeptName = DeptNameNode[i].childNodes.length > 0 ? DeptNameNode[i].firstChild.nodeValue : "";
                    Info[i].EquipmentName = EquipmentNameNode[i].childNodes.length > 0 ? EquipmentNameNode[i].firstChild.nodeValue : "";

                    Info[i].EquipmentSpec = EquipmentSpecNode[i].childNodes.length > 0 ? EquipmentSpecNode[i].firstChild.nodeValue : "";

                    Info[i].EquipmentRemarks = EquipmentRemarksNode[i].childNodes.length > 0 ? EquipmentRemarksNode[i].firstChild.nodeValue : "";
                    
                    Info[i].UnitName = UnitNameNode[i].childNodes.length > 0 ? UnitNameNode[i].firstChild.nodeValue : "";
                    Info[i].PurchaseNum = PurchaseNumNode[i].childNodes.length > 0 ? PurchaseNumNode[i].firstChild.nodeValue : "";
                    Info[i].PurchasePrice = PurchasePriceNode[i].childNodes.length > 0 ? PurchasePriceNode[i].firstChild.nodeValue : "";
                    
                    Info[i].PurchaseMoney = PurchaseMoneyNode[i].childNodes.length > 0 ? PurchaseMoneyNode[i].firstChild.nodeValue : "";
                    Info[i].ProductValue = ProductValueNode[i].childNodes.length > 0 ? ProductValueNode[i].firstChild.nodeValue : "";
                  
                    Info[i].PurchaseDate = PurchaseDateNode[i].childNodes.length > 0 ? PurchaseDateNode[i].firstChild.nodeValue : "";

                    Info[i].DepreciationTime = DepreciationTimeNode[i].childNodes.length > 0 ? DepreciationTimeNode[i].firstChild.nodeValue : "";

                    Info[i].DepreciationYear = DepreciationYearNode[i].childNodes.length > 0 ? DepreciationYearNode[i].firstChild.nodeValue : "";

                    Info[i].DepreciationMonth = DepreciationMonthNode[i].childNodes.length > 0 ? DepreciationMonthNode[i].firstChild.nodeValue : "";

                    Info[i].MDMoney = MDMoneyNode[i].childNodes.length > 0 ? MDMoneyNode[i].firstChild.nodeValue : "";
                    Info[i].DepreciationEndTime = DepreciationEndTimeNode[i].childNodes.length > 0 ? DepreciationEndTimeNode[i].firstChild.nodeValue : "";
                    
                    
                }
               // showHead();
                showInfo();
            }
        }
    }

  

     function showHead() {

         var strHtml ='<input type="button" name="btSure" id="btSure" onclick="setYear()" value="查询" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/>';
         if (Info[0].Isedit == 1 && Info[0].Isok == 0) {
             strHtml += '<input type="button" name="btSure" id="btSure" onclick="C_EditCash()" value="重改" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/>'+
             '<input type="button" name="btSure" id="btSure" onclick="OkCash()" value="确定" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/>';
         }
        
         
         document.getElementById("head").innerHTML = strHtml;
        }






    function showInfo() {

        var strHtml =

    '<table style="border-collapse:collapse;width:99%;background:white;font-size:9pt" border="1"><tr height="28" bgcolor="#E7E7E7">' +
    '<th style="width:40px;text-align:center;">序号</th>' +
      '<th style="width:100px;text-align:center;">资产名称</th>' +

    '<th style="width:100px;text-align:center;">规格</th>' +
    '<th style="width:100px;text-align:center;">备注</th>' +
    '<th style="width:70px;text-align:center;">数量</th>' +
    '<th style="width:80px;text-align:center;">单价</th>' +
    '<th style="width:80px;text-align:center;">金额</th>' +
     '<th style="width:80px;text-align:center;">预计残值</th>' +
    '<th style="width:90px;text-align:center;">采购日期</th>' +
    '<th style="width:80px;text-align:center;">开始折旧</th>' +
    '<th style="width:80px;text-align:center;">折旧年限</th>' +
    '<th style="width:80px;text-align:center;">折旧月数</th>' +
    '<th style="width:80px;text-align:center;">月折旧额</th>' +
     '<th style="width:80px;text-align:center;">结束时间</th>' +
    '<th style="width:90px;text-align:center;">已折月数</th>' +
        '<th style="width:80px;text-align:center;">累计折旧</th>' +
        '<th style="width:80px;text-align:center;">净值</th>';


        var PurchaseNum_all = 0;
        var PurchaseMoney_all = 0;
        var ProductValue_all = 0;
        var MDMoney_all = 0;
        var a_all = 0;
        var b_all = 0;

        for (var i = 0; i < Info.length; i++) {


            strHtml += '<tr bgcolor="#ffffff"  onMouseMove="this.bgColor=\'#D1DDAA\';" onMouseOut="this.bgColor=\'#FFFFFF\';">' +
                        '<td style="text-align:center;" height="26">' + i + '</td>' +
                         '<td id="It' + i + '" style="text-align:left;" >' + Info[i].EquipmentName + '</td>' +
                        '<td id="0M' + i + '" style="text-align:left;" >' + Info[i].EquipmentSpec + '</td>' +
                        '<td id="1M' + i + '" style="text-align:left;" >' + Info[i].EquipmentRemarks + '</td>' +
                        '<td id="2M' + i + '" style="text-align:center;" >' + Info[i].PurchaseNum + ' ' + Info[i].UnitName + '</td>' +
                        '<td id="3M' + i + '" style="text-align:right;" >' + Info[i].PurchasePrice + '</td>' +
                        '<td id="4M' + i + '" style="text-align:right;" >' + Info[i].PurchaseMoney + '</td>' +
                        '<td id="7M' + i + '" style="text-align:right;" >' + Info[i].ProductValue + '</td>' +
                        '<td id="5M' + i + '" style="text-align:center;" >' + Info[i].PurchaseDate.substr(0, 10) + '</td>' +
                        '<td id="6M' + i + '" style="text-align:center;" >' + Info[i].DepreciationTime.substr(0, 7) + '</td>';

            var sat_year = Info[i].DepreciationTime.substr(0, 4);
            var sat_month = Info[i].DepreciationTime.substr(5, 2);

            if (parseFloat(sat_year) > parseFloat(nowyear)) {

               month_all = 0;

            } else if (parseFloat(sat_year) == parseFloat(nowyear)) {

                if (parseFloat(nowmonth) > parseFloat(sat_month)) {

                    month_all = parseFloat(nowmonth) - parseFloat(sat_month);

                } else {

                    month_all = 0;

                }

            } else {

                if (parseFloat(nowmonth) >= parseFloat(sat_month)) {

                    year = parseFloat(nowyear) - parseFloat(sat_year);
                    month = parseFloat(nowmonth) - parseFloat(sat_month);
                    month_all = year * 12 + month;
                } else {

                    year = parseFloat(nowyear) - parseFloat(sat_year) - 1;
                    month1 = 12 - parseFloat(sat_month) - 1;
                    month_all = year * 12 + parseFloat(month1) + parseFloat(nowmonth);
                }

            }



            strHtml += '<td id="8M' + i + '" style="text-align:center;" >' + Info[i].DepreciationYear + '</td>' +
                        '<td id="9M' + i + '" style="text-align:center;" >' + Info[i].DepreciationMonth + '</td>' +
                        '<td id="10M' + i + '" style="text-align:right;" >' + Info[i].MDMoney + '</td>' +
                         '<td id="5M' + i + '" style="text-align:center;" >' + Info[i].DepreciationEndTime.substr(0, 7) + '</td>' +
                         '<td id="11M' + i + '" style="text-align:center;">' + month_all + '</td>';

            var a = Info[i].MDMoney * month_all;
            var b = Info[i].PurchaseMoney - a;

            strHtml += '<td id="11M' + i + '" style="text-align:right;" >'+a.toFixed(2)+'</td>' +
                        '<td id="11M' + i + '" style="text-align:right;">' + b.toFixed(2) + '</td></tr>';



            var PurchaseNum_all = parseFloat(PurchaseNum_all) + parseFloat(Info[i].PurchaseNum);
            var PurchaseMoney_all = parseFloat(PurchaseMoney_all) + parseFloat(Info[i].PurchaseMoney);
            var ProductValue_all = parseFloat(ProductValue_all) + parseFloat(Info[i].ProductValue);
            var MDMoney_all = parseFloat(MDMoney_all) + parseFloat(Info[i].MDMoney);
            var a_all = parseFloat(a_all) + a;

            var b_all = parseFloat(b_all) + b;

        }

        strHtml += '<tr bgcolor="#ffff00"><td style="text-align:center;" height="30" colspan="4">合计</td>';

        strHtml += '<td  style="text-align:center;">' + PurchaseNum_all + '</td>';
        strHtml += '<td  style="text-align:right;"></td>';
        strHtml += '<td  style="text-align:right;">' + PurchaseMoney_all.toFixed(2) + '</td>';
        strHtml += '<td  style="text-align:right;">' + ProductValue_all.toFixed(2) + '</td>';
        strHtml += '<td  style="text-align:right;"></td>';
        strHtml += '<td  style="text-align:right;"></td>';
        strHtml += '<td  style="text-align:right;"></td>';
        strHtml += '<td  style="text-align:right;"></td>';
        strHtml += '<td  style="text-align:right;">' + MDMoney_all + '</td>';
        strHtml += '<td  style="text-align:right;"></td>';
        strHtml += '<td  style="text-align:right;"></td>';
        strHtml += '<td  style="text-align:right;">' + a_all + '</td>';
        strHtml += '<td  style="text-align:right;">' + b_all + '</td>';
        strHtml += '</tr>';





              
        strHtml += '</table></div>';
        document.getElementById("content-wrapper").innerHTML = strHtml;
        GetDeptName(1);

    }


    function search() {
        Info.length = 0;
        //alert("Str");
        var EquipmentName = document.getElementById("EquipmentName").value;

        var Str = "?act=initfixedassets&mname=" + membername + "&equipmentname=" + EquipmentName;
        //alert(Str);
        entity.PostStringInfo(Str, this, this.InfoCallBack);
      
     


    }


    function Add_FixedAssets() {
        url = "FixedAssets_add.aspx";
        //  window.open(url);
        window.open(url, null, "height=680,width=650,top=100,left=100,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no,status=no");
    }

    function GetDeptName(n) {

        //获取部门名称
        $.ajax({
            type: "post",
            async: false,
            url: "../Ashx/GetDept.ashx",
            data: { "admin": membername },
            datatype: "json",
            success: function (result) {
                eval("var transult=" + result);
                if (n == 1) {
                    document.getElementById("welcome").innerHTML = transult[0].data + "欢迎登录";
                }
                if (n == 2) {
                    document.getElementById("welcome2").innerHTML = transult[0].data + "欢迎登录";
                }
            },
            error: function (errorMsg) {
                alert(errorMsg.responseText);
                alert(errorMsg.status);
                alert("request data failed!!!");
            }
        });
    }


    function Show_qhh(num) {
        var parts = num.toString().split(".");
        parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return parts.join(".");
    }

    function Show_Red(num) {
        if (num==0) {
           return " ";
        }else if (num < 0) {
            return "<font color=red>" + Show_qhh(num) + "</font>";
        } else {
            return Show_qhh(num);
        }

    }
</script>
</head>
 <body onload="InitFixedAssets()" class="skin-blue sidebar-mini" style="height: auto; min-height: 100%;">



<div class="content-wrapper" id="Div1" style="margin-left:15px">

  <div><table style="border-collapse:collapse;width:99%;background:white;height:15px" border="1";>
   <tr><td  id="welcome" style="height:20px;text-align:center;font-size:10pt;font-weight:bold;width:200px;"></td>
   <td  style="width:700px;border-style:none">

<table class="choYea" width="600px"><td  style="height:24px;width:90px;text-align:center;">资产名称：</td><td ><input type="text" id="EquipmentName" value="" size="20"  /> <input type="button" name="btSure" id="btSure" onclick="search()" value="查询" style="width:50px; background-color:White; border:solid 1px lightgray;margin:2px;"/></td><td></td></table>

</td>
<td  style="height:20px;width:200px;text-align:center;font-size:12pt;font-weight:bold;background-color:#9CB75B;border-style:none">固定资产表</td></tr></table>
  
      <div  id="content-wrapper" style="min-height: 298px;">
 
      </div>
     </div>
  <div class="control-sidebar-bg"></div>
</div>

</body>
</html>
