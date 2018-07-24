using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.OleDb;
using System.Data;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using NPOI.SS.UserModel;
using NPOI.HSSF.UserModel;
using NPOI.SS.Util;
using NPOI.HSSF.Util;
using NPOI.XSSF.UserModel;

namespace office.Utility
{
    public class ExcelHelper
    {
        protected string ExcelConnString = string.Empty;
        protected OleDbConnection Conn;
        protected OleDbDataAdapter Adapter;
        protected OleDbCommand Command;
        /// <summary>
        /// 1、97/2003;2、2007及以上
        /// </summary>
        /// <param name="type">类型</param>
        /// <param name="path">excel路径</param>
        public ExcelHelper(int type, string path)
        {
            switch (type)
            {
                case 1:
                    //ExcelConnString = "Provider=Microsoft.Jet.OLEDB.4.0;" +
                    //                  "Extended Properties=Excel 8.0;" +
                    //                  "Data Source=" + path;
                    ExcelConnString = "Provider=Microsoft.Jet.OLEDB.4.0;" +
                                      "Extended Properties=\"Excel 8.0;HDR=No;IMEX=1\";" +
                                      "Data Source=" + path;
                    break;
                case 2:
                    //ExcelConnString = "Provider=Microsoft.ACE.OLEDB.12.0;" +
                    //                       "Extended Properties=\"Excel 12.0 Xml;HDR=No\";" +
                    //                       "Data Source=" + path;
                    ExcelConnString = "Provider=Microsoft.ACE.OLEDB.12.0;Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=1\";" +
                                       "Data Source=" + path;
                    break;
                default:
                    ExcelConnString = "Provider=Microsoft.Jet.OLEDB.4.0;" +
                                      "Extended Properties=Excel 8.0;" +
                                      "Data Source=" + path;
                    break;
            }
            Conn = new OleDbConnection(ExcelConnString);
            Command = new OleDbCommand();
            Adapter = new OleDbDataAdapter();
        }
        /// <summary>
        /// 获取Excel内容
        /// </summary>
        /// <param name="sheetName">excel表名如:Sheet1$</param>
        /// <returns></returns>
        public DataTable GetExcelCon(string sheetName)
        {
            string sql = " select * from [{0}]";
            if (string.IsNullOrEmpty(sheetName))//默认情况下，Excel表名为Sheet1$
            {
                sheetName = "Sheet1$";
            }

            sql = string.Format(sql, sheetName);
            Command.CommandText = sql;
            Command.Connection = Conn;
            Conn.Open();
            DataTable dt = new DataTable();
            Adapter.SelectCommand = Command;
            Adapter.Fill(dt);
            Conn.Close();
            return dt;
        }
        /// <summary>
        ///  导出Excel文件，自动返回可下载的文件流 
        /// </summary>
        /// <param name="dtData"></param>
        public static void DataTableExcel(System.Data.DataTable dtData, string FileName)
        {
            HttpContext curContext = HttpContext.Current;
            MemoryStream stream = RenderToExcel(dtData);
            RenderToBrowser(stream, curContext, FileName);
        }
        /// <summary>
        ///  导出Excel文件，返回流文件 
        /// </summary>
        /// <param name="dtData"></param>
        public static MemoryStream DataTableExcelForFile(System.Data.DataTable dtData, string FileName, bool NeedInnerTitle, string TitleName)
        {
            HttpContext curContext = HttpContext.Current;
            MemoryStream stream = RenderToExcel(dtData, NeedInnerTitle, TitleName);
            return stream;
        }
        /// <summary>
        ///  导出Excel文件，自动返回可下载的文件流 
        /// </summary>
        /// <param name="dtData"></param>
        public static void DataTableExcel(System.Data.DataTable dtData, string FileName, bool NeedInnerTitle, string TitleName)
        {
            HttpContext curContext = HttpContext.Current;
            MemoryStream stream = RenderToExcel(dtData, NeedInnerTitle, TitleName);
            RenderToBrowser(stream, curContext, FileName);
        }
        /// <summary>
        ///  导出Excel文件，自动返回可下载的文件流 
        /// </summary>
        /// <param name="dtData"></param>
        public static void ControlExcel(HtmlTable table, string FileName)
        {
            HttpContext curContext = HttpContext.Current;
            StringWriter strWriter = null;
            HtmlTextWriter htmlWriter = null;

            if (table.Rows.Count > 0)
            {
                HttpUtility.UrlEncode(FileName, System.Text.Encoding.UTF8);
                curContext.Response.AddHeader("content-disposition", "attachment;filename=" + FileName + ".xls");
                curContext.Response.ContentType = "application nd.ms-excel";
                curContext.Response.ContentEncoding = System.Text.Encoding.UTF8;
                curContext.Response.Charset = "GB2312";
                strWriter = new StringWriter();
                htmlWriter = new HtmlTextWriter(strWriter);
                table.RenderControl(htmlWriter);
                curContext.Response.Write(strWriter.ToString());
                curContext.Response.End();
            }
        }

