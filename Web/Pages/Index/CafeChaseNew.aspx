<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CafeChaseNew.aspx.cs" Inherits="Pages_Index_CafeChaseNew" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
            DeptName = getCookie("deptName");
            UserCode = getCookie("membername");
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
                    var IdNode = xmldoc.getElementsByTagName("Id");
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
                        var kIdNode = xmldoc.getElementsByTagName("kId");
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
                    if (IdNode.length > 0) {
                        for (var i = 0; i < IdNode.length; i++) {
                            Info[i] = new Object();
                            Info[i].Id = IdNode[i].childNodes.length > 0 ? IdNode[i].firstChild.nodeValue : "";
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
                                Info[i].kId = kIdNode[i].childNodes.length > 0 ? kIdNode[i].firstChild.nodeValue : "";
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
        function SaveInfo() {
            var iId = "";
            var kiId = "";
            var Measure = "";
            var kMeasure = "";
            if (isTwo == 1) {
                if (YearE == NowYear) {
                    var cYear_Target = document.getElementById("kcYear_Target").value == "" ? "0" : txtOnfocus(document.getElementById("kcYear_Target").value);
                    for (var i = 0; i < Info.length; i++) {
                        nMeasure = document.getElementById("kMeasure" + i).value == "" ? "" : document.getElementById("kMeasure" + i).value;
                        iId += Info[i].kId + ";";
                        Measure += kMeasure + ";";
                    }
                    var Str = "?act=salecafechaseinfooneyear&ctype=2&UserCode=" + UserCode + "&YearS=" + YearS + "&YearE=" + YearE + "&Measure=" + Measure + "&cYear_Target=" + cYear_Target + "&iId=" + iId;
                    nmEntity.PostStringInfo(Str, this, this.SaveInfoCallBack);
                } else {
                    var cYear_Target = document.getElementById("cYear_Target").value == "" ? "0" : txtOnfocus(document.getElementById("cYear_Target").value);
                    for (var i = 0; i < Info.length; i++) {
                        nMeasure = document.getElementById("Measure" + i).value == "" ? "" : document.getElementById("Measure" + i).value;
                        iId += Info[i].Id + ";";
                        Measure += nMeasure + ";";
                    }
                    var kcYear_Target = document.getElementById("kcYear_Target").value == "" ? "0" : txtOnfocus(document.getElementById("kcYear_Target").value);
                    for (var i = 0; i < Info.length; i++) {
                        knMeasure = document.getElementById("kMeasure" + i).value == "" ? "" : document.getElementById("kMeasure" + i).value;
                        kiId += Info[i].kId + ";";
                        kMeasure += knMeasure + ";";
                    }
                    var Str = "?act=salecafechaseinfotwoyear&UserCode=" + UserCode + "&YearS=" + YearS + "&YearE=" + YearE + "&Measure=" + Measure + "&kMeasure=" + kMeasure + "&cYear_Target=" + cYear_Target + "&kcYear_Target=" + kcYear_Target + "&iId=" + iId + "&kiId=" + kiId;
                    nmEntity.PostStringInfo(Str, this, this.SaveInfoCallBack);
                }
            } else {
                var cYear_Target = document.getElementById("cYear_Target").value == "" ? "0" : txtOnfocus(document.getElementById("cYear_Target").value);
                for (var i = 0; i < Info.length; i++) {
                    nMeasure = document.getElementById("Measure" + i).value == "" ? "" : document.getElementById("Measure" + i).value;
                    iId += Info[i].Id + ";";
                    Measure += nMeasure + ";";
                }
                var Str = "?act=salecafechaseinfooneyear&ctype=1&UserCode=" + UserCode + "&YearS=" + YearS + "&YearE=" + YearE + "&Measure=" + Measure + "&cYear_Target=" + cYear_Target + "&iId=" + iId;
                nmEntity.PostStringInfo(Str, this, this.SaveInfoCallBack);
            }
        }
        function SaveInfoCallBack() {
            var xmlHttp = nmEntity.getXmlHttp();
            if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
                if (xmlHttp.status == 200) {
                    var xmldoc = xmlHttp.responseXML;
                    var stateNode = xmldoc.getElementsByTagName("state");
                    if (stateNode.length > 0) {
                        var state = stateNode[0].firstChild.nodeValue;
                        GetInfo();
                        alert(state);
                        window.status = state;
                    }
                    else {
                        alert("保存失败");
                    }
                }
                else {
                    window.status = '正在写入信息，请稍候...';
                }
            }
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
                <td><button id="btnSave"  onclick="SaveInfo()" style="width:65px; display:none;" type="button"><img alt="" style="float:left; width:15px; height:15px;"  src="../../images/Manager/0848.png"  />保存</button></td>
<%--                <td><button id="btnComit"  onclick="SaveInfo()" style="width:65px; display:none;" type="button"><img alt="" style="float:left; width:15px; height:15px;"  src="../../images/Manager/commit1.png" />提交</button></td>--%>
                <td style="width:20px;" ><span></span></td>
                <td><span style="font-weight:bold;">喝咖啡追赶表</span></td>
            </tr>
        </table>  
    </div>

    <div id="divInfo" class="listcontent"></div>
</body>
</html>
