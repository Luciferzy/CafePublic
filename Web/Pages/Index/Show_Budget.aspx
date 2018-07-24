<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Budget.aspx.cs" Inherits="Pages_Index_Budget" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>预算页面</title>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>

    <link  href="../../Styles/superTables.css" rel="stylesheet" />

    <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css"/>
    <link rel="stylesheet" href="../../dist/css/AdminLTE.css"/>
    <link rel="stylesheet" href="../../dist/css/skins/skin-blue.min.css"/>
    <link rel="stylesheet" href="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>
    <%-- <script src="../../Scripts/jquery.js" type="text/javascript"></script>--%>
     <script src="../../Scripts/jquery.min.js" type="text/javascript"></script>
     <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
     <style type="text/css">
         
         .jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;box-sizing: content-box;z-index: 10000;}.jqsfield { color: white;font:F 10px arial, san serif;text-align: left;}
     
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
 
  .altRow {
            background-color: #ddddff;
        }
        
        #tableOne
        {
            table-layout:fixed;
            }
        #tableOne td
        {
            width:20px;
        }
            
        #tableOne th
        {
            width:20px;
        }
            
        #tableTwo
        {
           table-layout:fixed;
        }
       #tableTwo th
       {
           width:20px;
       }
       
       .InputOne
       {
           width:100%;
           text-align:right;
           background-color:#bec7e9;
           border:none;
           }
            .InputOne2
       {
           width:100%;
           text-align:right;
           background-color:#9ddcce;
          
           }
             .InputOne3
       {
           width:95%;
           margin:1px;
           text-align:right;
           background-color:white;
          border-color:#A4B7C4;
          border-width:thin;
         
           
           }
           .Input
       {
           width:100%;
           text-align:right;
           background-color:white;
           }
           .InputTwo
           {
                width:100%;
           text-align:right;
           background-color:#bec7e9;
           border:none;
               }
            .InputTwo2
           {
                width:100%;
           text-align:right;
           background-color:#9ddcce;
               }
            .InputTwo3
           {
               width:95%;
           margin:1px;
           text-align:right;
           background-color:white;
          border-color:#A4B7C4;
          border-width:thin;
         
               }

            
     </style>
     
