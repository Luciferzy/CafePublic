using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace office.Model
{
    public class FixedAssetsEntity
    {
        public string DeptName
        {
            get;
            set;
        }

        public string MemberName
     {
         
         get;
         set;
     }
        public string EquipmentName
     {
         get;
         set;
     }

        public string EquipmentSpec
        {

            get;
            set;
        }


        public string EquipmentRemarks
        {

            get;
            set;
        }
        public string UnitName
        {
            get;
            set;
        }

        public decimal PurchaseNum
        {

            get;
            set;
        }
        public decimal PurchasePrice
        {

            get;
            set;
        }

        public decimal PurchaseMoney
        {

            get;
            set;
        }

        public decimal ProductValue
        {

            get;
            set;
        }

        public DateTime PurchaseDate
        {

            get;
            set;
        }
        public DateTime DepreciationTime
        {

            get;
            set;
        }

        public string DepreciationYear
        {

            get;
            set;
        }

        public int DepreciationMonth
        {

            get;
            set;
        }
        public decimal MDMoney
        {

            get;
            set;
        }
    }
}
