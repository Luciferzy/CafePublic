using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using office.Utility;
using office.Model;
using System.Web;
using System.Data.SqlClient;

namespace office.Dal
{
    public class Department
    {
      SqlDataBase db = new SqlDataBase();
      DataTable dt = new DataTable();



      /// <summary>
      /// 新增独立单位
      /// </summary>
      /// <param name="model"></param>
      /// <returns></returns>
      public int Add_Department(DepartmentEntity model)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vmembername",SqlDbType.VarChar,30),           
                    new SqlParameter("vpassword", SqlDbType.VarChar,50),
					new SqlParameter("vdeptcode", SqlDbType.VarChar,20),
                    new SqlParameter("vdeptname", SqlDbType.VarChar,100),
					new SqlParameter("vmanager", SqlDbType.VarChar,30), 
					new SqlParameter("vtel", SqlDbType.VarChar,40),
					new SqlParameter("vposition", SqlDbType.VarChar,40),
                    new SqlParameter("vmjordomo_id", SqlDbType.Int,4),
                    new SqlParameter("vgrade", SqlDbType.Int,4),
                    new SqlParameter("vauthority", SqlDbType.Int,4)
                  
            };
          parameters[0].Value = model.MemberName;
          parameters[1].Value = model.PassWord;
          parameters[2].Value = model.DeptCode;
          parameters[3].Value = model.DeptName;
          parameters[4].Value = model.Manager;
          parameters[5].Value = model.Tel;
          parameters[6].Value = model.Position;
          parameters[7].Value = model.Mjordomo_id;
          parameters[8].Value = model.Grade;
          parameters[9].Value = model.Authority;


          string commandText = "proc_AddDepartment";
          int result = 0;
          try
          {
              db.Open();

              string strHtml0 = "select 1 from T_Department where MemberName='" + model.MemberName + "' ";
              DataTable dt0 = new DataTable();
              dt0 = db.GetDataTableWithSQL(strHtml0);

              string strHtml = "select 1 from T_Department where DeptCode='" + model.DeptCode + "' and Grade=0";
              DataTable dt = new DataTable();
              dt = db.GetDataTableWithSQL(strHtml);

              if (dt0.Rows.Count > 0)
              {
                  result = 3;
              }

              else if (dt.Rows.Count > 0)
              {
                  result = 2;
              }
              else
              {
                 db.ExecuteNonQuery(commandText, CommandType.StoredProcedure, parameters);
                  result = 1;
              }
          }
          catch //(InvalidOperationException ex)
          {
              result = 0;
          }
          finally
          {
              db.Close();
          }
          return result;
      }




      /// <summary>
      /// 初始化独立单位表
      /// </summary>
      /// <returns></returns>
      public DataTable Dept_List(string DeptName,string MemberName,int Grade)
      {
         
           string  sql = "SELECT * from Department where MemberName='" + MemberName + "' and DeptName='" + DeptName + "' and Grade='"+Grade+"'";

        

          try
          {
              db.Open();
              dt = db.GetDataTableWithSQL(sql.ToString());
          }
          catch
          {
              dt = null;
          }
          finally
          {
             
              db.Close();
          }
          return dt;
      }


      /// <summary>
      /// 注销产品
      /// </summary>
      /// <param name="strCancel"></param>
      /// <returns></returns>
      public int Del_Dept(int Id)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vid", SqlDbType.Int)
            };
          parameters[0].Value = Id;

          string commandText = "proc_DelDepartment";
          int result = 0;
          try
          {
              db.Open();
              db.ExecuteNonQuery(commandText, CommandType.StoredProcedure, parameters);
              result = 1;
          }
          catch //(InvalidOperationException ex)
          {
              result = 0;
          }
          finally
          {
              db.Close();
          }
          return result;
      }





      /// <summary>
      /// 返回参数
      /// </summary>
      public DataTable GetMajordomo()
      {
          string sql;
          DataTable infoTable = new DataTable();
          sql = "select Id,DeptName from T_Department where Grade=1 and isPass=1";

          try
          {
              db.Open();
              infoTable = db.GetDataTableWithSQL(sql.ToString());
          }
          catch
          {
              infoTable = null;
          }
          finally
          {
              db.Close();
          }

          return infoTable;
      }

        /// <summary>
        /// 总监管理查询
        /// </summary>
      public DataTable GetDeptSearch(string Manager)
      {

          string sql = "select * from T_Department where Manager like '%" + Manager + "%'";

          try
          {
              db.Open();
              dt = db.GetDataTableWithSQL(sql.ToString());
          }
          catch
          {
              dt = null;
          }
          finally
          {
              db.Close();
          }

          return dt;
      }


    }
}