<!-- REQUIRED JS SCRIPTS -->
<%--固定表头表列--%>


     <%--<script type="text/javascript" src="../../Scripts/jquery-1.4.2.min.js"></script>--%>
    <script type="text/javascript" src="../../Scripts/superTables.js"></script>
    <script type="text/javascript" src="../../Scripts/jquery.superTable.js"></script>
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
    $(function () {
        $("#gv").toSuperTable({ width: "640px", height: "480px", fixedCols: 3 })
            .find("tr:even").addClass("altRow");
    });

    var entity = new RSearchEngine('../../GetXml.aspx');
    mname = "";
    Info = new Array();
    Month = new Array();
    Month2 = new Array();
    Total = new Array();
    var nowdate = new Date();
    var nowYear = nowdate.getFullYear();
    var passYear = nowYear - 1;
    var nowMonth = nowdate.getMonth() + 1;

    changeYear = 0;


    itemid = "";

    function InitBudget() {
        load_year();
        mname = getCookie("name");

        Grade = getCookie("grade");
        DeptName = getCookie("eptName");
        membername = getCookie("membername");

        Manager = getCookie("manager");

        checkname = getCookie("checkname");
      

        function Getmember() {
            var Str = "?act=getmember&checkname=" + checkname;
            entity.PostStringInfo(Str, this, this.InfoCallBack);
        }

        if (mname == "" || mname == null) {
            window.open("../../LogIn.aspx", "_top");
        }
        else {
            if (Grade == 0) {

                var Str = "?act=initbudget&mname=" + checkname + "&year=" + nowYear;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            if (Grade == 1) {

                var Str = "?act=initbudget&mname=" + checkname + "&year=" + nowYear;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            if (Grade == 5) {

                var Str = "?act=initbudget&mname=" + checkname + "&year=" + nowYear;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }

        }


    }

    function GetDeptName(n) {

        //获取部门名称
        $.ajax({
            type: "post",
            async: false,
            url: "../Ashx/GetDept.ashx",
            data: { "admin": checkname },
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

    function getCookie(name) {
        var strCookie = document.cookie;
        var arrCookie = strCookie.split("; ");
        for (var i = 0; i < arrCookie.length; i++) {
            var arr = arrCookie[i].split("=");
            if (arr[0] == name) return arr[1];
        }
        return "";
    }

    //下拉列表选中年份，根据年份显示数据
    function setYear() {

        var year = document.getElementById("year").value;
        var year2 = document.getElementById("year2").value;
        if (year > year2) {
            alert("开始时间不能大于结束时间!!!!");
            exit;
        }

        if (year2 - year > 1 || year - year2 > 1) {
            alert("时间区间不能超过3年!!!!");
        } else {
            if (year == year2) {
                var Str = "?act=getdatabyyear&year=" + year + "&mname=" + mname;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            } else {
                var Str = "?act=getdatabyyear2&year=" + year + "&year2=" + year2 + "&mname=" + mname;
                entity.PostStringInfo(Str, this, this.InfoCallBackTwo);
            }
        }
    }

    function InfoCallBack() {

        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var DeptCodeNode = xmldoc.getElementsByTagName("DeptCode");
                var ItemsNameNode = xmldoc.getElementsByTagName("ItemsName");

                var ItemsIdNode = xmldoc.getElementsByTagName("ItemsId");
                var cYearNode = xmldoc.getElementsByTagName("cYear");
                var JanPlanNode = xmldoc.getElementsByTagName("JanPlan");
                var JanRealNode = xmldoc.getElementsByTagName("JanReal");
                var FebPlanNode = xmldoc.getElementsByTagName("FebPlan");
                var FebRealNode = xmldoc.getElementsByTagName("FebReal");
                var MarPlanNode = xmldoc.getElementsByTagName("MarPlan");
                var MarRealNode = xmldoc.getElementsByTagName("MarReal");
                var AprPlanNode = xmldoc.getElementsByTagName("AprPlan");
                var AprRealNode = xmldoc.getElementsByTagName("AprReal");
                var MayPlanNode = xmldoc.getElementsByTagName("MayPlan");
                var MayRealNode = xmldoc.getElementsByTagName("MayReal");
                var JunPlanNode = xmldoc.getElementsByTagName("JunPlan");
                var JunRealNode = xmldoc.getElementsByTagName("JunReal");
                var JulPlanNode = xmldoc.getElementsByTagName("JulPlan");
                var JulRealNode = xmldoc.getElementsByTagName("JulReal");
                var AugPlanNode = xmldoc.getElementsByTagName("AugPlan");
                var AugRealNode = xmldoc.getElementsByTagName("AugReal");
                var SepPlanNode = xmldoc.getElementsByTagName("SepPlan");
                var SepRealNode = xmldoc.getElementsByTagName("SepReal");
                var OctPlanNode = xmldoc.getElementsByTagName("OctPlan");
                var OctRealNode = xmldoc.getElementsByTagName("OctReal");
                var NovPlanNode = xmldoc.getElementsByTagName("NovPlan");
                var NovRealNode = xmldoc.getElementsByTagName("NovReal");
                var DecPlanNode = xmldoc.getElementsByTagName("DecPlan");
                var DecRealNode = xmldoc.getElementsByTagName("DecReal");
                var AllCountNode = xmldoc.getElementsByTagName("allCount");
                var ItemsTypeNode = xmldoc.getElementsByTagName("ItemsType");
                var RollYearNode = xmldoc.getElementsByTagName("RollYear");
                var MonthAveNode = xmldoc.getElementsByTagName("MonthAve");
                var ColloectNode = xmldoc.getElementsByTagName("Colloect");
                var IsEditNode = xmldoc.getElementsByTagName("IsEdit");
           

                for (var i = 0; i < ItemsNameNode.length; i++) {
                    Info[i] = new Object();
                    Info[i].DeptCode = DeptCodeNode[i].childNodes.length > 0 ? DeptCodeNode[i].firstChild.nodeValue : "";
                    Info[i].ItemsName = ItemsNameNode[i].childNodes.length > 0 ? ItemsNameNode[i].firstChild.nodeValue : "";
                    Info[i].ItemsId = ItemsIdNode[i].childNodes.length > 0 ? ItemsIdNode[i].firstChild.nodeValue : "";
                    Info[i].cYear = cYearNode[i].childNodes.length > 0 ? cYearNode[i].firstChild.nodeValue : "";
                    Info[i].JanPlan = JanPlanNode[i].childNodes.length > 0 ? JanPlanNode[i].firstChild.nodeValue : "";
                    Info[i].JanReal = JanRealNode[i].childNodes.length > 0 ? JanRealNode[i].firstChild.nodeValue : "";
                    Info[i].FebPlan = FebPlanNode[i].childNodes.length > 0 ? FebPlanNode[i].firstChild.nodeValue : "";
                    Info[i].FebReal = FebRealNode[i].childNodes.length > 0 ? FebRealNode[i].firstChild.nodeValue : "";
                    Info[i].MarPlan = MarPlanNode[i].childNodes.length > 0 ? MarPlanNode[i].firstChild.nodeValue : "";
                    Info[i].MarReal = MarRealNode[i].childNodes.length > 0 ? MarRealNode[i].firstChild.nodeValue : "";
                    Info[i].AprPlan = AprPlanNode[i].childNodes.length > 0 ? AprPlanNode[i].firstChild.nodeValue : "";
                    Info[i].AprReal = AprRealNode[i].childNodes.length > 0 ? AprRealNode[i].firstChild.nodeValue : "";
                    Info[i].MayPlan = MayPlanNode[i].childNodes.length > 0 ? MayPlanNode[i].firstChild.nodeValue : "";
                    Info[i].MayReal = MayRealNode[i].childNodes.length > 0 ? MayRealNode[i].firstChild.nodeValue : "";
                    Info[i].JunPlan = JunPlanNode[i].childNodes.length > 0 ? JunPlanNode[i].firstChild.nodeValue : "";
                    Info[i].JunReal = JunRealNode[i].childNodes.length > 0 ? JunRealNode[i].firstChild.nodeValue : "";
                    Info[i].JulPlan = JulPlanNode[i].childNodes.length > 0 ? JulPlanNode[i].firstChild.nodeValue : "";
                    Info[i].JulReal = JulRealNode[i].childNodes.length > 0 ? JulRealNode[i].firstChild.nodeValue : "";
                    Info[i].AugPlan = AugPlanNode[i].childNodes.length > 0 ? AugPlanNode[i].firstChild.nodeValue : "";
                    Info[i].AugReal = AugRealNode[i].childNodes.length > 0 ? AugRealNode[i].firstChild.nodeValue : "";
                    Info[i].SepPlan = SepPlanNode[i].childNodes.length > 0 ? SepPlanNode[i].firstChild.nodeValue : "";
                    Info[i].SepReal = SepRealNode[i].childNodes.length > 0 ? SepRealNode[i].firstChild.nodeValue : "";
                    Info[i].OctPlan = OctPlanNode[i].childNodes.length > 0 ? OctPlanNode[i].firstChild.nodeValue : "";
                    Info[i].OctReal = OctRealNode[i].childNodes.length > 0 ? OctRealNode[i].firstChild.nodeValue : "";
                    Info[i].NovPlan = NovPlanNode[i].childNodes.length > 0 ? NovPlanNode[i].firstChild.nodeValue : "";
                    Info[i].NovReal = NovRealNode[i].childNodes.length > 0 ? NovRealNode[i].firstChild.nodeValue : "";
                    Info[i].DecPlan = DecPlanNode[i].childNodes.length > 0 ? DecPlanNode[i].firstChild.nodeValue : "";
                    Info[i].DecReal = DecRealNode[i].childNodes.length > 0 ? DecRealNode[i].firstChild.nodeValue : "";
                    Info[i].AllCount = AllCountNode[i].childNodes.length > 0 ? AllCountNode[i].firstChild.nodeValue : "";
                    Info[i].ItemsType = ItemsTypeNode[i].childNodes.length > 0 ? ItemsTypeNode[i].firstChild.nodeValue : "";
                    Info[i].RollYear = RollYearNode[i].childNodes.length > 0 ? RollYearNode[i].firstChild.nodeValue : "";
                    Info[i].MonthAve = MonthAveNode[i].childNodes.length > 0 ? MonthAveNode[i].firstChild.nodeValue : "";
                    Info[i].Colloect = ColloectNode[i].childNodes.length > 0 ? ColloectNode[i].firstChild.nodeValue : "";
                    Info[i].IsEdit = IsEditNode[i].childNodes.length > 0 ? IsEditNode[i].firstChild.nodeValue : "";

                }
                showInfo();
            }
        }
    }

    function InfoCallBackTwo() {

        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var ItemsNameNode = xmldoc.getElementsByTagName("ItemsName");
                var ItemsIdNode = xmldoc.getElementsByTagName("ItemsId");
                var IdNode = xmldoc.getElementsByTagName("Id1");
                var RollYearNode = xmldoc.getElementsByTagName("RollYear");
                var MonthAveNode = xmldoc.getElementsByTagName("MonthAve");
                var ColloectNode = xmldoc.getElementsByTagName("Colloect");
                var cYearNode = xmldoc.getElementsByTagName("cYear");
                var cYearNode2 = xmldoc.getElementsByTagName("year1");

                var JanPlanNode1 = xmldoc.getElementsByTagName("jp1");
                var JanRealNode1 = xmldoc.getElementsByTagName("jr1");
                var FebPlanNode1 = xmldoc.getElementsByTagName("fp1");
                var FebRealNode1 = xmldoc.getElementsByTagName("fr1");
                var MarPlanNode1 = xmldoc.getElementsByTagName("mrp1");
                var MarRealNode1 = xmldoc.getElementsByTagName("mrr1");
                var AprPlanNode1 = xmldoc.getElementsByTagName("ap1");
                var AprRealNode1 = xmldoc.getElementsByTagName("ar1");
                var MayPlanNode1 = xmldoc.getElementsByTagName("map1");
                var MayRealNode1 = xmldoc.getElementsByTagName("mar1");
                var JunPlanNode1 = xmldoc.getElementsByTagName("jnp1");
                var JunRealNode1 = xmldoc.getElementsByTagName("jnr1");
                var JulPlanNode1 = xmldoc.getElementsByTagName("jup1");
                var JulRealNode1 = xmldoc.getElementsByTagName("jur1");
                var AugPlanNode1 = xmldoc.getElementsByTagName("aup1");
                var AugRealNode1 = xmldoc.getElementsByTagName("aur1");
                var SepPlanNode1 = xmldoc.getElementsByTagName("sep1");
                var SepRealNode1 = xmldoc.getElementsByTagName("ser1");
                var OctPlanNode1 = xmldoc.getElementsByTagName("op1");
                var OctRealNode1 = xmldoc.getElementsByTagName("or1");
                var NovPlanNode1 = xmldoc.getElementsByTagName("np1");
                var NovRealNode1 = xmldoc.getElementsByTagName("nr1");
                var DecPlanNode1 = xmldoc.getElementsByTagName("dep1");
                var DecRealNode1 = xmldoc.getElementsByTagName("der1");
                var JanPlanNode = xmldoc.getElementsByTagName("JanPlan");
                var JanRealNode = xmldoc.getElementsByTagName("JanReal");
                var FebPlanNode = xmldoc.getElementsByTagName("FebPlan");
                var FebRealNode = xmldoc.getElementsByTagName("FebReal");
                var MarPlanNode = xmldoc.getElementsByTagName("MarPlan");
                var MarRealNode = xmldoc.getElementsByTagName("MarReal");
                var AprPlanNode = xmldoc.getElementsByTagName("AprPlan");
                var AprRealNode = xmldoc.getElementsByTagName("AprReal");
                var MayPlanNode = xmldoc.getElementsByTagName("MayPlan");
                var MayRealNode = xmldoc.getElementsByTagName("MayReal");
                var JunPlanNode = xmldoc.getElementsByTagName("JunPlan");
                var JunRealNode = xmldoc.getElementsByTagName("JunReal");
                var JulPlanNode = xmldoc.getElementsByTagName("JulPlan");
                var JulRealNode = xmldoc.getElementsByTagName("JulReal");
                var AugPlanNode = xmldoc.getElementsByTagName("AugPlan");
                var AugRealNode = xmldoc.getElementsByTagName("AugReal");
                var SepPlanNode = xmldoc.getElementsByTagName("SepPlan");
                var SepRealNode = xmldoc.getElementsByTagName("SepReal");
                var OctPlanNode = xmldoc.getElementsByTagName("OctPlan");
                var OctRealNode = xmldoc.getElementsByTagName("OctReal");
                var NovPlanNode = xmldoc.getElementsByTagName("NovPlan");
                var NovRealNode = xmldoc.getElementsByTagName("NovReal");
                var DecPlanNode = xmldoc.getElementsByTagName("DecPlan");
                var DecRealNode = xmldoc.getElementsByTagName("DecReal");
                var ItemsTypeNode = xmldoc.getElementsByTagName("ItemsType");

                for (var i = 0; i < ItemsNameNode.length; i++) {
                    Info[i] = new Object();
                    Info[i].ItemsName = ItemsNameNode[i].childNodes.length > 0 ? ItemsNameNode[i].firstChild.nodeValue : "";
                    Info[i].cYear = cYearNode[i].childNodes.length > 0 ? cYearNode[i].firstChild.nodeValue : "";
                    Info[i].cYear2 = cYearNode2[i].childNodes.length > 0 ? cYearNode2[i].firstChild.nodeValue : "";
                    Info[i].ItemsId = ItemsIdNode[i].childNodes.length > 0 ? ItemsIdNode[i].firstChild.nodeValue : "";
                    Info[i].Id = IdNode[i].childNodes.length > 0 ? IdNode[i].firstChild.nodeValue : "";

                    Info[i].jp1 = JanPlanNode1[i].childNodes.length > 0 ? JanPlanNode1[i].firstChild.nodeValue : "";
                    Info[i].jr1 = JanRealNode1[i].childNodes.length > 0 ? JanRealNode1[i].firstChild.nodeValue : "";
                    Info[i].fp1 = FebPlanNode1[i].childNodes.length > 0 ? FebPlanNode1[i].firstChild.nodeValue : "";
                    Info[i].fr1 = FebRealNode1[i].childNodes.length > 0 ? FebRealNode1[i].firstChild.nodeValue : "";
                    Info[i].mrp1 = MarPlanNode1[i].childNodes.length > 0 ? MarPlanNode1[i].firstChild.nodeValue : "";
                    Info[i].mrr1 = MarRealNode1[i].childNodes.length > 0 ? MarRealNode1[i].firstChild.nodeValue : "";
                    Info[i].ap1 = AprPlanNode1[i].childNodes.length > 0 ? AprPlanNode1[i].firstChild.nodeValue : "";
                    Info[i].ar1 = AprRealNode1[i].childNodes.length > 0 ? AprRealNode1[i].firstChild.nodeValue : "";
                    Info[i].map1 = MayPlanNode1[i].childNodes.length > 0 ? MayPlanNode1[i].firstChild.nodeValue : "";
                    Info[i].mar1 = MayRealNode1[i].childNodes.length > 0 ? MayRealNode1[i].firstChild.nodeValue : "";
                    Info[i].jnp1 = JunPlanNode1[i].childNodes.length > 0 ? JunPlanNode1[i].firstChild.nodeValue : "";
                    Info[i].jnr1 = JunRealNode1[i].childNodes.length > 0 ? JunRealNode1[i].firstChild.nodeValue : "";
                    Info[i].jup1 = JulPlanNode1[i].childNodes.length > 0 ? JulPlanNode1[i].firstChild.nodeValue : "";
                    Info[i].jur1 = JulRealNode1[i].childNodes.length > 0 ? JulRealNode1[i].firstChild.nodeValue : "";
                    Info[i].aup1 = AugPlanNode1[i].childNodes.length > 0 ? AugPlanNode1[i].firstChild.nodeValue : "";
                    Info[i].aur1 = AugRealNode1[i].childNodes.length > 0 ? AugRealNode1[i].firstChild.nodeValue : "";
                    Info[i].sep1 = SepPlanNode1[i].childNodes.length > 0 ? SepPlanNode1[i].firstChild.nodeValue : "";
                    Info[i].ser1 = SepRealNode1[i].childNodes.length > 0 ? SepRealNode1[i].firstChild.nodeValue : "";
                    Info[i].op1 = OctPlanNode1[i].childNodes.length > 0 ? OctPlanNode1[i].firstChild.nodeValue : "";
                    Info[i].or1 = OctRealNode1[i].childNodes.length > 0 ? OctRealNode1[i].firstChild.nodeValue : "";
                    Info[i].np1 = NovPlanNode1[i].childNodes.length > 0 ? NovPlanNode1[i].firstChild.nodeValue : "";
                    Info[i].nr1 = NovRealNode1[i].childNodes.length > 0 ? NovRealNode1[i].firstChild.nodeValue : "";
                    Info[i].dep1 = DecPlanNode1[i].childNodes.length > 0 ? DecPlanNode1[i].firstChild.nodeValue : "";
                    Info[i].der1 = DecRealNode1[i].childNodes.length > 0 ? DecRealNode1[i].firstChild.nodeValue : "";

                    Info[i].JanPlan = JanPlanNode[i].childNodes.length > 0 ? JanPlanNode[i].firstChild.nodeValue : "";
                    Info[i].JanReal = JanRealNode[i].childNodes.length > 0 ? JanRealNode[i].firstChild.nodeValue : "";
                    Info[i].FebPlan = FebPlanNode[i].childNodes.length > 0 ? FebPlanNode[i].firstChild.nodeValue : "";
                    Info[i].FebReal = FebRealNode[i].childNodes.length > 0 ? FebRealNode[i].firstChild.nodeValue : "";
                    Info[i].MarPlan = MarPlanNode[i].childNodes.length > 0 ? MarPlanNode[i].firstChild.nodeValue : "";
                    Info[i].MarReal = MarRealNode[i].childNodes.length > 0 ? MarRealNode[i].firstChild.nodeValue : "";
                    Info[i].AprPlan = AprPlanNode[i].childNodes.length > 0 ? AprPlanNode[i].firstChild.nodeValue : "";
                    Info[i].AprReal = AprRealNode[i].childNodes.length > 0 ? AprRealNode[i].firstChild.nodeValue : "";
                    Info[i].MayPlan = MayPlanNode[i].childNodes.length > 0 ? MayPlanNode[i].firstChild.nodeValue : "";
                    Info[i].MayReal = MayRealNode[i].childNodes.length > 0 ? MayRealNode[i].firstChild.nodeValue : "";
                    Info[i].JunPlan = JunPlanNode[i].childNodes.length > 0 ? JunPlanNode[i].firstChild.nodeValue : "";
                    Info[i].JunReal = JunRealNode[i].childNodes.length > 0 ? JunRealNode[i].firstChild.nodeValue : "";
                    Info[i].JulPlan = JulPlanNode[i].childNodes.length > 0 ? JulPlanNode[i].firstChild.nodeValue : "";
                    Info[i].JulReal = JulRealNode[i].childNodes.length > 0 ? JulRealNode[i].firstChild.nodeValue : "";
                    Info[i].AugPlan = AugPlanNode[i].childNodes.length > 0 ? AugPlanNode[i].firstChild.nodeValue : "";
                    Info[i].AugReal = AugRealNode[i].childNodes.length > 0 ? AugRealNode[i].firstChild.nodeValue : "";
                    Info[i].SepPlan = SepPlanNode[i].childNodes.length > 0 ? SepPlanNode[i].firstChild.nodeValue : "";
                    Info[i].SepReal = SepRealNode[i].childNodes.length > 0 ? SepRealNode[i].firstChild.nodeValue : "";
                    Info[i].OctPlan = OctPlanNode[i].childNodes.length > 0 ? OctPlanNode[i].firstChild.nodeValue : "";
                    Info[i].OctReal = OctRealNode[i].childNodes.length > 0 ? OctRealNode[i].firstChild.nodeValue : "";
                    Info[i].NovPlan = NovPlanNode[i].childNodes.length > 0 ? NovPlanNode[i].firstChild.nodeValue : "";
                    Info[i].NovReal = NovRealNode[i].childNodes.length > 0 ? NovRealNode[i].firstChild.nodeValue : "";
                    Info[i].DecPlan = DecPlanNode[i].childNodes.length > 0 ? DecPlanNode[i].firstChild.nodeValue : "";
                    Info[i].DecReal = DecRealNode[i].childNodes.length > 0 ? DecRealNode[i].firstChild.nodeValue : "";

                    Info[i].ItemsType = ItemsTypeNode[i].childNodes.length > 0 ? ItemsTypeNode[i].firstChild.nodeValue : "";
                    Info[i].RollYear = RollYearNode[i].childNodes.length > 0 ? RollYearNode[i].firstChild.nodeValue : "";
                    Info[i].MonthAve = MonthAveNode[i].childNodes.length > 0 ? MonthAveNode[i].firstChild.nodeValue : "";
                    Info[i].Colloect = ColloectNode[i].childNodes.length > 0 ? ColloectNode[i].firstChild.nodeValue : "";

                }
                showInfoTwo();
            }
        }
    }

    function ShowP(n) {
        if (n < nowMonth) {
            var id = n - 1;
            alert(id);
            document.getElementById(id + "M").style.display = 'none';
        }
    }

    function showInfo() {


        var strHtml =

        '<table id="gv" cellspacing="0" rules="all"   style="border-collapse:collapse;width:1500px;background:#f4f5f7;font-size:9pt;" border="1";><tr>' +
    '<th style="width:1%;text-align:center;">序</th>' +
    '<th style="width:6%;text-align:center;">项目</th>' +
    '<th style="width:3%;text-align:center;">滚动年</th>' +
    '<th style="width:3%;text-align:center;">月均值</th>' +
    '<th style="width:3%;text-align:center;">汇总</th>' +
    '<th id="0M" value="0M"  style="width:3%;text-align:center;cursor:pointer">1p</th>' +
    '<th id="1M" value="1M"  style="width:3%;text-align:center;cursor:pointer">1R</th>' +
    '<th id="2M" value="2M"  style="width:3%;text-align:center;cursor:pointer">2P</th>' +
    '<th id="3M" value="3M"  style="width:3%;text-align:center;cursor:pointer">2R</th>' +
    '<th id="4M" value="4M"  style="width:3%;text-align:center;cursor:pointer">3P</th>' +
    '<th id="5M" value="5M"  style="width:3%;text-align:center;cursor:pointer">3R</th>' +
    '<th id="6M" value="6M"  style="width:3%;text-align:center;cursor:pointer">4P</th>' +
    '<th id="7M" value="7M"  style="width:3%;text-align:center;cursor:pointer">4R</th>' +
    '<th id="8M" value="8M"  style="width:3%;text-align:center;cursor:pointer">5P</th>' +
    '<th id="9M" value="9M"  style="width:3%;text-align:center;cursor:pointer">5R</th>' +
    '<th id="10M" value="10M"  style="width:3%;text-align:center;cursor:pointer">6P</th>' +
    '<th id="11M" value="11M"  style="width:3%;text-align:center;cursor:pointer">6R</th>' +
    '<th id="12M" value="12M"  style="width:3%;text-align:center;cursor:pointer">7P</th>' +
    '<th id="13M" value="13M"  style="width:3%;text-align:center;cursor:pointer">7R</th>' +
    '<th id="14M" value="14M"  style="width:3%;text-align:center;cursor:pointer">8P</th>' +
    '<th id="15M" value="15M"  style="width:3%;text-align:center;cursor:pointer">8R</th>' +
    '<th id="16M" value="16M"  style="width:3%;text-align:center;cursor:pointer">9P</th>' +
    '<th id="17M" value="17M"  style="width:3%;text-align:center;cursor:pointer">9R</th>' +
    '<th id="18M" value="18M"  style="width:3%;text-align:center;cursor:pointer">10P</th>' +
    '<th id="19M" value="19M"  style="width:3%;text-align:center;cursor:pointer">10R</th>' +
    '<th id="20M" value="20M"  style="width:3%;text-align:center;cursor:pointer">11P</th>' +
    '<th id="21M" value="21M"  style="width:3%;text-align:center;cursor:pointer">11R</th>' +
    '<th id="22M" value="22M"  style="width:3%;text-align:center;cursor:pointer">12P</th>' +
    '<th id="23M" value="23M"  style="width:3%;text-align:center;cursor:pointer">12R</th></tr>';

        for (var i = 0; i < Info.length; i++) {

            var total1 = parseFloat(Info[i].JanPlan) + parseFloat(Info[i].FebPlan) + parseFloat(Info[i].MarPlan) + parseFloat(Info[i].AprPlan) + parseFloat(Info[i].MayPlan) + parseFloat(Info[i].JunPlan) + parseFloat(Info[i].JulPlan) + parseFloat(Info[i].AugPlan) + parseFloat(Info[i].SepPlan) + parseFloat(Info[i].OctPlan) + parseFloat(Info[i].NovPlan) + parseFloat(Info[i].DecPlan);

            if (Info[i].IsEdit == 1 ) {
                document.getElementById("btSureEdit").style.display = '';
                document.getElementById("btSure").style.display = '';
            } else {
                document.getElementById("btSureEdit").style.display = 'none';
                document.getElementById("btSure").style.display = 'none';
            }

            if (Info[i].ItemsType == 2) {
                strHtml += '<tr>' +
                        '<td style="text-align:center;">' + i + '</td>' +
                        '<td id="It' + i + '" style="text-align:center;background:lightblue">' + Info[i].ItemsName + '</td>' +
                        '<td id="rol' + i + '" style="text-align:right;"><input readonly="readonly" class="InputOne" id="' + Info[i].cYear + 'RollYear' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].RollYear).toFixed(2) + '" /></td>' +

                        '<td id="ave' + i + '" style="text-align:right;">' + parseFloat(Info[i].RollYear / 12).toFixed(2) + '</td>' +
                        '<td id="colec' + i + '" style="text-align:right;">' + total1.toFixed(2) + '</td>' +
                        '<td id="0M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'JanPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JanPlan).toFixed(2) + '"/></td>' +
                        '<td id="1M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'JanReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JanReal).toFixed(2) + '"/></td>' +
                        '<td id="2M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'FebPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].FebPlan).toFixed(2) + '"/></td>' +
                        '<td id="3M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'FebReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].FebReal).toFixed(2) + '"/></td>' +
                        '<td id="4M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'MarPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MarPlan).toFixed(2) + '"/></td>' +
                        '<td id="5M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'MarReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MarReal).toFixed(2) + '"/></td>' +
                        '<td id="6M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'AprPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AprPlan).toFixed(2) + '"/></td>' +
                        '<td id="7M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'AprReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AprReal).toFixed(2) + '"/></td>' +
                        '<td id="8M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'MayPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MayPlan).toFixed(2) + '"/></td>' +
                        '<td id="9M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'MayReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MayReal).toFixed(2) + '"/></td>' +
                        '<td id="10M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'JunPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JunPlan).toFixed(2) + '"/></td>' +
                        '<td id="11M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'JunReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JunReal).toFixed(2) + '"/></td>' +
                        '<td id="12M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'JulPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JulPlan).toFixed(2) + '"/></td>' +
                        '<td id="13M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'JulReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JulReal).toFixed(2) + '"/></td>' +
                        '<td id="14M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'AugPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AugPlan).toFixed(2) + '"/></td>' +
                        '<td id="15M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'AugReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AugReal).toFixed(2) + '"/></td>' +
                        '<td id="16M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'SepPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].SepPlan).toFixed(2) + '"/></td>' +
                        '<td id="17M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'SepReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].SepReal).toFixed(2) + '"/></td>' +
                        '<td id="18M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'OctPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].OctPlan).toFixed(2) + '"/></td>' +
                        '<td id="19M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'OctReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].OctReal).toFixed(2) + '"/></td>' +
                        '<td id="20M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'NovPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].NovPlan).toFixed(2) + '"/></td>' +
                        '<td id="21M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'NovReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].NovReal).toFixed(2) + '"/></td>' +
                        '<td id="22M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'DecPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].DecPlan).toFixed(2) + '"/></td>' +
                        '<td id="23M' + i + '" ><input class="InputOne" readonly="readonly" id="' + Info[i].cYear + 'DecReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].DecReal).toFixed(2) + '"/></td></tr>';
            }



            if (Info[i].ItemsType == 3) {
                var profits1P = parseFloat(Info[i - 1].JanPlan) - parseFloat(Info[i - 41].JanPlan);
                var profits1R = parseFloat(Info[i - 1].JanReal) - parseFloat(Info[i - 41].JanReal);
                var profits2P = parseFloat(Info[i - 1].FebPlan) - parseFloat(Info[i - 41].FebPlan);
                var profits2R = parseFloat(Info[i - 1].FebReal) - parseFloat(Info[i - 41].FebReal);
                var profits3P = parseFloat(Info[i - 1].MarPlan) - parseFloat(Info[i - 41].MarPlan);
                var profits3R = parseFloat(Info[i - 1].MarReal) - parseFloat(Info[i - 41].MarReal);
                var profits4P = parseFloat(Info[i - 1].AprPlan) - parseFloat(Info[i - 41].AprPlan);
                var profits4R = parseFloat(Info[i - 1].AprReal) - parseFloat(Info[i - 41].AprReal);
                var profits5P = parseFloat(Info[i - 1].MayPlan) - parseFloat(Info[i - 41].MayPlan);
                var profits5R = parseFloat(Info[i - 1].MayReal) - parseFloat(Info[i - 41].MayReal);
                var profits6P = parseFloat(Info[i - 1].JunPlan) - parseFloat(Info[i - 41].JunPlan);
                var profits6R = parseFloat(Info[i - 1].JunReal) - parseFloat(Info[i - 41].JunReal);
                var profits7P = parseFloat(Info[i - 1].JulPlan) - parseFloat(Info[i - 41].JulPlan);
                var profits7R = parseFloat(Info[i - 1].JulReal) - parseFloat(Info[i - 41].JulReal);
                var profits8P = parseFloat(Info[i - 1].AugPlan) - parseFloat(Info[i - 41].AugPlan);
                var profits8R = parseFloat(Info[i - 1].AugReal) - parseFloat(Info[i - 41].AugReal);
                var profits9P = parseFloat(Info[i - 1].SepPlan) - parseFloat(Info[i - 41].SepPlan);
                var profits9R = parseFloat(Info[i - 1].SepReal) - parseFloat(Info[i - 41].SepReal);
                var profits10P = parseFloat(Info[i - 1].OctPlan) - parseFloat(Info[i - 41].OctPlan);
                var profits10R = parseFloat(Info[i - 1].OctReal) - parseFloat(Info[i - 41].OctReal);
                var profits11P = parseFloat(Info[i - 1].NovPlan) - parseFloat(Info[i - 41].NovPlan);
                var profits11R = parseFloat(Info[i - 1].NovReal) - parseFloat(Info[i - 41].NovReal);
                var profits12P = parseFloat(Info[i - 1].DecPlan) - parseFloat(Info[i - 41].DecPlan);
                var profits12R = parseFloat(Info[i - 1].DecReal) - parseFloat(Info[i - 41].DecReal);



                strHtml += '<tr>' +
                        '<td style="text-align:center;">' + i + '</td>' +
                        '<td id="It' + i + '" style="text-align:center;">' + Info[i].ItemsName + '</td>' +
                        '<td id="rol' + i + '" style="text-align:right;"><input  readonly="readonly" class="InputOne2" style="border:none;border-color:#A4B7C4" border="1px" id="' + Info[i].cYear + 'RollYear' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].RollYear).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"/></td>' +
                        '<td id="ave' + i + '" style="text-align:right;">' + parseFloat(Info[i].RollYear / 12).toFixed(2) + '</td>' +
                        '<td id="colec' + i + '" style="text-align:right;">' + total1.toFixed(2) + '</td>' +
                        '<td id="0M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'JanPlan' + Info[i].ItemsId + '" value="' + profits1P.toFixed(2) + '"/></td>' +
                        '<td id="1M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'JanReal' + Info[i].ItemsId + '" value="' + profits1R.toFixed(2) + '"/></td>' +
                        '<td id="2M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'FebPlan' + Info[i].ItemsId + '" value="' + profits2P.toFixed(2) + '"/></td>' +
                        '<td id="3M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'FebReal' + Info[i].ItemsId + '" value="' + profits2R.toFixed(2) + '"/></td>' +
                        '<td id="4M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'MarPlan' + Info[i].ItemsId + '" value="' + profits3P.toFixed(2) + '"/></td>' +
                        '<td id="5M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'MarReal' + Info[i].ItemsId + '" value="' + profits3R.toFixed(2) + '"/></td>' +
                        '<td id="6M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'AprPlan' + Info[i].ItemsId + '" value="' + profits4P.toFixed(2) + '"/></td>' +
                        '<td id="7M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'AprReal' + Info[i].ItemsId + '" value="' + profits4R.toFixed(2) + '"/></td>' +
                        '<td id="8M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'MayPlan' + Info[i].ItemsId + '" value="' + profits5P.toFixed(2) + '"/></td>' +
                        '<td id="9M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'MayReal' + Info[i].ItemsId + '" value="' + profits5R.toFixed(2) + '"/></td>' +
                        '<td id="10M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'JunPlan' + Info[i].ItemsId + '" value="' + profits6P.toFixed(2) + '"/></td>' +
                        '<td id="11M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'JunReal' + Info[i].ItemsId + '" value="' + profits6R.toFixed(2) + '"/></td>' +
                        '<td id="12M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'JulPlan' + Info[i].ItemsId + '" value="' + profits7P.toFixed(2) + '"/></td>' +
                        '<td id="13M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'JulReal' + Info[i].ItemsId + '" value="' + profits7R.toFixed(2) + '"/></td>' +
                        '<td id="14M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'AugPlan' + Info[i].ItemsId + '" value="' + profits8P.toFixed(2) + '"/></td>' +
                        '<td id="15M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'AugReal' + Info[i].ItemsId + '" value="' + profits8R.toFixed(2) + '"/></td>' +
                        '<td id="16M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'SepPlan' + Info[i].ItemsId + '" value="' + profits9P.toFixed(2) + '"/></td>' +
                        '<td id="17M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'SepReal' + Info[i].ItemsId + '" value="' + profits9R.toFixed(2) + '"/></td>' +
                        '<td id="18M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'OctPlan' + Info[i].ItemsId + '" value="' + profits10P.toFixed(2) + '"/></td>' +
                        '<td id="19M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'OctReal' + Info[i].ItemsId + '" value="' + profits10R.toFixed(2) + '"/></td>' +
                        '<td id="20M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'NovPlan' + Info[i].ItemsId + '" value="' + profits11P.toFixed(2) + '"/></td>' +
                        '<td id="21M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'NovReal' + Info[i].ItemsId + '" value="' + profits11R.toFixed(2) + '"/></td>' +
                        '<td id="22M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'DecPlan' + Info[i].ItemsId + '" value="' + profits12P.toFixed(2) + '"/></td>' +
                        '<td id="23M' + i + '" ><input style="border:none" class="InputOne2" readonly="readonly" id="' + Info[i].cYear + 'DecReal' + Info[i].ItemsId + '" value="' + profits12R.toFixed(2) + '"/></td></tr>';
            }

            if (Info[i].ItemsType != 2 && Info[i].ItemsType != 3) {

                strHtml += '<tr>' +
                        '<td style="text-align:center;">' + i + '</td>' +
                        '<td id="It' + i + '" style="text-align:center;">' + Info[i].ItemsName + '</td>' +
                        '<td id="rol' + i + '" style="text-align:right;background-color:#f4f5f7"><input readonly="readonly" style="border:none;background-color:#f4f5f7" class="InputOne3" id="' + Info[i].cYear + 'RollYear' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].RollYear).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"/></td>' +
                        '<td id="ave' + i + '" style="text-align:right;">' + parseFloat(Info[i].RollYear / 12).toFixed(2) + '</td>' +
                        '<td id="colec' + i + '" style="text-align:right;">' + total1.toFixed(2) + '</td>' +
                        '<td id="0M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'JanPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JanPlan).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';


                if (nowMonth > 1 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="1M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'JanReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JanReal).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 1 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }


                strHtml += '<td id="2M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'FebPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].FebPlan).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';
                if (nowMonth > 2 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="3M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'FebReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].FebReal).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 2 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }


                strHtml += '<td id="4M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'MarPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MarPlan).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 3 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="5M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'MarReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MarReal).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 3 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly"/></td>';
                    }
                }


                strHtml += '<td id="6M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'AprPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AprPlan).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 4 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }


                strHtml += '<td id="7M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'AprReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AprReal).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';
                if (nowMonth > 4 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }


                strHtml += '<td id="8M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'MayPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MayPlan).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';
                if (nowMonth > 5 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }


                strHtml += '<td id="9M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'MayReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MayReal).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';
                if (nowMonth > 5 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }



                strHtml += '<td id="10M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'JunPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JunPlan).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 6 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }


                strHtml += '<td id="11M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'JunReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JunReal).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 6 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="12M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'JulPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JulPlan).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 7 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="13M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'JulReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JulReal).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';
                if (nowMonth > 7 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }


                strHtml += '<td id="14M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'AugPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AugPlan).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 8 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="15M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'AugReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AugReal).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 8 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }


                strHtml += '<td id="16M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'SepPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].SepPlan).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 9 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="17M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'SepReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].SepReal).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 9 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }


                strHtml += '<td id="18M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'OctPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].OctPlan).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 10 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }


                strHtml += '<td id="19M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'OctReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].OctReal).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 10 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }


                strHtml += '<td id="20M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'NovPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].NovPlan).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 11 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }


                strHtml += '<td id="21M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'NovReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].NovReal).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 11 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }


                strHtml += '<td id="22M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'DecPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].DecPlan).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 12 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="23M' + i + '" ><input class="InputOne3" id="' + Info[i].cYear + 'DecReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].DecReal).toFixed(2) + '"/ onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';
                if (nowMonth > 12 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:white;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '</tr>';
            }
        }
        strHtml += '<tr>' +
        '<th style="width:1%;text-align:center;">序</th>' +
    '<th style="width:5%;text-align:center;">项目</th>' +
    '<th style="width:3%;text-align:center;">滚动年</th>' +
    '<th style="width:3%;text-align:center;">月均值</th>' +
    '<th style="width:3%;text-align:center;">汇总</th>' +
    '<th id="0M" value="0M"  style="width:3%;text-align:center;cursor:pointer">1P</th>' +
    '<th id="1M" value="1M"  style="width:3%;text-align:center;cursor:pointer">1R</th>' +
    '<th id="2M" value="2M"  style="width:3%;text-align:center;cursor:pointer">2P</th>' +
    '<th id="3M" value="3M"  style="width:3%;text-align:center;cursor:pointer">2R</th>' +
    '<th id="4M" value="4M"  style="width:3%;text-align:center;cursor:pointer">3P</th>' +
    '<th id="5M" value="5M"  style="width:3%;text-align:center;cursor:pointer">3R</th>' +
    '<th id="6M" value="6M"  style="width:3%;text-align:center;cursor:pointer">4P</th>' +
    '<th id="7M" value="7M"  style="width:3%;text-align:center;cursor:pointer">4R</th>' +
    '<th id="8M" value="8M"  style="width:3%;text-align:center;cursor:pointer">5P</th>' +
    '<th id="9M" value="9M"  style="width:3%;text-align:center;cursor:pointer">5R</th>' +
    '<th id="10M" value="10M"  style="width:3%;text-align:center;cursor:pointer">6P</th>' +
    '<th id="11M" value="11M"  style="width:3%;text-align:center;cursor:pointer">6R</th>' +
    '<th id="12M" value="12M"  style="width:3%;text-align:center;cursor:pointer">7P</th>' +
    '<th id="13M" value="13M"  style="width:3%;text-align:center;cursor:pointer">7R</th>' +
    '<th id="14M" value="14M"  style="width:3%;text-align:center;cursor:pointer">8P</th>' +
    '<th id="15M" value="15M"  style="width:3%;text-align:center;cursor:pointer">8R</th>' +
    '<th id="16M" value="16M"  style="width:3%;text-align:center;cursor:pointer">9P</th>' +
    '<th id="17M" value="17M"  style="width:3%;text-align:center;cursor:pointer">9R</th>' +
    '<th id="18M" value="18M"  style="width:3%;text-align:center;cursor:pointer">10P</th>' +
    '<th id="19M" value="19M"  style="width:3%;text-align:center;cursor:pointer">10R</th>' +
    '<th id="20M" value="20M"  style="width:3%;text-align:center;cursor:pointer">11P</th>' +
    '<th id="21M" value="21M"  style="width:3%;text-align:center;cursor:pointer">11R</th>' +
    '<th id="22M" value="22M"  style="width:3%;text-align:center;cursor:pointer">12P</th>' +
    '<th id="23M" value="23M"  style="width:3%;text-align:center;cursor:pointer">12R</th></tr></table>';

        document.getElementById("content-wrapper").innerHTML = strHtml;
        ChangeColor(23);
        GetDeptName(1);
        ShouZhiCha();
    }

    function showInfoTwo() {

        var strHtml =

        '<table id="tableTwo" style="border-collapse:collapse;width:2500px;background:#f4f5f7;font-size:9pt" border="1"><tr>' +
    '<th style="width:2%;text-align:center;">序</th>' +
    '<th style="width:10%;text-align:center;word-wrap:break-word">项目</th>' +
    '<th style="width:5%;text-align:center;">滚动年</th>' +
    '<th style="width:6%;text-align:center;">月均值</th>' +
    '<th style="width:5%;text-align:center;">汇总</th>' +
    '<th id="0M" value="0M"  style="width:5%;text-align:center;cursor:pointer">1p</th>' +
    '<th id="1M" value="1M" style="width:5%;text-align:center;cursor:pointer">1R</th>' +
    '<th id="2M" value="2M"  style="width:5%;text-align:center;cursor:pointer">2P</th>' +
    '<th id="3M" value="3M"  style="width:5%;text-align:center;cursor:pointer">2R</th>' +
    '<th id="4M" value="4M"  style="width:5%;text-align:center;cursor:pointer">3P</th>' +
    '<th id="5M" value="5M"  style="width:5%;text-align:center;cursor:pointer">3R</th>' +
    '<th id="6M" value="6M"  style="width:5%;text-align:center;cursor:pointer">4P</th>' +
    '<th id="7M" value="7M"  style="width:5%;text-align:center;cursor:pointer">4R</th>' +
    '<th id="8M" value="8M"  style="width:5%;text-align:center;cursor:pointer">5P</th>' +
    '<th id="9M" value="9M"  style="width:5%;text-align:center;cursor:pointer">5R</th>' +
    '<th id="10M" value="10M"  style="width:5%;text-align:center;cursor:pointer">6P</th>' +
    '<th id="11M" value="11M"  style="width:5%;text-align:center;cursor:pointer">6R</th>' +
    '<th id="12M" value="12M"  style="width:5%;text-align:center;cursor:pointer">7P</th>' +
    '<th id="13M" value="13M"  style="width:5%;text-align:center;cursor:pointer">7R</th>' +
    '<th id="14M" value="14M"  style="width:5%;text-align:center;cursor:pointer">8P</th>' +
    '<th id="15M" value="15M"  style="width:5%;text-align:center;cursor:pointer">8R</th>' +
    '<th id="16M" value="16M"  style="width:5%;text-align:center;cursor:pointer">9P</th>' +
    '<th id="17M" value="17M"  style="width:5%;text-align:center;cursor:pointer">9R</th>' +
    '<th id="18M" value="18M"  style="width:5%;text-align:center;cursor:pointer">10P</th>' +
    '<th id="19M" value="19M"  style="width:5%;text-align:center;cursor:pointer">10R</th>' +
    '<th id="20M" value="20M"  style="width:5%;text-align:center;cursor:pointer">11P</th>' +
    '<th id="21M" value="21M"  style="width:5%;text-align:center;cursor:pointer">11R</th>' +
    '<th id="22M" value="22M"  style="width:5%;text-align:center;cursor:pointer">12P</th>' +
    '<th id="23M" value="23M"  style="width:5%;text-align:center;cursor:pointer">12R</th>' +
    '<th style="width:1%;border:none;background-color:white"></th>' +
    '<th id="24M" value="24M"  style="width:5%;text-align:center;cursor:pointer">1P</th>' +
    '<th id="25M" value="25M"  style="width:5%;text-align:center;cursor:pointer">1R</th>' +
    '<th id="26M" value="26M"  style="width:5%;text-align:center;cursor:pointer">2P</th>' +
    '<th id="27M" value="27M"  style="width:5%;text-align:center;cursor:pointer">2R</th>' +
    '<th id="28M" value="28M"  style="width:5%;text-align:center;cursor:pointer">3P</th>' +
    '<th id="29M" value="29M"  style="width:5%;text-align:center;cursor:pointer">3R</th>' +
    '<th id="30M" value="30M"  style="width:5%;text-align:center;cursor:pointer">4P</th>' +
    '<th id="31M" value="31M"  style="width:5%;text-align:center;cursor:pointer">4R</th>' +
    '<th id="32M" value="32M"  style="width:5%;text-align:center;cursor:pointer">5P</th>' +
    '<th id="33M" value="33M"  style="width:5%;text-align:center;cursor:pointer">5R</th>' +
    '<th id="34M" value="34M"  style="width:5%;text-align:center;cursor:pointer">6P</th>' +
    '<th id="35M" value="35M"  style="width:5%;text-align:center;cursor:pointer">6R</th>' +
    '<th id="36M" value="36M"  style="width:5%;text-align:center;cursor:pointer">7P</th>' +
    '<th id="37M" value="37M"  style="width:5%;text-align:center;cursor:pointer">7R</th>' +
    '<th id="38M" value="38M"  style="width:5%;text-align:center;cursor:pointer">8P</th>' +
    '<th id="39M" value="39M"  style="width:5%;text-align:center;cursor:pointer">8R</th>' +
    '<th id="40M" value="40M"  style="width:5%;text-align:center;cursor:pointer">9P</th>' +
    '<th id="41M" value="41M"  style="width:5%;text-align:center;cursor:pointer">9R</th>' +
    '<th id="42M" value="42M"  style="width:5%;text-align:center;cursor:pointer">10P</th>' +
    '<th id="43M" value="43M"  style="width:5%;text-align:center;cursor:pointer">10R</th>' +
    '<th id="44M" value="44M"  style="width:5%;text-align:center;cursor:pointer">11P</th>' +
    '<th id="45M" value="45M"  style="width:5%;text-align:center;cursor:pointer">11R</th>' +
    '<th id="46M" value="46M"  style="width:5%;text-align:center;cursor:pointer">12P</th>' +
    '<th id="47M" value="47M"  style="width:5%;text-align:center;cursor:pointer">12R</th></tr>';

        for (var i = 0; i < Info.length; i++) {

            var total1 = parseFloat(Info[i].jp1) + parseFloat(Info[i].fp1) + parseFloat(Info[i].mrp1) + parseFloat(Info[i].ap1) + parseFloat(Info[i].map1) + parseFloat(Info[i].jnp1) + parseFloat(Info[i].jup1) + parseFloat(Info[i].aup1) + parseFloat(Info[i].sep1) + parseFloat(Info[i].op1) + parseFloat(Info[i].np1) + parseFloat(Info[i].dep1) + parseFloat(Info[i].JanPlan) + parseFloat(Info[i].FebPlan) + parseFloat(Info[i].MarPlan) + parseFloat(Info[i].AprPlan) + parseFloat(Info[i].MayPlan) + parseFloat(Info[i].JunPlan) + parseFloat(Info[i].JulPlan) + parseFloat(Info[i].AugPlan) + parseFloat(Info[i].SepPlan) + parseFloat(Info[i].OctPlan) + parseFloat(Info[i].NovPlan) + parseFloat(Info[i].DecPlan);


            if (Info[i].ItemsType == 2) {
                strHtml += '<tr>' +
                        '<td style="text-align:center;">' + i + '</td>' +
                        '<td id="It' + i + '" style="text-align:center;">' + Info[i].ItemsName + '</td>' +





                       '<td id="rol' + i + '" style="text-align:right;"><input readonly="readonly" class="InputTwo" id="' + Info[i].cYear + 'RollYear' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].RollYear).toFixed(2) + '" onchange="FucAdd(this)"/></td>' +
                        '<td id="ave' + i + '" style="text-align:right;">' + parseFloat(Info[i].RollYear / 12).toFixed(2) + '</td>' +
                        '<td id="colec' + i + '" style="text-align:right;">' + total1.toFixed(2) + '</td>' +
                          '<td id="0M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'jp1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].jp1).toFixed(2) + '"/></td>' +
                        '<td id="1M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'jr1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].jr1).toFixed(2) + '"/></td>' +
                        '<td id="2M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'fp1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].fp1).toFixed(2) + '"/></td>' +
                        '<td id="3M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'fr1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].fr1).toFixed(2) + '"/></td>' +
                        '<td id="4M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'mrp1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].mrp1).toFixed(2) + '"/></td>' +
                        '<td id="5M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'mrr1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].mrr1).toFixed(2) + '"/></td>' +
                        '<td id="6M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'ap1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].ap1).toFixed(2) + '"/></td>' +
                        '<td id="7M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'ar1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].ar1).toFixed(2) + '"/></td>' +
                        '<td id="8M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'amp1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].map1).toFixed(2) + '"/></td>' +
                        '<td id="9M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'mar1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].mar1).toFixed(2) + '"/></td>' +
                        '<td id="10M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'jnp1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].jnp1).toFixed(2) + '"/></td>' +
                        '<td id="11M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'jnr1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].jnr1).toFixed(2) + '"/></td>' +
                        '<td id="12M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'jup1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].jup1).toFixed(2) + '"/></td>' +
                        '<td id="13M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'jur1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].jur1).toFixed(2) + '"/></td>' +
                        '<td id="14M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'aup1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].aup1).toFixed(2) + '"/></td>' +
                        '<td id="15M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'aur1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].aur1).toFixed(2) + '"/></td>' +
                        '<td id="16M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'sep1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].sep1).toFixed(2) + '"/></td>' +
                        '<td id="17M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'ser1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].ser1).toFixed(2) + '"/></td>' +
                        '<td id="18M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'op1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].op1).toFixed(2) + '"/></td>' +
                        '<td id="19M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'or1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].or1).toFixed(2) + '"/></td>' +
                        '<td id="20M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'np1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].np1).toFixed(2) + '"/></td>' +
                        '<td id="21M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'nr1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].nr1).toFixed(2) + '"/></td>' +
                        '<td id="22M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'dep1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].dep1).toFixed(2) + '"/></td>' +
                        '<td id="23M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear2 + 'der1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].der1).toFixed(2) + '"/></td>' +
                         '<td style="border:none;background-color:white"></td>' +
                        '<td id="24M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'JanPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JanPlan).toFixed(2) + '"/></td>' +
                        '<td id="25M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'JanReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JanReal).toFixed(2) + '"/></td>' +
                        '<td id="26M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'FebPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].FebPlan).toFixed(2) + '"/></td>' +
                        '<td id="27M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'FebReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].FebReal).toFixed(2) + '"/></td>' +
                        '<td id="28M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'MarPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MarPlan).toFixed(2) + '"/></td>' +
                        '<td id="29M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'MarReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MarReal).toFixed(2) + '"/></td>' +
                        '<td id="30M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'AprPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AprPlan).toFixed(2) + '"/></td>' +
                        '<td id="31M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'AprReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AprReal).toFixed(2) + '"/></td>' +
                        '<td id="32M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'MayPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MayPlan).toFixed(2) + '"/></td>' +
                        '<td id="33M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'MayReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MayReal).toFixed(2) + '"/></td>' +
                        '<td id="34M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'JunPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JunPlan).toFixed(2) + '"/></td>' +
                        '<td id="35M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'JunReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JunReal).toFixed(2) + '"/></td>' +
                        '<td id="36M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'JulPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JulPlan).toFixed(2) + '"/></td>' +
                        '<td id="37M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'JulReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JulReal).toFixed(2) + '"/></td>' +
                        '<td id="38M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'AugPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AugPlan).toFixed(2) + '"/></td>' +
                        '<td id="39M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'AugReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AugReal).toFixed(2) + '"/></td>' +
                        '<td id="40M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'SepPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].SepPlan).toFixed(2) + '"/></td>' +
                        '<td id="41M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'SepReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].SepReal).toFixed(2) + '"/></td>' +
                        '<td id="42M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'OctPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].OctPlan).toFixed(2) + '"/></td>' +
                        '<td id="43M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'OctReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].OctReal).toFixed(2) + '"/></td>' +
                        '<td id="44M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'NovPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].NovPlan).toFixed(2) + '"/></td>' +
                        '<td id="45M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'NovReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].NovReal).toFixed(2) + '"/></td>' +
                        '<td id="46M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'DecPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].DecPlan).toFixed(2) + '"/></td>' +
                        '<td id="47M' + i + '" ><input class="InputTwo" readonly="readonly" id="' + Info[i].cYear + 'DecReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].DecReal).toFixed(2) + '"/></td></tr>';
            }

            if (Info[i].ItemsType == 3) {
                strHtml += '<tr>' +
                        '<td style="text-align:center;">' + i + '</td>' +
                        '<td id="It' + i + '" style="text-align:center;">' + Info[i].ItemsName + '</td>' +
                       '<td id="rol' + i + '" style="text-align:right;"><input readonly="readonly"style="border:none" class="InputTwo2" id="' + Info[i].cYear + 'RollYear' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].RollYear).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"/></td>' +
                        '<td id="ave' + i + '" style="text-align:right;">' + parseFloat(Info[i].RollYear / 12).toFixed(2) + '</td>' +
                        '<td id="colec' + i + '" style="text-align:right;">' + total1.toFixed(2) + '</td>' +
                         '<td id="0M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'jp1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].jp1).toFixed(2) + '"/></td>' +
                        '<td id="1M' + i + '" ><input  style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'jr1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].jr1).toFixed(2) + '"/></td>' +
                        '<td id="2M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'fp1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].fp1).toFixed(2) + '"/></td>' +
                        '<td id="3M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'fr1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].fr1).toFixed(2) + '"/></td>' +
                        '<td id="4M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'mrp1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].mrp1).toFixed(2) + '"/></td>' +
                        '<td id="5M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'mrr1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].mrr1).toFixed(2) + '"/></td>' +
                        '<td id="6M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'ap1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].ap1).toFixed(2) + '"/></td>' +
                        '<td id="7M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'ar1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].ar1).toFixed(2) + '"/></td>' +
                        '<td id="8M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'amp1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].map1).toFixed(2) + '"/></td>' +
                        '<td id="9M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'mar1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].mar1).toFixed(2) + '"/></td>' +
                        '<td id="10M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'jnp1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].jnp1).toFixed(2) + '"/></td>' +
                        '<td id="11M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'jnr1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].jnr1).toFixed(2) + '"/></td>' +
                        '<td id="12M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'jup1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].jup1).toFixed(2) + '"/></td>' +
                        '<td id="13M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'jur1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].jur1).toFixed(2) + '"/></td>' +
                        '<td id="14M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'aup1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].aup1).toFixed(2) + '"/></td>' +
                        '<td id="15M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'aur1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].aur1).toFixed(2) + '"/></td>' +
                        '<td id="16M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'sep1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].sep1).toFixed(2) + '"/></td>' +
                        '<td id="17M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'ser1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].ser1).toFixed(2) + '"/></td>' +
                        '<td id="18M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'op1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].op1).toFixed(2) + '"/></td>' +
                        '<td id="19M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'or1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].or1).toFixed(2) + '"/></td>' +
                        '<td id="20M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'np1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].np1).toFixed(2) + '"/></td>' +
                        '<td id="21M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'nr1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].nr1).toFixed(2) + '"/></td>' +
                        '<td id="22M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'dep1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].dep1).toFixed(2) + '"/></td>' +
                        '<td id="23M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear2 + 'der1' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].der1).toFixed(2) + '"/></td>' +
                         '<td style="border:none;background-color:white"></td>' +
                        '<td id="24M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'JanPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JanPlan).toFixed(2) + '"/></td>' +
                        '<td id="25M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'JanReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JanReal).toFixed(2) + '"/></td>' +
                        '<td id="26M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'FebPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].FebPlan).toFixed(2) + '"/></td>' +
                        '<td id="27M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'FebReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].FebReal).toFixed(2) + '"/></td>' +
                        '<td id="28M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'MarPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MarPlan).toFixed(2) + '"/></td>' +
                        '<td id="29M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'MarReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MarReal).toFixed(2) + '"/></td>' +
                        '<td id="30M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'AprPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AprPlan).toFixed(2) + '"/></td>' +
                        '<td id="31M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'AprReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AprReal).toFixed(2) + '"/></td>' +
                        '<td id="32M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'MayPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MayPlan).toFixed(2) + '"/></td>' +
                        '<td id="33M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'MayReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MayReal).toFixed(2) + '"/></td>' +
                        '<td id="34M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'JunPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JunPlan).toFixed(2) + '"/></td>' +
                        '<td id="35M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'JunReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JunReal).toFixed(2) + '"/></td>' +
                        '<td id="36M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'JulPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JulPlan).toFixed(2) + '"/></td>' +
                        '<td id="37M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'JulReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JulReal).toFixed(2) + '"/></td>' +
                        '<td id="38M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'AugPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AugPlan).toFixed(2) + '"/></td>' +
                        '<td id="39M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'AugReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AugReal).toFixed(2) + '"/></td>' +
                        '<td id="40M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'SepPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].SepPlan).toFixed(2) + '"/></td>' +
                        '<td id="41M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'SepReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].SepReal).toFixed(2) + '"/></td>' +
                        '<td id="42M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'OctPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].OctPlan).toFixed(2) + '"/></td>' +
                        '<td id="43M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'OctReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].OctReal).toFixed(2) + '"/></td>' +
                        '<td id="44M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'NovPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].NovPlan).toFixed(2) + '"/></td>' +
                        '<td id="45M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'NovReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].NovReal).toFixed(2) + '"/></td>' +
                        '<td id="46M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'DecPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].DecPlan).toFixed(2) + '"/></td>' +
                        '<td id="47M' + i + '" ><input style="border:none" class="InputTwo2" readonly="readonly" id="' + Info[i].cYear + 'DecReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].DecReal).toFixed(2) + '"/></td></tr>';
            }
            if (Info[i].ItemsType != 2 && Info[i].ItemsType != 3) {
                strHtml += '<tr>' +
                        '<td style="text-align:center;">' + i + '</td>' +
                        '<td id="It' + i + '" style="text-align:center;">' + Info[i].ItemsName + '</td>' +
                      '<td id="rol' + i + '" style="text-align:right;background-color:#f4f5f7"><input style="background-color:#f4f5f7;border:none" readonly="readonly" class="InputTwo3" id="' + Info[i].cYear + 'RollYear' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].RollYear).toFixed(2) + '" onchange="FucAdd(this)"/></td>' +
                        '<td id="ave' + i + '" style="text-align:right;">' + parseFloat(Info[i].RollYear / 12).toFixed(2) + '</td>' +
                        '<td id="colec' + i + '" style="text-align:right;">' + total1.toFixed(2) + '</td>' +
                         '<td id="0M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'jp1' + Info[i].Id + '" value="' + parseFloat(Info[i].jp1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';
                if (nowMonth > 1 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="1M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'jr1' + Info[i].Id + '" value="' + parseFloat(Info[i].jr1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';
                if (nowMonth > 1 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="2M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'fp1' + Info[i].Id + '" value="' + parseFloat(Info[i].fp1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';
                if (nowMonth > 2 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="3M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'fr1' + Info[i].Id + '" value="' + parseFloat(Info[i].fr1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';
                if (nowMonth > 2 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="4M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'mrp1' + Info[i].Id + '" value="' + parseFloat(Info[i].mrp1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 3 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '<td id="5M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'mrr1' + Info[i].Id + '" value="' + parseFloat(Info[i].mrr1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 3 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="6M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'ap1' + Info[i].Id + '" value="' + parseFloat(Info[i].ap1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 4 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="7M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'ar1' + Info[i].Id + '" value="' + parseFloat(Info[i].ar1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 4 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="8M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'map1' + Info[i].Id + '" value="' + parseFloat(Info[i].map1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 5 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {

                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="9M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'mar1' + Info[i].Id + '" value="' + parseFloat(Info[i].mar1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 5 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '<td id="10M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'jnp1' + Info[i].Id + '" value="' + parseFloat(Info[i].jnp1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 6 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }


                strHtml += '<td id="11M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'jnr1' + Info[i].Id + '" value="' + parseFloat(Info[i].jnr1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 6 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="12M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'jup1' + Info[i].Id + '" value="' + parseFloat(Info[i].jup1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 7 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="13M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'jur1' + Info[i].Id + '" value="' + parseFloat(Info[i].jur1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 7 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="14M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'aup1' + Info[i].Id + '" value="' + parseFloat(Info[i].aup1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 8 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="15M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'aur1' + Info[i].Id + '" value="' + parseFloat(Info[i].aur1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 8 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="16M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'sep1' + Info[i].Id + '" value="' + parseFloat(Info[i].sep1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 9 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="17M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'ser1' + Info[i].Id + '" value="' + parseFloat(Info[i].ser1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 9 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="18M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'op1' + Info[i].Id + '" value="' + parseFloat(Info[i].op1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 10 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="19M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'or1' + Info[i].Id + '" value="' + parseFloat(Info[i].or1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 10 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="20M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'np1' + Info[i].Id + '" value="' + parseFloat(Info[i].np1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 11 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="21M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'nr1' + Info[i].Id + '" value="' + parseFloat(Info[i].nr1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 11 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="22M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'dep1' + Info[i].Id + '" value="' + parseFloat(Info[i].dep1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 12 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="23M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear2 + 'der1' + Info[i].Id + '" value="' + parseFloat(Info[i].der1).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 12 && nowYear == Info[i].cYear2) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear2) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td style="border:none;background-color:white"></td>';
                strHtml += '<td id="24M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'JanPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JanPlan).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 1 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '<td id="25M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'JanReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JanReal).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 1 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '<td id="26M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'FebPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].FebPlan).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 2 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="27M' + i + '" ><input class="InputTwo3" id="' + Info[i].cYear + 'FebReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].FebReal).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 2 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="28M' + i + '" ><input class="InputTwo3" id="' + Info[i].cYear + 'MarPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MarPlan).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 3 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="29M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'MarReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MarReal).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 3 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="30M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'AprPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AprPlan).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 4 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="31M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'AprReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AprReal).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 4 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="32M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'MayPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MayPlan).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 5 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="33M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'MayReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].MayReal).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 5 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '<td id="34M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'JunPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JunPlan).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 6 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '<td id="35M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'JunReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JunReal).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 6 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '<td id="36M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'JulPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JulPlan).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 7 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '<td id="37M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'JulReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].JulReal).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 7 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="38M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'AugPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AugPlan).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 8 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="39M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'AugReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].AugReal).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 8 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += '/></td>';
                    }
                }
                strHtml += '<td id="40M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'SepPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].SepPlan).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 9 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '<td id="41M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'SepReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].SepReal).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 9 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '<td id="42M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'OctPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].OctPlan).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 10 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '<td id="43M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'OctReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].OctReal).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 10 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '<td id="44M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'NovPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].NovPlan).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 11 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }

                strHtml += '<td id="45M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'NovReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].NovReal).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 11 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '<td id="46M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'DecPlan' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].DecPlan).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 12 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '<td id="47M' + i + '" ><input class="InputTwo3"  id="' + Info[i].cYear + 'DecReal' + Info[i].ItemsId + '" value="' + parseFloat(Info[i].DecReal).toFixed(2) + '" onchange="FucAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.\-]/g,\'\')"';

                if (nowMonth > 12 && nowYear == Info[i].cYear) {
                    strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                } else {
                    if (nowYear > Info[i].cYear) {
                        strHtml += 'readonly="readonly" style="background-color:#f4f5f7;border:none"/></td>';
                    }

                    else {
                        strHtml += 'readonly="readonly" style="border:none"/></td>';
                    }
                }
                strHtml += '</tr>';
            }
        }
        strHtml += '<tr>' +
         '<th style="width:2%;text-align:center;">序</th>' +
    '<th style="width:8%;text-align:center;word-wrap:break-word">项目</th>' +
    '<th style="width:5%;text-align:center;">滚动年</th>' +
    '<th style="width:5%;text-align:center;">月均值</th>' +
    '<th style="width:5%;text-align:center;">汇总</th>' +
    '<th id="0M" value="0M"  style="width:5%;text-align:center;cursor:pointer">1p</th>' +
    '<th id="1M" value="1M" style="width:5%;text-align:center;cursor:pointer">1R</th>' +
    '<th id="2M" value="2M"  style="width:5%;text-align:center;cursor:pointer">2P</th>' +
    '<th id="3M" value="3M"  style="width:5%;text-align:center;cursor:pointer">2R</th>' +
    '<th id="4M" value="4M"  style="width:5%;text-align:center;cursor:pointer">3P</th>' +
    '<th id="5M" value="5M"  style="width:5%;text-align:center;cursor:pointer">3R</th>' +
    '<th id="6M" value="6M"  style="width:5%;text-align:center;cursor:pointer">4P</th>' +
    '<th id="7M" value="7M"  style="width:5%;text-align:center;cursor:pointer">4R</th>' +
    '<th id="8M" value="8M"  style="width:5%;text-align:center;cursor:pointer">5P</th>' +
    '<th id="9M" value="9M"  style="width:5%;text-align:center;cursor:pointer">5R</th>' +
    '<th id="10M" value="10M"  style="width:5%;text-align:center;cursor:pointer">6P</th>' +
    '<th id="11M" value="11M"  style="width:5%;text-align:center;cursor:pointer">6R</th>' +
    '<th id="12M" value="12M"  style="width:5%;text-align:center;cursor:pointer">7P</th>' +
    '<th id="13M" value="13M"  style="width:5%;text-align:center;cursor:pointer">7R</th>' +
    '<th id="14M" value="14M"  style="width:5%;text-align:center;cursor:pointer">8P</th>' +
    '<th id="15M" value="15M"  style="width:5%;text-align:center;cursor:pointer">8R</th>' +
    '<th id="16M" value="16M"  style="width:5%;text-align:center;cursor:pointer">9P</th>' +
    '<th id="17M" value="17M"  style="width:5%;text-align:center;cursor:pointer">9R</th>' +
    '<th id="18M" value="18M"  style="width:5%;text-align:center;cursor:pointer">10P</th>' +
    '<th id="19M" value="19M"  style="width:5%;text-align:center;cursor:pointer">10R</th>' +
    '<th id="20M" value="20M"  style="width:5%;text-align:center;cursor:pointer">11P</th>' +
    '<th id="21M" value="21M"  style="width:5%;text-align:center;cursor:pointer">11R</th>' +
    '<th id="22M" value="22M"  style="width:5%;text-align:center;cursor:pointer">12P</th>' +
    '<th id="23M" value="23M"  style="width:5%;text-align:center;cursor:pointer">12R</th>' +
   '<th style="width:1%;border:none;background-color:white"></th>' +
    '<th id="24M" value="24M"  style="width:5%;text-align:center;cursor:pointer">1P</th>' +
    '<th id="25M" value="25M"  style="width:5%;text-align:center;cursor:pointer">1R</th>' +
    '<th id="26M" value="26M"  style="width:5%;text-align:center;cursor:pointer">2P</th>' +
    '<th id="27M" value="27M"  style="width:5%;text-align:center;cursor:pointer">2R</th>' +
    '<th id="28M" value="28M"  style="width:5%;text-align:center;cursor:pointer">3P</th>' +
    '<th id="29M" value="29M"  style="width:5%;text-align:center;cursor:pointer">3R</th>' +
    '<th id="30M" value="30M"  style="width:5%;text-align:center;cursor:pointer">4P</th>' +
    '<th id="31M" value="31M"  style="width:5%;text-align:center;cursor:pointer">4R</th>' +
    '<th id="32M" value="32M"  style="width:5%;text-align:center;cursor:pointer">5P</th>' +
    '<th id="33M" value="33M"  style="width:5%;text-align:center;cursor:pointer">5R</th>' +
    '<th id="34M" value="34M"  style="width:5%;text-align:center;cursor:pointer">6P</th>' +
    '<th id="35M" value="35M"  style="width:5%;text-align:center;cursor:pointer">6R</th>' +
    '<th id="36M" value="36M"  style="width:5%;text-align:center;cursor:pointer">7P</th>' +
    '<th id="37M" value="37M"  style="width:5%;text-align:center;cursor:pointer">7R</th>' +
    '<th id="38M" value="38M"  style="width:5%;text-align:center;cursor:pointer">8P</th>' +
    '<th id="39M" value="39M"  style="width:5%;text-align:center;cursor:pointer">8R</th>' +
    '<th id="40M" value="40M"  style="width:5%;text-align:center;cursor:pointer">9P</th>' +
    '<th id="41M" value="41M"  style="width:5%;text-align:center;cursor:pointer">9R</th>' +
    '<th id="42M" value="42M"  style="width:5%;text-align:center;cursor:pointer">10P</th>' +
    '<th id="43M" value="43M"  style="width:5%;text-align:center;cursor:pointer">10R</th>' +
    '<th id="44M" value="44M"  style="width:5%;text-align:center;cursor:pointer">11P</th>' +
    '<th id="45M" value="45M"  style="width:5%;text-align:center;cursor:pointer">11R</th>' +
    '<th id="46M" value="46M"  style="width:5%;text-align:center;cursor:pointer">12P</th>' +
    '<th id="47M" value="47M"  style="width:5%;text-align:center;cursor:pointer">12R</th></tr></table></div>';


        document.getElementById("content-wrapper").innerHTML = strHtml;


        ChangeColor(47);
        //        GetDeptName(2);
    }


    //改变预算表的值
    function FucAdd(input) {
        var head = input.id.replace(/[^a-zA-z]/ig, "");
        switch (head) {
            case "jp":
                head = "JanPlan";
                break;
            case "jr":
                head = "JanReal";
                break;
            case "fp":
                head = "FebPlan";
                break;
            case "fr":
                head = "FebReal";
                break;
            case "mrp":
                head = "MarPlan";
                break;
            case "mrr":
                head = "MarReal";
                break;
            case "ap":
                head = "AprPlan";
                break;
            case "ar":
                head = "AprReal";
                break;
            case "map":
                head = "MayPlan";
                break;
            case "mar":
                head = "MayReal";
                break;
            case "jnp":
                head = "JunPlan";
                break;
            case "jnr":
                head = "JunReal";
                break;
            case "jup":
                head = "JulPlan";
                break;
            case "jur":
                head = "JulReal";
                break;
            case "aup":
                head = "AugPlan";
                break;
            case "aur":
                head = "AugReal";
                break;
            case "sep":
                head = "SepPlan";
                break;
            case "ser":
                head = "SepReal";
                break;
            case "op":
                head = "OctPlan";
                break;
            case "or":
                head = "OctReal";
                break;
            case "np":
                head = "NovPlan";
                break;
            case "nr":
                head = "NovReal";
                break;
            case "dep":
                head = "DecPlan";
                break;
            case "der":
                head = "DecReal";
                break;
        }
        var idvalue = input.value;
        if (idvalue.indexOf("-") >= 0) {
            document.getElementById(input.id).style.color = 'red';
        }
        var inputid = input.id.replace(/[^0-9]/ig, "");
        changeYear = inputid.substring(0, 4);
        if (inputid.length == 5) {
            itemid = inputid.substring(4, 5);
        }
        if (inputid.length == 6) {
            itemid = inputid.substring(4, 6);
        }

        var value = input.value;

        if (itemid == 46) {
            alert("ksks");
        }
        //        var Jan46 = document.getElementById();

        var Str = "?act=changebudget&year=" + changeYear + "&mname=" + mname + "&itemid=" + itemid + "&value=" + value + "&head=" + head;
        entity.PostStringInfo(Str, this, this.changeBudgetCallBack);
        setYear();
    }

    function changeBudgetCallBack() {

        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
            }
            else {
                window.status = '正在写入信息，请稍候...';

            }
        }
    }

    //改变合计值
    function ChangeCollect() {

        var year3 = changeYear;
        var Str = "?act=changecollect&year=" + year3 + "&mname=" + mname;
        entity.PostStringInfo(Str, this, this.ChangeCollectCallBack);

    }

    function ChangeCollectCallBack() {
        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                alert("修改成功");
                setYear();
                ToltalCaculate();
            }
            else {
                window.status = '正在写入信息，请稍候...';

            }
        }

    }

    function ToltalCaculate() {
        var year4 = changeYear;
        var Str = "?act=toltalcaculate&year=" + year4 + "&mname=" + mname;
        entity.PostStringInfo(Str, this, this.ToltalCaculateCallBack);
    }

    function ToltalCaculateCallBack() {
        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var JanPlanNode = xmldoc.getElementsByTagName("JanPlan");
                var JanRealNode = xmldoc.getElementsByTagName("JanReal");
                var FebPlanNode = xmldoc.getElementsByTagName("FebPlan");
                var FebRealNode = xmldoc.getElementsByTagName("FebReal");
                var MarPlanNode = xmldoc.getElementsByTagName("MarPlan");
                var MarRealNode = xmldoc.getElementsByTagName("MarReal");
                var AprPlanNode = xmldoc.getElementsByTagName("AprPlan");
                var AprRealNode = xmldoc.getElementsByTagName("AprReal");
                var MayPlanNode = xmldoc.getElementsByTagName("MayPlan");
                var MayRealNode = xmldoc.getElementsByTagName("MayReal");
                var JunPlanNode = xmldoc.getElementsByTagName("JunPlan");
                var JunRealNode = xmldoc.getElementsByTagName("JunReal");
                var JulPlanNode = xmldoc.getElementsByTagName("JulPlan");
                var JulRealNode = xmldoc.getElementsByTagName("JulReal");
                var AugPlanNode = xmldoc.getElementsByTagName("AugPlan");
                var AugRealNode = xmldoc.getElementsByTagName("AugReal");
                var SepPlanNode = xmldoc.getElementsByTagName("SepPlan");
                var SepRealNode = xmldoc.getElementsByTagName("SepReal");
                var OctPlanNode = xmldoc.getElementsByTagName("OctPlan");
                var OctRealNode = xmldoc.getElementsByTagName("OctReal");
                var NovPlanNode = xmldoc.getElementsByTagName("NovPlan");
                var NovRealNode = xmldoc.getElementsByTagName("NovReal");
                var DecPlanNode = xmldoc.getElementsByTagName("DecPlan");
                var DecRealNode = xmldoc.getElementsByTagName("DecReal");
                var MonthAveNode = xmldoc.getElementsByTagName("MonthAve");
                var RollYearNode = xmldoc.getElementsByTagName("RollYear");

                for (var i = 0; i < 1; i++) {
                    Total[i] = new Object();

                    Total[i].JanPlan = JanPlanNode[i].childNodes.length > 0 ? JanPlanNode[i].firstChild.nodeValue : "";
                    Total[i].JanReal = JanRealNode[i].childNodes.length > 0 ? JanRealNode[i].firstChild.nodeValue : "";
                    Total[i].FebPlan = FebPlanNode[i].childNodes.length > 0 ? FebPlanNode[i].firstChild.nodeValue : "";
                    Total[i].FebReal = FebRealNode[i].childNodes.length > 0 ? FebRealNode[i].firstChild.nodeValue : "";
                    Total[i].MarPlan = MarPlanNode[i].childNodes.length > 0 ? MarPlanNode[i].firstChild.nodeValue : "";
                    Total[i].MarReal = MarRealNode[i].childNodes.length > 0 ? MarRealNode[i].firstChild.nodeValue : "";
                    Total[i].AprPlan = AprPlanNode[i].childNodes.length > 0 ? AprPlanNode[i].firstChild.nodeValue : "";
                    Total[i].AprReal = AprRealNode[i].childNodes.length > 0 ? AprRealNode[i].firstChild.nodeValue : "";
                    Total[i].MayPlan = MayPlanNode[i].childNodes.length > 0 ? MayPlanNode[i].firstChild.nodeValue : "";
                    Total[i].MayReal = MayRealNode[i].childNodes.length > 0 ? MayRealNode[i].firstChild.nodeValue : "";
                    Total[i].JunPlan = JunPlanNode[i].childNodes.length > 0 ? JunPlanNode[i].firstChild.nodeValue : "";
                    Total[i].JunReal = JunRealNode[i].childNodes.length > 0 ? JunRealNode[i].firstChild.nodeValue : "";
                    Total[i].JulPlan = JulPlanNode[i].childNodes.length > 0 ? JulPlanNode[i].firstChild.nodeValue : "";
                    Total[i].JulReal = JulRealNode[i].childNodes.length > 0 ? JulRealNode[i].firstChild.nodeValue : "";
                    Total[i].AugPlan = AugPlanNode[i].childNodes.length > 0 ? AugPlanNode[i].firstChild.nodeValue : "";
                    Total[i].AugReal = AugRealNode[i].childNodes.length > 0 ? AugRealNode[i].firstChild.nodeValue : "";
                    Total[i].SepPlan = SepPlanNode[i].childNodes.length > 0 ? SepPlanNode[i].firstChild.nodeValue : "";
                    Total[i].SepReal = SepRealNode[i].childNodes.length > 0 ? SepRealNode[i].firstChild.nodeValue : "";
                    Total[i].OctPlan = OctPlanNode[i].childNodes.length > 0 ? OctPlanNode[i].firstChild.nodeValue : "";
                    Total[i].OctReal = OctRealNode[i].childNodes.length > 0 ? OctRealNode[i].firstChild.nodeValue : "";
                    Total[i].NovPlan = NovPlanNode[i].childNodes.length > 0 ? NovPlanNode[i].firstChild.nodeValue : "";
                    Total[i].NovReal = NovRealNode[i].childNodes.length > 0 ? NovRealNode[i].firstChild.nodeValue : "";
                    Total[i].DecPlan = DecPlanNode[i].childNodes.length > 0 ? DecPlanNode[i].firstChild.nodeValue : "";
                    Total[i].DecReal = DecRealNode[i].childNodes.length > 0 ? DecRealNode[i].firstChild.nodeValue : "";
                    Total[i].MonthAve = MonthAveNode[i].childNodes.length > 0 ? MonthAveNode[i].firstChild.nodeValue : "";
                    Total[i].RollYear = RollYearNode[i].childNodes.length > 0 ? RollYearNode[i].firstChild.nodeValue : "";

                }
                ToltalCaculateUpdate();
            }
            else {
                window.status = '正在写入信息，请稍候...';

            }
        }
    }

    function ToltalCaculateUpdate() {
        for (var i = 0; i < 1; i++) {
            var JanPlan = Total[i].JanPlan;
            var JanReal = Total[i].JanReal;
            var FebPlan = Total[i].FebPlan;
            var FebReal = Total[i].FebReal;
            var MarPlan = Total[i].MarPlan;
            var MarReal = Total[i].MarReal;
            var AprPlan = Total[i].AprPlan;
            var AprReal = Total[i].AprReal;
            var MayPlan = Total[i].MayPlan;
            var MayReal = Total[i].MayReal;
            var JunPlan = Total[i].JunPlan;
            var JunReal = Total[i].JunReal;
            var JulPlan = Total[i].JulPlan;
            var JulReal = Total[i].JulReal;
            var AugPlan = Total[i].AugPlan;
            var AugReal = Total[i].AugReal;
            var SepPlan = Total[i].SepPlan;
            var SepReal = Total[i].SepReal;
            var OctPlan = Total[i].OctPlan;
            var OctReal = Total[i].OctReal;
            var NovPlan = Total[i].NovPlan;
            var NovReal = Total[i].NovReal;
            var DecPlan = Total[i].DecPlan;
            var DecReal = Total[i].DecReal;
            var MonthAve = Total[i].MonthAve;
            var RollYear = Total[i].RollYear;
        }
        var year5 = changeYear;

        var admin = mname;
        $.ajax({
            type: "post",
            async: false,
            url: "../Ashx/ToltalUpdate.ashx",
            data: { "JanPlan": JanPlan, "JanReal": JanReal, "FebPlan": FebPlan, "FebReal": FebReal, "MarPlan": MarPlan, "MarReal": MarReal, "AprPlan": AprPlan, "AprReal": AprReal, "MayPlan": MayPlan, "MayReal": MayReal, "JunPlan": JunPlan, "JunReal": JunReal, "JulPlan": JulPlan, "JulReal": JulReal, "AugPlan": AugPlan, "AugReal": AugReal, "SepPlan": SepPlan, "SepReal": SepReal, "OctPlan": OctPlan, "OctReal": OctReal, "NovPlan": NovPlan, "NovReal": NovReal, "DecPlan": DecPlan, "DecReal": DecReal, "MonthAve": MonthAve, "RollYear": RollYear, "year": year5, "admin": admin },
            datatype: "json",
            success: function () {
                ShouZhiCha();
            },
            error: function (errorMsg) {
                alert(errorMsg.responseText);
                alert(errorMsg.status);
                alert("request data failed!!!");
            }
        });
    }

    function ShouZhiCha() {

        var year4 = nowYear;
        var Str = "?act=shouzhicha&year=" + year4 + "&mname=" + mname;
        entity.PostStringInfo(Str, this, this.ShouZhiChaBack);

    }

    function ShouZhiChaBack() {
        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var xmldoc = xmlHttp.responseXML;
                var JanPlanNode = xmldoc.getElementsByTagName("JanPlan");
                var JanRealNode = xmldoc.getElementsByTagName("JanReal");
                var FebPlanNode = xmldoc.getElementsByTagName("FebPlan");
                var FebRealNode = xmldoc.getElementsByTagName("FebReal");
                var MarPlanNode = xmldoc.getElementsByTagName("MarPlan");
                var MarRealNode = xmldoc.getElementsByTagName("MarReal");
                var AprPlanNode = xmldoc.getElementsByTagName("AprPlan");
                var AprRealNode = xmldoc.getElementsByTagName("AprReal");
                var MayPlanNode = xmldoc.getElementsByTagName("MayPlan");
                var MayRealNode = xmldoc.getElementsByTagName("MayReal");
                var JunPlanNode = xmldoc.getElementsByTagName("JunPlan");
                var JunRealNode = xmldoc.getElementsByTagName("JunReal");
                var JulPlanNode = xmldoc.getElementsByTagName("JulPlan");
                var JulRealNode = xmldoc.getElementsByTagName("JulReal");
                var AugPlanNode = xmldoc.getElementsByTagName("AugPlan");
                var AugRealNode = xmldoc.getElementsByTagName("AugReal");
                var SepPlanNode = xmldoc.getElementsByTagName("SepPlan");
                var SepRealNode = xmldoc.getElementsByTagName("SepReal");
                var OctPlanNode = xmldoc.getElementsByTagName("OctPlan");
                var OctRealNode = xmldoc.getElementsByTagName("OctReal");
                var NovPlanNode = xmldoc.getElementsByTagName("NovPlan");
                var NovRealNode = xmldoc.getElementsByTagName("NovReal");
                var DecPlanNode = xmldoc.getElementsByTagName("DecPlan");
                var DecRealNode = xmldoc.getElementsByTagName("DecReal");
                var MonthAveNode = xmldoc.getElementsByTagName("MonthAve");
                var RollYearNode = xmldoc.getElementsByTagName("RollYear");


                for (var i = 1; i < 2; i++) {
                    Total[i] = new Object();

                    Total[i].JanPlan = JanPlanNode[i].childNodes.length > 0 ? JanPlanNode[i].firstChild.nodeValue : "";
                    Total[i].JanReal = JanRealNode[i].childNodes.length > 0 ? JanRealNode[i].firstChild.nodeValue : "";
                    Total[i].FebPlan = FebPlanNode[i].childNodes.length > 0 ? FebPlanNode[i].firstChild.nodeValue : "";
                    Total[i].FebReal = FebRealNode[i].childNodes.length > 0 ? FebRealNode[i].firstChild.nodeValue : "";
                    Total[i].MarPlan = MarPlanNode[i].childNodes.length > 0 ? MarPlanNode[i].firstChild.nodeValue : "";
                    Total[i].MarReal = MarRealNode[i].childNodes.length > 0 ? MarRealNode[i].firstChild.nodeValue : "";
                    Total[i].AprPlan = AprPlanNode[i].childNodes.length > 0 ? AprPlanNode[i].firstChild.nodeValue : "";
                    Total[i].AprReal = AprRealNode[i].childNodes.length > 0 ? AprRealNode[i].firstChild.nodeValue : "";
                    Total[i].MayPlan = MayPlanNode[i].childNodes.length > 0 ? MayPlanNode[i].firstChild.nodeValue : "";
                    Total[i].MayReal = MayRealNode[i].childNodes.length > 0 ? MayRealNode[i].firstChild.nodeValue : "";
                    Total[i].JunPlan = JunPlanNode[i].childNodes.length > 0 ? JunPlanNode[i].firstChild.nodeValue : "";
                    Total[i].JunReal = JunRealNode[i].childNodes.length > 0 ? JunRealNode[i].firstChild.nodeValue : "";
                    Total[i].JulPlan = JulPlanNode[i].childNodes.length > 0 ? JulPlanNode[i].firstChild.nodeValue : "";
                    Total[i].JulReal = JulRealNode[i].childNodes.length > 0 ? JulRealNode[i].firstChild.nodeValue : "";
                    Total[i].AugPlan = AugPlanNode[i].childNodes.length > 0 ? AugPlanNode[i].firstChild.nodeValue : "";
                    Total[i].AugReal = AugRealNode[i].childNodes.length > 0 ? AugRealNode[i].firstChild.nodeValue : "";
                    Total[i].SepPlan = SepPlanNode[i].childNodes.length > 0 ? SepPlanNode[i].firstChild.nodeValue : "";
                    Total[i].SepReal = SepRealNode[i].childNodes.length > 0 ? SepRealNode[i].firstChild.nodeValue : "";
                    Total[i].OctPlan = OctPlanNode[i].childNodes.length > 0 ? OctPlanNode[i].firstChild.nodeValue : "";
                    Total[i].OctReal = OctRealNode[i].childNodes.length > 0 ? OctRealNode[i].firstChild.nodeValue : "";
                    Total[i].NovPlan = NovPlanNode[i].childNodes.length > 0 ? NovPlanNode[i].firstChild.nodeValue : "";
                    Total[i].NovReal = NovRealNode[i].childNodes.length > 0 ? NovRealNode[i].firstChild.nodeValue : "";
                    Total[i].DecPlan = DecPlanNode[i].childNodes.length > 0 ? DecPlanNode[i].firstChild.nodeValue : "";
                    Total[i].DecReal = DecRealNode[i].childNodes.length > 0 ? DecRealNode[i].firstChild.nodeValue : "";
                    Total[i].MonthAve = MonthAveNode[i].childNodes.length > 0 ? MonthAveNode[i].firstChild.nodeValue : "";
                    Total[i].RollYear = RollYearNode[i].childNodes.length > 0 ? RollYearNode[i].firstChild.nodeValue : "";

                }

                ToChangeShouZhi();
            }
            else {
                window.status = '正在写入信息，请稍候...';

            }
        }

    }

    function ToChangeShouZhi() {
        for (var i = 1; i < 2; i++) {
            var JanPlan = Total[i].JanPlan;
            var JanReal = Total[i].JanReal;
            var FebPlan = Total[i].FebPlan;
            var FebReal = Total[i].FebReal;
            var MarPlan = Total[i].MarPlan;
            var MarReal = Total[i].MarReal;
            var AprPlan = Total[i].AprPlan;
            var AprReal = Total[i].AprReal;
            var MayPlan = Total[i].MayPlan;
            var MayReal = Total[i].MayReal;
            var JunPlan = Total[i].JunPlan;
            var JunReal = Total[i].JunReal;
            var JulPlan = Total[i].JulPlan;
            var JulReal = Total[i].JulReal;
            var AugPlan = Total[i].AugPlan;
            var AugReal = Total[i].AugReal;
            var SepPlan = Total[i].SepPlan;
            var SepReal = Total[i].SepReal;
            var OctPlan = Total[i].OctPlan;
            var OctReal = Total[i].OctReal;
            var NovPlan = Total[i].NovPlan;
            var NovReal = Total[i].NovReal;
            var DecPlan = Total[i].DecPlan;
            var DecReal = Total[i].DecReal;
            var MonthAve = Total[i].MonthAve;
            var RollYear = Total[i].RollYear;

        }
        var year5 = nowYear;

        var admin = mname;
        $.ajax({
            type: "post",
            async: false,
            url: "../Ashx/UpdateShouZhi.ashx",
            data: { "JanPlan": JanPlan, "JanReal": JanReal, "FebPlan": FebPlan, "FebReal": FebReal, "MarPlan": MarPlan, "MarReal": MarReal, "AprPlan": AprPlan, "AprReal": AprReal, "MayPlan": MayPlan, "MayReal": MayReal, "JunPlan": JunPlan, "JunReal": JunReal, "JulPlan": JulPlan, "JulReal": JulReal, "AugPlan": AugPlan, "AugReal": AugReal, "SepPlan": SepPlan, "SepReal": SepReal, "OctPlan": OctPlan, "OctReal": OctReal, "NovPlan": NovPlan, "NovReal": NovReal, "DecPlan": DecPlan, "DecReal": DecReal, "MonthAve": MonthAve, "RollYear": RollYear, "year": year5, "admin": admin },
            datatype: "json",
            success: function () {
                ShouZhiCha();
            },
            error: function (errorMsg) {
                alert(errorMsg.responseText);
                alert(errorMsg.status);
                alert("request data failed!!!");
            }
        });

    }

    //加载年份
    //window.onload = function load() {
    function load_year() {
        //获取年份
        $.ajax({
            type: "post",
            async: false,
            url: "../Ashx/GetData.ashx",
            data: '',
            datatype: "json",
            success: function (result) {
                eval("var transult=" + result);
                var strhtml = "";
                for (var i = 0; i < transult.length; i++) {
                    strhtml += '<option value="' + transult[i].data + '"';
                    if (transult[i].data == nowYear) {
                        strhtml += ' selected="selected"';

                    }
                    strhtml += '>' + transult[i].data + '</option>';
                    //                    alert(transult[i].data);
                }
                document.getElementById("year").innerHTML = strhtml;
                document.getElementById("year2").innerHTML = strhtml;
            },
            error: function (errorMsg) {
                alert(errorMsg.responseText);
                alert(errorMsg.status);
                alert("request data failed!!!");
            }
        });
    }


    //求和
    function sum(list) {
        return eval(list.join("+"));
    }


    //    改变合计、小计项目的底色
    function ChangeColor(x) {
        switch (x) {
            case 23:
                colorFunc(x);
                break;
            case 47:
                colorFunc(x);
                break;
        }
    }


    function colorFunc(x) {
        for (var i = 0; i < Info.length; i++) {
            if (Info[i].ItemsType == 2) {
                document.getElementById("It" + i).style.background = '#bec7e9';
                document.getElementById("rol" + i).style.background = '#bec7e9';
                document.getElementById("ave" + i).style.background = '#bec7e9';
                document.getElementById("colec" + i).style.background = '#bec7e9';
                for (var j = 0; j < x + 1; j++) {
                    document.getElementById(j + "M" + i).style.background = '#bec7e9';
                }
            }
            if (Info[i].ItemsType == 3) {
                document.getElementById("It" + i).style.background = '#9ddcce';
                document.getElementById("rol" + i).style.background = '#9ddcce';
                document.getElementById("ave" + i).style.background = '#9ddcce';
                document.getElementById("colec" + i).style.background = '#9ddcce';
                for (var j = 0; j < x + 1; j++) {
                    document.getElementById(j + "M" + i).style.background = '#9ddcce';
                }
            }
        }
    }

    function LogOut() {
        if (confirm("确定退出系统？")) {
            window.open("../../LogIn.aspx", "_top");
        }
    }

    function SubmitBudget() {
        if (confirm("确定提交该表？只能提交一次！")) {
            var Str = "submitbudget?act=&year=" + changeYear + "&mname=" + mname;
            entity.PostStringInfo(Str, this, this.SubmitCallBack);
        }
    }

    function SubmitCallBack() {
        setYear();
    }

    function showHead() {

        var strHtml = '<input type="button" name="btSure" id="btSure" onclick="setYear()" value="查询" style="width:50px; background-color:White; border:solid 1px lightgray;margin:10px;"/>';
        if (Info[0].Isedit == 0 && Info[0].Isok == 0) {
            strHtml += '<input type="button" name="btSure" id="btSure" onclick="ChangeCollect()" value="修改" style="width:50px; background-color:White; border:solid 1px lightgray;margin:10px;"/>' +
             '<input type="button" name="btSure" id="btSure" onclick="SubmitBudget()" value="提交" style="width:50px; background-color:White; border:solid 1px lightgray;margin:10px;"/>';
        }



        document.getElementById("head").innerHTML = strHtml;
    }



    function C_EditBudget() {

        var year = document.getElementById("year").value;
        if (confirm("确定要重新修改预算表吗？")) {
            var Str = "?act=c_editbudget&year=" + year + "&mname=" + checkname;
            // alert(Str);
            entity.PostStringInfo(Str, this, this.SaveCommitCallBack);
        }
    }

    function SaveCommitCallBack() {
        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var stateNode = xmldoc.getElementsByTagName("state");
                if (stateNode.length > 0) {
                    state = stateNode[0].firstChild.nodeValue;
                    alert(state);
                    setYear();
                }
                else {
                    alert("操作失败");
                }
            }
            else {
                window.status = '正在写入信息，请稍候...';

            }
        }
    }

    function OkBudget() {
        var year = document.getElementById("year").value;
        if (confirm("确定要提交预算表吗？")) {
            var Str = "?act=okbudget&year=" + year + "&mname=" + checkname;
            // alert(Str);
            entity.PostStringInfo(Str, this, this.SaveCommitCallBack);
        }
    }
