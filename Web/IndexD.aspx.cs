using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using bf.Utility;
//using bf.Dal;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie HCName = Request.Cookies["louserid"];
        HttpCookie HCPwd = Request.Cookies["louserpwd"];
        try
        {

            //UserAndRole userDA = new UserAndRole();
            //string[] userinfo = userDA.UserLogin(HCName.Value.ToString(), HCPwd.Value.ToString());
            //if (userinfo != null)
            //{
            //    if (userinfo[0] != null && userinfo[1] != null)
            //    {
            //        Session["userid"] = userinfo[0];
            //        Session["username"] = userinfo[1];
            //        Session["scode"] = userinfo[2];
            //        Session["sname"] = userinfo[3];
            //        Session["stype"] = userinfo[4];
            //        Session["usercode"] = userinfo[5];
            //        Session["dept"] = userinfo[6];
            //    }
            //}
        }
        catch
        {

        }
        finally
        {
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Mysys/Login.aspx");
    }
}