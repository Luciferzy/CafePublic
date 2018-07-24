using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Collections;
using System.Diagnostics;
using System.Configuration;


namespace office.Utility
{
    /// <summary>
    /// SqlDataBase 的摘要说明。
    /// </summary>
    [ToolboxItem(false)]
    public class SqlDataBase : System.ComponentModel.Component
    {
        #region 私有静态和实例变量
        public string connectionstring = ConfigurationManager.ConnectionStrings["myTestDbConnectionString"].ToString();
        private SqlConnection defaultConnection = null;
        private static Hashtable transactionPool = null;

        private int commandTimeout = 600;
        #endregion

        #region 构造方法

        public SqlDataBase()
        {
            defaultConnection = new SqlConnection(connectionstring);
        }
        #endregion

        #region 静态获取数据库日期公有方法

        public DateTime GetDate()
        {
            SqlCommand command = new SqlCommand("SELECT getdate()", DefaultConnection);
            return ((DateTime)command.ExecuteScalar()).Date;
        }
        public DateTime GetDateTime()
        {
            SqlCommand command = new SqlCommand("SELECT getdate()", DefaultConnection);
            return (DateTime)command.ExecuteScalar();
        }
        #endregion

        #region 静态数据库连接管理公有方法属性

        public SqlConnection DefaultConnection
        {
            get
            {
                if (defaultConnection == null)
                    defaultConnection = new SqlConnection();

                return defaultConnection;
            }
        }
        public void RefreshDefaultConnection()
        {
            if (defaultConnection == null) return;

            SqlConnection con = new SqlConnection(defaultConnection.ConnectionString);
            defaultConnection.Close();
            defaultConnection.Dispose();
            con.Open();
            defaultConnection = con;
        }
        #endregion

        #region 命令超时公有属性

        public int CommandTimeout
        {
            get
            {
                return commandTimeout;
            }
            set
            {
                if (value >= 0)
                    commandTimeout = value;
            }
        }
        #endregion

        #region 数据库连接保护属性
        public virtual SqlConnection CurrentConnection
        {
            get
            {
                return DefaultConnection;
            }
        }

        public virtual void Open()
        {
            if (CurrentConnection.State == ConnectionState.Closed)
            {
                CurrentConnection.Open();
            }
        }

        public virtual void Open(string connectionString)
        {
            if (CurrentConnection.State == ConnectionState.Open)
            {
                CurrentConnection.Close();
            }
            CurrentConnection.ConnectionString = connectionString;
            CurrentConnection.Open();
        }

        public virtual void Close()
        {
            if (CurrentConnection.State == ConnectionState.Open)
            {
                CurrentConnection.Close();
            }
        }

        /// <summary>
        /// 执行多条SQL语句，实现数据库事务。
        /// </summary>
        /// <param name="SQLStringList">多条SQL语句</param>		
        public virtual void ExecuteSqlList(ArrayList sqlList)
        {
            TransactionBegin();
            try
            {
                for (int i = 0; i < sqlList.Count; i++)
                {
                    string sql = sqlList[i].ToString();
                    if (sql.Trim().Length > 1)
                    {
                        ExecuteNonQuery(sql);
                    }
                }
                TransactionCommit();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                TransactionRollBack();
                throw ex;
            }
        }
        public virtual void ExecuteSqlList(string[] sqlList)
        {
            TransactionBegin();
            try
            {
                for (int i = 0; i < sqlList.Length; i++)
                {
                    string sql = sqlList[i].ToString();
                    if (sql.Trim().Length > 1)
                    {
                        ExecuteNonQuery(sql);
                    }
                }
                TransactionCommit();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                TransactionRollBack();
                throw ex;
            }
        }
        #endregion

        #region 事务管理保护方法属性

