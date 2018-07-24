<%@ WebHandler Language="C#" Class="GetKeyData" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;


public class GetKeyData : IHttpHandler
{

    SqlConnection con = new SqlConnection("Server=120.78.72.160;User Id=sa;Pwd=Gzbf-office_2018;DataBase=Cafe");
    DataSet ds = new DataSet();
    SqlDataAdapter adapter = new SqlDataAdapter();
    JavaScriptSerializer jsS = new JavaScriptSerializer();
    List<object> lists1 = new List<object>();
    //Series seriesObj = new Series();
    string result = "";


    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        Get_Data01(context);

    }
    
    /// <summary>
    /// 取数据库中所含年份
    /// </summary>
    /// <returns></returns>
    public void Get_Data01(HttpContext context)
    {

        string sql = "select DATEPART(YEAR,cYear) year1 from T_Key_indicators  group by DATEPART(YEAR,cYear)";
        ds = GetDataFromDatabase(sql);
        lists1 = new List<object>();
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            var obj = new { data = dr["year1"] };
            lists1.Add(obj);
        }
        jsS = new JavaScriptSerializer();
        result = jsS.Serialize(lists1);
        context.Response.Write(result);

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