</script>
</head>
  <body onload="InitBudget()" class="skin-blue sidebar-mini" style="height: auto; min-height: 100%;">



 

  <div class="content-wrapper" id="Div1" style="margin-left:15px">

  <div style="overflow-x:scroll"><table style="border-collapse:collapse;width:99%;background:white;height:15px" border="1";>
   <tr><td id="welcome" valign="top" style="height:20px;text-align:center;font-size:10pt;font-weight:bold;width:200px;padding:4px"></td>
   <td style="width:700px;border-style:none;font-size:10pt;height:30px;padding:4px" valign="top">
<div id="hideDiv" class="choBt"" style=" border-right:1px solid #eaeaea;height:20px"><input type="radio" name="radioHide" id="radio" onclick="DisHide()"  style="width:20px; background-color:White; border:solid 1px lightgray;checked:false"/><span>隐藏</span>
     <div id="divscreen" style="margin-top:18px;display:none;width:650px;height:350px;border:1px gray solid; background-color:White;z-index:1000; position:absolute"></div>
     </div>

<div class="choBt" style="height:20px"><table class="choYea"><td valign="top" ><div style="width:30px">年：</div></td><td valign="top"><select id="year" style="width:70px"></select></td><td valign="top">至</td><td valign="top" id="chooseYear1"> <select id="year2" style="width:70px"> </select> </td><td valign="top"><input type="button" name="btSure" id="btSureCheck" onclick="setYear()" value="查询" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/><input type="button" name="btSure" id="btSureEdit" onclick="C_EditBudget()" value="重改" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/><input type="button" name="btSure" id="btSure" onclick="OkBudget()" value="确定" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/></td></table></td>
<td valign="top" style="height:10px;width:200px;text-align:center;font-size:11pt;font-weight:bold;background-color:#9CB75B;border-style:none;padding:4px">预算表</td></tr></table>

  
      <div  id="content-wrapper" style="min-height: 298px;">
 
      </div>
     </div>
  <div class="control-sidebar-bg"></div>
</div>
</body>
</html>
