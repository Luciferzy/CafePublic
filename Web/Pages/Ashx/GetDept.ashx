<%@ WebHandler Language="C#" Class="CafeChase" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;

public class CafeChase : IHttpHandler {

    SqlConnection con = new SqlConnection("Server=120.78.72.160;User Id=sa;Pwd=Gzbf-office_2018;DataBase=Cafe");
    DataSet ds = new DataSet();
    SqlDataAdapter adapter = new SqlDataAdapter();
    JavaScriptSerializer jsS = new JavaScriptSerializer();
    List<object> lists1 = new List<object>();
    //Series seriesObj = new Series();
    string result = "";

    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        GetDeptName(context);
    }

    /// <summary>
    /// 获取当前登陆用户名所对应部门名称
    /// </summary>
    public void GetDeptName(HttpContext context)
    {
        string admin = context.Request["admin"];
        if (admin != "")
        {
            string sql2 = "  select DeptName,Manager from Department where MemberName='"+admin+"'";
            ds = GetDataFromDatabase(sql2);
            lists1 = new List<object>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                var obj = new { data = dr["DeptName"] };

                lists1.Add(obj);
            }
            jsS = new JavaScriptSerializer();
            result = jsS.Serialize(lists1);
            context.Response.Write(result);
        }
        else
        {
            Console.Write("admin is null");
        }

    }

    public DataSet GetDataFromDatabase(string sql)
    {
        ds = new DataSet();
        adapter = new SqlDataAdapter(sql, con);
        adapter.Fill(ds);
        return ds;
    }
    
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}