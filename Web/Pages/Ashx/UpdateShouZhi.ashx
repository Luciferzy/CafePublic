<%@ WebHandler Language="C#" Class="UpdateShouZhi" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;

public class UpdateShouZhi : IHttpHandler {

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
        UpdateShouZhi2(context);
    }

    public void UpdateShouZhi2(HttpContext context)
    {
        string year = context.Request["year"];
        string admin = context.Request["admin"];
        string JanPlan = context.Request["JanPlan"];
        string JanReal = context.Request["JanReal"];
        string FebPlan = context.Request["FebPlan"];
        string FebReal = context.Request["FebReal"];
        string MarPlan = context.Request["MarPlan"];
        string MarReal = context.Request["MarReal"];
        string AprPlan = context.Request["AprPlan"];
        string AprReal = context.Request["AprReal"];
        string MayPlan = context.Request["MayPlan"];
        string MayReal = context.Request["MayReal"];
        string JunPlan = context.Request["JunPlan"];
        string JunReal = context.Request["JunReal"];
        string JulPlan = context.Request["JulPlan"];
        string JulReal = context.Request["JulReal"];
        string AugPlan = context.Request["AugPlan"];
        string AugReal = context.Request["AugReal"];
        string SepPlan = context.Request["SepPlan"];
        string SepReal = context.Request["SepReal"];
        string OctPlan = context.Request["OctPlan"];
        string OctReal = context.Request["OctReal"];
        string NovPlan = context.Request["NovPlan"];
        string NovReal = context.Request["NovReal"];
        string DecPlan = context.Request["DecPlan"];
        string DecReal = context.Request["DecReal"];
        string MonthAve = context.Request["MonthAve"];
        string RollYear = context.Request["RollYear"];

        if (year != "")
        {
            string sql = " update  T_Budget set  JanPlan='" + JanPlan + "',JanReal='" + JanReal + "',FebPlan='" + FebPlan + "',FebReal='" + FebReal + "',MarPlan='" + MarPlan + "',MarReal='" + MarReal + "',AprPlan='" + AprPlan + "',AprReal='" + AprReal + "',MayPlan='" + MayPlan + "',MayReal='" + MayReal + "',JunPlan='" + JunPlan + "',JunReal='" + JunReal + "',JulPlan='" + JulPlan + "',JulReal='" + JulReal + "',AugPlan='" + AugPlan + "',AugReal='" + AugReal + "',SepPlan='" + SepPlan + "',SepReal='" + SepReal + "',OctPlan='" + OctPlan + "',OctReal='" + OctReal + "',NovPlan='" + NovPlan + "',NovReal='" + NovReal + "',DecPlan='" + DecPlan + "',DecReal='" + DecReal + "',MonthAve='" + MonthAve + "',RollYear='" + RollYear + "' where Operators='" + admin + "' and cYear='" + year + "' and ItemsId=48";
            ds = GetDataFromDatabase(sql);
            if (ds == null)
            {

                Console.Write("wrong=====!!收支差!!======wrong");
            }
        }
        else
        {
            Console.Write("wrong=====!!收支差!!======wrong");
        }
    }

    public DataSet GetDataFromDatabase(string sql)
    {
        ds = new DataSet();
        adapter = new SqlDataAdapter(sql, con);
        adapter.Fill(ds);
        return ds;
    }



    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}