<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CashReadN.aspx.cs" Inherits="Pages_Index_CashReadN" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>现金推算表</title>
    <script src="../../Scripts/RSearchEngine.js" type="text/javascript"></script>
    <script src="../../Scripts/RXmlHttpRequest.js" type="text/javascript"></script>
    <script src="../../Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/common.js" type="text/javascript"></script>
    <link href="../../Styles/tableOrder.css" rel="Stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-1.10.2.min.js" type="text/javascript"></script> 
    <script type="text/javascript" language="javascript">
        var nmEntity = new RSearchEngine('../../GetXml.aspx');
        YearS = 0;
        YearE = 0;
        UserCode = ""; //用户登录ID
        Info = new Array();
        Check = new Array();
        function Init() {
            var nowdate = new Date();
            YearS = nowdate.getFullYear();
            YearE = YearS + 1;
            DeptName = getCookie("readdept");
            UserCode = getCookie("readname");
            ClickDept = getCookie("clickdept");
            document.getElementById("clickdept").innerHTML = ClickDept + '现金推算表';
//            document.getElementById("spanDept").innerHTML = DeptName;
            GetInfo();
        }
        function GetInfo() {
            Info.length = 0;
            var Str = "?act=getcashinfo&UserCode=" + UserCode + "&YearS=" + YearS + "&YearE=" + YearE;
            nmEntity.PostStringInfo(Str, this, this.GetInfoCallBack);
        }
        function GetInfoCallBack() {
            var xmlHttp = nmEntity.getXmlHttp();
            if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
                if (xmlHttp.status == 200) {
                    var xmldoc = xmlHttp.responseXML;
                    var ItemsNameNode = xmldoc.getElementsByTagName("ItemsName");
                    var ItemsIdNode = xmldoc.getElementsByTagName("ItemsId");
                    var cYearNode = xmldoc.getElementsByTagName("cYear");
                    var NowMonthNode = xmldoc.getElementsByTagName("NowMonth");
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
                    var kItemsIdNode = xmldoc.getElementsByTagName("kItemsId");
                    var kcYearNode = xmldoc.getElementsByTagName("kcYear");
                    var kJanPlanNode = xmldoc.getElementsByTagName("kJanPlan");
                    var kFebPlanNode = xmldoc.getElementsByTagName("kFebPlan");
                    var kMarPlanNode = xmldoc.getElementsByTagName("kMarPlan");
                    var kAprPlanNode = xmldoc.getElementsByTagName("kAprPlan");
                    var kMayPlanNode = xmldoc.getElementsByTagName("kMayPlan");
                    var kJunPlanNode = xmldoc.getElementsByTagName("kJunPlan");
                    var kJulPlanNode = xmldoc.getElementsByTagName("kJulPlan");
                    var kAugPlanNode = xmldoc.getElementsByTagName("kAugPlan");
                    var kSepPlanNode = xmldoc.getElementsByTagName("kSepPlan");
                    var kOctPlanNode = xmldoc.getElementsByTagName("kOctPlan");
                    var kNovPlanNode = xmldoc.getElementsByTagName("kNovPlan");
                    var kDecPlanNode = xmldoc.getElementsByTagName("kDecPlan");
                    if (ItemsNameNode.length > 0) {
                        for (var i = 0; i < ItemsNameNode.length; i++) {
                            Info[i] = new Object();
                            Info[i].ItemsName = ItemsNameNode[i].childNodes.length > 0 ? ItemsNameNode[i].firstChild.nodeValue : "";
                            Info[i].ItemsId = ItemsIdNode[i].childNodes.length > 0 ? ItemsIdNode[i].firstChild.nodeValue : "";
                            Info[i].cYear = cYearNode[i].childNodes.length > 0 ? cYearNode[i].firstChild.nodeValue : "";
                            Info[i].NowMonth = NowMonthNode[i].childNodes.length > 0 ? NowMonthNode[i].firstChild.nodeValue : "";
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
                            Info[i].kItemsId = kItemsIdNode[i].childNodes.length > 0 ? kItemsIdNode[i].firstChild.nodeValue : "";
                            Info[i].kcYear = kcYearNode[i].childNodes.length > 0 ? kcYearNode[i].firstChild.nodeValue : "";
                            Info[i].kJanPlan = kJanPlanNode[i].childNodes.length > 0 ? kJanPlanNode[i].firstChild.nodeValue : "";
                            Info[i].kFebPlan = kFebPlanNode[i].childNodes.length > 0 ? kFebPlanNode[i].firstChild.nodeValue : "";
                            Info[i].kMarPlan = kMarPlanNode[i].childNodes.length > 0 ? kMarPlanNode[i].firstChild.nodeValue : "";
                            Info[i].kAprPlan = kAprPlanNode[i].childNodes.length > 0 ? kAprPlanNode[i].firstChild.nodeValue : "";
                            Info[i].kMayPlan = kMayPlanNode[i].childNodes.length > 0 ? kMayPlanNode[i].firstChild.nodeValue : "";
                            Info[i].kJunPlan = kJunPlanNode[i].childNodes.length > 0 ? kJunPlanNode[i].firstChild.nodeValue : "";
                            Info[i].kJulPlan = kJulPlanNode[i].childNodes.length > 0 ? kJulPlanNode[i].firstChild.nodeValue : "";
                            Info[i].kAugPlan = kAugPlanNode[i].childNodes.length > 0 ? kAugPlanNode[i].firstChild.nodeValue : "";
                            Info[i].kSepPlan = kSepPlanNode[i].childNodes.length > 0 ? kSepPlanNode[i].firstChild.nodeValue : "";
                            Info[i].kOctPlan = kOctPlanNode[i].childNodes.length > 0 ? kOctPlanNode[i].firstChild.nodeValue : "";
                            Info[i].kNovPlan = kNovPlanNode[i].childNodes.length > 0 ? kNovPlanNode[i].firstChild.nodeValue : "";
                            Info[i].kDecPlan = kDecPlanNode[i].childNodes.length > 0 ? kDecPlanNode[i].firstChild.nodeValue : "";
                        }
                        window.status = '完成';
                        showTwoInfo();
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
        function showTwoInfo() {
            YearS = Info[0].cYear;
            YearE = Info[0].kcYear;
            var strHtml = '<table class="table1"><thead><tr>' +
                  '<td style="width:100px;">月份</td>' +
                  '<td id="JanPlan" style="width:90px;">' + YearS + '年01月</td>' +
                  '<td id="FebPlan" style="width:90px;">' + YearS + '年02月</td>' +
                  '<td id="MarPlan" style="width:90px;">' + YearS + '年03月</td>' +
                  '<td id="AprPlan" style="width:90px;">' + YearS + '年04月</td>' +
                  '<td id="MayPlan" style="width:90px;">' + YearS + '年05月</td>' +
                  '<td id="JunPlan" style="width:90px;">' + YearS + '年06月</td>' +
                  '<td id="JulPlan" style="width:90px;">' + YearS + '年07月</td>' +
                  '<td id="AugPlan" style="width:90px;">' + YearS + '年08月</td>' +
                  '<td id="SepPlan" style="width:90px;">' + YearS + '年09月</td>' +
                  '<td id="OctPlan" style="width:90px;">' + YearS + '年10月</td>' +
                  '<td id="NovPlan" style="width:90px;">' + YearS + '年11月</td>' +
                  '<td id="DecPlan" style="width:90px;">' + YearS + '年12月</td>' +
                  '<td id="JanPlan" style="width:90px;">' + YearE + '年01月</td>' +
                  '<td id="FebPlan" style="width:90px;">' + YearE + '年02月</td>' +
                  '<td id="MarPlan" style="width:90px;">' + YearE + '年03月</td>' +
                  '<td id="AprPlan" style="width:90px;">' + YearE + '年04月</td>' +
                  '<td id="MayPlan" style="width:90px;">' + YearE + '年05月</td>' +
                  '<td id="JunPlan" style="width:90px;">' + YearE + '年06月</td>' +
                  '<td id="JulPlan" style="width:90px;">' + YearE + '年07月</td>' +
                  '<td id="AugPlan" style="width:90px;">' + YearE + '年08月</td>' +
                  '<td id="SepPlan" style="width:90px;">' + YearE + '年09月</td>' +
                  '<td id="OctPlan" style="width:90px;">' + YearE + '年10月</td>' +
                  '<td id="NovPlan" style="width:90px;">' + YearE + '年11月</td>' +
                  '<td id="DecPlan" style="width:90px;">' + YearE + '年12月</td>' +
                  '</tr></thead><tbody>';
            for (var i = 0; i < Info.length; i++) {
                if (Info[i].ItemsId == 73 || Info[i].ItemsId == 74 || Info[i].ItemsId == 75) {//合计类不显示输入框
                    strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#96FED1\';" style="background-color:#96FED1;" ">';
                    strHtml += '<td style="text-align:right;">' + Info[i].ItemsName + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JulPlan' + i + '">' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AugPlan' + i + '">' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="SepPlan' + i + '">' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="OctPlan' + i + '">' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="NovPlan' + i + '">' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="DecPlan' + i + '">' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kJanPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kFebPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kMarPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kAprPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJunPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJulPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAugPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kSepPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kOctPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kNovPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kDecPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(0)) + '</td>' +
                       '</tr>';
                }
                else if (Info[i].ItemsId == 76) {//合计类不显示输入框
                    strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#96FED1\';" style="background-color:#96FED1;" ">';
                    strHtml += '<td style="text-align:right;">' + Info[i].ItemsName + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JulPlan' + i + '">' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AugPlan' + i + '">' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="SepPlan' + i + '">' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="OctPlan' + i + '">' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="NovPlan' + i + '">' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="DecPlan' + i + '">' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kJanPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kFebPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kMarPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kAprPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJunPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJulPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAugPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kSepPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kOctPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kNovPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kDecPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(1)) + '</td>' +
                       '</tr>';
                }
                else {
                    strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#FFFFFF\';" ">';
                    strHtml += '<td style="text-align:right;">' + Info[i].ItemsName + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JulPlan' + i + '">' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AugPlan' + i + '">' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="SepPlan' + i + '">' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="OctPlan' + i + '">' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="NovPlan' + i + '">' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="DecPlan' + i + '">' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kJanPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kFebPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kMarPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kAprPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJunPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJulPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAugPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kSepPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kOctPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kNovPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kDecPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(0)) + '</td>' +
                       '</tr>';
                }

            }
            strHtml += '</tbody></table>';
            document.getElementById("divInfo").innerHTML = strHtml;
            ChangeTd();
            ChangeInput();
            var ddd = 0;
            switch (Info[0].NowMonth) {
                case "3":
                    document.getElementById("JanPlan").style.display = "none";
                    ddd = parseInt(23 * 90 + 100);
                    break;
                case "4":
                    document.getElementById("JanPlan").style.display = "none";
                    document.getElementById("FebPlan").style.display = "none";
                    ddd = parseInt(22 * 90 + 100);
                    break;
                case "5":
                    document.getElementById("JanPlan").style.display = "none";
                    document.getElementById("FebPlan").style.display = "none";
                    document.getElementById("MarPlan").style.display = "none";
                    ddd = parseInt(21 * 90 + 100);
                    break;
                case "6":
                    document.getElementById("JanPlan").style.display = "none";
                    document.getElementById("FebPlan").style.display = "none";
                    document.getElementById("MarPlan").style.display = "none";
                    document.getElementById("AprPlan").style.display = "none";
                    ddd = parseInt(20 * 90 + 100);
                    break;
                case "7":
                    document.getElementById("JanPlan").style.display = "none";
                    document.getElementById("FebPlan").style.display = "none";
                    document.getElementById("MarPlan").style.display = "none";
                    document.getElementById("AprPlan").style.display = "none";
                    document.getElementById("MayPlan").style.display = "none";
                    ddd = parseInt(19 * 90 + 100);
                    break;
                case "8":
                    document.getElementById("JanPlan").style.display = "none";
                    document.getElementById("FebPlan").style.display = "none";
                    document.getElementById("MarPlan").style.display = "none";
                    document.getElementById("AprPlan").style.display = "none";
                    document.getElementById("MayPlan").style.display = "none";
                    document.getElementById("JunPlan").style.display = "none";
                    ddd = parseInt(18 * 90 + 100);
                    break;
                case "9":
                    document.getElementById("JanPlan").style.display = "none";
                    document.getElementById("FebPlan").style.display = "none";
                    document.getElementById("MarPlan").style.display = "none";
                    document.getElementById("AprPlan").style.display = "none";
                    document.getElementById("MayPlan").style.display = "none";
                    document.getElementById("JunPlan").style.display = "none";
                    document.getElementById("JulPlan").style.display = "none";
                    ddd = parseInt(17 * 90 + 100);
                    break;
                case "10":
                    document.getElementById("JanPlan").style.display = "none";
                    document.getElementById("FebPlan").style.display = "none";
                    document.getElementById("MarPlan").style.display = "none";
                    document.getElementById("AprPlan").style.display = "none";
                    document.getElementById("MayPlan").style.display = "none";
                    document.getElementById("JunPlan").style.display = "none";
                    document.getElementById("JulPlan").style.display = "none";
                    document.getElementById("AugPlan").style.display = "none";
                    ddd = parseInt(16 * 90 + 100);
                    break;
                case "11":
                    document.getElementById("JanPlan").style.display = "none";
                    document.getElementById("FebPlan").style.display = "none";
                    document.getElementById("MarPlan").style.display = "none";
                    document.getElementById("AprPlan").style.display = "none";
                    document.getElementById("MayPlan").style.display = "none";
                    document.getElementById("JunPlan").style.display = "none";
                    document.getElementById("JulPlan").style.display = "none";
                    document.getElementById("AugPlan").style.display = "none";
                    document.getElementById("SepPlan").style.display = "none";
                    ddd = parseInt(15 * 90 + 100);
                    break;
                case "12":
                    document.getElementById("JanPlan").style.display = "none";
                    document.getElementById("FebPlan").style.display = "none";
                    document.getElementById("MarPlan").style.display = "none";
                    document.getElementById("AprPlan").style.display = "none";
                    document.getElementById("MayPlan").style.display = "none";
                    document.getElementById("JunPlan").style.display = "none";
                    document.getElementById("JulPlan").style.display = "none";
                    document.getElementById("AugPlan").style.display = "none";
                    document.getElementById("SepPlan").style.display = "none";
                    document.getElementById("OctPlan").style.display = "none";
                    ddd = parseInt(14 * 90 + 100);
                    break;
            }
            for (var i = 0; i < Info.length; i++) {
                switch (Info[0].NowMonth) {
                    case "3":
                        document.getElementById("JanPlan" + i).style.display = "none";
                        break;
                    case "4":
                        document.getElementById("JanPlan" + i).style.display = "none";
                        document.getElementById("FebPlan" + i).style.display = "none";
                        break;
                    case "5":
                        document.getElementById("JanPlan" + i).style.display = "none";
                        document.getElementById("FebPlan" + i).style.display = "none";
                        document.getElementById("MarPlan" + i).style.display = "none";
                        break;
                    case "6":
                        document.getElementById("JanPlan" + i).style.display = "none";
                        document.getElementById("FebPlan" + i).style.display = "none";
                        document.getElementById("MarPlan" + i).style.display = "none";
                        document.getElementById("AprPlan" + i).style.display = "none";
                        break;
                    case "7":
                        document.getElementById("JanPlan" + i).style.display = "none";
                        document.getElementById("FebPlan" + i).style.display = "none";
                        document.getElementById("MarPlan" + i).style.display = "none";
                        document.getElementById("AprPlan" + i).style.display = "none";
                        document.getElementById("MayPlan" + i).style.display = "none";
                        break;
                    case "8":
                        document.getElementById("JanPlan" + i).style.display = "none";
                        document.getElementById("FebPlan" + i).style.display = "none";
                        document.getElementById("MarPlan" + i).style.display = "none";
                        document.getElementById("AprPlan" + i).style.display = "none";
                        document.getElementById("MayPlan" + i).style.display = "none";
                        document.getElementById("JunPlan" + i).style.display = "none";
                        break;
                    case "9":
                        document.getElementById("JanPlan" + i).style.display = "none";
                        document.getElementById("FebPlan" + i).style.display = "none";
                        document.getElementById("MarPlan" + i).style.display = "none";
                        document.getElementById("AprPlan" + i).style.display = "none";
                        document.getElementById("MayPlan" + i).style.display = "none";
                        document.getElementById("JunPlan" + i).style.display = "none";
                        document.getElementById("JulPlan" + i).style.display = "none";
                        break;
                    case "10":
                        document.getElementById("JanPlan" + i).style.display = "none";
                        document.getElementById("FebPlan" + i).style.display = "none";
                        document.getElementById("MarPlan" + i).style.display = "none";
                        document.getElementById("AprPlan" + i).style.display = "none";
                        document.getElementById("MayPlan" + i).style.display = "none";
                        document.getElementById("JunPlan" + i).style.display = "none";
                        document.getElementById("JulPlan" + i).style.display = "none";
                        document.getElementById("AugPlan" + i).style.display = "none";
                        break;
                    case "11":
                        document.getElementById("JanPlan" + i).style.display = "none";
                        document.getElementById("FebPlan" + i).style.display = "none";
                        document.getElementById("MarPlan" + i).style.display = "none";
                        document.getElementById("AprPlan" + i).style.display = "none";
                        document.getElementById("MayPlan" + i).style.display = "none";
                        document.getElementById("JunPlan" + i).style.display = "none";
                        document.getElementById("JulPlan" + i).style.display = "none";
                        document.getElementById("AugPlan" + i).style.display = "none";
                        document.getElementById("SepPlan" + i).style.display = "none";
                        break;
                    case "12":
                        document.getElementById("JanPlan" + i).style.display = "none";
                        document.getElementById("FebPlan" + i).style.display = "none";
                        document.getElementById("MarPlan" + i).style.display = "none";
                        document.getElementById("AprPlan" + i).style.display = "none";
                        document.getElementById("MayPlan" + i).style.display = "none";
                        document.getElementById("JunPlan" + i).style.display = "none";
                        document.getElementById("JulPlan" + i).style.display = "none";
                        document.getElementById("AugPlan" + i).style.display = "none";
                        document.getElementById("SepPlan" + i).style.display = "none";
                        document.getElementById("OctPlan" + i).style.display = "none";
                        break;
                }
            }
            document.getElementById("divInfo").style.width = ddd + "px";
        }
    </script>
</head>
<body onload="Init()" >
    <div class="listhearder">
        <table>
            <tr>
                <td id='clickdept' style="font-size:x-small"> <span style="font-weight:bold;" id="spanDept"></span></td>
            </tr>
        </table>  
    </div>

    <div id="divInfo" class="listcontent"></div>
</body>
</html>