        [Browsable(false)]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
        public SqlTransaction Transaction
        {
            get
            {
                if (transactionPool == null)
                    transactionPool = new Hashtable();

                if (transactionPool.Contains(CurrentConnection))
                    return ((SqlTransaction)transactionPool[CurrentConnection]);
                else
                    return null;
            }
            set
            {
                if (transactionPool == null)
                    transactionPool = new Hashtable();

                if (transactionPool.Contains(CurrentConnection))
                    transactionPool[CurrentConnection] = value;
                else
                    transactionPool.Add(CurrentConnection, value);
            }
        }
        public SqlTransaction TransactionBegin()
        {
            Transaction = CurrentConnection.BeginTransaction();
            return Transaction;
        }
        public void TransactionCommit()
        {
            if (Transaction != null && Transaction.Connection == CurrentConnection)
                Transaction.Commit();
        }
        public void TransactionSave(string savePointName)
        {
            if (Transaction != null && Transaction.Connection == CurrentConnection)
                Transaction.Save(savePointName);
        }
        public void TransactionRollBack()
        {
            if (Transaction != null && Transaction.Connection == CurrentConnection)
                Transaction.Rollback();
        }
        public void TransactionRollBack(string transactionName)
        {
            if (Transaction != null && Transaction.Connection == CurrentConnection)
                Transaction.Rollback(transactionName);
        }
        #endregion

        #region 获取命令对象保护方法

        public SqlCommand GetCommand(string cmdText, CommandType comType, params SqlParameter[] arrParam)
        {
            SqlCommand command = new SqlCommand(cmdText, CurrentConnection, Transaction);

            command.CommandTimeout = commandTimeout;
            command.CommandType = comType;

            if (arrParam != null)
            {
                foreach (SqlParameter p in arrParam)
                    command.Parameters.Add(p);
            }

            return command;
        }
        public SqlCommand GetCommand(string cmdText, CommandType comType, params object[] arrParamValue)
        {
            SqlParameter[] arrParam = null;

            if (arrParamValue != null)
            {
                arrParam = new SqlParameter[arrParamValue.Length];

                for (int i = 0; i < arrParamValue.Length; i++)
                    arrParam[i] = new SqlParameter("@P" + ((int)(i + 1)).ToString(), arrParamValue[i]);
            }

            return GetCommand(cmdText, comType, arrParam);
        }
        public SqlCommand GetCommand(string cmdText, params SqlParameter[] arrParam)
        {
            return GetCommand(cmdText, CommandType.Text, arrParam);
        }
        public SqlCommand GetCommand(string cmdText, params object[] arrParamValue)
        {
            return GetCommand(cmdText, CommandType.Text, arrParamValue);
        }
        public SqlCommand GetCommand(string cmdText, CommandType comType)
        {
            return GetCommand(cmdText, comType, null);
        }
        public SqlCommand GetCommand(string cmdText)
        {
            return GetCommand(cmdText, CommandType.Text, null);
        }
        public SqlCommand GetCommand()
        {
            return GetCommand("", CommandType.Text, null);
        }
        #endregion

        #region 执行无结果命令保护方法

        public int ExecuteNonQuery(string cmdText, CommandType comType, params SqlParameter[] arrParam)
        {
            return GetCommand(cmdText, comType, arrParam).ExecuteNonQuery();
        }
        public int ExecuteNonQuery(string cmdText, CommandType comType, params object[] arrParamValue)
        {
            return GetCommand(cmdText, comType, arrParamValue).ExecuteNonQuery();
        }
        public int ExecuteNonQuery(string cmdText, params SqlParameter[] arrParam)
        {
            return GetCommand(cmdText, CommandType.Text, arrParam).ExecuteNonQuery();
        }
        public int ExecuteNonQuery(string cmdText, params object[] arrParamValue)
        {
            return GetCommand(cmdText, CommandType.Text, arrParamValue).ExecuteNonQuery();
        }
        public int ExecuteNonQuery(string cmdText, CommandType comType)
        {
            return GetCommand(cmdText, comType).ExecuteNonQuery();
        }
        public int ExecuteNonQuery(string cmdText)
        {
            return GetCommand(cmdText).ExecuteNonQuery();
        }
        #endregion

        #region 执行标量结果命令保护方法

