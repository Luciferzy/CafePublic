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
  public  class Cash
    {
      SqlDataBase db = new SqlDataBase();
      DataTable dt = new DataTable();


      #region
      /// <summary>
      /// 获取现金推算表信息
      /// </summary>
      /// <returns></returns>
      public DataTable GetCashInfoOneYear(ListCafeEntity model)
      {
          string strHtml = " from T_Cash t1,T_Items t2 where t1.ItemsId=t2.ItemsId and t1.Operators='" + model.UserCode.Trim() + "' and t2.ItemsType=28 and t2.IsVisible=1 ";
          if (model.YearS == 0)
          {
              strHtml += " and cYear=datename(yyyy,getdate()) ";
          }
          else
          {
              strHtml += " and cYear=" + model.YearS;
          }
          DataTable dt = new DataTable();
          string strSql = "select t1.Id,t1.ItemsId,ItemsName,cYear,MONTH(getdate()) NowMonth,datename(yyyy,getdate()) NowYear,"+
                          "JanPlan,FebPlan,MarPlan,AprPlan,MayPlan,JunPlan,JulPlan,AugPlan,SepPlan,OctPlan,NovPlan,DecPlan " + strHtml.Trim();
          try
          {
              db.Open();
              dt = db.GetDataTableWithSQL(strSql);
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
      /// 获取现金推算表信息
      /// </summary>
      /// <returns></returns>
      public DataTable GetCashInfoTwoYear(ListCafeEntity model)
      {
          DataTable dt = new DataTable();
          string strSql = "select t4.ItemsName,t3.*from (select t1.*,t2.* from (select Id,ItemsId,cYear,MONTH(getdate()) NowMonth,datename(yyyy,getdate()) NowYear," +
                          "JanPlan,FebPlan,MarPlan,AprPlan,MayPlan,JunPlan,JulPlan,AugPlan,SepPlan,OctPlan,NovPlan,DecPlan " +
                          "from T_Cash where Operators='" + model.UserCode.Trim() + "' and cYear=" + model.YearS + ") t1," +
                          "(select Id kId,ItemsId kItemsId,cYear kcYear," +
                          "JanPlan kJanPlan,FebPlan kFebPlan,MarPlan kMarPlan,AprPlan kAprPlan,MayPlan kMayPlan,JunPlan kJunPlan,JulPlan kJulPlan,AugPlan kAugPlan," +
                          "SepPlan kSepPlan,OctPlan kOctPlan,NovPlan kNovPlan,DecPlan kDecPlan " +
                          "from T_Cash where Operators='" + model.UserCode.Trim() + "' and cYear=" + model.YearE + ") t2 where t1.ItemsId=t2.kItemsId) t3,T_Items t4 where t3.ItemsId=t4.ItemsId and t4.ItemsType=28 and t4.IsVisible=1";
          try
          {
              db.Open();
              dt = db.GetDataTableWithSQL(strSql);
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
      /// 获取现金推算表信息
      /// </summary>
      /// <returns></returns>
      public DataTable GetCashStatisticInfoOneYear(ListCafeEntity model)
      {
          string strHtml = " from T_Cash t1,T_Items t2,DirAndMin t3 where t1.ItemsId=t2.ItemsId and t1.Operators=t3.Minister and "+
                          " t3.Director='" + model.UserCode.Trim() + "' and t2.ItemsType=28 and t2.IsVisible=1 ";
          if (model.YearS == 0)
          {
              strHtml += " and cYear=datename(yyyy,getdate()) ";
          }
          else
          {
              strHtml += " and cYear=" + model.YearS;
          }
          DataTable dt = new DataTable();
          string strSql = "select t1.ItemsId,ItemsName,cYear,MONTH(getdate()) NowMonth,datename(yyyy,getdate()) NowYear," +
                          "SUM(JanPlan) JanPlan,SUM(FebPlan) FebPlan,SUM(MarPlan) MarPlan,SUM(AprPlan) AprPlan,SUM(MayPlan) MayPlan,SUM(JunPlan) JunPlan," +
                          "SUM(JulPlan) JulPlan,SUM(AugPlan) AugPlan,SUM(SepPlan) SepPlan,SUM(OctPlan) OctPlan,SUM(NovPlan) NovPlan,SUM(DecPlan) DecPlan " +
                          strHtml.Trim() + " group by t1.ItemsId,ItemsName,cYear order by t1.ItemsId ";
          try
          {
              db.Open();
              dt = db.GetDataTableWithSQL(strSql);
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
      /// 获取现金推算表信息
      /// </summary>
      /// <returns></returns>
      public DataTable GetCashStatisticInfoTwoYear(ListCafeEntity model)
      {
          DataTable dt = new DataTable();
          string strSql = "select t4.ItemsName,t3.*from (select t1.*,t2.* from (select ItemsId,cYear,MONTH(getdate()) NowMonth,datename(yyyy,getdate()) NowYear," +
                          "SUM(JanPlan) JanPlan,SUM(FebPlan) FebPlan,SUM(MarPlan) MarPlan,SUM(AprPlan) AprPlan,SUM(MayPlan) MayPlan,SUM(JunPlan) JunPlan,"+
                          "SUM(JulPlan) JulPlan,SUM(AugPlan) AugPlan,SUM(SepPlan) SepPlan,SUM(OctPlan) OctPlan,SUM(NovPlan) NovPlan,SUM(DecPlan) DecPlan " +
                          "from T_Cash a,DirAndMin b where a.Operators=b.Minister and b.Director='" + model.UserCode.Trim() + "' and cYear=" + model.YearS + "  group by ItemsId,cYear) t1," +
                          "(select ItemsId kItemsId,cYear kcYear," +
                          "SUM(JanPlan) kJanPlan,SUM(FebPlan) kFebPlan,SUM(MarPlan) kMarPlan,SUM(AprPlan) kAprPlan,SUM(MayPlan) kMayPlan,SUM(JunPlan) kJunPlan," +
                          "SUM(JulPlan) kJulPlan,SUM(AugPlan) kAugPlan,SUM(SepPlan) kSepPlan,SUM(OctPlan) kOctPlan,SUM(NovPlan) kNovPlan,SUM(DecPlan) kDecPlan " +
                          "from T_Cash a,DirAndMin b where a.Operators=b.Minister and b.Director='" + model.UserCode.Trim() + "' and cYear=" + model.YearE + "  group by ItemsId,cYear) t2 " +
                          "where t1.ItemsId=t2.kItemsId) t3,T_Items t4 where t3.ItemsId=t4.ItemsId and t4.ItemsType=28 and t4.IsVisible=1 order by t3.ItemsId";
          try
          {
              db.Open();
              dt = db.GetDataTableWithSQL(strSql);
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
      /// 获取现金推算表信息
      /// </summary>
      /// <returns></returns>
      public DataTable GetCashStatisticInfoAllOneYear(ListCafeEntity model)
      {
          string strHtml = " from T_Cash t1,T_Items t2 where t1.ItemsId=t2.ItemsId and t2.ItemsType=28 and t2.IsVisible=1 ";
          if (model.YearS == 0)
          {
              strHtml += " and cYear=datename(yyyy,getdate()) ";
          }
          else
          {
              strHtml += " and cYear=" + model.YearS;
          }
          DataTable dt = new DataTable();
          string strSql = "select t1.ItemsId,ItemsName,cYear,MONTH(getdate()) NowMonth,datename(yyyy,getdate()) NowYear," +
                          "SUM(JanPlan) JanPlan,SUM(FebPlan) FebPlan,SUM(MarPlan) MarPlan,SUM(AprPlan) AprPlan,SUM(MayPlan) MayPlan,SUM(JunPlan) JunPlan," +
                          "SUM(JulPlan) JulPlan,SUM(AugPlan) AugPlan,SUM(SepPlan) SepPlan,SUM(OctPlan) OctPlan,SUM(NovPlan) NovPlan,SUM(DecPlan) DecPlan " +
                          strHtml.Trim() + " group by t1.ItemsId,ItemsName,cYear order by t1.ItemsId ";
          try
          {
              db.Open();
              dt = db.GetDataTableWithSQL(strSql);
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
      /// 获取现金推算表信息
      /// </summary>
      /// <returns></returns>
      public DataTable GetCashStatisticInfoAllTwoYear(ListCafeEntity model)
      {
          DataTable dt = new DataTable();
          string strSql = "select t4.ItemsName,t3.*from (select t1.*,t2.* from (select ItemsId,cYear,MONTH(getdate()) NowMonth,datename(yyyy,getdate()) NowYear," +
                          "SUM(JanPlan) JanPlan,SUM(FebPlan) FebPlan,SUM(MarPlan) MarPlan,SUM(AprPlan) AprPlan,SUM(MayPlan) MayPlan,SUM(JunPlan) JunPlan," +
                          "SUM(JulPlan) JulPlan,SUM(AugPlan) AugPlan,SUM(SepPlan) SepPlan,SUM(OctPlan) OctPlan,SUM(NovPlan) NovPlan,SUM(DecPlan) DecPlan " +
                          "from T_Cash where cYear=" + model.YearS + "  group by ItemsId,cYear) t1," +
                          "(select ItemsId kItemsId,cYear kcYear," +
                          "SUM(JanPlan) kJanPlan,SUM(FebPlan) kFebPlan,SUM(MarPlan) kMarPlan,SUM(AprPlan) kAprPlan,SUM(MayPlan) kMayPlan,SUM(JunPlan) kJunPlan," +
                          "SUM(JulPlan) kJulPlan,SUM(AugPlan) kAugPlan,SUM(SepPlan) kSepPlan,SUM(OctPlan) kOctPlan,SUM(NovPlan) kNovPlan,SUM(DecPlan) kDecPlan " +
                          "from T_Cash where cYear=" + model.YearE + "  group by ItemsId,cYear) t2 " +
                          "where t1.ItemsId=t2.kItemsId) t3,T_Items t4 where t3.ItemsId=t4.ItemsId and t4.ItemsType=28 and t4.IsVisible=1 order by t3.ItemsId";
          try
          {
              db.Open();
              dt = db.GetDataTableWithSQL(strSql);
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
      /// 保存现金推算表信息
      /// </summary>
      /// <param name="model"></param>
      /// <returns></returns>
      public int SaleCafeInfoOneYear(ListCafeEntity model)
      {
          SqlParameter[] parameters = {
                    new SqlParameter("vJanPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vFebPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vMarPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vAprPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vMayPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vJunPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vJulPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vAugPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vSepPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vOctPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vNovPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vDecPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vsId", SqlDbType.VarChar,800),
                    new SqlParameter("vOperators", SqlDbType.VarChar,50),
                    new SqlParameter("vYearS", SqlDbType.Int),
                    new SqlParameter("vYearE", SqlDbType.Int)

            };
          parameters[0].Value = model.JanPlan;
          parameters[1].Value = model.FebPlan;
          parameters[2].Value = model.MarPlan;
          parameters[3].Value = model.AprPlan;
          parameters[4].Value = model.MayPlan;
          parameters[5].Value = model.JunPlan;
          parameters[6].Value = model.JulPlan;
          parameters[7].Value = model.AugPlan;
          parameters[8].Value = model.SepPlan;
          parameters[9].Value = model.OctPlan;
          parameters[10].Value = model.NovPlan;
          parameters[11].Value = model.DecPlan;
          parameters[12].Value = model.sId;
          parameters[13].Value = model.Operators;
          parameters[14].Value = model.YearS;
          parameters[15].Value = model.YearE;


          string commandText = "SaleCafeInfoOneYear";
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
      /// 保存现金推算表信息
      /// </summary>
      /// <param name="model"></param>
      /// <returns></returns>
      public int SaleCafeInfoTwoYear(ListCafeEntity model)
      {
          SqlParameter[] parameters = {
                    new SqlParameter("vJanPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vFebPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vMarPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vAprPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vMayPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vJunPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vJulPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vAugPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vSepPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vOctPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vNovPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vDecPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkJanPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkFebPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkMarPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkAprPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkMayPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkJunPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkJulPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkAugPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkSepPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkOctPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkNovPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkDecPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vsId", SqlDbType.VarChar,800),
                    new SqlParameter("vkId", SqlDbType.VarChar,800),
                    new SqlParameter("vOperators", SqlDbType.VarChar,50),
                    new SqlParameter("vYearS", SqlDbType.Int),
                    new SqlParameter("vYearE", SqlDbType.Int)

            };
          parameters[0].Value = model.JanPlan;
          parameters[1].Value = model.FebPlan;
          parameters[2].Value = model.MarPlan;
          parameters[3].Value = model.AprPlan;
          parameters[4].Value = model.MayPlan;
          parameters[5].Value = model.JunPlan;
          parameters[6].Value = model.JulPlan;
          parameters[7].Value = model.AugPlan;
          parameters[8].Value = model.SepPlan;
          parameters[9].Value = model.OctPlan;
          parameters[10].Value = model.NovPlan;
          parameters[11].Value = model.DecPlan;
          parameters[12].Value = model.kJanPlan;
          parameters[13].Value = model.kFebPlan;
          parameters[14].Value = model.kMarPlan;
          parameters[15].Value = model.kAprPlan;
          parameters[16].Value = model.kMayPlan;
          parameters[17].Value = model.kJunPlan;
          parameters[18].Value = model.kJulPlan;
          parameters[19].Value = model.kAugPlan;
          parameters[20].Value = model.kSepPlan;
          parameters[21].Value = model.kOctPlan;
          parameters[22].Value = model.kNovPlan;
          parameters[23].Value = model.kDecPlan;
          parameters[24].Value = model.sId;
          parameters[25].Value = model.kId;
          parameters[26].Value = model.Operators;
          parameters[27].Value = model.YearS;
          parameters[28].Value = model.YearE;

          string commandText = "SaleCafeInfoTwoYear";
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
      /// 导入现金推算表信息
      /// </summary>
      /// <param name="model"></param>
      /// <returns></returns>
      public int ImportCash(ListCafeEntity model)
      {
          SqlParameter[] parameters = {
                    new SqlParameter("vJanPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vFebPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vMarPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vAprPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vMayPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vJunPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vJulPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vAugPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vSepPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vOctPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vNovPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vDecPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vkJanPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vkFebPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vkMarPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vkAprPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vkMayPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vkJunPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vkJulPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vkAugPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vkSepPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vkOctPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vkNovPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vkDecPlan", SqlDbType.VarChar,50),
                    new SqlParameter("vOperators", SqlDbType.VarChar,50),
                    new SqlParameter("vTitle", SqlDbType.VarChar,50)

            };
          parameters[0].Value = model.JanPlan == null ? "0" : model.JanPlan;
          parameters[1].Value = model.FebPlan == null ? "0" : model.FebPlan;
          parameters[2].Value = model.MarPlan == null ? "0" : model.MarPlan;
          parameters[3].Value = model.AprPlan == null ? "0" : model.AprPlan;
          parameters[4].Value = model.MayPlan == null ? "0" : model.MayPlan;
          parameters[5].Value = model.JunPlan == null ? "0" : model.JunPlan;
          parameters[6].Value = model.JulPlan == null ? "0" : model.JulPlan;
          parameters[7].Value = model.AugPlan == null ? "0" : model.AugPlan;
          parameters[8].Value = model.SepPlan == null ? "0" : model.SepPlan;
          parameters[9].Value = model.OctPlan == null ? "0" : model.OctPlan;
          parameters[10].Value = model.NovPlan == null ? "0" : model.NovPlan;
          parameters[11].Value = model.DecPlan == null ? "0" : model.DecPlan;
          parameters[12].Value = model.kJanPlan;
          parameters[13].Value = model.kFebPlan;
          parameters[14].Value = model.kMarPlan;
          parameters[15].Value = model.kAprPlan;
          parameters[16].Value = model.kMayPlan;
          parameters[17].Value = model.kJunPlan;
          parameters[18].Value = model.kJulPlan;
          parameters[19].Value = model.kAugPlan;
          parameters[20].Value = model.kSepPlan;
          parameters[21].Value = model.kOctPlan;
          parameters[22].Value = model.kNovPlan;
          parameters[23].Value = model.kDecPlan;
          parameters[24].Value = model.Operators;
          parameters[25].Value = model.Title;

          string commandText = "ImportCash";
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

      #endregion


      /// <summary>
      /// 初始化现金推算表
      /// </summary>
      /// <returns></returns>
      public DataTable InitCash(string mname, string year)
      {

          string sql = "select a.Id,a.DeptCode,b.ItemsName,b.ItemsType,a.cYear,a.JanPlan,a.FebPlan,a.MarPlan,a.AprPlan,a.MayPlan,a.JunPlan,a.JulPlan,a.AugPlan,a.SepPlan,a.OctPlan,a.NovPlan,a.DecPlan,a.Isedit,a.Isok  from T_Cash a,T_Items b where Operators='" + mname + "' and cYear='" + year + "' and a.ItemsId=b.ItemsId";
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
      public DataTable GetCashDataByYear(string year, string mname)
      {
          string sql = "select a.Id,a.DeptCode,b.ItemsName,b.ItemsType,a.cYear,a.JanPlan,a.FebPlan,a.MarPlan,a.AprPlan,a.MayPlan,a.JunPlan,a.JulPlan,a.AugPlan,a.SepPlan,a.OctPlan,a.NovPlan,a.DecPlan,a.Isedit,a.Isok from T_Cash a,T_Items b where Operators='" + mname + "' and cYear='" + year + "' and a.ItemsId=b.ItemsId";
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


      public DataTable GetCashDataByYear2(string year, string year2, string mname)
      {
          //string sql = "select t3.*,t4.* from(select T1.*,T2.* from(select DeptCode c1,ItemsId Id1,cYear year1,JanPlan jp1 ,FebPlan fp1,MarPlan mrp1,AprPlan ap1,MayPlan map1,JunPlan jnp1,JulPlan jup1,AugPlan aup1,SepPlan sep1,OctPlan op1,NovPlan np1,DecPlan dep1 from T_Cash where Operators='" + mname + "' and cYear='" + year + "') t1,(select DeptCode,ItemsId,cYear,JanPlan,FebPlan,MarPlan,AprPlan,MayPlan,JunPlan,JulPlan,AugPlan,SepPlan,OctPlan,NovPlan,DecPlan from T_Cash where Operators='" + mname + "' and cYear='" + year2 + "') t2 where t1.Id1=t2.ItemsId )t3,T_Items t4 where t3.Id1=t4.ItemsId ";
          string sql = "select t3.*,t4.* from(select T1.*,T2.* from(select DeptCode DeptCode1,ItemsId ItemsId1,cYear cYear1,JanPlan JanPlan1 ,FebPlan FebPlan1,MarPlan MarPlan1,AprPlan AprPlan1,MayPlan MayPlan1,JunPlan JunPlan1,JulPlan JulPlan1,AugPlan AugPlan1,SepPlan SepPlan1,OctPlan OctPlan1,NovPlan NovPlan1,DecPlan DecPlan1 from T_Cash where Operators='" + mname + "' and cYear='" + year + "') t1,(select DeptCode DeptCode2,ItemsId ItemsId2,cYear cYear2,JanPlan JanPlan2,FebPlan FebPlan2,MarPlan MarPlan2,AprPlan AprPlan2,MayPlan MayPlan2,JunPlan JunPlan2,JulPlan JulPlan2,AugPlan AugPlan2,SepPlan SepPlan2,OctPlan OctPlan2,NovPlan NovPlan2,DecPlan DecPlan2 from T_Cash where Operators='" + mname + "' and cYear='" + year2 + "') t2 where t1.ItemsId1=t2.ItemsId2 )t3,T_Items t4 where t3.ItemsId1=t4.ItemsId ";
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
      public int EditCash(ListCashEntity model)
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

          string commandText = "proc_EditCash";
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
      public int SaveCash(string year, string mname)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vyear", SqlDbType.VarChar,20),
                    new SqlParameter("vmname", SqlDbType.VarChar,100)
                
            };
          parameters[0].Value = year;
          parameters[1].Value = mname;


          string commandText = "proc_SaveCash";
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
      public int C_EditCash(string year, string mname)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vyear", SqlDbType.VarChar,20),
                    new SqlParameter("vmname", SqlDbType.VarChar,100)
                
            };
          parameters[0].Value = year;
          parameters[1].Value = mname;


          string commandText = "proc_C_EditCash";
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
      public int OkCash(string year, string mname)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vyear", SqlDbType.VarChar,20),
                    new SqlParameter("vmname", SqlDbType.VarChar,100)
                
            };
          parameters[0].Value = year;
          parameters[1].Value = mname;


          string commandText = "proc_OkCash";
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
