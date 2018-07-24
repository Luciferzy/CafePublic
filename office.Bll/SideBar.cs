using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using office.Dal;
using office.Model;

namespace office.Bll
{
 public  class SideBar
    {
     private office.Dal.SideBar dalCommon = null;
     public SideBar()
        {
            dalCommon = new Dal.SideBar();
        }

     //获取菜单栏信息
     public DataSet GetSideBarInfo(string children)
     {
         DataSet ds = new DataSet("SHOPXML");


         ds.Tables.Add(dalCommon.GetSideBarInfo(children));
         return ds;
     }

     //获取菜单栏信息
     public DataSet GetSideBarInfoNew(string membername, int Grade)
     {
         DataSet ds = new DataSet("SHOPXML");
         ds.Tables.Add(dalCommon.GetSideBarInfoNew(membername, Grade));
         return ds;
     }

     public DataSet GetSideBarInfo2(string membername)
     {
         DataSet ds = new DataSet("SHOPXML");


         ds.Tables.Add(dalCommon.GetSideBarInfo2(membername));
         return ds;
     }

     public DataSet GetMenu(string orders)
     {
         DataSet ds = new DataSet("SHOPXML");

         ds.Tables.Add(dalCommon.GetMenu(orders));
         return ds;
     }
    }
}
