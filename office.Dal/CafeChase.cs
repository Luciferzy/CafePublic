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
   public class CafeChase
    {

        SqlDataBase db = new SqlDataBase();
        DataTable dt = new DataTable();

        #region
        /// <summary>
        /// 获取咖啡追赶表信息
        /// </summary>
        /// <returns></returns>
        public DataTable GetCafeChaseInfoOneYear(ListCafeEntity model)
        {
            string strHtml = "";
            DataTable dt = new DataTable();
            if (model.YearS == 0)
            {
                strHtml = " and cYear=datename(yyyy,getdate()) ";
            }
            else {
                strHtml = " and cYear=" + model.YearS;
            }
            string strSql = "SELECT Id,LaAllYear,LastMonthPlan,Adjust,dbo.GetRollYear(cYear,TheMonth) RollYear,StageGoal,OriPlan,Balance1,Balance2," +
                            "dbo.GetBalance1(Operators,cYear,TheMonth) BType1,Adjusted,dbo.GetBalance2(Operators,cYear,TheMonth) BType2," +
                            "Measure,right('00'+convert(varchar(5),TheMonth),2) TheMonth,cYear,MONTH(getdate()) NowMonth,datename(yyyy,getdate()) NowYear,cYear_Target,  " +
                            "(select sum(LaAllYear) FROM T_CafeChase where Operators='" + model.UserCode.Trim() + "' " + strHtml.Trim() + ") sum1, " +
                            "(select sum(LastMonthPlan) FROM T_CafeChase where Operators='" + model.UserCode.Trim() + "' " + strHtml.Trim() + ") sum2, " +
                            "(select sum(Adjust) FROM T_CafeChase where Operators='" + model.UserCode.Trim() + "' " + strHtml.Trim() + ") sum3 " +
                            "FROM T_CafeChase where Operators='" + model.UserCode.Trim() + "' " + strHtml.Trim();
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
        /// 获取咖啡追赶表信息
        /// </summary>
        /// <returns></returns>
        public DataTable GetCafeChaseInfoTwoYear(ListCafeEntity model)
        {
            DataTable dt = new DataTable();
            string strSql = "select t1.*,t2.* from (SELECT Id,LaAllYear,LastMonthPlan,Adjust,dbo.GetRollYear(cYear,TheMonth) RollYear,StageGoal,OriPlan,Balance1,Balance2,"+
                            "dbo.GetBalance1(Operators,cYear,TheMonth) BType1,Adjusted,dbo.GetBalance2(Operators,cYear,TheMonth) BType2,isnull(Measure,'') Measure,"+
                            "right('00'+convert(varchar(5),TheMonth),2) TheMonth,cYear,MONTH(getdate()) NowMonth,datename(yyyy,getdate()) NowYear,cYear_Target, "+
                            "(select sum(LaAllYear) FROM T_CafeChase where Operators='" + model.UserCode.Trim() + "' and cYear=" + model.YearS + ") sum1, " +
                            "(select sum(LastMonthPlan) FROM T_CafeChase where Operators='" + model.UserCode.Trim() + "' and cYear=" + model.YearS + ") sum2, " +
                            "(select sum(Adjust) FROM T_CafeChase where Operators='" + model.UserCode.Trim() + "' and cYear=" + model.YearS + ") sum3 " +
                            "FROM T_CafeChase where Operators='" + model.UserCode.Trim() + "' and cYear=" + model.YearS + ") t1," +
                            "(SELECT Id kId,LaAllYear kLaAllYear,LastMonthPlan kLastMonthPlan,Adjust kAdjust,dbo.GetRollYear(cYear,TheMonth) kRollYear,StageGoal kStageGoal,OriPlan kOriPlan,Balance1 kBalance1,Balance2 kBalance2,"+
                            "dbo.GetBalance1(Operators,cYear,TheMonth) kBType1,Adjusted kAdjusted,dbo.GetBalance2(Operators,cYear,TheMonth) kBType2,isnull(Measure,'') kMeasure,"+
                            "right('00'+convert(varchar(5),TheMonth),2) kTheMonth,cYear kcYear,cYear_Target kcYear_Target, " +
                            "(select sum(LaAllYear) FROM T_CafeChase where Operators='" + model.UserCode.Trim() + "' and cYear=" + model.YearE + ") ksum1, " +
                            "(select sum(LastMonthPlan) FROM T_CafeChase where Operators='" + model.UserCode.Trim() + "' and cYear=" + model.YearE + ") ksum2, " +
                            "(select sum(Adjust) FROM T_CafeChase where Operators='" + model.UserCode.Trim() + "' and cYear=" + model.YearE + ") ksum3 " +
                            "FROM T_CafeChase where Operators='" + model.UserCode.Trim() + "' and cYear=" + model.YearE + ") t2 where t1.TheMonth=t2.kTheMonth";
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
        /// 保存咖啡追赶表信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int SaleCafeChaseInfoOneYear(ListCafeEntity model)
        {
            SqlParameter[] parameters = {
                    new SqlParameter("vOperators", SqlDbType.VarChar,50),
                    new SqlParameter("vYearS", SqlDbType.Int),
                    new SqlParameter("vYearE", SqlDbType.Int),
                    new SqlParameter("vMeasure", SqlDbType.VarChar,800),
                    new SqlParameter("vcYear_Target", SqlDbType.Int),
                    new SqlParameter("vId", SqlDbType.VarChar,800)

            };
            parameters[0].Value = model.Operators;
            parameters[1].Value = model.YearS;
            parameters[2].Value = model.YearE;
            parameters[3].Value = model.Measure;
            parameters[4].Value = model.cYear_Target;
            parameters[5].Value = model.sId;


            string commandText = "SaleCafeChaseInfoOneYear";
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
        /// 保存咖啡追赶表信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int SaleCafeChaseInfoTwoYear(ListCafeEntity model)
        {
            SqlParameter[] parameters = {
                    new SqlParameter("vOperators", SqlDbType.VarChar,50),
                    new SqlParameter("vYearS", SqlDbType.Int),
                    new SqlParameter("vYearE", SqlDbType.Int),
                    new SqlParameter("vMeasure", SqlDbType.VarChar,800),
                    new SqlParameter("vcYear_Target", SqlDbType.Int),
                    new SqlParameter("vsId", SqlDbType.VarChar,800),
                    new SqlParameter("vkMeasure", SqlDbType.VarChar,800),
                    new SqlParameter("vkcYear_Target", SqlDbType.Int),
                    new SqlParameter("vkId", SqlDbType.VarChar,800)

            };
            parameters[0].Value = model.Operators;
            parameters[1].Value = model.YearS;
            parameters[2].Value = model.YearE;
            parameters[3].Value = model.Measure;
            parameters[4].Value = model.cYear_Target;
            parameters[5].Value = model.sId;
            parameters[6].Value = model.kMeasure;
            parameters[7].Value = model.kcYear_Target;
            parameters[8].Value = model.ksId;


            string commandText = "SaleCafeChaseInfoTwoYear";
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

        public DataTable GetCafeChase(string year,string mname) {

            string sql = " select * from T_CafeChase  where Operators='" + mname + "' and cYear='" + year + "'";
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

        public DataTable GetCafeChase2(string year, string year2, string mname)
        {

            string sql = "  select * from T_CafeChase  where (Operators='" + mname + "' and cYear='" + year + "') or(Operators='" + mname + "' and cYear='" + year2 + "')";
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

        public DataTable ChangeCafe(string year, string mname, string value, string head, string month) {

            string sql = " update T_CafeChase set " + head + "='" + value + "' where cYear='" + year + "' and Operators='" + mname
                + "' and TheMonth='" + month + "'";
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

       //修改阶段目标
        public DataTable ChangeStageGoal(ListCafeEntity entity) {

            string sql = " UPDATE T_CafeChase SET cYear_Target='" + entity.yearGoal + "', StageGoal=case TheMonth when 1 then '" + entity.sGoal + "'when 2 then '" + entity.sGoal2 + "' when 3 then '" + entity.sGoal3 + "' when 4 then '" + entity.sGoal4 + "' when 5 then '" + entity.sGoal5 + "' when 6 then '" + entity.sGoal6 + "' when 7 then '" + entity.sGoal7 + "' when 8 then '" + entity.sGoal8 + "' when 9 then '" + entity.sGoal9 + "' when 10 then '" + entity.sGoal10 + "' when 11 then '" + entity.sGoal11 + "' else '" + entity.sGoal12 + "' end where TheMonth in (1,2,3,4,5,6,7,8,9,10,11,12) and cYear='" + entity.year + "' and Operators='" + entity.mname + "'";
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
       //修改阶段目标往后列
        public DataTable ChangeCafeRest(ListCafeEntity entity) {

            string sql = " UPDATE T_CafeChase SET  OriPlan=case TheMonth when 1 then '" + entity.oriPlan + "'when 2 then '" + entity.oriPlan2 + "' when 3 then '" + entity.oriPlan3 + "' when 4 then '" + entity.oriPlan4 + "' when 5 then '" + entity.oriPlan5 + "' when 6 then '" + entity.oriPlan6 + "' when 7 then '" + entity.oriPlan7 + "' when 8 then '" + entity.oriPlan8 + "' when 9 then '" + entity.oriPlan9 + "' when 10 then '" + entity.oriPlan10 + "' when 11 then '" + entity.oriPlan11 + "' else '" + entity.oriPlan12 + "' end, "+

                "Balance1=case TheMonth when 1 then '" + entity.balance + "'when 2 then '" + entity.balance2 + "' when 3 then '" + entity.balance3 + "' when 4 then '" + entity.balance4 + "' when 5 then '" + entity.balance5 + "' when 6 then '" + entity.balance6 + "' when 7 then '" + entity.balance7 + "' when 8 then '" + entity.balance8 + "' when 9 then '" + entity.balance9 + "' when 10 then '" + entity.balance10 + "' when 11 then '" + entity.balance11 + "' else '" + entity.balance12 + "'end,"+

                "Adjusted=case TheMonth when 1 then '" + entity.adjutsted + "'when 2 then '" + entity.adjutsted2 + "' when 3 then '" + entity.adjutsted3 + "' when 4 then '" + entity.adjutsted4 + "' when 5 then '" + entity.adjutsted5 + "' when 6 then '" + entity.adjutsted6 + "' when 7 then '" + entity.adjutsted7 + "' when 8 then '" + entity.adjutsted8 + "' when 9 then '" + entity.adjutsted9 + "' when 10 then '" + entity.adjutsted10 + "' when 11 then '" + entity.adjutsted11 + "' else '" + entity.adjutsted12 + "'end," +

                "Balance2=case TheMonth when 1 then '" + entity.balanceT + "'when 2 then '" + entity.balanceT2 + "' when 3 then '" + entity.balanceT3 + "' when 4 then '" + entity.balanceT4 + "' when 5 then '" + entity.balanceT5 + "' when 6 then '" + entity.balanceT6 + "' when 7 then '" + entity.balanceT7 + "' when 8 then '" + entity.balanceT8 + "' when 9 then '" + entity.balanceT9 + "' when 10 then '" + entity.balanceT10 + "' when 11 then '" + entity.balanceT11 + "' else '" + entity.balanceT12 + "'end" +

                "  where TheMonth in (1,2,3,4,5,6,7,8,9,10,11,12) and cYear='" + entity.year + "' and Operators='" + entity.mname + "'";
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
