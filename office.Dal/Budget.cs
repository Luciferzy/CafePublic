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
  public  class Budget
    {
      SqlDataBase db = new SqlDataBase();
      DataTable dt = new DataTable();

      #region 新
      /// <summary>
      /// 获取预算表信息
      /// </summary>
      /// <returns></returns>
      public DataTable GetBudgetInfoOneYear(ListBudgetEntity model)
      {
          string strHtml = " from T_Budget t1,T_Items t2 where t1.ItemsId=t2.ItemsId and t1.Operators='" + model.UserCode.Trim() + "' and t2.ItemsType=18 and t2.IsVisible=1 ";
          if (model.YearS == 0)
          {
              strHtml += " and cYear=datename(yyyy,getdate()) ";
          }
          else
          {
              strHtml += " and cYear=" + model.YearS;
          }
          DataTable dt = new DataTable();
          string strSql = "select (isJanPlan+isJanReal+isFebPlan+isFebReal+isMarPlan+isMarReal+isAprPlan+isAprReal+isMayPlan+isMayReal+isJunPlan+isJunReal+isJulPlan+isJulReal+isAugPlan+isAugReal+isSepPlan+isSepReal+isOctPlan+isOctReal+isNovPlan+isNovReal+isDecPlan+isDecReal) isCount,"+
                          "(JanPlan+JanReal+FebPlan+FebReal+MarPlan+MarReal+AprPlan+AprReal+MayPlan+MayReal+JunPlan+JunReal+JulPlan+JulReal+AugPlan+AugReal+SepPlan+SepReal+OctPlan+OctReal+NovPlan+NovReal+DecPlan+DecReal) allCount," +
                          "t1.Id,t1.ItemsId,ItemsName,cYear,MONTH(getdate()) NowMonth,datename(yyyy,getdate()) NowYear,dbo.GetRollYearCount(" + model.YearS + ",'" + model.UserCode.Trim() + "',t1.ItemsId) RollYear,dbo.GetRollYearCount(" + model.YearS + ",'" + model.UserCode.Trim() + "',t1.ItemsId)/12 MonthAve," +
                          "JanPlan,JanReal,FebPlan,FebReal,MarPlan,MarReal,AprPlan,AprReal,MayPlan,MayReal,JunPlan,JunReal,JulPlan,JulReal,AugPlan,AugReal,SepPlan,SepReal,OctPlan,OctReal,NovPlan,NovReal,DecPlan,DecReal," +
                          "isJanPlan,isJanReal,isFebPlan,isFebReal,isMarPlan,isMarReal,isAprPlan,isAprReal,isMayPlan,isMayReal,isJunPlan,isJunReal,isJulPlan,isJulReal,isAugPlan,isAugReal,isSepPlan,isSepReal,isOctPlan,isOctReal,isNovPlan,isNovReal,isDecPlan,isDecReal " + strHtml.Trim();
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
      /// 获取预算表信息
      /// </summary>
      /// <returns></returns>
      public DataTable GetBudgetInfoTwoYear(ListBudgetEntity model)
      {
          DataTable dt = new DataTable();
          string strSql = "select t4.ItemsName,t3.*from (select t1.*,t2.* from (select (isJanPlan+isJanReal+isFebPlan+isFebReal+isMarPlan+isMarReal+isAprPlan+isAprReal+isMayPlan+isMayReal+isJunPlan+isJunReal+"+
                          "isJulPlan+isJulReal+isAugPlan+isAugReal+isSepPlan+isSepReal+isOctPlan+isOctReal+isNovPlan+isNovReal+isDecPlan+isDecReal) isCount,"+
                          "(JanPlan+JanReal+FebPlan+FebReal+MarPlan+MarReal+AprPlan+AprReal+MayPlan+MayReal+JunPlan+JunReal+JulPlan+JulReal+AugPlan+AugReal+"+
                          "SepPlan+SepReal+OctPlan+OctReal+NovPlan+NovReal+DecPlan+DecReal) allCount,"+
                          "Id,ItemsId,cYear,MONTH(getdate()) NowMonth,datename(yyyy,getdate()) NowYear,dbo.GetRollYearCount(" + model.YearS + ",'" + model.UserCode.Trim() + "',ItemsId) RollYear,dbo.GetRollYearCount(" + model.YearS + ",'" + model.UserCode.Trim() + "',ItemsId)/12 MonthAve," +
                          "JanPlan,JanReal,FebPlan,FebReal,MarPlan,MarReal,AprPlan,AprReal,MayPlan,MayReal,JunPlan,JunReal,JulPlan,JulReal,AugPlan,AugReal,SepPlan,SepReal,OctPlan,OctReal,NovPlan,NovReal,DecPlan,DecReal,"+
                          "isJanPlan,isJanReal,isFebPlan,isFebReal,isMarPlan,isMarReal,isAprPlan,isAprReal,isMayPlan,isMayReal,isJunPlan,isJunReal,isJulPlan,isJulReal,isAugPlan,isAugReal,isSepPlan,isSepReal,isOctPlan,isOctReal,isNovPlan,isNovReal,isDecPlan,isDecReal "+
                          "from T_Budget where Operators='" + model.UserCode.Trim() + "' and cYear=" + model.YearS + ") t1," +
                          "(select (isJanPlan+isJanReal+isFebPlan+isFebReal+isMarPlan+isMarReal+isAprPlan+isAprReal+isMayPlan+isMayReal+isJunPlan+isJunReal+"+
                          "isJulPlan+isJulReal+isAugPlan+isAugReal+isSepPlan+isSepReal+isOctPlan+isOctReal+isNovPlan+isNovReal+isDecPlan+isDecReal) kisCount,Id kId,ItemsId kItemsId,cYear kcYear," +
                          "JanPlan kJanPlan,JanReal kJanReal,FebPlan kFebPlan,FebReal kFebReal,MarPlan kMarPlan,MarReal kMarReal,AprPlan kAprPlan,AprReal kAprReal,"+
                          "MayPlan kMayPlan,MayReal kMayReal,JunPlan kJunPlan,JunReal kJunReal,JulPlan kJulPlan,JulReal kJulReal,AugPlan kAugPlan,AugReal kAugReal,"+
                          "SepPlan kSepPlan,SepReal kSepReal,OctPlan kOctPlan,OctReal kOctReal,NovPlan kNovPlan,NovReal kNovReal,DecPlan kDecPlan,DecReal kDecReal,"+
                          "isJanPlan kisJanPlan,isJanReal kisJanReal,isFebPlan kisFebPlan,isFebReal kisFebReal,isMarPlan kisMarPlan,isMarReal kisMarReal,"+
                          "isAprPlan kisAprPlan,isAprReal kisAprReal,isMayPlan kisMayPlan,isMayReal kisMayReal,isJunPlan kisJunPlan,isJunReal kisJunReal,"+
                          "isJulPlan kisJulPlan,isJulReal kisJulReal,isAugPlan kisAugPlan,isAugReal kisAugReal,isSepPlan kisSepPlan,isSepReal kisSepReal,"+
                          "isOctPlan kisOctPlan,isOctReal kisOctReal,isNovPlan kisNovPlan,isNovReal kisNovReal,isDecPlan kisDecPlan,isDecReal kisDecReal "+
                          "from T_Budget where Operators='" + model.UserCode.Trim() + "' and cYear=" + model.YearE + ") t2 where t1.ItemsId=t2.kItemsId) t3,T_Items t4 where t3.ItemsId=t4.ItemsId and t4.ItemsType=18 and t4.IsVisible=1";
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
      /// 配置预算表信息
      /// </summary>
      /// <returns></returns>
      public DataTable GetBudgetSetShowOneYear(ListBudgetEntity model)
      {
          string strHtml = " from T_Budget where Operators='" + model.UserCode.Trim() + "'";
          if (model.YearS == 0)
          {
              strHtml += " and cYear=datename(yyyy,getdate()) ";
          }
          else
          {
              strHtml += " and cYear=" + model.YearS;
          }
          DataTable dt = new DataTable();
          string strSql = "select top 1 cYear,isJanPlan,isJanReal,isFebPlan,isFebReal,isMarPlan,isMarReal,isAprPlan,isAprReal,isMayPlan,isMayReal,isJunPlan,isJunReal,isJulPlan,isJulReal," +
                          "isAugPlan,isAugReal,isSepPlan,isSepReal,isOctPlan,isOctReal,isNovPlan,isNovReal,isDecPlan,isDecReal " + strHtml.Trim();
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
      /// 配置预算表信息
      /// </summary>
      /// <returns></returns>
      public DataTable GetBudgetSetShowTwoYear(ListBudgetEntity model)
      {
          DataTable dt = new DataTable();
          string strSql = "select t1.*,t2.* from (select top 1 Operators,cYear,isJanPlan,isJanReal,isFebPlan,isFebReal,isMarPlan,isMarReal,isAprPlan,isAprReal,isMayPlan,isMayReal,isJunPlan,isJunReal,isJulPlan,isJulReal," +
                          "isAugPlan,isAugReal,isSepPlan,isSepReal,isOctPlan,isOctReal,isNovPlan,isNovReal,isDecPlan,isDecReal from T_Budget where Operators='" + model.UserCode.Trim() + "' and cYear=" + model.YearS + ") t1," +
                          "(select top 1 Operators kOperators,cYear kcYear,isJanPlan kisJanPlan,isJanReal kisJanReal,isFebPlan kisFebPlan,isFebReal kisFebReal,isMarPlan kisMarPlan,isMarReal kisMarReal," +
                          "isAprPlan kisAprPlan,isAprReal kisAprReal,isMayPlan kisMayPlan,isMayReal kisMayReal,isJunPlan kisJunPlan,isJunReal kisJunReal,"+
                          "isJulPlan kisJulPlan,isJulReal kisJulReal,isAugPlan kisAugPlan,isAugReal kisAugReal,isSepPlan kisSepPlan,isSepReal kisSepReal,"+
                          "isOctPlan kisOctPlan,isOctReal kisOctReal,isNovPlan kisNovPlan,isNovReal kisNovReal,isDecPlan kisDecPlan,isDecReal kisDecReal from T_Budget where Operators='" + model.UserCode.Trim() + "' and cYear=" + model.YearE + ") t2 where t1.Operators=t2.kOperators";
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
      /// 保存配置信息
      /// </summary>
      /// <param name="model"></param>
      /// <returns></returns>
      public int SaleBudgetShowOneYear(ListBudgetEntity model)
      {
          SqlParameter[] parameters = {
                    new SqlParameter("visJanPlan", SqlDbType.Int),
                    new SqlParameter("visJanReal", SqlDbType.Int),
                    new SqlParameter("visFebPlan", SqlDbType.Int),
                    new SqlParameter("visFebReal", SqlDbType.Int),
                    new SqlParameter("visMarPlan", SqlDbType.Int),
                    new SqlParameter("visMarReal", SqlDbType.Int),
                    new SqlParameter("visAprPlan", SqlDbType.Int),
                    new SqlParameter("visAprReal", SqlDbType.Int),
                    new SqlParameter("visMayPlan", SqlDbType.Int),
                    new SqlParameter("visMayReal", SqlDbType.Int),
                    new SqlParameter("visJunPlan", SqlDbType.Int),
                    new SqlParameter("visJunReal", SqlDbType.Int),
                    new SqlParameter("visJulPlan", SqlDbType.Int),
                    new SqlParameter("visJulReal", SqlDbType.Int),
                    new SqlParameter("visAugPlan", SqlDbType.Int),
                    new SqlParameter("visAugReal", SqlDbType.Int),
                    new SqlParameter("visSepPlan", SqlDbType.Int),
                    new SqlParameter("visSepReal", SqlDbType.Int),
                    new SqlParameter("visOctPlan", SqlDbType.Int),
                    new SqlParameter("visOctReal", SqlDbType.Int),
                    new SqlParameter("visNovPlan", SqlDbType.Int),
                    new SqlParameter("visNovReal", SqlDbType.Int),
                    new SqlParameter("visDecPlan", SqlDbType.Int),
                    new SqlParameter("visDecReal", SqlDbType.Int),
                    new SqlParameter("vOperators", SqlDbType.VarChar,100),
                    new SqlParameter("vYearS", SqlDbType.Int),
                    new SqlParameter("vYearE", SqlDbType.Int)
            };
          parameters[0].Value = model.isJanPlan;
          parameters[1].Value = model.isJanReal;
          parameters[2].Value = model.isFebPlan;
          parameters[3].Value = model.isFebReal;
          parameters[4].Value = model.isMarPlan;
          parameters[5].Value = model.isMarReal;
          parameters[6].Value = model.isAprPlan;
          parameters[7].Value = model.isAprReal;
          parameters[8].Value = model.isMayPlan;
          parameters[9].Value = model.isMayReal;
          parameters[10].Value = model.isJunPlan;
          parameters[11].Value = model.isJunReal;
          parameters[12].Value = model.isJulPlan;
          parameters[13].Value = model.isJulReal;
          parameters[14].Value = model.isAugPlan;
          parameters[15].Value = model.isAugReal;
          parameters[16].Value = model.isSepPlan;
          parameters[17].Value = model.isSepReal;
          parameters[18].Value = model.isOctPlan;
          parameters[19].Value = model.isOctReal;
          parameters[20].Value = model.isNovPlan;
          parameters[21].Value = model.isNovReal;
          parameters[22].Value = model.isDecPlan;
          parameters[23].Value = model.isDecReal;
          parameters[24].Value = model.Operators;
          parameters[25].Value = model.YearS;
          parameters[26].Value = model.YearE;


          string commandText = "SaleBudgetShowOneYear";
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
      /// 保存配置信息
      /// </summary>
      /// <param name="model"></param>
      /// <returns></returns>
      public int SaleBudgetShowTwoYear(ListBudgetEntity model)
      {
          SqlParameter[] parameters = {
                    new SqlParameter("visJanPlan", SqlDbType.Int),
                    new SqlParameter("visJanReal", SqlDbType.Int),
                    new SqlParameter("visFebPlan", SqlDbType.Int),
                    new SqlParameter("visFebReal", SqlDbType.Int),
                    new SqlParameter("visMarPlan", SqlDbType.Int),
                    new SqlParameter("visMarReal", SqlDbType.Int),
                    new SqlParameter("visAprPlan", SqlDbType.Int),
                    new SqlParameter("visAprReal", SqlDbType.Int),
                    new SqlParameter("visMayPlan", SqlDbType.Int),
                    new SqlParameter("visMayReal", SqlDbType.Int),
                    new SqlParameter("visJunPlan", SqlDbType.Int),
                    new SqlParameter("visJunReal", SqlDbType.Int),
                    new SqlParameter("visJulPlan", SqlDbType.Int),
                    new SqlParameter("visJulReal", SqlDbType.Int),
                    new SqlParameter("visAugPlan", SqlDbType.Int),
                    new SqlParameter("visAugReal", SqlDbType.Int),
                    new SqlParameter("visSepPlan", SqlDbType.Int),
                    new SqlParameter("visSepReal", SqlDbType.Int),
                    new SqlParameter("visOctPlan", SqlDbType.Int),
                    new SqlParameter("visOctReal", SqlDbType.Int),
                    new SqlParameter("visNovPlan", SqlDbType.Int),
                    new SqlParameter("visNovReal", SqlDbType.Int),
                    new SqlParameter("visDecPlan", SqlDbType.Int),
                    new SqlParameter("visDecReal", SqlDbType.Int),
                    new SqlParameter("vkisJanPlan", SqlDbType.Int),
                    new SqlParameter("vkisJanReal", SqlDbType.Int),
                    new SqlParameter("vkisFebPlan", SqlDbType.Int),
                    new SqlParameter("vkisFebReal", SqlDbType.Int),
                    new SqlParameter("vkisMarPlan", SqlDbType.Int),
                    new SqlParameter("vkisMarReal", SqlDbType.Int),
                    new SqlParameter("vkisAprPlan", SqlDbType.Int),
                    new SqlParameter("vkisAprReal", SqlDbType.Int),
                    new SqlParameter("vkisMayPlan", SqlDbType.Int),
                    new SqlParameter("vkisMayReal", SqlDbType.Int),
                    new SqlParameter("vkisJunPlan", SqlDbType.Int),
                    new SqlParameter("vkisJunReal", SqlDbType.Int),
                    new SqlParameter("vkisJulPlan", SqlDbType.Int),
                    new SqlParameter("vkisJulReal", SqlDbType.Int),
                    new SqlParameter("vkisAugPlan", SqlDbType.Int),
                    new SqlParameter("vkisAugReal", SqlDbType.Int),
                    new SqlParameter("vkisSepPlan", SqlDbType.Int),
                    new SqlParameter("vkisSepReal", SqlDbType.Int),
                    new SqlParameter("vkisOctPlan", SqlDbType.Int),
                    new SqlParameter("vkisOctReal", SqlDbType.Int),
                    new SqlParameter("vkisNovPlan", SqlDbType.Int),
                    new SqlParameter("vkisNovReal", SqlDbType.Int),
                    new SqlParameter("vkisDecPlan", SqlDbType.Int),
                    new SqlParameter("vkisDecReal", SqlDbType.Int),
                    new SqlParameter("vOperators", SqlDbType.VarChar,100),
                    new SqlParameter("vYearS", SqlDbType.Int),
                    new SqlParameter("vYearE", SqlDbType.Int)

            };
          parameters[0].Value = model.isJanPlan;
          parameters[1].Value = model.isJanReal;
          parameters[2].Value = model.isFebPlan;
          parameters[3].Value = model.isFebReal;
          parameters[4].Value = model.isMarPlan;
          parameters[5].Value = model.isMarReal;
          parameters[6].Value = model.isAprPlan;
          parameters[7].Value = model.isAprReal;
          parameters[8].Value = model.isMayPlan;
          parameters[9].Value = model.isMayReal;
          parameters[10].Value = model.isJunPlan;
          parameters[11].Value = model.isJunReal;
          parameters[12].Value = model.isJulPlan;
          parameters[13].Value = model.isJulReal;
          parameters[14].Value = model.isAugPlan;
          parameters[15].Value = model.isAugReal;
          parameters[16].Value = model.isSepPlan;
          parameters[17].Value = model.isSepReal;
          parameters[18].Value = model.isOctPlan;
          parameters[19].Value = model.isOctReal;
          parameters[20].Value = model.isNovPlan;
          parameters[21].Value = model.isNovReal;
          parameters[22].Value = model.isDecPlan;
          parameters[23].Value = model.isDecReal;
          parameters[24].Value = model.kisJanPlan;
          parameters[25].Value = model.kisJanReal;
          parameters[26].Value = model.kisFebPlan;
          parameters[27].Value = model.kisFebReal;
          parameters[28].Value = model.kisMarPlan;
          parameters[29].Value = model.kisMarReal;
          parameters[30].Value = model.kisAprPlan;
          parameters[31].Value = model.kisAprReal;
          parameters[32].Value = model.kisMayPlan;
          parameters[33].Value = model.kisMayReal;
          parameters[34].Value = model.kisJunPlan;
          parameters[35].Value = model.kisJunReal;
          parameters[36].Value = model.kisJulPlan;
          parameters[37].Value = model.kisJulReal;
          parameters[38].Value = model.kisAugPlan;
          parameters[39].Value = model.kisAugReal;
          parameters[40].Value = model.kisSepPlan;
          parameters[41].Value = model.kisSepReal;
          parameters[42].Value = model.kisOctPlan;
          parameters[43].Value = model.kisOctReal;
          parameters[44].Value = model.kisNovPlan;
          parameters[45].Value = model.kisNovReal;
          parameters[46].Value = model.kisDecPlan;
          parameters[47].Value = model.kisDecReal;
          parameters[48].Value = model.Operators;
          parameters[49].Value = model.YearS;
          parameters[50].Value = model.YearE;


          string commandText = "SaleBudgetShowTwoYear";
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
      /// 保存收支预算表信息
      /// </summary>
      /// <param name="model"></param>
      /// <returns></returns>
      public int SaleBudgetInfoOneYear(ListBudgetEntity model)
      {
          SqlParameter[] parameters = {
                    new SqlParameter("vJanPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vJanReal", SqlDbType.VarChar,800),
                    new SqlParameter("vFebPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vFebReal", SqlDbType.VarChar,800),
                    new SqlParameter("vMarPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vMarReal", SqlDbType.VarChar,800),
                    new SqlParameter("vAprPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vAprReal", SqlDbType.VarChar,800),
                    new SqlParameter("vMayPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vMayReal", SqlDbType.VarChar,800),
                    new SqlParameter("vJunPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vJunReal", SqlDbType.VarChar,800),
                    new SqlParameter("vJulPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vJulReal", SqlDbType.VarChar,800),
                    new SqlParameter("vAugPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vAugReal", SqlDbType.VarChar,800),
                    new SqlParameter("vSepPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vSepReal", SqlDbType.VarChar,800),
                    new SqlParameter("vOctPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vOctReal", SqlDbType.VarChar,800),
                    new SqlParameter("vNovPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vNovReal", SqlDbType.VarChar,800),
                    new SqlParameter("vDecPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vDecReal", SqlDbType.VarChar,800),
                    new SqlParameter("vsId", SqlDbType.VarChar,800),
                    new SqlParameter("vOperators", SqlDbType.VarChar,50),
                    new SqlParameter("vYearS", SqlDbType.Int),
                    new SqlParameter("vYearE", SqlDbType.Int)

            };
          parameters[0].Value = model.JanPlan;
          parameters[1].Value = model.JanReal;
          parameters[2].Value = model.FebPlan;
          parameters[3].Value = model.FebReal;
          parameters[4].Value = model.MarPlan;
          parameters[5].Value = model.MarReal;
          parameters[6].Value = model.AprPlan;
          parameters[7].Value = model.AprReal;
          parameters[8].Value = model.MayPlan;
          parameters[9].Value = model.MayReal;
          parameters[10].Value = model.JunPlan;
          parameters[11].Value = model.JunReal;
          parameters[12].Value = model.JulPlan;
          parameters[13].Value = model.JulReal;
          parameters[14].Value = model.AugPlan;
          parameters[15].Value = model.AugReal;
          parameters[16].Value = model.SepPlan;
          parameters[17].Value = model.SepReal;
          parameters[18].Value = model.OctPlan;
          parameters[19].Value = model.OctReal;
          parameters[20].Value = model.NovPlan;
          parameters[21].Value = model.NovReal;
          parameters[22].Value = model.DecPlan;
          parameters[23].Value = model.DecReal;
          parameters[24].Value = model.sId;
          parameters[25].Value = model.Operators;
          parameters[26].Value = model.YearS;
          parameters[27].Value = model.YearE;


          string commandText = "SaleBudgetInfoOneYear";
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
      /// 保存收支预算表信息
      /// </summary>
      /// <param name="model"></param>
      /// <returns></returns>
      public int SaleBudgetInfoTwoYear(ListBudgetEntity model)
      {
          SqlParameter[] parameters = {
                    new SqlParameter("vJanPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vJanReal", SqlDbType.VarChar,800),
                    new SqlParameter("vFebPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vFebReal", SqlDbType.VarChar,800),
                    new SqlParameter("vMarPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vMarReal", SqlDbType.VarChar,800),
                    new SqlParameter("vAprPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vAprReal", SqlDbType.VarChar,800),
                    new SqlParameter("vMayPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vMayReal", SqlDbType.VarChar,800),
                    new SqlParameter("vJunPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vJunReal", SqlDbType.VarChar,800),
                    new SqlParameter("vJulPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vJulReal", SqlDbType.VarChar,800),
                    new SqlParameter("vAugPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vAugReal", SqlDbType.VarChar,800),
                    new SqlParameter("vSepPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vSepReal", SqlDbType.VarChar,800),
                    new SqlParameter("vOctPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vOctReal", SqlDbType.VarChar,800),
                    new SqlParameter("vNovPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vNovReal", SqlDbType.VarChar,800),
                    new SqlParameter("vDecPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vDecReal", SqlDbType.VarChar,800),
                    new SqlParameter("vkJanPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkJanReal", SqlDbType.VarChar,800),
                    new SqlParameter("vkFebPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkFebReal", SqlDbType.VarChar,800),
                    new SqlParameter("vkMarPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkMarReal", SqlDbType.VarChar,800),
                    new SqlParameter("vkAprPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkAprReal", SqlDbType.VarChar,800),
                    new SqlParameter("vkMayPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkMayReal", SqlDbType.VarChar,800),
                    new SqlParameter("vkJunPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkJunReal", SqlDbType.VarChar,800),
                    new SqlParameter("vkJulPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkJulReal", SqlDbType.VarChar,800),
                    new SqlParameter("vkAugPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkAugReal", SqlDbType.VarChar,800),
                    new SqlParameter("vkSepPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkSepReal", SqlDbType.VarChar,800),
                    new SqlParameter("vkOctPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkOctReal", SqlDbType.VarChar,800),
                    new SqlParameter("vkNovPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkNovReal", SqlDbType.VarChar,800),
                    new SqlParameter("vkDecPlan", SqlDbType.VarChar,800),
                    new SqlParameter("vkDecReal", SqlDbType.VarChar,800),
                    new SqlParameter("vsId", SqlDbType.VarChar,800),
                    new SqlParameter("vkId", SqlDbType.VarChar,800),
                    new SqlParameter("vOperators", SqlDbType.VarChar,50),
                    new SqlParameter("vYearS", SqlDbType.Int),
                    new SqlParameter("vYearE", SqlDbType.Int)

            };
          parameters[0].Value = model.JanPlan;
          parameters[1].Value = model.JanReal;
          parameters[2].Value = model.FebPlan;
          parameters[3].Value = model.FebReal;
          parameters[4].Value = model.MarPlan;
          parameters[5].Value = model.MarReal;
          parameters[6].Value = model.AprPlan;
          parameters[7].Value = model.AprReal;
          parameters[8].Value = model.MayPlan;
          parameters[9].Value = model.MayReal;
          parameters[10].Value = model.JunPlan;
          parameters[11].Value = model.JunReal;
          parameters[12].Value = model.JulPlan;
          parameters[13].Value = model.JulReal;
          parameters[14].Value = model.AugPlan;
          parameters[15].Value = model.AugReal;
          parameters[16].Value = model.SepPlan;
          parameters[17].Value = model.SepReal;
          parameters[18].Value = model.OctPlan;
          parameters[19].Value = model.OctReal;
          parameters[20].Value = model.NovPlan;
          parameters[21].Value = model.NovReal;
          parameters[22].Value = model.DecPlan;
          parameters[23].Value = model.DecReal;
          parameters[24].Value = model.kJanPlan;
          parameters[25].Value = model.kJanReal;
          parameters[26].Value = model.kFebPlan;
          parameters[27].Value = model.kFebReal;
          parameters[28].Value = model.kMarPlan;
          parameters[29].Value = model.kMarReal;
          parameters[30].Value = model.kAprPlan;
          parameters[31].Value = model.kAprReal;
          parameters[32].Value = model.kMayPlan;
          parameters[33].Value = model.kMayReal;
          parameters[34].Value = model.kJunPlan;
          parameters[35].Value = model.kJunReal;
          parameters[36].Value = model.kJulPlan;
          parameters[37].Value = model.kJulReal;
          parameters[38].Value = model.kAugPlan;
          parameters[39].Value = model.kAugReal;
          parameters[40].Value = model.kSepPlan;
          parameters[41].Value = model.kSepReal;
          parameters[42].Value = model.kOctPlan;
          parameters[43].Value = model.kOctReal;
          parameters[44].Value = model.kNovPlan;
          parameters[45].Value = model.kNovReal;
          parameters[46].Value = model.kDecPlan;
          parameters[47].Value = model.kDecReal;
          parameters[48].Value = model.sId;
          parameters[49].Value = model.kId;
          parameters[50].Value = model.Operators;
          parameters[51].Value = model.YearS;
          parameters[52].Value = model.YearE;

          string commandText = "SaleBudgetInfoTwoYear";
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
      /// 从数据库获取用户名和密码
      /// </summary>
      /// <param name="entity"></param>
      /// <returns></returns>
      public DataTable GetInfo(string MbrName) {

          string sql = "select * from Department where MemberName='" + MbrName + "'";
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

          string sql = "select a.ItemsId,a.DeptCode,b.ItemsName,a.cYear,a.JanPlan,a.JanReal,a.FebPlan,a.FebReal,a.MarPlan,a.MarReal,a.AprPlan,a.AprReal,a.MayPlan,a.MayReal,a.JunPlan,a.JunReal,a.JulPlan,a.JulReal,a.AugPlan,a.AugReal,a.SepPlan,a.SepReal,a.OctPlan,a.OctReal,a.NovPlan,a.NovReal,a.DecPlan,a.DecReal,a.JanPlan+a.FebPlan+a.MarPlan+a.AprPlan+a.MarPlan+a.JunPlan+a.JulPlan+a.AugPlan+a.SepPlan+a.OctPlan+a.NovPlan+a.DecPlan as allCount,b.ItemsType,a.RollYear,a.MonthAve,a.Colloect,a.IsEdit,a.IsOk from T_Budget a,T_Items b where Operators='" + mname + "' and cYear='" + year + "' and a.ItemsId=b.ItemsId";
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
      public DataTable GetDataByYear(string year,string mname)
      {
          string sql = "select a.ItemsId,a.DeptCode,b.ItemsName,a.cYear,a.JanPlan,a.JanReal,a.FebPlan,a.FebReal,a.MarPlan,a.MarReal,a.AprPlan,a.AprReal,a.MayPlan,a.MayReal,a.JunPlan,a.JunReal,a.JulPlan,a.JulReal,a.AugPlan,a.AugReal,a.SepPlan,a.SepReal,a.OctPlan,a.OctReal,a.NovPlan,a.NovReal,a.DecPlan,a.DecReal,a.JanPlan+a.FebPlan+a.MarPlan+a.AprPlan+a.MarPlan+a.JunPlan+a.JulPlan+a.AugPlan+a.SepPlan+a.OctPlan+a.NovPlan+a.DecPlan as allCount,b.ItemsType,a.RollYear,a.MonthAve,a.Colloect,a.IsEdit,a.IsOk from T_Budget a,T_Items b where Operators='" + mname + "' and cYear='" + year + "' and a.ItemsId=b.ItemsId";
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
          string sql = "select t3.*,t4.* from(select T1.*,T2.* from(select DeptCode c1,ItemsId Id1,cYear year1,JanPlan jp1 ,JanReal jr1,FebPlan fp1,FebReal fr1,MarPlan mrp1,MarReal mrr1,AprPlan ap1,AprReal ar1,MayPlan map1,MayReal mar1,JunPlan jnp1,JunReal jnr1,JulPlan jup1,JulReal jur1,AugPlan aup1,AugReal aur1,SepPlan sep1,SepReal ser1,OctPlan op1,OctReal or1,NovPlan np1,NovReal nr1,DecPlan dep1,DecReal der1,JanPlan+FebPlan+MarPlan+AprPlan+MarPlan+JunPlan+JulPlan+AugPlan+SepPlan+OctPlan+NovPlan+DecPlan as allCount1,RollYear rollyear1,MonthAve monthave1,Colloect collect1,IsEdit isedit1 from T_Budget where Operators='" + mname + "' and cYear='" + year + "') t1,(select DeptCode,ItemsId,cYear,JanPlan,JanReal,FebPlan,FebReal,MarPlan,MarReal,AprPlan,AprReal,MayPlan,MayReal,JunPlan,JunReal,JulPlan,JulReal,AugPlan,AugReal,SepPlan,SepReal,OctPlan,OctReal,NovPlan,NovReal,DecPlan,DecReal,JanPlan+FebPlan+MarPlan+AprPlan+MarPlan+JunPlan+JulPlan+AugPlan+SepPlan+OctPlan+NovPlan+DecPlan as allCount,RollYear,MonthAve,Colloect,IsEdit from T_Budget where Operators='" + mname + "' and cYear='" + year2 + "') t2 where t1.Id1=t2.ItemsId )t3,T_Items t4 where t3.Id1=t4.ItemsId ";
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

      public DataTable ChangeBudget(string itemid, string value, string year, string mname,string head)
      {
          string sql = "update T_Budget set " + head + "='" + value + "' where ItemsId='" + itemid + "' and cYear='" + year + "' and Operators='" + mname + "'";
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
      /// 更新预算表的合计字段
      /// </summary>
      /// <param name="model"></param>
      /// <returns></returns>
      public int ChangeCollect(string year,string mname)
      {
          SqlParameter[] parameters = {
                    new SqlParameter("vyear",SqlDbType.VarChar,300),
                    new SqlParameter("vmname",SqlDbType.VarChar,300)
            };
          parameters[0].Value = year;
          parameters[1].Value = mname;

          string commandText = "proc_EditBudgetCollect";
          int result = 2;
          try
          {
              db.Open();
              db.ExecuteNonQuery(commandText, CommandType.StoredProcedure, parameters);
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
        /// 获取总支出合计值
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        /// 
      public DataTable ToltalCaculate(string year) {

          string sql = "select SUM(JanPlan) JanPlan,SUM(JanReal) JanReal,SUM(FebPlan) FebPlan,SUM(FebReal) FebReal,SUM(MarPlan) MarPlan,SUM(MarReal) MarReal,SUM (AprPlan) AprPlan,SUM(AprReal) AprReal,SUM(MayPlan) MayPlan,SUM(MayReal) MayReal,SUM(JunPlan) JunPlan,SUM(JunReal) JunReal,SUM(JulPlan) JulPlan,SUM(JulReal) JulReal,SUM(AugPlan) AugPlan,SUM(AugReal) AugReal,SUM(SepPlan) SepPlan,SUM(SepReal) SepReal,SUM(OctPlan) OctPlan,SUM(OctReal) OctReal,SUM(NovPlan) NovPlan,SUM(NovReal) NovReal,SUM(DecPlan) DecPlan,SUM(DecReal) DecReal,SUM(MonthAve) MonthAve,SUM(RollYear) RollYear  from " +

" (select ItemsId,SUM(JanPlan) JanPlan,SUM(JanReal) JanReal,SUM(FebPlan) FebPlan,SUM(FebReal) FebReal,SUM(MarPlan) MarPlan,SUM(MarReal) MarReal,SUM (AprPlan) AprPlan,SUM(AprReal) AprReal,SUM(MayPlan) MayPlan,SUM(MayReal) MayReal,SUM(JunPlan) JunPlan,SUM(JunReal) JunReal,SUM(JulPlan) JulPlan,SUM(JulReal) JulReal,SUM(AugPlan) AugPlan,SUM(AugReal) AugReal,SUM(SepPlan) SepPlan,SUM(SepReal) SepReal,SUM(OctPlan) OctPlan,SUM(OctReal) OctReal,SUM(NovPlan) NovPlan,SUM(NovReal) NovReal,SUM(DecPlan) DecPlan,SUM(DecReal) DecReal,SUM(MonthAve) MonthAve,SUM(RollYear) RollYear from T_Budget where ItemsId=6 and cYear='" + year + "' group by ItemsId" +
" union all" +
  " select ItemsId,SUM(JanPlan) JanPlan,SUM(JanReal) JanReal,SUM(FebPlan) FebPlan,SUM(FebReal) FebReal,SUM(MarPlan) MarPlan,SUM(MarReal) MarReal,SUM (AprPlan) AprPlan,SUM(AprReal) AprReal,SUM(MayPlan) MayPlan,SUM(MayReal) MayReal,SUM(JunPlan) JunPlan,SUM(JunReal) JunReal,SUM(JulPlan) JulPlan,SUM(JulReal) JulReal,SUM(AugPlan) AugPlan,SUM(AugReal) AugReal,SUM(SepPlan) SepPlan,SUM(SepReal) SepReal,SUM(OctPlan) OctPlan,SUM(OctReal) OctReal,SUM(NovPlan) NovPlan,SUM(NovReal) NovReal,SUM(DecPlan) DecPlan,SUM(DecReal) DecReal,SUM(MonthAve) MonthAve,SUM(RollYear) RollYear from T_Budget where ItemsId=10 and cYear='" + year + "' group by ItemsId" +
  " union all" +
   " select ItemsId, SUM(JanPlan) JanPlan,SUM(JanReal) JanReal,SUM(FebPlan) FebPlan,SUM(FebReal) FebReal,SUM(MarPlan) MarPlan,SUM(MarReal) MarReal,SUM (AprPlan) AprPlan,SUM(AprReal) AprReal,SUM(MayPlan) MayPlan,SUM(MayReal) MayReal,SUM(JunPlan) JunPlan,SUM(JunReal) JunReal,SUM(JulPlan) JulPlan,SUM(JulReal) JulReal,SUM(AugPlan) AugPlan,SUM(AugReal) AugReal,SUM(SepPlan) SepPlan,SUM(SepReal) SepReal,SUM(OctPlan) OctPlan,SUM(OctReal) OctReal,SUM(NovPlan) NovPlan,SUM(NovReal) NovReal,SUM(DecPlan) DecPlan,SUM(DecReal) DecReal,SUM(MonthAve) MonthAve,SUM(RollYear) RollYear from T_Budget where ItemsId=30 and cYear='" + year + "' group by ItemsId" +
    " union all " +
   " select ItemsId,SUM(JanPlan) JanPlan,SUM(JanReal) JanReal,SUM(FebPlan) FebPlan,SUM(FebReal) FebReal,SUM(MarPlan) MarPlan,SUM(MarReal) MarReal,SUM (AprPlan) AprPlan,SUM(AprReal) AprReal,SUM(MayPlan) MayPlan,SUM(MayReal) MayReal,SUM(JunPlan) JunPlan,SUM(JunReal) JunReal,SUM(JulPlan) JulPlan,SUM(JulReal) JulReal,SUM(AugPlan) AugPlan,SUM(AugReal) AugReal,SUM(SepPlan) SepPlan,SUM(SepReal) SepReal,SUM(OctPlan) OctPlan,SUM(OctReal) OctReal,SUM(NovPlan) NovPlan,SUM(NovReal) NovReal,SUM(DecPlan) DecPlan,SUM(DecReal) DecReal,SUM(MonthAve) MonthAve,SUM(RollYear) RollYear from T_Budget where ItemsId=40 and cYear='" + year + "' group by ItemsId" +
     " union all" +
   " select ItemsId,SUM(JanPlan) JanPlan,SUM(JanReal) JanReal,SUM(FebPlan) FebPlan,SUM(FebReal) FebReal,SUM(MarPlan) MarPlan,SUM(MarReal) MarReal,SUM (AprPlan) AprPlan,SUM(AprReal) AprReal,SUM(MayPlan) MayPlan,SUM(MayReal) MayReal,SUM(JunPlan) JunPlan,SUM(JunReal) JunReal,SUM(JulPlan) JulPlan,SUM(JulReal) JulReal,SUM(AugPlan) AugPlan,SUM(AugReal) AugReal,SUM(SepPlan) SepPlan,SUM(SepReal) SepReal,SUM(OctPlan) OctPlan,SUM(OctReal) OctReal,SUM(NovPlan) NovPlan,SUM(NovReal) NovReal,SUM(DecPlan) DecPlan,SUM(DecReal) DecReal,SUM(MonthAve) MonthAve,SUM(RollYear) RollYear from T_Budget where ItemsId=46 and cYear='" + year + "' group by ItemsId) t1 ";
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

        //提交预算表
      public DataTable SubmitBudget(string year,string mname) {

          string sql = "update T_Budget set IsEdit=1 where cYear='" + year + "' and Operators='" + mname + "'";

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

      //取得收支差
      public DataTable ShouZhiCha(string year, string mname)
      {

          string sql = "select t1.JanPlan-t2.JanPlan JanPlan,t1.JanReal-t2.JanReal JanReal,t1.FebPlan-t2.FebPlan FebPlan,t1.FebReal-t1.FebReal FebReal,t1.MarPlan-t2.MarPlan MarPlan,t1.MarReal-t2.MarReal MarReal,t1.AprPlan-t2.AprPlan AprPlan,t1.AprReal-t2.AprReal AprReal,t1.MayPlan-t2.MayPlan MayPlan,t1.MayReal-t1.MayReal MayReal,t1.JunPlan-t2.JunPlan JunPlan,t1.JunReal-t2.JunReal JunReal,t1.JulPlan-t2.JulPlan JulPlan,t1.JulReal-t2.JulReal JulReal,t1.AugPlan-t2.AugPlan AugPlan,t1.AugReal-t2.AugReal AugReal,t1.SepPlan-t2.SepPlan SepPlan,t1.SepReal-t2.SepReal SepReal, t1.OctPlan-t2.OctPlan OctPlan,t1.OctReal-t2.OctReal OctReal,t1.NovPlan-t2.NovPlan NovPlan,t1.NovReal-t2.NovReal NovReal,t1.DecPlan-t2.DecPlan DecPlan,t1.DecReal-t2.DecReal DecReal,t1.RollYear-t2.RollYear RollYear,t1.MonthAve-t2.MonthAve MonthAve,t1.Colloect-t2.Colloect Colloect from T_Budget t1, T_Budget t2 where t1.ItemsId='6' and t2.ItemsId='47' and t1.cYear='"+year+"' and t1.Operators='"+mname+"'";

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

      //提交预算表

      public int SaveBudget(string year, string mname)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vyear", SqlDbType.VarChar,20),
                    new SqlParameter("vmname", SqlDbType.VarChar,100)
                
            };
          parameters[0].Value = year;
          parameters[1].Value = mname;


          string commandText = "proc_SaveBudget";
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
      //返回预算表

      public int C_EditBudget(string year, string mname)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vyear", SqlDbType.VarChar,20),
                    new SqlParameter("vmname", SqlDbType.VarChar,100)
                
            };
          parameters[0].Value = year;
          parameters[1].Value = mname;


          string commandText = "proc_C_EditBudget";
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

      

           //返回预算表

      public int OkBudget(string year, string mname)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vyear", SqlDbType.VarChar,20),
                    new SqlParameter("vmname", SqlDbType.VarChar,100)
                
            };
          parameters[0].Value = year;
          parameters[1].Value = mname;


          string commandText = "proc_OkBudget";
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