        public object ExecuteScalar(string cmdText, CommandType comType, params SqlParameter[] arrParam)
        {
            return GetCommand(cmdText, comType, arrParam).ExecuteScalar();
        }
        public object ExecuteScalar(string cmdText, CommandType comType, params object[] arrParamValue)
        {
            return GetCommand(cmdText, comType, arrParamValue).ExecuteScalar();
        }
        public object ExecuteScalar(string cmdText, params SqlParameter[] arrParam)
        {
            return GetCommand(cmdText, CommandType.Text, arrParam).ExecuteScalar();
        }
        public object ExecuteScalar(string cmdText, params object[] arrParamValue)
        {
            return GetCommand(cmdText, CommandType.Text, arrParamValue).ExecuteScalar();
        }
        public object ExecuteScalar(string cmdText, CommandType comType)
        {
            return GetCommand(cmdText, comType).ExecuteScalar();
        }
        public object ExecuteScalar(string cmdText)
        {
            return GetCommand(cmdText).ExecuteScalar();
        }
        #endregion

        #region 执行结果集命令保护方法

        public SqlDataReader ExecuteReader(string cmdText, CommandType comType, params SqlParameter[] arrParam)
        {
            return GetCommand(cmdText, comType, arrParam).ExecuteReader(CommandBehavior.CloseConnection);
        }
        public SqlDataReader ExecuteReader(string cmdText, CommandType comType, params object[] arrParamValue)
        {
            return GetCommand(cmdText, comType, arrParamValue).ExecuteReader(CommandBehavior.CloseConnection);
        }
        public SqlDataReader ExecuteReader(string cmdText, params SqlParameter[] arrParam)
        {
            return GetCommand(cmdText, CommandType.Text, arrParam).ExecuteReader(CommandBehavior.CloseConnection);
        }
        public SqlDataReader ExecuteReader(string cmdText, params object[] arrParamValue)
        {
            return GetCommand(cmdText, CommandType.Text, arrParamValue).ExecuteReader(CommandBehavior.CloseConnection);
        }
        public SqlDataReader ExecuteReader(string cmdText, CommandType comType)
        {
            return GetCommand(cmdText, comType).ExecuteReader(CommandBehavior.CloseConnection);
        }
        public SqlDataReader ExecuteReader(string cmdText)
        {
            return GetCommand(cmdText).ExecuteReader(CommandBehavior.CloseConnection);
        }
        #endregion

        #region 获取数据适配器保护方法

        public SqlDataAdapter GetDataAdapter(SqlCommand select)
        {
            return new SqlDataAdapter(select);
        }
        public SqlDataAdapter GetDataAdapter(string selectCommand, CommandType comType, params SqlParameter[] arrParam)
        {
            return GetDataAdapter(GetCommand(selectCommand, comType, arrParam));
        }
        public SqlDataAdapter GetDataAdapter(string selectCommand, CommandType comType, params object[] arrParamValue)
        {
            return GetDataAdapter(GetCommand(selectCommand, comType, arrParamValue));
        }
        public SqlDataAdapter GetDataAdapter(string selectCommand, params SqlParameter[] arrParam)
        {
            return GetDataAdapter(GetCommand(selectCommand, CommandType.Text, arrParam));
        }
        public SqlDataAdapter GetDataAdapter(string selectCommand, params object[] arrParamValue)
        {
            return GetDataAdapter(GetCommand(selectCommand, CommandType.Text, arrParamValue));
        }
        public SqlDataAdapter GetDataAdapter(string selectCommand, CommandType comType)
        {
            return GetDataAdapter(selectCommand, comType, null);
        }
        public SqlDataAdapter GetDataAdapter(string selectCommand)
        {
            return GetDataAdapter(selectCommand, CommandType.Text);
        }
        #endregion

        #region 由DataTable获取查询、更新、插入、删除命令对象保护方法

