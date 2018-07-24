using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using office.Dal;
using office.Model;

namespace office.Bll
{
  public  class Department
    {
      private office.Dal.Department dalDepartment = null;

      public Department()
        {
            dalDepartment = new Dal.Department();
        }

      /// <summary>
      /// 新增独立单位
      /// </summary>
      /// <param name="model"></param>
      /// <returns></returns>
      public int Add_Department(DepartmentEntity model)
      {
          return dalDepartment.Add_Department(model);
      }


 


      /// <summary>
      /// 初始化独立单位表
      /// </summary>
      /// <returns></returns>
      public DataSet Dept_List(string DeptName, string MemberName, int Grade)
      {
          DataSet ds = new DataSet("SHOPXML");
          ds.Tables.Add(dalDepartment.Dept_List(DeptName,MemberName, Grade));
          return ds;
      }


      /// <summary>
      /// 批量删除
      /// </summary>
      /// <param name="strDel"></param>
      /// <returns></returns>
      public int Del_Dept(int Id)
      {
          return dalDepartment.Del_Dept(Id);
      }



      /// <summary>
      /// 获取站点信息
      /// </summary>
      /// <returns></returns>
      public string GetMajordomo()
      {
        //  bf_Dal.Product dalProduct = new bf_Dal.Product();
          DataTable dt = dalDepartment.GetMajordomo();
          string htmlStr = "";
          if (dt != null && dt.Rows.Count > 0)
          {
              for (int i = 0; i < dt.Rows.Count; i++)
              {
                  htmlStr += "<option value='" + dt.Rows[i][0] + "'>" + dt.Rows[i][1] + "</option>";
              }
          }
          return htmlStr;
      }

      /// <summary>
      /// 获取站点信息
      /// </summary>
      /// <returns></returns>
      public DataSet GetDeptSearch(string manager)
      {
          DataSet ds = new DataSet("SHOPXML");
          ds.Tables.Add(dalDepartment.GetDeptSearch(manager));
          return ds;
      }
      



    }
}
