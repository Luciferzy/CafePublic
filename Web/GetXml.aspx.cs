using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using office.Utility;
using office.Bll;
using office.Model;
using System.Web.Security;


public partial class GetXml : System.Web.UI.Page
{

    private readonly int MAX_COUNT = 200;
    public const int ERROR = 0;
    public const int COMPANY = 1;
    public const int ADVERTISEMENT = 2;
    public const int SELF_NAVIGATION = 3;
    private NameValueCollection coll = null;
    private SqlDataBase da = new SqlDataBase();
    private string responseXml;
    public string UserId = System.Configuration.ConfigurationManager.AppSettings["WEBSERVICE_USER_ID"];

    protected void Page_Load(object sender, EventArgs e)
    {
        #region 初始化参数
        Response.Expires = 0;
        Response.Clear();

        if (Request.UrlReferrer == null)
        {
            Response.Write("非法访问！");
            Response.End();
        }

        getArguments();
        Response.ContentType = "text/xml;charset=UTF-8";
        Response.AddHeader("Cache-Control", "no-cache");
        Response.Write(@"<?xml version=""1.0"" encoding=""UTF-8""?>" + "\n");
        DataSet ds;
        //string responseStr = null;
        #endregion
        switch (coll["act"].ToLower()) { 
                //预算表
            case "getinfo":
                ds = this.GetInfo();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "initbudget":
                ds = this.InitBudget();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "getbudgetinfo":
                ds = this.GetBudgetInfo();//获取预算表信息
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "getcashinfo":
                ds = this.GetCashInfo();//获取现金推算表信息
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "getcashstatisticinfo":
                ds = this.GetCashStatisticInfo();//获取现金推算表信息
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "getcashstatisticinfoall":
                ds = this.GetCashStatisticInfoAll();//获取现金推算表信息
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "getcafechaseinfo":
                ds = this.GetCafeChaseInfo();//获取咖啡追赶表信息
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "getbudgetsetshow":
                ds = this.GetBudgetSetShow();//配置预算表信息
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "salebudgetshowoneyear":
                ds = this.SaleBudgetShowOneYear();//保存预算表信息
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "salebudgetshowtwoyear":
                ds = this.SaleBudgetShowTwoYear();//保存预算表信息
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "salebudgetinfooneyear":
                ds = this.SaleBudgetInfoOneYear();//保存预算表信息
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "salebudgetinfotwoyear":
                ds = this.SaleBudgetInfoTwoYear();//保存预算表信息
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "salecafeinfooneyear":
                ds = this.SaleCafeInfoOneYear();//保存现金推算表信息
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "salecafeinfotwoyear":
                ds = this.SaleCafeInfoTwoYear();//保存现金推算表信息
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "salecafechaseinfooneyear":
                ds = this.SaleCafeChaseInfoOneYear();//保存咖啡追赶表信息
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "salecafechaseinfotwoyear":
                ds = this.SaleCafeChaseInfoTwoYear();//保存咖啡追赶表信息
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "getdatabyyear":
                ds = this.GetDataByYear();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "getdatabyyear2":
                ds = this.GetDataByYear2();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "changebudget":
                ds = this.ChangeBudget();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            case "changecollect":
                ds = this.ChangeCollect();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            case "toltalcaculate":// 获取总支出合计值
                ds = this.ToltalCaculate();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
                //收支差
            case "shouzhicha":
                ds = this.ShouZhiCha();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            //提交预算表
            case "savebudget":
                ds = this.SaveBudget();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            case "c_editbudget":
                ds = this.C_EditBudget();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

                //最终提交预算表
            case "okbudget": //提交现金推算表
                ds = this.OkBudget();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;


                //喝咖啡追赶表
            case "getcafechase":
                ds = this.GetDataChase();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "getcafechase2":
                ds = this.GetDataChase2();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "changecafe":
                ds = this.ChangeCafe();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "changestagegoal":
                ds = this.ChangeStageGoal();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "changecaferest":
                ds = this.ChangeCafeRest();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            //现金推算表
            case "initcash":
                ds = this.InitCash();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            case "getcashdatabyyear":
                ds = this.GetCashDataByYear();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "getcashdatabyyear2":
                ds = this.GetCashDataByYear2();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "editcash": //修改现金推算表
                ds = this.EditCash();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "savecash": //提交现金推算表
                ds = this.SaveCash();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            case "c_editcash": //提交现金推算表
                ds = this.C_EditCash();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "okcash": //提交现金推算表
                ds = this.OkCash();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "c_editkey": //提交现金推算表
                ds = this.C_EditKey();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            //关键指标追赶表
            case "initkey":
                ds = this.InitKey();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            case "getkeydatabyyear":
                ds = this.GetKeyDataByYear();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "getkeydatabyyear2":
                ds = this.GetKeyDataByYear2();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            case "editkey": //修改现金推算表
                ds = this.EditKey();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "savekey": //提交现金推算表
                ds = this.SaveKey();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "okkey": //提交现金推算表
                ds = this.OkKey();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "edittarget": //提交现金推算表
                ds = this.EditTarget();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            case "editcyear_actualsalesplan": //提交现金推算表
                ds = this.EditcYear_ActualSalesPlan();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            case "editcyear_plansalesplan": //提交现金推算表
                ds = this.EditcYear_PlanSalesPlan();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;


            case "add_department": //新增独立单位
                ds = this.Add_Department();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "getdeptlist": //独立单位列表
                ds = this.Dept_List();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            case "deldept": //批量删除
                ds = this.Del_Dept();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
//总监管理搜索
            case "getdeptsearch":
                ds = this.GetDeptSearch();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

                //固定资产
            case "initfixedassets":
                ds = this.InitFixedAssets();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "add_fixedassets": //新增独立单位
                ds = this.Add_FixedAssets();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            case "initwages":
                ds = this.InitWages();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;



            case "getwagesdatabyyear":
                ds = this.GetWagesDataByYear();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "getwagesdatabyyear2":
                ds = this.GetWagesDataByYear2();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "editwages": //修改现金推算表
                ds = this.EditWages();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "savewages": //提交现金推算表
                ds = this.SaveWages();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            case "c_editwages": //提交现金推算表
                ds = this.C_EditWages();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "okwages": //提交现金推算表
                ds = this.OkWages();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;

            case "add_wages": //新增独立单位
                ds = this.Add_Wages();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;



             //获取菜单栏信息
            case "getsidebarinfo":
                ds = this.GetSideBarInfo();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            //获取菜单栏信息
            case "getsidebarinfonew":
                ds = this.GetSideBarInfoNew();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "getsidebarinfo2":
                ds = this.GetSideBarInfo2();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
            case "getmenu":
                ds = this.GetMenu();
                this.responseXml = ds.GetXml();
                Response.Write(this.responseXml);
                break;
        }
       
    }
    /// <summary>
    /// 获取用户名和密码
    /// </summary>
    public DataSet GetSideBarInfo() {

        var children = coll["children"];
        office.Bll.SideBar bllcom = new office.Bll.SideBar();
        return bllcom.GetSideBarInfo(children);
    }

    /// <summary>
    /// 获取用户名和密码
    /// </summary>
    public DataSet GetSideBarInfoNew()
    {

        string membername = coll["membername"];
        int Grade = Convert.ToInt32(coll["grade"]);
        office.Bll.SideBar bllcom = new office.Bll.SideBar();
        return bllcom.GetSideBarInfoNew(membername, Grade);
    }

    public DataSet GetSideBarInfo2()
    {

        var membername = coll["membername"];
        office.Bll.SideBar bllcom = new office.Bll.SideBar();
        return bllcom.GetSideBarInfo2(membername);
    }

