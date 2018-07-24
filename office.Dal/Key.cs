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
  public  class Key
    {
      SqlDataBase db = new SqlDataBase();
      DataTable dt = new DataTable();
     

      /// <summary>
      /// 初始化关键指标追赶表
      /// </summary>
      /// <returns></returns>
      public DataTable InitKey(string mname, string year, string year2)
      {
          
          //string sql = "select Id,DeptCode,Isedit,cYear,cMonth,LastYear_ActualSales,LastYear_PlanSales,LastYear_CompletionRatio,cYear_ActualSalesP,cYear_PlanSalesP,cYear_CompletionRatioP,cYear_ActualSalesN,cYear_PlanSalesN,cYear_CompletionRatioN,StageTarget,cYear_Plan,PlanDifference,PlanBz,cYear_Now,NowDifference,NowBz,Sketch from Key_indicators  where Operators='" + mname + "' and cYear='" + year + "'";
          //string sql = "select Id,DeptCode,Isedit,cYear,cMonth,LastYear_ActualSales,LastYear_PlanSales,LastYear_CompletionRatio,cYear_ActualSalesP,cYear_PlanSalesP,cYear_CompletionRatioP,cYear_ActualSalesN,cYear_PlanSalesN,cYear_CompletionRatioN,StageTarget,cYear_Plan,PlanDifference,isnull(PlanBz,'') as PlanBz,cYear_Now,NowDifference,isnull(NowBz,'') as NowBz,isnull(Sketch,'') as Sketch from T_Key_indicators  where Operators='" + mname + "' and cYear='" + year + "'";

        // string sql = "select T1.*,T2.* from(select Id Id1,DeptCode DeptCode1,Isedit Isedit1,cYear cYear1,cMonth cMonth1 ,cYear_ActualSalesPlan cYear_ActualSalesPlan1,cYear_ActualSalesReal cYear_ActualSalesReal1,cYear_PlanSalesPlan cYear_PlanSalesPlan1,cYear_PlanSalesReal cYear_PlanSalesReal1,cYear_CompletionRatioPlan cYear_CompletionRatioPlan1,cYear_CompletionRatioReal cYear_CompletionRatioReal1,Sketch Sketch1 from T_Key_indicators where Operators='" + mname + "' and cYear='" + year + "') t1,(select Id Id2,DeptCode DeptCode2,Isedit Isedit2,cYear cYear2,cMonth cMonth2,cYear_ActualSalesPlan cYear_ActualSalesPlan2,cYear_ActualSalesReal cYear_ActualSalesReal2,cYear_PlanSalesPlan cYear_PlanSalesPlan2,cYear_PlanSalesReal cYear_PlanSalesReal2,cYear_CompletionRatioPlan cYear_CompletionRatioPlan2,cYear_CompletionRatioReal cYear_CompletionRatioReal2,Sketch Sketch2  from T_Key_indicators where Operators='" + mname + "' and cYear='" + year2 + "') t2 where t1.cMonth1=t2.cMonth2";
          string sql = "select T2.Id2 as Id,T2.DeptCode2 as DeptCode,T2.Isedit2 as Isedit,T2.Isok2 as Isok,T2.cMonth2 as cMonth,T2.cYear_target2 as cYear_target,T1.cYear1,T1.cYear_ActualSalesPlan1,T1.cYear_ActualSalesReal1,T1.cYear_PlanSalesPlan1,T1.cYear_PlanSalesReal1,T1.cYear_CompletionRatioPlan1,T1.cYear_CompletionRatioReal1,T2.cYear2,T2.cYear_ActualSalesPlan2,T2.cYear_ActualSalesReal2,T2.cYear_PlanSalesPlan2,T2.cYear_PlanSalesReal2,T2.cYear_CompletionRatioPlan2,T2.cYear_CompletionRatioReal2,isnull(T2.Sketch2,'-') as Sketch from(select Id Id1,DeptCode DeptCode1,Isedit Isedit1,Isok Isok1,cYear cYear1,cMonth cMonth1 ,cYear_ActualSalesPlan cYear_ActualSalesPlan1,cYear_ActualSalesReal cYear_ActualSalesReal1,cYear_PlanSalesPlan cYear_PlanSalesPlan1,cYear_PlanSalesReal cYear_PlanSalesReal1,cYear_CompletionRatioPlan cYear_CompletionRatioPlan1,cYear_CompletionRatioReal cYear_CompletionRatioReal1,Sketch Sketch1,cYear_target cYear_target1 from T_Key_indicators where Operators='" + mname + "' and cYear='" + year + "') t1,(select Id Id2,DeptCode DeptCode2,Isedit Isedit2,Isok Isok2,cYear cYear2,cMonth cMonth2,cYear_ActualSalesPlan cYear_ActualSalesPlan2,cYear_ActualSalesReal cYear_ActualSalesReal2,cYear_PlanSalesPlan cYear_PlanSalesPlan2,cYear_PlanSalesReal cYear_PlanSalesReal2,cYear_CompletionRatioPlan cYear_CompletionRatioPlan2,cYear_CompletionRatioReal cYear_CompletionRatioReal2,Sketch Sketch2,cYear_target cYear_target2  from T_Key_indicators where Operators='" + mname + "' and cYear='" + year2 + "') t2 where t1.cMonth1=t2.cMonth2";
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
      public DataTable GetKeyDataByYear(string year,string year2, string mname)
      {
          

          string sql = "select T2.Id2 as Id,T2.DeptCode2 as DeptCode,T2.Isedit2 as Isedit,T2.Isok2 as Isok,T2.cMonth2 as cMonth,T2.cYear_target2 as cYear_target,T1.cYear1,T1.cYear_ActualSalesPlan1,T1.cYear_ActualSalesReal1,T1.cYear_PlanSalesPlan1,T1.cYear_PlanSalesReal1,T1.cYear_CompletionRatioPlan1,T1.cYear_CompletionRatioReal1,T2.cYear2,T2.cYear_ActualSalesPlan2,T2.cYear_ActualSalesReal2,T2.cYear_PlanSalesPlan2,T2.cYear_PlanSalesReal2,T2.cYear_CompletionRatioPlan2,T2.cYear_CompletionRatioReal2,isnull(T2.Sketch2,'') as Sketch from(select Id Id1,DeptCode DeptCode1,Isedit Isedit1,Isok Isok1,cYear cYear1,cMonth cMonth1 ,cYear_ActualSalesPlan cYear_ActualSalesPlan1,cYear_ActualSalesReal cYear_ActualSalesReal1,cYear_PlanSalesPlan cYear_PlanSalesPlan1,cYear_PlanSalesReal cYear_PlanSalesReal1,cYear_CompletionRatioPlan cYear_CompletionRatioPlan1,cYear_CompletionRatioReal cYear_CompletionRatioReal1,Sketch Sketch1,cYear_target cYear_target1 from T_Key_indicators where Operators='" + mname + "' and cYear='" + year + "') t1,(select Id Id2,DeptCode DeptCode2,Isedit Isedit2,Isok Isok2,cYear cYear2,cMonth cMonth2,cYear_ActualSalesPlan cYear_ActualSalesPlan2,cYear_ActualSalesReal cYear_ActualSalesReal2,cYear_PlanSalesPlan cYear_PlanSalesPlan2,cYear_PlanSalesReal cYear_PlanSalesReal2,cYear_CompletionRatioPlan cYear_CompletionRatioPlan2,cYear_CompletionRatioReal cYear_CompletionRatioReal2,Sketch Sketch2,cYear_target cYear_target2  from T_Key_indicators where Operators='" + mname + "' and cYear='" + year2 + "') t2 where t1.cMonth1=t2.cMonth2";
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


      public DataTable GetKeyDataByYear2(string year, string year2, string mname)
      {
          string sql = "select t3.*,t4.* from(select T1.*,T2.* from(select DeptCode c1,ItemsId Id1,cYear year1,JanPlan jp1 ,FebPlan fp1,MarPlan mrp1,AprPlan ap1,MayPlan map1,JunPlan jnp1,JulPlan jup1,AugPlan aup1,SepPlan sep1,OctPlan op1,NovPlan np1,DecPlan dep1 from T_Key where Operators='" + mname + "' and cYear='" + year + "') t1,(select DeptCode,ItemsId,cYear,JanPlan,FebPlan,MarPlan,AprPlan,MayPlan,JunPlan,JulPlan,AugPlan,SepPlan,OctPlan,NovPlan,DecPlan from T_Key where Operators='" + mname + "' and cYear='" + year2 + "') t2 where t1.Id1=t2.ItemsId )t3,T_Items t4 where t3.Id1=t4.ItemsId ";
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
      public int EditKey(ListKeyEntity model)
      {
          SqlParameter[] parameters = {
                    new SqlParameter("vIdSave",SqlDbType.VarChar,300),
                    new SqlParameter("vcYear_ActualSalesPlanSave",SqlDbType.VarChar,300),
                   // new SqlParameter("vcYear_ActualSalesRealSave", SqlDbType.VarChar,300),
                    new SqlParameter("vcYear_PlanSalesPlanSave", SqlDbType.VarChar,300),
                   // new SqlParameter("vcYear_PlanSalesRealSave", SqlDbType.VarChar,300),
                   // new SqlParameter("vcYear_CompletionRatioPlanSave", SqlDbType.VarChar,300),
                   // new SqlParameter("vcYear_CompletionRatioRealSave", SqlDbType.VarChar,300),
                    new SqlParameter("vSketchSave", SqlDbType.VarChar,5000),
                    new SqlParameter("vcYear_targetSave", SqlDbType.VarChar,300)
               
            };
          parameters[0].Value = model.IdSave;
          parameters[1].Value = model.cYear_ActualSalesPlanSave;
        //  parameters[2].Value = model.cYear_ActualSalesRealSave;
          parameters[2].Value = model.cYear_PlanSalesPlanSave;
         // parameters[4].Value = model.cYear_PlanSalesRealSave;
         // parameters[5].Value = model.cYear_CompletionRatioPlanSave;
         // parameters[6].Value = model.cYear_CompletionRatioRealSave;
          parameters[3].Value = model.SketchSave;
          parameters[4].Value = model.cYear_targetSave;
       

          string commandText = "proc_EditKey";
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
      public int SaveKey(string year, string mname)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vyear", SqlDbType.VarChar,20),
                    new SqlParameter("vmname", SqlDbType.VarChar,100)
                
            };
          parameters[0].Value = year;
          parameters[1].Value = mname;


          string commandText = "proc_SaveKey";
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
      public int OkKey(string year, string mname)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vyear", SqlDbType.VarChar,20),
                    new SqlParameter("vmname", SqlDbType.VarChar,100)
                
            };
          parameters[0].Value = year;
          parameters[1].Value = mname;


          string commandText = "proc_OkKey";
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
      public int C_EditKey(string year, string mname)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vyear", SqlDbType.VarChar,20),
                    new SqlParameter("vmname", SqlDbType.VarChar,100)
                
            };
          parameters[0].Value = year;
          parameters[1].Value = mname;


          string commandText = "proc_C_EditKey";
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
      public int EditTarget(string year, string mname,string cYear_target)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vyear", SqlDbType.VarChar,20),
                    new SqlParameter("vmname", SqlDbType.VarChar,100),
                    new SqlParameter("vcYear_target", SqlDbType.VarChar,100)
                
            };
          parameters[0].Value = year;
          parameters[1].Value = mname;
          parameters[2].Value = cYear_target;


          string commandText = "proc_EditTarget";
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
      public int EditcYear_ActualSalesPlan(string id, string cYear_ActualSalesPlan)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vid", SqlDbType.VarChar,20),
                    new SqlParameter("vcYear_ActualSalesPlan", SqlDbType.VarChar,100)
                
                
            };
          parameters[0].Value = id;
          parameters[1].Value = cYear_ActualSalesPlan;



          string commandText = "proc_EditcYear_ActualSalesPlan";
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
      public int EditcYear_PlanSalesPlan(string id, string cYear_PlanSalesPlan)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vid", SqlDbType.VarChar,20),
                    new SqlParameter("vcYear_PlanSalesPlan", SqlDbType.VarChar,100)
                
                
            };
          parameters[0].Value = id;
          parameters[1].Value = cYear_PlanSalesPlan;



          string commandText = "proc_EditcYear_PlanSalesPlan";
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





    }
}
