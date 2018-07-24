<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CashNewN.aspx.cs" Inherits="Pages_Index_CashNewN" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>现金推算表</title>
    <script src="../../Scripts/jquery-1.10.2.min.js" type="text/javascript"></script> 
    <script src="../../Scripts/RSearchEngine.js" type="text/javascript"></script>
    <script src="../../Scripts/RXmlHttpRequest.js" type="text/javascript"></script>
    <script src="../../Scripts/common.js" type="text/javascript"></script>
    <script src="../../Scripts/CafeInfoTwoYearN.js" type="text/javascript"></script>
    <script src="../../Scripts/CaseSaveTwoYearN.js" type="text/javascript"></script>
    <link href="../../Styles/tableOrder.css" rel="Stylesheet" type="text/css" />
    
    <script type="text/javascript" language="javascript">
        var nmEntity = new RSearchEngine('../../GetXml.aspx');
        YearS = 0;
        YearE = 0;
        UserCode = "lyw1"; //用户登录ID
        DeptName = "";
        Info = new Array();
        Check = new Array();
        function Init() {
            var nowdate = new Date();
            YearS = nowdate.getFullYear();
            YearE = YearS + 1;
//            DeptName = getCookie("deptName");
//            UserCode = getCookie("membername");
//            document.getElementById("spanDept").innerHTML = DeptName;
            document.getElementById("strOp").value = UserCode;
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
                        window.status = '完成';
                        showTwoInfo();
//                        FixTable("table1", 1, 1000, 600);
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
              SaveInfoTwoYear();
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
        function PopInfo() {
            popDiv("divAdd");
        }
    </script>
        <style type="text/css">  
        .moveBar { 
        position: absolute; 
        width: 700px; left:1px; top:1px;
        height: 150px;  overflow-x:hidden;overflow-y:auto;
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
<body onload="Init()">
<form id="Form1" runat="server">
    <div class="listhearder">
        <table>
            <tr>
                <td><span style="font-weight:bold;" id="spanDept"></span></td>
                <td><div class="btnseparator"></div></td>
                <td><button onclick="SaveInfo()" style="width:65px;" type="button"><img alt="" style="float:left; width:15px; height:15px;"  src="../../images/Manager/0848.png"  />保存</button></td>
                <td><button onclick="PopInfo()" style="width:65px;" type="button"><img alt="" style="float:left; width:15px; height:15px;"  src="../../images/Manager/commit1.png" />导入</button></td>
            </tr>
        </table>  
    </div>

    <div id="divInfo" class="listcontent"></div>

     <div runat="server" class="moveBar" id="divAdd" style="background-color:White; display:none;"> 
    <div id="banner">
         <table class="table_s" style="text-align:right; background-color:#a9c6c9;color:#FFFFFF; ">
            <tr>
                <td style="text-align:left;">现金推算表导入</td>
                <td>
                    <div style="float:right;"><input id="Button2" style="width:70px; cursor:pointer; " type="button" onclick="hiddenDiv('divAdd')" value="退 出" /></div>
                </td>
            </tr>
        </table>
    </div> 
    <div class="content" id="divDetail" style="z-index:9999999;">
            <table class="table_s">
                <tr>
                   <td style="width:100px;text-align:right; background-color:#F0F0F0;">上传数据：</td>
                   <td style="width:330px;">
                   <asp:FileUpload ID="upload" runat="server" Style="height: 30px;" />
                   </td>
                   <td style="background-color:#F0F0F0;"><asp:Button ID="btnupload" OnClick="btnupload_Click" runat="server" Text="上传数据" Style="cursor: pointer;" /></td>
                </tr>
                                <tr>
                    <td style="width:100px;text-align:right; background-color:#F0F0F0;">提示：</td>
                    <td colspan="2" style="width:330px;">
                                    <asp:Label ID="uploadMsg" runat="server" Style="color: Red;"></asp:Label>
                    </td>
                </tr>
            </table>
    </div> 
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


    <input type="hidden" id="strOp" runat="server" />
        </form>
</body>
</html>