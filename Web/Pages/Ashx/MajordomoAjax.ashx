<%@ WebHandler Language="C#" Class="MajordomoAjax" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;
using office.Utility;
using office.Bll;
using office.Model;


public class MajordomoAjax : IHttpHandler
{

   // SqlConnection con = new SqlConnection("Server=120.78.72.160;User Id=sa;Pwd=Gzbf-office_2018;DataBase=Cafe");
   // DataSet ds = new DataSet();
  //  SqlDataAdapter adapter = new SqlDataAdapter();
   // //JavaScriptSerializer jsS = new JavaScriptSerializer();
   // List<object> lists1 = new List<object>();
    //Series seriesObj = new Series();
   // string result = "";


    public void ProcessRequest(HttpContext context)
    {
     
        office.Bll.Department bllDepartment = new Department();
        string opType = context.Request["opType"].ToString();
        switch (opType)
        {


            case "GetMajordomo":
                {
                    context.Response.Write(bllDepartment.GetMajordomo());
                    break;
                }
           
        }
        context.Response.End();

    }
    
   
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}

