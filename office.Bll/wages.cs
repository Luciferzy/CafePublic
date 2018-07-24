using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using office.Dal;
using office.Model;

namespace office.Bll
{
  public  class Wages
    {
      private office.Dal.Wages dalWages = null;

        public Wages()
        {
            dalWages = new Dal.Wages();
        }
     
      /// <summary>
        /// 初始化现金推算表
      /// </summary>
      /// <returns></returns>
        public DataSet InitWages(string mname, string year)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalWages.InitWages(mname, year));
            return ds;
        }

        /// <summary>
        /// 根据下拉列表选择时间获取数据1和数据2
        /// </summary>
        /// <returns></returns>
        public DataSet GetWagesDataByYear(string year, string mname)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalWages.GetWagesDataByYear(year, mname));
            return ds;
        }
        /// <summary>
        /// 根据下拉列表选择时间获取数据1
        /// </summary>
        /// <returns></returns>
        public DataSet GetWagesDataByYear2(string year, string year2, string mname)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalWages.GetWagesDataByYear2(year, year2, mname));
            return ds;
        }


        /// <summary>
        /// 编辑现金推算表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int EditWages(ListWagesEntity model)
        {
            return dalWages.EditWages(model);
        }

        /// <summary>
        /// 提交现金推算表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int SaveWages(string year, string mname)
        {
            return dalWages.SaveWages(year, mname);
        }

        /// <summary>
        /// 提交现金推算表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int C_EditWages(string year, string mname)
        {
            return dalWages.C_EditWages(year, mname);
        }

        /// <summary>
        /// 提交现金推算表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int OkWages(string year, string mname)
        {
            return dalWages.OkWages(year, mname);
        }


        /// <summary>
        /// 新增独立单位
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Add_Wages(WagesEntity model)
        {
            return dalWages.Add_Wages(model);
        }



    }
}
