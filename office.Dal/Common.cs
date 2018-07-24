using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using office.Utility;
using office.Model;
using System.Web;

namespace office.Dal
{
  public  class Common
    {
      SqlDataBase db = new SqlDataBase();
      DataTable dt = new DataTable();
      /// <summary>
      /// 从数据库获取用户名和密码
      /// </summary>
      /// <param name="entity"></param>
      /// <returns></returns>
      public DataTable GetInfo(Entity entity) {

          string sql = "select PassWord,MemberName from Member where MemberName='" + entity.MbrName + "'";
          try
          {
              db.Open();
              dt = db.GetDataTableWithSQL(sql.ToString());
          }
          catch
          {
              dt = null;
          }
          finally {
              db.Close();
          }
          return dt;
      }

      /// <summary>
      /// 初始化预算表信息
      /// </summary>
      /// <returns></returns>
      public DataTable InitBudget(string mname,string year) {

          string sql = "select a.DeptCode,b.ItemsName,a.cYear,a.JanPlan,a.JanReal,a.FebPlan,a.FebReal,a.MarPlan,a.MarReal,a.AprPlan,a.AprReal,a.MayPlan,a.MayReal,a.JunPlan,a.JunReal,a.JulPlan,a.JulReal,a.AugPlan,a.AugReal,a.SepPlan,a.SepReal,a.OctPlan,a.OctReal,a.NovPlan,a.NovReal,a.DecPlan,a.DecReal,a.JanPlan+a.FebPlan+a.MarPlan+a.AprPlan+a.MarPlan+a.JunPlan+a.JulPlan+a.AugPlan+a.SepPlan+a.OctPlan+a.NovPlan+a.DecPlan as allCount,b.ItemsType,a.RollYear,a.MonthAve,a.Colloect from T_Budget a,T_Items b where Operators='" + mname + "' and cYear='" + year + "' and a.ItemsId=b.ItemsId";
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
        /// 根据下拉列表选择时间获取数据1和数据2
        /// </summary>
        /// <returns></returns>
      //public DataTable GetDataByYear(string year,string year2,string mname) {
      //    string sql = "  select a.DeptCode,b.ItemsName,a.cYear,a.JanPlan,a.JanReal,a.FebPlan,a.FebReal,a.MarPlan,a.MarReal,a.AprPlan,a.AprReal,a.MayPlan,a.MayReal,a.JunPlan,a.JunReal,a.JulPlan,a.JulReal,a.AugPlan,a.AugReal,a.SepPlan,a.SepReal,a.OctPlan,a.OctReal,a.NovPlan,a.NovReal,a.DecPlan,a.DecReal,a.JanPlan+a.FebPlan+a.MarPlan+a.AprPlan+a.MarPlan+a.JunPlan+a.JulPlan+a.AugPlan+a.SepPlan+a.OctPlan+a.NovPlan+a.DecPlan as allCount,b.ItemsType,a.RollYear,a.MonthAve,a.Colloect from T_Budget a,T_Items b where  (a.cYear='" + year + "' or a.cYear='" + year2 + "') and (a.ItemsId=b.ItemsId and Operators='" + mname + "')";
      //    try
      //    {
      //        db.Open();
      //        dt = db.GetDataTableWithSQL(sql.ToString());
      //    }
      //    catch
      //    {
      //        dt = null;
      //    }
      //    finally
      //    {
      //        db.Close();
      //    }
      //    return dt;
      //}

      /// <summary>
      /// 根据下拉列表选择时间获取数据1
      /// </summary>
      /// <returns></returns>
      public DataTable GetDataByYear(string year,string mname)
      {
          string sql = "select a.DeptCode,b.ItemsName,a.cYear,a.JanPlan,a.JanReal,a.FebPlan,a.FebReal,a.MarPlan,a.MarReal,a.AprPlan,a.AprReal,a.MayPlan,a.MayReal,a.JunPlan,a.JunReal,a.JulPlan,a.JulReal,a.AugPlan,a.AugReal,a.SepPlan,a.SepReal,a.OctPlan,a.OctReal,a.NovPlan,a.NovReal,a.DecPlan,a.DecReal,a.JanPlan+a.FebPlan+a.MarPlan+a.AprPlan+a.MarPlan+a.JunPlan+a.JulPlan+a.AugPlan+a.SepPlan+a.OctPlan+a.NovPlan+a.DecPlan as allCount,b.ItemsType,a.RollYear,a.MonthAve,a.Colloect from T_Budget a,T_Items b where Operators='"+mname+"' and cYear='" + year + "' and a.ItemsId=b.ItemsId";
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


      public DataTable GetDataByYear2(string year, string year2,string mname)
      {
          string sql = "select t3.*,t4.* from(select T1.*,T2.* from(select DeptCode c1,ItemsId Id1,cYear year1,JanPlan jp1 ,JanReal jr1,FebPlan fp1,FebReal fr1,MarPlan mrp1,MarReal mrr1,AprPlan ap1,AprReal ar1,MayPlan map1,MayReal mar1,JunPlan jnp1,JunReal jnr1,JulPlan jup1,JulReal jur1,AugPlan aup1,AugReal aur1,SepPlan sep1,SepReal ser1,OctPlan op1,OctReal or1,NovPlan np1,NovReal nr1,DecPlan dep1,DecReal der1,JanPlan+FebPlan+MarPlan+AprPlan+MarPlan+JunPlan+JulPlan+AugPlan+SepPlan+OctPlan+NovPlan+DecPlan as allCount1,RollYear rollyear1,MonthAve monthave1,Colloect collect1 from T_Budget where Operators='" + mname + "' and cYear='" + year + "') t1,(select DeptCode,ItemsId,cYear,JanPlan,JanReal,FebPlan,FebReal,MarPlan,MarReal,AprPlan,AprReal,MayPlan,MayReal,JunPlan,JunReal,JulPlan,JulReal,AugPlan,AugReal,SepPlan,SepReal,OctPlan,OctReal,NovPlan,NovReal,DecPlan,DecReal,JanPlan+FebPlan+MarPlan+AprPlan+MarPlan+JunPlan+JulPlan+AugPlan+SepPlan+OctPlan+NovPlan+DecPlan as allCount,RollYear,MonthAve,Colloect from T_Budget where Operators='" + mname + "' and cYear='" + year2 + "') t2 where t1.Id1=t2.ItemsId )t3,T_Items t4 where t3.Id1=t4.ItemsId ";
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
