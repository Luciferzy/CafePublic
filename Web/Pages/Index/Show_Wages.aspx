<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Show_Wages.aspx.cs" Inherits="Show_Wages" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>工资福利表</title>
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
    Month2= new Array();
    var nowdate = new Date();
    var nowYear = nowdate.getFullYear();
    var passYear = nowYear - 1;
    var nowMonth = nowdate.getMonth()+1;

    mname = getCookie("name");
    //        alert(mname);
    Grade = getCookie("grade");
    DeptName = getCookie("deptName");
    Manager = getCookie("manager");
    membername1 = getUrlParam("MemberName");
    membername = getCookie("checkname");

    function InitWages() {

        load_year();
        if (mname == "" || mname == null) {
            window.open("../../LogIn.aspx", "_top");
        }
        else {
            if (Grade == 0) {
                var Str = "?act=initwages&mname=" + membername + "&year=" + nowYear;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            if (Grade == 1) {
                var Str = "?act=initwages&mname=" + membername + "&year=" + nowYear;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            if (Grade == 5) {
                var Str = "?act=initwages&mname=" + membername + "&year=" + nowYear;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            
        }


    }

    function LogOut() {
        if (confirm("确定退出系统？")) {
            window.open("../../LogIn.aspx", "_top");
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


    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return unescape(r[2]); return null; //返回参数值
    }

    //下拉列表选中年份，根据年份显示数据
    function setYear() {
        Info.length = 0;
        var year = document.getElementById("year").value;
        //var year2 = document.getElementById("year2").value;

       // if (year > year2) {
           // alert("开始时间不能大于结束时间!!!!");
           // exit;
       // }

        //if (year2 - year > 1 || year - year2>1) {
           // alert("时间区间不能超过3年!!!!");
        //} else {
           // if (year == year2) {
                var Str = "?act=getWagesdatabyyear&year=" + year + "&mname=" + membername;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            //} else {
                //var Str = "?act=getWagesdatabyyear2&year=" + year + "&year2=" + year2 + "&mname=" + membername;
               //entity.PostStringInfo(Str, this, this.InfoCallBackTwo);
           // }
        //}
    }

    function InfoCallBack() {

        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var IdNode = xmldoc.getElementsByTagName("Id");
                var WagesClassNode = xmldoc.getElementsByTagName("WagesClass");
                var WagesNameNode = xmldoc.getElementsByTagName("WagesName");
                var WagesBzNode = xmldoc.getElementsByTagName("WagesBz");
                var IseditNode = xmldoc.getElementsByTagName("Isedit");
                var IsokNode = xmldoc.getElementsByTagName("Isok");
                var cYearNode = xmldoc.getElementsByTagName("cYear");
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



                for (var i = 0; i < IdNode.length; i++) {
                    Info[i] = new Object();
                    Info[i].id = IdNode[i].childNodes.length > 0 ? IdNode[i].firstChild.nodeValue : "";
                    Info[i].WagesClass = WagesClassNode[i].childNodes.length > 0 ? WagesClassNode[i].firstChild.nodeValue : "";

                    Info[i].WagesName = WagesNameNode[i].childNodes.length > 0 ? WagesNameNode[i].firstChild.nodeValue : "";

                    Info[i].WagesBz = WagesBzNode[i].childNodes.length > 0 ? WagesBzNode[i].firstChild.nodeValue : "";
                    Info[i].Isedit = IseditNode[i].childNodes.length > 0 ? IseditNode[i].firstChild.nodeValue : "";
                    Info[i].Isok = IsokNode[i].childNodes.length > 0 ? IsokNode[i].firstChild.nodeValue : "";
                     Info[i].cYear = cYearNode[i].childNodes.length > 0 ? cYearNode[i].firstChild.nodeValue : "";
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



                }
                showHead();
                showInfo();
            }
        }
    }

    function InfoCallBackTwo() {

        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var ItemsNameNode = xmldoc.getElementsByTagName("ItemsName");
                var ItemsTypeNode = xmldoc.getElementsByTagName("ItemsType");
                var cYearNode1 = xmldoc.getElementsByTagName("cYear1");
                var JanPlanNode1 = xmldoc.getElementsByTagName("JanPlan1");

                var FebPlanNode1 = xmldoc.getElementsByTagName("FebPlan1");

                var MarPlanNode1 = xmldoc.getElementsByTagName("MarPlan1");

                var AprPlanNode1 = xmldoc.getElementsByTagName("AprPlan1");

                var MayPlanNode1 = xmldoc.getElementsByTagName("MayPlan1");

                var JunPlanNode1 = xmldoc.getElementsByTagName("JunPlan1");

                var JulPlanNode1 = xmldoc.getElementsByTagName("JulPlan1");

                var AugPlanNode1 = xmldoc.getElementsByTagName("AugPlan1");

                var SepPlanNode1 = xmldoc.getElementsByTagName("SepPlan1");

                var OctPlanNode1 = xmldoc.getElementsByTagName("OctPlan1");

                var NovPlanNode1 = xmldoc.getElementsByTagName("NovPlan1");

                var DecPlanNode1 = xmldoc.getElementsByTagName("DecPlan1");

                var cYearNode2 = xmldoc.getElementsByTagName("cYear2");
                var JanPlanNode2 = xmldoc.getElementsByTagName("JanPlan2");
       
                var FebPlanNode2 = xmldoc.getElementsByTagName("FebPlan2");
         
                var MarPlanNode2 = xmldoc.getElementsByTagName("MarPlan2");
           
                var AprPlanNode2 = xmldoc.getElementsByTagName("AprPlan2");
             
                var MayPlanNode2 = xmldoc.getElementsByTagName("MayPlan2");
        
                var JunPlanNode2 = xmldoc.getElementsByTagName("JunPlan2");
            
                var JulPlanNode2 = xmldoc.getElementsByTagName("JulPlan2");
           
                var AugPlanNode2 = xmldoc.getElementsByTagName("AugPlan2");
               
                var SepPlanNode2 = xmldoc.getElementsByTagName("SepPlan2");
               
                var OctPlanNode2 = xmldoc.getElementsByTagName("OctPlan2");
               
                var NovPlanNode2 = xmldoc.getElementsByTagName("NovPlan2");
               
                var DecPlanNode2 = xmldoc.getElementsByTagName("DecPlan2");



                for (var i = 0; i < ItemsNameNode.length; i++) {
                    
                    Info[i] = new Object();
                    Info[i].ItemsName = ItemsNameNode[i].childNodes.length > 0 ? ItemsNameNode[i].firstChild.nodeValue : "";
                    Info[i].ItemsType = ItemsTypeNode[i].childNodes.length > 0 ? ItemsTypeNode[i].firstChild.nodeValue : "";
                    

                    Info[i].cYear1 = cYearNode1[i].childNodes.length > 0 ? cYearNode1[i].firstChild.nodeValue : "";

                    Info[i].JanPlan1 = JanPlanNode1[i].childNodes.length > 0 ? JanPlanNode1[i].firstChild.nodeValue : "";
              
                    Info[i].FebPlan1= FebPlanNode1[i].childNodes.length > 0 ? FebPlanNode1[i].firstChild.nodeValue : "";
                 
                    Info[i].MarPlan1 = MarPlanNode1[i].childNodes.length > 0 ? MarPlanNode1[i].firstChild.nodeValue : "";
              
                    Info[i].AprPlan1 = AprPlanNode1[i].childNodes.length > 0 ? AprPlanNode1[i].firstChild.nodeValue : "";
                  
                    Info[i].MayPlan1 = MayPlanNode1[i].childNodes.length > 0 ? MayPlanNode1[i].firstChild.nodeValue : "";
                   
                    Info[i].JunPlan1 = JunPlanNode1[i].childNodes.length > 0 ? JunPlanNode1[i].firstChild.nodeValue : "";
              
                    Info[i].JulPlan1 = JulPlanNode1[i].childNodes.length > 0 ? JulPlanNode1[i].firstChild.nodeValue : "";
                
                    Info[i].AugPlan1 = AugPlanNode1[i].childNodes.length > 0 ? AugPlanNode1[i].firstChild.nodeValue : "";
                   
                    Info[i].SepPlan1 = SepPlanNode1[i].childNodes.length > 0 ? SepPlanNode1[i].firstChild.nodeValue : "";
             
                    Info[i].OctPlan1 = OctPlanNode1[i].childNodes.length > 0 ? OctPlanNode1[i].firstChild.nodeValue : "";
                  
                    Info[i].NovPlan1 = NovPlanNode1[i].childNodes.length > 0 ? NovPlanNode1[i].firstChild.nodeValue : "";
                 
                    Info[i].DecPlan1 = DecPlanNode1[i].childNodes.length > 0 ? DecPlanNode1[i].firstChild.nodeValue : "";

                    Info[i].cYear2= cYearNode2[i].childNodes.length > 0 ? cYearNode2[i].firstChild.nodeValue : "";
                    Info[i].JanPlan2 = JanPlanNode2[i].childNodes.length > 0 ? JanPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].FebPlan2 = FebPlanNode2[i].childNodes.length > 0 ? FebPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].MarPlan2 = MarPlanNode2[i].childNodes.length > 0 ? MarPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].AprPlan2 = AprPlanNode2[i].childNodes.length > 0 ? AprPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].MayPlan2 = MayPlanNode2[i].childNodes.length > 0 ? MayPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].JunPlan2 = JunPlanNode2[i].childNodes.length > 0 ? JunPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].JulPlan2 = JulPlanNode2[i].childNodes.length > 0 ? JulPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].AugPlan2 = AugPlanNode2[i].childNodes.length > 0 ? AugPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].SepPlan2 = SepPlanNode2[i].childNodes.length > 0 ? SepPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].OctPlan2 = OctPlanNode2[i].childNodes.length > 0 ? OctPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].NovPlan2 = NovPlanNode2[i].childNodes.length > 0 ? NovPlanNode2[i].firstChild.nodeValue : "";

                    Info[i].DecPlan2 = DecPlanNode2[i].childNodes.length > 0 ? DecPlanNode2[i].firstChild.nodeValue : "";

                    


                }
                
                showInfoTwo();
            }
        }
    }

     function showHead() {

         var strHtml = '<input type="button" name="btSure" id="btSure" onclick="setYear()" value="查询" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;lightgray;margin:2px"/>';
         if (Info[0].Isedit == 1 && Info[0].Isok == 0) {
             strHtml += '<input type="button" name="btSure" id="btSure" onclick="C_EditWages()" value="重改" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/>'+
             '<input type="button" name="btSure" id="btSure" onclick="OkWages()" value="确定" style="width:50px; background-color:White; border:solid 1px lightgray;margin-left:10px;"/>';
         }
        
         
         document.getElementById("head").innerHTML = strHtml;
        }






    function showInfo() {

        var strHtml =

    '<table style="border-collapse:collapse;width:99%;background:white;font-size:9pt" border="1"><tr height="28" bgcolor="#E7E7E7">' +
    '<th style="width:40px;text-align:center;">序号</th>' +
      '<th style="width:80px;text-align:center;">劳务类别</th>' +
     '<th style="width:80px;text-align:center;">员工姓名</th>' +
      '<th style="width:100px;text-align:center;">备注</th>' +
      '<th style="width:50px;text-align:center;">年</th>' +
   
    '<th id="0M" onclick="Hide(id)" style="width:50px;text-align:center;cursor:pointer">1月</th>' +

    '<th id="1M" onclick="Hide(id)" style="width:50px;text-align:center;cursor:pointer">2月</th>' +

    '<th id="2M" onclick="Hide(id)" style="width:50px;text-align:center;cursor:pointer">3月</th>' +

    '<th id="3M" onclick="Hide(id)" style="width:50px;text-align:center;cursor:pointer">4月</th>' +

    '<th id="4M" onclick="Hide(id)" style="width:50px;text-align:center;cursor:pointer">5月</th>' +

    '<th id="5M" onclick="Hide(id)" style="width:50px;text-align:center;cursor:pointer">6月</th>' +

    '<th id="6M" onclick="Hide(id)" style="width:50px;text-align:center;cursor:pointer">7月</th>' +

    '<th id="7M" onclick="Hide(id)" style="width:50px;text-align:center;cursor:pointer">8月</th>' +

    '<th id="8M" onclick="Hide(id)" style="width:50px;text-align:center;cursor:pointer">9月</th>' +

    '<th id="9M" onclick="Hide(id)" style="width:50px;text-align:center;cursor:pointer">10月</th>' +

    '<th id="10M" onclick="Hide(id)" style="width:50px;text-align:center;cursor:pointer">11月</th>' +

    '<th id="11M" onclick="Hide(id)" style="width:50px;text-align:center;cursor:pointer">12月</th>';

        var JanPlan_all = 0;
        var FebPlan_all = 0;
        var MarPlan_all = 0;
        var AprPlan_all = 0;
        var MayPlan_all = 0;
        var JunPlan_all = 0;
        var JulPlan_all = 0;
        var AugPlan_all = 0;
        var SepPlan_all = 0;
        var OctPlan_all = 0;
        var NovPlan_all = 0;
        var DecPlan_all = 0;
        for (var i = 0; i < Info.length; i++) {


            strHtml += '<tr bgcolor="#ffffff"  onMouseMove="this.bgColor=\'#D1DDAA\';" onMouseOut="this.bgColor=\'#FFFFFF\';">' +
                        '<td style="text-align:center;" height="26">' + i + '</td>';          
            strHtml += '<td id="It' + i + '" style="text-align:center;" >' + Info[i].WagesClass + '</td>';
            strHtml += '<td id="It' + i + '" style="text-align:center;" >' + Info[i].WagesName + '</td>';
            strHtml += '<td id="It' + i + '" style="text-align:center;" >' + Info[i].WagesBz + '</td>';

            strHtml += '<td id="It' + i + '" style="text-align:center;">' + Info[i].cYear + '</td>';
            strHtml += '<td id="0M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JanPlan) + '</td>';
            strHtml += '<td id="1M' + i + '" style="text-align:right;">' + Show_Red(Info[i].FebPlan) + '</td>';
            strHtml += '<td id="2M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MarPlan) + '</td>';
            strHtml += '<td id="3M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AprPlan) + '</td>';
            strHtml += '<td id="4M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MayPlan) + '</td>';
            strHtml += '<td id="5M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JunPlan) + '</td>';
            strHtml += '<td id="6M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JulPlan) + '</td>';
            strHtml += '<td id="7M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AugPlan) + '</td>';
            strHtml += '<td id="8M' + i + '" style="text-align:right;">' + Show_Red(Info[i].SepPlan) + '</td>';
            strHtml += '<td id="9M' + i + '" style="text-align:right;">' + Show_Red(Info[i].OctPlan) + '</td>';
            strHtml += '<td id="10M' + i + '" style="text-align:right;">' + Show_Red(Info[i].NovPlan) + '</td>';
            strHtml += '<td id="11M' + i + '" style="text-align:right;">' + Show_Red(Info[i].DecPlan) + '</td>';
            strHtml += '</tr>';


            var JanPlan_all = parseFloat(JanPlan_all)+parseFloat(Info[i].JanPlan);
            var FebPlan_all = parseFloat(FebPlan_all)+parseFloat(Info[i].FebPlan);
            var MarPlan_all = parseFloat(MarPlan_all)+parseFloat(Info[i].MarPlan);
            var AprPlan_all = parseFloat(AprPlan_all)+parseFloat(Info[i].AprPlan);
            var MayPlan_all = parseFloat(MayPlan_all)+parseFloat(Info[i].MayPlan);
            var JunPlan_all = parseFloat(JunPlan_all)+parseFloat(Info[i].JunPlan);
            var JulPlan_all = parseFloat(JulPlan_all)+parseFloat(Info[i].JulPlan);
            var AugPlan_all = parseFloat(AugPlan_all)+parseFloat(Info[i].AugPlan);
            var SepPlan_all = parseFloat(SepPlan_all)+parseFloat(Info[i].SepPlan);
            var OctPlan_all =parseFloat( OctPlan_all)+parseFloat(Info[i].OctPlan);
            var NovPlan_all = parseFloat(NovPlan_all)+parseFloat(Info[i].NovPlan);
            var DecPlan_all = parseFloat(DecPlan_all) + parseFloat(Info[i].DecPlan);



        }


        strHtml += '<tr bgcolor="#ffff00"><td style="text-align:center;" height="30" colspan="4">合计</td>';
 
        strHtml += '<td  style="text-align:center;">' + Info[0].cYear + '</td>';
        strHtml += '<td  style="text-align:right;">' + Show_Red(JanPlan_all) + '</td>';
        strHtml += '<td  style="text-align:right;">' + Show_Red(FebPlan_all) + '</td>';
        strHtml += '<td  style="text-align:right;">' + Show_Red(MarPlan_all) + '</td>';
        strHtml += '<td  style="text-align:right;">' + Show_Red(AprPlan_all) + '</td>';
        strHtml += '<td  style="text-align:right;">' + Show_Red(MayPlan_all) + '</td>';
        strHtml += '<td  style="text-align:right;">' + Show_Red(JunPlan_all) + '</td>';
        strHtml += '<td  style="text-align:right;">' + Show_Red(JulPlan_all) + '</td>';
        strHtml += '<td  style="text-align:right;">' + Show_Red(AugPlan_all) + '</td>';
        strHtml += '<td  style="text-align:right;">' + Show_Red(SepPlan_all) + '</td>';
        strHtml += '<td  style="text-align:right;">' + Show_Red(OctPlan_all) + '</td>';
        strHtml += '<td  style="text-align:right;">' + Show_Red(NovPlan_all) + '</td>';
        strHtml += '<td  style="text-align:right;">' + Show_Red(DecPlan_all) + '</td>';
        strHtml += '</tr>';

              
        strHtml += '</table></div>';
        document.getElementById("content-wrapper").innerHTML = strHtml;
        GetDeptName(1);

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

        function OkWages() {
            var year = document.getElementById("year").value;
            if (confirm("确定要提交工资福利表吗？")) {
                var Str = "?act=okwages&year=" + year + "&mname=" + membername;
               // alert(Str);
                entity.PostStringInfo(Str, this, this.SaveCommitCallBack);
            }
        }


        function C_EditWages() {
            var year = document.getElementById("year").value;
            if (confirm("确定要重新修改工资福利表吗？")) {
                var Str = "?act=c_editwages&year=" + year + "&mname=" + membername;
                // alert(Str);
                entity.PostStringInfo(Str, this, this.SaveCommitCallBack);
            }
        }

    function showInfoTwo() {

        var strHtml =

    '<table style="border-collapse:collapse;width:1600px;background:white;font-size:9pt" border="1"><tr>' +
    '<th style="width:40px;text-align:center;">序号</th>' +
    '<th style="width:100px;text-align:center;">项目</th>' +
    '<th style="width:50px;text-align:center;">年</th>' +
    '<th id="0M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">1月</th>' +

    '<th id="1M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">2月</th>' +

    '<th id="2M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">3月</th>' +

    '<th id="3M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">4月</th>' +

    '<th id="4M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">5月</th>' +

    '<th id="5M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">6月</th>' +

    '<th id="6M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">7月</th>' +

    '<th id="7M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">8月</th>' +

    '<th id="8M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">9月</th>' +

    '<th id="9M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">10月</th>' +

    '<th id="10M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">11月</th>' +

    '<th id="11M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">12月</th>' +
    '<th style="width:50px;text-align:center;">年</th>' +

    '<th id="12M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">1月</th>' +

    '<th id="13M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">2月</th>' +

    '<th id="14M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">3月</th>' +

    '<th id="15M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">4月</th>' +

    '<th id="16M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">5月</th>' +

    '<th id="17M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">6月</th>' +

    '<th id="18M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">7月</th>' +

    '<th id="19M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">8月</th>' +

    '<th id="20M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">9月</th>' +

    '<th id="21M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">10月</th>' +

    '<th id="22M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">11月</th>' +

    '<th id="23M" onclick="Hide(id)" style="width:55px;text-align:center;cursor:pointer">12月</th>';
   

        for (var i = 0; i < Info.length; i++) {

            if (Info[i].ItemsType == 2) {


                strHtml += '<tr bgcolor="#ffff00" height="30">' +
                        '<td style="text-align:center;">' + i + '</td>' +
                        '<td id="It' + i + '" style="text-align:center;">' + Info[i].ItemsName + '</td>' +
                         '<td id="Itw' + i + '" style="text-align:center;">' + Info[i].cYear1 + '</td>' +

                       '<td id="0M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JanPlan1) + '</td>' +

                        '<td id="1M' + i + '" style="text-align:right;">' + Show_Red(Info[i].FebPlan1) + '</td>' +

                        '<td id="2M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MarPlan1) + '</td>' +

                        '<td id="3M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AprPlan1) + '</td>' +

                        '<td id="4M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MayPlan1) + '</td>' +

                        '<td id="5M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JunPlan1) + '</td>' +

                        '<td id="6M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JulPlan1) + '</td>' +

                        '<td id="7M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AugPlan1) + '</td>' +

                        '<td id="8M' + i + '" style="text-align:right;">' + Show_Red(Info[i].SepPlan1) + '</td>' +

                        '<td id="9M' + i + '" style="text-align:right;">' + Show_Red(Info[i].OctPlan1) + '</td>' +

                        '<td id="10M' + i + '" style="text-align:right;">' + Show_Red(Info[i].NovPlan1) + '</td>' +

                        '<td id="11M' + i + '" style="text-align:right;">' + Show_Red(Info[i].DecPlan1) + '</td>' +

                        '<td id="Itn' + i + '" style="text-align:center;">' + Info[i].cYear2 + '</td>' +

                        '<td id="12M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JanPlan2) + '</td>' +

                        '<td id="13M' + i + '" style="text-align:right;">' + Show_Red(Info[i].FebPlan2) + '</td>' +

                        '<td id="14M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MarPlan2) + '</td>' +

                        '<td id="15M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AprPlan2) + '</td>' +

                        '<td id="16M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MayPlan2) + '</td>' +

                        '<td id="17M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JunPlan2) + '</td>' +

                        '<td id="18M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JulPlan2) + '</td>' +

                        '<td id="19M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AugPlan2) + '</td>' +

                        '<td id="20M' + i + '" style="text-align:right;">' + Show_Red(Info[i].SepPlan2) + '</td>' +

                        '<td id="21M' + i + '" style="text-align:right;">' + Show_Red(Info[i].OctPlan2) + '</td>' +

                        '<td id="22M' + i + '" style="text-align:right;">' + Show_Red(Info[i].NovPlan2) + '</td>' +

                        '<td id="23M' + i + '" style="text-align:right;">' + Show_Red(Info[i].DecPlan2) + '</td>';

            } else {

            strHtml += '<tr height="24">' +
                        '<td style="text-align:center;">' + i + '</td>';
            if (i == 0 || i == 1 || i == 6 || i == 7 || i == 10 || i == 11 || i == 15) {
                       strHtml += '<td id="It' + i + '" style="text-align:center;" bgcolor="#733FFC" >' + Info[i].ItemsName + '</td>';
                   }else{
                       strHtml += '<td id="It' + i + '" style="text-align:center;" bgcolor="#FFA384">' + Info[i].ItemsName + '</td>';
                   }
                         strHtml +='<td id="Itw' + i + '" style="text-align:center;">' + Info[i].cYear1 + '</td>' +

                       '<td id="0M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JanPlan1) + '</td>' +

                        '<td id="1M' + i + '" style="text-align:right;">' + Show_Red(Info[i].FebPlan1) + '</td>' +

                        '<td id="2M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MarPlan1) + '</td>' +

                        '<td id="3M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AprPlan1) + '</td>' +

                        '<td id="4M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MayPlan1) + '</td>' +

                        '<td id="5M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JunPlan1) + '</td>' +

                        '<td id="6M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JulPlan1) + '</td>' +

                        '<td id="7M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AugPlan1) + '</td>' +

                        '<td id="8M' + i + '" style="text-align:right;">' + Show_Red(Info[i].SepPlan1) + '</td>' +

                        '<td id="9M' + i + '" style="text-align:right;">' + Show_Red(Info[i].OctPlan1) + '</td>' +

                        '<td id="10M' + i + '" style="text-align:right;">' + Show_Red(Info[i].NovPlan1) + '</td>' +

                        '<td id="11M' + i + '" style="text-align:right;">' + Show_Red(Info[i].DecPlan1) + '</td>' +

                        '<td id="Itn' + i + '" style="text-align:center;">' + Info[i].cYear2 + '</td>' +

                        '<td id="12M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JanPlan2) + '</td>' +

                        '<td id="13M' + i + '" style="text-align:right;">' + Show_Red(Info[i].FebPlan2) + '</td>' +

                        '<td id="14M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MarPlan2) + '</td>' +

                        '<td id="15M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AprPlan2) + '</td>' +

                        '<td id="16M' + i + '" style="text-align:right;">' + Show_Red(Info[i].MayPlan2) + '</td>' +

                        '<td id="17M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JunPlan2) + '</td>' +

                        '<td id="18M' + i + '" style="text-align:right;">' + Show_Red(Info[i].JulPlan2) + '</td>' +

                        '<td id="19M' + i + '" style="text-align:right;">' + Show_Red(Info[i].AugPlan2) + '</td>' +

                        '<td id="20M' + i + '" style="text-align:right;">' + Show_Red(Info[i].SepPlan2) + '</td>' +

                        '<td id="21M' + i + '" style="text-align:right;">' + Show_Red(Info[i].OctPlan2) + '</td>' +

                        '<td id="22M' + i + '" style="text-align:right;">' + Show_Red(Info[i].NovPlan2) + '</td>' +

                        '<td id="23M' + i + '" style="text-align:right;">' + Show_Red(Info[i].DecPlan2) + '</td>';


            }
                     
        }
        strHtml += '</table></div>';
        document.getElementById("content-wrapper").innerHTML = strHtml;
        GetDeptName(2);
    }


        //往下拉列表添加已隐藏月份
        function AddOption(x) {

            var dishide = document.getElementById("dishide");
            dishide.options.add(new Option(x,x));
        }


    //加载年份
       // window.onload = function load() {
      function  load_year(){
        //获取年份
        $.ajax({
            type: "post",
            async: false,
            url: "../Ashx/GetWagesData.ashx",
            data: '',
            datatype: "json",
            success: function (result) {
                eval("var transult=" + result);
                var strhtml = "";
                for (var i = 0; i < transult.length; i++) {
                    strhtml += '<option value="' + transult[i].data + '"';
                    if(transult[i].data == nowYear) {
                        strhtml += ' selected="selected"';

                    }

                    strhtml += '>' + transult[i].data + '</option>';
                    //                    alert(transult[i].data);
                }
                document.getElementById("year").innerHTML = strhtml;
               // document.getElementById("year2").innerHTML = strhtml;
            },
            error: function (errorMsg) {
                alert(errorMsg.responseText);
                alert(errorMsg.status);
                alert("request data failed!!!");
            }
        });
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


    function Show_qhh(num) {
        var parts = num.toString().split(".");
        parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return parts.join(".");
    }

    function Show_Red(num) {
        if (num==0) {
           return " ";
        }else if (num < 0) {
            return "<font color=red>" + Show_qhh(num) + "</font>";
        } else {
            return Show_qhh(num);
        }

    }
</script>
</head>
 <body onload="InitWages()" class="skin-blue sidebar-mini" style="height: auto; min-height: 100%;">



<div class="content-wrapper" id="Div1" style="margin-left:15px">

  <div><table style="border-collapse:collapse;width:99%;background:white;height:15px" border="1";>
   <tr><td  id="welcome" style="height:20px;text-align:center;font-size:10pt;font-weight:bold;width:200px;"></td>
   <td  style="width:700px;border-style:none">


<div class="choBt"><table class="choYea" border="0"><td ><div style="width:30px">年：</div></td><td ><select id="year" style="width:70px"></select></td>
<td>
<div  id="head"></div>


</td></table></td>
<td  style="height:20px;width:200px;text-align:center;font-size:12pt;font-weight:bold;background-color:#9CB75B;border-style:none">工资福利表</td></tr></table>
  
      <div  id="content-wrapper" style="min-height: 298px;">
 
      </div>
     </div>
  <div class="control-sidebar-bg"></div>
</div>

</body>
</html>