        public static MemoryStream RenderToExcel(DataTable table)
        {
            MemoryStream ms = new MemoryStream();

            using (table)
            {
                IWorkbook workbook = new HSSFWorkbook();
                ISheet sheet = workbook.CreateSheet();
                IRow headerRow = sheet.CreateRow(0);

                // handling header.
                foreach (DataColumn column in table.Columns)
                    headerRow.CreateCell(column.Ordinal).SetCellValue(column.Caption);//If Caption not set, returns the ColumnName value

                // handling value.
                int rowIndex = 1;

                foreach (DataRow row in table.Rows)
                {
                    IRow dataRow = sheet.CreateRow(rowIndex);

                    foreach (DataColumn column in table.Columns)
                    {
                        dataRow.CreateCell(column.Ordinal).SetCellValue(row[column].ToString());
                    }

                    rowIndex++;
                }

                workbook.Write(ms);
                ms.Flush();
                ms.Position = 0;
                workbook = null;
                sheet = null;
            }
            return ms;
        }
        public static MemoryStream RenderToExcel(DataTable table, bool NeedInnerTitle, string TitleName)
        {
            MemoryStream ms = new MemoryStream();

            using (table)
            {
                IWorkbook workbook = new HSSFWorkbook();
                ISheet sheet = workbook.CreateSheet();
                IRow headerRow = sheet.CreateRow(0);
                if (NeedInnerTitle)
                {
                    IRow Title = sheet.CreateRow(0);
                    Title.Height = 500;
                    ICell TitleCell = Title.CreateCell(0);
                    TitleCell.SetCellValue(TitleName);
                    TitleCell.CellStyle = workbook.CreateCellStyle();
                    TitleCell.CellStyle.Alignment = HorizontalAlignment.CENTER;
                    TitleCell.CellStyle.VerticalAlignment = VerticalAlignment.CENTER;
                    IFont font = workbook.CreateFont();
                    font.FontName = "微软雅黑";
                    font.FontHeightInPoints = 16;
                    TitleCell.CellStyle.SetFont(font);
                    SetCellRangeAddress(sheet, 0, 0, 0, table.Columns.Count - 1);
                    headerRow = sheet.CreateRow(1);
                }



                // handling header.
                foreach (DataColumn column in table.Columns)
                    headerRow.CreateCell(column.Ordinal).SetCellValue(column.Caption);//If Caption not set, returns the ColumnName value

                // handling value.
                int rowIndex = NeedInnerTitle ? 2 : 1;

                foreach (DataRow row in table.Rows)
                {
                    IRow dataRow = sheet.CreateRow(rowIndex);

                    foreach (DataColumn column in table.Columns)
                    {
                        dataRow.CreateCell(column.Ordinal).SetCellValue(row[column].ToString());
                    }

                    rowIndex++;
                }

                workbook.Write(ms);
                ms.Flush();
                ms.Position = 0;
                workbook = null;
                sheet = null;
            }
            return ms;
        }
        /// <summary>
        /// 合并单元格
        /// </summary>
        /// <param name="sheet">要合并单元格所在的sheet</param>
        /// <param name="rowstart">开始行的索引</param>
        /// <param name="rowend">结束行的索引</param>
        /// <param name="colstart">开始列的索引</param>
        /// <param name="colend">结束列的索引</param>
        public static void SetCellRangeAddress(ISheet sheet, int rowstart, int rowend, int colstart, int colend)
        {
            CellRangeAddress cellRangeAddress = new CellRangeAddress(rowstart, rowend, colstart, colend);
            sheet.AddMergedRegion(cellRangeAddress);
        }

