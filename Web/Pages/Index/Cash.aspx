<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cash.aspx.cs" Inherits="Pages_Index_Budget" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>现金余额追赶表</title>
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
    Month = new Array();
    Month2= new Array();
    var nowdate = new Date();
    var nowYear = nowdate.getFullYear();
    var passYear = nowYear - 1;
    var nowMonth = nowdate.getMonth()+1;


//    mname = getCookie("name");
    mname = getCookie("membername");
    Grade = getCookie("grade");
    DeptName = getCookie("eptName");
    Manager = getCookie("manager");


    function InitCash() {
         load_year();
        //    mcode = getCookie("memcode");
      //  alert("KDJKDFL");

        if (mname == "" || mname == null) {
            window.open("../../LogIn.aspx", "_top");
        }
        else {
            if (Grade == 0) {
                var Str = "?act=initcash&mname=" + mname + "&year=" + nowYear;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            if (Grade == 1) {
                var Str = "?act=initcash&mname=" + mname + "&year=" + nowYear;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            if (Grade == 5) {
                var Str = "?act=initcash&mname=" + mname + "&year=" + nowYear;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            
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
                var Str = "?act=getcashdatabyyear&year=" + year + "&mname=" + mname;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            } else {
                var Str = "?act=getcashdatabyyear2&year=" + year + "&year2=" + year2 + "&mname=" + mname;
                entity.PostStringInfo(Str, this, this.InfoCallBackTwo);
            }
        }
    }

    function InfoCallBack() {

        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var IdNode = xmldoc.getElementsByTagName("Id");
                var DeptCodeNode = xmldoc.getElementsByTagName("DeptCode");
                var ItemsNameNode = xmldoc.getElementsByTagName("ItemsName");
                var ItemsTypeNode = xmldoc.getElementsByTagName("ItemsType");
                var IseditNode = xmldoc.getElementsByTagName("Isedit");
                var IsokNode = xmldoc.getElementsByTagName("Isok");
                var cYearNode = xmldoc.getElementsByTagName("cYear");
                var JanPlanNode = xmldoc.getElementsByTagName("JanPlan");

                var FebPlanNode = xmldoc.getElementsByTagName("FebPlan");

                var MarPlanNode = xmldoc.getElementsByTagName("MarPlan");

                var AprPlanNode = xmldoc.getElementsByTagName("AprPlan");

                var MayPlanNode = xmldoc.getElementsByTagName("MayPlan");

                var JunPlanNode = xmldoc.getElementsByTagName("JunPlan");

                var JulPlanNode = xmldoc.getElementsByTagName("JulPlan");

                var AugPlanNode = xmldoc.getElementsByTagName("AugPlan");

                var SepPlanNode = xmldoc.getElementsByTagName("SepPlan");

                var OctPlanNode = xmldoc.getElementsByTagName("OctPlan");

                var NovPlanNode = xmldoc.getElementsByTagName("NovPlan");

                var DecPlanNode = xmldoc.getElementsByTagName("DecPlan");



                for (var i = 0; i < ItemsNameNode.length; i++) {
                    Info[i] = new Object();
                    Info[i].id = IdNode[i].childNodes.length > 0 ? IdNode[i].firstChild.nodeValue : "";
                    Info[i].DeptCode = DeptCodeNode[i].childNodes.length > 0 ? DeptCodeNode[i].firstChild.nodeValue : "";
                    Info[i].ItemsName = ItemsNameNode[i].childNodes.length > 0 ? ItemsNameNode[i].firstChild.nodeValue : "";
                    Info[i].ItemsType = ItemsTypeNode[i].childNodes.length > 0 ? ItemsTypeNode[i].firstChild.nodeValue : "";
                    Info[i].Isedit = IseditNode[i].childNodes.length > 0 ? IseditNode[i].firstChild.nodeValue : "";
                    Info[i].Isok = IsokNode[i].childNodes.length > 0 ? IsokNode[i].firstChild.nodeValue : "";
                    Info[i].cYear = cYearNode[i].childNodes.length > 0 ? cYearNode[i].firstChild.nodeValue : "";
                    Info[i].JanPlan = JanPlanNode[i].childNodes.length > 0 ? JanPlanNode[i].firstChild.nodeValue : "";

                    Info[i].FebPlan = FebPlanNode[i].childNodes.length > 0 ? FebPlanNode[i].firstChild.nodeValue : "";

                    Info[i].MarPlan = MarPlanNode[i].childNodes.length > 0 ? MarPlanNode[i].firstChild.nodeValue : "";

                    Info[i].AprPlan = AprPlanNode[i].childNodes.length > 0 ? AprPlanNode[i].firstChild.nodeValue : "";

                    Info[i].MayPlan = MayPlanNode[i].childNodes.length > 0 ? MayPlanNode[i].firstChild.nodeValue : "";

                    Info[i].JunPlan = JunPlanNode[i].childNodes.length > 0 ? JunPlanNode[i].firstChild.nodeValue : "";

                    Info[i].JulPlan = JulPlanNode[i].childNodes.length > 0 ? JulPlanNode[i].firstChild.nodeValue : "";

                    Info[i].AugPlan = AugPlanNode[i].childNodes.length > 0 ? AugPlanNode[i].firstChild.nodeValue : "";

                    Info[i].SepPlan = SepPlanNode[i].childNodes.length > 0 ? SepPlanNode[i].firstChild.nodeValue : "";

                    Info[i].OctPlan = OctPlanNode[i].childNodes.length > 0 ? OctPlanNode[i].firstChild.nodeValue : "";

                    Info[i].NovPlan = NovPlanNode[i].childNodes.length > 0 ? NovPlanNode[i].firstChild.nodeValue : "";

                    Info[i].DecPlan = DecPlanNode[i].childNodes.length > 0 ? DecPlanNode[i].firstChild.nodeValue : "";



                }
                showHead();
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
                var ItemsTypeNode = xmldoc.getElementsByTagName("ItemsType");
                var cYearNode1 = xmldoc.getElementsByTagName("cYear1");
                var JanPlanNode1 = xmldoc.getElementsByTagName("JanPlan1");

                var FebPlanNode1 = xmldoc.getElementsByTagName("FebPlan1");

                var MarPlanNode1 = xmldoc.getElementsByTagName("MarPlan1");

                var AprPlanNode1 = xmldoc.getElementsByTagName("AprPlan1");

                var MayPlanNode1 = xmldoc.getElementsByTagName("MayPlan1");

                var JunPlanNode1 = xmldoc.getElementsByTagName("JunPlan1");

                var JulPlanNode1 = xmldoc.getElementsByTagName("JulPlan1");

                var AugPlanNode1 = xmldoc.getElementsByTagName("AugPlan1");

                var SepPlanNode1 = xmldoc.getElementsByTagName("SepPlan1");

                var OctPlanNode1 = xmldoc.getElementsByTagName("OctPlan1");

                var NovPlanNode1 = xmldoc.getElementsByTagName("NovPlan1");

                var DecPlanNode1 = xmldoc.getElementsByTagName("DecPlan1");

                var cYearNode2 = xmldoc.getElementsByTagName("cYear2");
                var JanPlanNode2 = xmldoc.getElementsByTagName("JanPlan2");

                var FebPlanNode2 = xmldoc.getElementsByTagName("FebPlan2");

                var MarPlanNode2 = xmldoc.getElementsByTagName("MarPlan2");

                var AprPlanNode2 = xmldoc.getElementsByTagName("AprPlan2");

                var MayPlanNode2 = xmldoc.getElementsByTagName("MayPlan2");

                var JunPlanNode2 = xmldoc.getElementsByTagName("JunPlan2");

                var JulPlanNode2 = xmldoc.getElementsByTagName("JulPlan2");

                var AugPlanNode2 = xmldoc.getElementsByTagName("AugPlan2");

                var SepPlanNode2 = xmldoc.getElementsByTagName("SepPlan2");

                var OctPlanNode2 = xmldoc.getElementsByTagName("OctPlan2");

                var NovPlanNode2 = xmldoc.getElementsByTagName("NovPlan2");

                var DecPlanNode2 = xmldoc.getElementsByTagName("DecPlan2");



                for (var i = 0; i < ItemsNameNode.length; i++) {
                    Info[i] = new Object();
                    Info[i].ItemsName = ItemsNameNode[i].childNodes.length > 0 ? ItemsNameNode[i].firstChild.nodeValue : "";
                    Info[i].ItemsType = ItemsTypeNode[i].childNodes.length > 0 ? ItemsTypeNode[i].firstChild.nodeValue : "";


                    Info[i].cYear1 = cYearNode1[i].childNodes.length > 0 ? cYearNode1[i].firstChild.nodeValue : "";

                    Info[i].JanPlan1 = JanPlanNode1[i].childNodes.length > 0 ? JanPlanNode1[i].firstChild.nodeValue : "";

                    Info[i].FebPlan1 = FebPlanNode1[i].childNodes.length > 0 ? FebPlanNode1[i].firstChild.nodeValue : "";

                    Info[i].MarPlan1 = MarPlanNode1[i].childNodes.length > 0 ? MarPlanNode1[i].firstChild.nodeValue : "";

                    Info[i].AprPlan1 = AprPlanNode1[i].childNodes.length > 0 ? AprPlanNode1[i].firstChild.nodeValue : "";

                    Info[i].MayPlan1 = MayPlanNode1[i].childNodes.length > 0 ? MayPlanNode1[i].firstChild.nodeValue : "";

                    Info[i].JunPlan1 = JunPlanNode1[i].childNodes.length > 0 ? JunPlanNode1[i].firstChild.nodeValue : "";

                    Info[i].JulPlan1 = JulPlanNode1[i].childNodes.length > 0 ? JulPlanNode1[i].firstChild.nodeValue : "";

                    Info[i].AugPlan1 = AugPlanNode1[i].childNodes.length > 0 ? AugPlanNode1[i].firstChild.nodeValue : "";

                    Info[i].SepPlan1 = SepPlanNode1[i].childNodes.length > 0 ? SepPlanNode1[i].firstChild.nodeValue : "";

                    Info[i].OctPlan1 = OctPlanNode1[i].childNodes.length > 0 ? OctPlanNode1[i].firstChild.nodeValue : "";

                    Info[i].NovPlan1 = NovPlanNode1[i].childNodes.length > 0 ? NovPlanNode1[i].firstChild.nodeValue : "";

                    Info[i].DecPlan1 = DecPlanNode1[i].childNodes.length > 0 ? DecPlanNode1[i].firstChild.nodeValue : "";

                    Info[i].cYear2 = cYearNode2[i].childNodes.length > 0 ? cYearNode2[i].firstChild.nodeValue : "";
                    Info[i].JanPlan2 = JanPlanNode2[i].childNodes.length > 0 ? JanPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].FebPlan2 = FebPlanNode2[i].childNodes.length > 0 ? FebPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].MarPlan2 = MarPlanNode2[i].childNodes.length > 0 ? MarPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].AprPlan2 = AprPlanNode2[i].childNodes.length > 0 ? AprPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].MayPlan2 = MayPlanNode2[i].childNodes.length > 0 ? MayPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].JunPlan2 = JunPlanNode2[i].childNodes.length > 0 ? JunPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].JulPlan2 = JulPlanNode2[i].childNodes.length > 0 ? JulPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].AugPlan2 = AugPlanNode2[i].childNodes.length > 0 ? AugPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].SepPlan2 = SepPlanNode2[i].childNodes.length > 0 ? SepPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].OctPlan2 = OctPlanNode2[i].childNodes.length > 0 ? OctPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].NovPlan2 = NovPlanNode2[i].childNodes.length > 0 ? NovPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].DecPlan2 = DecPlanNode2[i].childNodes.length > 0 ? DecPlanNode2[i].firstChild.nodeValue : "";




                }
                showInfoTwo();
            }
        }
    }


    function showHead() {

        var strHtml = '<input type="button" name="btSure" id="btSure" onclick="setYear()" value="查询" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/>';
        if (Info[0].Isedit == 0 && Info[0].Isok == 0) {
            strHtml += '<input type="button" name="btSure" id="btSure" onclick="SaveCommit()" value="修改" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/>' +
             '<input type="button" name="btSure" id="btSure" onclick="SaveCash()" value="提交" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/>';
        }



        document.getElementById("head").innerHTML = strHtml;
    }




    function showInfo() {

        var strHtml =

    '<table style="border-collapse:collapse;width:99%;background:white;font-size:9pt" border="1"><tr height="28" bgcolor="#E7E7E7">' +
    '<th style="width:40px;text-align:center;">序号</th>' +
    '<th style="width:100px;text-align:center;">项目</th>' +
      '<th style="width:50px;text-align:center;">年</th>' +

    '<th id="0M" onclick="Hide(id)" style="width:3px;text-align:center;cursor:pointer">1月</th>' +

    '<th id="1M" onclick="Hide(id)" style="width:3px;text-align:center;cursor:pointer">2月</th>' +

    '<th id="2M" onclick="Hide(id)" style="width:3px;text-align:center;cursor:pointer">3月</th>' +

    '<th id="3M" onclick="Hide(id)" style="width:3px;text-align:center;cursor:pointer">4月</th>' +

    '<th id="4M" onclick="Hide(id)" style="width:3px;text-align:center;cursor:pointer">5月</th>' +

    '<th id="5M" onclick="Hide(id)" style="width:3px;text-align:center;cursor:pointer">6月</th>' +

    '<th id="6M" onclick="Hide(id)" style="width:3px;text-align:center;cursor:pointer">7月</th>' +

    '<th id="7M" onclick="Hide(id)" style="width:3px;text-align:center;cursor:pointer">8月</th>' +

    '<th id="8M" onclick="Hide(id)" style="width:3px;text-align:center;cursor:pointer">9月</th>' +

    '<th id="9M" onclick="Hide(id)" style="width:3px;text-align:center;cursor:pointer">10月</th>' +

    '<th id="10M" onclick="Hide(id)" style="width:3px;text-align:center;cursor:pointer">11月</th>' +

    '<th id="11M" onclick="Hide(id)" style="width:3px;text-align:center;cursor:pointer">12月</th>';


        for (var i = 0; i < Info.length; i++) {

            if (Info[i].ItemsType == 2) {
                strHtml += '<tr> <tbody id="netPro">' +
                        '<td style="text-align:center;" bgcolor="#FFFF00" height="30">' + i + '</td>' +
                        '<td id="It' + i + '" style="text-align:center;" bgcolor="#FFFF00">' + Info[i].ItemsName + '</td>' +
                         '<td id="It' + i + '" style="text-align:center;" bgcolor="#FFFF00">' + Info[i].cYear + '</td>' +

                        '<td id="0M' + i + '" style="text-align:center;" bgcolor="#FFFF00"><input type="text" id="JanPlan' + Info[i].id + '" value="' + Info[i].JanPlan + '" onchange="chkIt_a(\'SepPlan\')"  size="9" style="text-align: right;border:0;border-color:#FFFF00;background-color: #FFFF00;';
                          if (Info[i].JanPlan<0){
                          strHtml += 'color:#ff0000;"readonly="readonly"/></td>'; 
                          }else{
                           strHtml += 'color:#000000;"readonly="readonly"/></td>'; 
                          }


                       strHtml += '<td id="1M' + i + '" style="text-align:center;" bgcolor="#FFFF00"><input type="text" id="FebPlan' + Info[i].id + '" value="' + Info[i].FebPlan + '" onchange="chkIt_a(\'FebPlan\')" size="9" style="text-align: right;border:0;border-color:#FFFF00;background-color:#FFFF00;';
                       if (Info[i].FebPlan < 0) {
                           strHtml += 'color:#ff0000;"readonly="readonly"/></td>';
                       } else {
                           strHtml += 'color:#000000;"readonly="readonly"/></td>';
                       }

                       strHtml += '<td id="2M' + i + '" style="text-align:center;" bgcolor="#FFFF00"><input type="text" id="MarPlan' + Info[i].id + '" value="' + Info[i].MarPlan + '" onchange="chkIt_a(\'MarPlan\')" size="9" style="text-align: right;border:0;border-color:#FFFF00;background-color:#FFFF00;';
                       if (Info[i].MarPlan < 0) {
                           strHtml += 'color:#ff0000;"readonly="readonly"/></td>';
                       } else {
                           strHtml += 'color:#000000;"readonly="readonly"/></td>';
                       }

                       strHtml += '<td id="3M' + i + '" style="text-align:center;" bgcolor="#FFFF00"><input type="text" id="AprPlan' + Info[i].id + '" value="' + Info[i].AprPlan + '" onchange="chkIt_a(\'AprPlan\')" size="9" style="text-align: right;border:0;border-color:#FFFF00;background-color:#FFFF00;';
                       if (Info[i].AprPlan < 0) {
                           strHtml += 'color:#ff0000;"readonly="readonly"/></td>';
                       } else {
                           strHtml += 'color:#000000;"readonly="readonly"/></td>';
                       }

                       strHtml += '<td id="4M' + i + '" style="text-align:center;" bgcolor="#FFFF00"><input type="text" id="MayPlan' + Info[i].id + '" value="' + Info[i].MayPlan + '" onchange="chkIt_a(\'MayPlan\')" size="9" style="text-align: right;border:0;border-color:#FFFF00;background-color:#FFFF00;';
                       if (Info[i].MayPlan < 0) {
                           strHtml += 'color:#ff0000;"readonly="readonly"/></td>';
                       } else {
                           strHtml += 'color:#000000;"readonly="readonly"/></td>';
                       }

                       strHtml += '<td id="5M' + i + '" style="text-align:center;" bgcolor="#FFFF00"><input type="text" id="JunPlan' + Info[i].id + '" value="' + Info[i].JunPlan + '" onchange="chkIt_a(\'JunPlan\')" size="9" style="text-align: right;border:0;border-color:#FFFF00;background-color:#FFFF00;';
                       if (Info[i].JunPlan < 0) {
                           strHtml += 'color:#ff0000;"readonly="readonly"/></td>';
                       } else {
                           strHtml += 'color:#000000;"readonly="readonly"/></td>';
                       }

                       strHtml += '<td id="6M' + i + '" style="text-align:center;" bgcolor="#FFFF00"><input type="text" id="JulPlan' + Info[i].id + '" value="' + Info[i].JulPlan + '" onchange="chkIt_a(\'JulPlan\')" size="9" style="text-align: right;border:0;border-color:#FFFF00;background-color:#FFFF00;';
                       if (Info[i].JulPlan < 0) {
                           strHtml += 'color:#ff0000;"readonly="readonly"/></td>';
                       } else {
                           strHtml += 'color:#000000;"readonly="readonly"/></td>';
                       }

                       strHtml += '<td id="7M' + i + '" style="text-align:center;" bgcolor="#FFFF00"><input type="text" id="AugPlan' + Info[i].id + '" value="' + Info[i].AugPlan + '" onchange="chkIt_a(\'AugPlan\')" size="9" style="text-align: right;border:0;border-color:#FFFF00;background-color:#FFFF00;';
                       if (Info[i].AugPlan < 0) {
                           strHtml += 'color:#ff0000;"readonly="readonly"/></td>';
                       } else {
                           strHtml += 'color:#000000;"readonly="readonly"/></td>';
                       }

                       strHtml += '<td id="8M' + i + '" style="text-align:center;" bgcolor="#FFFF00"><input type="text" id="SepPlan' + Info[i].id + '" value="' + Info[i].SepPlan + '" onchange="chkIt_a(\'SepPlan\')" size="9" style="text-align: right;border:0;border-color:#FFFF00;background-color:#FFFF00;';
                       if (Info[i].SepPlan < 0) {
                           strHtml += 'color:#ff0000;"readonly="readonly"/></td>';
                       } else {
                           strHtml += 'color:#000000;"readonly="readonly"/></td>';
                       }

                       strHtml += '<td id="9M' + i + '" style="text-align:center;" bgcolor="#FFFF00"><input type="text" id="OctPlan' + Info[i].id + '" value="' + Info[i].OctPlan + '" onchange="chkIt_a(\'OctPlan\')" size="9" style="text-align: right;border:0;border-color:#FFFF00;background-color:#FFFF00;';
                       if (Info[i].OctPlan < 0) {
                           strHtml += 'color:#ff0000;"readonly="readonly"/></td>';
                       } else {
                           strHtml += 'color:#000000;"readonly="readonly"/></td>';
                       }

                       strHtml += '<td id="10M' + i + '" style="text-align:center;" bgcolor="#FFFF00"><input type="text" id="NovPlan' + Info[i].id + '" value="' + Info[i].NovPlan + '" onchange="chkIt_a(\'NovPlan\')" size="9" style="text-align: right;border:0;border-color:#FFFF00;background-color:#FFFF00;';
                       if (Info[i].NovPlan < 0) {
                           strHtml += 'color:#ff0000;"readonly="readonly"/></td>';
                       } else {
                           strHtml += 'color:#000000;"readonly="readonly"/></td>';
                       }

                       strHtml += '<td id="11M' + i + '" style="text-align:center;" bgcolor="#FFFF00"><input type="text" id="DecPlan' + Info[i].id + '" value="' + Info[i].DecPlan + '" onchange="chkIt_a(\'DecPlan\')" size="9" style="text-align: right;border:0;border-color:#FFFF00;background-color:#FFFF00;';
                         if (Info[i].NovPlan < 0) {
                           strHtml += 'color:#ff0000;"readonly="readonly"/></tbody></td></tr>';
                       } else {
                           strHtml += 'color:#000000;"readonly="readonly"/></tbody></td></tr>';
                       }
                       
                       
            } else {
                       strHtml += '<tr bgcolor="#ffffff"  onMouseMove="this.bgColor=\'#D1DDAA\';" onMouseOut="this.bgColor=\'#FFFFFF\';">' +
                        '<td style="text-align:center;" height="25">' + i + '</td>';

            if (i == 0 || i == 1 || i == 6 || i == 7 || i == 10 || i == 11 || i == 15) {
                       strHtml += '<td id="It' + i + '" style="text-align:center;" bgcolor="#733FFC" >' + Info[i].ItemsName + '</td>';
                   }else{
                       strHtml += '<td id="It' + i + '" style="text-align:center;" bgcolor="#FFA384">' + Info[i].ItemsName + '</td>';
                   }

            strHtml += '<td id="It' + i + '" style="text-align:center;">' + Info[i].cYear + '</td>' +

                        '<td id="0M' + i + '" style="text-align:center;"><input type="text" id="JanPlan' + Info[i].id + '" value="' + Info[i].JanPlan + '" onkeyup="chkIt(\'JanPlan\')"  size="9" onblur="isNumber(this.value)"';

                if (nowMonth > 1 && Info[i].cYear == nowYear) {

                    strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                    if (Info[i].JanPlan < 0) {
                           strHtml += 'color:#ff0000;"/></td>';
                       } else {
                           strHtml += 'color:#000000;"/></td>';
                       }
                    
                    
                     

                } else {

                    if (Info[i].cYear < nowYear || Info[i].Isedit == 1) {
                        strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';

                        if (Info[i].JanPlan < 0) {
                            strHtml += 'color:#ff0000;"/></td>';
                        } else {
                            strHtml += 'color:#000000;"/></td>';
                        }
                    } else {

                        if (Info[i].JanPlan < 0) {
                            strHtml += ' style="text-align: right;color:#ff0000;"/></td>';
                        } else {
                            strHtml += ' style="text-align: right;color:#000000;"/></td>';
                        }

                        
                    }


                }

                strHtml += '<td id="1M' + i + '" style="text-align:center;"><input type="text" id="FebPlan' + Info[i].id + '" value="' + Info[i].FebPlan + '" onkeyup="chkIt(\'FebPlan\')" size="9" onblur="isNumber(this.value)"';
                if (nowMonth > 2 && Info[i].cYear == nowYear) {

                    strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                    if (Info[i].FebPlan < 0) {
                        strHtml += 'color:#ff0000;"/></td>';
                    } else {
                        strHtml += 'color:#000000;"/></td>';
                    }

                } else {

                    if (Info[i].cYear < nowYear || Info[i].Isedit == 1) {
                        strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                        if (Info[i].FebPlan < 0) {
                            strHtml += 'color:#ff0000;"/></td>';
                        } else {
                            strHtml += 'color:#000000;"/></td>';
                        }
                    } else {
                        if (Info[i].FebPlan < 0) {
                            strHtml += ' style="text-align: right;color:#ff0000;"/></td>';
                        } else {
                            strHtml += ' style="text-align: right;color:#000000;"/></td>';
                        }
                    }


                }


                strHtml += '<td id="2M' + i + '" style="text-align:center;"><input type="text" id="MarPlan' + Info[i].id + '" value="' + Info[i].MarPlan + '" onkeyup="chkIt(\'MarPlan\')" size="9" onblur="isNumber(this.value)"';
                if (nowMonth > 3 && Info[i].cYear == nowYear) {

                    strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                    if (Info[i].MarPlan < 0) {
                        strHtml += 'color:#ff0000;"/></td>';
                    } else {
                        strHtml += 'color:#000000;"/></td>';
                    }

                } else {

                    if (Info[i].cYear < nowYear || Info[i].Isedit == 1) {
                        strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                        if (Info[i].MarPlan < 0) {
                            strHtml += 'color:#ff0000;"/></td>';
                        } else {
                            strHtml += 'color:#000000;"/></td>';
                        }
                    } else {
                        if (Info[i].MarPlan < 0) {
                            strHtml += ' style="text-align: right;color:#ff0000;"/></td>';
                        } else {
                            strHtml += ' style="text-align: right;color:#000000;"/></td>';
                        }
                    }


                }
                strHtml += '<td id="3M' + i + '" style="text-align:center;"><input type="text" id="AprPlan' + Info[i].id + '" value="' + Info[i].AprPlan + '" onkeyup="chkIt(\'AprPlan\')" size="9" onblur="isNumber(this.value)"';
                if (nowMonth > 4 && Info[i].cYear == nowYear) {

                    strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                    if (Info[i].AprPlan < 0) {
                        strHtml += 'color:#ff0000;"/></td>';
                    } else {
                        strHtml += 'color:#000000;"/></td>';
                    }

                } else {

                    if (Info[i].cYear < nowYear || Info[i].Isedit == 1) {
                        strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                        if (Info[i].AprPlan < 0) {
                            strHtml += 'color:#ff0000;"/></td>';
                        } else {
                            strHtml += 'color:#000000;"/></td>';
                        }
                    } else {
                        if (Info[i].AprPlan < 0) {
                            strHtml += ' style="text-align: right;color:#ff0000;"/></td>';
                        } else {
                            strHtml += ' style="text-align: right;color:#000000;"/></td>';
                        }
                    }


                }
                strHtml += '<td id="4M' + i + '" style="text-align:center;"><input type="text" id="MayPlan' + Info[i].id + '" value="' + Info[i].MayPlan + '" onkeyup="chkIt(\'MayPlan\')" size="9" onblur="isNumber(this.value)"';
                if (nowMonth > 5 && Info[i].cYear == nowYear) {

                    strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                    if (Info[i].MayPlan < 0) {
                        strHtml += 'color:#ff0000;"/></td>';
                    } else {
                        strHtml += 'color:#000000;"/></td>';
                    }

                } else {

                    if (Info[i].cYear < nowYear || Info[i].Isedit == 1) {
                        strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                        if (Info[i].MayPlan < 0) {
                            strHtml += 'color:#ff0000;"/></td>';
                        } else {
                            strHtml += 'color:#000000;"/></td>';
                        }
                    } else {
                        if (Info[i].MayPlan < 0) {
                            strHtml += ' style="text-align: right;color:#ff0000;"/></td>';
                        } else {
                            strHtml += ' style="text-align: right;color:#000000;"/></td>';
                        }
                    }


                }
                strHtml += '<td id="5M' + i + '" style="text-align:center;"><input type="text" id="JunPlan' + Info[i].id + '" value="' + Info[i].JunPlan + '" onkeyup="chkIt(\'JunPlan\')" size="9" onblur="isNumber(this.value)"';
                if (nowMonth > 6 && Info[i].cYear == nowYear) {

                    strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                    if (Info[i].JunPlan < 0) {
                        strHtml += 'color:#ff0000;"/></td>';
                    } else {
                        strHtml += 'color:#000000;"/></td>';
                    }

                } else {

                    if (Info[i].cYear < nowYear || Info[i].Isedit == 1) {
                        strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                        if (Info[i].JunPlan < 0) {
                            strHtml += 'color:#ff0000;"/></td>';
                        } else {
                            strHtml += 'color:#000000;"/></td>';
                        }
                    } else {
                        if (Info[i].JunPlan < 0) {
                            strHtml += ' style="text-align: right;color:#ff0000;"/></td>';
                        } else {
                            strHtml += ' style="text-align: right;color:#000000;"/></td>';
                        }
                    }


                }
                strHtml += '<td id="6M' + i + '" style="text-align:center;"><input type="text" id="JulPlan' + Info[i].id + '" value="' + Info[i].JulPlan + '" onkeyup="chkIt(\'JulPlan\')" size="9" onblur="isNumber(this.value)"';
                if (nowMonth > 7 && Info[i].cYear == nowYear) {

                    strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                    if (Info[i].JulPlan < 0) {
                        strHtml += 'color:#ff0000;"/></td>';
                    } else {
                        strHtml += 'color:#000000;"/></td>';
                    }

                } else {

                    if (Info[i].cYear < nowYear || Info[i].Isedit == 1) {
                        strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                        if (Info[i].JulPlan < 0) {
                            strHtml += 'color:#ff0000;"/></td>';
                        } else {
                            strHtml += 'color:#000000;"/></td>';
                        }
                    } else {
                        if (Info[i].JulPlan < 0) {
                            strHtml += ' style="text-align: right;color:#ff0000;"/></td>';
                        } else {
                            strHtml += ' style="text-align: right;color:#000000;"/></td>';
                        }
                    }


                }
                strHtml += '<td id="7M' + i + '" style="text-align:center;"><input type="text" id="AugPlan' + Info[i].id + '" value="' + Info[i].AugPlan + '" onkeyup="chkIt(\'AugPlan\')" size="9" onblur="isNumber(this.value)"';
                if (nowMonth > 8 && Info[i].cYear == nowYear) {

                    strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                    if (Info[i].AugPlan < 0) {
                        strHtml += 'color:#ff0000;"/></td>';
                    } else {
                        strHtml += 'color:#000000;"/></td>';
                    }

                } else {

                    if (Info[i].cYear < nowYear || Info[i].Isedit == 1) {
                        strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                        if (Info[i].AugPlan < 0) {
                            strHtml += 'color:#ff0000;"/></td>';
                        } else {
                            strHtml += 'color:#000000;"/></td>';
                        }
                    } else {
                        if (Info[i].AugPlan < 0) {
                            strHtml += ' style="text-align: right;color:#ff0000;"/></td>';
                        } else {
                            strHtml += ' style="text-align: right;color:#000000;"/></td>';
                        }
                    }


                }
                strHtml += '<td id="8M' + i + '" style="text-align:center;"><input type="text" id="SepPlan' + Info[i].id + '" value="' + Info[i].SepPlan + '" onkeyup="chkIt(\'SepPlan\')" size="9" onblur="isNumber(this.value)"';
                if (nowMonth > 9 && Info[i].cYear == nowYear) {

                    strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                    if (Info[i].SepPlan < 0) {
                        strHtml += 'color:#ff0000;"/></td>';
                    } else {
                        strHtml += 'color:#000000;"/></td>';
                    }

                } else {

                    if (Info[i].cYear < nowYear || Info[i].Isedit == 1) {
                        strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                        if (Info[i].SepPlan < 0) {
                            strHtml += 'color:#ff0000;"/></td>';
                        } else {
                            strHtml += 'color:#000000;"/></td>';
                        }
                    } else {
                        if (Info[i].SepPlan < 0) {
                            strHtml += ' style="text-align: right;color:#ff0000;"/></td>';
                        } else {
                            strHtml += ' style="text-align: right;color:#000000;"/></td>';
                        }
                    }


                }
                strHtml += '<td id="9M' + i + '" style="text-align:center;"><input type="text" id="OctPlan' + Info[i].id + '" value="' + Info[i].OctPlan + '" onkeyup="chkIt(\'OctPlan\')" size="9" onblur="isNumber(this.value)"';
                if (nowMonth > 10 && Info[i].cYear == nowYear) {

                    strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                    if (Info[i].OctPlan < 0) {
                        strHtml += 'color:#ff0000;"/></td>';
                    } else {
                        strHtml += 'color:#000000;"/></td>';
                    }

                } else {

                    if (Info[i].cYear < nowYear || Info[i].Isedit == 1) {
                        strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                        if (Info[i].OctPlan < 0) {
                            strHtml += 'color:#ff0000;"/></td>';
                        } else {
                            strHtml += 'color:#000000;"/></td>';
                        }
                    } else {
                        if (Info[i].OctPlan < 0) {
                            strHtml += ' style="text-align: right;color:#ff0000;"/></td>';
                        } else {
                            strHtml += ' style="text-align: right;color:#000000;"/></td>';
                        }
                    }


                }
                strHtml += '<td id="10M' + i + '" style="text-align:center;"><input type="text" id="NovPlan' + Info[i].id + '" value="' + Info[i].NovPlan + '" onkeyup="chkIt(\'NovPlan\')" size="9" onblur="isNumber(this.value)"';
                if (nowMonth > 11 && Info[i].cYear == nowYear) {

                    strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                    if (Info[i].NovPlan < 0) {
                        strHtml += 'color:#ff0000;"/></td>';
                    } else {
                        strHtml += 'color:#000000;"/></td>';
                    }

                } else {

                    if (Info[i].cYear < nowYear || Info[i].Isedit == 1) {
                        strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                        if (Info[i].NovPlan < 0) {
                            strHtml += 'color:#ff0000;"/></td>';
                        } else {
                            strHtml += 'color:#000000;"/></td>';
                        }
                    } else {
                        if (Info[i].NovPlan < 0) {
                            strHtml += ' style="text-align: right;color:#ff0000;"/></td>';
                        } else {
                            strHtml += ' style="text-align: right;color:#000000;"/></td>';
                        }
                    }


                }
                strHtml += '<td id="11M' + i + '" style="text-align:center;"><input type="text" id="DecPlan' + Info[i].id + '" value="' + Info[i].DecPlan + '" onkeyup="chkIt(\'DecPlan\')" size="9" onblur="isNumber(this.value)"';
                if (nowMonth > 12 && Info[i].cYear == nowYear) {

                    strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                    if (Info[i].DecPlan < 0) {
                        strHtml += 'color:#ff0000;"/></td>';
                    } else {
                        strHtml += 'color:#000000;"/></td>';
                    }

                } else {

                    if (Info[i].cYear < nowYear || Info[i].Isedit == 1) {
                        strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:white;background-color:white;';
                        if (Info[i].DecPlan < 0) {
                            strHtml += 'color:#ff0000;"/></td>';
                        } else {
                            strHtml += 'color:#000000;"/></td>';
                        }
                    } else {
                        if (Info[i].DecPlan < 0) {
                            strHtml += ' style="text-align: right;color:#ff0000;"/></td>';
                        } else {
                            strHtml += ' style="text-align: right;color:#000000;"/></td>';
                        }
                    }


                }
                strHtml += '</tr>';


            }


        }

        strHtml += '</table></div>';
        document.getElementById("content-wrapper").innerHTML = strHtml;
        GetDeptName(1);

    }

    function chkIt(index) {

        //frm.value = frm.value.replace(/\D/g, "");
        var wtxt0 = document.getElementById(index + Info[0].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[0].id + "").value);
        var wtxt1 = document.getElementById(index + Info[1].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[1].id + "").value);
        var wtxt2 = document.getElementById(index + Info[2].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[2].id + "").value);
        var wtxt3 = document.getElementById(index + Info[3].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[3].id + "").value);
        var wtxt4 = document.getElementById(index + Info[4].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[4].id + "").value);
        var wtxt5 = document.getElementById(index + Info[5].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[5].id + "").value);
        var wtxt6 = document.getElementById(index + Info[6].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[6].id + "").value);
        var wtxt7 = document.getElementById(index + Info[7].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[7].id + "").value);
        var wtxt8 = document.getElementById(index + Info[8].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[8].id + "").value);
        var wtxt9 = document.getElementById(index + Info[9].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[9].id + "").value);
        var wtxt10 = document.getElementById(index + Info[10].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[10].id + "").value);
        var wtxt11 = document.getElementById(index + Info[11].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[11].id + "").value);
        var wtxt12 = document.getElementById(index + Info[12].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[12].id + "").value);
        var wtxt13 = document.getElementById(index + Info[13].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[13].id + "").value);
        var wtxt14 = document.getElementById(index + Info[14].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[14].id + "").value);
        var wtxt15 = document.getElementById(index + Info[15].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[15].id + "").value);
       // var wtxt16 = document.getElementById(index + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[16].id + "").value);

        if (index == "JanPlan") {
            var ntxt = 0;
        } else if (index == "FebPlan") {
            var ntxt = document.getElementById("JanPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("JanPlan" + Info[17].id + "").value);

        } else if (index == "MarPlan") {
            var ntxt = document.getElementById("FebPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("FebPlan" + Info[17].id + "").value);

        } else if (index == "AprPlan") {
            var ntxt = document.getElementById("MarPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("MarPlan" + Info[17].id + "").value);

        } else if (index == "MayPlan") {
            var ntxt = document.getElementById("AprPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("AprPlan" + Info[17].id + "").value);

        } else if (index == "JunPlan") {
            var ntxt = document.getElementById("MayPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("MayPlan" + Info[17].id + "").value);

        } else if (index == "JulPlan") {
            var ntxt = document.getElementById("JunPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("JunPlan" + Info[17].id + "").value);

        } else if (index == "AugPlan") {
            var ntxt = document.getElementById("JulPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("JulPlan" + Info[17].id + "").value);

        } else if (index == "SepPlan") {
            var ntxt = document.getElementById("AugPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("AugPlan" + Info[17].id + "").value);

        } else if (index == "OctPlan") {
            var ntxt = document.getElementById("SepPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[17].id + "").value);

        } else if (index == "NovPlan") {
            var ntxt = document.getElementById("OctPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[17].id + "").value);

        } else if (index == "DecPlan") {
            var ntxt = document.getElementById("NovPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[17].id + "").value);

        }
        // var wtxt = parseFloat(wtxt1 + wtxt2 - wtxt3 - wtxt4 - wtxt5 - wtxt6 + wtxt7 + wtxt8 - wtxt9 - wtxt10 + wtxt11 + wtxt12 - wtxt13 - wtxt14 - wtxt15 + wtxt16);

        wtxta = parseFloat(wtxt0 + wtxt1 + wtxt6 + wtxt7 + wtxt10 + wtxt11 + wtxt15);
        wtxtb = parseFloat(wtxt2 + wtxt3 + wtxt4 + wtxt5 + wtxt8 + wtxt9 + wtxt12+ wtxt13 + wtxt14);

         document.getElementById(index + Info[16].id + "").value = parseFloat(wtxta + wtxtb);
         document.getElementById(index + Info[17].id + "").value = parseFloat(ntxt + wtxta + wtxtb);
         chkIt_a(index);
     }



     function chkIt_a(index) {

        
         var wtxt = document.getElementById(index + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById(index + Info[17].id + "").value);
      

         if (index == "JanPlan") {
             var ntxt = document.getElementById("FebPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("FebPlan" + Info[16].id + "").value);
             document.getElementById("FebPlan" + Info[17].id + "").value = parseFloat(ntxt + wtxt);

             var wtxt1 = document.getElementById("FebPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("FebPlan" + Info[17].id + "").value);
             var ntxt1 = document.getElementById("MarPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("MarPlan" + Info[16].id + "").value);
             document.getElementById("MarPlan" + Info[17].id + "").value = parseFloat(ntxt1 + wtxt1);

             var wtxt2 = document.getElementById("MarPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("MarPlan" + Info[17].id + "").value);
             var ntxt2 = document.getElementById("AprPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("AprPlan" + Info[16].id + "").value);
             document.getElementById("AprPlan" + Info[17].id + "").value = parseFloat(ntxt2 + wtxt2);


             var wtxt3 = document.getElementById("AprPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("AprPlan" + Info[17].id + "").value);
             var ntxt3 = document.getElementById("MayPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("MayPlan" + Info[16].id + "").value);
             document.getElementById("MayPlan" + Info[17].id + "").value = parseFloat(ntxt3 + wtxt3);

             var wtxt4 = document.getElementById("MayPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("MayPlan" + Info[17].id + "").value);
             var ntxt4 = document.getElementById("JunPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("JunPlan" + Info[16].id + "").value);
             document.getElementById("JunPlan" + Info[17].id + "").value = parseFloat(ntxt4 + wtxt4);

             var wtxt5 = document.getElementById("JunPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("JunPlan" + Info[17].id + "").value);
             var ntxt5 = document.getElementById("JulPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("JulPlan" + Info[16].id + "").value);
             document.getElementById("JulPlan" + Info[17].id + "").value = parseFloat(ntxt5 + wtxt5);

             var wtxt6 = document.getElementById("JulPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("JulPlan" + Info[17].id + "").value);
             var ntxt6 = document.getElementById("AugPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("AugPlan" + Info[16].id + "").value);
             document.getElementById("AugPlan" + Info[17].id + "").value = parseFloat(ntxt6 + wtxt6);

             var wtxt7 = document.getElementById("AugPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("AugPlan" + Info[17].id + "").value);
             var ntxt7 = document.getElementById("SepPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[16].id + "").value);
             document.getElementById("SepPlan" + Info[17].id + "").value = parseFloat(ntxt7 + wtxt7);

             var wtxt8 = document.getElementById("SepPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[17].id + "").value);
             var ntxt8 = document.getElementById("OctPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[16].id + "").value);
             document.getElementById("OctPlan" + Info[17].id + "").value = parseFloat(ntxt8 + wtxt8);

             var wtxt9 = document.getElementById("OctPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[17].id + "").value);
             var ntxt9 = document.getElementById("NovPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[16].id + "").value);
             document.getElementById("NovPlan" + Info[17].id + "").value = parseFloat(ntxt9 + wtxt9);

             var wtxt10 = document.getElementById("NovPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[17].id + "").value);
             var ntxt10 = document.getElementById("DecPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("DecPlan" + Info[16].id + "").value);
             document.getElementById("DecPlan" + Info[17].id + "").value = parseFloat(ntxt10 + wtxt10);

         } else if (index == "FebPlan") {
             var ntxt = document.getElementById("MarPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("MarPlan" + Info[16].id + "").value);
             document.getElementById("MarPlan" + Info[17].id + "").value = parseFloat(ntxt + wtxt);

             var wtxt2 = document.getElementById("MarPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("MarPlan" + Info[17].id + "").value);
             var ntxt2 = document.getElementById("AprPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("AprPlan" + Info[16].id + "").value);
             document.getElementById("AprPlan" + Info[17].id + "").value = parseFloat(ntxt2 + wtxt2);


             var wtxt3 = document.getElementById("AprPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("AprPlan" + Info[17].id + "").value);
             var ntxt3 = document.getElementById("MayPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("MayPlan" + Info[16].id + "").value);
             document.getElementById("MayPlan" + Info[17].id + "").value = parseFloat(ntxt3 + wtxt3);

             var wtxt4 = document.getElementById("MayPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("MayPlan" + Info[17].id + "").value);
             var ntxt4 = document.getElementById("JunPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("JunPlan" + Info[16].id + "").value);
             document.getElementById("JunPlan" + Info[17].id + "").value = parseFloat(ntxt4 + wtxt4);

             var wtxt5 = document.getElementById("JunPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("JunPlan" + Info[17].id + "").value);
             var ntxt5 = document.getElementById("JulPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("JulPlan" + Info[16].id + "").value);
             document.getElementById("JulPlan" + Info[17].id + "").value = parseFloat(ntxt5 + wtxt5);

             var wtxt6 = document.getElementById("JulPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("JulPlan" + Info[17].id + "").value);
             var ntxt6 = document.getElementById("AugPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("AugPlan" + Info[16].id + "").value);
             document.getElementById("AugPlan" + Info[17].id + "").value = parseFloat(ntxt6 + wtxt6);

             var wtxt7 = document.getElementById("AugPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("AugPlan" + Info[17].id + "").value);
             var ntxt7 = document.getElementById("SepPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[16].id + "").value);
             document.getElementById("SepPlan" + Info[17].id + "").value = parseFloat(ntxt7 + wtxt7);

             var wtxt8 = document.getElementById("SepPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[17].id + "").value);
             var ntxt8 = document.getElementById("OctPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[16].id + "").value);
             document.getElementById("OctPlan" + Info[17].id + "").value = parseFloat(ntxt8 + wtxt8);

             var wtxt9 = document.getElementById("OctPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[17].id + "").value);
             var ntxt9 = document.getElementById("NovPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[16].id + "").value);
             document.getElementById("NovPlan" + Info[17].id + "").value = parseFloat(ntxt9 + wtxt9);

             var wtxt10 = document.getElementById("NovPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[17].id + "").value);
             var ntxt10 = document.getElementById("DecPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("DecPlan" + Info[16].id + "").value);
             document.getElementById("DecPlan" + Info[17].id + "").value = parseFloat(ntxt10 + wtxt10);


         } else if (index == "MarPlan") {
             var ntxt = document.getElementById("AprPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("AprPlan" + Info[16].id + "").value);
             document.getElementById("AprPlan" + Info[17].id + "").value = parseFloat(ntxt + wtxt);

             var wtxt3 = document.getElementById("AprPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("AprPlan" + Info[17].id + "").value);
             var ntxt3 = document.getElementById("MayPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("MayPlan" + Info[16].id + "").value);
             document.getElementById("MayPlan" + Info[17].id + "").value = parseFloat(ntxt3 + wtxt3);

             var wtxt4 = document.getElementById("MayPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("MayPlan" + Info[17].id + "").value);
             var ntxt4 = document.getElementById("JunPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("JunPlan" + Info[16].id + "").value);
             document.getElementById("JunPlan" + Info[17].id + "").value = parseFloat(ntxt4 + wtxt4);

             var wtxt5 = document.getElementById("JunPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("JunPlan" + Info[17].id + "").value);
             var ntxt5 = document.getElementById("JulPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("JulPlan" + Info[16].id + "").value);
             document.getElementById("JulPlan" + Info[17].id + "").value = parseFloat(ntxt5 + wtxt5);

             var wtxt6 = document.getElementById("JulPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("JulPlan" + Info[17].id + "").value);
             var ntxt6 = document.getElementById("AugPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("AugPlan" + Info[16].id + "").value);
             document.getElementById("AugPlan" + Info[17].id + "").value = parseFloat(ntxt6 + wtxt6);

             var wtxt7 = document.getElementById("AugPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("AugPlan" + Info[17].id + "").value);
             var ntxt7 = document.getElementById("SepPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[16].id + "").value);
             document.getElementById("SepPlan" + Info[17].id + "").value = parseFloat(ntxt7 + wtxt7);

             var wtxt8 = document.getElementById("SepPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[17].id + "").value);
             var ntxt8 = document.getElementById("OctPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[16].id + "").value);
             document.getElementById("OctPlan" + Info[17].id + "").value = parseFloat(ntxt8 + wtxt8);

             var wtxt9 = document.getElementById("OctPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[17].id + "").value);
             var ntxt9 = document.getElementById("NovPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[16].id + "").value);
             document.getElementById("NovPlan" + Info[17].id + "").value = parseFloat(ntxt9 + wtxt9);

             var wtxt10 = document.getElementById("NovPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[17].id + "").value);
             var ntxt10 = document.getElementById("DecPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("DecPlan" + Info[16].id + "").value);
             document.getElementById("DecPlan" + Info[17].id + "").value = parseFloat(ntxt10 + wtxt10);
         } else if (index == "AprPlan") {
             var ntxt = document.getElementById("MayPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("MayPlan" + Info[16].id + "").value);
             document.getElementById("MayPlan" + Info[17].id + "").value = parseFloat(ntxt + wtxt);

             var wtxt4 = document.getElementById("MayPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("MayPlan" + Info[17].id + "").value);
             var ntxt4 = document.getElementById("JunPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("JunPlan" + Info[16].id + "").value);
             document.getElementById("JunPlan" + Info[17].id + "").value = parseFloat(ntxt4 + wtxt4);

             var wtxt5 = document.getElementById("JunPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("JunPlan" + Info[17].id + "").value);
             var ntxt5 = document.getElementById("JulPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("JulPlan" + Info[16].id + "").value);
             document.getElementById("JulPlan" + Info[17].id + "").value = parseFloat(ntxt5 + wtxt5);

             var wtxt6 = document.getElementById("JulPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("JulPlan" + Info[17].id + "").value);
             var ntxt6 = document.getElementById("AugPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("AugPlan" + Info[16].id + "").value);
             document.getElementById("AugPlan" + Info[17].id + "").value = parseFloat(ntxt6 + wtxt6);

             var wtxt7 = document.getElementById("AugPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("AugPlan" + Info[17].id + "").value);
             var ntxt7 = document.getElementById("SepPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[16].id + "").value);
             document.getElementById("SepPlan" + Info[17].id + "").value = parseFloat(ntxt7 + wtxt7);

             var wtxt8 = document.getElementById("SepPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[17].id + "").value);
             var ntxt8 = document.getElementById("OctPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[16].id + "").value);
             document.getElementById("OctPlan" + Info[17].id + "").value = parseFloat(ntxt8 + wtxt8);

             var wtxt9 = document.getElementById("OctPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[17].id + "").value);
             var ntxt9 = document.getElementById("NovPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[16].id + "").value);
             document.getElementById("NovPlan" + Info[17].id + "").value = parseFloat(ntxt9 + wtxt9);

             var wtxt10 = document.getElementById("NovPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[17].id + "").value);
             var ntxt10 = document.getElementById("DecPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("DecPlan" + Info[16].id + "").value);
             document.getElementById("DecPlan" + Info[17].id + "").value = parseFloat(ntxt10 + wtxt10);

         } else if (index == "MayPlan") {
             var ntxt = document.getElementById("JunPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("JunPlan" + Info[16].id + "").value);
             document.getElementById("JunPlan" + Info[17].id + "").value = parseFloat(ntxt + wtxt);

             var wtxt5 = document.getElementById("JunPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("JunPlan" + Info[17].id + "").value);
             var ntxt5 = document.getElementById("JulPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("JulPlan" + Info[16].id + "").value);
             document.getElementById("JulPlan" + Info[17].id + "").value = parseFloat(ntxt5 + wtxt5);

             var wtxt6 = document.getElementById("JulPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("JulPlan" + Info[17].id + "").value);
             var ntxt6 = document.getElementById("AugPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("AugPlan" + Info[16].id + "").value);
             document.getElementById("AugPlan" + Info[17].id + "").value = parseFloat(ntxt6 + wtxt6);

             var wtxt7 = document.getElementById("AugPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("AugPlan" + Info[17].id + "").value);
             var ntxt7 = document.getElementById("SepPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[16].id + "").value);
             document.getElementById("SepPlan" + Info[17].id + "").value = parseFloat(ntxt7 + wtxt7);

             var wtxt8 = document.getElementById("SepPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[17].id + "").value);
             var ntxt8 = document.getElementById("OctPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[16].id + "").value);
             document.getElementById("OctPlan" + Info[17].id + "").value = parseFloat(ntxt8 + wtxt8);

             var wtxt9 = document.getElementById("OctPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[17].id + "").value);
             var ntxt9 = document.getElementById("NovPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[16].id + "").value);
             document.getElementById("NovPlan" + Info[17].id + "").value = parseFloat(ntxt9 + wtxt9);

             var wtxt10 = document.getElementById("NovPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[17].id + "").value);
             var ntxt10 = document.getElementById("DecPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("DecPlan" + Info[16].id + "").value);
             document.getElementById("DecPlan" + Info[17].id + "").value = parseFloat(ntxt10 + wtxt10);


         } else if (index == "JunPlan") {
             var ntxt = document.getElementById("JulPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("JulPlan" + Info[16].id + "").value);
             document.getElementById("JulPlan" + Info[17].id + "").value = parseFloat(ntxt + wtxt);

             var wtxt6 = document.getElementById("JulPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("JulPlan" + Info[17].id + "").value);
             var ntxt6 = document.getElementById("AugPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("AugPlan" + Info[16].id + "").value);
             document.getElementById("AugPlan" + Info[17].id + "").value = parseFloat(ntxt6 + wtxt6);

             var wtxt7 = document.getElementById("AugPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("AugPlan" + Info[17].id + "").value);
             var ntxt7 = document.getElementById("SepPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[16].id + "").value);
             document.getElementById("SepPlan" + Info[17].id + "").value = parseFloat(ntxt7 + wtxt7);

             var wtxt8 = document.getElementById("SepPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[17].id + "").value);
             var ntxt8 = document.getElementById("OctPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[16].id + "").value);
             document.getElementById("OctPlan" + Info[17].id + "").value = parseFloat(ntxt8 + wtxt8);

             var wtxt9 = document.getElementById("OctPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[17].id + "").value);
             var ntxt9 = document.getElementById("NovPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[16].id + "").value);
             document.getElementById("NovPlan" + Info[17].id + "").value = parseFloat(ntxt9 + wtxt9);

             var wtxt10 = document.getElementById("NovPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[17].id + "").value);
             var ntxt10 = document.getElementById("DecPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("DecPlan" + Info[16].id + "").value);
             document.getElementById("DecPlan" + Info[17].id + "").value = parseFloat(ntxt10 + wtxt10);

         } else if (index == "JulPlan") {
             var ntxt = document.getElementById("AugPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("AugPlan" + Info[16].id + "").value);
             document.getElementById("AugPlan" + Info[17].id + "").value = parseFloat(ntxt + wtxt);

             var wtxt7 = document.getElementById("AugPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("AugPlan" + Info[17].id + "").value);
             var ntxt7 = document.getElementById("SepPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[16].id + "").value);
             document.getElementById("SepPlan" + Info[17].id + "").value = parseFloat(ntxt7 + wtxt7);

             var wtxt8 = document.getElementById("SepPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[17].id + "").value);
             var ntxt8 = document.getElementById("OctPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[16].id + "").value);
             document.getElementById("OctPlan" + Info[17].id + "").value = parseFloat(ntxt8 + wtxt8);

             var wtxt9 = document.getElementById("OctPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[17].id + "").value);
             var ntxt9 = document.getElementById("NovPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[16].id + "").value);
             document.getElementById("NovPlan" + Info[17].id + "").value = parseFloat(ntxt9 + wtxt9);

             var wtxt10 = document.getElementById("NovPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[17].id + "").value);
             var ntxt10 = document.getElementById("DecPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("DecPlan" + Info[16].id + "").value);
             document.getElementById("DecPlan" + Info[17].id + "").value = parseFloat(ntxt10 + wtxt10);


         } else if (index == "AugPlan") {
             var ntxt = document.getElementById("SepPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[16].id + "").value);
             document.getElementById("SepPlan" + Info[17].id + "").value = parseFloat(ntxt + wtxt);

             var wtxt8 = document.getElementById("SepPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("SepPlan" + Info[17].id + "").value);
             var ntxt8 = document.getElementById("OctPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[16].id + "").value);
             document.getElementById("OctPlan" + Info[17].id + "").value = parseFloat(ntxt8 + wtxt8);

             var wtxt9 = document.getElementById("OctPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[17].id + "").value);
             var ntxt9 = document.getElementById("NovPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[16].id + "").value);
             document.getElementById("NovPlan" + Info[17].id + "").value = parseFloat(ntxt9 + wtxt9);

             var wtxt10 = document.getElementById("NovPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[17].id + "").value);
             var ntxt10 = document.getElementById("DecPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("DecPlan" + Info[16].id + "").value);
             document.getElementById("DecPlan" + Info[17].id + "").value = parseFloat(ntxt10 + wtxt10);

         } else if (index == "SepPlan") {
             var ntxt = document.getElementById("OctPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[16].id + "").value);
             document.getElementById("OctPlan" + Info[17].id + "").value = parseFloat(ntxt + wtxt);

             var wtxt9 = document.getElementById("OctPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("OctPlan" + Info[17].id + "").value);
             var ntxt9 = document.getElementById("NovPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[16].id + "").value);
             document.getElementById("NovPlan" + Info[17].id + "").value = parseFloat(ntxt9 + wtxt9);

             var wtxt10 = document.getElementById("NovPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[17].id + "").value);
             var ntxt10 = document.getElementById("DecPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("DecPlan" + Info[16].id + "").value);
             document.getElementById("DecPlan" + Info[17].id + "").value = parseFloat(ntxt10 + wtxt10);

         } else if (index == "OctPlan") {
             var ntxt = document.getElementById("NovPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[16].id + "").value);
             document.getElementById("NovPlan" + Info[17].id + "").value = parseFloat(ntxt + wtxt);

             var wtxt10 = document.getElementById("NovPlan" + Info[17].id + "").value == "" ? "0" : parseFloat(document.getElementById("NovPlan" + Info[17].id + "").value);
             var ntxt10 = document.getElementById("DecPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("DecPlan" + Info[16].id + "").value);
             document.getElementById("DecPlan" + Info[17].id + "").value = parseFloat(ntxt10 + wtxt10);


         } else if (index == "NovPlan") {
             var ntxt = document.getElementById("DecPlan" + Info[16].id + "").value == "" ? "0" : parseFloat(document.getElementById("DecPlan" + Info[16].id + "").value);
             document.getElementById("DecPlan" + Info[17].id + "").value = parseFloat(ntxt + wtxt);
         } else if (index == "DecPlan") {
             var ntxt = 0;
             
         }
        


       

     }

     function SaveCommit() {

         var IdSave = "";
         var JanPlanSave = "";
         var FebPlanSave = "";
         var MarPlanSave = "";
         var AprPlanSave = "";
         var MayPlanSave = "";
         var JunPlanSave = "";
         var JulPlanSave = "";
         var AugPlanSave = "";
         var SepPlanSave = "";
         var OctPlanSave = "";
         var NovPlanSave = "";
         var DecPlanSave = "";

         var JanPlan_all = document.getElementById("JanPlan" + Info[17].id + "").value == "" ? 0 : parseFloat(document.getElementById("JanPlan" + Info[17].id + "").value);
         var FebPlan_all = document.getElementById("FebPlan" + Info[17].id + "").value == "" ? 0 : parseFloat(document.getElementById("FebPlan" + Info[17].id + "").value);
         var MarPlan_all = document.getElementById("MarPlan" + Info[17].id + "").value == "" ? 0 : parseFloat(document.getElementById("MarPlan" + Info[17].id + "").value);
         var AprPlan_all = document.getElementById("AprPlan" + Info[17].id + "").value == "" ? 0 : parseFloat(document.getElementById("AprPlan" + Info[17].id + "").value);
         var MayPlan_all = document.getElementById("MayPlan" + Info[17].id + "").value == "" ? 0 : parseFloat(document.getElementById("MayPlan" + Info[17].id + "").value);
         var JunPlan_all = document.getElementById("JunPlan" + Info[17].id + "").value == "" ? 0 : parseFloat(document.getElementById("JunPlan" + Info[17].id + "").value);
         var JulPlan_all = document.getElementById("JulPlan" + Info[17].id + "").value == "" ? 0 : parseFloat(document.getElementById("JulPlan" + Info[17].id + "").value);
         var AugPlan_all = document.getElementById("AugPlan" + Info[17].id + "").value == "" ? 0 : parseFloat(document.getElementById("AugPlan" + Info[17].id + "").value);
         var SepPlan_all = document.getElementById("SepPlan" + Info[17].id + "").value == "" ? 0 : parseFloat(document.getElementById("SepPlan" + Info[17].id + "").value);
         var OctPlan_all = document.getElementById("OctPlan" + Info[17].id + "").value == "" ? 0 : parseFloat(document.getElementById("OctPlan" + Info[17].id + "").value);
         var NovPlan_all = document.getElementById("NovPlan" + Info[17].id + "").value == "" ? 0 : parseFloat(document.getElementById("NovPlan" + Info[17].id + "").value);
         var DecPlan_all = document.getElementById("DecPlan" + Info[17].id + "").value == "" ? 0 : parseFloat(document.getElementById("DecPlan" + Info[17].id + "").value);


         if (JanPlan_all < 0 || FebPlan_all < 0 || MarPlan_all < 0 || AprPlan_all < 0 || MayPlan_all < 0 || JunPlan_all < 0 || JulPlan_all < 0 || AugPlan_all < 0 || SepPlan_all < 0 || OctPlan_all < 0 || NovPlan_all < 0 || DecPlan_all < 0) {
             alert("月末现金结余要保证为正数！");
             exit;
         }

   

        for (var i = 0; i < Info.length; i++) {

            var JanPlan = document.getElementById("JanPlan" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("JanPlan" + Info[i].id + "").value);
            var FebPlan = document.getElementById("FebPlan" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("FebPlan" + Info[i].id + "").value);
            var MarPlan = document.getElementById("MarPlan" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("MarPlan" + Info[i].id + "").value);
            var AprPlan = document.getElementById("AprPlan" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("AprPlan" + Info[i].id + "").value);
            var MayPlan = document.getElementById("MayPlan" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("MayPlan" + Info[i].id + "").value);
            var JunPlan = document.getElementById("JunPlan" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("JunPlan" + Info[i].id + "").value);
            var JulPlan = document.getElementById("JulPlan" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("JulPlan" + Info[i].id + "").value);
            var AugPlan = document.getElementById("AugPlan" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("AugPlan" + Info[i].id + "").value);
            var SepPlan = document.getElementById("SepPlan" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("SepPlan" + Info[i].id + "").value);
            var OctPlan = document.getElementById("OctPlan" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("OctPlan" + Info[i].id + "").value);
            var NovPlan = document.getElementById("NovPlan" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("NovPlan" + Info[i].id + "").value);
            var DecPlan = document.getElementById("DecPlan" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("DecPlan" + Info[i].id + "").value);


            IdSave += Info[i].id + ";";
            JanPlanSave += JanPlan + ";";
            FebPlanSave += FebPlan + ";";
            MarPlanSave += MarPlan + ";";
            AprPlanSave += AprPlan + ";";
            MayPlanSave += MayPlan + ";";
            JunPlanSave += JunPlan + ";";
            JulPlanSave += JulPlan + ";";
            AugPlanSave += AugPlan + ";";
            SepPlanSave += SepPlan + ";";
            OctPlanSave += OctPlan + ";";
            NovPlanSave += NovPlan + ";";
            DecPlanSave += DecPlan + ";";

        }

        var Str = "?act=editcash&IdSave=" + IdSave + "&JanPlanSave=" + JanPlanSave + "&FebPlanSave=" + FebPlanSave + "&MarPlanSave=" + MarPlanSave + "&AprPlanSave=" + AprPlanSave + "&MayPlanSave=" + MayPlanSave + "&JunPlanSave=" + JunPlanSave +
                     "&JulPlanSave=" + JulPlanSave + "&AugPlanSave=" + AugPlanSave + "&SepPlanSave=" + SepPlanSave + "&OctPlanSave=" + OctPlanSave + "&NovPlanSave=" + NovPlanSave + "&DecPlanSave=" + DecPlanSave;
        //alert(Str);

        entity.PostStringInfo(Str, this, this.SaveCommitCallBack);
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

    function SaveCash() {
        var year = document.getElementById("year").value;
        if (confirm("确定要提交现金推算表吗？")) {
            var Str = "?act=savecash&year=" + year + "&mname=" + mname;
            // alert(Str);
            entity.PostStringInfo(Str, this, this.SaveCommitCallBack);
        }
    }
    function showInfoTwo() {

        var strHtml =

    '<table style="border-collapse:collapse;width:1600px;background:white;font-size:9pt" border="1"><tr height="28" bgcolor="#E7E7E7">' +
    '<th style="width:40px;text-align:center;">序号</th>' +
    '<th style="width:100px;text-align:center;">项目</th>' +
    '<th style="width:50px;text-align:center;">年</th>' +
    '<th id="0M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer" >1月</th>' +

    '<th id="1M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">2月</th>' +

    '<th id="2M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">3月</th>' +

    '<th id="3M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">4月</th>' +

    '<th id="4M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">5月</th>' +

    '<th id="5M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">6月</th>' +

    '<th id="6M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">7月</th>' +

    '<th id="7M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">8月</th>' +

    '<th id="8M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">9月</th>' +

    '<th id="9M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">10月</th>' +

    '<th id="10M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">11月</th>' +

    '<th id="11M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">12月</th>' +
    '<th style="width:50px;text-align:center;">年</th>' +

    '<th id="12M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">1月</th>' +

    '<th id="13M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">2月</th>' +

    '<th id="14M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">3月</th>' +

    '<th id="15M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">4月</th>' +

    '<th id="16M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">5月</th>' +

    '<th id="17M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">6月</th>' +

    '<th id="18M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">7月</th>' +

    '<th id="19M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">8月</th>' +

    '<th id="20M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">9月</th>' +

    '<th id="21M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">10月</th>' +

    '<th id="22M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">11月</th>' +

    '<th id="23M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">12月</th>';


        for (var i = 0; i < Info.length; i++) {

            if (Info[i].ItemsType == 2) {


                strHtml += '<tr bgcolor="#FFFF00" height="30">' +
                        '<td style="text-align:center;">' + i + '</td>' +
                        '<td id="It' + i + '" style="text-align:center;">' + Info[i].ItemsName + '</td>' +
                         '<td id="Itw' + i + '" style="text-align:center;">' + Info[i].cYear1 + '</td>' +

                       '<td id="0M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JanPlan1) + '</td>' +

                        '<td id="1M' + i + '" style="text-align:right;">' + Show_Red(Info[i].FebPlan1) + '</td>' +

                        '<td id="2M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MarPlan1) + '</td>' +

                        '<td id="3M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AprPlan1) + '</td>' +

                        '<td id="4M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MayPlan1) + '</td>' +

                        '<td id="5M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JunPlan1) + '</td>' +

                        '<td id="6M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JulPlan1) + '</td>' +

                        '<td id="7M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AugPlan1) + '</td>' +

                        '<td id="8M' + i + '" style="text-align:right;">' + Show_Red(Info[i].SepPlan1) + '</td>' +

                        '<td id="9M' + i + '" style="text-align:right;">' + Show_Red(Info[i].OctPlan1) + '</td>' +

                        '<td id="10M' + i + '" style="text-align:right;">' + Show_Red(Info[i].NovPlan1) + '</td>' +

                        '<td id="11M' + i + '" style="text-align:right;">' + Show_Red(Info[i].DecPlan1) + '</td>' +

                        '<td id="Itn' + i + '" style="text-align:center;">' + Info[i].cYear2 + '</td>' +

                        '<td id="12M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JanPlan2) + '</td>' +

                        '<td id="13M' + i + '" style="text-align:right;">' + Show_Red(Info[i].FebPlan2) + '</td>' +

                        '<td id="14M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MarPlan2) + '</td>' +

                        '<td id="15M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AprPlan2) + '</td>' +

                        '<td id="16M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MayPlan2) + '</td>' +

                        '<td id="17M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JunPlan2) + '</td>' +

                        '<td id="18M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JulPlan2) + '</td>' +

                        '<td id="19M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AugPlan2) + '</td>' +

                        '<td id="20M' + i + '" style="text-align:right;">' + Show_Red(Info[i].SepPlan2) + '</td>' +

                        '<td id="21M' + i + '" style="text-align:right;">' + Show_Red(Info[i].OctPlan2) + '</td>' +

                        '<td id="22M' + i + '" style="text-align:right;">' + Show_Red(Info[i].NovPlan2) + '</td>' +

                        '<td id="23M' + i + '" style="text-align:right;">' + Show_Red(Info[i].DecPlan2) + '</td>';

            } else {

                strHtml += '<tr bgcolor="#ffffff"  onMouseMove="this.bgColor=\'#D1DDAA\';" onMouseOut="this.bgColor=\'#FFFFFF\';" height="25">' +
                        '<td style="text-align:center;">' + i + '</td>';
                if (i == 0 || i == 1 || i == 6 || i == 7 || i == 10 || i == 11 || i == 15) {
                       strHtml += '<td id="It' + i + '" style="text-align:center;" bgcolor="#733FFC" >' + Info[i].ItemsName + '</td>';
                   }else{
                       strHtml += '<td id="It' + i + '" style="text-align:center;" bgcolor="#FFA384">' + Info[i].ItemsName + '</td>';
                   }
                   strHtml += '<td id="Itw' + i + '" style="text-align:center;">' + Info[i].cYear1 + '</td>' +

                       '<td id="0M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JanPlan1) + '</td>' +

                        '<td id="1M' + i + '" style="text-align:right;">' + Show_Red(Info[i].FebPlan1) + '</td>' +

                        '<td id="2M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MarPlan1) + '</td>' +

                        '<td id="3M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AprPlan1) + '</td>' +

                        '<td id="4M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MayPlan1) + '</td>' +

                        '<td id="5M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JunPlan1) + '</td>' +

                        '<td id="6M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JulPlan1) + '</td>' +

                        '<td id="7M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AugPlan1) + '</td>' +

                        '<td id="8M' + i + '" style="text-align:right;">' + Show_Red(Info[i].SepPlan1) + '</td>' +

                        '<td id="9M' + i + '" style="text-align:right;">' + Show_Red(Info[i].OctPlan1) + '</td>' +

                        '<td id="10M' + i + '" style="text-align:right;">' + Show_Red(Info[i].NovPlan1) + '</td>' +

                        '<td id="11M' + i + '" style="text-align:right;">' + Show_Red(Info[i].DecPlan1) + '</td>' +

                        '<td id="Itn' + i + '" style="text-align:center;">' + Info[i].cYear2 + '</td>' +

                        '<td id="12M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JanPlan2) + '</td>' +

                        '<td id="13M' + i + '" style="text-align:right;">' + Show_Red(Info[i].FebPlan2) + '</td>' +

                        '<td id="14M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MarPlan2) + '</td>' +

                        '<td id="15M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AprPlan2) + '</td>' +

                        '<td id="16M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MayPlan2) + '</td>' +

                        '<td id="17M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JunPlan2) + '</td>' +

                        '<td id="18M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JulPlan2) + '</td>' +

                        '<td id="19M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AugPlan2) + '</td>' +

                        '<td id="20M' + i + '" style="text-align:right;">' + Show_Red(Info[i].SepPlan2) + '</td>' +

                        '<td id="21M' + i + '" style="text-align:right;">' + Show_Red(Info[i].OctPlan2) + '</td>' +

                        '<td id="22M' + i + '" style="text-align:right;">' + Show_Red(Info[i].NovPlan2) + '</td>' +

                        '<td id="23M' + i + '" style="text-align:right;">' + Show_Red(Info[i].DecPlan2) + '</td>';


            }

        }
        strHtml += '</table></div>';
        document.getElementById("content-wrapper").innerHTML = strHtml;
        GetDeptName(2);
    }


    //往下拉列表添加已隐藏月份
    function AddOption(x) {

        var dishide = document.getElementById("dishide");
        dishide.options.add(new Option(x, x));
    }


    //加载年份
   // window.onload = function load() {
    function load_year() {
        //获取年份
        $.ajax({
            type: "post",
            async: false,
            url: "../Ashx/GetCashData.ashx",
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
        if (num == 0) {
            return " ";
        } else if (num < 0) {
            return "<font color=red>" + Show_qhh(num) + "</font>";
        } else {
            return Show_qhh(num);
        }

    }


    function LogOut() {
        if (confirm("确定退出系统？")) {
            window.open("../../LogIn.aspx", "_top");
        }
    }

    function isNumber(str) {
        var re = /^(-|\+)?\d+(\.\d+)?$/;
        if (!re.test(str)) {
            alert("输入的不是数字，请重输！");
            setYear();
         }
    }


</script>
</head>
  <body onload="InitCash()" class="skin-blue sidebar-mini" style="height: auto; min-height: 100%;">

<div class="content-wrapper" id="Div1" style="margin-left:15px">

  <div style="overflow-x:scroll"><table style="border-collapse:collapse;width:99%;background:white;height:15px" border="none";>
   <tr><td  id="welcome" style="height:20px;text-align:center;font-size:10pt;font-weight:bold;width:200px;"></td>
   <td  style="width:700px;border-style:none;padding:4px" valign="middle">
<table class="choYea" border="0";><td ><div style="width:30px">年：</div></td><td ><select id="year" style="width:70px"></select></td><td >至</td><td id="chooseYear1"> <select id="year2" style="width:70px"></select></td>
<td>
<div  id="head"></div>


</td></table></td>
<td  style="height:20px;width:200px;text-align:center;font-size:12pt;font-weight:bold;background-color:#9CB75B;border-style:none">现金推算表</td></tr></table>
  
      <div  id="content-wrapper" style="min-height: 298px;">
 
      </div>
     </div>
  <div class="control-sidebar-bg"></div>
</div>

</body>
</html>