    public DataSet GetMenu() {
        var orders = coll["orders"];
        office.Bll.SideBar bllcom = new office.Bll.SideBar();
        return bllcom.GetMenu(orders);
    }

    /// <summary>
    /// 获取用户名和密码
    /// </summary>
    /// <returns></returns>
    public DataSet GetInfo()
    {
       
        var MbrName = coll["mbrName"];
       
       
        office.Bll.Budget bllcom = new office.Bll.Budget();
        return bllcom.GetInfo(MbrName);
    }
    /// <summary>
    /// 初始化表格数据
    /// </summary>
    /// <returns></returns>
    public DataSet InitBudget() {
        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Budget bllcom = new office.Bll.Budget();
        return bllcom.InitBudget(mname,year);
    }

    /// <summary>
    /// 获取预算表信息
    /// </summary>
    /// <returns></returns>
    public DataSet GetBudgetInfo()
    {
        #region 初始化基本信息
        ListBudgetEntity baseEntity = new ListBudgetEntity();
        baseEntity.UserCode = coll["UserCode"];
        baseEntity.YearS = Convert.ToInt32(coll["YearS"]);
        baseEntity.YearE = Convert.ToInt32(coll["YearE"]);
        #endregion
        office.Bll.Budget bllcom = new office.Bll.Budget();
        return bllcom.GetBudgetInfo(baseEntity);
    }

    /// <summary>
    /// 获取现金推算表信息
    /// </summary>
    /// <returns></returns>
    public DataSet GetCashInfo()
    {
        #region 初始化基本信息
        ListCafeEntity baseEntity = new ListCafeEntity();
        baseEntity.UserCode = coll["UserCode"];
        baseEntity.YearS = Convert.ToInt32(coll["YearS"]);
        baseEntity.YearE = Convert.ToInt32(coll["YearE"]);
        #endregion
        office.Bll.Cash bllcom = new office.Bll.Cash();
        return bllcom.GetCashInfo(baseEntity);
    }

    /// <summary>
    /// 获取现金推算表信息
    /// </summary>
    /// <returns></returns>
    public DataSet GetCashStatisticInfo()
    {
        #region 初始化基本信息
        ListCafeEntity baseEntity = new ListCafeEntity();
        baseEntity.UserCode = coll["UserCode"];
        baseEntity.YearS = Convert.ToInt32(coll["YearS"]);
        baseEntity.YearE = Convert.ToInt32(coll["YearE"]);
        #endregion
        office.Bll.Cash bllcom = new office.Bll.Cash();
        return bllcom.GetCashStatisticInfo(baseEntity);
    }

    /// <summary>
    /// 获取现金推算表信息
    /// </summary>
    /// <returns></returns>
    public DataSet GetCashStatisticInfoAll()
    {
        #region 初始化基本信息
        ListCafeEntity baseEntity = new ListCafeEntity();
        baseEntity.UserCode = coll["UserCode"];
        baseEntity.YearS = Convert.ToInt32(coll["YearS"]);
        baseEntity.YearE = Convert.ToInt32(coll["YearE"]);
        #endregion
        office.Bll.Cash bllcom = new office.Bll.Cash();
        return bllcom.GetCashStatisticInfoAll(baseEntity);
    }

    /// <summary>
    /// 获取咖啡追赶表信息
    /// </summary>
    /// <returns></returns>
    public DataSet GetCafeChaseInfo()
    {
        #region 初始化基本信息
        ListCafeEntity baseEntity = new ListCafeEntity();
        baseEntity.UserCode = coll["UserCode"];
        baseEntity.YearS = Convert.ToInt32(coll["YearS"]);
        baseEntity.YearE = Convert.ToInt32(coll["YearE"]);
        #endregion
        office.Bll.CafeChase bllcom = new office.Bll.CafeChase();
        return bllcom.GetCafeChaseInfo(baseEntity);
    }

    /// <summary>
    /// 配置预算表信息
    /// </summary>
    /// <returns></returns>
    public DataSet GetBudgetSetShow()
    {
        #region 初始化基本信息
        ListBudgetEntity baseEntity = new ListBudgetEntity();
        baseEntity.UserCode = coll["UserCode"];
        baseEntity.YearS = Convert.ToInt32(coll["YearS"]);
        baseEntity.YearE = Convert.ToInt32(coll["YearE"]);
        #endregion
        office.Bll.Budget bllcom = new office.Bll.Budget();
        return bllcom.GetBudgetSetShow(baseEntity);
    }

