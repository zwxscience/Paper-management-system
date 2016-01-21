using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
/// <summary>
/// DB 的摘要说明
/// </summary>
	    public class DB
    {
        private string strError = null;
        private int intCount = 0;
        public DB()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }
        /// <summary>
        /// 公开方法DBConn，返回数据库连接
        /// </summary>
        /// <returns></returns>
        public SqlConnection DBconn()
        {
            string strConn = "Server=(local);Database=paper;Uid=sa;pwd=123456";
            try
            {
                return new SqlConnection(strConn);
            }
            catch (Exception)
            {
                return null;
            }
        }
        /// <summary>
        /// 公开属性ErrorMessage，返回错误信息
        /// </summary>
        public string ErrorMessage
        {
            get
            {
                return strError;
            }
        }

        /// <summary>
        /// 根据查询语句从数据库检索数据
        /// </summary>
        /// <param name="strSelect">查询语句</param>
        /// <param name="SqlConn">数据库连接</param>
        /// <returns>有数据则返回DataSet对象，否则返回null</returns>
        public DataSet Select(string SelectString, SqlConnection sqlConn)
        {
            strError = "";
            SqlConnection conn;
            if (sqlConn == null)
            {
                conn = DBconn();
            }
            else
            {
                conn = sqlConn;
            }
            try
            {
                //若数据库连接的当前状态是关闭的，则打开连接
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter();
                SqlCommand selectCommand = new SqlCommand(SelectString, conn);
                selectCommand.CommandType = CommandType.Text;
                mySqlDataAdapter.SelectCommand = selectCommand;
                DataSet myDS = new DataSet();
                mySqlDataAdapter.Fill(myDS);
                return myDS;
            }
            catch (Exception e)
            {
                strError = "数据检索失败：" + e.Message;
                return null;
            }
            finally
            {
                if (conn.State != ConnectionState.Closed)
                {
                    conn.Close();
                }
            }
        }
        /// <summary>
        /// 更新数据库
        /// </summary>
        /// <param name="UpdateString">Update Sql语句</param>
        /// <param name="SqlConn">数据库连接</param>
        /// <returns>更新成功返回true</returns>
        public bool Update(string UpdateString, SqlConnection SqlConn)
        {
            return udiDataBase(UpdateString, SqlConn);
        }
        /// <summary>
        /// 从数据库中删除数据
        /// </summary>
        /// <param name="DeleteString">Delete Sql语句</param>
        /// <param name="SqlConn">数据库连接</param>
        /// <returns>删除成功返回true</returns>
        public bool Delete(string DeleteString, SqlConnection SqlConn)
        {
            return udiDataBase(DeleteString, SqlConn);
        }
        /// <summary>
        /// 把数据插入数据库
        /// </summary>
        /// <param name="InsertString">Insert Sql语句</param>
        /// <param name="SqlConn">数据库连接</param>
        /// <returns>插入成功返回true</returns>
        public bool Insert(string InsertString, SqlConnection SqlConn)
        {
            return udiDataBase(InsertString, SqlConn);
        }
        /// <summary>
        /// 根据Sql语句更新数据库
        /// </summary>
        /// <param name="UDIString">更新语句</param>
        /// <param name="SqlConn">数据库连接</param>
        /// <returns>更新成功则返回true</returns>
        public bool udiDataBase(string UDIString, SqlConnection SqlConn)
        {
            strError = "";
            SqlConnection conn;
            if (SqlConn == null)
            {
                conn = DBconn();
            }
            else
            {
                conn = SqlConn;
            }
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand(UDIString, conn);
                cmd.CommandType = CommandType.Text;
                intCount = cmd.ExecuteNonQuery();
      
                return !(intCount < 1);
            }
            catch (Exception e)
            {
                strError = "更新数据库失败：" + e.Message;
                return false;
            }
            finally
            {
                if (conn.State != ConnectionState.Closed)
                {
                    conn.Close();
                }
            }
        }
    }



