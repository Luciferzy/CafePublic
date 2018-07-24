<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BudgetImport.aspx.cs" Inherits="Pages_Index_BudgetImport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>收支预算表</title>
    <script src="../../Scripts/RSearchEngine.js" type="text/javascript"></script>
    <script src="../../Scripts/RXmlHttpRequest.js" type="text/javascript"></script>
    <script src="../../Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/common.js" type="text/javascript"></script>
    <script src="../../Scripts/BudgetShow.js" type="text/javascript"></script>
    <script src="../../Scripts/BudgetImportOneYear.js" type="text/javascript"></script>
    <script src="../../Scripts/BudgetImportTwoYear.js" type="text/javascript"></script>
    <link href="../../Styles/tableOrder.css" rel="Stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-1.8.3.js" type="text/javascript"></script> 
    <script type="text/javascript" language="javascript">
        var nmEntity = new RSearchEngine('../../GetXml.aspx');
        YearS = 0;
        YearE = 0;
        isTwo = 0;
        UserCode = "ysl"; //用户登录ID
        Info = new Array();
        Check = new Array();
        function Init() {
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
                            showImportTwoInfo();
                        } else {
                            showImportOneInfo();
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
        function txtOnblur(num) {
            var source = String(num).split("."); //按小数点分成2部分
            source[0] = source[0].replace(new RegExp('(\\d)(?=(\\d{3})+$)', 'ig'), "$1,"); //只将整数部分进行都好分割
            return source.join("."); //再将小数部分合并进来
        }
        function txtOnfocus(n) {
            var oldMny = n.replace(/,/g, '');
            return oldMny;
        }
        function ChangeTd() {
            var divs = document.getElementsByName("cTd");
            for (var i = 0; i < divs.length; i++) {
                var obj = divs[i];
                var num = parseFloat(obj.innerHTML);
                obj.style.color = num < 0 ? "red" : "";
            }
        }
        function ChangeInput() {
            var divs = document.getElementsByName("iTd");
            for (var i = 0; i < divs.length; i++) {
                var obj = divs[i];
                var num = parseFloat(obj.value);
                obj.style.color = num < 0 ? "red" : "";
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
                <td><span>广州IT研发部</span></td>
                <td><div class="btnseparator"></div></td>
                <td><span>年份</span></td>
                <td><select id="selYearS" style="width:60px;" >
                    <option>2017</option><option>2018</option><option>2019</option><option>2020</option><option>2021</option><option>2022</option><option>2023</option></select></td>
                <td><span>至</span></td>
                <td><select id="selYearE" style="width:60px;" >
                    <option>2017</option><option>2018</option><option>2019</option><option>2020</option><option>2021</option><option>2022</option><option>2023</option></select></td>
                <td><button onclick="GetInfoYear()" style="width:60px;" type="button"><img alt="" style="float:left; width:15px; height:15px;"  src="../../images/Mtb/NetByte Design Studio - 0034.png" />查询</button></td>
                <td><button onclick="setShow()" style="width:60px;" type="button"><img alt="" style="float:left; width:15px; height:15px;"  src="../../images/Manager/ico01.png" />显示</button></td>
                <td><button onclick="SaveInfo()" style="width:60px;" type="button"><img alt="" style="float:left; width:15px; height:15px;"  src="../../images/Manager/commit1.png" />导入</button></td>
                <td style="width:200px;" ><span></span></td>
                <td><span>收支预算表</span></td>
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
