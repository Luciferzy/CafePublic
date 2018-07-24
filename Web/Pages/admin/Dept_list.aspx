
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dept_list.aspx.cs" Inherits="Dept_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>独立单位列表</title>
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
    Month2 = new Array();
    var nowdate = new Date();
    var nowYear = nowdate.getFullYear();
    var passYear = nowYear - 1;
    var nowMonth = nowdate.getMonth() + 1;

    function InitDept() {

        mname = getCookie("name");
        Grade = getCookie("grade");
        DeptName = getCookie("eptName");
        Manager = getCookie("manager");
   
       // alert("KDJKDFL");
    
        if (mname == "" || mname == null) {
            window.open("../../LogIn.aspx", "_top");
        }
        else {
            if (Grade == 0) {
                Choose = 0;
                document.getElementById("content-left").style.display = '';
                var Str = "?act=getdeptlist&deptname=" + DeptName + "&manager=" + Manager + "&grade=" + Grade + "&choose=" + Choose;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            if (Grade == 1) {
                document.getElementById("content-left2").style.display = '';
                var Str = "?act=getdeptlist&deptname=" + DeptName + "&manager=" + Manager + "&grade=" + Grade + "&choose=" + Choose;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            if (Grade == 5) {
                Choose = 2;
                Grade = 0;
                document.getElementById("content-left3").style.display = '';
                var Str = "?act=getdeptlist&deptname=" + DeptName + "&manager=" + Manager + "&grade=" + Grade + "&choose=" + Choose;
                entity.PostStringInfo(Str, this, this.InfoCallBack);
            }
            
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

    function search() {
        Info.length = 0;
        Grade = Grade;
        var DeptName = document.getElementById("DeptName").value;
        var Manager = document.getElementById("Manager").value;
        var Str = "?act=getdeptlist&deptname=" + DeptName + "&manager=" + Manager + "&grade=" + Grade;
              // alert(Str);
            entity.PostStringInfo(Str, this, this.InfoCallBack);
        
       
    }

    function InfoCallBack() {
    
        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var IdNode = xmldoc.getElementsByTagName("Id");              
                var MemberNameNode = xmldoc.getElementsByTagName("MemberName");
                var DeptCodeNode = xmldoc.getElementsByTagName("DeptCode");
                var DeptNameNode = xmldoc.getElementsByTagName("DeptName");
                var TelNode = xmldoc.getElementsByTagName("Tel");
                var ManagerNode = xmldoc.getElementsByTagName("Manager");
                var PositionNode = xmldoc.getElementsByTagName("Position");
//                var MjordomoNameNode = xmldoc.getElementsByTagName("MjordomoName");
//                alert(IdNode.length+"id");
//                alert(MemberNameNode.length+"member");
//                alert(DeptNameNode.length+"deptname");
//                alert(DeptCodeNode.length+"deptcode");
//                alert(TelNode.length+"tel");
//                alert(ManagerNode.length+"manager");
//                alert(PositionNode.length+"posotion");
//                alert(MjordomoNameNode.length+"mjor");
                for (var i = 0; i < MemberNameNode.length; i++) {
                    Info[i] = new Object();
                    Info[i].id = IdNode[i].childNodes.length > 0 ? IdNode[i].firstChild.nodeValue : "";
                    Info[i].MemberName = MemberNameNode[i].childNodes.length > 0 ? MemberNameNode[i].firstChild.nodeValue : "";
                    Info[i].DeptCode = DeptCodeNode[i].childNodes.length > 0 ? DeptCodeNode[i].firstChild.nodeValue : "";
                    Info[i].DeptName = DeptNameNode[i].childNodes.length > 0 ? DeptNameNode[i].firstChild.nodeValue : "";
                    Info[i].Tel = TelNode[i].childNodes.length > 0 ? TelNode[i].firstChild.nodeValue : "";
                    Info[i].Manager = ManagerNode[i].childNodes.length > 0 ? ManagerNode[i].firstChild.nodeValue : "";
                    Info[i].Position = PositionNode[i].childNodes.length > 0 ? PositionNode[i].firstChild.nodeValue : "";
//                    Info[i].MjordomoName = MjordomoNameNode[i].childNodes.length > 0 ? MjordomoNameNode[i].firstChild.nodeValue : "";

                }
                
                showInfo();
            }
           
        }
  
    }


    function showInfo() {

    var strHtml = '<div><table style="border-collapse:collapse;width:1000px;background:white;font-size:9pt" border="1"><tr>' +
    '<th style="width:50px;text-align:center;" height="30">独立单位编码</th>' +
    '<th style="width:120px;text-align:center;">独立单位名称</th>' +
      '<th style="width:60px;text-align:center;">负责人</th>' +
       '<th style="width:60px;text-align:center;">电话</th>' +
        '<th style="width:60px;text-align:center;">职务</th>' +
         '<th style="width:60px;text-align:center;">所属总监</th>' +
         '<th style="width:60px;text-align:center;">操作</th></tr>';

        for (var i = 0; i < Info.length; i++) {

            strHtml += '<tr height="24">' +
                        '<td id="It' + i + '" style="text-align:center;" bgcolor="#ffffff">' + Info[i].DeptCode + '</td>' +
                         '<td id="It' + i + '" style="text-align:center;" bgcolor="#ffffff">' + Info[i].DeptName + '</td>' +
                          '<td id="It' + i + '" style="text-align:center;" bgcolor="#ffffff">' + Info[i].Manager + '</td>' +
                           '<td id="It' + i + '" style="text-align:center;" bgcolor="#ffffff">' + Info[i].Tel + '</td>' +
                            '<td id="It' + i + '" style="text-align:center;" bgcolor="#ffffff">' + Info[i].Position + '</td>' +
                              '<td id="It' + i + '" style="text-align:center;" bgcolor="#ffffff">' + Info[i].DeptName + '</td>' +
            '<td id="It' + i + '" style="text-align:center;" bgcolor="#ffffff"> <input type="hidden" value="查看" onclick="PostShow(' + Info[i].id + ')" style="width:30%;font-size:10pt;" /><input type="button" value="修改" onclick="Edit_Dept(' + Info[i].id + ')" style="width:30%;font-size:10pt;" /> <input type="button" value="删除" onclick="Del_Dept(' + Info[i].id + ')" style="width:30%;font-size:10pt; color:Red;" /></td></tr>';
                           
        }

        strHtml += '</table></div>';
        document.getElementById("content-wrapper").innerHTML = strHtml;
     
    }


    function GetDeptName(n) {

        //获取部门名称
        $.ajax({
            type: "post",
            async: false,
            url: "../Ashx/GetDept.ashx",
            data: { "admin": mname },
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

    
    function Add_Dept() {
        url = "dept_add.aspx";
      //  window.open(url);
        window.open(url, null, "height=460,width=650,top=100,left=100,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no,status=no");
    }


    function Del_Dept(proid) {
        if (confirm("确认要删除吗？")) {
            var Str = "?act=deldept&code_del=" + proid;
            entity.PostStringInfo(Str, this, this.Del_DeptCallBack);
        }
    }

    function Del_DeptCallBack() {
        var xmlHttp = entity.getXmlHttp();
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
            if (xmlHttp.status == 200) {
                var xmldoc = xmlHttp.responseXML;
                var stateNode = xmldoc.getElementsByTagName("state");
                if (stateNode.length > 0) {
                    var state = stateNode[0].firstChild.nodeValue;
                    search();
                    alert(state);
                    window.status = state;
                }
                else {
                    alert("删除失败");
                }
            }
            else {
                window.status = '正在写入信息，请稍候...';
            }
        }
    }



    function Edit_Dept(id) {

        url = "Dept_edit.aspx?id=" + id;
        window.open(url, null, "height=400,width=650,top=100,left=100,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no,status=no");
        //window.open(url);
    }

    function PostShow(productid) {
        url = "read_product.aspx?productid=" + productid;
        window.open(url);
    }


    function getCookie(Grade) {
        var strCookie = document.cookie;
        var arrCookie = strCookie.split("; ");
        for (var i = 0; i < arrCookie.length; i++) {
            var arr = arrCookie[i].split("=");
            if (arr[0] == Grade) return arr[1];
        }
        return "";
    }

    function LogOut() {
        if (confirm("确定退出系统？")) {
            window.open("../../LogIn.aspx", "_top");
        }
    }
   
</script>
</head>
    <body onload="InitDept()" class="skin-blue sidebar-mini" style="height: auto; min-height: 100%; overflow:scroll">



  <div class="content-wrapper" id="Div1">

  <div style="overflow-x:scroll"><table style="border-collapse:collapse;width:1000px;background:white;height:40px" border="1";>
   <tr><td id="welcome" style="height:20px;text-align:center;font-size:7pt;font-weight:bold;width:80px;"></td>
   <td style="width:400px;border-style:none">

<div ><table class="choYea" width="600px"><td  style="height:28px;width:90px;text-align:center;">独产单位名：</td><td ><input type="text" id="Manager" value="" size="10"  /> </td><td><input type="button" name="btSure" id="btSure" onclick=" search()" value="查询" style="width:50px; background-color:White; border:solid 1px lightgray;margin:10px;"/><input type="button" name="btSure1" id="btSure1" onclick="Add_Dept()" value="添加" style="width:50px; background-color:White; border:solid 1px lightgray;margin:10px;"/></td></table></td>
<td style="height:40px;width:200px;text-align:center;font-size:12pt;font-weight:bold;background-color:#9CB75B;border-style:none">独产单位管理</td><td style="width:200px;border:none; background-color:White;"></td></tr></table>

  
      <div  id="content-wrapper" style="min-height: 298px;">
      </div>
      
     </div>
  <div class="control-sidebar-bg"></div>
</div>
</div>
</body>
</html>
