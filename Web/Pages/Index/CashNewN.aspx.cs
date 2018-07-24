using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.IO;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Collections;
using System.Diagnostics;
using System.Configuration;
using office.Utility;
using office.Bll;
using office.Model;
using System.Numerics;

public partial class Pages_Index_CashNewN : System.Web.UI.Page
{
    public string connectionstring = ConfigurationManager.ConnectionStrings["myTestDbConnectionString"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataBase db = new SqlDataBase();
    }

    public void btnupload_Click(object sender, EventArgs e)
    {
        try
        {
            string fileName = this.upload.FileName;
            if (string.IsNullOrEmpty(fileName))
            {
                uploadMsg.Text = "请选择文件";
                return;
            }
            string fix = fileName.Split('.')[1];
            if (fix != "xls" && fix != "xlsx" && fix != "xlt")
            {
                uploadMsg.Text = "请上传Excel文件";
                return;
            }
            string dateName = DateTime.Now.ToString("yyyyMMddhhmmssfffff");
            string fullName = dateName + "." + fix;
            string savePath = Server.MapPath("Excel\\" + fullName);
            upload.SaveAs(savePath);
            DataTable dt = new DataTable();
            ExcelHelper excelHelper = null;
            if (fix == "xls" || fix == "xlt")
            {
                excelHelper = new ExcelHelper(1, savePath);
            }
            if (fix == "xlsx")
            {
                excelHelper = new ExcelHelper(2, savePath);
            }

            DataTable dtData = excelHelper.GetExcelCon("现金推算表$");
            if (dtData == null || dtData.Rows.Count == 0)
            {
                uploadMsg.Text = "Excel文件为空!无法解析";
            }
            else
            {
                if (File.Exists(savePath))
                {
                    File.Delete(savePath);//读取内容后删除上传的文件
                }
                GetExcelData(dtData);
            }
        }
        catch (Exception ex)
        {
            this.uploadMsg.Text = ex.Message;
        }
    }
    private void GetExcelData(DataTable dt)
    {
        string MM = DateTime.Now.ToString("MM");
        ListCafeEntity entity = new ListCafeEntity();
        Cash BllCash = new Cash();
        for (int i = 1; i < dt.Rows.Count; i++)
        {
            if (MM == "01")
            {
                entity.JanPlan = dt.Rows[i][1].ToString().Trim();
                entity.FebPlan = dt.Rows[i][2].ToString().Trim();
                entity.MarPlan = dt.Rows[i][3].ToString().Trim();
                entity.AprPlan = dt.Rows[i][4].ToString().Trim();
                entity.MayPlan = dt.Rows[i][5].ToString().Trim();
                entity.JunPlan = dt.Rows[i][6].ToString().Trim();
                entity.JulPlan = dt.Rows[i][7].ToString().Trim();
                entity.AugPlan = dt.Rows[i][8].ToString().Trim();
                entity.SepPlan = dt.Rows[i][9].ToString().Trim();
                entity.OctPlan = dt.Rows[i][10].ToString().Trim();
                entity.NovPlan = dt.Rows[i][11].ToString().Trim();
                entity.DecPlan = dt.Rows[i][12].ToString().Trim();
                entity.kJanPlan = dt.Rows[i][13].ToString().Trim();
                entity.kFebPlan = dt.Rows[i][14].ToString().Trim();
                entity.kMarPlan = dt.Rows[i][15].ToString().Trim();
                entity.kAprPlan = dt.Rows[i][16].ToString().Trim();
                entity.kMayPlan = dt.Rows[i][17].ToString().Trim();
                entity.kJunPlan = dt.Rows[i][18].ToString().Trim();
                entity.kJulPlan = dt.Rows[i][19].ToString().Trim();
                entity.kAugPlan = dt.Rows[i][20].ToString().Trim();
                entity.kSepPlan = dt.Rows[i][21].ToString().Trim();
                entity.kOctPlan = dt.Rows[i][22].ToString().Trim();
                entity.kNovPlan = dt.Rows[i][23].ToString().Trim();
                entity.kDecPlan = dt.Rows[i][24].ToString().Trim();
            }
            else if (MM == "02")
            {
                entity.JanPlan = dt.Rows[i][1].ToString().Trim();
                entity.FebPlan = dt.Rows[i][2].ToString().Trim();
                entity.MarPlan = dt.Rows[i][3].ToString().Trim();
                entity.AprPlan = dt.Rows[i][4].ToString().Trim();
                entity.MayPlan = dt.Rows[i][5].ToString().Trim();
                entity.JunPlan = dt.Rows[i][6].ToString().Trim();
                entity.JulPlan = dt.Rows[i][7].ToString().Trim();
                entity.AugPlan = dt.Rows[i][8].ToString().Trim();
                entity.SepPlan = dt.Rows[i][9].ToString().Trim();
                entity.OctPlan = dt.Rows[i][10].ToString().Trim();
                entity.NovPlan = dt.Rows[i][11].ToString().Trim();
                entity.DecPlan = dt.Rows[i][12].ToString().Trim();
                entity.kJanPlan = dt.Rows[i][13].ToString().Trim();
                entity.kFebPlan = dt.Rows[i][14].ToString().Trim();
                entity.kMarPlan = dt.Rows[i][15].ToString().Trim();
                entity.kAprPlan = dt.Rows[i][16].ToString().Trim();
                entity.kMayPlan = dt.Rows[i][17].ToString().Trim();
                entity.kJunPlan = dt.Rows[i][18].ToString().Trim();
                entity.kJulPlan = dt.Rows[i][19].ToString().Trim();
                entity.kAugPlan = dt.Rows[i][20].ToString().Trim();
                entity.kSepPlan = dt.Rows[i][21].ToString().Trim();
                entity.kOctPlan = dt.Rows[i][22].ToString().Trim();
                entity.kNovPlan = dt.Rows[i][23].ToString().Trim();
                entity.kDecPlan = dt.Rows[i][24].ToString().Trim();
            }
            else if (MM == "03")
            {
                entity.FebPlan = dt.Rows[i][1].ToString().Trim();
                entity.MarPlan = dt.Rows[i][2].ToString().Trim();
                entity.AprPlan = dt.Rows[i][3].ToString().Trim();
                entity.MayPlan = dt.Rows[i][4].ToString().Trim();
                entity.JunPlan = dt.Rows[i][5].ToString().Trim();
                entity.JulPlan = dt.Rows[i][6].ToString().Trim();
                entity.AugPlan = dt.Rows[i][7].ToString().Trim();
                entity.SepPlan = dt.Rows[i][8].ToString().Trim();
                entity.OctPlan = dt.Rows[i][9].ToString().Trim();
                entity.NovPlan = dt.Rows[i][10].ToString().Trim();
                entity.DecPlan = dt.Rows[i][11].ToString().Trim();
                entity.kJanPlan = dt.Rows[i][12].ToString().Trim();
                entity.kFebPlan = dt.Rows[i][13].ToString().Trim();
                entity.kMarPlan = dt.Rows[i][14].ToString().Trim();
                entity.kAprPlan = dt.Rows[i][15].ToString().Trim();
                entity.kMayPlan = dt.Rows[i][16].ToString().Trim();
                entity.kJunPlan = dt.Rows[i][17].ToString().Trim();
                entity.kJulPlan = dt.Rows[i][18].ToString().Trim();
                entity.kAugPlan = dt.Rows[i][19].ToString().Trim();
                entity.kSepPlan = dt.Rows[i][20].ToString().Trim();
                entity.kOctPlan = dt.Rows[i][21].ToString().Trim();
                entity.kNovPlan = dt.Rows[i][22].ToString().Trim();
                entity.kDecPlan = dt.Rows[i][23].ToString().Trim();
            }
            else if (MM == "04")
            {
                entity.MarPlan = dt.Rows[i][1].ToString().Trim();
                entity.AprPlan = dt.Rows[i][2].ToString().Trim();
                entity.MayPlan = dt.Rows[i][3].ToString().Trim();
                entity.JunPlan = dt.Rows[i][4].ToString().Trim();
                entity.JulPlan = dt.Rows[i][5].ToString().Trim();
                entity.AugPlan = dt.Rows[i][6].ToString().Trim();
                entity.SepPlan = dt.Rows[i][7].ToString().Trim();
                entity.OctPlan = dt.Rows[i][8].ToString().Trim();
                entity.NovPlan = dt.Rows[i][9].ToString().Trim();
                entity.DecPlan = dt.Rows[i][10].ToString().Trim();
                entity.kJanPlan = dt.Rows[i][11].ToString().Trim();
                entity.kFebPlan = dt.Rows[i][12].ToString().Trim();
                entity.kMarPlan = dt.Rows[i][13].ToString().Trim();
                entity.kAprPlan = dt.Rows[i][14].ToString().Trim();
                entity.kMayPlan = dt.Rows[i][15].ToString().Trim();
                entity.kJunPlan = dt.Rows[i][16].ToString().Trim();
                entity.kJulPlan = dt.Rows[i][17].ToString().Trim();
                entity.kAugPlan = dt.Rows[i][18].ToString().Trim();
                entity.kSepPlan = dt.Rows[i][19].ToString().Trim();
                entity.kOctPlan = dt.Rows[i][20].ToString().Trim();
                entity.kNovPlan = dt.Rows[i][21].ToString().Trim();
                entity.kDecPlan = dt.Rows[i][22].ToString().Trim();
            }
            else if (MM == "05")
            {
                entity.AprPlan = dt.Rows[i][1].ToString().Trim();
                entity.MayPlan = dt.Rows[i][2].ToString().Trim();
                entity.JunPlan = dt.Rows[i][3].ToString().Trim();
                entity.JulPlan = dt.Rows[i][4].ToString().Trim();
                entity.AugPlan = dt.Rows[i][5].ToString().Trim();
                entity.SepPlan = dt.Rows[i][6].ToString().Trim();
                entity.OctPlan = dt.Rows[i][7].ToString().Trim();
                entity.NovPlan = dt.Rows[i][8].ToString().Trim();
                entity.DecPlan = dt.Rows[i][9].ToString().Trim();
                entity.kJanPlan = dt.Rows[i][10].ToString().Trim();
                entity.kFebPlan = dt.Rows[i][11].ToString().Trim();
                entity.kMarPlan = dt.Rows[i][12].ToString().Trim();
                entity.kAprPlan = dt.Rows[i][13].ToString().Trim();
                entity.kMayPlan = dt.Rows[i][14].ToString().Trim();
                entity.kJunPlan = dt.Rows[i][15].ToString().Trim();
                entity.kJulPlan = dt.Rows[i][16].ToString().Trim();
                entity.kAugPlan = dt.Rows[i][17].ToString().Trim();
                entity.kSepPlan = dt.Rows[i][18].ToString().Trim();
                entity.kOctPlan = dt.Rows[i][19].ToString().Trim();
                entity.kNovPlan = dt.Rows[i][20].ToString().Trim();
                entity.kDecPlan = dt.Rows[i][21].ToString().Trim();
            }
            else if (MM == "06")
            {
                entity.MayPlan = dt.Rows[i][1].ToString().Trim();
                entity.JunPlan = dt.Rows[i][2].ToString().Trim();
                entity.JulPlan = dt.Rows[i][3].ToString().Trim();
                entity.AugPlan = dt.Rows[i][4].ToString().Trim();
                entity.SepPlan = dt.Rows[i][5].ToString().Trim();
                entity.OctPlan = dt.Rows[i][6].ToString().Trim();
                entity.NovPlan = dt.Rows[i][7].ToString().Trim();
                entity.DecPlan = dt.Rows[i][8].ToString().Trim();
                entity.kJanPlan = dt.Rows[i][9].ToString().Trim();
                entity.kFebPlan = dt.Rows[i][10].ToString().Trim();
                entity.kMarPlan = dt.Rows[i][11].ToString().Trim();
                entity.kAprPlan = dt.Rows[i][12].ToString().Trim();
                entity.kMayPlan = dt.Rows[i][13].ToString().Trim();
                entity.kJunPlan = dt.Rows[i][14].ToString().Trim();
                entity.kJulPlan = dt.Rows[i][15].ToString().Trim();
                entity.kAugPlan = dt.Rows[i][16].ToString().Trim();
                entity.kSepPlan = dt.Rows[i][17].ToString().Trim();
                entity.kOctPlan = dt.Rows[i][18].ToString().Trim();
                entity.kNovPlan = dt.Rows[i][19].ToString().Trim();
                entity.kDecPlan = dt.Rows[i][20].ToString().Trim();
            }
            else if (MM == "07")
            {
                entity.JunPlan = dt.Rows[i][1].ToString().Trim();
                entity.JulPlan = dt.Rows[i][2].ToString().Trim();
                entity.AugPlan = dt.Rows[i][3].ToString().Trim();
                entity.SepPlan = dt.Rows[i][4].ToString().Trim();
                entity.OctPlan = dt.Rows[i][5].ToString().Trim();
                entity.NovPlan = dt.Rows[i][6].ToString().Trim();
                entity.DecPlan = dt.Rows[i][7].ToString().Trim();
                entity.kJanPlan = dt.Rows[i][8].ToString().Trim();
                entity.kFebPlan = dt.Rows[i][9].ToString().Trim();
                entity.kMarPlan = dt.Rows[i][10].ToString().Trim();
                entity.kAprPlan = dt.Rows[i][11].ToString().Trim();
                entity.kMayPlan = dt.Rows[i][12].ToString().Trim();
                entity.kJunPlan = dt.Rows[i][13].ToString().Trim();
                entity.kJulPlan = dt.Rows[i][14].ToString().Trim();
                entity.kAugPlan = dt.Rows[i][15].ToString().Trim();
                entity.kSepPlan = dt.Rows[i][16].ToString().Trim();
                entity.kOctPlan = dt.Rows[i][17].ToString().Trim();
                entity.kNovPlan = dt.Rows[i][18].ToString().Trim();
                entity.kDecPlan = dt.Rows[i][19].ToString().Trim();
            }
            else if (MM == "08")
            {
                entity.JulPlan = dt.Rows[i][1].ToString().Trim();
                entity.AugPlan = dt.Rows[i][2].ToString().Trim();
                entity.SepPlan = dt.Rows[i][3].ToString().Trim();
                entity.OctPlan = dt.Rows[i][4].ToString().Trim();
                entity.NovPlan = dt.Rows[i][5].ToString().Trim();
                entity.DecPlan = dt.Rows[i][6].ToString().Trim();
                entity.kJanPlan = dt.Rows[i][7].ToString().Trim();
                entity.kFebPlan = dt.Rows[i][8].ToString().Trim();
                entity.kMarPlan = dt.Rows[i][9].ToString().Trim();
                entity.kAprPlan = dt.Rows[i][10].ToString().Trim();
                entity.kMayPlan = dt.Rows[i][11].ToString().Trim();
                entity.kJunPlan = dt.Rows[i][12].ToString().Trim();
                entity.kJulPlan = dt.Rows[i][13].ToString().Trim();
                entity.kAugPlan = dt.Rows[i][14].ToString().Trim();
                entity.kSepPlan = dt.Rows[i][15].ToString().Trim();
                entity.kOctPlan = dt.Rows[i][16].ToString().Trim();
                entity.kNovPlan = dt.Rows[i][17].ToString().Trim();
                entity.kDecPlan = dt.Rows[i][18].ToString().Trim();
            }
            else if (MM == "09")
            {
                entity.AugPlan = dt.Rows[i][1].ToString().Trim();
                entity.SepPlan = dt.Rows[i][2].ToString().Trim();
                entity.OctPlan = dt.Rows[i][3].ToString().Trim();
                entity.NovPlan = dt.Rows[i][4].ToString().Trim();
                entity.DecPlan = dt.Rows[i][5].ToString().Trim();
                entity.kJanPlan = dt.Rows[i][6].ToString().Trim();
                entity.kFebPlan = dt.Rows[i][7].ToString().Trim();
                entity.kMarPlan = dt.Rows[i][8].ToString().Trim();
                entity.kAprPlan = dt.Rows[i][9].ToString().Trim();
                entity.kMayPlan = dt.Rows[i][10].ToString().Trim();
                entity.kJunPlan = dt.Rows[i][11].ToString().Trim();
                entity.kJulPlan = dt.Rows[i][12].ToString().Trim();
                entity.kAugPlan = dt.Rows[i][13].ToString().Trim();
                entity.kSepPlan = dt.Rows[i][14].ToString().Trim();
                entity.kOctPlan = dt.Rows[i][15].ToString().Trim();
                entity.kNovPlan = dt.Rows[i][16].ToString().Trim();
                entity.kDecPlan = dt.Rows[i][17].ToString().Trim();
            }
            else if (MM == "10")
            {
                entity.SepPlan = dt.Rows[i][1].ToString().Trim();
                entity.OctPlan = dt.Rows[i][2].ToString().Trim();
                entity.NovPlan = dt.Rows[i][3].ToString().Trim();
                entity.DecPlan = dt.Rows[i][4].ToString().Trim();
                entity.kJanPlan = dt.Rows[i][5].ToString().Trim();
                entity.kFebPlan = dt.Rows[i][6].ToString().Trim();
                entity.kMarPlan = dt.Rows[i][7].ToString().Trim();
                entity.kAprPlan = dt.Rows[i][8].ToString().Trim();
                entity.kMayPlan = dt.Rows[i][9].ToString().Trim();
                entity.kJunPlan = dt.Rows[i][10].ToString().Trim();
                entity.kJulPlan = dt.Rows[i][11].ToString().Trim();
                entity.kAugPlan = dt.Rows[i][12].ToString().Trim();
                entity.kSepPlan = dt.Rows[i][13].ToString().Trim();
                entity.kOctPlan = dt.Rows[i][14].ToString().Trim();
                entity.kNovPlan = dt.Rows[i][15].ToString().Trim();
                entity.kDecPlan = dt.Rows[i][16].ToString().Trim();
            }
            else if (MM == "11")
            {
                entity.OctPlan = dt.Rows[i][1].ToString().Trim();
                entity.NovPlan = dt.Rows[i][2].ToString().Trim();
                entity.DecPlan = dt.Rows[i][3].ToString().Trim();
                entity.kJanPlan = dt.Rows[i][4].ToString().Trim();
                entity.kFebPlan = dt.Rows[i][5].ToString().Trim();
                entity.kMarPlan = dt.Rows[i][6].ToString().Trim();
                entity.kAprPlan = dt.Rows[i][7].ToString().Trim();
                entity.kMayPlan = dt.Rows[i][8].ToString().Trim();
                entity.kJunPlan = dt.Rows[i][9].ToString().Trim();
                entity.kJulPlan = dt.Rows[i][10].ToString().Trim();
                entity.kAugPlan = dt.Rows[i][11].ToString().Trim();
                entity.kSepPlan = dt.Rows[i][12].ToString().Trim();
                entity.kOctPlan = dt.Rows[i][13].ToString().Trim();
                entity.kNovPlan = dt.Rows[i][14].ToString().Trim();
                entity.kDecPlan = dt.Rows[i][15].ToString().Trim();
            }
            else if (MM == "12")
            {
                entity.NovPlan = dt.Rows[i][1].ToString().Trim();
                entity.DecPlan = dt.Rows[i][2].ToString().Trim();
                entity.kJanPlan = dt.Rows[i][3].ToString().Trim();
                entity.kFebPlan = dt.Rows[i][4].ToString().Trim();
                entity.kMarPlan = dt.Rows[i][5].ToString().Trim();
                entity.kAprPlan = dt.Rows[i][6].ToString().Trim();
                entity.kMayPlan = dt.Rows[i][7].ToString().Trim();
                entity.kJunPlan = dt.Rows[i][8].ToString().Trim();
                entity.kJulPlan = dt.Rows[i][9].ToString().Trim();
                entity.kAugPlan = dt.Rows[i][10].ToString().Trim();
                entity.kSepPlan = dt.Rows[i][11].ToString().Trim();
                entity.kOctPlan = dt.Rows[i][12].ToString().Trim();
                entity.kNovPlan = dt.Rows[i][13].ToString().Trim();
                entity.kDecPlan = dt.Rows[i][14].ToString().Trim();
            }
            entity.Title = dt.Rows[i][0].ToString().Trim();
            entity.Operators = this.strOp.Value; 
            uploadMsg.Text = "   正在上传，请勿关闭窗口！！！  ";
            int state = BllCash.ImportCash(entity);
            if (state != 1)
            {
                return;
            }
        }

        uploadMsg.Text = "<script language='javascript'>hiddenDiv('divAdd');</script>";  
    }
}