<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CafeChaseRead.aspx.cs" Inherits="Pages_Index_CafeChaseRead" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>咖啡追赶表</title>
    <script src="../../Scripts/RSearchEngine.js" type="text/javascript"></script>
    <script src="../../Scripts/RXmlHttpRequest.js" type="text/javascript"></script>
    <script src="../../Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/common.js" type="text/javascript"></script>
    <script src="../../Scripts/CafeChaseInfoOneYear.js" type="text/javascript"></script>
    <script src="../../Scripts/CafeChaseInfoTwoYear.js" type="text/javascript"></script>
    <link href="../../Styles/tableOrder.css" rel="Stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-1.8.3.js" type="text/javascript"></script> 
    <script type="text/javascript" language="javascript">
        var nmEntity = new RSearchEngine('../../GetXml.aspx');
        YearS = 0;
        YearE = 0;
        NowYear = 0;
        isTwo = 0;
        UserCode = ""; //用户登录ID
        Info = new Array();
        Check = new Array();
        function Init() {
            DeptName = getCookie("readdept");
            UserCode = getCookie("readname");
            document.getElementById("spanDept").innerHTML = DeptName;
            GetInfo();
        }
        function GetInfo() {
            Info.length = 0;
            if (parseInt(YearS) < parseInt(YearE)) {
                isTwo = 1;
            }
            else {
                isTwo = 0;
            }
            var Str = "?act=getcafechaseinfo&UserCode=" + UserCode + "&YearS=" + YearS + "&YearE=" + YearE;
            nmEntity.PostStringInfo(Str, this, this.GetInfoCallBack);
        }
        function GetInfoYear() {
            YearS = document.getElementById("selYearS")[document.getElementById("selYearS").selectedIndex].text;
            YearE = document.getElementById("selYearE")[document.getElementById("selYearE").selectedIndex].text;
            if (YearS == "" || YearS == "") {
                alert("   请选择年份！！！   ");
                return;
            }
            else {
                if (parseInt(YearS) > parseInt(YearE)) {
                    alert("   年份区间不合理！！！   ");
                    return;
                }
                else if (parseInt(YearS) + 1 < parseInt(YearE)) {
                    alert("   年份区间不能大于两年！！！   ");
                    return;
                } else {
                    GetInfo();
                }
            }
        }
        function GetInfoCallBack() {
            var xmlHttp = nmEntity.getXmlHttp();
            if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
                if (xmlHttp.status == 200) {
                    var xmldoc = xmlHttp.responseXML;
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
                    var cYearNode = xmldoc.getElementsByTagName("cYear");
                    var NowMonthNode = xmldoc.getElementsByTagName("NowMonth");
                    var NowYearNode = xmldoc.getElementsByTagName("NowYear");
                    var cYear_TargetNode = xmldoc.getElementsByTagName("cYear_Target");
                    var BType1Node = xmldoc.getElementsByTagName("BType1");
                    var BType2Node = xmldoc.getElementsByTagName("BType2");
                    var sum1Node = xmldoc.getElementsByTagName("sum1");
                    var sum2Node = xmldoc.getElementsByTagName("sum2");
                    var sum3Node = xmldoc.getElementsByTagName("sum3");
                    if (isTwo == 1) {
                        var kLaAllYearNode = xmldoc.getElementsByTagName("kLaAllYear");
                        var kLastMonthPlanNode = xmldoc.getElementsByTagName("kLastMonthPlan");
                        var kAdjustNode = xmldoc.getElementsByTagName("kAdjust");
                        var kRollYearNode = xmldoc.getElementsByTagName("kRollYear");
                        var kStageGoalNode = xmldoc.getElementsByTagName("kStageGoal");
                        var kOriPlanNode = xmldoc.getElementsByTagName("kOriPlan");
                        var kBalance1Node = xmldoc.getElementsByTagName("kBalance1");
                        var kAdjustedNode = xmldoc.getElementsByTagName("kAdjusted");
                        var kBalance2Node = xmldoc.getElementsByTagName("kBalance2");
                        var kMeasureNode = xmldoc.getElementsByTagName("kMeasure");
                        var kTheMonthNode = xmldoc.getElementsByTagName("kTheMonth");
                        var kcYearNode = xmldoc.getElementsByTagName("kcYear");
                        var kcYear_TargetNode = xmldoc.getElementsByTagName("kcYear_Target");
                        var kBType1Node = xmldoc.getElementsByTagName("kBType1");
                        var kBType2Node = xmldoc.getElementsByTagName("kBType2");
                        var ksum1Node = xmldoc.getElementsByTagName("ksum1");
                        var ksum2Node = xmldoc.getElementsByTagName("ksum2");
                        var ksum3Node = xmldoc.getElementsByTagName("ksum3");
                    }
                    if (TheMonthNode.length > 0) {
                        for (var i = 0; i < TheMonthNode.length; i++) {
                            Info[i] = new Object();
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
                            Info[i].cYear = cYearNode[i].childNodes.length > 0 ? cYearNode[i].firstChild.nodeValue : "";
                            Info[i].NowMonth = NowMonthNode[i].childNodes.length > 0 ? NowMonthNode[i].firstChild.nodeValue : "";
                            Info[i].NowYear = NowYearNode[i].childNodes.length > 0 ? NowYearNode[i].firstChild.nodeValue : "";
                            Info[i].cYear_Target = cYear_TargetNode[i].childNodes.length > 0 ? cYear_TargetNode[i].firstChild.nodeValue : "";
                            Info[i].BType1 = BType1Node[i].childNodes.length > 0 ? BType1Node[i].firstChild.nodeValue : "";
                            Info[i].BType2 = BType2Node[i].childNodes.length > 0 ? BType2Node[i].firstChild.nodeValue : "";
                            Info[i].sum1 = sum1Node[i].childNodes.length > 0 ? sum1Node[i].firstChild.nodeValue : "";
                            Info[i].sum2 = sum2Node[i].childNodes.length > 0 ? sum2Node[i].firstChild.nodeValue : "";
                            Info[i].sum3 = sum3Node[i].childNodes.length > 0 ? sum3Node[i].firstChild.nodeValue : "";
                            if (isTwo == 1) {
                                Info[i].kLaAllYear = kLaAllYearNode[i].childNodes.length > 0 ? kLaAllYearNode[i].firstChild.nodeValue : "";
                                Info[i].kLastMonthPlan = kLastMonthPlanNode[i].childNodes.length > 0 ? kLastMonthPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kAdjust = kAdjustNode[i].childNodes.length > 0 ? kAdjustNode[i].firstChild.nodeValue : "";
                                Info[i].kRollYear = kRollYearNode[i].childNodes.length > 0 ? kRollYearNode[i].firstChild.nodeValue : "";
                                Info[i].kStageGoal = kStageGoalNode[i].childNodes.length > 0 ? kStageGoalNode[i].firstChild.nodeValue : "";
                                Info[i].kOriPlan = kOriPlanNode[i].childNodes.length > 0 ? kOriPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kBalance1 = kBalance1Node[i].childNodes.length > 0 ? kBalance1Node[i].firstChild.nodeValue : "";
                                Info[i].kAdjusted = kAdjustedNode[i].childNodes.length > 0 ? kAdjustedNode[i].firstChild.nodeValue : "";
                                Info[i].kBalance2 = kBalance2Node[i].childNodes.length > 0 ? kBalance2Node[i].firstChild.nodeValue : "";
                                Info[i].kMeasure = kMeasureNode[i].childNodes.length > 0 ? kMeasureNode[i].firstChild.nodeValue : "";
                                Info[i].kTheMonth = kTheMonthNode[i].childNodes.length > 0 ? kTheMonthNode[i].firstChild.nodeValue : "";
                                Info[i].kcYear = kcYearNode[i].childNodes.length > 0 ? kcYearNode[i].firstChild.nodeValue : "";
                                Info[i].kcYear_Target = kcYear_TargetNode[i].childNodes.length > 0 ? kcYear_TargetNode[i].firstChild.nodeValue : "";
                                Info[i].kBType1 = kBType1Node[i].childNodes.length > 0 ? kBType1Node[i].firstChild.nodeValue : "";
                                Info[i].kBType2 = kBType2Node[i].childNodes.length > 0 ? kBType2Node[i].firstChild.nodeValue : "";
                                Info[i].ksum1 = ksum1Node[i].childNodes.length > 0 ? ksum1Node[i].firstChild.nodeValue : "";
                                Info[i].ksum2 = ksum2Node[i].childNodes.length > 0 ? ksum2Node[i].firstChild.nodeValue : "";
                                Info[i].ksum3 = ksum3Node[i].childNodes.length > 0 ? ksum3Node[i].firstChild.nodeValue : "";
                            }
                        }
                        window.status = '完成';
                        if (isTwo == 1) {
                            showTwoInfo();
                        } else {
                            showOneInfo();
                        }
                    }
                    else {
                        document.getElementById("divInfo").innerHTML = "没有找到相关信息！";
                        window.status = '完成';
                    }
                }
                else {
                    window.status = '服务器出错，请稍后重试...';
                    document.getElementById("divInfo").innerHTML = "服务器出错，请稍后重试...";
                }
            }
            else {
                window.status = '正在查询，请稍候...';
            }
        }
        function showOneInfo() {
            this.AutoSelectItem("selYearS", Info[0].cYear);
            this.AutoSelectItem("selYearE", Info[0].cYear);
            YearS = Info[0].cYear;
            YearE = Info[0].cYear;
            NowYear = Info[0].NowYear;
            var OldYear = parseInt(Info[0].cYear) - 1;
            var strHtml = '<table class="table1"><thead><tr>' +
                          '<th style="width:30px;">月</th>' +
                          '<th style="width:90px;">' + OldYear + '年度</th>' +
                          '<th>截止上月原计划<br />(' + YearS + '年)</th>' +
                          '<th>进度调整<br />(' + YearS + '年)</th>' +
                          '<th style="width:160px;">滚动周年</th>' +
                          '<th>阶段目标</th>' +
                          '<th>按' + YearS + '年度<br />原计划</th>' +
                          '<th>差额</th>' +
                          '<th style="width:50px;"></th>' +
                          '<th>' + YearS + '年度进度<br />调整后</th>' +
                          '<th>差额</th>' +
                          '<th style="width:50px;"></th>' +
                          '<th style="width:150px;">方法、措施</th></tr></thead><tbody>';
            for (var i = 0; i < Info.length; i++) {
                strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#FFFFFF\';">' +
                   '<td name="cTd" style="text-align:center;">' + parseFloat(Info[i].TheMonth, 2) + '</td>';
                if (Info[i].cYear < Info[i].NowYear) {//过去年份变色
                    strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LaAllYear) + '</td>' +
                       '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                }
                else if (Info[i].cYear > Info[i].NowYear) {//未到年份不变色
                    strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LaAllYear) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                }
                else {//当前年份根据月份变色
                    strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LaAllYear) + '</td>';
                    switch (Info[i].NowMonth) {
                        case "1":
                            strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                               '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            break;
                        case "2":
                            if (i < 1) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "3":
                            if (i < 2) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "4":
                            if (i < 3) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "5":
                            if (i < 4) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "6":
                            if (i < 5) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "7":
                            if (i < 6) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "8":
                            if (i < 7) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "9":
                            if (i < 8) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "10":
                            if (i < 9) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "11":
                            if (i < 10) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "12":
                            if (i < 11) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                    }
                }
                strHtml += '<td>' + Info[i].RollYear + '</td>' +
                           '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].StageGoal) + '</td>' +
                           '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].OriPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Balance1) + '</td>';
                if (Info[i].BType1 == "1") {
                    strHtml += '<td><img src="../../images/x.jpg" width="20" height="20" /></td>';
                }
                else if (Info[i].BType1 == "2") {
                    strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /></td>';
                } else {
                    strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /><img src="../../images/k.jpg" width="20" height="20" /></td>';
                }
                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjusted) + '</td>' +
                           '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Balance2) + '</td>';
                if (Info[i].BType2 == "1") {
                    strHtml += '<td><img src="../../images/x.jpg" width="20" height="20" /></td>';
                }
                else if (Info[i].BType2 == "2") {
                    strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /></td>';
                } else {
                    strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /><img src="../../images/k.jpg" width="20" height="20" /></td>';
                }
                strHtml += '<td>' + Info[i].Measure + '</td></tr>';
            }
            var sum1 = parseFloat(parseFloat(Info[0].cYear_Target) - parseFloat(Info[0].sum1));
            var sum2 = parseFloat(parseFloat(Info[0].sum2) - parseFloat(Info[0].cYear_Target));
            var sum3 = parseFloat(parseFloat(Info[0].sum3) - parseFloat(Info[0].cYear_Target));

            strHtml += '<tr><td>合计</td><td name="cTd" style="text-align:right;">' + txtOnblur(Info[0].sum1) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(Info[0].sum2) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(Info[0].sum3) + '</td><td style="border-width: 0px;" colspan="9"></td></tr>';
            strHtml += '<tr><td>' + YearS + '目标</td><td style="text-align:right;">' + txtOnblur(Info[0].cYear_Target) + '</td><td></td><td></td><td style="border-width: 0px;" colspan="9"></td></tr>';
            strHtml += '<tr><td>差额</td><td name="cTd" style="text-align:right;">' + txtOnblur(sum1) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(sum2) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(sum3) + '</td><td style="border-width: 0px;" colspan="9"></td></tr>';
            strHtml += '<tr><td>每月<br />额度</td><td name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(sum1 / 12).toFixed(0)) + '</td><td></td><td></td><td style="border-width: 0px;" colspan="9"></td></tr>';
            strHtml += '</tbody></table>';
            document.getElementById("divInfo").innerHTML = strHtml;
            ChangeTd();
            ChangeInput();
        }
        function showTwoInfo() {
            this.AutoSelectItem("selYearS", Info[0].cYear);
            this.AutoSelectItem("selYearE", Info[0].kcYear);
            YearS = Info[0].cYear;
            YearE = Info[0].kcYear;
            NowYear = Info[0].NowYear;
            var OldYear = parseInt(Info[0].cYear) - 1;
            var strHtml = '<table class="table1"><thead><tr>' +
                  '<th style="width:30px;">月</th>' +
                  '<th style="width:90px;">' + OldYear + '年度</th>' +
                  '<th>截止上月原计划<br />(' + YearS + '年)</th>' +
                  '<th>进度调整<br />(' + YearS + '年)</th>' +
                  '<th style="width:160px;">滚动周年</th>' +
                  '<th>阶段目标</th>' +
                  '<th>按' + YearS + '年度<br />原计划</th>' +
                  '<th>差额</th>' +
                  '<th style="width:50px;"></th>' +
                  '<th>' + YearS + '年度进度<br />调整后</th>' +
                  '<th>差额</th>' +
                  '<th style="width:50px;"></th>' +
                  '<th style="width:150px;">方法、措施</th></tr></thead><tbody>';
            for (var i = 0; i < Info.length; i++) {
                strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#FFFFFF\';">' +
                   '<td name="cTd" style="text-align:center;">' + parseFloat(Info[i].TheMonth, 2) + '</td>';
                if (Info[i].cYear < Info[i].NowYear) {//过去年份变色
                    strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LaAllYear) + '</td>' +
                       '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                }
                else if (Info[i].cYear > Info[i].NowYear) {//未到年份不变色
                    strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LaAllYear) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                }
                else {//当前年份根据月份变色
                    strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LaAllYear) + '</td>';
                    switch (Info[i].NowMonth) {
                        case "1":
                            strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                               '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            break;
                        case "2":
                            if (i < 1) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "3":
                            if (i < 2) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "4":
                            if (i < 3) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "5":
                            if (i < 4) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "6":
                            if (i < 5) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "7":
                            if (i < 6) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "8":
                            if (i < 7) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "9":
                            if (i < 8) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "10":
                            if (i < 9) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "11":
                            if (i < 10) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                        case "12":
                            if (i < 11) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                            }
                            break;
                    }
                }
                strHtml += '<td>' + Info[i].RollYear + '</td>' +
                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].StageGoal) + '</td>' +
                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].OriPlan) + '</td>' +
                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Balance1) + '</td>';
                if (Info[i].BType1 == "1") {
                    strHtml += '<td><img src="../../images/x.jpg" width="20" height="20" /></td>';
                }
                else if (Info[i].BType1 == "2") {
                    strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /></td>';
                } else {
                    strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /><img src="../../images/k.jpg" width="20" height="20" /></td>';
                }
                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjusted) + '</td>' +
                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Balance2) + '</td>';
                if (Info[i].BType2 == "1") {
                    strHtml += '<td><img src="../../images/x.jpg" width="20" height="20" /></td>';
                }
                else if (Info[i].BType2 == "2") {
                    strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /></td>';
                } else {
                    strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /><img src="../../images/k.jpg" width="20" height="20" /></td>';
                }
                strHtml += '<td>' + Info[i].Measure + '</td></tr>';
            }
            var sum1 = parseFloat(parseFloat(Info[0].cYear_Target) - parseFloat(Info[0].sum1));
            var sum2 = parseFloat(parseFloat(Info[0].sum2) - parseFloat(Info[0].cYear_Target));
            var sum3 = parseFloat(parseFloat(Info[0].sum3) - parseFloat(Info[0].cYear_Target));

            strHtml += '<tr><td>合计</td><td name="cTd" style="text-align:right;">' + txtOnblur(Info[0].sum1) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(Info[0].sum2) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(Info[0].sum3) + '</td><td style="border-width: 0px;" colspan="9"></td></tr>';
            strHtml += '<tr><td>' + YearS + '目标</td><td style="text-align:right;">' + txtOnblur(Info[0].cYear_Target) + '</td><td></td><td></td><td style="border-width: 0px;" colspan="9"></td></tr>';
            strHtml += '<tr><td>差额</td><td name="cTd" style="text-align:right;">' + txtOnblur(sum1) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(sum2) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(sum3) + '</td><td style="border-width: 0px;" colspan="9"></td></tr>';
            strHtml += '<tr><td>每月<br />额度</td><td name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(sum1 / 12).toFixed(0)) + '</td><td></td><td></td><td style="border-width: 0px;" colspan="9"></td></tr>';

            var kOldYear = parseInt(Info[0].kcYear) - 1;
            strHtml += '<tr><td style="border-width: 0px;" colspan="13"><br /></td></tr><tr>' +
               '<th style="width:30px;">月</th>' +
               '<th style="width:90px;">' + kOldYear + '年度</th>' +
               '<th>截止上月原计划<br />(' + YearE + '年)</th>' +
               '<th>进度调整<br />(' + YearE + '年)</th>' +
               '<th style="width:160px;">滚动周年</th>' +
               '<th>阶段目标</th>' +
               '<th>按' + YearE + '年度<br />原计划</th>' +
               '<th>差额</th>' +
               '<th style="width:50px;"></th>' +
               '<th>' + YearE + '年度进度<br />调整后</th>' +
               '<th>差额</th>' +
               '<th style="width:50px;"></th>' +
               '<th style="width:150px;">方法、措施</th></tr>';
            for (var i = 0; i < Info.length; i++) {
                strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#FFFFFF\';">' +
                   '<td name="cTd" style="text-align:center;">' + parseFloat(Info[i].kTheMonth, 2) + '</td>';
                if (Info[i].kcYear < Info[i].NowYear) {//第二年小于当年年份变色 16-17
                    strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kLaAllYear) + '</td>' +
                       '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                }
                else if (Info[i].kcYear > Info[i].NowYear) {//未到年份不变色
                    strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kLaAllYear) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                }
                else {//当前年份根据月份变色
                    strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kLaAllYear) + '</td>';
                    switch (Info[i].NowMonth) {
                        case "1":
                            strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                               '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            break;
                        case "2":
                            if (i < 1) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            }
                            break;
                        case "3":
                            if (i < 2) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            }
                            break;
                        case "4":
                            if (i < 3) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            }
                            break;
                        case "5":
                            if (i < 4) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            }
                            break;
                        case "6":
                            if (i < 5) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            }
                            break;
                        case "7":
                            if (i < 6) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            }
                            break;
                        case "8":
                            if (i < 7) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            }
                            break;
                        case "9":
                            if (i < 8) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            }
                            break;
                        case "10":
                            if (i < 9) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            }
                            break;
                        case "11":
                            if (i < 10) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            }
                            break;
                        case "12":
                            if (i < 11) {
                                strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            } else {
                                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kLastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kAdjust) + '</td>';
                            }
                            break;
                    }
                }
                strHtml += '<td>' + Info[i].kRollYear + '</td>' +
                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kStageGoal) + '</td>' +
                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kOriPlan) + '</td>' +
                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kBalance1) + '</td>';
                if (Info[i].kBType1 == "1") {
                    strHtml += '<td><img src="../../images/x.jpg" width="20" height="20" /></td>';
                }
                else if (Info[i].kBType1 == "2") {
                    strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /></td>';
                } else {
                    strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /><img src="../../images/k.jpg" width="20" height="20" /></td>';
                }
                strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kAdjusted) + '</td>' +
                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].kBalance2) + '</td>';
                if (Info[i].kBType2 == "1") {
                    strHtml += '<td><img src="../../images/x.jpg" width="20" height="20" /></td>';
                }
                else if (Info[i].kBType2 == "2") {
                    strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /></td>';
                } else {
                    strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /><img src="../../images/k.jpg" width="20" height="20" /></td>';
                }
                strHtml += '<td>' + Info[i].kMeasure + '</td></tr>';
            }
            var ksum1 = parseFloat(parseFloat(Info[0].kcYear_Target) - parseFloat(Info[0].ksum1));
            var ksum2 = parseFloat(parseFloat(Info[0].ksum2) - parseFloat(Info[0].kcYear_Target));
            var ksum3 = parseFloat(parseFloat(Info[0].ksum3) - parseFloat(Info[0].kcYear_Target));

            strHtml += '<tr><td>合计</td><td name="cTd" style="text-align:right;">' + txtOnblur(Info[0].ksum1) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(Info[0].ksum2) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(Info[0].ksum3) + '</td><td style="border-width: 0px;" colspan="9"></td></tr>';
            strHtml += '<tr><td>' + YearE + '目标</td><td style="text-align:right;">' + txtOnblur(Info[0].kcYear_Target) + '</td><td></td><td></td><td style="border-width: 0px;" colspan="9"></td></tr>';
            strHtml += '<tr><td>差额</td><td name="cTd" style="text-align:right;">' + txtOnblur(ksum1) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(ksum2) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(ksum3) + '</td><td style="border-width: 0px;" colspan="9"></td></tr>';
            strHtml += '<tr><td>每月<br />额度</td><td name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(ksum1 / 12).toFixed(0)) + '</td><td></td><td></td><td style="border-width: 0px;" colspan="9"></td></tr>';
            strHtml += '</tbody></table>';
            document.getElementById("divInfo").innerHTML = strHtml;
            ChangeTd();
            ChangeInput();
        }
    </script>
</head>
<body onload="Init()" >
    <div class="listhearder">
        <table>
            <tr>
                <td><span style="font-weight:bold;" id="spanDept"></span></td>
                <td><div class="btnseparator"></div></td>
                <td><span>年份</span></td>
                <td><select id="selYearS" style="width:60px;" >
                    <option>2017</option><option>2018</option><option>2019</option><option>2020</option><option>2021</option><option>2022</option><option>2023</option></select></td>
                <td><span>至</span></td>
                <td><select id="selYearE" style="width:60px;" >
                    <option>2017</option><option>2018</option><option>2019</option><option>2020</option><option>2021</option><option>2022</option><option>2023</option></select></td>
                <td><button id="btnGet"  onclick="GetInfoYear()" style="width:65px;" type="button"><img alt="" style="float:left; width:15px; height:15px;"  src="../../images/Mtb/NetByte Design Studio - 0034.png" />查询</button></td>
                <td style="width:20px;" ><span></span></td>
                <td><span style="font-weight:bold;">喝咖啡追赶表</span></td>
            </tr>
        </table>  
    </div>

    <div id="divInfo" class="listcontent"></div>
</body>
</html>
