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
    public class SideBar
    {
        SqlDataBase db = new SqlDataBase();
        DataTable dt = new DataTable();

        public DataTable GetSideBarInfo(string children)
        {

            string sql = "  select * from Department where Id in (" + children + ")";
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

        public DataTable GetSideBarInfoNew(string membername, int Grade)
        {
            string sql = "";
            if (Grade == 0)
            {
                sql = "  select '' Minister,isnull(DeptName,'') Manager,isnull(MemberName,'') MemberName,isnull(DeptName,'') DeptName from Department where MemberName='" + membername + "'";
            }
            else if (Grade == 1)
            {
                sql = "  select '' Minister,isnull(DeptName,'') Manager,isnull(MemberName,'') MemberName,isnull(DeptName,'') DeptName from Department t1,DirAndMin t2 where t1.MemberName=t2.Minister and t2.Director='" + membername + "'";
            }
            else {
                sql = " select t1.Minister,t1.DeptName Manager,t3.MemberName,t3.DeptName DeptName from (select Minister,b.DeptName from DirAndMin a,Department b where a.Minister=b.MemberName and Director='" + membername + "') t1,DirAndMin t2," +
                     "Department t3 where t1.Minister=t2.Director and t2.Minister=t3.MemberName order by t1.Minister ";
            }
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

        public DataTable GetSideBarInfo2(string membername)
        {

            string sql = "  select * from Department where MemberName='" + membername + "'";
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

        public DataTable GetMenu(string orders)
        {

            string sql = "  select * from Menu where ParentId='" + orders + "'";
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
