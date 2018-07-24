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
    public class FixedAssets
    {
      SqlDataBase db = new SqlDataBase();
      DataTable dt = new DataTable();
     

      /// <summary>
      /// 初始化现金推算表
      /// </summary>
      /// <returns></returns>
      public DataTable InitFixedAssets(string mname, string equipmentname)
      {

          string sql = "select Id,DeptName,EquipmentName,isnull(EquipmentSpec,' ') as EquipmentSpec,isnull(EquipmentRemarks,' ') as EquipmentRemarks,UnitName,PurchaseDate,PurchaseNum,PurchasePrice,PurchaseMoney,ProductValue,DepreciationTime,DepreciationYear,DepreciationMonth,MDMoney,DepreciationEndTime,Is_end  from T_FixedAssets  where MemberName='" + mname + "' and EquipmentName like  '%" + equipmentname.Trim() + "%'";
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
      /// 新增独立单位
      /// </summary>
      /// <param name="model"></param>
      /// <returns></returns>
      public int Add_FixedAssets(FixedAssetsEntity model)
      {
          SqlParameter[] parameters = {
					new SqlParameter("vdeptname",SqlDbType.VarChar,30),           
                    new SqlParameter("vmembername", SqlDbType.VarChar,50),
					new SqlParameter("vequipmentname", SqlDbType.VarChar,60),
                    new SqlParameter("vequipmentspec", SqlDbType.VarChar,100),
					new SqlParameter("vequipmentremarks", SqlDbType.VarChar,100), 
					new SqlParameter("vunitname", SqlDbType.VarChar,30),
					new SqlParameter("vpurchasenum", SqlDbType.Decimal),
                    new SqlParameter("vpurchaseprice", SqlDbType.Decimal),
                    new SqlParameter("vpurchasemoney", SqlDbType.Decimal),
                    new SqlParameter("vproductvalue", SqlDbType.Decimal),

                    new SqlParameter("vpurchasedate", SqlDbType.Date),
					new SqlParameter("vdepreciationtime", SqlDbType.Date),
                    new SqlParameter("vdepreciationyear", SqlDbType.VarChar,30),
                    new SqlParameter("vdepreciationmonth", SqlDbType.Int,4),
                    new SqlParameter("vmdmoney", SqlDbType.Decimal)
            };
          parameters[0].Value = model.DeptName;
          parameters[1].Value = model.MemberName;
          parameters[2].Value = model.EquipmentName;
          parameters[3].Value = model.EquipmentSpec;
          parameters[4].Value = model.EquipmentRemarks;
          parameters[5].Value = model.UnitName;
          parameters[6].Value = model.PurchaseNum;
          parameters[7].Value = model.PurchasePrice;
          parameters[8].Value = model.PurchaseMoney;
          parameters[9].Value = model.ProductValue;

          parameters[10].Value = model.PurchaseDate;
          parameters[11].Value = model.DepreciationTime;
          parameters[12].Value = model.DepreciationYear;
          parameters[13].Value = model.DepreciationMonth;
          parameters[14].Value = model.MDMoney;



          string commandText = "proc_AddFixedAssets";
          int result = 0;
          try
          {
              db.Open();

              //string strHtml0 = "select 1 from T_Department where MemberName='" + model.MemberName + "' ";
             // DataTable dt0 = new DataTable();
              //dt0 = db.GetDataTableWithSQL(strHtml0);

             // string strHtml = "select 1 from T_Department where DeptCode='" + model.DeptCode + "' and Grade=0";
             // DataTable dt = new DataTable();
             // dt = db.GetDataTableWithSQL(strHtml);

             //// if (dt0.Rows.Count > 0)
              //{
                //  result = 3;
             // }

             // else if (dt.Rows.Count > 0)
             // {
                  //result = 2;
             // }//
             // else
             // {
                  db.ExecuteNonQuery(commandText, CommandType.StoredProcedure, parameters);
                  result = 1;
             // }
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
