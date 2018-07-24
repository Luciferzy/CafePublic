<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CafeChase.aspx.cs" Inherits="Pages_Index_CafeChase" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>喝咖啡追赶表</title>
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
        .cafeTb
       {
           width:96%;
           text-align:right;
           margin:2px;
           border-color:#A4B7C4;
          border-width:thin;
           }
           

    </style>
<script type="text/javascript" language="javascript">
    var entity = new RSearchEngine('../../GetXml.aspx');
    mname = "";
    cYear_Target = 0;
    StageGoal = 0;

    Info = new Array();
    Month = new Array();
    Month2 = new Array();
    var nowdate = new Date();
    var nowYear = nowdate.getFullYear();
    var passYear = nowYear - 1;
    var beflatYear = nowYear - 2;
    var nowMonth = nowdate.getMonth() + 1;

    mname2 = getCookie("name");

    Grade = getCookie("grade");
    DeptName = getCookie("eptName");

    membername1 = getCookie("membername");
    membername = getCookie("checkname");

    function getCookie(name) {
        var strCookie = document.cookie;
        var arrCookie = strCookie.split("; ");
        for (var i = 0; i < arrCookie.length; i++) {
            var arr = arrCookie[i].split("=");
            if (arr[0] == name) return arr[1];
        }
        return "";
    }

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
                var Str = "?act=getcafechase&year=" + year + "&mname=" + membername;
                entity.PostStringInfo(Str, this, this.CafeInfoCallBack);
            } else {
                var Str = "?act=getcafechase2&year=" + year + "&year2=" + year2 + "&mname=" + membername;
                entity.PostStringInfo(Str, this, this.CafeInfoCallBack);
            }
        }
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

    function InitCafeChase() {
        load_year();
        //    mcode = getCookie("memcode");
        //        alert("KDJKDFL");


        if (membername == "" || membername == null) {
            window.open("../../LogIn.aspx", "_top");
        }
        else {
            if (Grade == 0) {

                var Str = "?act=getcafechase&mname=" + membername + "&year=" + nowYear;
                entity.PostStringInfo(Str, this, this.CafeInfoCallBack);
            }
            if (Grade == 1) {

                var Str = "?act=getcafechase&mname=" + membername + "&year=" + nowYear;
                entity.PostStringInfo(Str, this, this.CafeInfoCallBack);
            }
            if (Grade == 5) {

                var Str = "?act=getcafechase&mname=" + membername + "&year=" + nowYear;
                entity.PostStringInfo(Str, this, this.CafeInfoCallBack);
            }

        }


    }

    function Show_qhh(num) {
        var parts = num.toString().split(".");
        parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return parts.join(".");
    }

    function Show_Red(num, id) {

        if (num < 0) {
            //            document.getElementById("2018LaAllYear1").style = 'color:red';
            var change = Show_qhh(num);
            return change;
        } else {
            return Show_qhh(num);
        }

    }

    function CafeInfoCallBack() {
        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var cYearNode = xmldoc.getElementsByTagName("cYear");
                var cYear_TargetNode = xmldoc.getElementsByTagName("cYear_Target");
                var LaAllYearNode = xmldoc.getElementsByTagName("LaAllYear");
                var LastMonthPlanNode = xmldoc.getElementsByTagName("LastMonthPlan");
                var AdjustNode = xmldoc.getElementsByTagName("Adjust");
                var RollYearNode = xmldoc.getElementsByTagName("RollYear");
                var StageGoalNode = xmldoc.getElementsByTagName("StageGoal");
                var OriPlanNode = xmldoc.getElementsByTagName("OriPlan");
                var Balance1Node = xmldoc.getElementsByTagName("Balance1");
                var AdjustedNode = xmldoc.getElementsByTagName("Adjusted");
                var Balance2Node = xmldoc.getElementsByTagName("Balance2");
                var MeasureNode = xmldoc.getElementsByTagName("Measure");
                var TheMonthNode = xmldoc.getElementsByTagName("TheMonth");
                var DeptCodeNode = xmldoc.getElementsByTagName("DeptCode");
                for (var i = 0; i < TheMonthNode.length; i++) {
                    Info[i] = new Object();
                    Info[i].cYear = cYearNode[i].childNodes.length > 0 ? cYearNode[i].firstChild.nodeValue : "";
                    Info[i].cYear_Target = cYear_TargetNode[i].childNodes.length > 0 ? cYear_TargetNode[i].firstChild.nodeValue : "";
                    Info[i].LaAllYear = LaAllYearNode[i].childNodes.length > 0 ? LaAllYearNode[i].firstChild.nodeValue : "";
                    Info[i].LastMonthPlan = LastMonthPlanNode[i].childNodes.length > 0 ? LastMonthPlanNode[i].firstChild.nodeValue : "";
                    Info[i].Adjust = AdjustNode[i].childNodes.length > 0 ? AdjustNode[i].firstChild.nodeValue : "";
                    Info[i].RollYear = RollYearNode[i].childNodes.length > 0 ? RollYearNode[i].firstChild.nodeValue : "";
                    Info[i].StageGoal = StageGoalNode[i].childNodes.length > 0 ? StageGoalNode[i].firstChild.nodeValue : "";
                    Info[i].OriPlan = OriPlanNode[i].childNodes.length > 0 ? OriPlanNode[i].firstChild.nodeValue : "";
                    Info[i].Balance1 = Balance1Node[i].childNodes.length > 0 ? Balance1Node[i].firstChild.nodeValue : "";
                    Info[i].Adjusted = AdjustedNode[i].childNodes.length > 0 ? AdjustedNode[i].firstChild.nodeValue : "";
                    Info[i].Balance2 = Balance2Node[i].childNodes.length > 0 ? Balance2Node[i].firstChild.nodeValue : "";
                    Info[i].Measure = MeasureNode[i].childNodes.length > 0 ? MeasureNode[i].firstChild.nodeValue : "";
                    Info[i].TheMonth = TheMonthNode[i].childNodes.length > 0 ? TheMonthNode[i].firstChild.nodeValue : "";
                    Info[i].DeptCode = DeptCodeNode[i].childNodes.length > 0 ? DeptCodeNode[i].firstChild.nodeValue : "";
                }
                if (TheMonthNode.length == 12) {
                    document.getElementById("content-wrapper").innerHTML = "";
                    showHead();
                    showCafe();
                }
                if (TheMonthNode.length == 24) {
                    document.getElementById("content-wrapper").innerHTML = "";
                    showCafeTwo();
                }
            }
            else {
                alert("正在查询");
            }
        }
    }


    function showCafe() {
        var year = document.getElementById("year").value;

        var lastyear = year - 1;

        var goal = lastyear - 1;


        var strHtml = '<table id="tableOne" style="border-collapse:collapse;width:99%;background:white;font-size:9pt" border="1"><tr>' +
        '<th id="MonNo" style="width:4%;text-align:center;">月</th>' +
        '<th id="pasYear" style="width:8%;text-align:center;">' + lastyear + '</th>' +
        '<th id="OriMonPlan" style="width:8%;text-align:center;">截止上月原计划' + year + '</th>' +
        '<th id="Adjust" style="width:8%;text-align:center;">进度调整' + year + '</th>' +
        '<th id="RollYear" style="width:14%;text-align:center;">滚动周年</th>' +
        '<th id="StageGoal" style="width:8%;text-align:center;">阶段目标</th>' +
        '<th id="OriPlan" style="width:8%;text-align:center;">按' + year + '年度原计划</th>' +
        '<th id="Balance1" style="width:8%;text-align:center;">差额</th>' +
        '<th style="width:6%;text-align:center;"></th>' +
        '<th id="Adjusted" style="width:8%;text-align:center;">' + year + '年度进度调整后</th>' +
        '<th id="Balance2" style="width:8%;text-align:center;">差额</th>' +
        '<th style="width:6%;text-align:center;"></th>' +
        '<th id="Way" style="width:9%;text-align:center;">方法、措施</th>';

        for (var i = 0; i < 12; i++) {

            var toltal1 = parseFloat(Info[0].LaAllYear) + parseFloat(Info[1].LaAllYear) + parseFloat(Info[2].LaAllYear) + parseFloat(Info[3].LaAllYear) + parseFloat(Info[4].LaAllYear) + parseFloat(Info[5].LaAllYear) + parseFloat(Info[6].LaAllYear) + parseFloat(Info[7].LaAllYear) + parseFloat(Info[8].LaAllYear) + parseFloat(Info[9].LaAllYear) + parseFloat(Info[10].LaAllYear) + parseFloat(Info[11].LaAllYear);

            var toltal2 = parseFloat(Info[0].LastMonthPlan) + parseFloat(Info[1].LastMonthPlan) + parseFloat(Info[2].LastMonthPlan) + parseFloat(Info[3].LastMonthPlan) + parseFloat(Info[4].LastMonthPlan) + parseFloat(Info[5].LastMonthPlan) + parseFloat(Info[6].LastMonthPlan) + parseFloat(Info[7].LastMonthPlan) + parseFloat(Info[8].LastMonthPlan) + parseFloat(Info[9].LastMonthPlan) + parseFloat(Info[10].LastMonthPlan) + parseFloat(Info[11].LastMonthPlan);

            var toltal3 = parseFloat(Info[0].Adjust) + parseFloat(Info[1].Adjust) + parseFloat(Info[2].Adjust) + parseFloat(Info[3].Adjust) + parseFloat(Info[4].Adjust) + parseFloat(Info[5].Adjust) + parseFloat(Info[6].Adjust) + parseFloat(Info[7].Adjust) + parseFloat(Info[8].Adjust) + parseFloat(Info[9].Adjust) + parseFloat(Info[10].Adjust) + parseFloat(Info[11].Adjust);



            //滚动周年
            var LastYear = Info[i].cYear - 1;
            var LastMonth = parseInt(Info[i].TheMonth) + 1;
            if (LastMonth == 13) {
                LastMonth = 1;
            }



            strHtml += '<tr><td style="text-align:center" id="Month' + i + '">' + Info[i].TheMonth + '</td>' +
            '<td id="pasYear' + i + '" style="background-color:#bfbfbf"><input style="background-color:white" class="cafeTb" id="' + Info[i].cYear + 'LaAllYear' + Info[i].TheMonth + '" value="' + Show_Red(Info[i].LaAllYear, Info[i].cYear + 'LaAllYear' + Info[i].TheMonth) + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.-]/g,\'\')"';
            if (nowYear > Info[i].cYear) {

                strHtml += 'readonly="readonly" style="border:none;background-color:#bfbfbf"/></td>';

            } else {

                strHtml += 'style="background-color:#bfbfbf"/></td>';
            }


            strHtml += '<td id="plan' + i + '" style="background-color:#bfbfbf"><input style="background-color:white" class="cafeTb" id="' + Info[i].cYear + 'LastMonthPlan' + Info[i].TheMonth + '" value="' + Info[i].LastMonthPlan + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.-]/g,\'\')"';
            if (nowYear > Info[i].cYear) {

                strHtml += 'readonly="readonly" style="border:none;background-color:#bfbfbf"/></td>';

            } else {

                strHtml += 'style="background-color:#bfbfbf"/></td>';
            }
            //进度调整
            strHtml += '<td id="adjust' + i + '" style="background-color:lightblue"><input readonly="readonly" style="border:none;background-color:lightblue;margin:0" class="cafeTb" id="' + Info[i].cYear + 'Adjust' + Info[i].TheMonth + '" value="' + Info[i].Adjust + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.-]/g,\'\')"/></td>';


            if (i == 11) {
                strHtml += '<td id="roll' + i + '" style="font-size:8pt;text-align:center">' + Info[i].cYear + '年' + LastMonth + '月-' + Info[i].cYear + '年' + Info[i].TheMonth + '月</td>';
            } else {
                strHtml += '<td id="roll' + i + '" style="font-size:8pt;text-align:center">' + Info[i].RollYear + LastYear + '年' + LastMonth + '月-' + Info[i].cYear + '年' + Info[i].TheMonth + '月</td>';
            }

            //初始阶段目标
            var line = (Info[i].cYear_Target - toltal1) / 12;
            var stageGoal = toltal1 + line;
            //            alert(stageGoal);
            strHtml += '<td id="goal' + i + '" style="background-color:#FFEC23"><input readonly="readonly" style="background-color:#FFEC23;border:none;height:100%" class="cafeTb" id="' + Info[i].cYear + 'StageGoal' + Info[i].TheMonth + '"  onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"';
            if (nowYear > Info[i].cYear) {
                if (Info[i].TheMonth == 1) {
                    strHtml += 'value="' + parseFloat(stageGoal).toFixed(0) + '" readonly="readonly" style="border:none"/></td>';
                } else {
                    strHtml += 'value="' + Info[i].StageGoal + '" readonly="readonly" style="border:none"/></td>';
                }

            } else {
                if (Info[i].TheMonth == 1) {
                    strHtml += 'value="' + parseFloat(stageGoal).toFixed(0) + '"/></td>';
                } else {
                    strHtml += 'value="' + Info[i].StageGoal + '"/></td>';
                }
            }

            strHtml += '<td id="OriPlan' + i + '"><input readonly="readonly" style="border:none" class="cafeTb" id="' + Info[i].cYear + 'OriPlan' + Info[i].TheMonth + '" value="' + parseFloat(Info[i].OriPlan) + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"/></td>';

            strHtml += '<td id="baA' + i + '" style="background-color:#FFEC23"><input readonly="readonly" style="background-color:#FFEC23;border:none;height:100%" class="cafeTb" id="' + Info[i].cYear + 'Balance1' + Info[i].TheMonth + '" value="' + parseFloat(Info[i].Balance1) + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"/></td>';

            strHtml += '<td id="imgA' + i + '">';

            if (Info[i].Balance1 > 0) {
                strHtml += '<img src="../../images/x.jpg" width="20" height="20" />';
            } else {
                strHtml += '<img src="../../images/k.jpg" width="20" height="20" /><img src="../../images/k.jpg" width="20" height="20" />';
            }
            strHtml += '</td>' +

             '<td id="adjusted' + i + '"><input readonly="readonly" style="border:none" class="cafeTb" id="' + Info[i].cYear + 'Adjusted' + Info[i].TheMonth + '" value="' + parseFloat(Info[i].Adjusted) + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"/></td>';

            strHtml += '<td id="baB' + i + '" style="background-color:#FFEC23"><input readonly="readonly" style="background-color:#FFEC23;border:none;height:100%" class="cafeTb" id="' + Info[i].cYear + 'Balance2' + Info[i].TheMonth + '" value="' + parseFloat(Info[i].Balance2) + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"/></td>';
            strHtml += '<td id="imgB' + i + '">';

            if (Info[i].Balance2 > 0) {
                strHtml += '<img src="../../images/x.jpg" width="20" height="20" />';
            } else {
                strHtml += '<img src="../../images/k.jpg" width="20" height="20" /><img src="../../images/k.jpg" width="20" height="20" />';
            }
            strHtml += '</td>' +

          '<img src="" style="margin-left:5px" id="imgAd2"/><img src="" style="margin-left:5px" id="imgAdb2"/></td>' +
            '<td id="mea' + i + '"><input class="cafeTb" id="' + Info[i].cYear + 'Measure' + Info[i].TheMonth + '" value="' + Info[i].Measure + '" onchange="FuncAdd(this)"';
            if (nowYear > Info[i].cYear) {
                strHtml += 'readonly="readonly" style="border:none"/></td>';
            } else {
                strHtml += '/></td>';
            }

        }



        strHtml += '<tr><td id="colec"  style="text-align:center">合计</td><td id="toltal1" style="text-align:right">' + parseFloat(toltal1) + '</td><td id="toltal2" style="text-align:right">' + parseFloat(toltal2) + '</td><td id="toltal3" style="text-align:right">' + parseFloat(toltal3) + '</td></tr>' +

        '<tr><td id="befoYear" style="font-size:12pt;text-align:center;background-color:#FFEC23">' + goal + '<br>目标</td>' +

        '<td style="background-color:#FFEC23"><input type="text" id="goal" class="cafeTb" style="background-color:#FFEC23;height:100% " onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"';
        if (Info[0].cYear < nowYear) {
            strHtml += 'onchange="GetGoal(this)" value="' + Info[0].cYear_Target + '" readonly="readonly"/></td><td></td><td></td></tr>';
        } else {
            strHtml += 'onchange="GetGoal(this)" value="' + Info[0].cYear_Target + '"/></td><td></td><td></td></tr>';
        }
        var balaval = Info[0].cYear_Target - toltal1;
        var balaval2 = toltal2 - Info[0].cYear_Target;
        var balaval3 = toltal3 - Info[0].cYear_Target;
        var line = balaval / 12;
        strHtml += '<tr><td id="balance" style="text-align:center">差额</td>' +
        '<td id="balaval" style="text-align:right">' + parseFloat(balaval) + '</td>' +
        '<td id="balaval2" style="text-align:right">' + parseFloat(balaval2) + '</td>' +
        '<td id="balaval3" style="text-align:right">' + parseFloat(balaval3) + '</td></tr>' +
        '<tr><td id="lines" style="text-align:center">额度/月</td><td id="line" style="text-align:right">' + parseFloat(line).toFixed(0) + '</td><td></td><td></td></tr>' +
         '<tr style="height:50px;width:100px;border:none"></tr>';
        strHtml += '</table>';
        document.getElementById("content-wrapper").innerHTML = strHtml;

        GetDeptName(1);


    }



    function showCafeTwo() {


        var year = document.getElementById("year").value;
        var year2 = document.getElementById("year2").value;
        var beflatyear = year - 1;
        var goal = beflatyear - 1;
        var strHtml = '<table id="tableOne" style="border-collapse:collapse;width:99%;background:white;font-size:9pt" border="1"><tr>' +
        '<th id="MonNo" style="width:4%;text-align:center;">月</th>' +
        '<th id="pasYear" style="width:8%;text-align:center;">' + year + '</th>' +
        '<th id="OriMonPlan" style="width:8%;text-align:center;">截止上月原计划' + year2 + '</th>' +
        '<th id="Adjust" style="width:8%;text-align:center;">进度调整' + year2 + '</th>' +
        '<th id="RollYear" style="width:14%;text-align:center;">滚动周年</th>' +
        '<th id="StageGoal" style="width:8%;text-align:center;">阶段目标</th>' +
        '<th id="OriPlan" style="width:8%;text-align:center;">按' + year2 + '年度原计划</th>' +
        '<th id="Balance1" style="width:8%;text-align:center;">差额</th>' +
        '<th style="width:6%;text-align:center;"></th>' +
        '<th id="Adjusted" style="width:8%;text-align:center;">' + year2 + '年度进度调整后</th>' +
        '<th id="Balance2" style="width:8%;text-align:center;">差额</th>' +
        '<th style="width:6%;text-align:center;"></th>' +
        '<th id="Way" style="width:9%;text-align:center;">方法、措施</th>';
        for (var i = 0; i < 12; i++) {

            var toltal1 = parseFloat(Info[0].LaAllYear) + parseFloat(Info[1].LaAllYear) + parseFloat(Info[2].LaAllYear) + parseFloat(Info[3].LaAllYear) + parseFloat(Info[4].LaAllYear) + parseFloat(Info[5].LaAllYear) + parseFloat(Info[6].LaAllYear) + parseFloat(Info[7].LaAllYear) + parseFloat(Info[8].LaAllYear) + parseFloat(Info[9].LaAllYear) + parseFloat(Info[10].LaAllYear) + parseFloat(Info[11].LaAllYear);

            var toltal2 = parseFloat(Info[0].LastMonthPlan) + parseFloat(Info[1].LastMonthPlan) + parseFloat(Info[2].LastMonthPlan) + parseFloat(Info[3].LastMonthPlan) + parseFloat(Info[4].LastMonthPlan) + parseFloat(Info[5].LastMonthPlan) + parseFloat(Info[6].LastMonthPlan) + parseFloat(Info[7].LastMonthPlan) + parseFloat(Info[8].LastMonthPlan) + parseFloat(Info[9].LastMonthPlan) + parseFloat(Info[10].LastMonthPlan) + parseFloat(Info[11].LastMonthPlan);

            var toltal3 = parseFloat(Info[0].Adjust) + parseFloat(Info[1].Adjust) + parseFloat(Info[2].Adjust) + parseFloat(Info[3].Adjust) + parseFloat(Info[4].Adjust) + parseFloat(Info[5].Adjust) + parseFloat(Info[6].Adjust) + parseFloat(Info[7].Adjust) + parseFloat(Info[8].Adjust) + parseFloat(Info[9].Adjust) + parseFloat(Info[10].Adjust) + parseFloat(Info[11].Adjust);



            //滚动周年
            var LastYear = Info[i].cYear - 1;
            var LastMonth = parseInt(Info[i].TheMonth) + 1;
            if (LastMonth == 13) {
                LastMonth = 1;
            }



            strHtml += '<tr><td style="text-align:center" id="Month' + i + '">' + Info[i].TheMonth + '</td>' +
            '<td id="pasYear' + i + '" style="background-color:#bfbfbf"><input style="background-color:white" class="cafeTb" id="' + Info[i].cYear + 'LaAllYear' + Info[i].TheMonth + '" value="' + Info[i].LaAllYear + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.-]/g,\'\')"';
            if (nowYear > Info[i].cYear) {

                strHtml += 'readonly="readonly" style="border:none;background-color:#bfbfbf"/></td>';

            } else {

                strHtml += 'style="border:none;background-color:#bfbfbf"/></td>';
            }


            strHtml += '<td id="plan' + i + '" style="background-color:#bfbfbf"><input style="background-color:white" class="cafeTb" id="' + Info[i].cYear + 'LastMonthPlan' + Info[i].TheMonth + '" value="' + Info[i].LastMonthPlan + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.-]/g,\'\')"';
            if (nowYear > Info[i].cYear) {

                strHtml += 'readonly="readonly" style="border:none;background-color:#bfbfbf"/></td>';

            } else {

                strHtml += 'style="border:none;background-color:#bfbfbf"/></td>';
            }

            strHtml += '<td id="adjust' + i + '" style="background-color:lightblue"><input readonly="readonly" style="border:none;background-color:lightblue" class="cafeTb" id="' + Info[i].cYear + 'Adjust' + Info[i].TheMonth + '" value="' + Info[i].Adjust + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.-]/g,\'\')"/></td>';


            if (i == 11) {
                strHtml += '<td id="roll' + i + '" style="font-size:8pt;text-align:center">' + Info[i].cYear + '年' + LastMonth + '月-' + Info[i].cYear + '年' + Info[i].TheMonth + '月</td>';
            } else {
                strHtml += '<td id="roll' + i + '" style="font-size:8pt;text-align:center">' + Info[i].RollYear + LastYear + '年' + LastMonth + '月-' + Info[i].cYear + '年' + Info[i].TheMonth + '月</td>';
            }

            //初始阶段目标
            var line = (Info[i].cYear_Target - toltal1) / 12;
            var stageGoal = toltal1 + line;
            //            alert(stageGoal);
            strHtml += '<td id="goal' + i + '" style="background-color:#FFEC23"><input style="background-color:#FFEC23;border:none;height:100%" class="cafeTb" id="' + Info[i].cYear + 'StageGoal' + Info[i].TheMonth + '"  onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"';
            if (nowYear > Info[i].cYear) {
                if (Info[i].TheMonth == 1) {
                    strHtml += 'value="' + parseFloat(stageGoal).toFixed(0) + '" readonly="readonly" style="border:none"/></td>';
                } else {
                    strHtml += 'value="' + Info[i].StageGoal + '" readonly="readonly" style="border:none"/></td>';
                }

            } else {
                if (Info[i].TheMonth == 1) {
                    strHtml += 'value="' + parseFloat(stageGoal).toFixed(0) + '"/></td>';
                } else {
                    strHtml += 'value="' + Info[i].StageGoal + '"/></td>';
                }
            }

            strHtml += '<td id="OriPlan' + i + '"><input readonly="readonly" style="border:none" class="cafeTb" id="' + Info[i].cYear + 'OriPlan' + Info[i].TheMonth + '" value="' + parseFloat(Info[i].OriPlan) + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"/></td>';

            strHtml += '<td id="baA' + i + '" style="background-color:#FFEC23"><input readonly="readonly" style="background-color:#FFEC23;border:none;height:100%" class="cafeTb" id="' + Info[i].cYear + 'Balance1' + Info[i].TheMonth + '" value="' + parseFloat(Info[i].Balance1) + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"/></td>';

            strHtml += '<td id="imgA' + i + '">';

            if (Info[i].Balance1 > 0) {
                strHtml += '<img src="../../images/x.jpg" width="20" height="20" />';
            } else {
                strHtml += '<img src="../../images/k.jpg" width="20" height="20" /><img src="../../images/k.jpg" width="20" height="20" />';
            }
            strHtml += '</td>' +

             '<td id="adjusted' + i + '"><input readonly="readonly" style="border:none" class="cafeTb" id="' + Info[i].cYear + 'Adjusted' + Info[i].TheMonth + '" value="' + parseFloat(Info[i].Adjusted) + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"/></td>';

            strHtml += '<td id="baB' + i + '" style="background-color:#FFEC23"><input readonly="readonly" style="background-color:#FFEC23;border:none;height:100%" class="cafeTb" id="' + Info[i].cYear + 'Balance2' + Info[i].TheMonth + '" value="' + parseFloat(Info[i].Balance2) + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"/></td>';
            strHtml += '<td id="imgB' + i + '">';

            if (Info[i].Balance2 > 0) {
                strHtml += '<img src="../../images/x.jpg" width="20" height="20" />';
            } else {
                strHtml += '<img src="../../images/k.jpg" width="20" height="20" /><img src="../../images/k.jpg" width="20" height="20" />';
            }
            strHtml += '</td>' +

          '<img src="" style="margin-left:5px" id="imgAd2"/><img src="" style="margin-left:5px" id="imgAdb2"/></td>' +
            '<td id="mea' + i + '"><input class="cafeTb" id="' + Info[i].cYear + 'Measure' + Info[i].TheMonth + '" value="' + Info[i].Measure + '" onchange="FuncAdd(this)"';
            if (nowYear > Info[i].cYear) {
                strHtml += 'readonly="readonly" style="border:none"/></td>';
            } else {
                strHtml += '/></td>';
            }
        }



        strHtml += '<tr><td id="colec"  style="text-align:center">合计</td><td id="toltal1" style="text-align:right">' + parseFloat(toltal1) + '</td><td id="toltal2" style="text-align:right">' + parseFloat(toltal2) + '</td><td id="toltal3" style="text-align:right">' + parseFloat(toltal3) + '</td></tr>' +

        '<tr><td id="befoYear" style="font-size:12pt;text-align:center;background-color:#FFEC23">' + goal + '<br>目标</td>' +

        '<td style="background-color:#FFEC23"><input type="text" id="goal" class="cafeTb" style="background-color:#FFEC23;height:100% " onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"';
        if (Info[0].cYear < nowYear) {
            strHtml += 'onchange="GetGoal(this)" value="' + Info[0].cYear_Target + '" readonly="readonly"/></td><td></td><td></td></tr>';
        } else {
            strHtml += 'onchange="GetGoal(this)" value="' + Info[0].cYear_Target + '"/></td><td></td><td></td></tr>';
        }
        var balaval = Info[0].cYear_Target - toltal1;
        var balaval2 = toltal2 - Info[0].cYear_Target;
        var balaval3 = toltal3 - Info[0].cYear_Target;
        var line = balaval / 12;
        strHtml += '<tr><td id="balance" style="text-align:center">差额</td>' +
        '<td id="balaval" style="text-align:right">' + parseFloat(balaval) + '</td>' +
        '<td id="balaval2" style="text-align:right">' + parseFloat(balaval2) + '</td>' +
        '<td id="balaval3" style="text-align:right">' + parseFloat(balaval3) + '</td></tr>' +
        '<tr><td id="lines" style="text-align:center">额度/月</td><td id="line" style="text-align:right">' + parseFloat(line).toFixed(0) + '</td><td></td><td></td></tr>' +
         '<tr style="height:50px;width:100px;border:none"></tr>';
        strHtml += '</table>';


        strHtml += '<table id="tableOne" style="border-collapse:collapse;width:99%;background:white;font-size:9pt" border="1"><tr>' +
        '<th id="MonNo" style="width:4%;text-align:center;">月</th>' +
        '<th id="pasYear" style="width:8%;text-align:center;">' + beflatyear + '</th>' +
        '<th id="OriMonPlan" style="width:8%;text-align:center;">截止上月原计划' + year + '</th>' +
        '<th id="Adjust" style="width:8%;text-align:center;">进度调整' + year + '</th>' +
        '<th id="RollYear" style="width:14%;text-align:center;">滚动周年</th>' +
        '<th id="StageGoal" style="width:8%;text-align:center;">阶段目标</th>' +
        '<th id="OriPlan" style="width:8%;text-align:center;">按' + year + '年度原计划</th>' +
        '<th id="Balance1" style="width:8%;text-align:center;">差额</th>' +
        '<th style="width:6%;text-align:center;"></th>' +
        '<th id="Adjusted" style="width:8%;text-align:center;">' + year + '年度进度调整后</th>' +
        '<th id="Balance2" style="width:8%;text-align:center;">差额</th>' +
        '<th style="width:6%;text-align:center;"></th>' +
        '<th id="Way" style="width:9%;text-align:center;">方法、措施</th>';

        for (var i = 12; i < 24; i++) {

            var toltal1 = parseFloat(Info[0].LaAllYear) + parseFloat(Info[1].LaAllYear) + parseFloat(Info[2].LaAllYear) + parseFloat(Info[3].LaAllYear) + parseFloat(Info[4].LaAllYear) + parseFloat(Info[5].LaAllYear) + parseFloat(Info[6].LaAllYear) + parseFloat(Info[7].LaAllYear) + parseFloat(Info[8].LaAllYear) + parseFloat(Info[9].LaAllYear) + parseFloat(Info[10].LaAllYear) + parseFloat(Info[11].LaAllYear);

            var toltal2 = parseFloat(Info[0].LastMonthPlan) + parseFloat(Info[1].LastMonthPlan) + parseFloat(Info[2].LastMonthPlan) + parseFloat(Info[3].LastMonthPlan) + parseFloat(Info[4].LastMonthPlan) + parseFloat(Info[5].LastMonthPlan) + parseFloat(Info[6].LastMonthPlan) + parseFloat(Info[7].LastMonthPlan) + parseFloat(Info[8].LastMonthPlan) + parseFloat(Info[9].LastMonthPlan) + parseFloat(Info[10].LastMonthPlan) + parseFloat(Info[11].LastMonthPlan);

            var toltal3 = parseFloat(Info[0].Adjust) + parseFloat(Info[1].Adjust) + parseFloat(Info[2].Adjust) + parseFloat(Info[3].Adjust) + parseFloat(Info[4].Adjust) + parseFloat(Info[5].Adjust) + parseFloat(Info[6].Adjust) + parseFloat(Info[7].Adjust) + parseFloat(Info[8].Adjust) + parseFloat(Info[9].Adjust) + parseFloat(Info[10].Adjust) + parseFloat(Info[11].Adjust);



            //滚动周年
            var LastYear = Info[i].cYear - 1;
            var LastMonth = parseInt(Info[i].TheMonth) + 1;
            if (LastMonth == 13) {
                LastMonth = 1;
            }



            strHtml += '<tr><td style="text-align:center" id="Month' + i + '">' + Info[i].TheMonth + '</td>' +
            '<td id="pasYear' + i + '"><input  class="cafeTb" id="' + Info[i].cYear + 'LaAllYear' + Info[i].TheMonth + '" value="' + Info[i].LaAllYear + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.-]/g,\'\')"';
            if (nowYear > Info[i].cYear) {

                strHtml += 'readonly="readonly" style="border:none;background-color:#bfbfbf"/></td>';

            } else {

                strHtml += 'style="border:none;background-color:#bfbfbf"/></td>';
            }


            strHtml += '<td id="plan' + i + '"><input  class="cafeTb" id="' + Info[i].cYear + 'LastMonthPlan' + Info[i].TheMonth + '" value="' + Info[i].LastMonthPlan + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.-]/g,\'\')"';
            if (nowYear > Info[i].cYear) {

                strHtml += 'readonly="readonly" style="border:none;background-color:#bfbfbf"/></td>';

            } else {

                strHtml += 'style="border:none;background-color:#bfbfbf"/></td>';
            }

            strHtml += '<td id="adjust' + i + '"><input readonly="readonly" style="border:none;background-color:lightblue;margin:0" class="cafeTb" id="' + Info[i].cYear + 'Adjust' + Info[i].TheMonth + '" value="' + Info[i].Adjust + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.-]/g,\'\')"/></td>';


            if (i == 23) {
                strHtml += '<td id="roll' + i + '" style="font-size:8pt;text-align:center">' + Info[i].cYear + '年' + LastMonth + '月-' + Info[i].cYear + '年' + Info[i].TheMonth + '月</td>';
            } else {
                strHtml += '<td id="roll' + i + '" style="font-size:8pt;text-align:center">' + Info[i].RollYear + LastYear + '年' + LastMonth + '月-' + Info[i].cYear + '年' + Info[i].TheMonth + '月</td>';
            }

            //初始阶段目标
            var line = (Info[i].cYear_Target - toltal1) / 12;
            var stageGoal = toltal1 + line;
            //            alert(stageGoal);
            strHtml += '<td id="goal' + i + '"><input style="background-color:#FFEC23;border:none;height:100%" class="cafeTb" id="' + Info[i].cYear + 'StageGoal' + Info[i].TheMonth + '"  onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"';
            if (nowYear > Info[i].cYear) {
                if (Info[i].TheMonth == 1) {
                    strHtml += 'value="' + parseFloat(stageGoal) + '" readonly="readonly" style="border:none"/></td>';
                } else {
                    strHtml += 'value="' + Info[i].StageGoal + '" readonly="readonly" style="border:none"/></td>';
                }

            } else {
                if (Info[i].TheMonth == 1) {
                    strHtml += 'value="' + parseFloat(stageGoal) + '"/></td>';
                } else {
                    strHtml += 'value="' + Info[i].StageGoal + '"/></td>';
                }
            }

            strHtml += '<td id="OriPlan' + i + '"><input class="cafeTb" id="' + Info[i].cYear + 'OriPlan' + Info[i].TheMonth + '" value="' + parseFloat(Info[i].OriPlan) + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"';
            if (nowYear > Info[i].cYear) {
                strHtml += 'readonly="readonly" style="border:none"/></td>';
            } else {
                strHtml += '/></td>';
            }

            strHtml += '<td id="baA' + i + '"><input style="background-color:#FFEC23;border:none;height:100%" class="cafeTb" id="' + Info[i].cYear + 'Balance1' + Info[i].TheMonth + '" value="' + parseFloat(Info[i].Balance1) + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"';
            if (nowYear > Info[i].cYear) {
                strHtml += 'readonly="readonly" style="border:none"/></td>';
            } else {
                strHtml += '/></td>';
            }

            strHtml += '<td id="imgA' + i + '">';

            if (Info[i].Balance1 > 0) {
                strHtml += '<img src="../../images/x.jpg" width="20" height="20" />';
            } else {
                strHtml += '<img src="../../images/k.jpg" width="20" height="20" /><img src="../../images/k.jpg" width="20" height="20" />';
            }
            strHtml += '</td>' +

             '<td id="adjusted' + i + '"><input class="cafeTb" id="' + Info[i].cYear + 'Adjusted' + Info[i].TheMonth + '" value="' + parseFloat(Info[i].Adjusted) + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"';
            if (nowYear > Info[i].cYear) {
                strHtml += 'readonly="readonly" style="border:none"/></td>';
            } else {
                strHtml += '/></td>';
            }
            strHtml += '<td id="baB' + i + '"><input style="background-color:#FFEC23;border:none;height:100%" class="cafeTb" id="' + Info[i].cYear + 'Balance2' + Info[i].TheMonth + '" value="' + parseFloat(Info[i].Balance2) + '" onchange="FuncAdd(this)" onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"';
            if (nowYear > Info[i].cYear) {
                strHtml += 'readonly="readonly" style="border:none"/></td>';
            } else {
                strHtml += '/></td>';
            }
            strHtml += '<td id="imgB' + i + '">';

            if (Info[i].Balance2 > 0) {
                strHtml += '<img src="../../images/x.jpg" width="20" height="20" />';
            } else {
                strHtml += '<img src="../../images/k.jpg" width="20" height="20" /><img src="../../images/k.jpg" width="20" height="20" />';
            }
            strHtml += '</td>' +

          '<img src="" style="margin-left:5px" id="imgAd2"/><img src="" style="margin-left:5px" id="imgAdb2"/></td>' +
            '<td id="mea' + i + '"><input class="cafeTb" id="' + Info[i].cYear + 'Measure' + Info[i].TheMonth + '" value="' + Info[i].Measure + '" onchange="FuncAdd(this)"';
            if (nowYear > Info[i].cYear) {
                strHtml += 'readonly="readonly" style="border:none"/></td>';
            } else {
                strHtml += '/></td>';
            }

        }



        strHtml += '<tr><td id="colec"  style="text-align:center">合计</td><td id="toltal1" style="text-align:right">' + parseFloat(toltal1) + '</td><td id="toltal2" style="text-align:right">' + parseFloat(toltal2) + '</td><td id="toltal3" style="text-align:right">' + parseFloat(toltal3) + '</td></tr>' +

        '<tr><td id="befoYear" style="font-size:12pt;text-align:center;background-color:#FFEC23">' + goal + '<br>目标</td>' +

        '<td style="background-color:#FFEC23"><input type="text" id="goal" class="cafeTb" style="background-color:#FFEC23;height:100% " onkeyup="this.value=this.value.replace(/[^0-9.]/g,\'\')"';
        if (Info[0].cYear < nowYear) {
            strHtml += 'onchange="GetGoal(this)" value="' + Info[0].cYear_Target + '" readonly="readonly"/></td><td></td><td></td></tr>';
        } else {
            strHtml += 'onchange="GetGoal(this)" value="' + Info[0].cYear_Target + '"/></td><td></td><td></td></tr>';
        }
        var balaval = Info[0].cYear_Target - toltal1;
        var balaval2 = toltal2 - Info[0].cYear_Target;
        var balaval3 = toltal3 - Info[0].cYear_Target;
        var line = balaval / 12;
        strHtml += '<tr><td id="balance" style="text-align:center">差额</td>' +
        '<td id="balaval" style="text-align:right">' + parseFloat(balaval) + '</td>' +
        '<td id="balaval2" style="text-align:right">' + parseFloat(balaval2) + '</td>' +
        '<td id="balaval3" style="text-align:right">' + parseFloat(balaval3) + '</td></tr>' +
        '<tr><td id="lines" style="text-align:center">额度/月</td><td id="line" style="text-align:right">' + parseFloat(line).toFixed(0) + '</td><td></td><td></td></tr>' +
         '<tr style="height:50px;width:100px;border:none"></tr>';
        strHtml += '</table>';

        document.getElementById("content-wrapper").innerHTML = strHtml;
        GetDeptName(1);
    }

    function GetGoal(goal) {
        var goalval = goal.value;
        if (goalval != "") {

            var toltal1 = document.getElementById("toltal1").innerHTML;
            var toltal2 = document.getElementById("toltal2").innerHTML;
            var toltal3 = document.getElementById("toltal3").innerHTML;
            var balaval = goalval - toltal1;
            var balaval2 = toltal2 - goalval;
            var balaval3 = toltal3 - goalval;
            document.getElementById("balaval").innerHTML = parseFloat(balaval);
            document.getElementById("balaval2").innerHTML = parseFloat(balaval2);
            document.getElementById("balaval3").innerHTML = parseFloat(balaval3);
            document.getElementById("line").innerHTML = parseFloat(balaval / 12);
        }
        else {
            document.getElementById("balaval").innerHTML = 0;
            document.getElementById("balaval2").innerHTML = 0;
            document.getElementById("balaval3").innerHTML = 0;
            document.getElementById("line").innerHTML = 0;
        }
    }

    function FuncAdd(input) {
        var mname2 = membername;
        var inputid = input.id;

        var head = input.id.replace(/[^a-zA-z]/ig, "");
        var inputNo = input.id.replace(/[^0-9]/ig, "");

        changeYear = inputNo.substring(0, 4);
        if (inputNo.length == 5) {
            month = inputNo.substring(4, 5);
        }
        if (inputNo.length == 6) {
            month = inputNo.substring(4, 6);
        }
        var value = input.value;

        setYear();

        var Str = "?act=changecafe&year=" + changeYear + "&mname=" + mname2 + "&month=" + month + "&value=" + value + "&head=" + head;
        entity.PostStringInfo(Str, this, this.ChangeCafeCallBack);
    }

    function ChangeCafeCallBack() {
        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                setYear();
            }
            else {
                window.status = '正在写入信息，请稍候...';

            }
        }
    }

    function ChangeCafe() {
        mname = membername;
        stageYear = document.getElementById("year2").value;

        B14 = document.getElementById("toltal1").innerHTML;
        B17 = document.getElementById("line").innerHTML;
        yearGoal = document.getElementById("goal").value;

        //阶段目标
        var sGoal = parseFloat(B14) + parseFloat(B17);
        //         alert(sGoal);
        var sGoal2 = parseFloat(sGoal) + parseFloat(B17);
        document.getElementById("" + stageYear + "StageGoal" + 2 + "").value = sGoal2;

        var sGoal3 = parseFloat(sGoal2) + parseFloat(B17);
        document.getElementById("" + stageYear + "StageGoal" + 3 + "").value = sGoal3;

        var sGoal4 = parseFloat(sGoal3) + parseFloat(B17);
        document.getElementById("" + stageYear + "StageGoal" + 4 + "").value = sGoal4;

        var sGoal5 = parseFloat(sGoal4) + parseFloat(B17);
        document.getElementById("" + stageYear + "StageGoal" + 5 + "").value = sGoal5;

        var sGoal6 = parseFloat(sGoal5) + parseFloat(B17);
        document.getElementById("" + stageYear + "StageGoal" + 6 + "").value = sGoal6;

        var sGoal7 = parseFloat(sGoal6) + parseFloat(B17);
        document.getElementById("" + stageYear + "StageGoal" + 7 + "").value = sGoal7;

        var sGoal8 = parseFloat(sGoal7) + parseFloat(B17);
        document.getElementById("" + stageYear + "StageGoal" + 8 + "").value = sGoal8;

        var sGoal9 = parseFloat(sGoal8) + parseFloat(B17);
        document.getElementById("" + stageYear + "StageGoal" + 9 + "").value = sGoal9;

        var sGoal10 = parseFloat(sGoal9) + parseFloat(B17);
        document.getElementById("" + stageYear + "StageGoal" + 10 + "").value = sGoal10;

        var sGoal11 = parseFloat(sGoal10) + parseFloat(B17);
        document.getElementById("" + stageYear + "StageGoal" + 11 + "").value = sGoal11;

        var sGoal12 = parseFloat(sGoal11) + parseFloat(B17);
        document.getElementById("" + stageYear + "StageGoal" + 12 + "").value = sGoal12;

        var Str = "?act=changestagegoal&year=" + stageYear + "&mname=" + mname + "&sGoal=" + sGoal + "&sGoal2=" + sGoal2 + "&sGoal3=" + sGoal3 + "&sGoal4=" + sGoal4 + "&sGoal5=" + sGoal5 + "&sGoal6=" + sGoal6 + "&sGoal7=" + sGoal7 + "&sGoal8=" + sGoal8 + "&sGoal9=" + sGoal9 + "&sGoal10=" + sGoal10 + "&sGoal11=" + sGoal11 + "&sGoal12=" + sGoal12 + "&yearGoal=" + yearGoal;
        entity.PostStringInfo(Str, this, this.ChangeStageGoalCallBack);


    }
    function ChangeStageGoalCallBack() {
        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                setYear();
                ChangeCafeRest();
            }
            else {
                window.status = '正在写入信息，请稍候...';

            }
        }

    }

    function ChangeCafeRest() {
        mname = membername;
        OriYear = document.getElementById("year2").value;

        B14 = document.getElementById("toltal1").innerHTML;
        B1 = document.getElementById("" + OriYear + "LaAllYear" + 1 + "").value;
        B2 = document.getElementById("" + OriYear + "LaAllYear" + 2 + "").value;
        B3 = document.getElementById("" + OriYear + "LaAllYear" + 3 + "").value;
        B4 = document.getElementById("" + OriYear + "LaAllYear" + 4 + "").value;
        B5 = document.getElementById("" + OriYear + "LaAllYear" + 5 + "").value;
        B6 = document.getElementById("" + OriYear + "LaAllYear" + 6 + "").value;
        B7 = document.getElementById("" + OriYear + "LaAllYear" + 7 + "").value;
        B8 = document.getElementById("" + OriYear + "LaAllYear" + 8 + "").value;
        B9 = document.getElementById("" + OriYear + "LaAllYear" + 9 + "").value;
        B10 = document.getElementById("" + OriYear + "LaAllYear" + 10 + "").value;
        B11 = document.getElementById("" + OriYear + "LaAllYear" + 11 + "").value;
        B12 = document.getElementById("" + OriYear + "LaAllYear" + 12 + "").value;

        C1 = document.getElementById("" + OriYear + "LastMonthPlan" + 1 + "").value;
        C2 = document.getElementById("" + OriYear + "LastMonthPlan" + 2 + "").value;
        C3 = document.getElementById("" + OriYear + "LastMonthPlan" + 3 + "").value;
        C4 = document.getElementById("" + OriYear + "LastMonthPlan" + 4 + "").value;
        C5 = document.getElementById("" + OriYear + "LastMonthPlan" + 5 + "").value;
        C6 = document.getElementById("" + OriYear + "LastMonthPlan" + 6 + "").value;
        C7 = document.getElementById("" + OriYear + "LastMonthPlan" + 7 + "").value;
        C8 = document.getElementById("" + OriYear + "LastMonthPlan" + 8 + "").value;
        C9 = document.getElementById("" + OriYear + "LastMonthPlan" + 9 + "").value;
        C10 = document.getElementById("" + OriYear + "LastMonthPlan" + 10 + "").value;
        C11 = document.getElementById("" + OriYear + "LastMonthPlan" + 11 + "").value;
        C12 = document.getElementById("" + OriYear + "LastMonthPlan" + 12 + "").value;

        D1 = document.getElementById("" + OriYear + "Adjust" + 1 + "").value;
        D2 = document.getElementById("" + OriYear + "Adjust" + 2 + "").value;
        D3 = document.getElementById("" + OriYear + "Adjust" + 3 + "").value;
        D4 = document.getElementById("" + OriYear + "Adjust" + 4 + "").value;
        D5 = document.getElementById("" + OriYear + "Adjust" + 5 + "").value;
        D6 = document.getElementById("" + OriYear + "Adjust" + 6 + "").value;
        D7 = document.getElementById("" + OriYear + "Adjust" + 7 + "").value;
        D8 = document.getElementById("" + OriYear + "Adjust" + 8 + "").value;
        D9 = document.getElementById("" + OriYear + "Adjust" + 9 + "").value;
        D10 = document.getElementById("" + OriYear + "Adjust" + 10 + "").value;
        D11 = document.getElementById("" + OriYear + "Adjust" + 11 + "").value;
        D12 = document.getElementById("" + OriYear + "Adjust" + 12 + "").value;

        F1 = document.getElementById("" + OriYear + "StageGoal" + 1 + "").value;
        F2 = document.getElementById("" + OriYear + "StageGoal" + 2 + "").value;
        F3 = document.getElementById("" + OriYear + "StageGoal" + 3 + "").value;
        F4 = document.getElementById("" + OriYear + "StageGoal" + 4 + "").value;
        F5 = document.getElementById("" + OriYear + "StageGoal" + 5 + "").value;
        F6 = document.getElementById("" + OriYear + "StageGoal" + 6 + "").value;
        F7 = document.getElementById("" + OriYear + "StageGoal" + 7 + "").value;
        F8 = document.getElementById("" + OriYear + "StageGoal" + 8 + "").value;
        F9 = document.getElementById("" + OriYear + "StageGoal" + 9 + "").value;
        F10 = document.getElementById("" + OriYear + "StageGoal" + 10 + "").value;
        F11 = document.getElementById("" + OriYear + "StageGoal" + 11 + "").value;
        F12 = document.getElementById("" + OriYear + "StageGoal" + 12 + "").value;
        //按本年度原计划
        var oriPlan = parseFloat(B14) - parseFloat(B1) + parseFloat(C1);
        document.getElementById("" + OriYear + "OriPlan" + 1 + "").value = oriPlan;

        var oriPlan2 = parseFloat(oriPlan) - parseFloat(B2) + parseFloat(C2);
        document.getElementById("" + OriYear + "OriPlan" + 2 + "").value = oriPlan2;

        var oriPlan3 = parseFloat(oriPlan2) - parseFloat(B3) + parseFloat(C3);
        document.getElementById("" + OriYear + "OriPlan" + 3 + "").value = oriPlan3;

        var oriPlan4 = parseFloat(oriPlan3) - parseFloat(B4) + parseFloat(C4);
        document.getElementById("" + OriYear + "OriPlan" + 4 + "").value = oriPlan4;

        var oriPlan5 = parseFloat(oriPlan4) - parseFloat(B5) + parseFloat(C5);
        document.getElementById("" + OriYear + "OriPlan" + 5 + "").value = oriPlan5;

        var oriPlan6 = parseFloat(oriPlan5) - parseFloat(B6) + parseFloat(C6);
        document.getElementById("" + OriYear + "OriPlan" + 6 + "").value = oriPlan6;

        var oriPlan7 = parseFloat(oriPlan6) - parseFloat(B7) + parseFloat(C7);
        document.getElementById("" + OriYear + "OriPlan" + 7 + "").value = oriPlan7;

        var oriPlan8 = parseFloat(oriPlan7) - parseFloat(B8) + parseFloat(C8);
        document.getElementById("" + OriYear + "OriPlan" + 8 + "").value = oriPlan8;

        var oriPlan9 = parseFloat(oriPlan8) - parseFloat(B9) + parseFloat(C9);
        document.getElementById("" + OriYear + "OriPlan" + 9 + "").value = oriPlan9;

        var oriPlan10 = parseFloat(oriPlan9) - parseFloat(B10) + parseFloat(C10);
        document.getElementById("" + OriYear + "OriPlan" + 10 + "").value = oriPlan10;

        var oriPlan11 = parseFloat(oriPlan10) - parseFloat(B11) + parseFloat(C11);
        document.getElementById("" + OriYear + "OriPlan" + 11 + "").value = oriPlan11;

        var oriPlan12 = parseFloat(oriPlan11) - parseFloat(B12) + parseFloat(C12);
        document.getElementById("" + OriYear + "OriPlan" + 12 + "").value = oriPlan12;

        //差额
        var balance = parseFloat(oriPlan) - parseFloat(F1);
        document.getElementById("" + OriYear + "Balance1" + 1 + "").value = balance;


        var balance2 = parseFloat(oriPlan2) - parseFloat(F2);
        document.getElementById("" + OriYear + "Balance1" + 2 + "").value = balance2;

        var balance3 = parseFloat(oriPlan3) - parseFloat(F3);
        document.getElementById("" + OriYear + "Balance1" + 3 + "").value = balance3;

        var balance4 = parseFloat(oriPlan4) - parseFloat(F4);
        document.getElementById("" + OriYear + "Balance1" + 4 + "").value = balance4;

        var balance5 = parseFloat(oriPlan5) - parseFloat(F5);
        document.getElementById("" + OriYear + "Balance1" + 5 + "").value = balance5;

        var balance6 = parseFloat(oriPlan6) - parseFloat(F6);
        document.getElementById("" + OriYear + "Balance1" + 6 + "").value = balance6;

        var balance7 = parseFloat(oriPlan7) - parseFloat(F7);
        document.getElementById("" + OriYear + "Balance1" + 7 + "").value = balance7;

        var balance8 = parseFloat(oriPlan8) - parseFloat(F8);
        document.getElementById("" + OriYear + "Balance1" + 8 + "").value = balance8;

        var balance9 = parseFloat(oriPlan9) - parseFloat(F9);
        document.getElementById("" + OriYear + "Balance1" + 9 + "").value = balance9;

        var balance10 = parseFloat(oriPlan10) - parseFloat(F10);
        document.getElementById("" + OriYear + "Balance1" + 10 + "").value = balance10;

        var balance11 = parseFloat(oriPlan11) - parseFloat(F11);
        document.getElementById("" + OriYear + "Balance1" + 11 + "").value = balance11;

        var balance12 = parseFloat(oriPlan12) - parseFloat(F12);
        document.getElementById("" + OriYear + "Balance1" + 12 + "").value = balance12;

        //按本年度进度调整后
        var adjutsted = parseFloat(B14) - parseFloat(B1) + parseFloat(D1);
        document.getElementById("" + OriYear + "Adjusted" + 1 + "").value = adjutsted;

        var adjutsted2 = parseFloat(adjutsted) - parseFloat(B2) + parseFloat(D2);
        document.getElementById("" + OriYear + "Adjusted" + 2 + "").value = adjutsted2;

        var adjutsted3 = parseFloat(adjutsted2) - parseFloat(B3) + parseFloat(D3);
        document.getElementById("" + OriYear + "Adjusted" + 3 + "").value = adjutsted3;

        var adjutsted4 = parseFloat(adjutsted3) - parseFloat(B4) + parseFloat(D4);
        document.getElementById("" + OriYear + "Adjusted" + 4 + "").value = adjutsted4;

        var adjutsted5 = parseFloat(adjutsted4) - parseFloat(B5) + parseFloat(D5);
        document.getElementById("" + OriYear + "Adjusted" + 5 + "").value = adjutsted5;

        var adjutsted6 = parseFloat(adjutsted5) - parseFloat(B6) + parseFloat(D6);
        document.getElementById("" + OriYear + "Adjusted" + 6 + "").value = adjutsted6;

        var adjutsted7 = parseFloat(adjutsted6) - parseFloat(B7) + parseFloat(D7);
        document.getElementById("" + OriYear + "Adjusted" + 7 + "").value = adjutsted7;

        var adjutsted8 = parseFloat(adjutsted7) - parseFloat(B8) + parseFloat(D8);
        document.getElementById("" + OriYear + "Adjusted" + 8 + "").value = adjutsted8;

        var adjutsted9 = parseFloat(adjutsted8) - parseFloat(B9) + parseFloat(D9);
        document.getElementById("" + OriYear + "Adjusted" + 9 + "").value = adjutsted9;

        var adjutsted10 = parseFloat(adjutsted9) - parseFloat(B10) + parseFloat(D10);
        document.getElementById("" + OriYear + "Adjusted" + 10 + "").value = adjutsted10;

        var adjutsted11 = parseFloat(adjutsted10) - parseFloat(B11) + parseFloat(D11);
        document.getElementById("" + OriYear + "Adjusted" + 11 + "").value = adjutsted11;

        var adjutsted12 = parseFloat(adjutsted11) - parseFloat(B12) + parseFloat(D12);
        document.getElementById("" + OriYear + "Adjusted" + 12 + "").value = adjutsted12;

        //差额2
        var balanceT = parseFloat(adjutsted) - parseFloat(F1);
        document.getElementById("" + OriYear + "Balance2" + 1 + "").value = balanceT;

        var balanceT2 = parseFloat(adjutsted2) - parseFloat(F2);
        document.getElementById("" + OriYear + "Balance2" + 2 + "").value = balanceT2;

        var balanceT3 = parseFloat(adjutsted3) - parseFloat(F3);
        document.getElementById("" + OriYear + "Balance2" + 3 + "").value = balanceT3;

        var balanceT4 = parseFloat(adjutsted4) - parseFloat(F4);
        document.getElementById("" + OriYear + "Balance2" + 4 + "").value = balanceT4;

        var balanceT5 = parseFloat(adjutsted5) - parseFloat(F5);
        document.getElementById("" + OriYear + "Balance2" + 5 + "").value = balanceT5;

        var balanceT6 = parseFloat(adjutsted6) - parseFloat(F6);
        document.getElementById("" + OriYear + "Balance2" + 6 + "").value = balanceT6;

        var balanceT7 = parseFloat(adjutsted7) - parseFloat(F7);
        document.getElementById("" + OriYear + "Balance2" + 7 + "").value = balanceT7;

        var balanceT8 = parseFloat(adjutsted8) - parseFloat(F8);
        document.getElementById("" + OriYear + "Balance2" + 8 + "").value = balanceT8;

        var balanceT9 = parseFloat(adjutsted9) - parseFloat(F9);
        document.getElementById("" + OriYear + "Balance2" + 9 + "").value = balanceT9;

        var balanceT10 = parseFloat(adjutsted10) - parseFloat(F10);
        document.getElementById("" + OriYear + "Balance2" + 10 + "").value = balanceT10;

        var balanceT11 = parseFloat(adjutsted11) - parseFloat(F11);
        document.getElementById("" + OriYear + "Balance2" + 11 + "").value = balanceT11;

        var balanceT12 = parseFloat(adjutsted12) - parseFloat(F12);
        document.getElementById("" + OriYear + "Balance2" + 12 + "").value = balanceT12;

        var Str = "?act=changecaferest&year=" + OriYear + "&mname=" + mname + "&yearGoal=" + yearGoal + "&oriPlan=" + oriPlan + "&oriPlan2=" + oriPlan2 + "&oriPlan3=" + oriPlan3 + "&oriPlan4=" + oriPlan4 + "&oriPlan5=" + oriPlan5 + "&oriPlan6=" + oriPlan6 + "&oriPlan7=" + oriPlan7 + "&oriPlan8=" + oriPlan8 + "&oriPlan9=" + oriPlan9 + "&oriPlan10=" + oriPlan10 + "&oriPlan11=" + oriPlan11 + "&oriPlan12=" + oriPlan12 + "&balance=" + balance + "&balance2=" + balance2 + "&balance3=" + balance3 + "&balance4=" + balance4 + "&balance5=" + balance5 + "&balance6=" + balance6 + "&balance7=" + balance7 + "&balance8=" + balance8 + "&balance9=" + balance9 + "&balance10=" + balance10 + "&balance11=" + balance11 + "&balance12=" + balance12 + "&adjutsted=" + adjutsted + "&adjutsted2=" + adjutsted2 + "&adjutsted3=" + adjutsted3 + "&adjutsted4=" + adjutsted4 + "&adjutsted5=" + adjutsted5 + "&adjutsted6=" + adjutsted6 + "&adjutsted7=" + adjutsted7 + "&adjutsted8=" + adjutsted8 + "&adjutsted9=" + adjutsted9 + "&adjutsted10=" + adjutsted10 + "&adjutsted11=" + adjutsted11 + "&adjutsted12=" + adjutsted12 + "&balanceT=" + balanceT + "&balanceT2=" + balanceT2 + "&balanceT3=" + balanceT3 + "&balanceT4=" + balanceT4 + "&balanceT5=" + balanceT5 + "&balanceT6=" + balanceT6 + "&balanceT7=" + balanceT7 + "&balanceT8=" + balanceT8 + "&balanceT9=" + balanceT9 + "&balanceT10=" + balanceT10 + "&balanceT11=" + balanceT11 + "&balanceT12=" + balanceT12;
        entity.PostStringInfo(Str, this, this.ChangeCafeRestCallBack);
    }

    function ChangeCafeRestCallBack() {
        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                alert("修改成功！");
                setYear();
            }
            else {
                window.status = '正在写入信息，请稍候...';

            }
        }
    }

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
    function LogOut() {
        if (confirm("确定退出系统？")) {
            window.open("../../LogIn.aspx", "_top");
        }
    }

    function showHead() {

        //        var strHtml = '<input type="button" name="btSure" id="btSure" onclick="setYear()" value="查询" style="width:50px; background-color:White; border:solid 1px lightgray;margin:10px;"/>';
        //        if (Info[0].Isedit == 0 && Info[0].Isok == 0) {
        //            strHtml += '<input type="button" name="btSure" id="btSure" onclick="SaveCommit()" value="修改" style="width:50px; background-color:White; border:solid 1px lightgray;margin:10px;"/>' +
        //             '<input type="button" name="btSure" id="btSure" onclick="SaveCash()" value="提交" style="width:50px; background-color:White; border:solid 1px lightgray;margin:10px;"/>';
        //        }



        //        document.getElementById("head").innerHTML = strHtml;
    }
