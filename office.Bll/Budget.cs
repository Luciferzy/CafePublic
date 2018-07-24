using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using office.Dal;
using office.Model;

namespace office.Bll
{
  public  class Budget
    {
        private office.Dal.Budget dalCommon = null;

        public Budget()
        {
            dalCommon = new Dal.Budget();
        }

        #region 新
        /// <summary>
        /// 获取预算表信息
        /// </summary>
        /// <returns></returns>
        public DataSet GetBudgetInfo(ListBudgetEntity model)
        {
            DataSet ds = new DataSet("SHOPXML");
            if (model.YearS == 0 || model.YearE == 0)
            {
                ds.Tables.Add(dalCommon.GetBudgetInfoOneYear(model));
            }
            else
            {
                if ((Convert.ToInt32(model.YearS) == Convert.ToInt32(model.YearE)))
                {
                    ds.Tables.Add(dalCommon.GetBudgetInfoOneYear(model));
                }
                else
                {
                    ds.Tables.Add(dalCommon.GetBudgetInfoTwoYear(model));
                }
            }

            return ds;
        }

        /// <summary>
        /// 配置预算表信息
        /// </summary>
        /// <returns></returns>
        public DataSet GetBudgetSetShow(ListBudgetEntity model)
        {
            DataSet ds = new DataSet("SHOPXML");
            if (model.YearS == 0 || model.YearE == 0)
            {
                ds.Tables.Add(dalCommon.GetBudgetInfoOneYear(model));
            }
            else
            {
                if ((Convert.ToInt32(model.YearS) == Convert.ToInt32(model.YearE)))
                {
                    ds.Tables.Add(dalCommon.GetBudgetSetShowOneYear(model));
                }
                else
                {
                    ds.Tables.Add(dalCommon.GetBudgetSetShowTwoYear(model));
                }
            }
            return ds;
        }

        /// <summary>
        /// 保存配置信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int SaleBudgetShowOneYear(ListBudgetEntity model)
        {
            return dalCommon.SaleBudgetShowOneYear(model);
        }

        /// <summary>
        /// 保存配置信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int SaleBudgetShowTwoYear(ListBudgetEntity model)
        {
            return dalCommon.SaleBudgetShowTwoYear(model);
        }

        /// <summary>
        /// 保存收支预算表信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int SaleBudgetInfoOneYear(ListBudgetEntity model)
        {
            return dalCommon.SaleBudgetInfoOneYear(model);
        }

        /// <summary>
        /// 保存收支预算表信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int SaleBudgetInfoTwoYear(ListBudgetEntity model)
        {
            return dalCommon.SaleBudgetInfoTwoYear(model);
        }

        #endregion

        /// <summary>
      /// 传递用户名，以此验证用户名和密码是否正确
      /// </summary>
      /// <param name="entity"></param>
      /// <returns></returns>
        public DataSet GetInfo(string MbrName)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalCommon.GetInfo(MbrName));
            return ds;
        }
      /// <summary>
      /// 初始化预算信息表
      /// </summary>
      /// <returns></returns>
        public DataSet InitBudget(string mname,string year) {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalCommon.InitBudget(mname,year));
            return ds;
        }

        /// <summary>
        /// 根据下拉列表选择时间获取数据1和数据2
        /// </summary>
        /// <returns></returns>
        public DataSet GetDataByYear(string year,string mname)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalCommon.GetDataByYear(year,mname));
            return ds;
        }
        /// <summary>
        /// 根据下拉列表选择时间获取数据1
        /// </summary>
        /// <returns></returns>
        public DataSet GetDataByYear2(string year, string year2,string mname)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalCommon.GetDataByYear2(year,year2,mname));
            return ds;
        }

        /// <summary>
        /// 改变预算表中的值
        /// </summary>
        /// <returns></returns>
        public DataSet ChangeBudget(string itemid, string value, string year, string mname,string headB)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalCommon.ChangeBudget(itemid, value, year, mname,headB));
            return ds;
        }

        /// <summary>
        /// 改变预算表的合计值
        /// </summary>
        /// <returns></returns>
        public int ChangeCollect( string year, string mname)
        {
            return dalCommon.ChangeCollect(year,mname);
        }


        /// <summary>
        /// 获取总支出合计值
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet ToltalCaculate(string year) {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalCommon.ToltalCaculate(year));
            return ds;
        }

      /// <summary>
        /// 提交预算页面
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet SubmitBudget(string year,string mname)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalCommon.SubmitBudget(year,mname));
            return ds;
        }


      //收支差
        public DataSet ShouZhiCha(string year, string mname)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalCommon.ShouZhiCha(year, mname));
            return ds;
        }

      //提交预算表
        public int SaveBudget(string year, string mname)
        {
            return dalCommon.SaveBudget(year, mname);
        }
      //返回预算表

        public int C_EditBudget(string year, string mname)
        {
            return dalCommon.C_EditBudget(year, mname);
        }

      //最终提交预算表

        public int OkBudget(string year, string mname)
        {
            return dalCommon.OkBudget(year, mname);
        }
    }
}
