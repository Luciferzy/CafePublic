<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CashNew.aspx.cs" Inherits="Pages_Index_CashNew" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>现金推算表</title>
    <script src="../../Scripts/RSearchEngine.js" type="text/javascript"></script>
    <script src="../../Scripts/RXmlHttpRequest.js" type="text/javascript"></script>
    <script src="../../Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/common.js" type="text/javascript"></script>
    <script src="../../Scripts/CafeInfoOneYear.js" type="text/javascript"></script>
    <script src="../../Scripts/CafeInfoTwoYear.js" type="text/javascript"></script>
    <script src="../../Scripts/CafeSaveOneYear.js" type="text/javascript"></script>
    <script src="../../Scripts/CaseSaveTwoYear.js" type="text/javascript"></script>
    <link href="../../Styles/tableOrder.css" rel="Stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-1.8.3.js" type="text/javascript"></script> 
    <script type="text/javascript" language="javascript">
        var nmEntity = new RSearchEngine('../../GetXml.aspx');
        YearS = 0;
        YearE = 0;
        isTwo = 0;
        UserCode = ""; //用户登录ID
        DeptName = "";
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
            var Str = "?act=getcashinfo&UserCode=" + UserCode + "&YearS=" + YearS + "&YearE=" + YearE;
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
                    var IdNode = xmldoc.getElementsByTagName("Id");
                    var ItemsIdNode = xmldoc.getElementsByTagName("ItemsId");
                    var cYearNode = xmldoc.getElementsByTagName("cYear");
                    var NowMonthNode = xmldoc.getElementsByTagName("NowMonth");
                    var NowYearNode = xmldoc.getElementsByTagName("NowYear");
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
                    if (isTwo == 1) {
                        var kIdNode = xmldoc.getElementsByTagName("kId");
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
                    }
                    if (ItemsIdNode.length > 0) {
                        for (var i = 0; i < ItemsIdNode.length; i++) {
                            Info[i] = new Object();
                            Info[i].ItemsName = ItemsNameNode[i].childNodes.length > 0 ? ItemsNameNode[i].firstChild.nodeValue : "";
                            Info[i].Id = IdNode[i].childNodes.length > 0 ? IdNode[i].firstChild.nodeValue : "";
                            Info[i].ItemsId = ItemsIdNode[i].childNodes.length > 0 ? ItemsIdNode[i].firstChild.nodeValue : "";
                            Info[i].cYear = cYearNode[i].childNodes.length > 0 ? cYearNode[i].firstChild.nodeValue : "";
                            Info[i].NowMonth = NowMonthNode[i].childNodes.length > 0 ? NowMonthNode[i].firstChild.nodeValue : "";
                            Info[i].NowYear = NowYearNode[i].childNodes.length > 0 ? NowYearNode[i].firstChild.nodeValue : "";
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
                            if (isTwo == 1) {
                                Info[i].kId = kIdNode[i].childNodes.length > 0 ? kIdNode[i].firstChild.nodeValue : "";
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
            if (isTwo == 1) {
                SaveInfoTwoYear();
            } else {
                SaveInfoOneYear();
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
                    <option>2018</option><option>2019</option><option>2020</option><option>2021</option><option>2022</option><option>2023</option></select></td>
                <td><span>至</span></td>
                <td><select id="selYearE" style="width:60px;" >
                    <option>2018</option><option>2019</option><option>2020</option><option>2021</option><option>2022</option><option>2023</option></select></td>
                <td><button onclick="GetInfoYear()" style="width:65px;" type="button"><img alt="" style="float:left; width:15px; height:15px;"  src="../../images/Mtb/NetByte Design Studio - 0034.png" />查询</button></td>
                <td><button onclick="SaveInfo()" style="width:65px;" type="button"><img alt="" style="float:left; width:15px; height:15px;"  src="../../images/Manager/0848.png"  />保存</button></td>
<%--                <td><button onclick="SaveInfo()" style="width:80px;" type="button"><img alt="" style="float:left; width:20px; height:20px;"  src="../../images/Manager/commit1.png" />提交</button></td>--%>
                <td style="width:20px;" ><span></span></td>
                <td><span style="font-weight:bold;">现金推算表</span></td>
            </tr>
        </table>  
    </div>

    <div id="divInfo" class="listcontent"></div>
</body>
</html>