        public SqlCommand GetSelectCommand(DataTable table, string whereClause)
        {
            SqlCommand selectCommand = GetCommand(string.Empty, CommandType.Text);

            foreach (DataColumn col in table.Columns)
            {
                if (!isRetrieveableField(col))
                    continue;

                if (selectCommand.CommandText == string.Empty)
                    selectCommand.CommandText = "SELECT " + col.ColumnName;
                else
                    selectCommand.CommandText += ", " + col.ColumnName;
            }

            selectCommand.CommandText += " FROM " + table.TableName;

            if (whereClause != null && whereClause.Trim() != string.Empty)
                selectCommand.CommandText += " WHERE " + whereClause.Trim();

            return selectCommand;
        }
        public SqlCommand GetUpdateCommand(DataTable table, bool readBack, bool safeMode)
        {
            SqlCommand updateCommand = GetCommand(string.Empty, CommandType.Text);

            string updateClause = string.Empty;
            string keyOldWhereClause = string.Empty;
            string fullOldWhereClause = string.Empty;
            string selectClause = string.Empty;
            string keyNewWhereClause = string.Empty;

            bool isKey;
            bool isUpdateable;
            bool isRetrieveable;

            //get key columns
            DataColumn[] keyCols = table.PrimaryKey;
            if (keyCols == null || keyCols.Length <= 0) throw new InvalidOperationException("Call error(GetUpdateCommand): Miss key columns.");

            //make clause & add parameter
            foreach (DataColumn col in table.Columns)
            {
                isUpdateable = isUpdateableField(col);
                isRetrieveable = isRetrieveableField(col);

                isKey = false;
                foreach (DataColumn key in keyCols)
                    if (col == key)
                    {
                        isKey = true;
                        break;
                    }

                if (isKey && (!isUpdateable || !isRetrieveable))
                    throw new InvalidOperationException("Call error(GetUpdateCommand): Invalid key column's extendedproperities or name format.");

                if (isUpdateable && !col.AutoIncrement)
                {
                    if (updateClause != string.Empty)
                        updateClause += ", " + col.ColumnName + " = @" + col.ColumnName;
                    else
                        updateClause += col.ColumnName + " = @" + col.ColumnName;

                    //add parameter
                    updateCommand.Parameters.Add(createParameter(col, false));
                }

                if (isKey && (!safeMode))
                {
                    if (keyOldWhereClause != string.Empty)
                        keyOldWhereClause += " AND (" + col.ColumnName + " = @Original_" + col.ColumnName + ")";
                    else
                        keyOldWhereClause += "(" + col.ColumnName + " = @Original_" + col.ColumnName + ")";

                    //add parameter
                    updateCommand.Parameters.Add(createParameter(col, true));
                }
                else if (isUpdateable && safeMode)
                {
                    if (fullOldWhereClause != string.Empty)
                        fullOldWhereClause += " AND ";

                    if (col.AllowDBNull)
                        fullOldWhereClause += "(" + col.ColumnName + " = @Original_" + col.ColumnName + " OR (" + col.ColumnName + " IS NULL AND @Original_" + col.ColumnName + " IS NULL))";
                    else
                        fullOldWhereClause += "(" + col.ColumnName + " = @Original_" + col.ColumnName + ")";

                    //add parameter
                    updateCommand.Parameters.Add(createParameter(col, true));
                }

                if (readBack)
                {
                    if (isRetrieveable)
                    {
                        if (selectClause != string.Empty)
                            selectClause += ", " + col.ColumnName;
                        else
                            selectClause += col.ColumnName;
                    }

                    if (isKey)
                    {
                        if (keyNewWhereClause != string.Empty)
                            keyNewWhereClause += " AND (" + col.ColumnName + " = @" + col.ColumnName + ")";
                        else
                            keyNewWhereClause += "(" + col.ColumnName + " = @" + col.ColumnName + ")";

                        //add parameter
                        if (col.AutoIncrement)
                            updateCommand.Parameters.Add(createParameter(col, false));
                    }
                }
            }

            //update command
            updateCommand.CommandText = "UPDATE " + table.TableName + " SET " + updateClause;

            if (safeMode)
                updateCommand.CommandText += " WHERE " + fullOldWhereClause;
            else
                updateCommand.CommandText += " WHERE " + keyOldWhereClause;

            if (readBack && selectClause != string.Empty)
            {
                updateCommand.CommandText += "; SELECT " + selectClause + " FROM " + table.TableName + " WHERE " + keyNewWhereClause;
                updateCommand.UpdatedRowSource = UpdateRowSource.FirstReturnedRecord;
            }

            return updateCommand;
        }
        public SqlCommand GetInsertCommand(DataTable table, bool readBack)
        {
            SqlCommand insertCommand = GetCommand(string.Empty, CommandType.Text);

            string insertClause = string.Empty;
            string valueClause = string.Empty;
            string selectClause = string.Empty;
            string keyNewWhereClause = string.Empty;

            bool isKey;
            bool isUpdateable;
            bool isRetrieveable;

            //get key columns
            DataColumn[] keyCols = table.PrimaryKey;
            if (keyCols == null || keyCols.Length <= 0) throw new InvalidOperationException("Call error(GetInsertCommand): Miss key columns.");

            //make clause & add parameter
            foreach (DataColumn col in table.Columns)
            {
                isUpdateable = isUpdateableField(col);
                isRetrieveable = isRetrieveableField(col);

                isKey = false;
                foreach (DataColumn key in keyCols)
                    if (col == key)
                    {
                        isKey = true;
                        break;
                    }

                if (isKey && (!isUpdateable || !isRetrieveable))
                    throw new InvalidOperationException("Call error(GetInsertCommand): Invalid key column's extendedproperities or name format.");

                if (isUpdateable && !col.AutoIncrement)
                {
                    if (insertClause != string.Empty)
                        insertClause += ", " + col.ColumnName;
                    else
                        insertClause += col.ColumnName;

                    if (valueClause != string.Empty)
                        valueClause += ", @" + col.ColumnName;
                    else
                        valueClause += "@" + col.ColumnName;

                    //add parameter
                    insertCommand.Parameters.Add(createParameter(col, false));
                }

                if (readBack)
                {
                    if (isRetrieveable)
                    {
                        if (selectClause != string.Empty)
                            selectClause += ", " + col.ColumnName;
                        else
                            selectClause += col.ColumnName;
                    }

                    if (isKey)
                    {
                        if (col.AutoIncrement)
                        {
                            if (keyNewWhereClause != string.Empty)
                                keyNewWhereClause += " AND (" + col.ColumnName + " = @@IDENTITY)";//@@SCOPE_IDENTITY())";
                            else
                                keyNewWhereClause += "(" + col.ColumnName + " = @@IDENTITY)";
                        }
                        else
                        {
                            if (keyNewWhereClause != string.Empty)
                                keyNewWhereClause += " AND (" + col.ColumnName + " = @" + col.ColumnName + ")";
                            else
                                keyNewWhereClause += "(" + col.ColumnName + " = @" + col.ColumnName + ")";
                        }
                    }
                }
            }

            //insert command
            insertCommand.CommandText = "INSERT INTO " + table.TableName + " (" + insertClause + ") VALUES (" + valueClause + ")";

            if (readBack && selectClause != string.Empty)
            {
                insertCommand.CommandText += "; SELECT " + selectClause + " FROM " + table.TableName + " WHERE " + keyNewWhereClause;
                insertCommand.UpdatedRowSource = UpdateRowSource.FirstReturnedRecord;
            }

            return insertCommand;
        }
        public SqlCommand GetDeleteCommand(DataTable table, bool safeMode)
        {
            SqlCommand deleteCommand = GetCommand(string.Empty, CommandType.Text);

            string keyOldWhereClause = string.Empty;
            string fullOldWhereClause = string.Empty;

            bool isKey;
            bool isUpdateable;
            bool isRetrieveable;

            //get key columns
            DataColumn[] keyCols = table.PrimaryKey;
            if (keyCols == null || keyCols.Length <= 0) throw new InvalidOperationException("Call error(GetDeleteCommand): Miss key columns.");

            //make clause & add parameter
            foreach (DataColumn col in table.Columns)
            {
                isUpdateable = isUpdateableField(col);
                isRetrieveable = isRetrieveableField(col);

                isKey = false;
                foreach (DataColumn key in keyCols)
                    if (col == key)
                    {
                        isKey = true;
                        break;
                    }

                if (isKey && (!isUpdateable || !isRetrieveable))
                    throw new InvalidOperationException("Call error(GetDeleteCommand): Invalid key column's extendedproperities or name format.");

                if (isKey && (!safeMode))
                {
                    if (keyOldWhereClause != string.Empty)
                        keyOldWhereClause += " AND (" + col.ColumnName + " = @Original_" + col.ColumnName + ")";
                    else
                        keyOldWhereClause += "(" + col.ColumnName + " = @Original_" + col.ColumnName + ")";

                    //add parameter
                    deleteCommand.Parameters.Add(createParameter(col, true));
                }
                else if (isUpdateable && safeMode)
                {
                    if (fullOldWhereClause != string.Empty)
                        fullOldWhereClause += " AND ";

                    if (col.AllowDBNull)
                        fullOldWhereClause += "(" + col.ColumnName + " = @Original_" + col.ColumnName + " OR (" + col.ColumnName + " IS NULL AND @Original_" + col.ColumnName + " IS NULL))";
                    else
                        fullOldWhereClause += "(" + col.ColumnName + " = @Original_" + col.ColumnName + ")";

                    //add parameter
                    deleteCommand.Parameters.Add(createParameter(col, true));
                }
            }

            //delete command
            deleteCommand.CommandText = "DELETE FROM " + table.TableName;

            if (safeMode)
                deleteCommand.CommandText += " WHERE " + fullOldWhereClause;
            else
                deleteCommand.CommandText += " WHERE " + keyOldWhereClause;

            return deleteCommand;
        }

