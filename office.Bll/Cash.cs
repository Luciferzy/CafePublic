using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using office.Dal;
using office.Model;

namespace office.Bll
{
  public  class Cash
    {
      private office.Dal.Cash dalCash = null;

        public Cash()
        {
            dalCash = new Dal.Cash();
        }

        #region
        /// <summary>
        /// 获取现金推算表信息
        /// </summary>
        /// <returns></returns>
        public DataSet GetCashInfo(ListCafeEntity model)
        {
            DataSet ds = new DataSet("SHOPXML");
            if (model.YearS == 0 || model.YearE == 0)
            {
                ds.Tables.Add(dalCash.GetCashInfoOneYear(model));
            }
            else
            {
                if ((Convert.ToInt32(model.YearS) == Convert.ToInt32(model.YearE)))
                {
                    ds.Tables.Add(dalCash.GetCashInfoOneYear(model));
                }
                else
                {
                    ds.Tables.Add(dalCash.GetCashInfoTwoYear(model));
                }
            }

            return ds;
        }

        /// <summary>
        /// 获取现金推算表信息
        /// </summary>
        /// <returns></returns>
        public DataSet GetCashStatisticInfo(ListCafeEntity model)
        {
            DataSet ds = new DataSet("SHOPXML");
            //if (model.YearS == 0 || model.YearE == 0)
            //{
            //    ds.Tables.Add(dalCash.GetCashStatisticInfoOneYear(model));
            //}
            //else
            //{
            //    if ((Convert.ToInt32(model.YearS) == Convert.ToInt32(model.YearE)))
            //    {
            //        ds.Tables.Add(dalCash.GetCashStatisticInfoOneYear(model));
            //    }
            //    else
            //    {
            ds.Tables.Add(dalCash.GetCashStatisticInfoTwoYear(model));
            //    }
            //}

            return ds;
        }

        /// <summary>
        /// 获取现金推算表信息
        /// </summary>
        /// <returns></returns>
        public DataSet GetCashStatisticInfoAll(ListCafeEntity model)
        {
            DataSet ds = new DataSet("SHOPXML");
            //if (model.YearS == 0 || model.YearE == 0)
            //{
            //    ds.Tables.Add(dalCash.GetCashStatisticInfoAllOneYear(model));
            //}
            //else
            //{
            //    if ((Convert.ToInt32(model.YearS) == Convert.ToInt32(model.YearE)))
            //    {
            //        ds.Tables.Add(dalCash.GetCashStatisticInfoAllOneYear(model));
            //    }
            //    else
            //    {
            ds.Tables.Add(dalCash.GetCashStatisticInfoAllTwoYear(model));
            //    }
            //}

            return ds;
        }

        /// <summary>
        /// 保存现金推算表信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int SaleCafeInfoOneYear(ListCafeEntity model)
        {
            return dalCash.SaleCafeInfoOneYear(model);
        }

        /// <summary>
        /// 保存现金推算表信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int SaleCafeInfoTwoYear(ListCafeEntity model)
        {
            return dalCash.SaleCafeInfoTwoYear(model);
        }

        /// <summary>
        /// 导入现金推算表信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int ImportCash(ListCafeEntity model)
        {
            return dalCash.ImportCash(model);
        }

        #endregion


        /// <summary>
        /// 初始化现金推算表
      /// </summary>
      /// <returns></returns>
        public DataSet InitCash(string mname, string year)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalCash.InitCash(mname, year));
            return ds;
        }

        /// <summary>
        /// 根据下拉列表选择时间获取数据1和数据2
        /// </summary>
        /// <returns></returns>
        public DataSet GetCashDataByYear(string year, string mname)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalCash.GetCashDataByYear(year, mname));
            return ds;
        }
        /// <summary>
        /// 根据下拉列表选择时间获取数据1
        /// </summary>
        /// <returns></returns>
        public DataSet GetCashDataByYear2(string year, string year2, string mname)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalCash.GetCashDataByYear2(year, year2, mname));
            return ds;
        }


        /// <summary>
        /// 编辑现金推算表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int EditCash(ListCashEntity model)
        {
            return dalCash.EditCash(model);
        }

        /// <summary>
        /// 提交现金推算表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int SaveCash(string year, string mname)
        {
            return dalCash.SaveCash(year, mname);
        }

        /// <summary>
        /// 提交现金推算表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int C_EditCash(string year, string mname)
        {
            return dalCash.C_EditCash(year, mname);
        }

        /// <summary>
        /// 提交现金推算表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int OkCash(string year, string mname)
        {
            return dalCash.OkCash(year, mname);
        }



    }
}
