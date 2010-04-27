using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using XzzLibrary.Source;
using System.Collections;

namespace xzMesosphere.Source
{
    public class HyTradeArchives
    {
        public static void Login(xzServerManage FServerManage)
        {
            string sql = xzSqlConnect.ConnectionString(FServerManage.ServerManageParam.SqlConnectParam);

            SvrDatumProductItem.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrDatumProductItem), "ISvrDatumProductItem");

            SvrDatumProduct.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrDatumProduct), "ISvrDatumProduct");

            SvrDatumProductSort.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrDatumProductSort), "ISvrDatumProductSort");
        }
    }

    /// <summary>
    /// ͨ�õĲ���
    /// </summary>
    public sealed class HYTradeParam
    {

        public const string BillNoCheck = "��ǰ�����Ѿ���������ȡ��ȷ�ϣ�";

        public const string BillHasClose = "��ǰ�����Ѿ��رգ�";

        public const string BillNoInvoice = "��ǰ�����Ѿ���Ʊ������ȡ��ȷ�ϣ�";

        public const string CurrProductIsUse = "��ǰ��Ʒ����ʹ���У�����ɾ����";


        //�����ѯ������ڲ�ѯ����Ƿ���ڣ�������ڷ��ش���0
        public const string _SqlCount = "select count(*) from {0} where {1}={2}";

        //�����ѯ������ڲ�ѯ����Ƿ���ڣ�������ڷ���1��������Ϊ0
        public const string _SqlExists = "if exists(select 1 from {0} where {1}={2} having Count(*)>0 ) " + "\n"
                                      + "begin " + "\n"
                                      + "  goto Ex " + "\n"
                                      + "end " + "\n";

        public const string _SqlExistsProduct = "if exists(select 1 from {0} where {1}={2} and {3}='{4}' having Count(*)>0 ) " + "\n"
                                      + "begin " + "\n"
                                      + "  goto Ex " + "\n"
                                      + "end " + "\n";

        public const string _SqlExit = "select 0 " + "\n"
                                      + "return " + "\n"
                                      + "Ex: " + "\n"
                                      + "begin " + "\n"
                                      + "  select 1 " + "\n"
                                      + "  return " + "\n"
                                      + "end " + "\n";

        public static string GetExistsSql(String TableName, String FieldName, String FieldValue)
        {
            string SqlStr = "";
            SqlStr = string.Format(_SqlExists, TableName, FieldName, FieldValue);
            return SqlStr;
        }


        //�׳��쳣����
        public static void Warn(string Msg)
        {
            xzException.WarnBox(Msg);
            //Exception e = new Exception(Msg);
            //e.Data.Add(xzException.Key, new xzException(xzExceptionMode.User));
            //throw e;
        }
    }

    /// <summary>
    /// ��Ʒ���͵�����ʾ��Ϣ����
    /// </summary>
    class SvrDatumProductSort : SvrSystemDB, IServerSkedUserExec
    {
        public void UserExec(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
        }

        public void UserExec(DataSet ds, int ID, xzRemotingParam RemotingParam)
        {
        }

        public void UserExec(DataTable dt, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            Connect.Open();
            try
            {
                string SqlStr = HYTradeParam.GetExistsSql("tbDatumProductItem", "BelongSort", string.Format("'{0}'", dt.Rows[0]["TheCode"]))
                                + HYTradeParam.GetExistsSql("tbDatumProduct", "BelongSort", string.Format("'{0}'", dt.Rows[0]["TheCode"]))
                                + HYTradeParam._SqlExit;

                //string SqlStr = string.Format(HYTradeParam._SqlCount, "tbDatumProductModel", "BrandCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]));
                SqlCommand cmd = new SqlCommand(SqlStr, Connect);
                object ACount = cmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYTradeParam.Warn("��ǰ��Ʒ����ʹ���У�����ɾ����");
                }
            }
            finally
            {
                Connect.Close();
            }
        }
    }

    /// <summary>
    /// ��Ʒ���͵�����ʾ��Ϣ����
    /// </summary>
    class SvrDatumProductItem : SvrSystemDB, IServerSkedUserExec
    {
        public void UserExec(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
        }

        public void UserExec(DataSet ds, int ID, xzRemotingParam RemotingParam)
        {
        }

        public void UserExec(DataTable dt, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            Connect.Open();
            try
            {
                string SqlStr = HYTradeParam.GetExistsSql("tbDatumProduct", "BelongSort", string.Format("'{0}'", dt.Rows[0]["TheCode"]))
                                + HYTradeParam._SqlExit;

                //string SqlStr = string.Format(HYArchivesParam._SqlCount, "tbDatumProductModel", "BrandCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]));
                SqlCommand cmd = new SqlCommand(SqlStr, Connect);
                object ACount = cmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYTradeParam.Warn("��ǰƷ������ʹ���У�����ɾ����");
                }
            }
            finally
            {
                Connect.Close();
            }
        }
    }

    /// <summary>
    /// ��Ʒ������ʾ��Ϣ����   
    /// </summary>
    class SvrDatumProduct : SvrSystemDB, IServerSkedUserExec
    {
        public void UserExec(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
        }

        public void UserExec(DataSet ds, int ID, xzRemotingParam RemotingParam)
        {
        }

        public void UserExec(DataTable dt, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            Connect.Open();
            try
            {
                string SqlStr = HYTradeParam.GetExistsSql("tbcOrderCartonItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]))
                                //+ HYTradeParam.GetExistsSql("tbDatumProductInfo", "BrandCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]))
                                //+ HYTradeParam.GetExistsSql("tbDatumFitting", "BrandCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]))
                                //+ HYTradeParam.GetExistsSql("tbDatumLargess", "BrandCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]))
                                + HYTradeParam._SqlExit;

                //string SqlStr = string.Format(HYTradeParam._SqlCount, "tbDatumProductModel", "BrandCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]));
                SqlCommand cmd = new SqlCommand(SqlStr, Connect);
                object ACount = cmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYTradeParam.Warn("��ǰƷ������ʹ���У�����ɾ����");
                }
            }
            finally
            {
                Connect.Close();
            }
        }
    }

    
}
