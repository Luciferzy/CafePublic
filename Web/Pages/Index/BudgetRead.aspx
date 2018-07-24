<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BudgetRead.aspx.cs" Inherits="Pages_Index_BudgetRead" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>收支预算表</title>
    <script src="../../Scripts/RSearchEngine.js" type="text/javascript"></script>
    <script src="../../Scripts/RXmlHttpRequest.js" type="text/javascript"></script>
    <script src="../../Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/common.js" type="text/javascript"></script>
    <script src="../../Scripts/BudgetShow.js" type="text/javascript"></script>
    <link href="../../Styles/tableOrder.css" rel="Stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-1.8.3.js" type="text/javascript"></script> 
    <script type="text/javascript" language="javascript">
        var nmEntity = new RSearchEngine('../../GetXml.aspx');
        YearS = 0;
        YearE = 0;
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
            var Str = "?act=getbudgetinfo&UserCode=" + UserCode + "&YearS=" + YearS + "&YearE=" + YearE;
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
                    var ItemsNameNode = xmldoc.getElementsByTagName("ItemsName");
                    var isCountNode = xmldoc.getElementsByTagName("isCount");
                    var AllCountNode = xmldoc.getElementsByTagName("allCount");
                    var IdNode = xmldoc.getElementsByTagName("Id");
                    var ItemsIdNode = xmldoc.getElementsByTagName("ItemsId");
                    var cYearNode = xmldoc.getElementsByTagName("cYear");
                    var NowMonthNode = xmldoc.getElementsByTagName("NowMonth");
                    var NowYearNode = xmldoc.getElementsByTagName("NowYear");
                    var RollYearNode = xmldoc.getElementsByTagName("RollYear");
                    var MonthAveNode = xmldoc.getElementsByTagName("MonthAve");
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
                    var isJanPlanNode = xmldoc.getElementsByTagName("isJanPlan");
                    var isJanRealNode = xmldoc.getElementsByTagName("isJanReal");
                    var isFebPlanNode = xmldoc.getElementsByTagName("isFebPlan");
                    var isFebRealNode = xmldoc.getElementsByTagName("isFebReal");
                    var isMarPlanNode = xmldoc.getElementsByTagName("isMarPlan");
                    var isMarRealNode = xmldoc.getElementsByTagName("isMarReal");
                    var isAprPlanNode = xmldoc.getElementsByTagName("isAprPlan");
                    var isAprRealNode = xmldoc.getElementsByTagName("isAprReal");
                    var isMayPlanNode = xmldoc.getElementsByTagName("isMayPlan");
                    var isMayRealNode = xmldoc.getElementsByTagName("isMayReal");
                    var isJunPlanNode = xmldoc.getElementsByTagName("isJunPlan");
                    var isJunRealNode = xmldoc.getElementsByTagName("isJunReal");
                    var isJulPlanNode = xmldoc.getElementsByTagName("isJulPlan");
                    var isJulRealNode = xmldoc.getElementsByTagName("isJulReal");
                    var isAugPlanNode = xmldoc.getElementsByTagName("isAugPlan");
                    var isAugRealNode = xmldoc.getElementsByTagName("isAugReal");
                    var isSepPlanNode = xmldoc.getElementsByTagName("isSepPlan");
                    var isSepRealNode = xmldoc.getElementsByTagName("isSepReal");
                    var isOctPlanNode = xmldoc.getElementsByTagName("isOctPlan");
                    var isOctRealNode = xmldoc.getElementsByTagName("isOctReal");
                    var isNovPlanNode = xmldoc.getElementsByTagName("isNovPlan");
                    var isNovRealNode = xmldoc.getElementsByTagName("isNovReal");
                    var isDecPlanNode = xmldoc.getElementsByTagName("isDecPlan");
                    var isDecRealNode = xmldoc.getElementsByTagName("isDecReal");
                    if (isTwo == 1) {
                        var kisCountNode = xmldoc.getElementsByTagName("kisCount");
                        var kIdNode = xmldoc.getElementsByTagName("kId");
                        var kItemsIdNode = xmldoc.getElementsByTagName("kItemsId");
                        var kcYearNode = xmldoc.getElementsByTagName("kcYear");
                        var kJanPlanNode = xmldoc.getElementsByTagName("kJanPlan");
                        var kJanRealNode = xmldoc.getElementsByTagName("kJanReal");
                        var kFebPlanNode = xmldoc.getElementsByTagName("kFebPlan");
                        var kFebRealNode = xmldoc.getElementsByTagName("kFebReal");
                        var kMarPlanNode = xmldoc.getElementsByTagName("kMarPlan");
                        var kMarRealNode = xmldoc.getElementsByTagName("kMarReal");
                        var kAprPlanNode = xmldoc.getElementsByTagName("kAprPlan");
                        var kAprRealNode = xmldoc.getElementsByTagName("kAprReal");
                        var kMayPlanNode = xmldoc.getElementsByTagName("kMayPlan");
                        var kMayRealNode = xmldoc.getElementsByTagName("kMayReal");
                        var kJunPlanNode = xmldoc.getElementsByTagName("kJunPlan");
                        var kJunRealNode = xmldoc.getElementsByTagName("kJunReal");
                        var kJulPlanNode = xmldoc.getElementsByTagName("kJulPlan");
                        var kJulRealNode = xmldoc.getElementsByTagName("kJulReal");
                        var kAugPlanNode = xmldoc.getElementsByTagName("kAugPlan");
                        var kAugRealNode = xmldoc.getElementsByTagName("kAugReal");
                        var kSepPlanNode = xmldoc.getElementsByTagName("kSepPlan");
                        var kSepRealNode = xmldoc.getElementsByTagName("kSepReal");
                        var kOctPlanNode = xmldoc.getElementsByTagName("kOctPlan");
                        var kOctRealNode = xmldoc.getElementsByTagName("kOctReal");
                        var kNovPlanNode = xmldoc.getElementsByTagName("kNovPlan");
                        var kNovRealNode = xmldoc.getElementsByTagName("kNovReal");
                        var kDecPlanNode = xmldoc.getElementsByTagName("kDecPlan");
                        var kDecRealNode = xmldoc.getElementsByTagName("kDecReal");
                        var kisJanPlanNode = xmldoc.getElementsByTagName("kisJanPlan");
                        var kisJanRealNode = xmldoc.getElementsByTagName("kisJanReal");
                        var kisFebPlanNode = xmldoc.getElementsByTagName("kisFebPlan");
                        var kisFebRealNode = xmldoc.getElementsByTagName("kisFebReal");
                        var kisMarPlanNode = xmldoc.getElementsByTagName("kisMarPlan");
                        var kisMarRealNode = xmldoc.getElementsByTagName("kisMarReal");
                        var kisAprPlanNode = xmldoc.getElementsByTagName("kisAprPlan");
                        var kisAprRealNode = xmldoc.getElementsByTagName("kisAprReal");
                        var kisMayPlanNode = xmldoc.getElementsByTagName("kisMayPlan");
                        var kisMayRealNode = xmldoc.getElementsByTagName("kisMayReal");
                        var kisJunPlanNode = xmldoc.getElementsByTagName("kisJunPlan");
                        var kisJunRealNode = xmldoc.getElementsByTagName("kisJunReal");
                        var kisJulPlanNode = xmldoc.getElementsByTagName("kisJulPlan");
                        var kisJulRealNode = xmldoc.getElementsByTagName("kisJulReal");
                        var kisAugPlanNode = xmldoc.getElementsByTagName("kisAugPlan");
                        var kisAugRealNode = xmldoc.getElementsByTagName("kisAugReal");
                        var kisSepPlanNode = xmldoc.getElementsByTagName("kisSepPlan");
                        var kisSepRealNode = xmldoc.getElementsByTagName("kisSepReal");
                        var kisOctPlanNode = xmldoc.getElementsByTagName("kisOctPlan");
                        var kisOctRealNode = xmldoc.getElementsByTagName("kisOctReal");
                        var kisNovPlanNode = xmldoc.getElementsByTagName("kisNovPlan");
                        var kisNovRealNode = xmldoc.getElementsByTagName("kisNovReal");
                        var kisDecPlanNode = xmldoc.getElementsByTagName("kisDecPlan");
                        var kisDecRealNode = xmldoc.getElementsByTagName("kisDecReal");
                    }
                    if (ItemsIdNode.length > 0) {
                        for (var i = 0; i < ItemsIdNode.length; i++) {
                            Info[i] = new Object();
                            Info[i].ItemsName = ItemsNameNode[i].childNodes.length > 0 ? ItemsNameNode[i].firstChild.nodeValue : "";
                            Info[i].isCount = isCountNode[i].childNodes.length > 0 ? isCountNode[i].firstChild.nodeValue : "";
                            Info[i].AllCount = AllCountNode[i].childNodes.length > 0 ? AllCountNode[i].firstChild.nodeValue : "";
                            Info[i].Id = IdNode[i].childNodes.length > 0 ? IdNode[i].firstChild.nodeValue : "";
                            Info[i].ItemsId = ItemsIdNode[i].childNodes.length > 0 ? ItemsIdNode[i].firstChild.nodeValue : "";
                            Info[i].cYear = cYearNode[i].childNodes.length > 0 ? cYearNode[i].firstChild.nodeValue : "";
                            Info[i].NowMonth = NowMonthNode[i].childNodes.length > 0 ? NowMonthNode[i].firstChild.nodeValue : "";
                            Info[i].NowYear = NowYearNode[i].childNodes.length > 0 ? NowYearNode[i].firstChild.nodeValue : "";
                            Info[i].RollYear = RollYearNode[i].childNodes.length > 0 ? RollYearNode[i].firstChild.nodeValue : "";
                            Info[i].MonthAve = MonthAveNode[i].childNodes.length > 0 ? MonthAveNode[i].firstChild.nodeValue : "";
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
                            Info[i].isJanPlan = isJanPlanNode[i].childNodes.length > 0 ? isJanPlanNode[i].firstChild.nodeValue : "";
                            Info[i].isJanReal = isJanRealNode[i].childNodes.length > 0 ? isJanRealNode[i].firstChild.nodeValue : "";
                            Info[i].isFebPlan = isFebPlanNode[i].childNodes.length > 0 ? isFebPlanNode[i].firstChild.nodeValue : "";
                            Info[i].isFebReal = isFebRealNode[i].childNodes.length > 0 ? isFebRealNode[i].firstChild.nodeValue : "";
                            Info[i].isMarPlan = isMarPlanNode[i].childNodes.length > 0 ? isMarPlanNode[i].firstChild.nodeValue : "";
                            Info[i].isMarReal = isMarRealNode[i].childNodes.length > 0 ? isMarRealNode[i].firstChild.nodeValue : "";
                            Info[i].isAprPlan = isAprPlanNode[i].childNodes.length > 0 ? isAprPlanNode[i].firstChild.nodeValue : "";
                            Info[i].isAprReal = isAprRealNode[i].childNodes.length > 0 ? isAprRealNode[i].firstChild.nodeValue : "";
                            Info[i].isMayPlan = isMayPlanNode[i].childNodes.length > 0 ? isMayPlanNode[i].firstChild.nodeValue : "";
                            Info[i].isMayReal = isMayRealNode[i].childNodes.length > 0 ? isMayRealNode[i].firstChild.nodeValue : "";
                            Info[i].isJunPlan = isJunPlanNode[i].childNodes.length > 0 ? isJunPlanNode[i].firstChild.nodeValue : "";
                            Info[i].isJunReal = isJunRealNode[i].childNodes.length > 0 ? isJunRealNode[i].firstChild.nodeValue : "";
                            Info[i].isJulPlan = isJulPlanNode[i].childNodes.length > 0 ? isJulPlanNode[i].firstChild.nodeValue : "";
                            Info[i].isJulReal = isJulRealNode[i].childNodes.length > 0 ? isJulRealNode[i].firstChild.nodeValue : "";
                            Info[i].isAugPlan = isAugPlanNode[i].childNodes.length > 0 ? isAugPlanNode[i].firstChild.nodeValue : "";
                            Info[i].isAugReal = isAugRealNode[i].childNodes.length > 0 ? isAugRealNode[i].firstChild.nodeValue : "";
                            Info[i].isSepPlan = isSepPlanNode[i].childNodes.length > 0 ? isSepPlanNode[i].firstChild.nodeValue : "";
                            Info[i].isSepReal = isSepRealNode[i].childNodes.length > 0 ? isSepRealNode[i].firstChild.nodeValue : "";
                            Info[i].isOctPlan = isOctPlanNode[i].childNodes.length > 0 ? isOctPlanNode[i].firstChild.nodeValue : "";
                            Info[i].isOctReal = isOctRealNode[i].childNodes.length > 0 ? isOctRealNode[i].firstChild.nodeValue : "";
                            Info[i].isNovPlan = isNovPlanNode[i].childNodes.length > 0 ? isNovPlanNode[i].firstChild.nodeValue : "";
                            Info[i].isNovReal = isNovRealNode[i].childNodes.length > 0 ? isNovRealNode[i].firstChild.nodeValue : "";
                            Info[i].isDecPlan = isDecPlanNode[i].childNodes.length > 0 ? isDecPlanNode[i].firstChild.nodeValue : "";
                            Info[i].isDecReal = isDecRealNode[i].childNodes.length > 0 ? isDecRealNode[i].firstChild.nodeValue : "";
                            if (isTwo == 1) {
                                Info[i].kisCount = kisCountNode[i].childNodes.length > 0 ? kisCountNode[i].firstChild.nodeValue : "";
                                Info[i].kId = kIdNode[i].childNodes.length > 0 ? kIdNode[i].firstChild.nodeValue : "";
                                Info[i].kItemsId = kItemsIdNode[i].childNodes.length > 0 ? kItemsIdNode[i].firstChild.nodeValue : "";
                                Info[i].kcYear = kcYearNode[i].childNodes.length > 0 ? kcYearNode[i].firstChild.nodeValue : "";
                                Info[i].kJanPlan = kJanPlanNode[i].childNodes.length > 0 ? kJanPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kJanReal = kJanRealNode[i].childNodes.length > 0 ? kJanRealNode[i].firstChild.nodeValue : "";
                                Info[i].kFebPlan = kFebPlanNode[i].childNodes.length > 0 ? kFebPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kFebReal = kFebRealNode[i].childNodes.length > 0 ? kFebRealNode[i].firstChild.nodeValue : "";
                                Info[i].kMarPlan = kMarPlanNode[i].childNodes.length > 0 ? kMarPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kMarReal = kMarRealNode[i].childNodes.length > 0 ? kMarRealNode[i].firstChild.nodeValue : "";
                                Info[i].kAprPlan = kAprPlanNode[i].childNodes.length > 0 ? kAprPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kAprReal = kAprRealNode[i].childNodes.length > 0 ? kAprRealNode[i].firstChild.nodeValue : "";
                                Info[i].kMayPlan = kMayPlanNode[i].childNodes.length > 0 ? kMayPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kMayReal = kMayRealNode[i].childNodes.length > 0 ? kMayRealNode[i].firstChild.nodeValue : "";
                                Info[i].kJunPlan = kJunPlanNode[i].childNodes.length > 0 ? kJunPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kJunReal = kJunRealNode[i].childNodes.length > 0 ? kJunRealNode[i].firstChild.nodeValue : "";
                                Info[i].kJulPlan = kJulPlanNode[i].childNodes.length > 0 ? kJulPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kJulReal = kJulRealNode[i].childNodes.length > 0 ? kJulRealNode[i].firstChild.nodeValue : "";
                                Info[i].kAugPlan = kAugPlanNode[i].childNodes.length > 0 ? kAugPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kAugReal = kAugRealNode[i].childNodes.length > 0 ? kAugRealNode[i].firstChild.nodeValue : "";
                                Info[i].kSepPlan = kSepPlanNode[i].childNodes.length > 0 ? kSepPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kSepReal = kSepRealNode[i].childNodes.length > 0 ? kSepRealNode[i].firstChild.nodeValue : "";
                                Info[i].kOctPlan = kOctPlanNode[i].childNodes.length > 0 ? kOctPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kOctReal = kOctRealNode[i].childNodes.length > 0 ? kOctRealNode[i].firstChild.nodeValue : "";
                                Info[i].kNovPlan = kNovPlanNode[i].childNodes.length > 0 ? kNovPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kNovReal = kNovRealNode[i].childNodes.length > 0 ? kNovRealNode[i].firstChild.nodeValue : "";
                                Info[i].kDecPlan = kDecPlanNode[i].childNodes.length > 0 ? kDecPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kDecReal = kDecRealNode[i].childNodes.length > 0 ? kDecRealNode[i].firstChild.nodeValue : "";
                                Info[i].kisJanPlan = kisJanPlanNode[i].childNodes.length > 0 ? kisJanPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kisJanReal = kisJanRealNode[i].childNodes.length > 0 ? kisJanRealNode[i].firstChild.nodeValue : "";
                                Info[i].kisFebPlan = kisFebPlanNode[i].childNodes.length > 0 ? kisFebPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kisFebReal = kisFebRealNode[i].childNodes.length > 0 ? kisFebRealNode[i].firstChild.nodeValue : "";
                                Info[i].kisMarPlan = kisMarPlanNode[i].childNodes.length > 0 ? kisMarPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kisMarReal = kisMarRealNode[i].childNodes.length > 0 ? kisMarRealNode[i].firstChild.nodeValue : "";
                                Info[i].kisAprPlan = kisAprPlanNode[i].childNodes.length > 0 ? kisAprPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kisAprReal = kisAprRealNode[i].childNodes.length > 0 ? kisAprRealNode[i].firstChild.nodeValue : "";
                                Info[i].kisMayPlan = kisMayPlanNode[i].childNodes.length > 0 ? kisMayPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kisMayReal = kisMayRealNode[i].childNodes.length > 0 ? kisMayRealNode[i].firstChild.nodeValue : "";
                                Info[i].kisJunPlan = kisJunPlanNode[i].childNodes.length > 0 ? kisJunPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kisJunReal = kisJunRealNode[i].childNodes.length > 0 ? kisJunRealNode[i].firstChild.nodeValue : "";
                                Info[i].kisJulPlan = kisJulPlanNode[i].childNodes.length > 0 ? kisJulPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kisJulReal = kisJulRealNode[i].childNodes.length > 0 ? kisJulRealNode[i].firstChild.nodeValue : "";
                                Info[i].kisAugPlan = kisAugPlanNode[i].childNodes.length > 0 ? kisAugPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kisAugReal = kisAugRealNode[i].childNodes.length > 0 ? kisAugRealNode[i].firstChild.nodeValue : "";
                                Info[i].kisSepPlan = kisSepPlanNode[i].childNodes.length > 0 ? kisSepPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kisSepReal = kisSepRealNode[i].childNodes.length > 0 ? kisSepRealNode[i].firstChild.nodeValue : "";
                                Info[i].kisOctPlan = kisOctPlanNode[i].childNodes.length > 0 ? kisOctPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kisOctReal = kisOctRealNode[i].childNodes.length > 0 ? kisOctRealNode[i].firstChild.nodeValue : "";
                                Info[i].kisNovPlan = kisNovPlanNode[i].childNodes.length > 0 ? kisNovPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kisNovReal = kisNovRealNode[i].childNodes.length > 0 ? kisNovRealNode[i].firstChild.nodeValue : "";
                                Info[i].kisDecPlan = kisDecPlanNode[i].childNodes.length > 0 ? kisDecPlanNode[i].firstChild.nodeValue : "";
                                Info[i].kisDecReal = kisDecRealNode[i].childNodes.length > 0 ? kisDecRealNode[i].firstChild.nodeValue : "";
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
            var st = Info[0].cYear.slice(2, 4);
            var strHtml = '<table class="table1"><thead><tr>' +
                          '<th>序</td>' +
                          '<th style="width:90px;">项目</th>' +
                          '<th style="width:80px;">滚动年</th>' +
                          '<th style="width:80px;">月均值</th>' +
                          '<th style="width:80px;">汇总</th>' +
                          '<th id="JanPlan" style="width:90px;">' + st + '(01)月计划</th>' +
                          '<th id="JanReal" style="width:90px;">' + st + '(01)月实际</th>' +
                          '<th id="FebPlan" style="width:90px;">' + st + '(02)月计划</th>' +
                          '<th id="FebReal" style="width:90px;">' + st + '(02)月实际</th>' +
                          '<th id="MarPlan" style="width:90px;">' + st + '(03)月计划</th>' +
                          '<th id="MarReal" style="width:90px;">' + st + '(03)月实际</th>' +
                          '<th id="AprPlan" style="width:90px;">' + st + '(04)月计划</th>' +
                          '<th id="AprReal" style="width:90px;">' + st + '(04)月实际</th>' +
                          '<th id="MayPlan" style="width:90px;">' + st + '(05)月计划</th>' +
                          '<th id="MayReal" style="width:90px;">' + st + '(05)月实际</th>' +
                          '<th id="JunPlan" style="width:90px;">' + st + '(06)月计划</th>' +
                          '<th id="JunReal" style="width:90px;">' + st + '(06)月实际</th>' +
                          '<th id="JulPlan" style="width:90px;">' + st + '(07)月计划</th>' +
                          '<th id="JulReal" style="width:90px;">' + st + '(07)月实际</th>' +
                          '<th id="AugPlan" style="width:90px;">' + st + '(08)月计划</th>' +
                          '<th id="AugReal" style="width:90px;">' + st + '(08)月实际</th>' +
                          '<th id="SepPlan" style="width:90px;">' + st + '(09)月计划</th>' +
                          '<th id="SepReal" style="width:90px;">' + st + '(09)月实际</th>' +
                          '<th id="OctPlan" style="width:90px;">' + st + '(10)月计划</th>' +
                          '<th id="OctReal" style="width:90px;">' + st + '(10)月实际</th>' +
                          '<th id="NovPlan" style="width:90px;">' + st + '(11)月计划</th>' +
                          '<th id="NovReal" style="width:90px;">' + st + '(11)月实际</th>' +
                          '<th id="DecPlan" style="width:90px;">' + st + '(12)月计划</th>' +
                          '<th id="DecReal" style="width:90px;">' + st + '(12)月实际</th></tr></thead><tbody>';
            for (var i = 0; i < Info.length; i++) {
                if (Info[i].ItemsId == 6 || Info[i].ItemsId == 10 || Info[i].ItemsId == 30 || Info[i].ItemsId == 40 || Info[i].ItemsId == 46 || Info[i].ItemsId == 47) {//合计类不显示输入框
                    strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#96FED1\';" style="background-color:#96FED1;" ">';
                }
                else if (Info[i].ItemsId == 48 || Info[i].ItemsId == 50 || Info[i].ItemsId == 51 || Info[i].ItemsId == 52 || Info[i].ItemsId == 53 || Info[i].ItemsId == 54 || Info[i].ItemsId == 55) {//合计类不显示输入框
                    strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'Yellow\';" style="background-color:Yellow;" ">';
                }
                else {
                    strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#FFFFFF\';" ">';
                }
                strHtml += '<td style="text-align:center;">' + Info[i].ItemsId + '</td>' +
                           '<td style="text-align:right;">' + Info[i].ItemsName + '</td>' +
                           '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].RollYear) + '</td>' +
                           '<td name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MonthAve).toFixed(2)) + '</td>' +
                           '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].AllCount) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="JanReal' + i + '">' + txtOnblur(Info[i].JanReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(Info[i].FebPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="FebReal' + i + '">' + txtOnblur(Info[i].FebReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(Info[i].MarPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="MarReal' + i + '">' + txtOnblur(Info[i].MarReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(Info[i].AprPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="AprReal' + i + '">' + txtOnblur(Info[i].AprReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(Info[i].MayPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="MayReal' + i + '">' + txtOnblur(Info[i].MayReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(Info[i].JunPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="JunReal' + i + '">' + txtOnblur(Info[i].JunReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="JulPlan' + i + '">' + txtOnblur(Info[i].JulPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="JulReal' + i + '">' + txtOnblur(Info[i].JulReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="AugPlan' + i + '">' + txtOnblur(Info[i].AugPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="AugReal' + i + '">' + txtOnblur(Info[i].AugReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="SepPlan' + i + '">' + txtOnblur(Info[i].SepPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="SepReal' + i + '">' + txtOnblur(Info[i].SepReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="OctPlan' + i + '">' + txtOnblur(Info[i].OctPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="OctReal' + i + '">' + txtOnblur(Info[i].OctReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="NovPlan' + i + '">' + txtOnblur(Info[i].NovPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="NovReal' + i + '">' + txtOnblur(Info[i].NovReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="DecPlan' + i + '">' + txtOnblur(Info[i].DecPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="DecReal' + i + '">' + txtOnblur(Info[i].DecReal) + '</td></tr>';
            }
            strHtml += '<tr>' +
               '<th>序</th>' +
               '<th>项目</th>' +
               '<th>滚动年</th>' +
               '<th>月均值</th>' +
               '<th>汇总</th>' +
               '<th id="vJanPlan">' + st + '(01)月计划</th>' +
               '<th id="vJanReal">' + st + '(01)月实际</th>' +
               '<th id="vFebPlan">' + st + '(02)月计划</th>' +
               '<th id="vFebReal">' + st + '(02)月实际</th>' +
               '<th id="vMarPlan">' + st + '(03)月计划</th>' +
               '<th id="vMarReal">' + st + '(03)月实际</th>' +
               '<th id="vAprPlan">' + st + '(04)月计划</th>' +
               '<th id="vAprReal">' + st + '(04)月实际</th>' +
               '<th id="vMayPlan">' + st + '(05)月计划</th>' +
               '<th id="vMayReal">' + st + '(05)月实际</th>' +
               '<th id="vJunPlan">' + st + '(06)月计划</th>' +
               '<th id="vJunReal">' + st + '(06)月实际</th>' +
               '<th id="vJulPlan">' + st + '(07)月计划</th>' +
               '<th id="vJulReal">' + st + '(07)月实际</th>' +
               '<th id="vAugPlan">' + st + '(08)月计划</th>' +
               '<th id="vAugReal">' + st + '(08)月实际</th>' +
               '<th id="vSepPlan">' + st + '(09)月计划</th>' +
               '<th id="vSepReal">' + st + '(09)月实际</th>' +
               '<th id="vOctPlan">' + st + '(10)月计划</th>' +
               '<th id="vOctReal">' + st + '(10)月实际</th>' +
               '<th id="vNovPlan">' + st + '(11)月计划</th>' +
               '<th id="vNovReal">' + st + '(11)月实际</th>' +
               '<th id="vDecPlan">' + st + '(12)月计划</th>' +
               '<th id="vDecReal">' + st + '(12)月实际</th></tr>';
            strHtml += '</tbody></table>';
            document.getElementById("divInfo").innerHTML = strHtml;
            ChangeTd();
            ChangeInput();
            var ddd = parseInt(parseInt(Info[0].isCount) * 90 + 350);
            document.getElementById("divInfo").style.width = ddd + "px";
            document.getElementById("JanPlan").style.display = Info[0].isJanPlan == 1 ? "" : "none";
            document.getElementById("JanReal").style.display = Info[0].isJanReal == 1 ? "" : "none";
            document.getElementById("FebPlan").style.display = Info[0].isFebPlan == 1 ? "" : "none";
            document.getElementById("FebReal").style.display = Info[0].isFebReal == 1 ? "" : "none";
            document.getElementById("MarPlan").style.display = Info[0].isMarPlan == 1 ? "" : "none";
            document.getElementById("MarReal").style.display = Info[0].isMarReal == 1 ? "" : "none";
            document.getElementById("AprPlan").style.display = Info[0].isAprPlan == 1 ? "" : "none";
            document.getElementById("AprReal").style.display = Info[0].isAprReal == 1 ? "" : "none";
            document.getElementById("MayPlan").style.display = Info[0].isMayPlan == 1 ? "" : "none";
            document.getElementById("MayReal").style.display = Info[0].isMayReal == 1 ? "" : "none";
            document.getElementById("JunPlan").style.display = Info[0].isJunPlan == 1 ? "" : "none";
            document.getElementById("JunReal").style.display = Info[0].isJunReal == 1 ? "" : "none";
            document.getElementById("JulPlan").style.display = Info[0].isJulPlan == 1 ? "" : "none";
            document.getElementById("JulReal").style.display = Info[0].isJulReal == 1 ? "" : "none";
            document.getElementById("AugPlan").style.display = Info[0].isAugPlan == 1 ? "" : "none";
            document.getElementById("AugReal").style.display = Info[0].isAugReal == 1 ? "" : "none";
            document.getElementById("SepPlan").style.display = Info[0].isSepPlan == 1 ? "" : "none";
            document.getElementById("SepReal").style.display = Info[0].isSepReal == 1 ? "" : "none";
            document.getElementById("OctPlan").style.display = Info[0].isOctPlan == 1 ? "" : "none";
            document.getElementById("OctReal").style.display = Info[0].isOctReal == 1 ? "" : "none";
            document.getElementById("NovPlan").style.display = Info[0].isNovPlan == 1 ? "" : "none";
            document.getElementById("NovReal").style.display = Info[0].isNovReal == 1 ? "" : "none";
            document.getElementById("DecPlan").style.display = Info[0].isDecPlan == 1 ? "" : "none";
            document.getElementById("DecReal").style.display = Info[0].isDecReal == 1 ? "" : "none";

            document.getElementById("vJanPlan").style.display = Info[0].isJanPlan == 1 ? "" : "none";
            document.getElementById("vJanReal").style.display = Info[0].isJanReal == 1 ? "" : "none";
            document.getElementById("vFebPlan").style.display = Info[0].isFebPlan == 1 ? "" : "none";
            document.getElementById("vFebReal").style.display = Info[0].isFebReal == 1 ? "" : "none";
            document.getElementById("vMarPlan").style.display = Info[0].isMarPlan == 1 ? "" : "none";
            document.getElementById("vMarReal").style.display = Info[0].isMarReal == 1 ? "" : "none";
            document.getElementById("vAprPlan").style.display = Info[0].isAprPlan == 1 ? "" : "none";
            document.getElementById("vAprReal").style.display = Info[0].isAprReal == 1 ? "" : "none";
            document.getElementById("vMayPlan").style.display = Info[0].isMayPlan == 1 ? "" : "none";
            document.getElementById("vMayReal").style.display = Info[0].isMayReal == 1 ? "" : "none";
            document.getElementById("vJunPlan").style.display = Info[0].isJunPlan == 1 ? "" : "none";
            document.getElementById("vJunReal").style.display = Info[0].isJunReal == 1 ? "" : "none";
            document.getElementById("vJulPlan").style.display = Info[0].isJulPlan == 1 ? "" : "none";
            document.getElementById("vJulReal").style.display = Info[0].isJulReal == 1 ? "" : "none";
            document.getElementById("vAugPlan").style.display = Info[0].isAugPlan == 1 ? "" : "none";
            document.getElementById("vAugReal").style.display = Info[0].isAugReal == 1 ? "" : "none";
            document.getElementById("vSepPlan").style.display = Info[0].isSepPlan == 1 ? "" : "none";
            document.getElementById("vSepReal").style.display = Info[0].isSepReal == 1 ? "" : "none";
            document.getElementById("vOctPlan").style.display = Info[0].isOctPlan == 1 ? "" : "none";
            document.getElementById("vOctReal").style.display = Info[0].isOctReal == 1 ? "" : "none";
            document.getElementById("vNovPlan").style.display = Info[0].isNovPlan == 1 ? "" : "none";
            document.getElementById("vNovReal").style.display = Info[0].isNovReal == 1 ? "" : "none";
            document.getElementById("vDecPlan").style.display = Info[0].isDecPlan == 1 ? "" : "none";
            document.getElementById("vDecReal").style.display = Info[0].isDecReal == 1 ? "" : "none";
            for (var i = 0; i < Info.length; i++) {
                document.getElementById("JanPlan" + i).style.display = Info[i].isJanPlan == 1 ? "" : "none";
                document.getElementById("JanReal" + i).style.display = Info[i].isJanReal == 1 ? "" : "none";
                document.getElementById("FebPlan" + i).style.display = Info[i].isFebPlan == 1 ? "" : "none";
                document.getElementById("FebReal" + i).style.display = Info[i].isFebReal == 1 ? "" : "none";
                document.getElementById("MarPlan" + i).style.display = Info[i].isMarPlan == 1 ? "" : "none";
                document.getElementById("MarReal" + i).style.display = Info[i].isMarReal == 1 ? "" : "none";
                document.getElementById("AprPlan" + i).style.display = Info[i].isAprPlan == 1 ? "" : "none";
                document.getElementById("AprReal" + i).style.display = Info[i].isAprReal == 1 ? "" : "none";
                document.getElementById("MayPlan" + i).style.display = Info[i].isMayPlan == 1 ? "" : "none";
                document.getElementById("MayReal" + i).style.display = Info[i].isMayReal == 1 ? "" : "none";
                document.getElementById("JunPlan" + i).style.display = Info[i].isJunPlan == 1 ? "" : "none";
                document.getElementById("JunReal" + i).style.display = Info[i].isJunReal == 1 ? "" : "none";
                document.getElementById("JulPlan" + i).style.display = Info[i].isJulPlan == 1 ? "" : "none";
                document.getElementById("JulReal" + i).style.display = Info[i].isJulReal == 1 ? "" : "none";
                document.getElementById("AugPlan" + i).style.display = Info[i].isAugPlan == 1 ? "" : "none";
                document.getElementById("AugReal" + i).style.display = Info[i].isAugReal == 1 ? "" : "none";
                document.getElementById("SepPlan" + i).style.display = Info[i].isSepPlan == 1 ? "" : "none";
                document.getElementById("SepReal" + i).style.display = Info[i].isSepReal == 1 ? "" : "none";
                document.getElementById("OctPlan" + i).style.display = Info[i].isOctPlan == 1 ? "" : "none";
                document.getElementById("OctReal" + i).style.display = Info[i].isOctReal == 1 ? "" : "none";
                document.getElementById("NovPlan" + i).style.display = Info[i].isNovPlan == 1 ? "" : "none";
                document.getElementById("NovReal" + i).style.display = Info[i].isNovReal == 1 ? "" : "none";
                document.getElementById("DecPlan" + i).style.display = Info[i].isDecPlan == 1 ? "" : "none";
                document.getElementById("DecReal" + i).style.display = Info[i].isDecReal == 1 ? "" : "none";
            }
        }
        function showTwoInfo() {
            this.AutoSelectItem("selYearS", Info[0].cYear);
            this.AutoSelectItem("selYearE", Info[0].kcYear);
            var st = Info[0].cYear.slice(2, 4)
            var kt = Info[0].kcYear.slice(2, 4)
            var strHtml = '<table class="table1"><thead><tr>' +
                  '<th>序</td>' +
                  '<th style="width:90px;">项目</th>' +
                  '<th style="width:80px;">滚动年</th>' +
                  '<th style="width:80px;">月均值</th>' +
                  '<th style="width:80px;">汇总</th>' +
                  '<th id="JanPlan" style="width:90px;">' + st + '(01)月计划</th>' +
                  '<th id="JanReal" style="width:90px;">' + st + '(01)月实际</th>' +
                  '<th id="FebPlan" style="width:90px;">' + st + '(02)月计划</th>' +
                  '<th id="FebReal" style="width:90px;">' + st + '(02)月实际</th>' +
                  '<th id="MarPlan" style="width:90px;">' + st + '(03)月计划</th>' +
                  '<th id="MarReal" style="width:90px;">' + st + '(03)月实际</th>' +
                  '<th id="AprPlan" style="width:90px;">' + st + '(04)月计划</th>' +
                  '<th id="AprReal" style="width:90px;">' + st + '(04)月实际</th>' +
                  '<th id="MayPlan" style="width:90px;">' + st + '(05)月计划</th>' +
                  '<th id="MayReal" style="width:90px;">' + st + '(05)月实际</th>' +
                  '<th id="JunPlan" style="width:90px;">' + st + '(06)月计划</th>' +
                  '<th id="JunReal" style="width:90px;">' + st + '(06)月实际</th>' +
                  '<th id="JulPlan" style="width:90px;">' + st + '(07)月计划</th>' +
                  '<th id="JulReal" style="width:90px;">' + st + '(07)月实际</th>' +
                  '<th id="AugPlan" style="width:90px;">' + st + '(08)月计划</th>' +
                  '<th id="AugReal" style="width:90px;">' + st + '(08)月实际</th>' +
                  '<th id="SepPlan" style="width:90px;">' + st + '(09)月计划</th>' +
                  '<th id="SepReal" style="width:90px;">' + st + '(09)月实际</th>' +
                  '<th id="OctPlan" style="width:90px;">' + st + '(10)月计划</th>' +
                  '<th id="OctReal" style="width:90px;">' + st + '(10)月实际</th>' +
                  '<th id="NovPlan" style="width:90px;">' + st + '(11)月计划</th>' +
                  '<th id="NovReal" style="width:90px;">' + st + '(11)月实际</th>' +
                  '<th id="DecPlan" style="width:90px;">' + st + '(12)月计划</th>' +
                  '<th id="DecReal" style="width:90px;">' + st + '(12)月实际</th>' +
                  '<th id="kJanPlan" style="width:90px;">' + kt + '(01)月计划</th>' +
                  '<th id="kJanReal" style="width:90px;">' + kt + '(01)月实际</th>' +
                  '<th id="kFebPlan" style="width:90px;">' + kt + '(02)月计划</th>' +
                  '<th id="kFebReal" style="width:90px;">' + kt + '(02)月实际</th>' +
                  '<th id="kMarPlan" style="width:90px;">' + kt + '(03)月计划</th>' +
                  '<th id="kMarReal" style="width:90px;">' + kt + '(03)月实际</th>' +
                  '<th id="kAprPlan" style="width:90px;">' + kt + '(04)月计划</th>' +
                  '<th id="kAprReal" style="width:90px;">' + kt + '(04)月实际</th>' +
                  '<th id="kMayPlan" style="width:90px;">' + kt + '(05)月计划</th>' +
                  '<th id="kMayReal" style="width:90px;">' + kt + '(05)月实际</th>' +
                  '<th id="kJunPlan" style="width:90px;">' + kt + '(06)月计划</th>' +
                  '<th id="kJunReal" style="width:90px;">' + kt + '(06)月实际</th>' +
                  '<th id="kJulPlan" style="width:90px;">' + kt + '(07)月计划</th>' +
                  '<th id="kJulReal" style="width:90px;">' + kt + '(07)月实际</th>' +
                  '<th id="kAugPlan" style="width:90px;">' + kt + '(08)月计划</th>' +
                  '<th id="kAugReal" style="width:90px;">' + kt + '(08)月实际</th>' +
                  '<th id="kSepPlan" style="width:90px;">' + kt + '(09)月计划</th>' +
                  '<th id="kSepReal" style="width:90px;">' + kt + '(09)月实际</th>' +
                  '<th id="kOctPlan" style="width:90px;">' + kt + '(10)月计划</th>' +
                  '<th id="kOctReal" style="width:90px;">' + kt + '(10)月实际</th>' +
                  '<th id="kNovPlan" style="width:90px;">' + kt + '(11)月计划</th>' +
                  '<th id="kNovReal" style="width:90px;">' + kt + '(11)月实际</th>' +
                  '<th id="kDecPlan" style="width:90px;">' + kt + '(12)月计划</th>' +
                  '<th id="kDecReal" style="width:90px;">' + kt + '(12)月实际</th></tr></thead><tbody>';
            for (var i = 0; i < Info.length; i++) {
                if (Info[i].ItemsId == 6 || Info[i].ItemsId == 10 || Info[i].ItemsId == 30 || Info[i].ItemsId == 40 || Info[i].ItemsId == 46 || Info[i].ItemsId == 47) {//合计类不显示输入框
                    strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#96FED1\';" style="background-color:#96FED1;" ">';
                }
                else if (Info[i].ItemsId == 48 || Info[i].ItemsId == 50 || Info[i].ItemsId == 51 || Info[i].ItemsId == 52 || Info[i].ItemsId == 53 || Info[i].ItemsId == 54 || Info[i].ItemsId == 55) {//合计类不显示输入框
                    strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'Yellow\';" style="background-color:Yellow;" ">';
                }
                else {
                    strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#FFFFFF\';" ">';
                }
                strHtml += '<td style="text-align:center;">' + Info[i].ItemsId + '</td>' +
                       '<td style="text-align:right;">' + Info[i].ItemsName + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].RollYear) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MonthAve).toFixed(2)) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].AllCount) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JanReal' + i + '">' + txtOnblur(Info[i].JanReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(Info[i].FebPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="FebReal' + i + '">' + txtOnblur(Info[i].FebReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(Info[i].MarPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MarReal' + i + '">' + txtOnblur(Info[i].MarReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(Info[i].AprPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AprReal' + i + '">' + txtOnblur(Info[i].AprReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(Info[i].MayPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MayReal' + i + '">' + txtOnblur(Info[i].MayReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(Info[i].JunPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JunReal' + i + '">' + txtOnblur(Info[i].JunReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JulPlan' + i + '">' + txtOnblur(Info[i].JulPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JulReal' + i + '">' + txtOnblur(Info[i].JulReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AugPlan' + i + '">' + txtOnblur(Info[i].AugPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AugReal' + i + '">' + txtOnblur(Info[i].AugReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="SepPlan' + i + '">' + txtOnblur(Info[i].SepPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="SepReal' + i + '">' + txtOnblur(Info[i].SepReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="OctPlan' + i + '">' + txtOnblur(Info[i].OctPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="OctReal' + i + '">' + txtOnblur(Info[i].OctReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="NovPlan' + i + '">' + txtOnblur(Info[i].NovPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="NovReal' + i + '">' + txtOnblur(Info[i].NovReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="DecPlan' + i + '">' + txtOnblur(Info[i].DecPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="DecReal' + i + '">' + txtOnblur(Info[i].DecReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(Info[i].kJanPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJanReal' + i + '">' + txtOnblur(Info[i].kJanReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(Info[i].kFebPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kFebReal' + i + '">' + txtOnblur(Info[i].kFebReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(Info[i].kMarPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMarReal' + i + '">' + txtOnblur(Info[i].kMarReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(Info[i].kAprPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAprReal' + i + '">' + txtOnblur(Info[i].kAprReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(Info[i].kMayPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMayReal' + i + '">' + txtOnblur(Info[i].kMayReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJunPlan' + i + '">' + txtOnblur(Info[i].kJunPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJunReal' + i + '">' + txtOnblur(Info[i].kJunReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJulPlan' + i + '">' + txtOnblur(Info[i].kJulPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJulReal' + i + '">' + txtOnblur(Info[i].kJulReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAugPlan' + i + '">' + txtOnblur(Info[i].kAugPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAugReal' + i + '">' + txtOnblur(Info[i].kAugReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kSepPlan' + i + '">' + txtOnblur(Info[i].kSepPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kSepReal' + i + '">' + txtOnblur(Info[i].kSepReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kOctPlan' + i + '">' + txtOnblur(Info[i].kOctPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kOctReal' + i + '">' + txtOnblur(Info[i].kOctReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kNovPlan' + i + '">' + txtOnblur(Info[i].kNovPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kNovReal' + i + '">' + txtOnblur(Info[i].kNovReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kDecPlan' + i + '">' + txtOnblur(Info[i].kDecPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kDecReal' + i + '">' + txtOnblur(Info[i].kDecReal) + '</td></tr>';
            }
            strHtml += '<tr>' +
                       '<th>序</th>' +
                       '<th>项目</th>' +
                       '<th>滚动年</th>' +
                       '<th>月均值</th>' +
                       '<th>汇总</th>' +
                       '<th id="vJanPlan">' + st + '(01)月计划</th>' +
                       '<th id="vJanReal">' + st + '(01)月实际</th>' +
                       '<th id="vFebPlan">' + st + '(02)月计划</th>' +
                       '<th id="vFebReal">' + st + '(02)月实际</th>' +
                       '<th id="vMarPlan">' + st + '(03)月计划</th>' +
                       '<th id="vMarReal">' + st + '(03)月实际</th>' +
                       '<th id="vAprPlan">' + st + '(04)月计划</th>' +
                       '<th id="vAprReal">' + st + '(04)月实际</th>' +
                       '<th id="vMayPlan">' + st + '(05)月计划</th>' +
                       '<th id="vMayReal">' + st + '(05)月实际</th>' +
                       '<th id="vJunPlan">' + st + '(06)月计划</th>' +
                       '<th id="vJunReal">' + st + '(06)月实际</th>' +
                       '<th id="vJulPlan">' + st + '(07)月计划</th>' +
                       '<th id="vJulReal">' + st + '(07)月实际</th>' +
                       '<th id="vAugPlan">' + st + '(08)月计划</th>' +
                       '<th id="vAugReal">' + st + '(08)月实际</th>' +
                       '<th id="vSepPlan">' + st + '(09)月计划</th>' +
                       '<th id="vSepReal">' + st + '(09)月实际</th>' +
                       '<th id="vOctPlan">' + st + '(10)月计划</th>' +
                       '<th id="vOctReal">' + st + '(10)月实际</th>' +
                       '<th id="vNovPlan">' + st + '(11)月计划</th>' +
                       '<th id="vNovReal">' + st + '(11)月实际</th>' +
                       '<th id="vDecPlan">' + st + '(12)月计划</th>' +
                       '<th id="vDecReal">' + st + '(12)月实际</th>' +
                       '<th id="kvJanPlan">' + kt + '(01)月计划</th>' +
                       '<th id="kvJanReal">' + kt + '(01)月实际</th>' +
                       '<th id="kvFebPlan">' + kt + '(02)月计划</th>' +
                       '<th id="kvFebReal">' + kt + '(02)月实际</th>' +
                       '<th id="kvMarPlan">' + kt + '(03)月计划</th>' +
                       '<th id="kvMarReal">' + kt + '(03)月实际</th>' +
                       '<th id="kvAprPlan">' + kt + '(04)月计划</th>' +
                       '<th id="kvAprReal">' + kt + '(04)月实际</th>' +
                       '<th id="kvMayPlan">' + kt + '(05)月计划</th>' +
                       '<th id="kvMayReal">' + kt + '(05)月实际</th>' +
                       '<th id="kvJunPlan">' + kt + '(06)月计划</th>' +
                       '<th id="kvJunReal">' + kt + '(06)月实际</th>' +
                       '<th id="kvJulPlan">' + kt + '(07)月计划</th>' +
                       '<th id="kvJulReal">' + kt + '(07)月实际</th>' +
                       '<th id="kvAugPlan">' + kt + '(08)月计划</th>' +
                       '<th id="kvAugReal">' + kt + '(08)月实际</th>' +
                       '<th id="kvSepPlan">' + kt + '(09)月计划</th>' +
                       '<th id="kvSepReal">' + kt + '(09)月实际</th>' +
                       '<th id="kvOctPlan">' + kt + '(10)月计划</th>' +
                       '<th id="kvOctReal">' + kt + '(10)月实际</th>' +
                       '<th id="kvNovPlan">' + kt + '(11)月计划</th>' +
                       '<th id="kvNovReal">' + kt + '(11)月实际</th>' +
                       '<th id="kvDecPlan">' + kt + '(12)月计划</th>' +
                       '<th id="kvDecReal">' + kt + '(12)月实际</th></tr>';
            strHtml += '</tbody></table>';
            document.getElementById("divInfo").innerHTML = strHtml;
            ChangeTd();
            ChangeInput();
            var ccc = parseInt(Info[0].isCount) + parseInt(Info[0].kisCount);
            var ddd = parseInt(ccc * 90 + 350);
            document.getElementById("divInfo").style.width = ddd + "px";
            document.getElementById("JanPlan").style.display = Info[0].isJanPlan == 1 ? "" : "none";
            document.getElementById("JanReal").style.display = Info[0].isJanReal == 1 ? "" : "none";
            document.getElementById("FebPlan").style.display = Info[0].isFebPlan == 1 ? "" : "none";
            document.getElementById("FebReal").style.display = Info[0].isFebReal == 1 ? "" : "none";
            document.getElementById("MarPlan").style.display = Info[0].isMarPlan == 1 ? "" : "none";
            document.getElementById("MarReal").style.display = Info[0].isMarReal == 1 ? "" : "none";
            document.getElementById("AprPlan").style.display = Info[0].isAprPlan == 1 ? "" : "none";
            document.getElementById("AprReal").style.display = Info[0].isAprReal == 1 ? "" : "none";
            document.getElementById("MayPlan").style.display = Info[0].isMayPlan == 1 ? "" : "none";
            document.getElementById("MayReal").style.display = Info[0].isMayReal == 1 ? "" : "none";
            document.getElementById("JunPlan").style.display = Info[0].isJunPlan == 1 ? "" : "none";
            document.getElementById("JunReal").style.display = Info[0].isJunReal == 1 ? "" : "none";
            document.getElementById("JulPlan").style.display = Info[0].isJulPlan == 1 ? "" : "none";
            document.getElementById("JulReal").style.display = Info[0].isJulReal == 1 ? "" : "none";
            document.getElementById("AugPlan").style.display = Info[0].isAugPlan == 1 ? "" : "none";
            document.getElementById("AugReal").style.display = Info[0].isAugReal == 1 ? "" : "none";
            document.getElementById("SepPlan").style.display = Info[0].isSepPlan == 1 ? "" : "none";
            document.getElementById("SepReal").style.display = Info[0].isSepReal == 1 ? "" : "none";
            document.getElementById("OctPlan").style.display = Info[0].isOctPlan == 1 ? "" : "none";
            document.getElementById("OctReal").style.display = Info[0].isOctReal == 1 ? "" : "none";
            document.getElementById("NovPlan").style.display = Info[0].isNovPlan == 1 ? "" : "none";
            document.getElementById("NovReal").style.display = Info[0].isNovReal == 1 ? "" : "none";
            document.getElementById("DecPlan").style.display = Info[0].isDecPlan == 1 ? "" : "none";
            document.getElementById("DecReal").style.display = Info[0].isDecReal == 1 ? "" : "none";
            document.getElementById("kJanPlan").style.display = Info[0].kisJanPlan == 1 ? "" : "none";
            document.getElementById("kJanReal").style.display = Info[0].kisJanReal == 1 ? "" : "none";
            document.getElementById("kFebPlan").style.display = Info[0].kisFebPlan == 1 ? "" : "none";
            document.getElementById("kFebReal").style.display = Info[0].kisFebReal == 1 ? "" : "none";
            document.getElementById("kMarPlan").style.display = Info[0].kisMarPlan == 1 ? "" : "none";
            document.getElementById("kMarReal").style.display = Info[0].kisMarReal == 1 ? "" : "none";
            document.getElementById("kAprPlan").style.display = Info[0].kisAprPlan == 1 ? "" : "none";
            document.getElementById("kAprReal").style.display = Info[0].kisAprReal == 1 ? "" : "none";
            document.getElementById("kMayPlan").style.display = Info[0].kisMayPlan == 1 ? "" : "none";
            document.getElementById("kMayReal").style.display = Info[0].kisMayReal == 1 ? "" : "none";
            document.getElementById("kJunPlan").style.display = Info[0].kisJunPlan == 1 ? "" : "none";
            document.getElementById("kJunReal").style.display = Info[0].kisJunReal == 1 ? "" : "none";
            document.getElementById("kJulPlan").style.display = Info[0].kisJulPlan == 1 ? "" : "none";
            document.getElementById("kJulReal").style.display = Info[0].kisJulReal == 1 ? "" : "none";
            document.getElementById("kAugPlan").style.display = Info[0].kisAugPlan == 1 ? "" : "none";
            document.getElementById("kAugReal").style.display = Info[0].kisAugReal == 1 ? "" : "none";
            document.getElementById("kSepPlan").style.display = Info[0].kisSepPlan == 1 ? "" : "none";
            document.getElementById("kSepReal").style.display = Info[0].kisSepReal == 1 ? "" : "none";
            document.getElementById("kOctPlan").style.display = Info[0].kisOctPlan == 1 ? "" : "none";
            document.getElementById("kOctReal").style.display = Info[0].kisOctReal == 1 ? "" : "none";
            document.getElementById("kNovPlan").style.display = Info[0].kisNovPlan == 1 ? "" : "none";
            document.getElementById("kNovReal").style.display = Info[0].kisNovReal == 1 ? "" : "none";
            document.getElementById("kDecPlan").style.display = Info[0].kisDecPlan == 1 ? "" : "none";
            document.getElementById("kDecReal").style.display = Info[0].kisDecReal == 1 ? "" : "none";

            document.getElementById("vJanPlan").style.display = Info[0].isJanPlan == 1 ? "" : "none";
            document.getElementById("vJanReal").style.display = Info[0].isJanReal == 1 ? "" : "none";
            document.getElementById("vFebPlan").style.display = Info[0].isFebPlan == 1 ? "" : "none";
            document.getElementById("vFebReal").style.display = Info[0].isFebReal == 1 ? "" : "none";
            document.getElementById("vMarPlan").style.display = Info[0].isMarPlan == 1 ? "" : "none";
            document.getElementById("vMarReal").style.display = Info[0].isMarReal == 1 ? "" : "none";
            document.getElementById("vAprPlan").style.display = Info[0].isAprPlan == 1 ? "" : "none";
            document.getElementById("vAprReal").style.display = Info[0].isAprReal == 1 ? "" : "none";
            document.getElementById("vMayPlan").style.display = Info[0].isMayPlan == 1 ? "" : "none";
            document.getElementById("vMayReal").style.display = Info[0].isMayReal == 1 ? "" : "none";
            document.getElementById("vJunPlan").style.display = Info[0].isJunPlan == 1 ? "" : "none";
            document.getElementById("vJunReal").style.display = Info[0].isJunReal == 1 ? "" : "none";
            document.getElementById("vJulPlan").style.display = Info[0].isJulPlan == 1 ? "" : "none";
            document.getElementById("vJulReal").style.display = Info[0].isJulReal == 1 ? "" : "none";
            document.getElementById("vAugPlan").style.display = Info[0].isAugPlan == 1 ? "" : "none";
            document.getElementById("vAugReal").style.display = Info[0].isAugReal == 1 ? "" : "none";
            document.getElementById("vSepPlan").style.display = Info[0].isSepPlan == 1 ? "" : "none";
            document.getElementById("vSepReal").style.display = Info[0].isSepReal == 1 ? "" : "none";
            document.getElementById("vOctPlan").style.display = Info[0].isOctPlan == 1 ? "" : "none";
            document.getElementById("vOctReal").style.display = Info[0].isOctReal == 1 ? "" : "none";
            document.getElementById("vNovPlan").style.display = Info[0].isNovPlan == 1 ? "" : "none";
            document.getElementById("vNovReal").style.display = Info[0].isNovReal == 1 ? "" : "none";
            document.getElementById("vDecPlan").style.display = Info[0].isDecPlan == 1 ? "" : "none";
            document.getElementById("vDecReal").style.display = Info[0].isDecReal == 1 ? "" : "none";
            document.getElementById("kvJanPlan").style.display = Info[0].kisJanPlan == 1 ? "" : "none";
            document.getElementById("kvJanReal").style.display = Info[0].kisJanReal == 1 ? "" : "none";
            document.getElementById("kvFebPlan").style.display = Info[0].kisFebPlan == 1 ? "" : "none";
            document.getElementById("kvFebReal").style.display = Info[0].kisFebReal == 1 ? "" : "none";
            document.getElementById("kvMarPlan").style.display = Info[0].kisMarPlan == 1 ? "" : "none";
            document.getElementById("kvMarReal").style.display = Info[0].kisMarReal == 1 ? "" : "none";
            document.getElementById("kvAprPlan").style.display = Info[0].kisAprPlan == 1 ? "" : "none";
            document.getElementById("kvAprReal").style.display = Info[0].kisAprReal == 1 ? "" : "none";
            document.getElementById("kvMayPlan").style.display = Info[0].kisMayPlan == 1 ? "" : "none";
            document.getElementById("kvMayReal").style.display = Info[0].kisMayReal == 1 ? "" : "none";
            document.getElementById("kvJunPlan").style.display = Info[0].kisJunPlan == 1 ? "" : "none";
            document.getElementById("kvJunReal").style.display = Info[0].kisJunReal == 1 ? "" : "none";
            document.getElementById("kvJulPlan").style.display = Info[0].kisJulPlan == 1 ? "" : "none";
            document.getElementById("kvJulReal").style.display = Info[0].kisJulReal == 1 ? "" : "none";
            document.getElementById("kvAugPlan").style.display = Info[0].kisAugPlan == 1 ? "" : "none";
            document.getElementById("kvAugReal").style.display = Info[0].kisAugReal == 1 ? "" : "none";
            document.getElementById("kvSepPlan").style.display = Info[0].kisSepPlan == 1 ? "" : "none";
            document.getElementById("kvSepReal").style.display = Info[0].kisSepReal == 1 ? "" : "none";
            document.getElementById("kvOctPlan").style.display = Info[0].kisOctPlan == 1 ? "" : "none";
            document.getElementById("kvOctReal").style.display = Info[0].kisOctReal == 1 ? "" : "none";
            document.getElementById("kvNovPlan").style.display = Info[0].kisNovPlan == 1 ? "" : "none";
            document.getElementById("kvNovReal").style.display = Info[0].kisNovReal == 1 ? "" : "none";
            document.getElementById("kvDecPlan").style.display = Info[0].kisDecPlan == 1 ? "" : "none";
            document.getElementById("kvDecReal").style.display = Info[0].kisDecReal == 1 ? "" : "none";
            for (var i = 0; i < Info.length; i++) {
                document.getElementById("JanPlan" + i).style.display = Info[i].isJanPlan == 1 ? "" : "none";
                document.getElementById("JanReal" + i).style.display = Info[i].isJanReal == 1 ? "" : "none";
                document.getElementById("FebPlan" + i).style.display = Info[i].isFebPlan == 1 ? "" : "none";
                document.getElementById("FebReal" + i).style.display = Info[i].isFebReal == 1 ? "" : "none";
                document.getElementById("MarPlan" + i).style.display = Info[i].isMarPlan == 1 ? "" : "none";
                document.getElementById("MarReal" + i).style.display = Info[i].isMarReal == 1 ? "" : "none";
                document.getElementById("AprPlan" + i).style.display = Info[i].isAprPlan == 1 ? "" : "none";
                document.getElementById("AprReal" + i).style.display = Info[i].isAprReal == 1 ? "" : "none";
                document.getElementById("MayPlan" + i).style.display = Info[i].isMayPlan == 1 ? "" : "none";
                document.getElementById("MayReal" + i).style.display = Info[i].isMayReal == 1 ? "" : "none";
                document.getElementById("JunPlan" + i).style.display = Info[i].isJunPlan == 1 ? "" : "none";
                document.getElementById("JunReal" + i).style.display = Info[i].isJunReal == 1 ? "" : "none";
                document.getElementById("JulPlan" + i).style.display = Info[i].isJulPlan == 1 ? "" : "none";
                document.getElementById("JulReal" + i).style.display = Info[i].isJulReal == 1 ? "" : "none";
                document.getElementById("AugPlan" + i).style.display = Info[i].isAugPlan == 1 ? "" : "none";
                document.getElementById("AugReal" + i).style.display = Info[i].isAugReal == 1 ? "" : "none";
                document.getElementById("SepPlan" + i).style.display = Info[i].isSepPlan == 1 ? "" : "none";
                document.getElementById("SepReal" + i).style.display = Info[i].isSepReal == 1 ? "" : "none";
                document.getElementById("OctPlan" + i).style.display = Info[i].isOctPlan == 1 ? "" : "none";
                document.getElementById("OctReal" + i).style.display = Info[i].isOctReal == 1 ? "" : "none";
                document.getElementById("NovPlan" + i).style.display = Info[i].isNovPlan == 1 ? "" : "none";
                document.getElementById("NovReal" + i).style.display = Info[i].isNovReal == 1 ? "" : "none";
                document.getElementById("DecPlan" + i).style.display = Info[i].isDecPlan == 1 ? "" : "none";
                document.getElementById("DecReal" + i).style.display = Info[i].isDecReal == 1 ? "" : "none";
                document.getElementById("kJanPlan" + i).style.display = Info[i].kisJanPlan == 1 ? "" : "none";
                document.getElementById("kJanReal" + i).style.display = Info[i].kisJanReal == 1 ? "" : "none";
                document.getElementById("kFebPlan" + i).style.display = Info[i].kisFebPlan == 1 ? "" : "none";
                document.getElementById("kFebReal" + i).style.display = Info[i].kisFebReal == 1 ? "" : "none";
                document.getElementById("kMarPlan" + i).style.display = Info[i].kisMarPlan == 1 ? "" : "none";
                document.getElementById("kMarReal" + i).style.display = Info[i].kisMarReal == 1 ? "" : "none";
                document.getElementById("kAprPlan" + i).style.display = Info[i].kisAprPlan == 1 ? "" : "none";
                document.getElementById("kAprReal" + i).style.display = Info[i].kisAprReal == 1 ? "" : "none";
                document.getElementById("kMayPlan" + i).style.display = Info[i].kisMayPlan == 1 ? "" : "none";
                document.getElementById("kMayReal" + i).style.display = Info[i].kisMayReal == 1 ? "" : "none";
                document.getElementById("kJunPlan" + i).style.display = Info[i].kisJunPlan == 1 ? "" : "none";
                document.getElementById("kJunReal" + i).style.display = Info[i].kisJunReal == 1 ? "" : "none";
                document.getElementById("kJulPlan" + i).style.display = Info[i].kisJulPlan == 1 ? "" : "none";
                document.getElementById("kJulReal" + i).style.display = Info[i].kisJulReal == 1 ? "" : "none";
                document.getElementById("kAugPlan" + i).style.display = Info[i].kisAugPlan == 1 ? "" : "none";
                document.getElementById("kAugReal" + i).style.display = Info[i].kisAugReal == 1 ? "" : "none";
                document.getElementById("kSepPlan" + i).style.display = Info[i].kisSepPlan == 1 ? "" : "none";
                document.getElementById("kSepReal" + i).style.display = Info[i].kisSepReal == 1 ? "" : "none";
                document.getElementById("kOctPlan" + i).style.display = Info[i].kisOctPlan == 1 ? "" : "none";
                document.getElementById("kOctReal" + i).style.display = Info[i].kisOctReal == 1 ? "" : "none";
                document.getElementById("kNovPlan" + i).style.display = Info[i].kisNovPlan == 1 ? "" : "none";
                document.getElementById("kNovReal" + i).style.display = Info[i].kisNovReal == 1 ? "" : "none";
                document.getElementById("kDecPlan" + i).style.display = Info[i].kisDecPlan == 1 ? "" : "none";
                document.getElementById("kDecReal" + i).style.display = Info[i].kisDecReal == 1 ? "" : "none";
            }
        }
    </script>
    <style type="text/css">  
        .moveBar { 
        position: absolute; 
        width: 600px; left:1px; top:1px;
        height: 400px;  overflow-x:hidden;overflow-y:auto;
        border: solid 1px #999999;  z-index:10000;
        } 
        #banner { 
        background: #52CCCC; 
        cursor: move; 
        } 
         .table_s
         {
             border-width: 0px;
             padding: 0px;
             height:30px;
             border-style: solid;
             border-color: #a9c6c9;  background-color:White;
              width:100%;font-family:微软雅黑,宋体; font-size:12pt; 
             table-layout:fixed;
             }
        .table_s td
        {
            border-width: 1px;
            padding: 1px;
            border-style: solid;
            border-color: #a9c6c9;
        }
    </style> 
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
                <td><button onclick="GetInfoYear()" style="width:65px;" type="button"><img alt="" style="float:left; width:15px; height:15px;"  src="../../images/Mtb/NetByte Design Studio - 0034.png" />查询</button></td>
                <td><button onclick="setShow()" style="width:65px;" type="button"><img alt="" style="float:left; width:15px; height:15px;"  src="../../images/Manager/ico01.png" />显示</button></td>
                <td style="width:20px;" ><span></span></td>
                <td><span style="font-weight:bold;">收支预算表</span></td>
            </tr>
        </table>  
    </div>

    <div id="divInfo" class="listcontent"></div>
    <div class="moveBar" id="divAdd" style="display:none; background-color:White;"> 
        <div id="banner">
             <table class="table_s" style="text-align:right; background-color:#a9c6c9;color:#FFFFFF; ">
                <tr>
                    <td style="text-align:left;">选择</td>
                    <td>
                        <div style="float:right;">
                        <input id="Button2" style="width:60px; cursor:pointer; " type="button" onclick="SaveShow()" value="确 定" />
                        <input id="Button1" style="width:60px; cursor:pointer; " type="button" onclick="hiddenDiv('divAdd')" value="退 出" />
                        </div>
                    </td>
                </tr>
            </table>
        </div> 
        <div class="content" id="divDetail" style="z-index:9999999;"></div> 
    </div>
    <script type="text/javascript" language="javascript">
        jQuery(document).ready(
        function () {
            $('#banner').mousedown(
        function (event) {
            var isMove = true;
            var abs_x = event.pageX - $('div.moveBar').offset().left;
            var abs_y = event.pageY - $('div.moveBar').offset().top;
            $(document).mousemove(function (event) {
                if (isMove) {
                    var obj = $('div.moveBar');
                    obj.css({ 'left': event.pageX - abs_x, 'top': event.pageY - abs_y });
                }
            }
        ).mouseup(
        function () {
            isMove = false;
        });
        });
        }); 
    </script> 
</body>
</html>
