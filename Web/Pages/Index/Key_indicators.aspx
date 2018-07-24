<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Key_indicators.aspx.cs" Inherits="Pages_Index_Budget" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>关键指标追赶表</title>
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
    Month2 = new Array();
    var nowdate = new Date();
    var nowYear = nowdate.getFullYear();
    var passYear = nowYear - 1;
    var nowMonth = nowdate.getMonth() + 1;



    function InitKey() {
        load_year();
        //    mname = getCookie("name");
        mname = getCookie("membername");
        Grade = getCookie("grade");
        DeptName = getCookie("eptName");
        Manager = getCookie("manager");

        if (mname == "" || mname == null) {
            window.open("../../LogIn.aspx", "_top");
        }
        else {
            if (Grade == 0) {
                var Str = "?act=initkey&mname=" + mname + "&year=" + passYear + "&year2=" + nowYear;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            if (Grade == 1) {
                var Str = "?act=initkey&mname=" + mname + "&year=" + passYear + "&year2=" + nowYear;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            if (Grade == 5) {
                var Str = "?act=initkey&mname=" + mname + "&year=" + passYear + "&year2=" + nowYear;
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


             var year1 = year - 1;
             var Str = "?act=getkeydatabyyear&year=" + year1 + "&year2=" + year + "&mname=" + mname;
                //var Str = "?act=getkeydatabyyear&year=" + year + "&mname=" + mname;
                // alert(Str);
               entity.PostStringInfo(Str, this, this.InfoCallBack);
    }

    function InfoCallBack() {

        // alert("时间区间不能超过一年!!!!");
        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var IdNode = xmldoc.getElementsByTagName("Id");
                var DeptCodeNode = xmldoc.getElementsByTagName("DeptCode");

                var cYear1Node = xmldoc.getElementsByTagName("cYear1");
                var cMonthNode = xmldoc.getElementsByTagName("cMonth");
                var cYear_targetNode = xmldoc.getElementsByTagName("cYear_target");



                var cYear_ActualSalesPlan1Node = xmldoc.getElementsByTagName("cYear_ActualSalesPlan1");
                var cYear_ActualSalesReal1Node = xmldoc.getElementsByTagName("cYear_ActualSalesReal1");
                var cYear_PlanSalesPlan1Node = xmldoc.getElementsByTagName("cYear_PlanSalesPlan1");
                var cYear_PlanSalesReal1Node = xmldoc.getElementsByTagName("cYear_PlanSalesReal1");
                var cYear_CompletionRatioPlan1Node = xmldoc.getElementsByTagName("cYear_CompletionRatioPlan1");
                var cYear_CompletionRatioReal1Node = xmldoc.getElementsByTagName("cYear_CompletionRatioReal1");

                var cYear2Node = xmldoc.getElementsByTagName("cYear2");
                var cYear_ActualSalesPlan2Node = xmldoc.getElementsByTagName("cYear_ActualSalesPlan2");
                var cYear_ActualSalesReal2Node = xmldoc.getElementsByTagName("cYear_ActualSalesReal2");
                var cYear_PlanSalesPlan2Node = xmldoc.getElementsByTagName("cYear_PlanSalesPlan2");
                var cYear_PlanSalesReal2Node = xmldoc.getElementsByTagName("cYear_PlanSalesReal2");
                var cYear_CompletionRatioPlan2Node = xmldoc.getElementsByTagName("cYear_CompletionRatioPlan2");
                var cYear_CompletionRatioReal2Node = xmldoc.getElementsByTagName("cYear_CompletionRatioReal2");


                var IseditNode = xmldoc.getElementsByTagName("Isedit");
                var IsokNode = xmldoc.getElementsByTagName("Isok");
                var SketchNode = xmldoc.getElementsByTagName("Sketch");




                for (var i = 0; i < cMonthNode.length; i++) {
                    Info[i] = new Object();
                    Info[i].id = IdNode[i].childNodes.length > 0 ? IdNode[i].firstChild.nodeValue : "";
                    Info[i].DeptCode = DeptCodeNode[i].childNodes.length > 0 ? DeptCodeNode[i].firstChild.nodeValue : "";

                    Info[i].cYear1 = cYear1Node[i].childNodes.length > 0 ? cYear1Node[i].firstChild.nodeValue : "";
                    Info[i].cMonth = cMonthNode[i].childNodes.length > 0 ? cMonthNode[i].firstChild.nodeValue : "";
                    Info[i].cYear_target = cYear_targetNode[i].childNodes.length > 0 ? cYear_targetNode[i].firstChild.nodeValue : "";

                    Info[i].cYear_ActualSalesPlan1 = cYear_ActualSalesPlan1Node[i].childNodes.length > 0 ? cYear_ActualSalesPlan1Node[i].firstChild.nodeValue : "";
                    Info[i].cYear_ActualSalesReal1 = cYear_ActualSalesReal1Node[i].childNodes.length > 0 ? cYear_ActualSalesReal1Node[i].firstChild.nodeValue : "";
                    Info[i].cYear_PlanSalesPlan1 = cYear_PlanSalesPlan1Node[i].childNodes.length > 0 ? cYear_PlanSalesPlan1Node[i].firstChild.nodeValue : "";
                    Info[i].cYear_PlanSalesReal1 = cYear_PlanSalesReal1Node[i].childNodes.length > 0 ? cYear_PlanSalesReal1Node[i].firstChild.nodeValue : "";
                    Info[i].cYear_CompletionRatioPlan1 = cYear_CompletionRatioPlan1Node[i].childNodes.length > 0 ? cYear_CompletionRatioPlan1Node[i].firstChild.nodeValue : "";
                    Info[i].cYear_CompletionRatioReal1 = cYear_CompletionRatioReal1Node[i].childNodes.length > 0 ? cYear_CompletionRatioReal1Node[i].firstChild.nodeValue : "";

                    Info[i].cYear2 = cYear2Node[i].childNodes.length > 0 ? cYear2Node[i].firstChild.nodeValue : "";
                    Info[i].cYear_ActualSalesPlan2 = cYear_ActualSalesPlan2Node[i].childNodes.length > 0 ? cYear_ActualSalesPlan2Node[i].firstChild.nodeValue : "";
                    Info[i].cYear_ActualSalesReal2 = cYear_ActualSalesReal2Node[i].childNodes.length > 0 ? cYear_ActualSalesReal2Node[i].firstChild.nodeValue : "";
                    Info[i].cYear_PlanSalesPlan2 = cYear_PlanSalesPlan2Node[i].childNodes.length > 0 ? cYear_PlanSalesPlan2Node[i].firstChild.nodeValue : "";
                    Info[i].cYear_PlanSalesReal2 = cYear_PlanSalesReal2Node[i].childNodes.length > 0 ? cYear_PlanSalesReal2Node[i].firstChild.nodeValue : "";
                    Info[i].cYear_CompletionRatioPlan2 = cYear_CompletionRatioPlan2Node[i].childNodes.length > 0 ? cYear_CompletionRatioPlan2Node[i].firstChild.nodeValue : "";
                    Info[i].cYear_CompletionRatioReal2 = cYear_CompletionRatioReal2Node[i].childNodes.length > 0 ? cYear_CompletionRatioReal2Node[i].firstChild.nodeValue : "";


                    Info[i].Isedit = IseditNode[i].childNodes.length > 0 ? IseditNode[i].firstChild.nodeValue : "";
                    Info[i].Isok = IsokNode[i].childNodes.length > 0 ? IsokNode[i].firstChild.nodeValue : "";
                    Info[i].Sketch = SketchNode[i].childNodes.length > 0 ? SketchNode[i].firstChild.nodeValue : "";



                }
              showHead();
                showInfo();

            }
        }

        //alert(Info[0].cYear_target);
    }



    function showHead() {

        var strHtml = '<input type="button" name="btSure" id="btSure" onclick="setYear()" value="查询" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/>';
        if (Info[0].Isedit == 0 && Info[0].Isok == 0) {
            strHtml += '<input type="button" name="btSure" id="btSure" onclick="SaveCommit()" value="修改" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/>' +
             '<input type="button" name="btSure" id="btSure" onclick="SaveKey()" value="提交" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/>';
        }




        document.getElementById("head").innerHTML = strHtml;
    }





    function showInfo() {


        var strHtml =

    '<table style="border-collapse:collapse;width:1600px;background:white;font-size:9pt" border="1"><tr>' +
    '<th style="width:50px;text-align:center;" rowspan="2" scope="col">月份</th>' +
    '<th style="text-align:center;" colspan="3" scope="col" bgcolor="#C5BE97">' + Info[0].cYear1 + '年度</th>' +
      ' <th style="width:50px;text-align:center;" colspan="3" scope="col" bgcolor="#B6DDE8">原计划（' + Info[0].cYear2 + '年）</th>' +

    '<th style="width:50px;text-align:center;" colspan="3" scope="col" bgcolor="#9CB75B">进度调整（' + Info[0].cYear2 + '年）</th>' +

    '<th style="width:180px;text-align:center;" rowspan="2" scope="col">滚动周年</th>' +

    '<th style="width:70px;text-align:center;" rowspan="2" scope="col" bgcolor="#FFFF00">阶段目标 </th>' +

    ' <th style="width:80px;text-align:center;" rowspan="2" scope="col" bgcolor="#B6DDE8">按' + Info[0].cYear2 + '年度原计划</th>' +

    '<th style="width:60px;text-align:center;" rowspan="2" scope="col" bgcolor="#B6DDE8">差 额</th>' +

    '<th style="width:70px;text-align:center;" rowspan="2" scope="col">哭笑脸</th>' +

    '<th style="width:70px;text-align:center;" rowspan="2" scope="col" bgcolor="#9CB75B">' + Info[0].cYear2 + '年度进度调整后</th>' +

    '<th style="width:60px;text-align:center;" rowspan="2" scope="col" bgcolor="#9CB75B">差 额</th>' +

    '<th style="width:70px;text-align:center;" rowspan="2" scope="col">器笑脸</th>' +

    '<th style="width:150px;text-align:center;" rowspan="2" scope="col">措施、方法、招数简述</th>' +

    ' <th style="width:50px;text-align:center;" rowspan="2" scope="col">月份</th></tr>' +
    '<tr><th style="width:80px;text-align:center;" scope="col" bgcolor="#C5BE97">实际销售额</th>' +
    '<th style="width:80px;text-align:center;" scope="col" bgcolor="#C5BE97">计划销售额</th>' +
    '<th style="width:80px;text-align:center;" scope="col" bgcolor="#C5BE97">完成比例</th>' +
    '<th style="width:80px;text-align:center;" scope="col" bgcolor="#B6DDE8">实际销售额</th>' +
    '<th style="width:80px;text-align:center;" scope="col" bgcolor="#B6DDE8">计划销售额</th>' +
    '<th style="width:80px;text-align:center;" scope="col"  bgcolor="#B6DDE8">完成比例</th>' +
    '<th style="width:80px;text-align:center;" scope="col" bgcolor="#9CB75B">实际销售额</th>' +
    '<th style="width:80px;text-align:center;" scope="col" bgcolor="#9CB75B">计划销售额</th>' +
    '<th style="width:80px;text-align:center;" scope="col" bgcolor="#9CB75B">完成比例</th>' +
    '</tr>';

        var cYear_ActualSalesReal_total1 = 0;
        var cYear_PlanSalesReal_total1 = 0;
        var cYear_CompletionRatioReal_total1 = 0;

        var cYear_ActualSalesReal_total2 = 0;
        var cYear_PlanSalesReal_total2 = 0;
        var cYear_CompletionRatioReal_total2 = 0;

        var cYear_ActualSalesPlan_total2 = 0;
        var cYear_PlanSalesPlan_total2 = 0;
        var cYear_CompletionRatioPlan_total2 = 0;

        var StageTarget = 0;
        var cYear_balance = 0;
        var cYear_limit = 0;



        var cYear_ActualSalesReal_total1 = parseFloat(parseFloat(Info[0].cYear_ActualSalesReal1) + parseFloat(Info[1].cYear_ActualSalesReal1) + parseFloat(Info[2].cYear_ActualSalesReal1) + parseFloat(Info[3].cYear_ActualSalesReal1) + parseFloat(Info[4].cYear_ActualSalesReal1) + parseFloat(Info[5].cYear_ActualSalesReal1) + parseFloat(Info[6].cYear_ActualSalesReal1) + parseFloat(Info[7].cYear_ActualSalesReal1) + parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1));
        var cYear_PlanSalesReal_total1 = parseFloat(parseFloat(Info[0].cYear_PlanSalesReal1) + parseFloat(Info[1].cYear_PlanSalesReal1) + parseFloat(Info[2].cYear_PlanSalesReal1) + parseFloat(Info[3].cYear_PlanSalesReal1) + parseFloat(Info[4].cYear_PlanSalesReal1) + parseFloat(Info[5].cYear_PlanSalesReal1) + parseFloat(Info[6].cYear_PlanSalesReal1) + parseFloat(Info[7].cYear_PlanSalesReal1) + parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1));

        if (cYear_PlanSalesReal_total1 > 0) {
            var cYear_CompletionRatioReal_total1 = parseFloat(cYear_ActualSalesReal_total1 / cYear_PlanSalesReal_total1) * 100;
        } else {
            var cYear_CompletionRatioReal_total1 = 0;
        }
        var cYear_ActualSalesReal_total2 = parseFloat(parseFloat(Info[0].cYear_ActualSalesReal2) + parseFloat(Info[1].cYear_ActualSalesReal2) + parseFloat(Info[2].cYear_ActualSalesReal2) + parseFloat(Info[3].cYear_ActualSalesReal2) + parseFloat(Info[4].cYear_ActualSalesReal2) + parseFloat(Info[5].cYear_ActualSalesReal2) + parseFloat(Info[6].cYear_ActualSalesReal2) + parseFloat(Info[7].cYear_ActualSalesReal2) + parseFloat(Info[8].cYear_ActualSalesReal2) + parseFloat(Info[9].cYear_ActualSalesReal2) + parseFloat(Info[10].cYear_ActualSalesReal2) + parseFloat(Info[11].cYear_ActualSalesReal2));
        var cYear_PlanSalesReal_total2 = parseFloat(parseFloat(Info[0].cYear_PlanSalesReal2) + parseFloat(Info[1].cYear_PlanSalesReal2) + parseFloat(Info[2].cYear_PlanSalesReal2) + parseFloat(Info[3].cYear_PlanSalesReal2) + parseFloat(Info[4].cYear_PlanSalesReal2) + parseFloat(Info[5].cYear_PlanSalesReal2) + parseFloat(Info[6].cYear_PlanSalesReal2) + parseFloat(Info[7].cYear_PlanSalesReal2) + parseFloat(Info[8].cYear_PlanSalesReal2) + parseFloat(Info[9].cYear_PlanSalesReal2) + parseFloat(Info[10].cYear_PlanSalesReal2) + parseFloat(Info[11].cYear_PlanSalesReal2));
        if (cYear_PlanSalesReal_total2 > 0) {
            var cYear_CompletionRatioReal_total2 = parseFloat(cYear_ActualSalesReal_total2 / cYear_PlanSalesReal_total2) * 100;
        } else {
            var cYear_CompletionRatioReal_total2 = 0
        }
        var cYear_ActualSalesPlan_total2 = parseFloat(parseFloat(Info[0].cYear_ActualSalesPlan2) + parseFloat(Info[1].cYear_ActualSalesPlan2) + parseFloat(Info[2].cYear_ActualSalesPlan2) + parseFloat(Info[3].cYear_ActualSalesPlan2) + parseFloat(Info[4].cYear_ActualSalesPlan2) + parseFloat(Info[5].cYear_ActualSalesPlan2) + parseFloat(Info[6].cYear_ActualSalesPlan2) + parseFloat(Info[7].cYear_ActualSalesPlan2) + parseFloat(Info[8].cYear_ActualSalesPlan2) + parseFloat(Info[9].cYear_ActualSalesPlan2) + parseFloat(Info[10].cYear_ActualSalesPlan2) + parseFloat(Info[11].cYear_ActualSalesPlan2));
        var cYear_PlanSalesPlan_total2 = parseFloat(parseFloat(Info[0].cYear_PlanSalesPlan2) + parseFloat(Info[1].cYear_PlanSalesPlan2) + parseFloat(Info[2].cYear_PlanSalesPlan2) + parseFloat(Info[3].cYear_PlanSalesPlan2) + parseFloat(Info[4].cYear_PlanSalesPlan2) + parseFloat(Info[5].cYear_PlanSalesPlan2) + parseFloat(Info[6].cYear_PlanSalesPlan2) + parseFloat(Info[7].cYear_PlanSalesPlan2) + parseFloat(Info[8].cYear_PlanSalesPlan2) + parseFloat(Info[9].cYear_PlanSalesPlan2) + parseFloat(Info[10].cYear_PlanSalesPlan2) + parseFloat(Info[11].cYear_PlanSalesPlan2));
        if (cYear_PlanSalesPlan_total2 > 0) {
            var cYear_CompletionRatioPlan_total2 = parseFloat(cYear_ActualSalesPlan_total2 / cYear_PlanSalesPlan_total2) * 100;

        } else {
            var cYear_CompletionRatioPlan_total2 = 0;
        }
        var cYear_balance = parseFloat(Info[0].cYear_target - cYear_CompletionRatioReal_total1);
        var cYear_limit = cYear_balance / 12;




        for (var i = 0; i < Info.length; i++) {

            var LastYear = Info[i].cYear1;
            var LastMonth = parseInt(Info[i].cMonth) + 1;

            if (Info[i].cMonth1 == 12) {
                var LastYear_Month = Info[i].cYear2 + '年1月';
            } else {

                var LastYear_Month = LastYear + '年' + LastMonth + '月';

            }



            if (i == 0) {

                var StageTarget = parseFloat(parseFloat(cYear_CompletionRatioReal_total1) + parseFloat(cYear_limit));
            } else {

                var StageTarget = parseFloat(StageTarget + cYear_limit);

            }

            if (i == 0) {
                var ActualSalesReal = parseFloat(Info[1].cYear_ActualSalesReal1) + parseFloat(Info[2].cYear_ActualSalesReal1) + parseFloat(Info[3].cYear_ActualSalesReal1) + parseFloat(Info[4].cYear_ActualSalesReal1) + parseFloat(Info[5].cYear_ActualSalesReal1) + parseFloat(Info[6].cYear_ActualSalesReal1) + parseFloat(Info[7].cYear_ActualSalesReal1) + parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesReal2);
                var PlanReal = parseFloat(Info[1].cYear_PlanSalesReal1) + parseFloat(Info[2].cYear_PlanSalesReal1) + parseFloat(Info[3].cYear_PlanSalesReal1) + parseFloat(Info[4].cYear_PlanSalesReal1) + parseFloat(Info[5].cYear_PlanSalesReal1) + parseFloat(Info[6].cYear_PlanSalesReal1) + parseFloat(Info[7].cYear_PlanSalesReal1) + parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesReal2);
                if (PlanReal > 0) {
                    var cYear_Plan = (ActualSalesReal / PlanReal)*100;
                } else {
                    var cYear_Plan = 0;
                }
            }
            if (i == 1) {
                var ActualSalesReal = parseFloat(Info[2].cYear_ActualSalesReal1) + parseFloat(Info[3].cYear_ActualSalesReal1) + parseFloat(Info[4].cYear_ActualSalesReal1) + parseFloat(Info[5].cYear_ActualSalesReal1) + parseFloat(Info[6].cYear_ActualSalesReal1) + parseFloat(Info[7].cYear_ActualSalesReal1) + parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesReal2) + parseFloat(Info[1].cYear_ActualSalesReal2);
                var PlanReal = parseFloat(Info[2].cYear_PlanSalesReal1) + parseFloat(Info[3].cYear_PlanSalesReal1) + parseFloat(Info[4].cYear_PlanSalesReal1) + parseFloat(Info[5].cYear_PlanSalesReal1) + parseFloat(Info[6].cYear_PlanSalesReal1) + parseFloat(Info[7].cYear_PlanSalesReal1) + parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesReal2) + parseFloat(Info[1].cYear_PlanSalesReal2);
                if (PlanReal > 0) {
                    var cYear_Plan = (ActualSalesReal / PlanReal)*100;
                } else {
                    var cYear_Plan = 0;
                }
            }

            if (i == 2) {
                var ActualSalesReal = parseFloat(Info[3].cYear_ActualSalesReal1) + parseFloat(Info[4].cYear_ActualSalesReal1) + parseFloat(Info[5].cYear_ActualSalesReal1) + parseFloat(Info[6].cYear_ActualSalesReal1) + parseFloat(Info[7].cYear_ActualSalesReal1) + parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesReal2) + parseFloat(Info[1].cYear_ActualSalesReal2) + parseFloat(Info[2].cYear_ActualSalesReal2);
                var PlanReal = parseFloat(Info[3].cYear_PlanSalesReal1) + parseFloat(Info[4].cYear_PlanSalesReal1) + parseFloat(Info[5].cYear_PlanSalesReal1) + parseFloat(Info[6].cYear_PlanSalesReal1) + parseFloat(Info[7].cYear_PlanSalesReal1) + parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesReal2) + parseFloat(Info[1].cYear_PlanSalesReal2) + parseFloat(Info[2].cYear_PlanSalesReal2);
                if (PlanReal > 0) {
                    var cYear_Plan = (ActualSalesReal / PlanReal)*100;
                } else {
                    var cYear_Plan = 0;
                }
            }

            if (i == 3) {
                var ActualSalesReal = parseFloat(Info[4].cYear_ActualSalesReal1) + parseFloat(Info[5].cYear_ActualSalesReal1) + parseFloat(Info[6].cYear_ActualSalesReal1) + parseFloat(Info[7].cYear_ActualSalesReal1) + parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesReal2) + parseFloat(Info[1].cYear_ActualSalesReal2) + parseFloat(Info[2].cYear_ActualSalesReal2) + parseFloat(Info[3].cYear_ActualSalesReal2);
                var PlanReal = parseFloat(Info[4].cYear_PlanSalesReal1) + parseFloat(Info[5].cYear_PlanSalesReal1) + parseFloat(Info[6].cYear_PlanSalesReal1) + parseFloat(Info[7].cYear_PlanSalesReal1) + parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesReal2) + parseFloat(Info[1].cYear_PlanSalesReal2) + parseFloat(Info[2].cYear_PlanSalesReal2) + parseFloat(Info[3].cYear_PlanSalesReal2);
                if (PlanReal > 0) {
                    var cYear_Plan = (ActualSalesReal / PlanReal)*100;
                } else {
                    var cYear_Plan = 0;
                }
            }

            if (i == 4) {
                var ActualSalesReal = parseFloat(Info[5].cYear_ActualSalesReal1) + parseFloat(Info[6].cYear_ActualSalesReal1) + parseFloat(Info[7].cYear_ActualSalesReal1) + parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesReal2) + parseFloat(Info[1].cYear_ActualSalesReal2) + parseFloat(Info[2].cYear_ActualSalesReal2) + parseFloat(Info[3].cYear_ActualSalesReal2) + parseFloat(Info[4].cYear_ActualSalesReal2);
                var PlanReal = parseFloat(Info[5].cYear_PlanSalesReal1) + parseFloat(Info[6].cYear_PlanSalesReal1) + parseFloat(Info[7].cYear_PlanSalesReal1) + parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesReal2) + parseFloat(Info[1].cYear_PlanSalesReal2) + parseFloat(Info[2].cYear_PlanSalesReal2) + parseFloat(Info[3].cYear_PlanSalesReal2) + parseFloat(Info[4].cYear_PlanSalesReal2);
                if (PlanReal > 0) {
                    var cYear_Plan = (ActualSalesReal / PlanReal)*100;
                } else {
                    var cYear_Plan = 0;
                }
            }

            if (i == 5) {
                var ActualSalesReal = parseFloat(Info[6].cYear_ActualSalesReal1) + parseFloat(Info[7].cYear_ActualSalesReal1) + parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesReal2) + parseFloat(Info[1].cYear_ActualSalesReal2) + parseFloat(Info[2].cYear_ActualSalesReal2) + parseFloat(Info[3].cYear_ActualSalesReal2) + parseFloat(Info[4].cYear_ActualSalesReal2) + parseFloat(Info[5].cYear_ActualSalesReal2);
                var PlanReal = parseFloat(Info[6].cYear_PlanSalesReal1) + parseFloat(Info[7].cYear_PlanSalesReal1) + parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesReal2) + parseFloat(Info[1].cYear_PlanSalesReal2) + parseFloat(Info[2].cYear_PlanSalesReal2) + parseFloat(Info[3].cYear_PlanSalesReal2) + parseFloat(Info[4].cYear_PlanSalesReal2) + parseFloat(Info[5].cYear_PlanSalesReal2);
                if (PlanReal > 0) {
                    var cYear_Plan = (ActualSalesReal / PlanReal)*100;
                } else {
                    var cYear_Plan = 0;
                }
            }

            if (i == 6) {
                var ActualSalesReal = parseFloat(Info[7].cYear_ActualSalesReal1) + parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesReal2) + parseFloat(Info[1].cYear_ActualSalesReal2) + parseFloat(Info[2].cYear_ActualSalesReal2) + parseFloat(Info[3].cYear_ActualSalesReal2) + parseFloat(Info[4].cYear_ActualSalesReal2) + parseFloat(Info[5].cYear_ActualSalesReal2) + parseFloat(Info[6].cYear_ActualSalesReal2);
                var PlanReal = parseFloat(Info[7].cYear_PlanSalesReal1) + parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesReal2) + parseFloat(Info[1].cYear_PlanSalesReal2) + parseFloat(Info[2].cYear_PlanSalesReal2) + parseFloat(Info[3].cYear_PlanSalesReal2) + parseFloat(Info[4].cYear_PlanSalesReal2) + parseFloat(Info[5].cYear_PlanSalesReal2) + parseFloat(Info[6].cYear_PlanSalesReal2);
                if (PlanReal > 0) {
                    var cYear_Plan = (ActualSalesReal / PlanReal)*100;
                } else {
                    var cYear_Plan = 0;
                }
            }

            if (i == 7) {
                var ActualSalesReal = parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesReal2) + parseFloat(Info[1].cYear_ActualSalesReal2) + parseFloat(Info[2].cYear_ActualSalesReal2) + parseFloat(Info[3].cYear_ActualSalesReal2) + parseFloat(Info[4].cYear_ActualSalesReal2) + parseFloat(Info[5].cYear_ActualSalesReal2) + parseFloat(Info[6].cYear_ActualSalesReal2) + parseFloat(Info[7].cYear_ActualSalesReal2);
                var PlanReal = parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesReal2) + parseFloat(Info[1].cYear_PlanSalesReal2) + parseFloat(Info[2].cYear_PlanSalesReal2) + parseFloat(Info[3].cYear_PlanSalesReal2) + parseFloat(Info[4].cYear_PlanSalesReal2) + parseFloat(Info[5].cYear_PlanSalesReal2) + parseFloat(Info[6].cYear_PlanSalesReal2) + parseFloat(Info[7].cYear_PlanSalesReal2);
                if (PlanReal > 0) {
                    var cYear_Plan = (ActualSalesReal / PlanReal)*100;
                } else {
                    var cYear_Plan = 0;
                }
            }

            if (i == 8) {
                var ActualSalesReal = parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesReal2) + parseFloat(Info[1].cYear_ActualSalesReal2) + parseFloat(Info[2].cYear_ActualSalesReal2) + parseFloat(Info[3].cYear_ActualSalesReal2) + parseFloat(Info[4].cYear_ActualSalesReal2) + parseFloat(Info[5].cYear_ActualSalesReal2) + parseFloat(Info[6].cYear_ActualSalesReal2) + parseFloat(Info[7].cYear_ActualSalesReal2) + parseFloat(Info[8].cYear_ActualSalesReal2);
                var PlanReal = parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesReal2) + parseFloat(Info[1].cYear_PlanSalesReal2) + parseFloat(Info[2].cYear_PlanSalesReal2) + parseFloat(Info[3].cYear_PlanSalesReal2) + parseFloat(Info[4].cYear_PlanSalesReal2) + parseFloat(Info[5].cYear_PlanSalesReal2) + parseFloat(Info[6].cYear_PlanSalesReal2) + parseFloat(Info[7].cYear_PlanSalesReal2) + parseFloat(Info[8].cYear_PlanSalesReal2);
                if (PlanReal > 0) {
                    var cYear_Plan = (ActualSalesReal / PlanReal) * 100;
                } else {
                    var cYear_Plan = 0;
                }
            }
            if (i == 9) {
                var ActualSalesReal = parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesReal2) + parseFloat(Info[1].cYear_ActualSalesReal2) + parseFloat(Info[2].cYear_ActualSalesReal2) + parseFloat(Info[3].cYear_ActualSalesReal2) + parseFloat(Info[4].cYear_ActualSalesReal2) + parseFloat(Info[5].cYear_ActualSalesReal2) + parseFloat(Info[6].cYear_ActualSalesReal2) + parseFloat(Info[7].cYear_ActualSalesReal2) + parseFloat(Info[8].cYear_ActualSalesReal2) + parseFloat(Info[9].cYear_ActualSalesReal2);
                var PlanReal = parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesReal2) + parseFloat(Info[1].cYear_PlanSalesReal2) + parseFloat(Info[2].cYear_PlanSalesReal2) + parseFloat(Info[3].cYear_PlanSalesReal2) + parseFloat(Info[4].cYear_PlanSalesReal2) + parseFloat(Info[5].cYear_PlanSalesReal2) + parseFloat(Info[6].cYear_PlanSalesReal2) + parseFloat(Info[7].cYear_PlanSalesReal2) + parseFloat(Info[8].cYear_PlanSalesReal2) + parseFloat(Info[9].cYear_PlanSalesReal2);
                if (PlanReal > 0) {
                    var cYear_Plan = (ActualSalesReal / PlanReal) * 100;
                } else {
                    var cYear_Plan = 0;
                }
            }

            if (i == 10) {
                var ActualSalesReal = parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesReal2) + parseFloat(Info[1].cYear_ActualSalesReal2) + parseFloat(Info[2].cYear_ActualSalesReal2) + parseFloat(Info[3].cYear_ActualSalesReal2) + parseFloat(Info[4].cYear_ActualSalesReal2) + parseFloat(Info[5].cYear_ActualSalesReal2) + parseFloat(Info[6].cYear_ActualSalesReal2) + parseFloat(Info[7].cYear_ActualSalesReal2) + parseFloat(Info[8].cYear_ActualSalesReal2) + parseFloat(Info[9].cYear_ActualSalesReal2) + parseFloat(Info[10].cYear_ActualSalesReal2);
                var PlanReal = parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesReal2) + parseFloat(Info[1].cYear_PlanSalesReal2) + parseFloat(Info[2].cYear_PlanSalesReal2) + parseFloat(Info[3].cYear_PlanSalesReal2) + parseFloat(Info[4].cYear_PlanSalesReal2) + parseFloat(Info[5].cYear_PlanSalesReal2) + parseFloat(Info[6].cYear_PlanSalesReal2) + parseFloat(Info[7].cYear_PlanSalesReal2) + parseFloat(Info[8].cYear_PlanSalesReal2) + parseFloat(Info[9].cYear_PlanSalesReal2) + parseFloat(Info[10].cYear_PlanSalesReal2);
                if (PlanReal > 0) {
                    var cYear_Plan = (ActualSalesReal / PlanReal) * 100;
                } else {
                    var cYear_Plan = 0;
                }
            }

            if (i == 11) {
                var ActualSalesReal = parseFloat(Info[0].cYear_ActualSalesReal2) + parseFloat(Info[1].cYear_ActualSalesReal2) + parseFloat(Info[2].cYear_ActualSalesReal2) + parseFloat(Info[3].cYear_ActualSalesReal2) + parseFloat(Info[4].cYear_ActualSalesReal2) + parseFloat(Info[5].cYear_ActualSalesReal2) + parseFloat(Info[6].cYear_ActualSalesReal2) + parseFloat(Info[7].cYear_ActualSalesReal2) + parseFloat(Info[8].cYear_ActualSalesReal2) + parseFloat(Info[9].cYear_ActualSalesReal2) + parseFloat(Info[10].cYear_ActualSalesReal2) + parseFloat(Info[11].cYear_ActualSalesReal2);
                var PlanReal = parseFloat(Info[0].cYear_PlanSalesReal2) + parseFloat(Info[1].cYear_PlanSalesReal2) + parseFloat(Info[2].cYear_PlanSalesReal2) + parseFloat(Info[3].cYear_PlanSalesReal2) + parseFloat(Info[4].cYear_PlanSalesReal2) + parseFloat(Info[5].cYear_PlanSalesReal2) + parseFloat(Info[6].cYear_PlanSalesReal2) + parseFloat(Info[7].cYear_PlanSalesReal2) + parseFloat(Info[8].cYear_PlanSalesReal2) + parseFloat(Info[9].cYear_PlanSalesReal2) + parseFloat(Info[10].cYear_PlanSalesReal2) + parseFloat(Info[11].cYear_PlanSalesReal2);
                if (PlanReal > 0) {
                    var cYear_Plan = (ActualSalesReal / PlanReal) * 100;
                } else {
                    var cYear_Plan = 0;
                }
            }

            var PlanDifference = parseFloat(cYear_Plan - StageTarget);



            if (i == 0) {
                var ActualSalesPlan = parseFloat(Info[1].cYear_ActualSalesReal1) + parseFloat(Info[2].cYear_ActualSalesReal1) + parseFloat(Info[3].cYear_ActualSalesReal1) + parseFloat(Info[4].cYear_ActualSalesReal1) + parseFloat(Info[5].cYear_ActualSalesReal1) + parseFloat(Info[6].cYear_ActualSalesReal1) + parseFloat(Info[7].cYear_ActualSalesReal1) + parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesPlan2);
                var PlanPlan = parseFloat(Info[1].cYear_PlanSalesReal1) + parseFloat(Info[2].cYear_PlanSalesReal1) + parseFloat(Info[3].cYear_PlanSalesReal1) + parseFloat(Info[4].cYear_PlanSalesReal1) + parseFloat(Info[5].cYear_PlanSalesReal1) + parseFloat(Info[6].cYear_PlanSalesReal1) + parseFloat(Info[7].cYear_PlanSalesReal1) + parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesPlan2);
                if (PlanPlan > 0) {
                    var cYear_Now = (ActualSalesPlan / PlanPlan)*100;
                } else {
                    var cYear_Now = 0;
                }
            }
            if (i == 1) {
                var ActualSalesPlan = parseFloat(Info[2].cYear_ActualSalesReal1) + parseFloat(Info[3].cYear_ActualSalesReal1) + parseFloat(Info[4].cYear_ActualSalesReal1) + parseFloat(Info[5].cYear_ActualSalesReal1) + parseFloat(Info[6].cYear_ActualSalesReal1) + parseFloat(Info[7].cYear_ActualSalesReal1) + parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesPlan2) + parseFloat(Info[1].cYear_ActualSalesPlan2);
                var PlanPlan = parseFloat(Info[2].cYear_PlanSalesReal1) + parseFloat(Info[3].cYear_PlanSalesReal1) + parseFloat(Info[4].cYear_PlanSalesReal1) + parseFloat(Info[5].cYear_PlanSalesReal1) + parseFloat(Info[6].cYear_PlanSalesReal1) + parseFloat(Info[7].cYear_PlanSalesReal1) + parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesPlan2) + parseFloat(Info[1].cYear_PlanSalesPlan2);
                if (PlanPlan > 0) {
                    var cYear_Now = (ActualSalesPlan / PlanPlan) * 100;
                } else {
                    var cYear_Now = 0;
                }
            }

            if (i == 2) {
                var ActualSalesPlan = parseFloat(Info[3].cYear_ActualSalesReal1) + parseFloat(Info[4].cYear_ActualSalesReal1) + parseFloat(Info[5].cYear_ActualSalesReal1) + parseFloat(Info[6].cYear_ActualSalesReal1) + parseFloat(Info[7].cYear_ActualSalesReal1) + parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesPlan2) + parseFloat(Info[1].cYear_ActualSalesPlan2) + parseFloat(Info[2].cYear_ActualSalesPlan2);
                var PlanPlan = parseFloat(Info[3].cYear_PlanSalesReal1) + parseFloat(Info[4].cYear_PlanSalesReal1) + parseFloat(Info[5].cYear_PlanSalesReal1) + parseFloat(Info[6].cYear_PlanSalesReal1) + parseFloat(Info[7].cYear_PlanSalesReal1) + parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesPlan2) + parseFloat(Info[1].cYear_PlanSalesPlan2) + parseFloat(Info[2].cYear_PlanSalesPlan2);
                if (PlanPlan > 0) {
                    var cYear_Now = (ActualSalesPlan / PlanPlan) * 100;
                } else {
                    var cYear_Now = 0;
                }
            }

            if (i == 3) {
                var ActualSalesPlan = parseFloat(Info[4].cYear_ActualSalesReal1) + parseFloat(Info[5].cYear_ActualSalesReal1) + parseFloat(Info[6].cYear_ActualSalesReal1) + parseFloat(Info[7].cYear_ActualSalesReal1) + parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesPlan2) + parseFloat(Info[1].cYear_ActualSalesPlan2) + parseFloat(Info[2].cYear_ActualSalesPlan2) + parseFloat(Info[3].cYear_ActualSalesPlan2);
                var PlanPlan = parseFloat(Info[4].cYear_PlanSalesReal1) + parseFloat(Info[5].cYear_PlanSalesReal1) + parseFloat(Info[6].cYear_PlanSalesReal1) + parseFloat(Info[7].cYear_PlanSalesReal1) + parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesPlan2) + parseFloat(Info[1].cYear_PlanSalesPlan2) + parseFloat(Info[2].cYear_PlanSalesPlan2) + parseFloat(Info[3].cYear_PlanSalesPlan2);
                if (PlanPlan > 0) {
                    var cYear_Now = (ActualSalesPlan / PlanPlan) * 100;
                } else {
                    var cYear_Now = 0;
                }
            }

            if (i == 4) {
                var ActualSalesPlan = parseFloat(Info[5].cYear_ActualSalesReal1) + parseFloat(Info[6].cYear_ActualSalesReal1) + parseFloat(Info[7].cYear_ActualSalesReal1) + parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesPlan2) + parseFloat(Info[1].cYear_ActualSalesPlan2) + parseFloat(Info[2].cYear_ActualSalesPlan2) + parseFloat(Info[3].cYear_ActualSalesPlan2) + parseFloat(Info[4].cYear_ActualSalesPlan2);
                var PlanPlan = parseFloat(Info[5].cYear_PlanSalesReal1) + parseFloat(Info[6].cYear_PlanSalesReal1) + parseFloat(Info[7].cYear_PlanSalesReal1) + parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesPlan2) + parseFloat(Info[1].cYear_PlanSalesPlan2) + parseFloat(Info[2].cYear_PlanSalesPlan2) + parseFloat(Info[3].cYear_PlanSalesPlan2) + parseFloat(Info[4].cYear_PlanSalesPlan2);
                if (PlanPlan > 0) {
                    var cYear_Now = (ActualSalesPlan / PlanPlan) * 100;
                } else {
                    var cYear_Now = 0;
                }
            }

            if (i == 5) {
                var ActualSalesPlan = parseFloat(Info[6].cYear_ActualSalesReal1) + parseFloat(Info[7].cYear_ActualSalesReal1) + parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesPlan2) + parseFloat(Info[1].cYear_ActualSalesPlan2) + parseFloat(Info[2].cYear_ActualSalesPlan2) + parseFloat(Info[3].cYear_ActualSalesPlan2) + parseFloat(Info[4].cYear_ActualSalesPlan2) + parseFloat(Info[5].cYear_ActualSalesPlan2);
                var PlanPlan = parseFloat(Info[6].cYear_PlanSalesReal1) + parseFloat(Info[7].cYear_PlanSalesReal1) + parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesPlan2) + parseFloat(Info[1].cYear_PlanSalesPlan2) + parseFloat(Info[2].cYear_PlanSalesPlan2) + parseFloat(Info[3].cYear_PlanSalesPlan2) + parseFloat(Info[4].cYear_PlanSalesPlan2) + parseFloat(Info[5].cYear_PlanSalesPlan2);
                if (PlanPlan > 0) {
                    var cYear_Now = (ActualSalesPlan / PlanPlan) * 100;
                } else {
                    var cYear_Now = 0;
                }
            }

            if (i == 6) {
                var ActualSalesPlan = parseFloat(Info[7].cYear_ActualSalesReal1) + parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesPlan2) + parseFloat(Info[1].cYear_ActualSalesPlan2) + parseFloat(Info[2].cYear_ActualSalesPlan2) + parseFloat(Info[3].cYear_ActualSalesPlan2) + parseFloat(Info[4].cYear_ActualSalesPlan2) + parseFloat(Info[5].cYear_ActualSalesPlan2) + parseFloat(Info[6].cYear_ActualSalesPlan2);
                var PlanPlan = parseFloat(Info[7].cYear_PlanSalesReal1) + parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesPlan2) + parseFloat(Info[1].cYear_PlanSalesPlan2) + parseFloat(Info[2].cYear_PlanSalesPlan2) + parseFloat(Info[3].cYear_PlanSalesPlan2) + parseFloat(Info[4].cYear_PlanSalesPlan2) + parseFloat(Info[5].cYear_PlanSalesPlan2) + parseFloat(Info[6].cYear_PlanSalesPlan2);
                if (PlanPlan > 0) {
                    var cYear_Now = (ActualSalesPlan / PlanPlan) * 100;
                } else {
                    var cYear_Now = 0;
                }
            }

            if (i == 7) {
                var ActualSalesPlan = parseFloat(Info[8].cYear_ActualSalesReal1) + parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesPlan2) + parseFloat(Info[1].cYear_ActualSalesPlan2) + parseFloat(Info[2].cYear_ActualSalesPlan2) + parseFloat(Info[3].cYear_ActualSalesPlan2) + parseFloat(Info[4].cYear_ActualSalesPlan2) + parseFloat(Info[5].cYear_ActualSalesPlan2) + parseFloat(Info[6].cYear_ActualSalesPlan2) + parseFloat(Info[7].cYear_ActualSalesPlan2);
                var PlanPlan = parseFloat(Info[8].cYear_PlanSalesReal1) + parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesPlan2) + parseFloat(Info[1].cYear_PlanSalesPlan2) + parseFloat(Info[2].cYear_PlanSalesPlan2) + parseFloat(Info[3].cYear_PlanSalesPlan2) + parseFloat(Info[4].cYear_PlanSalesPlan2) + parseFloat(Info[5].cYear_PlanSalesPlan2) + parseFloat(Info[6].cYear_PlanSalesPlan2) + parseFloat(Info[7].cYear_PlanSalesPlan2);
                if (PlanPlan > 0) {
                    var cYear_Now = (ActualSalesPlan / PlanPlan) * 100;
                } else {
                    var cYear_Now = 0;
                }
            }

            if (i == 8) {
                var ActualSalesPlan = parseFloat(Info[9].cYear_ActualSalesReal1) + parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesPlan2) + parseFloat(Info[1].cYear_ActualSalesPlan2) + parseFloat(Info[2].cYear_ActualSalesPlan2) + parseFloat(Info[3].cYear_ActualSalesPlan2) + parseFloat(Info[4].cYear_ActualSalesPlan2) + parseFloat(Info[5].cYear_ActualSalesPlan2) + parseFloat(Info[6].cYear_ActualSalesPlan2) + parseFloat(Info[7].cYear_ActualSalesPlan2) + parseFloat(Info[8].cYear_ActualSalesPlan2);
                var PlanPlan = parseFloat(Info[9].cYear_PlanSalesReal1) + parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesPlan2) + parseFloat(Info[1].cYear_PlanSalesPlan2) + parseFloat(Info[2].cYear_PlanSalesPlan2) + parseFloat(Info[3].cYear_PlanSalesPlan2) + parseFloat(Info[4].cYear_PlanSalesPlan2) + parseFloat(Info[5].cYear_PlanSalesPlan2) + parseFloat(Info[6].cYear_PlanSalesPlan2) + parseFloat(Info[7].cYear_PlanSalesPlan2) + parseFloat(Info[8].cYear_PlanSalesPlan2);
                if (PlanPlan > 0) {
                    var cYear_Now = (ActualSalesPlan / PlanPlan) * 100;
                } else {
                    var cYear_Now = 0;
                }
            }
            if (i == 9) {
                var ActualSalesPlan = parseFloat(Info[10].cYear_ActualSalesReal1) + parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesPlan2) + parseFloat(Info[1].cYear_ActualSalesPlan2) + parseFloat(Info[2].cYear_ActualSalesPlan2) + parseFloat(Info[3].cYear_ActualSalesPlan2) + parseFloat(Info[4].cYear_ActualSalesPlan2) + parseFloat(Info[5].cYear_ActualSalesPlan2) + parseFloat(Info[6].cYear_ActualSalesPlan2) + parseFloat(Info[7].cYear_ActualSalesPlan2) + parseFloat(Info[8].cYear_ActualSalesPlan2) + parseFloat(Info[9].cYear_ActualSalesPlan2);
                var PlanPlan = parseFloat(Info[10].cYear_PlanSalesReal1) + parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesPlan2) + parseFloat(Info[1].cYear_PlanSalesPlan2) + parseFloat(Info[2].cYear_PlanSalesPlan2) + parseFloat(Info[3].cYear_PlanSalesPlan2) + parseFloat(Info[4].cYear_PlanSalesPlan2) + parseFloat(Info[5].cYear_PlanSalesPlan2) + parseFloat(Info[6].cYear_PlanSalesPlan2) + parseFloat(Info[7].cYear_PlanSalesPlan2) + parseFloat(Info[8].cYear_PlanSalesPlan2) + parseFloat(Info[9].cYear_PlanSalesPlan2);
                if (PlanPlan > 0) {
                    var cYear_Now = (ActualSalesPlan / PlanPlan) * 100;
                } else {
                    var cYear_Now = 0;
                }
            }

            if (i == 10) {
                var ActualSalesPlan = parseFloat(Info[11].cYear_ActualSalesReal1) + parseFloat(Info[0].cYear_ActualSalesPlan2) + parseFloat(Info[1].cYear_ActualSalesPlan2) + parseFloat(Info[2].cYear_ActualSalesPlan2) + parseFloat(Info[3].cYear_ActualSalesPlan2) + parseFloat(Info[4].cYear_ActualSalesPlan2) + parseFloat(Info[5].cYear_ActualSalesPlan2) + parseFloat(Info[6].cYear_ActualSalesPlan2) + parseFloat(Info[7].cYear_ActualSalesPlan2) + parseFloat(Info[8].cYear_ActualSalesPlan2) + parseFloat(Info[9].cYear_ActualSalesPlan2) + parseFloat(Info[10].cYear_ActualSalesPlan2);
                var PlanPlan = parseFloat(Info[11].cYear_PlanSalesReal1) + parseFloat(Info[0].cYear_PlanSalesPlan2) + parseFloat(Info[1].cYear_PlanSalesPlan2) + parseFloat(Info[2].cYear_PlanSalesPlan2) + parseFloat(Info[3].cYear_PlanSalesPlan2) + parseFloat(Info[4].cYear_PlanSalesPlan2) + parseFloat(Info[5].cYear_PlanSalesPlan2) + parseFloat(Info[6].cYear_PlanSalesPlan2) + parseFloat(Info[7].cYear_PlanSalesPlan2) + parseFloat(Info[8].cYear_PlanSalesPlan2) + parseFloat(Info[9].cYear_PlanSalesPlan2) + parseFloat(Info[10].cYear_PlanSalesPlan2);
                if (PlanPlan > 0) {
                    var cYear_Now = (ActualSalesPlan / PlanPlan) * 100;
                } else {
                    var cYear_Now = 0;
                }
            }

            if (i == 11) {
                var ActualSalesPlan = parseFloat(Info[0].cYear_ActualSalesPlan2) + parseFloat(Info[1].cYear_ActualSalesPlan2) + parseFloat(Info[2].cYear_ActualSalesPlan2) + parseFloat(Info[3].cYear_ActualSalesPlan2) + parseFloat(Info[4].cYear_ActualSalesPlan2) + parseFloat(Info[5].cYear_ActualSalesPlan2) + parseFloat(Info[6].cYear_ActualSalesPlan2) + parseFloat(Info[7].cYear_ActualSalesPlan2) + parseFloat(Info[8].cYear_ActualSalesPlan2) + parseFloat(Info[9].cYear_ActualSalesPlan2) + parseFloat(Info[10].cYear_ActualSalesPlan2) + parseFloat(Info[11].cYear_ActualSalesPlan2);
                var PlanPlan = parseFloat(Info[0].cYear_PlanSalesPlan2) + parseFloat(Info[1].cYear_PlanSalesPlan2) + parseFloat(Info[2].cYear_PlanSalesPlan2) + parseFloat(Info[3].cYear_PlanSalesPlan2) + parseFloat(Info[4].cYear_PlanSalesPlan2) + parseFloat(Info[5].cYear_PlanSalesPlan2) + parseFloat(Info[6].cYear_PlanSalesPlan2) + parseFloat(Info[7].cYear_PlanSalesPlan2) + parseFloat(Info[8].cYear_PlanSalesPlan2) + parseFloat(Info[9].cYear_PlanSalesPlan2) + parseFloat(Info[10].cYear_PlanSalesPlan2) + parseFloat(Info[11].cYear_PlanSalesPlan2);
                if (PlanPlan > 0) {
                    var cYear_Now = (ActualSalesPlan / PlanPlan) * 100;
                } else {
                    var cYear_Now = 0;
                }
            }

            var NowDifference = parseFloat(cYear_Now - StageTarget);



            strHtml += '<tr><tbody id="netPro">' +

            '<td id="11M' + i + '" style="text-align:center;">' + Info[i].cMonth + '月</td>' +
             '<td id="11M' + i + '" style="text-align:right;" bgcolor="#C5BE97">' + Show_Red(Info[i].cYear_ActualSalesReal1) + '</td>' +

               '<td id="11M' + i + '" style="text-align:right;" bgcolor="#C5BE97">' + Show_Red(Info[i].cYear_PlanSalesReal1) + '</td>' +
                '<td id="11M' + i + '" style="text-align:right;" bgcolor="#C5BE97">' + Show_Red_a(Info[i].cYear_CompletionRatioReal1) + '%</td>';


            if (Info[i].cMonth < nowMonth && Info[i].cYear2 == nowYear) {
                strHtml += '<td id="4M' + i + '" style="text-align:right;" bgcolor="#BFBFBF">' + Show_Red(Info[i].cYear_ActualSalesReal2) + '</td>';
            } else {
                strHtml += '<td id="4M' + i + '" style="text-align:right;" bgcolor="#B6DDE8">' + Show_Red(Info[i].cYear_ActualSalesReal2) + '</td>';
            }

            if (Info[i].cMonth < nowMonth && Info[i].cYear2 == nowYear) {
                strHtml += '<td id="4M' + i + '" style="text-align:right;" bgcolor="#BFBFBF">' + Show_Red(Info[i].cYear_PlanSalesReal2) + '</td>';
            } else {
                strHtml += '<td id="4M' + i + '" style="text-align:right;" bgcolor="#B6DDE8">' + Show_Red(Info[i].cYear_PlanSalesReal2) + '</td>';
            }

            if (Info[i].cMonth < nowMonth && Info[i].cYear2 == nowYear) {
                strHtml += '<td id="4M' + i + '" style="text-align:right;" bgcolor="#BFBFBF">' + Show_Red_a(Info[i].cYear_CompletionRatioReal2) + '%</td>';
            } else {
                strHtml += '<td id="4M' + i + '" style="text-align:right;" bgcolor="#B6DDE8">' + Show_Red_a(Info[i].cYear_CompletionRatioReal2) + '%</td>';
            }

            if (Info[i].cMonth < nowMonth && Info[i].cYear2 == nowYear) {

                strHtml += '<td id="7M' + i + '" style="text-align:center;" bgcolor="#BFBFBF"><input type="text" id="cYear_ActualSalesPlan' + Info[i].id + '" value="' + Info[i].cYear_ActualSalesPlan2 + '" onchange="EditcYear_ActualSalesPlan(' + Info[i].id + ')" size="8" onblur="isNumber(this.value)"';

                strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:#BFBFBF;background-color:#BFBFBF;';


                if (Info[i].cYear_ActualSalesPlan2 < 0) {
                           strHtml += 'color:#ff0000;"/></td>';
                       } else {
                           strHtml += 'color:#000000;"/></td>';
                       }


            } else {

                strHtml += '<td id="7M' + i + '" style="text-align:center;" bgcolor="#9CB75B"><input type="text" id="cYear_ActualSalesPlan' + Info[i].id + '" value="' + Info[i].cYear_ActualSalesPlan2 + '" onchange="EditcYear_ActualSalesPlan(' + Info[i].id + ')" size="8" onblur="isNumber(this.value)"';
                if (Info[i].cYear2 < nowYear || Info[i].Isedit == 1) {
                    strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:#9CB75B;background-color:#9CB75B;';

                    if (Info[i].cYear_ActualSalesPlan2 < 0) {
                        strHtml += 'color:#ff0000;"/></td>';
                    } else {
                        strHtml += 'color:#000000;"/></td>';
                    }
                } else {

                    if (Info[i].cYear_ActualSalesPlan2 < 0) {
                        strHtml += 'style="text-align: right;color:#ff0000;"/></td>';
                    } else {
                        strHtml += 'style="text-align: right;color:#000000;"/></td>';
                    }
                }


            }

            if (Info[i].cMonth < nowMonth && Info[i].cYear2 == nowYear) {

                strHtml += '<td id="9M' + i + '" style="text-align:center;" bgcolor="#BFBFBF"><input type="text" id="cYear_PlanSalesPlan' + Info[i].id + '" value="' + Info[i].cYear_PlanSalesPlan2 + '" onchange="EditcYear_PlanSalesPlan(' + Info[i].id + ')"  size="8" onblur="isNumber(this.value)"';

                strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:#BFBFBF;background-color:#BFBFBF;';
                if (Info[i].cYear_PlanSalesPlan2 < 0) {
                    strHtml += 'color:#ff0000;"/></td>';
                } else {
                    strHtml += 'color:#000000;"/></td>';
                }

            } else {
                strHtml += '<td id="9M' + i + '" style="text-align:center;" bgcolor="#9CB75B"><input type="text" id="cYear_PlanSalesPlan' + Info[i].id + '" value="' + Info[i].cYear_PlanSalesPlan2 + '" onchange="EditcYear_PlanSalesPlan(' + Info[i].id + ')"  size="8" onblur="isNumber(this.value)"';
                if (Info[i].cYear2 < nowYear || Info[i].Isedit == 1) {
                    strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:#9CB75B;background-color:#9CB75B;';
                    if (Info[i].cYear_PlanSalesPlan2 < 0) {
                        strHtml += 'color:#ff0000;"/></td>';
                    } else {
                        strHtml += 'color:#000000;"/></td>';
                    }
                } else {
                    if (Info[i].cYear_PlanSalesPlan2 < 0) {
                        strHtml += 'style="text-align: right;color:#ff0000;"/></td>';
                    } else {
                        strHtml += 'style="text-align: right;color:#000000;"/></td>';
                    }
                }


            }


            if (Info[i].cMonth < nowMonth && Info[i].cYear2 == nowYear) {
                strHtml += '<td id="4M' + i + '" style="text-align:right;" bgcolor="#BFBFBF">' + Show_Red_a(Info[i].cYear_CompletionRatioPlan2) + '%</td>';
            } else {
                strHtml += '<td id="4M' + i + '" style="text-align:right;" bgcolor="#9CB75B">' + Show_Red_a(Info[i].cYear_CompletionRatioPlan2) + '%</td>';
            }



            strHtml += '<td id="11M' + i + '" style="text-align:center;">' + LastYear_Month + '-' + Info[i].cYear2 + '年' + Info[i].cMonth + '月</td>' +

                '<td id="11M' + i + '" style="text-align:right;" bgcolor="#FFFF00">' + Show_Red_a(StageTarget.toFixed(1)) + '%</td>' +
               '<td id="11M' + i + '" style="text-align:right;" bgcolor="#B6DDE8">' + Show_Red_a(cYear_Plan.toFixed(1)) + '%</td>';


             strHtml += '<td id="11M' + i + '" style="text-align:right;" bgcolor="#B6DDE8"><input type="text" id="PlanDifference' + Info[i].id + '" value="' + PlanDifference.toFixed(1) + '"  size="3"';
             strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:#B6DDE8;background-color:#B6DDE8;';

                if (PlanDifference < 0) {
                           strHtml += 'color:#ff0000;"/>%</td>';
                       } else {
                           strHtml += 'color:#000000;"/>%</td>';
                       }



           strHtml += '<td id="11M' + i + '" style="text-align:center;">';
            if (PlanDifference > 0) {
                strHtml += '<img src="../../images/x.jpg" width="24" height="24" /><img src="../../images/x.jpg" width="24" height="24" />';

            } else {
                strHtml += '<img src="../../images/k.jpg" width="24" height="24" />';
            }



            strHtml += '</td>' +

        '<td id="11M' + i + '" style="text-align:right;" bgcolor="#9CB75B">' + Show_Red_a(cYear_Now.toFixed(1)) + '%</td>';

      
          strHtml += '<td id="11M' + i + '" style="text-align:right;" bgcolor="#9CB75B"><input type="text" id="NowDifference' + Info[i].id + '" value="' + NowDifference.toFixed(1) + '"  size="3"';
             strHtml += ' readonly="readonly" style="text-align: right;border:0;border-color:#9CB75B;background-color:#9CB75B;';

                if (NowDifference < 0) {
                           strHtml += 'color:#ff0000;"/>%</td>';
                       } else {
                           strHtml += 'color:#000000;"/>%</td>';
                       }




           strHtml +=  '<td id="11M' + i + '" style="text-align:center;">';
            if (NowDifference > 0) {
                strHtml += '<img src="../../images/x.jpg" width="24" height="24" /><img src="../../images/x.jpg" width="24" height="24" />';

            } else {
                strHtml += '<img src="../../images/k.jpg" width="24" height="24" />';
            }



            strHtml += '</td>' +

                       '<td id="10M' + i + '" style="text-align:center;"><input type="text" id="Sketch' + Info[i].id + '" value="' + Info[i].Sketch + '"  size="24"';
            if (Info[i].cYear2 < nowYear || Info[i].Isedit == 1) {
                strHtml += ' readonly="readonly" style="text-align: left;border:0;border-color:white;background-color:white; color:#000000;"';
            } else {
                strHtml += ' style="text-align: left"';
            }
            strHtml += '/></td>' +

              '<td id="11M' + i + '" style="text-align:center;">' + Info[i].cMonth + '月</td>' +
              '</tbody></td></tr>';



        }

        // var cYear_ActualSalesReal_total1 = cYear_ActualSalesReal_total1.toFixed(2);
        // var cYear_PlanSalesReal_total1 = cYear_PlanSalesReal_total1.toFixed(2);
        //var cYear_CompletionRatioReal_total1 = cYear_CompletionRatioReal_total1.toFixed(1);

        // var cYear_ActualSalesReal_total2 = cYear_ActualSalesReal_total2.toFixed(2);
        //var cYear_PlanSalesReal_total2 = cYear_PlanSalesReal_total2.toFixed(2);
        //var cYear_CompletionRatioReal_total2 = cYear_CompletionRatioReal_total2.toFixed(1);
        // var cYear_ActualSalesPlan_total2 = cYear_ActualSalesPlan_total2.toFixed(2);
        // var cYear_PlanSalesPlan_total2 = cYear_PlanSalesPlan_total2.toFixed(2);
        //var cYear_CompletionRatioPlan_total2 = cYear_CompletionRatioPlan_total2.toFixed(1);
        //var cYear_balance = cYear_balance.toFixed(1);
        // var cYear_limit = cYear_limit.toFixed(1);

        strHtml += '<tr ><td style="text-align:center;" height="30">合计</td>' +
                   '<td style="text-align:right;" height="30" bgcolor="#C5BE97">' + Show_Red(cYear_ActualSalesReal_total1.toFixed(0)) + '</td>' +
                   '<td style="text-align:right;" height="30" bgcolor="#C5BE97">' + Show_Red(cYear_PlanSalesReal_total1.toFixed(0)) + '</td>' +
                   '<td style="text-align:right;" height="30" bgcolor="#C5BE97">' + Show_Red_a(cYear_CompletionRatioReal_total1.toFixed(1)) + '%</td>' +
                    '<td style="text-align:right;" height="30" bgcolor="#B6DDE8">' + Show_Red(cYear_ActualSalesReal_total2.toFixed(0)) + '</td>' +
                   '<td style="text-align:right;" height="30" bgcolor="#B6DDE8">' + Show_Red(cYear_PlanSalesReal_total2.toFixed(0)) + '</td>' +
                   '<td style="text-align:right;" height="30" bgcolor="#B6DDE8">' + Show_Red_a(cYear_CompletionRatioReal_total2.toFixed(1)) + '%</td>' +
                     '<td style="text-align:right;" height="30" bgcolor="#9CB75B">' + Show_Red(cYear_ActualSalesPlan_total2.toFixed(0)) + '</td>' +
                   '<td style="text-align:right;" height="30" bgcolor="#9CB75B">' + Show_Red(cYear_PlanSalesPlan_total2.toFixed(0)) + '</td>' +
                   '<td style="text-align:right;" height="30" bgcolor="#9CB75B">' + Show_Red_a(cYear_CompletionRatioPlan_total2.toFixed(1))+ '%</td>' +
                   '<td style="text-align:center;"  colspan="10"></td>' +
                   '</tr>' +
                   '<tr ><td style="text-align:center;" height="30" colspan="2" bgcolor="#FFFF00">' + Info[0].cYear2 + '目标</td>' +


                '<td style="text-align:right;"  colspan="2" bgcolor="#FFFF00">';
        if (Info[0].cYear2 < nowYear || Info[0].Isedit == 1) {
            strHtml += '<input type="text" id="cYear_target" value="' + Info[0].cYear_target + '" onchange="SaveTarget(' + Info[0].cYear2 + ')" size="3" readonly="readonly" style="text-align: right;border:0;border-color:#FFFF00;background-color:#FFFF00;'; 
            
            
             if (Info[0].cYear_target < 0) {
                    strHtml += 'color:#ff0000;"/>%</td>';
                } else {
                    strHtml += 'color:#000000;"/>%</td>';
                }
        } else {
                strHtml += '<input type="text" id="cYear_target" value="' + Info[0].cYear_target + '" onblur="isNumber(this.value)" onchange="SaveTarget(' + Info[0].cYear2 + ')" size="3"';
            if (Info[0].cYear_target < 0) {
                    strHtml += 'style="text-align: right;color:#ff0000;"/>%</td>';
                } else {
                    strHtml += 'style="text-align: right;color:#000000;"/>%</td>';
                }
            
        }
        strHtml += '</td>' +


                     '<td style="text-align:center;"  colspan="16"></td>' +
                      '</tr>' +
                       '<tr ><td style="text-align:center;" height="30" colspan="2">差额</td>' +
                     '<td style="text-align:right;"  colspan="2">' + Show_Red_a(cYear_balance.toFixed(1)) + '%</td>' +
                     '<td style="text-align:center;"  colspan="16"></td>' +
                      '</tr>' +
                      '<tr ><td style="text-align:center;" height="30" colspan="2">每月额度</td>' +
                     '<td style="text-align:right;"  colspan="2">' + Show_Red_a(cYear_limit.toFixed(1)) + '%</td>' +
                     '<td style="text-align:center;"  colspan="16"></td>' +
                      '</tr>' +
                   '</tr></table>';
        document.getElementById("content-wrapper").innerHTML = strHtml;
        GetDeptName(1);
    }



    function SaveCommit() {

        var IdSave = "";
        var cYear_ActualSalesPlanSave = "";
        // var cYear_ActualSalesRealSave = "";
        var cYear_PlanSalesPlanSave = "";
        //var cYear_PlanSalesRealSave = "";
        //var cYear_CompletionRatioPlanSave = "";
        //var cYear_CompletionRatioRealSave = "";
        var SketchSave = "";
        var cYear_targetSave = "";



        for (var i = 0; i < Info.length; i++) {

            var cYear_ActualSalesPlan = document.getElementById("cYear_ActualSalesPlan" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("cYear_ActualSalesPlan" + Info[i].id + "").value);

            // var cYear_ActualSalesReal = document.getElementById("cYear_ActualSalesReal" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("cYear_ActualSalesReal" + Info[i].id + "").value);
            var cYear_PlanSalesPlan = document.getElementById("cYear_PlanSalesPlan" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("cYear_PlanSalesPlan" + Info[i].id + "").value);

            //var cYear_PlanSalesReal = document.getElementById("cYear_PlanSalesReal" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("cYear_PlanSalesReal" + Info[i].id + "").value);
            // var cYear_CompletionRatioPlan = document.getElementById("cYear_CompletionRatioPlan" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("cYear_CompletionRatioPlan" + Info[i].id + "").value);
            // var cYear_CompletionRatioReal = document.getElementById("cYear_CompletionRatioReal" + Info[i].id + "").value == "" ? 0 : parseFloat(document.getElementById("cYear_CompletionRatioReal" + Info[i].id + "").value);
            var Sketch = document.getElementById("Sketch" + Info[i].id + "").value == "" ? 0 : document.getElementById("Sketch" + Info[i].id + "").value;
            var cYear_target = document.getElementById("cYear_target").value == "" ? 0 : parseFloat(document.getElementById("cYear_target").value);



            IdSave += Info[i].id + ";";
            cYear_ActualSalesPlanSave += cYear_ActualSalesPlan + ";";
            // cYear_ActualSalesRealSave += cYear_ActualSalesReal + ";";
            cYear_PlanSalesPlanSave += cYear_PlanSalesPlan + ";";
            // cYear_PlanSalesRealSave += cYear_PlanSalesReal + ";";
            // cYear_CompletionRatioPlanSave += cYear_CompletionRatioPlan + ";";
            //  cYear_CompletionRatioRealSave += cYear_CompletionRatioReal + ";";
            SketchSave += Sketch + ";";
            cYear_targetSave += cYear_target + ";";


        }
        var Str = "?act=editkey&IdSave=" + IdSave + "&cYear_ActualSalesPlanSave=" + cYear_ActualSalesPlanSave + "&cYear_PlanSalesPlanSave=" + cYear_PlanSalesPlanSave +
                     "&SketchSave=" + SketchSave + "&cYear_targetSave=" + cYear_targetSave;

        // var Str = "?act=editkey&IdSave=" + IdSave + "&cYear_ActualSalesPlanSave=" + cYear_ActualSalesPlanSave + "&cYear_ActualSalesRealSave=" + cYear_ActualSalesRealSave + "&cYear_PlanSalesPlanSave=" + cYear_PlanSalesPlanSave + "&cYear_PlanSalesRealSave=" + cYear_PlanSalesRealSave + "&cYear_CompletionRatioPlanSave=" + cYear_CompletionRatioPlanSave + "&cYear_CompletionRatioRealSave=" + cYear_CompletionRatioRealSave +
        "&SketchSave=" + SketchSave + "&cYear_targetSave=" + cYear_targetSave;
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

    function SaveKey() {

        var PlanDifference = document.getElementById("PlanDifference" + Info[11].id + "").value == "" ? "0" : parseFloat(document.getElementById("PlanDifference" + Info[11].id + "").value);
        var NowDifference = document.getElementById("NowDifference" + Info[11].id + "").value == "" ? "0" : parseFloat(document.getElementById("NowDifference" + Info[11].id + "").value);


        if (PlanDifference < 0 || NowDifference < 0) {
            alert("年终为负数，不能提交！");
            
        } else {


            var year = document.getElementById("year").value;
            if (confirm("确定要提交关键指标追赶表表吗？")) {
                var Str = "?act=savekey&year=" + year + "&mname=" + mname;
                // alert(Str);
                entity.PostStringInfo(Str, this, this.SaveCommitCallBack);
            }
        }
    }

    function SaveTarget(year) {

        var cYear_target = document.getElementById("cYear_target").value;

        var Str = "?act=edittarget&year=" + year + "&mname=" + mname + "&cYear_target=" + cYear_target;
        // alert(Str);
        entity.PostStringInfo(Str, this, this.SaveCommitCallBack);

    }


    function EditcYear_ActualSalesPlan(x) {
        var cYear_ActualSalesPlan = document.getElementById("cYear_ActualSalesPlan" + x).value;

        var Str = "?act=editcyear_actualsalesplan&id=" + x + "&cYear_ActualSalesPlan=" + cYear_ActualSalesPlan;
        //alert(Str);
        entity.PostStringInfo(Str, this, this.SaveCommitCallBack);

    }

    function EditcYear_PlanSalesPlan(x) {
        var cYear_PlanSalesPlan = document.getElementById("cYear_PlanSalesPlan" + x).value;

        var Str = "?act=editcyear_plansalesplan&id=" + x + "&cYear_PlanSalesPlan=" + cYear_PlanSalesPlan;
        //alert(Str);
        entity.PostStringInfo(Str, this, this.SaveCommitCallBack);

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


    //加载年份
    //window.onload = function load() {
    function load_year() {
        //获取年份
        $.ajax({
            type: "post",
            async: false,
            url: "../Ashx/GetKeyData.ashx",
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
            },
            error: function (errorMsg) {
                alert(errorMsg.responseText);
                alert(errorMsg.status);
                alert("request data failed!!!");
            }
        });
    }


    function LogOut() {
        if (confirm("确定退出系统？")) {
            window.open("../../LogIn.aspx", "_top");
        }
    }



    function Show_qhh(num) {
        var parts = num.toString().split(".");
        parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return parts.join(".");
    }

    function Show_Red(num) {
        //if (num == 0) {
            //return " ";
       if (num < 0) {
            return "<font color=red>" + Show_qhh(num) + "</font>";
        } else {
            return Show_qhh(num);
        }

    }

    function Show_Red_a(num) {
    
        if (num < 0) {
            return "<font color=red>" + num + "</font>";
        } else {
            return num;
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
    <body onload="InitKey()" class="skin-blue sidebar-mini" style="height: auto; min-height: 100%;">


<div class="wrapper" style="height: auto; min-height: 100%;">



 <div class="content-wrapper" id="Div1" style="margin-left:15px">

  <div style="overflow-x:scroll"><table valign="top" style="border-collapse:collapse;width:99%;background:white;height:20px" border="1";>
   <tr><td valign="top" id="welcome" style="height:20px;text-align:center;font-size:10pt;font-weight:bold;width:200px;padding:4px"></td>
   <td  style="width:700px;border-style:none;height:20px">


<table class="choYea"><td ><div style="width:30px">年：</div></td><td ><select id="year" style="width:70px"></select></td> </td><td>

<div id="head"></div>

</td></table></td>
<td  style="height:20px;width:200px;text-align:center;font-size:11pt;font-weight:bold;background-color:#9CB75B;border-style:none;padding:4px">关键指标追赶表</td></tr></table>

  
      <div  id="content-wrapper" style="min-height: 298px;">
 
      </div>
     </div>
  <div class="control-sidebar-bg"></div>
</div>
</body>
</html>
