using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using office.Dal;
using office.Model;

namespace office.Bll
{
  public  class Common
    {
        private office.Dal.Common dalCommon = null;

        public Common()
        {
            dalCommon = new Dal.Common();
        }
      /// <summary>
      /// 传递用户名，以此验证用户名和密码是否正确
      /// </summary>
      /// <param name="entity"></param>
      /// <returns></returns>
        public DataSet GetInfo(Entity entity)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalCommon.GetInfo(entity));
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

    }
}
