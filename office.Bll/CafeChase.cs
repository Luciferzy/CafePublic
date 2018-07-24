using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using office.Dal;
using office.Model;
namespace office.Bll
{
  public  class CafeChase
    {
        private office.Dal.CafeChase dalcommon = null;

        public CafeChase()
        {
            dalcommon = new Dal.CafeChase();
        }

        #region
        /// <summary>
        /// 获取咖啡追赶表信息
        /// </summary>
        /// <returns></returns>
        public DataSet GetCafeChaseInfo(ListCafeEntity model)
        {
            DataSet ds = new DataSet("SHOPXML");
            if (model.YearS == 0 || model.YearE == 0)
            {
                ds.Tables.Add(dalcommon.GetCafeChaseInfoOneYear(model));
            }
            else
            {
                if ((Convert.ToInt32(model.YearS) == Convert.ToInt32(model.YearE)))
                {
                    ds.Tables.Add(dalcommon.GetCafeChaseInfoOneYear(model));
                }
                else
                {
                    ds.Tables.Add(dalcommon.GetCafeChaseInfoTwoYear(model));
                }
            }
            return ds;
        }

        /// <summary>
        /// 保存咖啡追赶表信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int SaleCafeChaseInfoOneYear(ListCafeEntity model)
        {
            return dalcommon.SaleCafeChaseInfoOneYear(model);
        }

        /// <summary>
        /// 保存咖啡追赶表信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int SaleCafeChaseInfoTwoYear(ListCafeEntity model)
        {
            return dalcommon.SaleCafeChaseInfoTwoYear(model);
        }

        #endregion

        public DataSet GetCafeChase(string year,string mname)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalcommon.GetCafeChase(year,mname));
            return ds;
        }

        public DataSet GetCafeChase2(string year, string year2, string mname)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalcommon.GetCafeChase2(year, year2, mname));
            return ds;
        }

        public DataSet ChangeCafe(string year, string mname, string value, string head, string month)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalcommon.ChangeCafe(year, mname, value,head,month));
            return ds;
        }

        public DataSet ChangeStageGoal(ListCafeEntity entity)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalcommon.ChangeStageGoal(entity));
            return ds;
        }

        public DataSet ChangeCafeRest(ListCafeEntity entity)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalcommon.ChangeCafeRest(entity));
            return ds;
        }
    }
}