</script>

</head>
   <body onload="InitCafeChase()" class="skin-blue sidebar-mini" style="height: auto; min-height: 100%;">



<div class="content-wrapper" id="Div1" style="margin-left:15px">

  <div><table style="border-collapse:collapse;width:99%;background:white;height:15px" border="1";>
   <tr><td valign="top" id="welcome" style="height:10px;text-align:center;font-size:10pt;font-weight:bold;width:200px;padding:4px"></td>
   <td valign="top" style="width:700px;border-style:none;font-size:10pt;height:30px;padding:4px">


<div class="choBt" style="height:20px"><table class="choYea"><td valign="top" ><div style="width:30px">年：</div></td><td valign="top"><select id="year" style="width:70px"></select></td><td valign="top">至</td><td valign="top" id="chooseYear1"> <select id="year2" style="width:70px"> </select> </td><td valign="top"><input type="button" name="btSure" id="btSure" onclick="setYear()" value="查询" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/><input type="button" name="btSure" id="btSure" onclick="ChangeCafe()" value="重改" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/><input type="button" name="btSure" id="btSure" onclick="SaveCash()" value="确定" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/></td></table></div></td>
<td valign="top" style="height:10px;width:200px;text-align:center;font-size:11pt;font-weight:bold;background-color:#9CB75B;border-style:none;padding:4px">喝咖啡追赶表</td></tr></table>
  
  
      <div  id="content-wrapper" style="min-height: 298px;">
 
      </div>
     </div>
  <div class="control-sidebar-bg"></div>
</div>

</body>
</html>
