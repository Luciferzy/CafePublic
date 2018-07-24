<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta http-equiv=”Content-Type” content=”text/html;charset=utf-8″>
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css"/>
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.css"/>

  <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css"/>

  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css"/>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.mi n.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>

  <script src="bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js" type="text/javascript"></script>

 <script type="text/javascript" src="dist/js/adminlte.js"></script>

 <script src="Scripts/RSearchEngine.js" type="text/javascript"></script>
 <script src="Scripts/RXmlHttpRequest.js" type="text/javascript"></script>
  <script src="Scripts/md5.js" type="text/javascript"></script>
  <script type="text/javascript" language="javascript">
      var nmEntity = new RSearchEngine('GetXml.aspx');
      Info = new Array();
      

      
      Grade = getCookie("grade");
      DeptName = getCookie("deptName");

      membername = getCookie("membername");
      Children = getCookie("children");

   
     
      function getCookie(name) {
          var strCookie = document.cookie;
          var arrCookie = strCookie.split("; ");
          for (var i = 0; i < arrCookie.length; i++) {
              var arr = arrCookie[i].split("=");
              if (arr[0] == name) return arr[1];
          }
          return "";
      }

      function Init() {
          if (Grade == 0) {
              var Str = "?act=getsidebarinfo2&membername=" + membername;
              nmEntity.PostStringInfo(Str, this, this.InitCallBack);
          }
          if (Grade == 1) {
              var Str = "?act=getsidebarinfo&children=" + Children;
              nmEntity.PostStringInfo(Str, this, this.InitCallBack);
          }
          
      }

      function InitCallBack() { 
       var xmlHttp = nmEntity.getXmlHttp();
       if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
           if (xmlHttp.status == 200) {
               var xmldoc = xmlHttp.responseXML;
               var ManagerNode = xmldoc.getElementsByTagName("Manager");
               var MemberNameNode = xmldoc.getElementsByTagName("MemberName");
              
               for (var i = 0; i < ManagerNode.length; i++) {
                   Info[i] = new Object();
                   Info[i].Manager = ManagerNode[i].childNodes.length > 0 ? ManagerNode[i].firstChild.nodeValue : "";
                   Info[i].MemberName = MemberNameNode[i].childNodes.length > 0 ? MemberNameNode[i].firstChild.nodeValue : "";
                   
               }
               BingTree();  
           }
       }
   }


   function menuBarItem_click(menuurl, value) {
       var checkname = value.id;
       document.cookie = "checkname=" + checkname;
           document.getElementById("inner").src = menuurl;
           document.getElementById("inner").style.display = '';
      
   }


   function BingTree() {
  
       if (Grade == 0) {
           var strHtml = '<li class="treeview" id="li"> <a href="#"><i class="fa fa-link"></i> <span style=" font-size:9pt">基本设置</span> <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i> </span> </a><ul class="treeview-menu"> <li id="' + membername + '" onclick="menuBarItem_click(\'Pages/admin/Admin_list.aspx\',this),this"><a href="#"><span style=" font-size:9pt">信息修改</span></a></li> </ul> </li>';
           for (var i = 0; i < Info.length; i++) {
               strHtml += '<li class="treeview"><a href="#"><i class="fa fa-link"></i> <span style=" font-size:9pt">' + Info[i].Manager + '</span> <span class="pull-right-container" style=" font-size:9pt"> <i class="fa fa-angle-left pull-right"></i></span></a><ul class="treeview-menu">' +
           '<li id="' + Info[i].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/CafeChaseNew.aspx\',this)"><a href="#"><span style=" font-size:9pt">喝咖啡追赶表</span></a></li>' +
           '<li id="' + Info[i].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/BudgetNew.aspx\',this)"><a href="#"><span style=" font-size:9pt">预算表</span></a></li>' +
           '<li id="' + Info[i].MemberName + '"onclick="menuBarItem_click(\'Pages/Index/Key_indicators.aspx\',this)"><a href="#"><span style=" font-size:9pt">关键指标追赶表</span></a></li>' +
           '<li id="' + Info[i].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/Cash.aspx\',this)"><a href="#"><span style=" font-size:9pt">现金预算表</span></a></li>' +
           '<li id="' + Info[i].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/FixedAssets.aspx\',this)"><a href="#"><span style=" font-size:9pt">固定资产表</span></a></li>' +
            '<li id="' + Info[i].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/Wages.aspx\',this)"><a href="#"><span style=" font-size:9pt">工资福利表</span></a></li>' +
           '</ul></li>';
           }
        }
       if (Grade == 1) {
           var strHtml = '<li class="treeview" id="li"> <a href="#"><i class="fa fa-link"></i> <span style=" font-size:9pt">基本设置</span> <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i> </span> </a><ul class="treeview-menu"> <li id="' + membername + '" onclick="menuBarItem_click(\'Pages/admin/Admin_list.aspx\',this)"><a href="#"><span style=" font-size:9pt">信息修改</span></a></li> </ul> </li>';

           for (var i = 0; i < Info.length; i++) {
               strHtml += '<li class="treeview"><a href="#"><i class="fa fa-link"></i> <span style=" font-size:9pt">' + Info[i].Manager + '</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i></span></a><ul class="treeview-menu">' +
           '<li id="' + Info[i].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/Show_CafeChaseNew.aspx\',this)"><a href="#"><span style=" font-size:9pt">喝咖啡追赶表</span></a></li>' +
           '<li id="' + Info[i].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/Show_BudgetNew.aspx\',this)"><a href="#"><span style=" font-size:9pt">预算表</span></a></li>' +
           '<li id="' + Info[i].MemberName + '"onclick="menuBarItem_click(\'Pages/Index/Show_Key_indicators.aspx\',this)"><a href="#"><span style=" font-size:9pt">关键指标追赶表</span></a></li>' +
           '<li id="' + Info[i].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/Show_Cash.aspx\',this)"><a href="#"><span style=" font-size:9pt">现金预算表</span></a></li>' +
           '<li id="' + Info[i].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/Show_FixedAssets.aspx\',this)"><a href="#"><span style=" font-size:9pt">固定资产表</span></a></li>' +
            '<li id="' + Info[i].MemberName + '" onclick="menuBarItem_click(\'Pages/Index/Show_Wages.aspx\',this)"><a href="#"><span style=" font-size:9pt">工资福利表</span></a></li>' +
           '</ul></li>';
           }
       }
       

       document.getElementById("ul").innerHTML = strHtml;

   }

   function LogOut() {
       if (confirm("确定退出系统？")) {
           window.open("LogIn.aspx", "_top");
       }
   }

  </script>
</head>
<body onload="Init()" class="skin-blue sidebar-mini" style="height: auto; min-height: 560px;">
   <div class="wrapper" style="height: auto; min-height: 560px;">
        <header class="main-header">
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
           <a href="#"  role="button" onclick="LogOut()" style="display:block;margin-top:8px;float:left">
            <span class="lgout"><i class="fa fa-minus-square" style=""></i></span>
          </a>
        </header>
        <div class="slidebar">
        
              <aside class="main-sidebar">

                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">

                  <!-- Sidebar Menu -->
                    <ul class="sidebar-menu tree" data-widget="tree" style="margin-top:20px" id="ul">
        
                        
                  </ul>
                  <!-- /.sidebar-menu -->
                </section>
                <!-- /.sidebar -->
              </aside>

        </div>
          
                
        <div class="content-wrapper" id="Div1">
      
       <iframe  id="inner"  name="rightframe" src="#" frameborder="0" scrolling="no" style="width:100%;height:560px;display:none;"></iframe> 
        </div>
   </div>
</body>
</html>
