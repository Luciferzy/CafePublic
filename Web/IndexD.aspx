<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IndexD.aspx.cs" Inherits="Index" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>喝咖啡平台</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand" />
    <script src="Scripts/common.js" type="text/javascript">></script>
    <script src="Scripts/RSearchEngine.js" type="text/javascript"></script>
    <script src="Scripts/RXmlHttpRequest.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="Styles/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="Styles/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="Styles/demo.css" />
    <link href="Styles/TreeStyle.css" rel="Stylesheet" type="text/css" />
    <link href="Styles/IndexStyle.css" rel="Stylesheet" type="text/css" />
	<script type="text/javascript" src="Scripts/jquery.min.js"></script>
	<script type="text/javascript" src="Scripts/jquery.easyui.min.js"></script>
    <script type="text/javascript" language="javascript">
        var nmEntity = new RSearchEngine('GetXml.aspx');
        membername = "";
        Grade = 0;
        Menus = new Array(); //菜单集合
        function Init() {
            Grade = getCookie("grade");
            membername = getCookie("membername");
            var Str = "?act=getsidebarinfonew&membername=" + membername + "&grade=" + Grade;
            nmEntity.PostStringInfo(Str, this, this.InitCallBack);
        }
        function InitCallBack() {
            var xmlHttp = nmEntity.getXmlHttp();
            if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
                if (xmlHttp.status == 200) {
                    var xmldoc = xmlHttp.responseXML;
                    var MinisterNode = xmldoc.getElementsByTagName("Minister");
                    var ManagerNode = xmldoc.getElementsByTagName("Manager");
                    var MemberNameNode = xmldoc.getElementsByTagName("MemberName");
                    var DeptNameNode = xmldoc.getElementsByTagName("DeptName");

                    for (var i = 0; i < ManagerNode.length; i++) {
                        Menus[i] = new Object();
                        Menus[i].Minister = MinisterNode[i].childNodes.length > 0 ? MinisterNode[i].firstChild.nodeValue : "";
                        Menus[i].Manager = ManagerNode[i].childNodes.length > 0 ? ManagerNode[i].firstChild.nodeValue : "";
                        Menus[i].MemberName = MemberNameNode[i].childNodes.length > 0 ? MemberNameNode[i].firstChild.nodeValue : "";
                        Menus[i].DeptName = DeptNameNode[i].childNodes.length > 0 ? DeptNameNode[i].firstChild.nodeValue : "";
                    }
                    BingTree();
                }
            }
        }
        function menuBarItem_click(menuurl, name,dept) {
            var readname = name.id;
            var readdept = dept;
            var clickdept=document.getElementById(name.id).innerHTML;
            document.cookie = "readname=" + readname;
            document.cookie = "readdept=" + readdept;
            document.cookie = "clickdept=" + clickdept;
            document.getElementById("inner").src = menuurl;

        }
        function Ext() {
            window.open("LogIn.aspx", "_top");
        }
        function BingTree() {
            var strHtml = '<div><a id="A1" onclick="Ext()"><span style="text-align:center; font-size:9pt; cursor:pointer;" class="c4">退出</span></a></div>';

            if (Grade == 2) {
//                strHtml += '<div><a id="A1" onclick="menuBarItem_click(\'Pages/Index/CafeStatisticsAll.aspx\',this,\'\')"><span style="text-align:center; font-size:9pt; cursor:pointer;" class="c4">现金推算表汇总</span></a></div>' +
                strHtml += '<div><button id="dd" onclick="menuBarItem_click(\'Pages/Index/CafeStatisticsAllN.aspx\',this,\'\')" style="width:120px; color:Blue; font-weight:bold;" type="button">现金推算表汇总</button></div>' +
                           '<span style="font-size:1px; ">&nbsp;</span><ul id="faq">';
//                for (var i = 0; i < Menus.length; i++) {
//                    strHtml += '<li><dl><dt style="text-align:left;" ><a>' + Menus[i].Manager + '</a></dt>';
//                    strHtml += '<dd id="' + Menus[i].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/CashReadN.aspx\',this,\'' + Menus[i].DeptName + '\')">' + Menus[i].MemberName + '</dd>';
//                    strHtml += '</dl></li>';
//                }

                for (var i = 0; i < Menus.length; i++) {
                    if (i == 0) {
                        strHtml += '<li><dl><dt style="text-align:left;" ><a>' + Menus[i].Manager + '</a></dt>';
                        for (var k = 0; k < Menus.length; k++) {
                            if (Menus[k].Minister == Menus[i].Minister) {
                                strHtml += '<dd id="' + Menus[k].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/CashReadN.aspx\',this,\'' + Menus[k].DeptName + '\')">' + Menus[k].DeptName + '</dd>';
                            }
                        }
                        strHtml += '</dl></li>';
                    }
                    else {
                        if (Menus[i].Minister != Menus[i - 1].Minister) {
                            strHtml += '<li><dl><dt style="text-align:left;" ><a>' + Menus[i].Manager + '</a></dt>';
                            for (var k = 0; k < Menus.length; k++) {
                                if (Menus[k].Minister == Menus[i].Minister) {
                                    strHtml += '<dd id="' + Menus[k].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/CashReadN.aspx\',this,\'' + Menus[k].DeptName + '\')">' + Menus[k].DeptName + '</dd>';
                                }
                            }
                            strHtml += '</dl></li>';
                        }
                        else {
                            for (var k = 0; k < Menus.length; k++) {
                                if (Menus[k].Minister == Menus[i].Minister) {
                                    strHtml += '<dd id="' + Menus[k].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/CashReadN.aspx\',this,\'' + Menus[k].DeptName + '\')">' + Menus[k].DeptName + '</dd>';
                                }
                            }
                        }
                    }
                }
            }
            else if (Grade == 1) {
//                            strHtml += '<div><a id="A1" onclick="menuBarItem_click(\'Pages/Index/CafeStatisticsAll.aspx\',this,\'\')"><span style="text-align:center; font-size:9pt; cursor:pointer;" class="c4">现金推算表汇总</span></a></div>' +
                strHtml += '<div><button id="dd" onclick="menuBarItem_click(\'Pages/Index/CafeStatisticsN.aspx\',this,\'\')" style="width:120px; font-weight:bold; color:Blue;" type="button">现金推算表汇总</button></div>' +
                           '<span style="font-size:1px; ">&nbsp;</span><ul id="faq">';
                for (var i = 0; i < Menus.length; i++) {
                    strHtml += '<li><dl><dt style="text-align:left;"><a id="' + Menus[i].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/CashReadN.aspx\',this,\'' + Menus[i].DeptName + '\')">' + Menus[i].Manager + '</a></dt>';
                    strHtml += '</dl></li>';
                }
            }
            else {
                strHtml += '<ul id="faq">';
                for (var i = 0; i < Menus.length; i++) {
                    strHtml += '<li><dl><dt style="text-align:left;" ><a id="' + Menus[i].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/CashNewN.aspx\',this,\'' + Menus[i].DeptName + '\')">' + Menus[i].Manager + '</a></dt></dl></li>';
                }
            }

            strHtml += '</ul>';
            document.getElementById("divMenu").innerHTML = strHtml;
            showTree("faq");
        }
        //加载菜单信息
        var lastFaqClick = null;
        function gs(d, a) {
            if (d.currentStyle) {
                var curVal = d.currentStyle[a]
            } else {
                var curVal = document.defaultView.getComputedStyle(d, null)[a]
            }
            return curVal;
        }
        function showTree(faq) {
            lastFaqClick = null;
            var faq = document.getElementById(faq);
            var dls = faq.getElementsByTagName("dl");
            for (var i = 0, dl; dl = dls[i]; i++) {
                var dt = dl.getElementsByTagName("dt")[0]; //取得标题
                dt.id = "faq_dt_" + (Math.random() * 100);
                dt.onclick = function () {
                    var p = this.parentNode; //取得父节点
                    if (lastFaqClick != null && lastFaqClick.id != this.id) {
                        var dds = lastFaqClick.parentNode.getElementsByTagName("dd");
                        for (var i = 0, dd; dd = dds[i]; i++)
                            dd.style.display = 'none';
                    }
                    lastFaqClick = this;
                    var dds = p.getElementsByTagName("dd"); //取得对应子节点，也就是说明部分
                    var tmpDisplay = 'none';
                    if (gs(dds[0], 'display') == 'none')
                        tmpDisplay = 'block';
                    for (var i = 0; i < dds.length; i++)
                        dds[i].style.display = tmpDisplay;
                }
            }
        }
    </script>
</head>
<body class="easyui-layout" onload="Init()">
	<div data-options="region:'west',split:true,title:'现金推算表汇总平台'" style="width:150px;padding:0px; ">

        <div id="divMenu" ></div>
    </div>
	<div data-options="region:'center'">
        <iframe  id="inner"  name="rightframe" src="" frameborder="0" scrolling="no" style="width:100%;height:99%;"></iframe> 
    </div>
</body>
</html>