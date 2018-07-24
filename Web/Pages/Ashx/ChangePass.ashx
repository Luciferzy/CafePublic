<%@ WebHandler Language="C#" Class="ChangePass" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;

public class ChangePass : IHttpHandler {
    SqlConnection con = new SqlConnection("Server=120.78.72.160;User Id=sa;Pwd=Gzbf-office_2018;DataBase=Cafe");
    DataSet ds = new DataSet();
    SqlDataAdapter adapter = new SqlDataAdapter();
    JavaScriptSerializer jsS = new JavaScriptSerializer();
    List<object> lists1 = new List<object>();
    //Series seriesObj = new Series();
    string result = "";
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        ChangePassCode(context);
    }

    public void ChangePassCode(HttpContext context)
    {
        string OldPass = context.Request["oldpass"];
        string NewPass = context.Request["newpass"];
        string Id = context.Request["Id"];

        string sql = "update T_Department set PassWord='" + NewPass + "' where Id='" + Id + "'";
        ds = GetDataFromDatabase(sql);
        if (ds != null) {
           int result = 1;
            context.Response.Write(result);
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