        /// <summary>
        /// 获取单元格样式
        /// </summary>
        /// <param name="hssfworkbook">Excel操作类</param>
        /// <param name="font">单元格字体</param>
        /// <param name="fillForegroundColor">图案的颜色</param>
        /// <param name="fillPattern">图案样式</param>
        /// <param name="fillBackgroundColor">单元格背景</param>
        /// <param name="ha">垂直对齐方式</param>
        /// <param name="va">垂直对齐方式</param>
        /// <returns></returns>
        public static ICellStyle GetCellStyle(IWorkbook hssfworkbook, IFont font, HSSFColor fillForegroundColor, HSSFColor fillBackgroundColor, HorizontalAlignment ha, VerticalAlignment va)
        {
            ICellStyle cellstyle = hssfworkbook.CreateCellStyle();
            //cellstyle.FillPattern = fillPattern;
            cellstyle.Alignment = ha;
            cellstyle.VerticalAlignment = va;
            if (fillForegroundColor != null)
            {
                cellstyle.FillForegroundColor = fillForegroundColor.GetIndex();
            }
            if (fillBackgroundColor != null)
            {
                cellstyle.FillBackgroundColor = fillBackgroundColor.GetIndex();
            }
            if (font != null)
            {
                cellstyle.SetFont(font);
            }
            //有边框
            cellstyle.BorderBottom = NPOI.SS.UserModel.BorderStyle.THIN;
            cellstyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.THIN;
            cellstyle.BorderRight = NPOI.SS.UserModel.BorderStyle.THIN;
            cellstyle.BorderTop = NPOI.SS.UserModel.BorderStyle.THIN;
            return cellstyle;
        }

        public static void SaveToFile(MemoryStream ms, string fileName)
        {
            using (FileStream fs = new FileStream(fileName, FileMode.Create, FileAccess.Write))
            {
                byte[] data = ms.ToArray();

                fs.Write(data, 0, data.Length);
                fs.Flush();

                data = null;
            }
        }

        public static void RenderToBrowser(MemoryStream ms, HttpContext context, string fileName)
        {
            if (context.Request.Browser.Browser == "IE")
                fileName = HttpUtility.UrlEncode(fileName);
            context.Response.AddHeader("Content-Disposition", "attachment;fileName=" + fileName + ".xls");
            context.Response.BinaryWrite(ms.ToArray());
        }

        public static DataTable ImportExcelFile(string filePath, string sheetName)
        {
            IWorkbook hssfworkbook;
            #region//初始化信息
            try
            {
                using (FileStream file = new FileStream(filePath, FileMode.Open, FileAccess.Read))
                {
                    hssfworkbook = new XSSFWorkbook(file);

                }
            }
            catch (Exception e)
            {
                using (FileStream file = new FileStream(filePath, FileMode.Open, FileAccess.Read))
                {
                    hssfworkbook = new HSSFWorkbook(file);
                }
            }
            #endregion

            NPOI.SS.UserModel.ISheet sheet = !string.IsNullOrEmpty(sheetName) ? hssfworkbook.GetSheet(sheetName) : hssfworkbook.GetSheetAt(0);

            System.Collections.IEnumerator rows = sheet.GetRowEnumerator();
            DataTable dt = new DataTable();
            rows.MoveNext();
            IRow row = null;
            try
            {
                row = (HSSFRow)rows.Current;
            }
            catch
            {
                row = (XSSFRow)rows.Current;
            }
            for (int j = 0; j < (sheet.GetRow(0).LastCellNum); j++)
            {
                //dt.Columns.Add(Convert.ToChar(((int)'A') + j).ToString());  
                //将第一列作为列表头  
                dt.Columns.Add(row.GetCell(j).ToString());
            }
            while (rows.MoveNext())
            {
                try
                {
                    row = (HSSFRow)rows.Current;
                }
                catch
                {
                    row = (XSSFRow)rows.Current;
                }
                DataRow dr = dt.NewRow();
                for (int i = 0; i < row.LastCellNum; i++)
                {
                    NPOI.SS.UserModel.ICell cell = row.GetCell(i);
                    if (cell == null)
                    {
                        dr[i] = null;
                    }
                    else
                    {
                        switch (cell.CellType)
                        {
                            case CellType.NUMERIC:
                                if (HSSFDateUtil.IsCellDateFormatted(cell))
                                {
                                    dr[i] = cell.DateCellValue.ToString();
                                }
                                else
                                {
                                    dr[i] = cell.ToString();
                                }
                                break;
                            default:
                                dr[i] = cell.ToString();
                                break;
                        }
                    }
                }
                dt.Rows.Add(dr);
            }
            return dt;
        }
    }
}