        #endregion

        #region 辅助私有方法

        private bool isUpdateableField(DataColumn col)
        {
            return isTableField(col.ColumnName);
        }
        private bool isRetrieveableField(DataColumn col)
        {
            return isTableField(col.ColumnName);
        }
        private bool isTableField(string columnName)
        {
            if (columnName.Length < 5)
                return true;
            else
                return (columnName.Substring(0, 5).ToUpper() != "EXPR_" && columnName.Substring(0, 5).ToUpper() != "JOIN_");
        }
        private SqlParameter createParameter(DataColumn col, bool isOriginal)
        {
            SqlDbType type;
            int size;
            int precision = 0;
            int scale = 0;

            if (col.DataType.Equals(typeof(bool)))
            {
                type = SqlDbType.Bit;
                size = 1;
            }
            else if (col.DataType.Equals(typeof(byte)) || col.DataType.Equals(typeof(sbyte)))
            {
                type = SqlDbType.TinyInt;
                size = 1;
            }
            else if (col.DataType.Equals(typeof(short)) || col.DataType.Equals(typeof(ushort)) || col.DataType.Equals(typeof(char)))
            {
                type = SqlDbType.SmallInt;
                size = 2;
            }
            else if (col.DataType.Equals(typeof(int)) || col.DataType.Equals(typeof(uint)))
            {
                type = SqlDbType.Int;
                size = 4;
            }
            else if (col.DataType.Equals(typeof(long)) || col.DataType.Equals(typeof(ulong)))
            {
                type = SqlDbType.BigInt;
                size = 8;
            }
            else if (col.DataType.Equals(typeof(float)))
            {
                type = SqlDbType.Real;
                size = 4;
                precision = 24;
            }
            else if (col.DataType.Equals(typeof(double)))
            {
                type = SqlDbType.Float;
                size = 8;
                precision = 38;
            }
            else if (col.DataType.Equals(typeof(decimal)))
            {
                type = SqlDbType.Decimal;
                size = 17;
                precision = 30;
                scale = 10;
            }
            else if (col.DataType.Equals(typeof(string)))
            {
                if (col.MaxLength == 2147483647)
                {
                    type = SqlDbType.Text;
                }
                else if (col.MaxLength == 1073741823)
                {
                    type = SqlDbType.NText;
                }
                else
                {
                    type = SqlDbType.VarChar;
                }
                //size = 8000;
                size = 0;
            }
            else if (col.DataType.Equals(typeof(byte[])))
            {
                type = SqlDbType.VarBinary;
                //type = SqlDbType.Image;
                size = 8000;
            }
            else if (col.DataType.Equals(typeof(DateTime)))
            {
                type = SqlDbType.DateTime;
                size = 8;
            }
            else
            {
                throw new InvalidCastException("Cann't cast '" + col.DataType.FullName + "' to 'SqlDbType'.");
            }

            return new SqlParameter((isOriginal ? "@Original_" : "@") + col.ColumnName, type, size, ParameterDirection.Input, col.AllowDBNull, (byte)precision, (byte)scale, col.ColumnName, (isOriginal ? DataRowVersion.Original : DataRowVersion.Current), null);
        }
        #endregion

