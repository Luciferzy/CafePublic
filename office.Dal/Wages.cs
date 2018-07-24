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
  public  class Wages
    {
      SqlDataBase db = new SqlDataBase();
      DataTable dt = new DataTable();
     

      /// <summary>
      /// 初始化现金推算表
      /// </summary>
      /// <returns></returns>
      public DataTable InitWages(string mname, string year)
      {

          string sql = "select Id,WagesClass,WagesName,WagesBz,cYear,JanPlan,FebPlan,MarPlan,AprPlan,MayPlan,JunPlan,JulPlan,AugPlan,SepPlan,OctPlan,NovPlan,DecPlan,Isedit,Isok  from T_Wages where Operators='" + mname + "' and cYear='" + year + "'";
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
      /// 根据下拉列表选择时间获取数据1
      /// </summary>
      /// <returns></returns>
      public DataTable GetWagesDataByYear(string year, string mname)
      {
          string sql = "select Id,WagesClass,isnull(WagesName,' ') as WagesName ,isnull(WagesBz,' ') as WagesBz,cYear,JanPlan,FebPlan,MarPlan,AprPlan,MayPlan,JunPlan,JulPlan,AugPlan,SepPlan,OctPlan,NovPlan,DecPlan,Isedit,Isok from T_Wages where Operators='" + mname + "' and cYear='" + year + "'";
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


      public DataTable GetWagesDataByYear2(string year, string year2, string mname)
      {
          //string sql = "select t3.*,t4.* from(select T1.*,T2.* from(select DeptCode c1,ItemsId Id1,cYear year1,JanPlan jp1 ,FebPlan fp1,MarPlan mrp1,AprPlan ap1,MayPlan map1,JunPlan jnp1,JulPlan jup1,AugPlan aup1,SepPlan sep1,OctPlan op1,NovPlan np1,DecPlan dep1 from T_Wages where Operators='" + mname + "' and cYear='" + year + "') t1,(select DeptCode,ItemsId,cYear,JanPlan,FebPlan,MarPlan,AprPlan,MayPlan,JunPlan,JulPlan,AugPlan,SepPlan,OctPlan,NovPlan,DecPlan from T_Wages where Operators='" + mname + "' and cYear='" + year2 + "') t2 where t1.Id1=t2.ItemsId )t3,T_Items t4 where t3.Id1=t4.ItemsId ";
          string sql = "select t3.* from(select T1.*,T2.* from(select WagesClass WagesClass,isnull(WagesName,' ') as WagesName ,isnull(WagesBz,' ') as WagesBz,cYear cYear1,JanPlan JanPlan1 ,FebPlan FebPlan1,MarPlan MarPlan1,AprPlan AprPlan1,MayPlan MayPlan1,JunPlan JunPlan1,JulPlan JulPlan1,AugPlan AugPlan1,SepPlan SepPlan1,OctPlan OctPlan1,NovPlan NovPlan1,DecPlan DecPlan1 from T_Wages where Operators='" + mname + "' and cYear='" + year + "') t1,(select WagesClass WagesClass2,WagesName WagesName2,WagesBz WagesBz2,cYear cYear2,JanPlan JanPlan2,FebPlan FebPlan2,MarPlan MarPlan2,AprPlan AprPlan2,MayPlan MayPlan2,JunPlan JunPlan2,JulPlan JulPlan2,AugPlan AugPlan2,SepPlan SepPlan2,OctPlan OctPlan2,NovPlan NovPlan2,DecPlan DecPlan2 from T_Wages where Operators='" + mname + "' and cYear='" + year2 + "') t2 where t1.WagesName1=t2.WagesName2  and t1.WagesClass1=t2.WagesClass2)t3 ";
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
      /// 编辑现金推算表
      /// </summary>
      /// <param name="model"></param>
      /// <returns></returns>
      public int EditWages(ListWagesEntity model)
      {
          SqlParameter[] parameters = {
                    new SqlParameter("vIdSave",SqlDbType.VarChar,300),
                    new SqlParameter("vJanPlanSave",SqlDbType.VarChar,300),
                    new SqlParameter("vFebPlanSave", SqlDbType.VarChar,300),
                    new SqlParameter("vMarPlanSave", SqlDbType.VarChar,300),
                    new SqlParameter("vAprPlanSave", SqlDbType.VarChar,300),
                    new SqlParameter("vMayPlanSave", SqlDbType.VarChar,300),
                    new SqlParameter("vJunPlanSave", SqlDbType.VarChar,300),
                    new SqlParameter("vJulPlanSave", SqlDbType.VarChar,300),
                    new SqlParameter("vAugPlanSave", SqlDbType.VarChar,300),
                    new SqlParameter("vSepPlanSave", SqlDbType.VarChar,300),          
                    new SqlParameter("vOctPlanSave", SqlDbType.VarChar,300),
                    new SqlParameter("vNovPlanSave",SqlDbType.VarChar,300),
                    new SqlParameter("vDecPlanSave",SqlDbType.VarChar,300)
            };
          parameters[0].Value = model.IdSave;
          parameters[1].Value = model.JanPlanSave;
          parameters[2].Value = model.FebPlanSave;
          parameters[3].Value = model.MarPlanSave;
          parameters[4].Value = model.AprPlanSave;
          parameters[5].Value = model.MayPlanSave;
          parameters[6].Value = model.JunPlanSave;
          parameters[7].Value = model.JulPlanSave;
          parameters[8].Value = model.AugPlanSave;
          parameters[9].Value = model.SepPlanSave;
          parameters[10].Value = model.OctPlanSave;
          parameters[11].Value = model.NovPlanSave;
          parameters[12].Value = model.DecPlanSave;

          string commandText = "proc_EditWages";
          int result = 2;
          try
          {
              db.Open();
              db.ExecuteNonQuery(commandText,CommandType.StoredProcedure,parameters);
              result = 1;
          }
          catch 
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
      /// 提交现金推算表
      /// </summary>
      /// <param name="iWeekly"></param>
      /// <param name="supcode"></param>
      /// <returns></returns>
      public int SaveWages(string year, string mname)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vyear", SqlDbType.VarChar,20),
                    new SqlParameter("vmname", SqlDbType.VarChar,100)
                
            };
          parameters[0].Value = year;
          parameters[1].Value = mname;


          string commandText = "proc_SaveWages";
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
      /// 提交现金推算表
      /// </summary>
      /// <param name="iWeekly"></param>
      /// <param name="supcode"></param>
      /// <returns></returns>
      public int C_EditWages(string year, string mname)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vyear", SqlDbType.VarChar,20),
                    new SqlParameter("vmname", SqlDbType.VarChar,100)
                
            };
          parameters[0].Value = year;
          parameters[1].Value = mname;


          string commandText = "proc_C_EditWages";
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
      /// 提交现金推算表
      /// </summary>
      /// <param name="iWeekly"></param>
      /// <param name="supcode"></param>
      /// <returns></returns>
      public int OkWages(string year, string mname)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vyear", SqlDbType.VarChar,20),
                    new SqlParameter("vmname", SqlDbType.VarChar,100)
                
            };
          parameters[0].Value = year;
          parameters[1].Value = mname;


          string commandText = "proc_OkWages";
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
      /// 新增独立单位
      /// </summary>
      /// <param name="model"></param>
      /// <returns></returns>
      public int Add_Wages(WagesEntity model)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vdeptname",SqlDbType.VarChar,30),           
                    new SqlParameter("vmembername", SqlDbType.VarChar,50),
					new SqlParameter("vwagesclass", SqlDbType.VarChar,50),
                    new SqlParameter("vwagesname", SqlDbType.VarChar,60),
					new SqlParameter("vwagesbz", SqlDbType.VarChar,100), 
					new SqlParameter("vcyear", SqlDbType.VarChar,30),
					new SqlParameter("vjanplan", SqlDbType.Decimal),
                    new SqlParameter("vfebplan", SqlDbType.Decimal),
                    new SqlParameter("vmarplan", SqlDbType.Decimal),
                    new SqlParameter("vaprplan", SqlDbType.Decimal),

                    new SqlParameter("vmayplan", SqlDbType.Decimal),
					new SqlParameter("vjunplan", SqlDbType.Decimal),
                    new SqlParameter("vjulplan", SqlDbType.Decimal),
                    new SqlParameter("vaugplan", SqlDbType.Decimal),
                    new SqlParameter("vsepplan", SqlDbType.Decimal),
                    new SqlParameter("voctplan", SqlDbType.Decimal),
                    new SqlParameter("vnovplan", SqlDbType.Decimal),
                    new SqlParameter("vdecplan", SqlDbType.Decimal)
            };
          parameters[0].Value = model.DeptName;
          parameters[1].Value = model.MemberName;
          parameters[2].Value = model.WagesClass;
          parameters[3].Value = model.WagesName;
          parameters[4].Value = model.WagesBz;
          parameters[5].Value = model.cYear;
          parameters[6].Value = model.JanPlan;
          parameters[7].Value = model.FebPlan;
          parameters[8].Value = model.MarPlan;
          parameters[9].Value = model.AprPlan;

          parameters[10].Value = model.MayPlan;
          parameters[11].Value = model.JunPlan;
          parameters[12].Value = model.JulPlan;
          parameters[13].Value = model.AugPlan;
          parameters[14].Value = model.SepPlan;

          parameters[15].Value = model.OctPlan;
          parameters[16].Value = model.NovPlan;
          parameters[17].Value = model.DecPlan;


          string commandText = "proc_AddWages";
          int result = 0;
          try
          {
              db.Open();

           

             // string strHtml = "select 1 from T_Wages where DeptName='" + model.DeptName + "' and  WagesClass='" + model.WagesClass + "'and  cYear='" + model.cYear + "'";
            // DataTable dt = new DataTable();
              //dt = db.GetDataTableWithSQL(strHtml);

             

              //if (dt.Rows.Count > 0)
              //{
            // result = 2;
              // }
               //else
             //{
              db.ExecuteNonQuery(commandText, CommandType.StoredProcedure, parameters);
              result = 1;
             // }
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









    }
}