    /// <summary>
    /// 保存配置信息
    /// </summary>
    /// <returns></returns>
    private DataSet SaleBudgetShowOneYear()
    {
        #region 初始化基本信息
        ListBudgetEntity baseEntity = new ListBudgetEntity();
        baseEntity.isJanPlan = Convert.ToInt32(coll["isJanPlan"]);
        baseEntity.isJanReal = Convert.ToInt32(coll["isJanReal"]);
        baseEntity.isFebPlan = Convert.ToInt32(coll["isFebPlan"]);
        baseEntity.isFebReal = Convert.ToInt32(coll["isFebReal"]);
        baseEntity.isMarPlan = Convert.ToInt32(coll["isMarPlan"]);
        baseEntity.isMarReal = Convert.ToInt32(coll["isMarReal"]);
        baseEntity.isAprPlan = Convert.ToInt32(coll["isAprPlan"]);
        baseEntity.isAprReal = Convert.ToInt32(coll["isAprReal"]);
        baseEntity.isMayPlan = Convert.ToInt32(coll["isMayPlan"]);
        baseEntity.isMayReal = Convert.ToInt32(coll["isMayReal"]);
        baseEntity.isJunPlan = Convert.ToInt32(coll["isJunPlan"]);
        baseEntity.isJunReal = Convert.ToInt32(coll["isJunReal"]);
        baseEntity.isJulPlan = Convert.ToInt32(coll["isJulPlan"]);
        baseEntity.isJulReal = Convert.ToInt32(coll["isJulReal"]);
        baseEntity.isAugPlan = Convert.ToInt32(coll["isAugPlan"]);
        baseEntity.isAugReal = Convert.ToInt32(coll["isAugReal"]);
        baseEntity.isSepPlan = Convert.ToInt32(coll["isSepPlan"]);
        baseEntity.isSepReal = Convert.ToInt32(coll["isSepReal"]);
        baseEntity.isOctPlan = Convert.ToInt32(coll["isOctPlan"]);
        baseEntity.isOctReal = Convert.ToInt32(coll["isOctReal"]);
        baseEntity.isNovPlan = Convert.ToInt32(coll["isNovPlan"]);
        baseEntity.isNovReal = Convert.ToInt32(coll["isNovReal"]);
        baseEntity.isDecPlan = Convert.ToInt32(coll["isDecPlan"]);
        baseEntity.isDecReal = Convert.ToInt32(coll["isDecReal"]);   
        baseEntity.Operators = coll["UserCode"];
        baseEntity.YearS = Convert.ToInt32(coll["YearS"]);
        baseEntity.YearE = Convert.ToInt32(coll["YearE"]);

        #endregion

        office.Bll.Budget bllcom = new office.Bll.Budget();
        int state = bllcom.SaleBudgetShowOneYear(baseEntity);
        string strState;
        if (state == 1)
        {
            strState = "保存成功！";
        }
        else
        {
            strState = "保存失败！";
        }

        DataSet ds = new DataSet("SHOPXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    /// <summary>
    /// 保存配置信息
    /// </summary>
    /// <returns></returns>
    private DataSet SaleBudgetShowTwoYear()
    {
        #region 初始化基本信息
        ListBudgetEntity baseEntity = new ListBudgetEntity();
        baseEntity.isJanPlan = Convert.ToInt32(coll["isJanPlan"]);
        baseEntity.isJanReal = Convert.ToInt32(coll["isJanReal"]);
        baseEntity.isFebPlan = Convert.ToInt32(coll["isFebPlan"]);
        baseEntity.isFebReal = Convert.ToInt32(coll["isFebReal"]);
        baseEntity.isMarPlan = Convert.ToInt32(coll["isMarPlan"]);
        baseEntity.isMarReal = Convert.ToInt32(coll["isMarReal"]);
        baseEntity.isAprPlan = Convert.ToInt32(coll["isAprPlan"]);
        baseEntity.isAprReal = Convert.ToInt32(coll["isAprReal"]);
        baseEntity.isMayPlan = Convert.ToInt32(coll["isMayPlan"]);
        baseEntity.isMayReal = Convert.ToInt32(coll["isMayReal"]);
        baseEntity.isJunPlan = Convert.ToInt32(coll["isJunPlan"]);
        baseEntity.isJunReal = Convert.ToInt32(coll["isJunReal"]);
        baseEntity.isJulPlan = Convert.ToInt32(coll["isJulPlan"]);
        baseEntity.isJulReal = Convert.ToInt32(coll["isJulReal"]);
        baseEntity.isAugPlan = Convert.ToInt32(coll["isAugPlan"]);
        baseEntity.isAugReal = Convert.ToInt32(coll["isAugReal"]);
        baseEntity.isSepPlan = Convert.ToInt32(coll["isSepPlan"]);
        baseEntity.isSepReal = Convert.ToInt32(coll["isSepReal"]);
        baseEntity.isOctPlan = Convert.ToInt32(coll["isOctPlan"]);
        baseEntity.isOctReal = Convert.ToInt32(coll["isOctReal"]);
        baseEntity.isNovPlan = Convert.ToInt32(coll["isNovPlan"]);
        baseEntity.isNovReal = Convert.ToInt32(coll["isNovReal"]);
        baseEntity.isDecPlan = Convert.ToInt32(coll["isDecPlan"]);
        baseEntity.isDecReal = Convert.ToInt32(coll["isDecReal"]);
        baseEntity.kisJanPlan = Convert.ToInt32(coll["kisJanPlan"]);
        baseEntity.kisJanReal = Convert.ToInt32(coll["kisJanReal"]);
        baseEntity.kisFebPlan = Convert.ToInt32(coll["kisFebPlan"]);
        baseEntity.kisFebReal = Convert.ToInt32(coll["kisFebReal"]);
        baseEntity.kisMarPlan = Convert.ToInt32(coll["kisMarPlan"]);
        baseEntity.kisMarReal = Convert.ToInt32(coll["kisMarReal"]);
        baseEntity.kisAprPlan = Convert.ToInt32(coll["kisAprPlan"]);
        baseEntity.kisAprReal = Convert.ToInt32(coll["kisAprReal"]);
        baseEntity.kisMayPlan = Convert.ToInt32(coll["kisMayPlan"]);
        baseEntity.kisMayReal = Convert.ToInt32(coll["kisMayReal"]);
        baseEntity.kisJunPlan = Convert.ToInt32(coll["kisJunPlan"]);
        baseEntity.kisJunReal = Convert.ToInt32(coll["kisJunReal"]);
        baseEntity.kisJulPlan = Convert.ToInt32(coll["kisJulPlan"]);
        baseEntity.kisJulReal = Convert.ToInt32(coll["kisJulReal"]);
        baseEntity.kisAugPlan = Convert.ToInt32(coll["kisAugPlan"]);
        baseEntity.kisAugReal = Convert.ToInt32(coll["kisAugReal"]);
        baseEntity.kisSepPlan = Convert.ToInt32(coll["kisSepPlan"]);
        baseEntity.kisSepReal = Convert.ToInt32(coll["kisSepReal"]);
        baseEntity.kisOctPlan = Convert.ToInt32(coll["kisOctPlan"]);
        baseEntity.kisOctReal = Convert.ToInt32(coll["kisOctReal"]);
        baseEntity.kisNovPlan = Convert.ToInt32(coll["kisNovPlan"]);
        baseEntity.kisNovReal = Convert.ToInt32(coll["kisNovReal"]);
        baseEntity.kisDecPlan = Convert.ToInt32(coll["kisDecPlan"]);
        baseEntity.kisDecReal = Convert.ToInt32(coll["kisDecReal"]);
        baseEntity.Operators = coll["UserCode"];
        baseEntity.YearS = Convert.ToInt32(coll["YearS"]);
        baseEntity.YearE = Convert.ToInt32(coll["YearE"]);

        #endregion

        office.Bll.Budget bllcom = new office.Bll.Budget();
        int state = bllcom.SaleBudgetShowTwoYear(baseEntity);
        string strState;
        if (state == 1)
        {
            strState = "保存成功！";
        }
        else
        {
            strState = "保存失败！";
        }

        DataSet ds = new DataSet("SHOPXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    /// <summary>
    /// 保存收支预算表信息
    /// </summary>
    /// <returns></returns>
    private DataSet SaleBudgetInfoOneYear()
    {
        #region 初始化基本信息
        ListBudgetEntity baseEntity = new ListBudgetEntity();
        baseEntity.JanPlan = coll["iJanPlan"];
        baseEntity.JanReal = coll["iJanReal"];
        baseEntity.FebPlan = coll["iFebPlan"];
        baseEntity.FebReal = coll["iFebReal"];
        baseEntity.MarPlan = coll["iMarPlan"];
        baseEntity.MarReal = coll["iMarReal"];
        baseEntity.AprPlan = coll["iAprPlan"];
        baseEntity.AprReal = coll["iAprReal"];
        baseEntity.MayPlan = coll["iMayPlan"];
        baseEntity.MayReal = coll["iMayReal"];
        baseEntity.JunPlan = coll["iJunPlan"];
        baseEntity.JunReal = coll["iJunReal"];
        baseEntity.JulPlan = coll["iJulPlan"];
        baseEntity.JulReal = coll["iJulReal"];
        baseEntity.AugPlan = coll["iAugPlan"];
        baseEntity.AugReal = coll["iAugReal"];
        baseEntity.SepPlan = coll["iSepPlan"];
        baseEntity.SepReal = coll["iSepReal"];
        baseEntity.OctPlan = coll["iOctPlan"];
        baseEntity.OctReal = coll["iOctReal"];
        baseEntity.NovPlan = coll["iNovPlan"];
        baseEntity.NovReal = coll["iNovReal"];
        baseEntity.DecPlan = coll["iDecPlan"];
        baseEntity.DecReal = coll["iDecReal"];
        baseEntity.sId = coll["iId"];
        baseEntity.Operators = coll["UserCode"];
        baseEntity.YearS = Convert.ToInt32(coll["YearS"]);
        baseEntity.YearE = Convert.ToInt32(coll["YearE"]);

        #endregion

        office.Bll.Budget bllcom = new office.Bll.Budget();
        int state = bllcom.SaleBudgetInfoOneYear(baseEntity);
        string strState;
        if (state == 1)
        {
            strState = "保存成功！";
        }
        else
        {
            strState = "保存失败！";
        }

        DataSet ds = new DataSet("SHOPXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    /// <summary>
    /// 保存收支预算表信息
    /// </summary>
    /// <returns></returns>
    private DataSet SaleBudgetInfoTwoYear()
    {
        #region 初始化基本信息
        ListBudgetEntity baseEntity = new ListBudgetEntity();
        baseEntity.JanPlan = coll["iJanPlan"];
        baseEntity.JanReal = coll["iJanReal"];
        baseEntity.FebPlan = coll["iFebPlan"];
        baseEntity.FebReal = coll["iFebReal"];
        baseEntity.MarPlan = coll["iMarPlan"];
        baseEntity.MarReal = coll["iMarReal"];
        baseEntity.AprPlan = coll["iAprPlan"];
        baseEntity.AprReal = coll["iAprReal"];
        baseEntity.MayPlan = coll["iMayPlan"];
        baseEntity.MayReal = coll["iMayReal"];
        baseEntity.JunPlan = coll["iJunPlan"];
        baseEntity.JunReal = coll["iJunReal"];
        baseEntity.JulPlan = coll["iJulPlan"];
        baseEntity.JulReal = coll["iJulReal"];
        baseEntity.AugPlan = coll["iAugPlan"];
        baseEntity.AugReal = coll["iAugReal"];
        baseEntity.SepPlan = coll["iSepPlan"];
        baseEntity.SepReal = coll["iSepReal"];
        baseEntity.OctPlan = coll["iOctPlan"];
        baseEntity.OctReal = coll["iOctReal"];
        baseEntity.NovPlan = coll["iNovPlan"];
        baseEntity.NovReal = coll["iNovReal"];
        baseEntity.DecPlan = coll["iDecPlan"];
        baseEntity.DecReal = coll["iDecReal"];
        baseEntity.kJanPlan = coll["kiJanPlan"];
        baseEntity.kJanReal = coll["kiJanReal"];
        baseEntity.kFebPlan = coll["kiFebPlan"];
        baseEntity.kFebReal = coll["kiFebReal"];
        baseEntity.kMarPlan = coll["kiMarPlan"];
        baseEntity.kMarReal = coll["kiMarReal"];
        baseEntity.kAprPlan = coll["kiAprPlan"];
        baseEntity.kAprReal = coll["kiAprReal"];
        baseEntity.kMayPlan = coll["kiMayPlan"];
        baseEntity.kMayReal = coll["kiMayReal"];
        baseEntity.kJunPlan = coll["kiJunPlan"];
        baseEntity.kJunReal = coll["kiJunReal"];
        baseEntity.kJulPlan = coll["kiJulPlan"];
        baseEntity.kJulReal = coll["kiJulReal"];
        baseEntity.kAugPlan = coll["kiAugPlan"];
        baseEntity.kAugReal = coll["kiAugReal"];
        baseEntity.kSepPlan = coll["kiSepPlan"];
        baseEntity.kSepReal = coll["kiSepReal"];
        baseEntity.kOctPlan = coll["kiOctPlan"];
        baseEntity.kOctReal = coll["kiOctReal"];
        baseEntity.kNovPlan = coll["kiNovPlan"];
        baseEntity.kNovReal = coll["kiNovReal"];
        baseEntity.kDecPlan = coll["kiDecPlan"];
        baseEntity.kDecReal = coll["kiDecReal"];
        baseEntity.sId = coll["iId"];
        baseEntity.kId = coll["kiId"];
        baseEntity.Operators = coll["UserCode"];
        baseEntity.YearS = Convert.ToInt32(coll["YearS"]);
        baseEntity.YearE = Convert.ToInt32(coll["YearE"]);

        #endregion

        office.Bll.Budget bllcom = new office.Bll.Budget();
        int state = bllcom.SaleBudgetInfoTwoYear(baseEntity);
        string strState;
        if (state == 1)
        {
            strState = "保存成功！";
        }
        else
        {
            strState = "保存失败！";
        }

        DataSet ds = new DataSet("SHOPXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    /// <summary>
    /// 保存现金推算表信息
    /// </summary>
    /// <returns></returns>
    private DataSet SaleCafeInfoOneYear()
    {
        #region 初始化基本信息
        ListCafeEntity baseEntity = new ListCafeEntity();
        baseEntity.JanPlan = coll["iJanPlan"];
        baseEntity.FebPlan = coll["iFebPlan"];
        baseEntity.MarPlan = coll["iMarPlan"];
        baseEntity.AprPlan = coll["iAprPlan"];
        baseEntity.MayPlan = coll["iMayPlan"];
        baseEntity.JunPlan = coll["iJunPlan"];
        baseEntity.JulPlan = coll["iJulPlan"];
        baseEntity.AugPlan = coll["iAugPlan"];
        baseEntity.SepPlan = coll["iSepPlan"];
        baseEntity.OctPlan = coll["iOctPlan"];
        baseEntity.NovPlan = coll["iNovPlan"];
        baseEntity.DecPlan = coll["iDecPlan"];
        baseEntity.sId = coll["iId"];
        baseEntity.Operators = coll["UserCode"];
        baseEntity.YearS = Convert.ToInt32(coll["YearS"]);
        baseEntity.YearE = Convert.ToInt32(coll["YearE"]);

        #endregion

        office.Bll.Cash bllcom = new office.Bll.Cash();
        int state = bllcom.SaleCafeInfoOneYear(baseEntity);
        string strState;
        if (state == 1)
        {
            strState = "保存成功！";
        }
        else
        {
            strState = "保存失败！";
        }

        DataSet ds = new DataSet("SHOPXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    /// <summary>
    /// 保存收支预算表信息
    /// </summary>
    /// <returns></returns>
    private DataSet SaleCafeInfoTwoYear()
    {
        #region 初始化基本信息
        ListCafeEntity baseEntity = new ListCafeEntity();
        baseEntity.JanPlan = coll["iJanPlan"];
        baseEntity.FebPlan = coll["iFebPlan"];
        baseEntity.MarPlan = coll["iMarPlan"];
        baseEntity.AprPlan = coll["iAprPlan"];
        baseEntity.MayPlan = coll["iMayPlan"];
        baseEntity.JunPlan = coll["iJunPlan"];
        baseEntity.JulPlan = coll["iJulPlan"];
        baseEntity.AugPlan = coll["iAugPlan"];
        baseEntity.SepPlan = coll["iSepPlan"];
        baseEntity.OctPlan = coll["iOctPlan"];
        baseEntity.NovPlan = coll["iNovPlan"];
        baseEntity.DecPlan = coll["iDecPlan"];
        baseEntity.kJanPlan = coll["kiJanPlan"];
        baseEntity.kFebPlan = coll["kiFebPlan"];
        baseEntity.kMarPlan = coll["kiMarPlan"];
        baseEntity.kAprPlan = coll["kiAprPlan"];
        baseEntity.kMayPlan = coll["kiMayPlan"];
        baseEntity.kJunPlan = coll["kiJunPlan"];
        baseEntity.kJulPlan = coll["kiJulPlan"];
        baseEntity.kAugPlan = coll["kiAugPlan"];
        baseEntity.kSepPlan = coll["kiSepPlan"];
        baseEntity.kOctPlan = coll["kiOctPlan"];
        baseEntity.kNovPlan = coll["kiNovPlan"];
        baseEntity.kDecPlan = coll["kiDecPlan"];
        baseEntity.sId = coll["iId"];
        baseEntity.kId = coll["kiId"];
        baseEntity.Operators = coll["UserCode"];
        baseEntity.YearS = Convert.ToInt32(coll["YearS"]);
        baseEntity.YearE = Convert.ToInt32(coll["YearE"]);

        #endregion

        office.Bll.Cash bllcom = new office.Bll.Cash();
        int state = bllcom.SaleCafeInfoTwoYear(baseEntity);
        string strState;
        if (state == 1)
        {
            strState = "保存成功！";
        }
        else
        {
            strState = "保存失败！";
        }

        DataSet ds = new DataSet("SHOPXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    /// <summary>
    /// 保存咖啡追赶表信息
    /// </summary>
    /// <returns></returns>
    private DataSet SaleCafeChaseInfoOneYear()
    {
        #region 初始化基本信息
        ListCafeEntity baseEntity = new ListCafeEntity();
        baseEntity.cType = Convert.ToInt32(coll["ctype"]);
        baseEntity.Operators = coll["UserCode"];
        if (Convert.ToInt32(coll["ctype"]) == 1)
        {
            baseEntity.YearS = Convert.ToInt32(coll["YearS"]);
        }
        else {
            baseEntity.YearS = Convert.ToInt32(coll["YearE"]);
        }
        baseEntity.YearE = Convert.ToInt32(coll["YearE"]);
        baseEntity.Measure = coll["Measure"];
        baseEntity.cYear_Target =Convert.ToInt32(coll["cYear_Target"]);
        baseEntity.sId = coll["iId"];

        #endregion

        office.Bll.CafeChase bllcom = new office.Bll.CafeChase();
        int state = bllcom.SaleCafeChaseInfoOneYear(baseEntity);
        string strState;
        if (state == 1)
        {
            strState = "保存成功！";
        }
        else
        {
            strState = "保存失败！";
        }

        DataSet ds = new DataSet("SHOPXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    /// <summary>
    /// 保存咖啡追赶表信息
    /// </summary>
    /// <returns></returns>
    private DataSet SaleCafeChaseInfoTwoYear()
    {
        #region 初始化基本信息
        ListCafeEntity baseEntity = new ListCafeEntity();
        baseEntity.Operators = coll["UserCode"];
        baseEntity.YearS = Convert.ToInt32(coll["YearS"]);
        baseEntity.YearE = Convert.ToInt32(coll["YearE"]);
        baseEntity.Measure = coll["Measure"];
        baseEntity.kMeasure = coll["kMeasure"];
        baseEntity.cYear_Target = Convert.ToInt32(coll["cYear_Target"]);
        baseEntity.kcYear_Target = Convert.ToInt32(coll["kcYear_Target"]);
        baseEntity.sId = coll["iId"];
        baseEntity.ksId = coll["kiId"];

        #endregion

        office.Bll.CafeChase bllcom = new office.Bll.CafeChase();
        int state = bllcom.SaleCafeChaseInfoTwoYear(baseEntity);
        string strState;
        if (state == 1)
        {
            strState = "保存成功！";
        }
        else
        {
            strState = "保存失败！";
        }

        DataSet ds = new DataSet("SHOPXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    /// <summary>
    /// 通过传入年份查询
    /// </summary>
    /// <returns></returns>
    public DataSet GetDataByYear() {
        string year = coll["year"];
        string mname = coll["mname"];
            office.Bll.Budget bllcom = new office.Bll.Budget();
            return bllcom.GetDataByYear(year,mname);
    }

    public DataSet GetDataByYear2() {
        string year = coll["year"];
        string year2 = coll["year2"];
        string mname = coll["mname"];
        office.Bll.Budget bllcom = new office.Bll.Budget();
        return bllcom.GetDataByYear2(year,year2, mname);
    }

    /// <summary>
    /// 改变预算表中的值
    /// </summary>
    /// <returns></returns>
    public DataSet ChangeBudget() {

        string itemid = coll["itemid"];
        string value = coll["value"];
        string year = coll["year"];
        string mname = coll["mname"];
        string head = coll["head"];
        office.Bll.Budget bllcom = new office.Bll.Budget();
        return bllcom.ChangeBudget(itemid, value, year, mname,head);
    }

    /// <summary>
    /// 更新预算表合计值
    /// </summary>
    /// <returns></returns>
    public DataSet ChangeCollect() {

        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Budget bllcom = new office.Bll.Budget();
        int state = bllcom.ChangeCollect(year, mname);
        string strState;
        if (state == 1)
        {
            strState = "更新预算表成功！";
        }
        else
        {
            strState = "更新预算表失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    
    }


    /// <summary>
    ///  获取总支出合计值
    /// </summary>
    /// <returns></returns>

    public DataSet ToltalCaculate()
    {

        string year = coll["year"];
        office.Bll.Budget bllcom = new office.Bll.Budget();
        return bllcom.ToltalCaculate(year);

    }

    public DataSet GetDataChase()
    {
        string year = coll["year"];
        string mname = coll["mname"];
        office.Bll.CafeChase bllcom = new office.Bll.CafeChase();
        return bllcom.GetCafeChase(year, mname);
    }
    public DataSet GetDataChase2()
    {
        string year = coll["year"];
        string year2 = coll["year2"];
        string mname = coll["mname"];
        office.Bll.CafeChase bllcom = new office.Bll.CafeChase();
        return bllcom.GetCafeChase2(year,year2, mname);
    }

    //取得收支差
    public DataSet ShouZhiCha()
    {
        string year = coll["year"];
        string mname = coll["mname"];
        office.Bll.Budget bllcom = new office.Bll.Budget();
        return bllcom.ShouZhiCha(year, mname);
    }

    /// <summary>
    /// 提交预算表
    /// </summary>
    /// <returns></returns>
    private DataSet SaveBudget()
    {

        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Budget bllcom = new office.Bll.Budget();
        int state = bllcom.SaveBudget(year, mname);
        string strState;
        if (state == 1)
        {
            strState = "提交预算表成功！";
        }
        else
        {
            strState = "提交提交预算表成功表失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    //重改预算表

    private DataSet C_EditBudget()
    {

        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Budget bllcom = new office.Bll.Budget();
        int state = bllcom.C_EditBudget(year, mname);
        string strState;
        if (state == 1)
        {
            strState = "返回预算表成功！";
        }
        else
        {
            strState = "返回预算表失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    //最终提交预算表
    private DataSet OkBudget()
    {

        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Budget bllcom = new office.Bll.Budget();
        int state = bllcom.OkBudget(year, mname);
        string strState;
        if (state == 1)
        {
            strState = "提交预算表成功！";
        }
        else
        {
            strState = "提交预算表失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    /// <summary>
    /// 初始化现金推算表格数据
    /// </summary>
    /// <returns></returns>
    public DataSet InitCash()
    {
        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Cash bllcom = new office.Bll.Cash();
        return bllcom.InitCash(mname, year);
    }


    /// <summary>
    /// 通过传入年份查询
    /// </summary>
    /// <returns></returns>
    public DataSet GetCashDataByYear()
    {
        string year = coll["year"];
        string mname = coll["mname"];
        office.Bll.Cash bllcom = new office.Bll.Cash();
        return bllcom.GetCashDataByYear(year, mname);
    }

    public DataSet GetCashDataByYear2()
    {
        string year = coll["year"];
        string year2 = coll["year2"];
        string mname = coll["mname"];
        office.Bll.Cash bllcom = new office.Bll.Cash();
        return bllcom.GetCashDataByYear2(year, year2, mname);
    }

    /// <summary>
    /// 编辑现金推算表
    /// </summary>
    /// <returns></returns>
    private DataSet EditCash()
    {
        #region 初始化基本信息
        ListCashEntity cashEntity = new ListCashEntity();
        cashEntity.IdSave = coll["IdSave"];
        cashEntity.JanPlanSave = coll["JanPlanSave"];
        cashEntity.FebPlanSave = coll["FebPlanSave"];
        cashEntity.MarPlanSave = coll["MarPlanSave"];
        cashEntity.AprPlanSave = coll["AprPlanSave"];
        cashEntity.MayPlanSave = coll["MayPlanSave"];
        cashEntity.JunPlanSave = coll["JunPlanSave"];
        cashEntity.JulPlanSave = coll["JulPlanSave"];
        cashEntity.AugPlanSave = coll["AugPlanSave"];
        cashEntity.SepPlanSave = coll["SepPlanSave"];
        cashEntity.OctPlanSave = coll["OctPlanSave"];
        cashEntity.NovPlanSave = coll["NovPlanSave"];
        cashEntity.DecPlanSave = coll["DecPlanSave"];
        #endregion


        office.Bll.Cash bllcom = new office.Bll.Cash();
        int state = bllcom.EditCash(cashEntity);
        string strState;
        //int strState;
        if (state == 1)
        {
            strState = "修改成功！";
            // strState = state;
        }
        else
        {
            strState = "修改失败！";
            //strState = state;
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }


    /// <summary>
    /// 新增现金推算表
    /// </summary>
    /// <returns></returns>
    private DataSet SaveCash()
    {

        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Cash bllcom = new office.Bll.Cash();
        int state = bllcom.SaveCash(year, mname);
        string strState;
        if (state == 1)
        {
            strState = "提交现金推算表成功！";
        }
        else
        {
            strState = "提交现金推算表失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    /// <summary>
    /// 新增现金推算表
    /// </summary>
    /// <returns></returns>
    private DataSet OkKey()
    {

        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Key bllcom = new office.Bll.Key();
        int state = bllcom.OkKey(year, mname);
        string strState;
        if (state == 1)
        {
            strState = "提交关键指标追赶表成功！";
        }
        else
        {
            strState = "提交关键指标追赶表失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    /// <summary>
    /// 新增现金推算表
    /// </summary>
    /// <returns></returns>
    private DataSet C_EditCash()
    {

        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Cash bllcom = new office.Bll.Cash();
        int state = bllcom.C_EditCash(year, mname);
        string strState;
        if (state == 1)
        {
            strState = "重修改现金推算表提交成功！";
        }
        else
        {
            strState = "重修改现金推算表提交失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }



    /// <summary>
    /// 新增现金推算表
    /// </summary>
    /// <returns></returns>
    private DataSet C_EditKey()
    {

        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Key bllcom = new office.Bll.Key();
        int state = bllcom.C_EditKey(year, mname);
        string strState;
        if (state == 1)
        {
            strState = "重修改关键指标追赶表提交成功！";
        }
        else
        {
            strState = "重修改关键指标追赶表提交失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }


    /// <summary>
    /// 新增现金推算表
    /// </summary>
    /// <returns></returns>
    private DataSet OkCash()
    {

        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Cash bllcom = new office.Bll.Cash();
        int state = bllcom.OkCash(year, mname);
        string strState;
        if (state == 1)
        {
            strState = "确认现金推算表成功！";
        }
        else
        {
            strState = "确认现金推算表失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }


    /// <summary>
    /// 初始化关键指标追赶表数据
    /// </summary>
    /// <returns></returns>
    public DataSet InitKey()
    {
        string mname = coll["mname"];
        string year = coll["year"];
        string year2 = coll["year2"];
        office.Bll.Key bllcom = new office.Bll.Key();
        return bllcom.InitKey(mname, year, year2);
    }


    /// <summary>
    /// 通过传入年份查询
    /// </summary>
    /// <returns></returns>
    public DataSet GetKeyDataByYear()
    {
        string year = coll["year"];
        string year2 = coll["year2"];
        string mname = coll["mname"];
        office.Bll.Key bllcom = new office.Bll.Key();
        return bllcom.GetKeyDataByYear(year,year2, mname);
    }

    public DataSet GetKeyDataByYear2()
    {
        string year = coll["year"];
        string year2 = coll["year2"];
        string mname = coll["mname"];
        office.Bll.Key bllcom = new office.Bll.Key();
        return bllcom.GetKeyDataByYear2(year, year2, mname);
    }


    /// <summary>
    /// 编辑现金推算表
    /// </summary>
    /// <returns></returns>
    private DataSet EditKey()
    {
        #region 初始化基本信息
        ListKeyEntity keyEntity = new ListKeyEntity();
        keyEntity.IdSave = coll["IdSave"];
        keyEntity.cYear_ActualSalesPlanSave = coll["cYear_ActualSalesPlanSave"];
        keyEntity.cYear_ActualSalesRealSave = coll["cYear_ActualSalesRealSave"];
        keyEntity.cYear_PlanSalesPlanSave = coll["cYear_PlanSalesPlanSave"];
        keyEntity.cYear_PlanSalesRealSave = coll["cYear_PlanSalesRealSave"];
        keyEntity.cYear_CompletionRatioPlanSave = coll["cYear_CompletionRatioPlanSave"];
        keyEntity.cYear_CompletionRatioRealSave = coll["cYear_CompletionRatioRealSave"];
        keyEntity.SketchSave = coll["SketchSave"];
        keyEntity.cYear_targetSave = coll["cYear_targetSave"];


        #endregion


        office.Bll.Key bllcom = new office.Bll.Key();
        int state = bllcom.EditKey(keyEntity);
        string strState;
        //int strState;
        if (state == 1)
        {
            strState = "修改成功！";
            // strState = state;
        }
        else
        {
            strState = "修改失败！";
            //strState = state;
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }


    /// <summary>
    /// 新增现金推算表
    /// </summary>
    /// <returns></returns>
    private DataSet SaveKey()
    {

        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Key bllcom = new office.Bll.Key();
        int state = bllcom.SaveKey(year, mname);
        string strState;
        if (state == 1)
        {
            strState = "提交关键指标追赶表成功！";
        }
        else
        {
            strState = "提交关键指标追赶表失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }


    /// <summary>
    /// 新增现金推算表
    /// </summary>
    /// <returns></returns>
    private DataSet EditTarget()
    {

        string mname = coll["mname"];
        string year = coll["year"];
        string cYear_target = coll["cYear_target"];
        office.Bll.Key bllcom = new office.Bll.Key();
        int state = bllcom.EditTarget(year, mname, cYear_target);
        string strState;
        if (state == 1)
        {
            strState = "目标修改成功！";
        }
        else
        {
            strState = "目标修改失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    /// <summary>
    /// 新增现金推算表
    /// </summary>
    /// <returns></returns>
    private DataSet EditcYear_ActualSalesPlan()
    {

        string id = coll["id"];
        string cYear_ActualSalesPlan = coll["cYear_ActualSalesPlan"];

        office.Bll.Key bllcom = new office.Bll.Key();
        int state = bllcom.EditcYear_ActualSalesPlan(id, cYear_ActualSalesPlan);
        string strState;
        if (state == 1)
        {
            strState = "实际销售额修改成功！";
        }
        else
        {
            strState = "实际销售额修改失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }


    /// <summary>
    /// 新增现金推算表
    /// </summary>
    /// <returns></returns>
    private DataSet EditcYear_PlanSalesPlan()
    {

        string id = coll["id"];
        string cYear_PlanSalesPlan = coll["cYear_PlanSalesPlan"];

        office.Bll.Key bllcom = new office.Bll.Key();
        int state = bllcom.EditcYear_PlanSalesPlan(id, cYear_PlanSalesPlan);
        string strState;
        if (state == 1)
        {
            strState = "计划销售额修改成功！";
        }
        else
        {
            strState = "计划销售额修改失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

   /// <summary>
    /// 修改喝咖啡追赶表BCD列
    /// </summary>
    /// <returns></returns>
    public DataSet ChangeCafe()
    {

        string month = coll["month"];
        string value = coll["value"];
        string year = coll["year"];
        string mname = coll["mname"];
        string head = coll["head"];
        office.Bll.CafeChase bllcom = new office.Bll.CafeChase();
        return bllcom.ChangeCafe(year, mname, value, head, month);
    }


    public DataSet ChangeStageGoal() {
        ListCafeEntity entity = new ListCafeEntity();
        entity.sGoal = coll["sGoal"];
        entity.sGoal2 = coll["sGoal2"];
        entity.sGoal3 = coll["sGoal3"];
        entity.sGoal4 = coll["sGoal4"];
        entity.sGoal5 = coll["sGoal5"];
        entity.sGoal6 = coll["sGoal6"];
        entity.sGoal7 = coll["sGoal7"];
        entity.sGoal8 = coll["sGoal8"];
        entity.sGoal9 = coll["sGoal9"];
        entity.sGoal10 = coll["sGoal10"];
        entity.sGoal11 = coll["sGoal11"];
        entity.sGoal12 = coll["sGoal12"];
        entity.year=coll["year"];
        entity.mname=coll["mname"];
        entity.yearGoal=coll["yearGoal"];
        office.Bll.CafeChase bllcom = new CafeChase();
        return bllcom.ChangeStageGoal(entity);
    }

    public DataSet ChangeCafeRest() {
        ListCafeEntity entity = new ListCafeEntity();
        //按本年度原计划
        entity.oriPlan = coll["oriPlan"];
        entity.oriPlan2 = coll["oriPlan2"];
        entity.oriPlan3 = coll["oriPlan3"];
        entity.oriPlan4 = coll["oriPlan4"];
        entity.oriPlan5 = coll["oriPlan5"];
        entity.oriPlan6 = coll["oriPlan6"];
        entity.oriPlan7 = coll["oriPlan7"];
        entity.oriPlan8 = coll["oriPlan8"];
        entity.oriPlan9 = coll["oriPlan9"];
        entity.oriPlan10 = coll["oriPlan10"];
        entity.oriPlan11 = coll["oriPlan11"];
        entity.oriPlan12 = coll["oriPlan12"];
        //差额
        entity.balance = coll["balance"];
        entity.balance2 = coll["balance2"];
        entity.balance3 = coll["balance3"];
        entity.balance4 = coll["balance4"];
        entity.balance5 = coll["balance5"];
        entity.balance6 = coll["balance6"];
        entity.balance7 = coll["balance7"];
        entity.balance8 = coll["balance8"];
        entity.balance9 = coll["balance9"];
        entity.balance10 = coll["balance10"];
        entity.balance11 = coll["balance11"];
        entity.balance12 = coll["balance12"];
        //按本年度进度调整后
        entity.adjutsted = coll["adjutsted"];
        entity.adjutsted2 = coll["adjutsted2"];
        entity.adjutsted3 = coll["adjutsted3"];
        entity.adjutsted4 = coll["adjutsted4"];
        entity.adjutsted5 = coll["adjutsted5"];
        entity.adjutsted6 = coll["adjutsted6"];
        entity.adjutsted7 = coll["adjutsted7"];
        entity.adjutsted8 = coll["adjutsted8"];
        entity.adjutsted9 = coll["adjutsted9"];
        entity.adjutsted10 = coll["adjutsted10"];
        entity.adjutsted11 = coll["adjutsted11"];
        entity.adjutsted12 = coll["adjutsted12"];
        //差额2
        entity.balanceT = coll["balanceT"];
        entity.balanceT2 = coll["balanceT2"];
        entity.balanceT3 = coll["balanceT3"];
        entity.balanceT4 = coll["balanceT4"];
        entity.balanceT5 = coll["balanceT5"];
        entity.balanceT6 = coll["balanceT6"];
        entity.balanceT7 = coll["balanceT7"];
        entity.balanceT8 = coll["balanceT8"];
        entity.balanceT9 = coll["balanceT9"];
        entity.balanceT10 = coll["balanceT10"];
        entity.balanceT11 = coll["balanceT11"];
        entity.balanceT12 = coll["balanceT12"];
        entity.year = coll["year"];
        entity.mname = coll["mname"];
        office.Bll.CafeChase bllcom = new CafeChase();
        return bllcom.ChangeCafeRest(entity);
    }

    /// <summary>
    /// 新增独立单位-保存
    /// </summary>
    /// <returns></returns>
    private DataSet Add_Department()
    {
        #region 初始化基本信息
        DepartmentEntity baseEntity = new DepartmentEntity();
        baseEntity.MemberName = coll["MemberName"];//帐号
        baseEntity.PassWord = coll["PassWord"];  //密码 

        baseEntity.DeptCode = coll["DeptCode"];  //独立单位编码
        baseEntity.DeptName = coll["DeptName"]; //独立单位名称
        baseEntity.Manager = coll["Manager"]; //负责人
        baseEntity.Tel = coll["Tel"];  //电话
        baseEntity.Position = coll["Position"];  //职务 
        baseEntity.Mjordomo_id = int.Parse(coll["Mjordomo_id"]);
        baseEntity.Grade = int.Parse(coll["Grade"]);
        baseEntity.Authority = int.Parse(coll["Authority"]);


        #endregion

        office.Bll.Department bllDepartment = new Department();
        int state = bllDepartment.Add_Department(baseEntity);

        string strState;
        if (state == 1)
        {
            strState = "新增成功";
        }
        else if (state == 2)
        {
            strState = "新增失败！该独立单位编码已经使用！！";
        }
        else if (state == 3)
        {
            strState = "新增失败！该登陆帐号已经使用！！";
        }
        else
        {
            strState = "新增失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }


    /// <summary>
    /// 初始化独立单位表格数据
    /// </summary>
    /// <returns></returns>
    public DataSet Dept_List()
    {
        string DeptName = coll["deptname"];
        string MemberName = coll["membername"];
        int Grade = int.Parse(coll["grade"]);
        office.Bll.Department bllcom = new office.Bll.Department();
        return bllcom.Dept_List(DeptName, MemberName, Grade);
    }


    /// <summary>
    /// 批量删除
    /// </summary>
    /// <returns></returns>
    private DataSet Del_Dept()
    {
        int Id = int.Parse(coll["code_del"]);

        office.Bll.Department bllcom = new office.Bll.Department();
        int state = bllcom.Del_Dept(Id);
        string strState;
        if (state == 1)
        {
            strState = "删除成功！";
        }
        else
        {
            strState = "删除失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    
      /// <summary>
    /// 提交预算页面
    /// </summary>
    /// <returns></returns>   

    public DataSet SubmitBudget()
    {
        string year = coll["year"];
        string mname = coll["mname"];
        office.Bll.Budget bllcom = new office.Bll.Budget();
        return bllcom.SubmitBudget(year,mname);
    }
    
 /// <summary>
    /// 总监管理查找
    /// </summary>
    /// <returns></returns>   

    public DataSet GetDeptSearch()
    {

        string manager = coll["manager"];
        office.Bll.Department bllcom = new office.Bll.Department();
        return bllcom.GetDeptSearch(manager);
    }

    //固定资产
    public DataSet InitFixedAssets()
    {
        string mname = coll["mname"];
        string equipmentname = coll["equipmentname"];

        office.Bll.FixedAssets bllcom = new office.Bll.FixedAssets();
        return bllcom.InitFixedAssets(mname, equipmentname);
    }

    /// <summary>
    /// 新增独立单位-保存
    /// </summary>
    /// <returns></returns>
    private DataSet Add_FixedAssets()
    {
        #region 初始化基本信息
        DateTime date = new DateTime();
        FixedAssetsEntity baseEntity = new FixedAssetsEntity();
        baseEntity.DeptName = coll["DeptName"];
        baseEntity.MemberName = coll["MemberName"];
        baseEntity.EquipmentName = coll["EquipmentName"];
        baseEntity.EquipmentSpec = coll["EquipmentSpec"];
        baseEntity.EquipmentRemarks = coll["EquipmentRemarks"];
        baseEntity.UnitName = coll["UnitName"];
        baseEntity.PurchaseNum = decimal.Parse(coll["PurchaseNum"]);
        baseEntity.PurchasePrice = decimal.Parse(coll["PurchasePrice"]);
        baseEntity.PurchaseMoney = decimal.Parse(coll["PurchaseMoney"]);
        baseEntity.ProductValue = decimal.Parse(coll["ProductValue"]);
        baseEntity.PurchaseDate = Convert.ToDateTime(coll["PurchaseDate"]);
        baseEntity.DepreciationTime = Convert.ToDateTime(coll["DepreciationTime"]);
        baseEntity.DepreciationYear = coll["DepreciationYear"];
        baseEntity.DepreciationMonth = int.Parse(coll["DepreciationMonth"]);
        baseEntity.MDMoney = decimal.Parse(coll["MDMoney"]);





        // baseEntity.Authority = int.Parse(coll["Authority"]);


        #endregion

        office.Bll.FixedAssets bllFixedAssets = new FixedAssets();
        int state = bllFixedAssets.Add_FixedAssets(baseEntity);

        string strState;
        if (state == 1)
        {
            strState = "新增成功";
        }

        else
        {
            strState = "新增失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }

    public DataSet InitWages()
    {
        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Wages bllcom = new office.Bll.Wages();
        return bllcom.InitWages(mname, year);
    }

    /// <summary>
    /// 编辑现金推算表
    /// </summary>
    /// <returns></returns>
    private DataSet EditWages()
    {
        #region 初始化基本信息
        ListWagesEntity cashEntity = new ListWagesEntity();
        cashEntity.IdSave = coll["IdSave"];
        cashEntity.JanPlanSave = coll["JanPlanSave"];
        cashEntity.FebPlanSave = coll["FebPlanSave"];
        cashEntity.MarPlanSave = coll["MarPlanSave"];
        cashEntity.AprPlanSave = coll["AprPlanSave"];
        cashEntity.MayPlanSave = coll["MayPlanSave"];
        cashEntity.JunPlanSave = coll["JunPlanSave"];
        cashEntity.JulPlanSave = coll["JulPlanSave"];
        cashEntity.AugPlanSave = coll["AugPlanSave"];
        cashEntity.SepPlanSave = coll["SepPlanSave"];
        cashEntity.OctPlanSave = coll["OctPlanSave"];
        cashEntity.NovPlanSave = coll["NovPlanSave"];
        cashEntity.DecPlanSave = coll["DecPlanSave"];
        #endregion


        office.Bll.Wages bllcom = new office.Bll.Wages();
        int state = bllcom.EditWages(cashEntity);
        string strState;
        //int strState;
        if (state == 1)
        {
            strState = "修改成功！";
            // strState = state;
        }
        else
        {
            strState = "修改失败！";
            //strState = state;
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }


    /// <summary>
    /// 通过传入年份查询
    /// </summary>
    /// <returns></returns>
    public DataSet GetWagesDataByYear()
    {
        string year = coll["year"];
        string mname = coll["mname"];
        office.Bll.Wages bllcom = new office.Bll.Wages();
        return bllcom.GetWagesDataByYear(year, mname);
    }

    public DataSet GetWagesDataByYear2()
    {
        string year = coll["year"];
        string year2 = coll["year2"];
        string mname = coll["mname"];
        office.Bll.Wages bllcom = new office.Bll.Wages();
        return bllcom.GetWagesDataByYear2(year, year2, mname);
    }


    /// <summary>
    /// 新增现金推算表
    /// </summary>
    /// <returns></returns>
    private DataSet SaveWages()
    {

        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Wages bllcom = new office.Bll.Wages();
        int state = bllcom.SaveWages(year, mname);
        string strState;
        if (state == 1)
        {
            strState = "提交工资福利表成功！";
        }
        else
        {
            strState = "提交工资福利表失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }



    /// <summary>
    /// 新增现金推算表
    /// </summary>
    /// <returns></returns>
    private DataSet C_EditWages()
    {

        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Wages bllcom = new office.Bll.Wages();
        int state = bllcom.C_EditWages(year, mname);
        string strState;
        if (state == 1)
        {
            strState = "重修改工资福利表提交成功！";
        }
        else
        {
            strState = "重修改工资福利表提交失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }


    private DataSet OkWages()
    {

        string mname = coll["mname"];
        string year = coll["year"];
        office.Bll.Wages bllcom = new office.Bll.Wages();
        int state = bllcom.OkWages(year, mname);
        string strState;
        if (state == 1)
        {
            strState = "确认工资福利表成功！";
        }
        else
        {
            strState = "确认工资福利表失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }



    /// <summary>
    /// 新增独立单位-保存
    /// </summary>
    /// <returns></returns>
    private DataSet Add_Wages()
    {
        #region 初始化基本信息
        // DateTime date = new DateTime();
        WagesEntity baseEntity = new WagesEntity();
        baseEntity.DeptName = coll["DeptName"];
        baseEntity.MemberName = coll["MemberName"];
        baseEntity.WagesClass = coll["WagesClass"];
        baseEntity.WagesName = coll["WagesName"];
        baseEntity.WagesBz = coll["WagesBz"];
        baseEntity.cYear = coll["cYear"];
        baseEntity.JanPlan = decimal.Parse(coll["JanPlan"]);
        baseEntity.FebPlan = decimal.Parse(coll["FebPlan"]);
        baseEntity.MarPlan = decimal.Parse(coll["MarPlan"]);
        baseEntity.AprPlan = decimal.Parse(coll["AprPlan"]);
        baseEntity.MayPlan = decimal.Parse(coll["MayPlan"]);
        baseEntity.JunPlan = decimal.Parse(coll["JunPlan"]);
        baseEntity.JulPlan = decimal.Parse(coll["JulPlan"]);
        baseEntity.AugPlan = decimal.Parse(coll["AugPlan"]);
        baseEntity.SepPlan = decimal.Parse(coll["SepPlan"]);

        baseEntity.OctPlan = decimal.Parse(coll["OctPlan"]);
        baseEntity.NovPlan = decimal.Parse(coll["NovPlan"]);
        baseEntity.DecPlan = decimal.Parse(coll["DecPlan"]);





        // baseEntity.Authority = int.Parse(coll["Authority"]);


        #endregion

        office.Bll.Wages bllWages = new Wages();
        int state = bllWages.Add_Wages(baseEntity);

        string strState;
        if (state == 1)
        {
            strState = "新增成功";
        }

        else if (state == 2)
        {
            strState = "工资福利表中已有记录！";
        }
        else
        {
            strState = "新增失败！";
        }

        DataSet ds = new DataSet("RITUXML");
        DataTable infoTable = new DataTable("ResultInfo");
        infoTable.Columns.Add("state", typeof(System.String));
        ds.Tables.Add(infoTable);

        infoTable.Rows.Add(strState);
        return ds;
    }
    #region 通用
    /// <summary>
    /// 获取并解析所有请求参数
    /// </summary>
    private void getArguments()
    {
        try
        {
            if (Request.HttpMethod == "GET")
            {
                coll = Request.QueryString;
            }
            else if (Request.HttpMethod == "POST")
            {
                //this.coll = Request.Form;

                System.IO.Stream instream = Request.InputStream;
                BinaryReader br = new BinaryReader(instream, System.Text.Encoding.UTF8);
                byte[] byt = br.ReadBytes((int)instream.Length);
                string sXml = System.Text.Encoding.UTF8.GetString(byt);

                sXml = sXml.Substring(1);
                List<string> listNameValue = new List<string>(sXml.Split('&'));
                this.coll = new NameValueCollection();
                foreach (string nameValue in listNameValue)
                {
                    int index = nameValue.IndexOf('=');
                    string name = nameValue.Substring(0, index);
                    string value = nameValue.Substring(index + 1);
                    value = Server.UrlDecode(value);
                    this.coll.Add(name, value);

                }
            }
        }
        catch (Exception e1)
        {
            throw e1;
        }
    }
    #endregion
}