        #region 填充DataTable保护方法
        public virtual DataTable GetDataTableWithSQL(string sql)
        {
            int count;
            return GetDataTableWithSQL(sql, true, out count);
        }
        public virtual DataTable GetDataTableWithSQL(string sql, out int count)
        {
            return GetDataTableWithSQL(sql, true, out count);
        }
        public virtual DataTable GetDataTableWithSQL(string sql, bool acceptChanges, out int count)
        {
            DataTable table = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(GetCommand(sql));
            adapter.AcceptChangesDuringFill = acceptChanges;
            count = adapter.Fill(table);
            return table;
        }
        public virtual int FillDataTableWithSQL(string sql)
        {
            return FillDataTableWithSQL(new DataTable(), sql, true);
        }
        public virtual int FillDataTableWithSQL(DataTable table, string sql)
        {
            return FillDataTableWithSQL(table, sql, true);
        }
        public virtual int FillDataTableWithSQL(DataTable table, string sql, bool acceptChanges)
        {
            SqlDataAdapter adapter = new SqlDataAdapter(sql, CurrentConnection);
            adapter.AcceptChangesDuringFill = acceptChanges;
            try
            {
                return adapter.Fill(table);
            }
            finally
            {
                adapter.Dispose();
            }
        }

        public virtual int FillDataTable(DataTable table, string whereClause, bool acceptChanges)
        {
            SqlDataAdapter adapter = this.GetDataAdapter(this.GetSelectCommand(table, whereClause));
            adapter.AcceptChangesDuringFill = acceptChanges;
            return adapter.Fill(table);
        }
        public virtual int FillDataTable(DataTable table, string whereClause)
        {
            return FillDataTable(table, whereClause, true);
        }
        public virtual int FillDataTable(DataTable table, bool acceptChanges)
        {
            return FillDataTable(table, "", acceptChanges);
        }
        public virtual int FillDataTable(DataTable table)
        {
            return FillDataTable(table, "", true);
        }

        #endregion

        #region 更新DataTable保护方法

        public virtual int UpdateDataTable(DataTable table, bool safeMode, bool readBack)
        {
            SqlDataAdapter adapter = new SqlDataAdapter();

            adapter.SelectCommand = GetSelectCommand(table, "");

            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);

            builder.QuotePrefix = "[";
            builder.QuoteSuffix = "]";

            adapter.UpdateCommand = builder.GetUpdateCommand(true);
            adapter.InsertCommand = builder.GetInsertCommand(true);
            adapter.DeleteCommand = builder.GetDeleteCommand(true);
            //返回自动的增加值！
            adapter.InsertCommand.CommandText = GetInsertCommand(table, readBack).CommandText;

            try
            {
                return adapter.Update(table);
            }
            finally
            {
                adapter.Dispose();
            }

        }
        public virtual int UpdateDataTable(DataTable table)
        {
            return UpdateDataTable(table, true, true);
        }
        #endregion
    }
}
