using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using office.Dal;
using office.Model;

namespace office.Bll
{
  public  class Key
    {
      private office.Dal.Key dalKey = null;

      public Key()
        {
            dalKey = new Dal.Key();
        }
     
      /// <summary>
      /// 初始化关键指标追赶表
      /// </summary>
      /// <returns></returns>
      public DataSet InitKey(string mname, string year, string year2)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalKey.InitKey(mname, year, year2));
            return ds;
        }

        /// <summary>
        /// 根据下拉列表选择时间获取数据1和数据2
        /// </summary>
        /// <returns></returns>
      public DataSet GetKeyDataByYear(string year, string year2,string mname)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalKey.GetKeyDataByYear(year,year2, mname));
            return ds;
        }
        /// <summary>
        /// 根据下拉列表选择时间获取数据1
        /// </summary>
        /// <returns></returns>
        public DataSet GetKeyDataByYear2(string year, string year2, string mname)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalKey.GetKeyDataByYear2(year, year2, mname));
            return ds;
        }


        /// <summary>
        /// 编辑现金推算表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int EditKey(ListKeyEntity model)
        {
            return dalKey.EditKey(model);
        }

        /// <summary>
        /// 提交现金推算表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int SaveKey(string year, string mname)
        {
            return dalKey.SaveKey(year, mname);
        }


        /// <summary>
        /// 提交现金推算表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int OkKey(string year, string mname)
        {
            return dalKey.OkKey(year, mname);
        }

        /// <summary>
        /// 提交现金推算表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int C_EditKey(string year, string mname)
        {
            return dalKey.C_EditKey(year, mname);
        }


        /// <summary>
        /// 提交现金推算表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int EditTarget(string year, string mname, string cYear_target)
        {
            return dalKey.EditTarget(year, mname, cYear_target);
        }


        /// <summary>
        /// 提交现金推算表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int EditcYear_ActualSalesPlan(string id, string cYear_ActualSalesPlan)
        {
            return dalKey.EditcYear_ActualSalesPlan(id, cYear_ActualSalesPlan);
        }

        /// <summary>
        /// 提交现金推算表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int EditcYear_PlanSalesPlan(string id, string cYear_PlanSalesPlan)
        {
            return dalKey.EditcYear_PlanSalesPlan(id, cYear_PlanSalesPlan);
        }

    }
}
