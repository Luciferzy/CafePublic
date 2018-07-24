using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using office.Dal;
using office.Model;

namespace office.Bll
{
  public  class FixedAssets
    {
      private office.Dal.FixedAssets dalFixedAssets = null;

      public FixedAssets()
        {
            dalFixedAssets = new Dal.FixedAssets();
        }
     
      /// <summary>
        /// 初始化现金推算表
      /// </summary>
      /// <returns></returns>
      public DataSet InitFixedAssets(string mname, string equipmentname)
        {
            DataSet ds = new DataSet("SHOPXML");
            ds.Tables.Add(dalFixedAssets.InitFixedAssets(mname, equipmentname));
            return ds;
        }


      /// <summary>
      /// 新增独立单位
      /// </summary>
      /// <param name="model"></param>
      /// <returns></returns>
      public int Add_FixedAssets(FixedAssetsEntity model)
      {
          return dalFixedAssets.Add_FixedAssets(model);
      }

    }
}
