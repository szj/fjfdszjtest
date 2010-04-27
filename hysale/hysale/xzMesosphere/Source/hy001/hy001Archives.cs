using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using XzzLibrary.Source;
using System.Collections;

namespace xzMesosphere.Source
{
    public class HYLoginArchives
    {
        public static void Login(xzServerManage FServerManage)
        {
            string sql = xzSqlConnect.ConnectionString(FServerManage.ServerManageParam.SqlConnectParam);

            SvrDatumProductBrand.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrDatumProductBrand), "ISvrDatumProductBrand");
            SvrDatumProductModel.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrDatumProductModel), "ISvrDatumProductModel");
            SvrDatumProductColor.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrDatumProductColor), "ISvrDatumProductColor");
            SvrDatumProductConfig.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrDatumProductConfig), "ISvrDatumProductConfig");
            SvrDatumOpposite.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrDatumOpposite), "ISvrDatumOpposite");
            SvrDatumProductInfo.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrDatumProductInfo), "ISvrDatumProductInfo");
            SvrDatumFitting.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrDatumFitting), "ISvrDatumFitting");
            SvrDatumLargess.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrDatumLargess), "ISvrDatumLargess");
            SvrDatumPhoneCard.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrDatumPhoneCard), "ISvrDatumPhoneCard");
            SvrSystemGroup.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSystemGroup), "ISvrSystemGroup");

            //�ۼ۹���
            SvrDatumPriceManage.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrDatumPriceManage), "ISvrDatumPriceManage");

            //��Ա����
            SvrDatumMemberManage.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrDatumMemberManage), "ISvrDatumMemberManage");
        }
    }

    /// <summary>
    /// ͨ�õĲ���
    /// </summary>
    public sealed class HYArchivesParam
    {
        public const string _SqlOpposite = "select count(*) from vDatumOpposite where ClientCode={0} and TheCode={1} and ProductSortCode={2} and BillNo<>{3}";

        public const string BillNoCheck = "��ǰ�����Ѿ���������ȡ��ȷ�ϣ�";

        public const string BillHasClose = "��ǰ�����Ѿ��رգ�";

        public const string BillNoInvoice = "��ǰ�����Ѿ���Ʊ������ȡ��ȷ�ϣ�";

        public const string CurrProductIsUse = "��ǰ��Ʒ����ʹ���У�����ɾ����";

        public const string StocksNoEnough = "ִ��ʧ�ܣ���治�㣡";

        public const string UptStorageItemErr = "���¿�洮�����ݴ���";

        public const string UptStorageErr = "���¿����������";

        public const string UptStorageListErr = "���¿����ټ�¼����";

        public const string HasCheck = "��ǰ��������ˣ�����ȡ��ȷ�ϣ�";

        public const string HasCancellation = "��ǰ���������ϣ�����ȡ��ȷ�ϣ�";

        public const string HasVerify = "��ǰ�����Ѿ�����������ȡ��ȷ�ϣ�";

        public const string HasNoConfirm = "�ɱ�ά��ʱ��Σ�{0}--{1} �ڴ���δȷ�ϵĵ��ݣ�����ȷ�ϵ��ݣ�";

        public const string BillHasNoConfirm = "[{0}]����δȷ�ϵĵ��ݣ�����ȷ�ϵ��ݣ�";

        public const string _UptTheCode = " update tbStockOrderItem set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}'" + "\n"
                                        + " update tbStockInvoiceItem set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbSaleOrderItem set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbSaleOutItem set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbSaleOutItemDetail set ProductCode='{0}' where ProductCode='{2}' " + "\n"
                                        + " update tbSaleInvoiceItem set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbStorStockInItem set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbStorStockInItemDetail set ProductCode='{0}' where ProductCode='{2}'" + "\n"
                                        + " update tbStorRedeployItem set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbStorRedeployItemDetail set ProductCode='{0}' where ProductCode='{2}'" + "\n"
                                        + " update tbStorOtherInItem set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbStorOtherInItemDetail set ProductCode='{0}' where ProductCode='{2}'" + "\n"
                                        + " update tbStorOtherOutItem set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbStorOtherOutItemDetail set ProductCode='{0}' where ProductCode='{2}'" + "\n"
                                        + " update tbStorCheckItem set ProductCode='{0}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbStorCheckItemDetail set ProductCode='{0}' where ProductCode='{2}' " + "\n"
                                        + " update tbStorStorage set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbStorStorageItem set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbStorStorageList set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbSelfOrderItem set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbSelfSaleOutItem set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbCourseStorEntrust set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbCourseStorStorage set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbCourseStorMaintain set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbStorMaintainPostSelfItem set ProductCode='{0}',ProductSortCode='{1}' where ProductCode='{2}' and ProductSortCode='{1}' " + "\n"
                                        + " update tbDatumOppositeItem set ProductCode='{0}',ProductSort='{1}' where ProductCode='{2}' and ProductSort='{1}'" + "\n";

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
    /// Ʒ�Ƶ�����ʾ��Ϣ����
    /// </summary>
    public class SvrDatumProductBrand : SvrSystemDB, IServerSkedUserExec
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
                string SqlStr = HYArchivesParam.GetExistsSql("tbDatumProductModel", "BrandCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]))
                                + HYArchivesParam.GetExistsSql("tbDatumProductInfo", "BrandCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]))
                                + HYArchivesParam.GetExistsSql("tbDatumFitting", "BrandCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]))
                                + HYArchivesParam.GetExistsSql("tbDatumLargess", "BrandCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]))
                                + HYArchivesParam._SqlExit;

                //string SqlStr = string.Format(HYArchivesParam._SqlCount, "tbDatumProductModel", "BrandCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]));
                SqlCommand cmd = new SqlCommand(SqlStr, Connect);
                object ACount = cmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYArchivesParam.Warn("��ǰƷ������ʹ���У�����ɾ����");
                }
            }
            finally
            {
                Connect.Close();
            }
        }
    }

    /// <summary>
    /// �ͺŵ�����ʾ��Ϣ����
    /// </summary>
    public class SvrDatumProductModel : SvrSystemDB, IServerSkedUserExec
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
                string SqlStr = string.Format(HYArchivesParam._SqlCount, "tbDatumProductInfo", "ModelCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]));
                SqlCommand cmd = new SqlCommand(SqlStr, Connect);
                object ACount = cmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYArchivesParam.Warn("��ǰ�ͺ�����ʹ���У�����ɾ����");
                }
            }
            finally
            {
                Connect.Close();
            }
        }
    }

    /// <summary>
    /// ��ɫ������ʾ��Ϣ����
    /// </summary>
    public class SvrDatumProductColor : SvrSystemDB, IServerSkedUserExec
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
                string SqlStr = string.Format(HYArchivesParam._SqlCount, "tbDatumProductInfo", "ColorCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]));
                SqlCommand cmd = new SqlCommand(SqlStr, Connect);
                object ACount = cmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYArchivesParam.Warn("��ǰ��ɫ����ʹ���У�����ɾ����");
                }
            }
            finally
            {
                Connect.Close();
            }
        }
    }

    /// <summary>
    /// ���õ�����ʾ��Ϣ����
    /// </summary>
    public class SvrDatumProductConfig : SvrSystemDB, IServerSkedUserExec
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
                string SqlStr = string.Format(HYArchivesParam._SqlCount, "tbDatumProductInfo", "ConfigCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]));
                SqlCommand cmd = new SqlCommand(SqlStr, Connect);
                object ACount = cmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYArchivesParam.Warn("��ǰ��������ʹ���У�����ɾ����");
                }
            }
            finally
            {
                Connect.Close();
            }
        }
    }

    /// <summary>
    /// ���ϱ�����ʾ��Ϣ����
    /// </summary>
    public class SvrDatumOpposite : SvrSystemDB, IServerSkedUserExec
    {
        public void UserExec(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            Connect.Open();
            try
            {
                if (ht[0] != null)
                {
                    DataTable MasterTable = ht[0] as DataTable;
                    if (ht[1] != null)
                    {
                        DataTable DetailTable = ht[1] as DataTable;
                        for (int i = 0; i < DetailTable.Rows.Count; i++)
                        {
                            string SqlStr = string.Format(HYArchivesParam._SqlOpposite, string.Format("'{0}'", MasterTable.Rows[0]["ClientCode"]),
                                string.Format("'{0}'", DetailTable.Rows[i]["ProductCode"]), string.Format("'{0}'", DetailTable.Rows[i]["ProductSort"]),
                                string.Format("'{0}'", MasterTable.Rows[0]["BillNo"]));
                            SqlCommand cmd = new SqlCommand(SqlStr, Connect);
                            object ACount = cmd.ExecuteScalar();
                            if ((Int32)ACount > 0)
                            {
                                HYArchivesParam.Warn("��" + string.Format("[{0}]", DetailTable.Rows[i]["RowNo"]) 
                                    + "����Ʒ���" + string.Format("[{0}]", DetailTable.Rows[i]["ProductCode"]) + "����Ӧ�Ŀͻ����϶�Ӧ�����Ѷ��壡");
                            }
                        }
                    }
                }
            }
            finally
            {
                Connect.Close();
            }
        }

        public void UserExec(DataSet ds, int ID, xzRemotingParam RemotingParam)
        {
        }

        public void UserExec(DataTable dt, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            #region ɾ����Ʒ����ж�
            Connect.Open();
            try
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string SqlStr = string.Format(HYArchivesParam._SqlExistsProduct, "tbSaleOrderItem", "ProductCode", 
                            string.Format("'{0}'", dt.Rows[0]["ProductCode"]), "ProductSortCode", string.Format("{0}", dt.Rows[0]["ProductSort"]))
                        + string.Format(HYArchivesParam._SqlExistsProduct, "tbSaleOutItem", "ProductCode", 
                            string.Format("'{0}'", dt.Rows[0]["ProductCode"]), "ProductSortCode", string.Format("{0}", dt.Rows[0]["ProductSort"]))
                        + string.Format(HYArchivesParam._SqlExistsProduct, "tbSaleInvoiceItem", "ProductCode", 
                            string.Format("'{0}'", dt.Rows[0]["ProductCode"]), "ProductSortCode", string.Format("{0}", dt.Rows[0]["ProductSort"]))
                        + HYArchivesParam._SqlExit;
                    SqlCommand cmd = new SqlCommand(SqlStr, Connect);
                    object ACount = cmd.ExecuteScalar();
                    if ((Int32)ACount > 0)
                    {
                        HYArchivesParam.Warn(HYArchivesParam.CurrProductIsUse);
                    }
                }
            }
            finally
            {
                Connect.Close();
            }
            #endregion

        }
    }

    /// <summary>
    /// �ֻ��������ݴ���
    /// </summary>
    public class SvrDatumProductInfo : SvrSystemDB, IServerSkedUserExec
    {
        public void UserExec(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            #region �޸���Ʒ���
            Connect.Open();
            try
            {
                string SqlStr = string.Format(HYArchivesParam._SqlCount, "tbDatumProductInfo", "TheCode", string.Format("'{0}'", (string)(ht[0])));
                SqlCommand Sqlcmd = new SqlCommand(SqlStr, Connect);
                object ACount = Sqlcmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYArchivesParam.Warn("��ǰ��Ʒ����Ѵ��ڣ����������룡");
                }

                string UpdateStr = string.Format(HYArchivesParam._UptTheCode + " update tbDatumProductInfo set TheCode='{0}' where TheCode='{2}' " + "\n",
                    (string)(ht[0]), (string)(ht[1]), (string)(ht[2]));

                SqlCommand cmd = new SqlCommand(UpdateStr, Connect);
                //HYArchivesParam.Warn(Convert.ToString(cmd));
                //cmd.Transaction = Tran;
                if (cmd.ExecuteNonQuery() <= 0) 
                {
                    HYArchivesParam.Warn("ִ��ʧ�ܣ�");
                }
            }
            finally
            {
                Connect.Close();
            }
            #endregion
        }

        public void UserExec(DataSet ds, int ID, xzRemotingParam RemotingParam)
        {

        }

        public void UserExec(DataTable dt, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            #region ɾ����Ʒ����ж�
            Connect.Open();
            try
            {
                string SqlStr = string.Format(HYArchivesParam._SqlExistsProduct, "tbStockOrderItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "001")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStockInvoiceItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "001")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSaleOrderItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "001")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSaleOutItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "001")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSaleInvoiceItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "001")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStockInItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "001")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorRedeployItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "001")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorOtherInItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "001")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorOtherOutItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "001")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorCheckItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "001")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStorage", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "001")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStorageItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "001")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStorageList", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "001")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSelfOrderItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "001")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSelfSaleOutItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "001")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbDatumOppositeItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSort", "001")
                    + HYArchivesParam._SqlExit;

                //string SqlStr = string.Format(HYArchivesParam._SqlCount, "tbDatumProductInfo", "ConfigCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]));
                SqlCommand cmd = new SqlCommand(SqlStr, Connect);
                object ACount = cmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYArchivesParam.Warn(HYArchivesParam.CurrProductIsUse);
                }
            }
            finally
            {
                Connect.Close();
            }
            #endregion
        }
    }

    /// <summary>
    /// ����������ݴ���
    /// </summary>
    public class SvrDatumFitting : SvrSystemDB, IServerSkedUserExec
    {
        public void UserExec(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            Connect.Open();
            try
            {
                string SqlStr = string.Format(HYArchivesParam._SqlCount, "tbDatumFitting", "TheCode", string.Format("'{0}'", (string)(ht[0])));
                SqlCommand Sqlcmd = new SqlCommand(SqlStr, Connect);
                object ACount = Sqlcmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYArchivesParam.Warn("��ǰ��Ʒ����Ѵ��ڣ����������룡");
                }

                string UpdateStr = string.Format(HYArchivesParam._UptTheCode + " update tbDatumFitting set TheCode='{0}' where TheCode='{2}' " + "\n",
                    (string)(ht[0]), (string)(ht[1]), (string)(ht[2]));

                SqlCommand cmd = new SqlCommand(UpdateStr, Connect);
                //HYArchivesParam.Warn(Convert.ToString(cmd));
                //cmd.Transaction = Tran;
                if (cmd.ExecuteNonQuery() <= 0)
                {
                    HYArchivesParam.Warn("ִ��ʧ�ܣ�");
                }
                else
                {
                    HYArchivesParam.Warn("ִ�гɹ���");
                }
            }
            finally
            {
                Connect.Close();
            }
        }

        public void UserExec(DataSet ds, int ID, xzRemotingParam RemotingParam)
        {
        }

        public void UserExec(DataTable dt, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            #region ɾ����Ʒ����ж�
            Connect.Open();
            try
            {
                string SqlStr = string.Format(HYArchivesParam._SqlExistsProduct, "tbStockOrderItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "002")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStockInvoiceItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "002")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSaleOrderItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "002")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSaleOutItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "002")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSaleInvoiceItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "002")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStockInItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "002")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorRedeployItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "002")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorOtherInItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "002")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorOtherOutItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "002")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorCheckItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "002")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStorage", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "002")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStorageItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "002")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStorageList", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "002")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSelfOrderItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "002")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSelfSaleOutItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "002")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbDatumOppositeItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSort", "002")
                    + HYArchivesParam._SqlExit;

                //string SqlStr = string.Format(HYArchivesParam._SqlCount, "tbDatumProductInfo", "ConfigCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]));
                SqlCommand cmd = new SqlCommand(SqlStr, Connect);
                object ACount = cmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYArchivesParam.Warn(HYArchivesParam.CurrProductIsUse);
                }
            }
            finally
            {
                Connect.Close();
            }
            #endregion
        }
    }

    /// <summary>
    /// �绰���������ݴ���
    /// </summary>
    public class SvrDatumPhoneCard : SvrSystemDB, IServerSkedUserExec
    {
        public void UserExec(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            Connect.Open();
            try
            {
                string SqlStr = string.Format(HYArchivesParam._SqlCount, "tbDatumPhoneCard", "TheCode", string.Format("'{0}'", (string)(ht[0])));
                SqlCommand Sqlcmd = new SqlCommand(SqlStr, Connect);
                object ACount = Sqlcmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYArchivesParam.Warn("��ǰ��Ʒ����Ѵ��ڣ����������룡");
                }

                string UpdateStr = string.Format(HYArchivesParam._UptTheCode + " update tbDatumPhoneCard set TheCode='{0}' where TheCode='{2}' " + "\n",
                    (string)(ht[0]), (string)(ht[1]), (string)(ht[2]));

                SqlCommand cmd = new SqlCommand(UpdateStr, Connect);
                if (cmd.ExecuteNonQuery() <= 0)
                {
                    HYArchivesParam.Warn("ִ��ʧ�ܣ�");
                }
                else
                {
                    HYArchivesParam.Warn("ִ�гɹ���");
                }
            }
            finally
            {
                Connect.Close();
            }
        }

        public void UserExec(DataSet ds, int ID, xzRemotingParam RemotingParam)
        {
        }

        public void UserExec(DataTable dt, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            #region ɾ����Ʒ����ж�
            Connect.Open();
            try
            {
                string SqlStr = string.Format(HYArchivesParam._SqlExistsProduct, "tbStockOrderItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStockInvoiceItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStockReturnNoticeItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSaleOrderItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSaleOutItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSaleInvoiceItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStockInItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorRedeployItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorRedeployLeagueItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorOtherInItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorOtherOutItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorBorrowItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorRestoreItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorCheckItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStorage", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStorageItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStorageList", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSelfOrderItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSelfSaleOutItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSelfLeagueSaleItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSelfPriceManageItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "003")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbDatumOppositeItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSort", "003")
                    + HYArchivesParam._SqlExit;

                //string SqlStr = string.Format(HYArchivesParam._SqlCount, "tbDatumProductInfo", "ConfigCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]));
                SqlCommand cmd = new SqlCommand(SqlStr, Connect);
                object ACount = cmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYArchivesParam.Warn(HYArchivesParam.CurrProductIsUse);
                }
            }
            finally
            {
                Connect.Close();
            }
            #endregion
        }
    }

    /// <summary>
    /// ��Ʒ�������ݴ���
    /// </summary>
    public class SvrDatumLargess : SvrSystemDB, IServerSkedUserExec
    {
        public void UserExec(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            Connect.Open();
            try
            {
                string SqlStr = string.Format(HYArchivesParam._SqlCount, "tbDatumLargess", "TheCode", string.Format("'{0}'", (string)(ht[0])));
                SqlCommand Sqlcmd = new SqlCommand(SqlStr, Connect);
                object ACount = Sqlcmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYArchivesParam.Warn("��ǰ��Ʒ����Ѵ��ڣ����������룡");
                }

                string UpdateStr = string.Format(HYArchivesParam._UptTheCode + " update tbDatumLargess set TheCode='{0}' where TheCode='{2}' " + "\n",
                    (string)(ht[0]), (string)(ht[1]), (string)(ht[2]));

                SqlCommand cmd = new SqlCommand(UpdateStr, Connect);
                if (cmd.ExecuteNonQuery() <= 0)
                {
                    HYArchivesParam.Warn("ִ��ʧ�ܣ�");
                }
                else
                {
                    HYArchivesParam.Warn("ִ�гɹ���");
                }
            }
            finally
            {
                Connect.Close();
            }
        }

        public void UserExec(DataSet ds, int ID, xzRemotingParam RemotingParam)
        {
        }

        public void UserExec(DataTable dt, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            #region ɾ����Ʒ����ж�
            Connect.Open();
            try
            {
                string SqlStr = string.Format(HYArchivesParam._SqlExistsProduct, "tbStockOrderItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStockInvoiceItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStockReturnNoticeItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSaleOrderItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSaleOutItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSaleInvoiceItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStockInItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorRedeployItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorRedeployLeagueItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorOtherInItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorOtherOutItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorBorrowItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorRestoreItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorCheckItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStorage", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStorageItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbStorStorageList", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSelfOrderItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSelfSaleOutItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSelfLeagueSaleItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbSelfPriceManageItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSortCode", "004")
                    + string.Format(HYArchivesParam._SqlExistsProduct, "tbDatumOppositeItem", "ProductCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]), "ProductSort", "004")
                    + HYArchivesParam._SqlExit;

                //string SqlStr = string.Format(HYArchivesParam._SqlCount, "tbDatumProductInfo", "ConfigCode", string.Format("'{0}'", dt.Rows[0]["TheCode"]));
                SqlCommand cmd = new SqlCommand(SqlStr, Connect);
                object ACount = cmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYArchivesParam.Warn(HYArchivesParam.CurrProductIsUse);
                }
            }
            finally
            {
                Connect.Close();
            }
            #endregion
        }
    }

    /// <summary>
    /// �û�����ʾ��Ϣ����
    /// </summary>
    public class SvrSystemGroup : SvrSystemDB, IServerSkedUserExec
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
                string SqlStr = HYArchivesParam.GetExistsSql("tsSystemGroupUser", "GroupNo", string.Format("'{0}'", dt.Rows[0]["TheCode"]))
                                + HYArchivesParam._SqlExit;

                SqlCommand cmd = new SqlCommand(SqlStr, Connect);
                object ACount = cmd.ExecuteScalar();
                if ((Int32)ACount > 0)
                {
                    HYArchivesParam.Warn("��ǰ������ʹ���У�����ɾ����ǰ����û���");
                }
            }
            finally
            {
                Connect.Close();
            }
        }
    }

    /// <summary>
    /// �ۼ۹���
    /// </summary>
    public class SvrDatumPriceManage : SvrSystemDB, IServerSkedUserExecEx
    {
        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;
            DataTable Table;

            Hashtable htResult = new Hashtable();
            Connect.Open();
            try
            {
                switch (ID)
                {
                    case 0:
                        #region ��ȡ��ǰ��ͳһ�۸��嵥
                        using (SqlDataAdapter SqlDa = new SqlDataAdapter())
                        using (SqlCommand FCommand = new SqlCommand())
                        {
                            FCommand.Connection = Connect;
                            SqlDa.SelectCommand = FCommand;

                            //�����ǰ���ۼ۱��е�������������������
                            FCommand.CommandText = "Select getdate()";
                            DateTime TheTime = Convert.ToDateTime(FCommand.ExecuteScalar());
                            FCommand.CommandText = string.Format(@"select top 1 a.PriceSort,a.ProductSortCode,b.ProductSortName,a.ProductCode
                              ,b.TheName ProductName,b.ConfigName,b.UnitName, a.SerialNo
                              ,a.BeginTime,a.SalePrice,a.SelfSalePrice,a.SelfSalePrice1,a.Remark
                            from tbDatumPriceManage a
                                 left outer join vDatumProduct b on a.ProductCode=b.TheCode and a.ProductSortCode=b.ProductSort
                            where a.PriceSort = '001' and a.BeginTime<= '{0}'", TheTime);
                            Table = new DataTable();
                            SqlDa.Fill(Table);
                            ArrayList PriceManageArg = new ArrayList();
                            foreach (DataRow CurrRow in Table.Rows)
                                PriceManageArg.Add(string.Format("{0}\r{1}", CurrRow["ProductSortCode"], CurrRow["ProductCode"]));

                            //�������δ���������Ĳ�Ʒ
                            DataTable tmpTable = new DataTable();
                            FCommand.CommandText = "select ProductSort, ProductSortName , TheCode, TheName  from vDatumProduct";
                            SqlDa.Fill(tmpTable);

                            //�ϲ����͵��ͻ���
                            foreach (DataRow CurrRow in tmpTable.Rows)
                            {
                                string key = string.Format("{0}\r{1}", CurrRow["ProductSort"], CurrRow["TheCode"]);
                                if (!PriceManageArg.Contains(key))
                                {
                                    DataRow newCurrRow = Table.NewRow();
                                    newCurrRow["PriceSort"] = "001";
                                    newCurrRow["ProductSortCode"] = CurrRow["ProductSort"];
                                    newCurrRow["ProductSortName"] = CurrRow["ProductSortName"];
                                    newCurrRow["ProductCode"] = CurrRow["TheCode"];
                                    newCurrRow["ProductName"] = CurrRow["TheName"];
                                    Table.Rows.Add(newCurrRow);
                                }
                            }

                            htResult.Add(0, Table);
                            return htResult;
                        }
                        #endregion                        
                    case 1:
                        #region ���������ۼ�
                        Table = ht[2] as DataTable;
                        using (SqlCommand FCommand = new SqlCommand())
                        {
                            FCommand.Connection = Connect;
                            SqlTransaction SqlTrans = Connect.BeginTransaction();
                            try
                            {
                                FCommand.Transaction = SqlTrans;
                                foreach (DataRow CurrRow in Table.Rows)
                                {
                                    FCommand.CommandText = string.Format(@"update tbDatumPriceManage set
                                            BeginTime = {6} , SalePrice = {7} , SelfSalePrice = {8}, SelfSalePrice1 = {9},
                                            Remark = '{10}',  Editer = '{11}', EditeTime = {12}
                                          where PriceSort = '{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' 
                                             and TheSort = '{3}'  and TheCode = '{4}' and SerialNo = {5}"
                                       , CurrRow["PriceSort"], CurrRow["ProductSortCode"], CurrRow["ProductCode"]
                                       , CurrRow["TheSort"], CurrRow["TheCode"], CurrRow["SerialNo"],
                                        xzSqlAnalysis.GetNull(CurrRow["BeginTime"]),
                                        xzSqlAnalysis.getValue(CurrRow["SalePrice"]),
                                        xzSqlAnalysis.getValue(CurrRow["SelfSalePrice"]), xzSqlAnalysis.getValue(CurrRow["SelfSalePrice1"])
                                       , CurrRow["Remark"], ht[0],  xzSqlAnalysis.GetNull(ht[1]));                                   
                                    FCommand.ExecuteNonQuery();
                                }
                                SqlTrans.Commit();
                            }
                            catch (Exception err)
                            {
                                SqlTrans.Rollback();
                                xzException.WarnBox(err.Message);
                            }
                        }
                        #endregion
                        break;
                    case 2:
                        #region ��������ۼ�
                        Table = ht[1] as DataTable;
                        using (SqlCommand FCommand = new SqlCommand())
                        {
                            FCommand.Connection = Connect;
                            SqlTransaction SqlTrans = Connect.BeginTransaction();
                            try
                            {
                                FCommand.Transaction = SqlTrans;
                                foreach (DataRow CurrRow in Table.Rows)
                                {
                                    FCommand.CommandText = string.Format(@"delete tbDatumPriceManage
                                          where PriceSort = '{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' 
                                             and TheSort = '{3}'  and TheCode = '{4}' and SerialNo = {5}"
                                       , CurrRow["PriceSort"], CurrRow["ProductSortCode"], CurrRow["ProductCode"]
                                       , CurrRow["TheSort"], CurrRow["TheCode"], CurrRow["SerialNo"]);
                                    FCommand.ExecuteNonQuery();
                                }
                                SqlTrans.Commit();
                            }
                            catch (Exception err)
                            {
                                SqlTrans.Rollback();
                                xzException.WarnBox(err.Message);
                            }
                        }
                        #endregion
                        break;
                    case 3:
                        #region ά�������ۼ�[�ų�]
                        using (SqlCommand FCommand = new SqlCommand())
                        {
                            FCommand.Connection = Connect;
                            FCommand.CommandText = string.Format(@"Select max(SerialNo) + 1  from tbDatumPriceManage 
                                  where PriceSort = '{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' 
                                             and TheSort = '{3}'  and TheCode = '{4}'", ht[0], ht[1], ht[2], ht[5], ht[6]);
                            decimal SerialNo = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());

                            FCommand.CommandText = string.Format(@"insert into tbDatumPriceManage 
                           (PriceSort, ProductSortCode, ProductCode, TheSort, TheCode, BeginTime , 
                                  SalePrice, SelfSalePrice, SelfSalePrice1, Remark, Creater, CreateTime, SerialNo)  values 
                           ('{0}', '{1}' , '{2}' , '{3}', '{4}', {5} ,{6} , {7} , {8}, '{9}', '{10}', {11}, {12})"
                            ,  ht[0], ht[1], ht[2], ht[5], ht[6],  xzSqlAnalysis.GetNull(ht[7])  ,   
                               xzSqlAnalysis.getValue(ht[9]),xzSqlAnalysis.getValue(ht[10]), xzSqlAnalysis.getValue(ht[11]),
                               ht[12], ht[3], xzSqlAnalysis.GetNull(ht[4]), SerialNo);
                            FCommand.ExecuteNonQuery();
                        }
                        #endregion
                        break;
                    case 10:
                        #region ���������ۼ�
                        Table = ht[2] as DataTable;
                        using (SqlCommand FCommand = new SqlCommand())
                        {
                            FCommand.Connection = Connect;
                            SqlTransaction SqlTrans = Connect.BeginTransaction();
                            try
                            {
                                FCommand.Transaction = SqlTrans;
                                foreach (DataRow CurrRow in Table.Rows)
                                {
                                    FCommand.CommandText = string.Format(@"update tbDatumPriceManage set
                                            TheState = dbo.SetByteToBoolean(TheState,0x0001,1), Stater = '{6}', StateTime = {7}
                                          where PriceSort = '{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' 
                                             and TheSort = '{3}'  and TheCode = '{4}' and SerialNo = '{5}'"
                                       , CurrRow["PriceSort"], CurrRow["ProductSortCode"], CurrRow["ProductCode"]
                                       , CurrRow["TheSort"], CurrRow["TheCode"], CurrRow["SerialNo"]
                                       , ht[0], xzSqlAnalysis.GetNull(ht[1]));
                                    FCommand.ExecuteNonQuery();
                                }
                                SqlTrans.Commit();
                            }
                            catch (Exception err)
                            {
                                SqlTrans.Rollback();
                                xzException.WarnBox(err.Message);
                            }
                        }
                        #endregion
                        break;
                    case 11:
                        #region ���������ۼ�
                        Table = ht[2] as DataTable;
                        using (SqlCommand FCommand = new SqlCommand())
                        {
                            FCommand.Connection = Connect;
                            SqlTransaction SqlTrans = Connect.BeginTransaction();
                            try
                            {
                                FCommand.Transaction = SqlTrans;
                                foreach (DataRow CurrRow in Table.Rows)
                                {
                                    FCommand.CommandText = string.Format(@"update tbDatumPriceManage set
                                            TheState = dbo.SetByteToBoolean(TheState,0x0001,0), Stater = null, StateTime = null
                                          where PriceSort = '{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' 
                                             and TheSort = '{3}'  and TheCode = '{4}' and SerialNo = '{5}'"
                                       , CurrRow["PriceSort"], CurrRow["ProductSortCode"], CurrRow["ProductCode"]
                                       , CurrRow["TheSort"], CurrRow["TheCode"], CurrRow["SerialNo"]);
                                    FCommand.ExecuteNonQuery();
                                }
                                SqlTrans.Commit();
                            }
                            catch (Exception err)
                            {
                                SqlTrans.Rollback();
                                xzException.WarnBox(err.Message);
                            }
                        }
                        #endregion
                        break;
                }
            }
            finally
            {
                Connect.Close();
            }
            return null;
        }
    }

    /// <summary>
    /// ���ַ���
    /// </summary>
    public class SvrDatumMemberManage : SvrSystemDB, IServerSkedUserExecEx
    {
        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;            
            Hashtable htResult = new Hashtable();
            Connect.Open();
            try
            {
                switch (ID)
                {
                    case 0:
                        #region ������ֲ���
                        using (SqlCommand FCommand = new SqlCommand())
                        {
                            FCommand.Connection = Connect;
                            SqlTransaction SqlTrans = Connect.BeginTransaction();
                            try
                            {
                                FCommand.Transaction = SqlTrans;
                                FCommand.Parameters.Add("@Expenditure", SqlDbType.Image);
                                foreach (string key in ht.Keys)
                                {
                                    FCommand.CommandText = string.Format("update tbDatumMemberSort set Expenditure=@Expenditure where TheCode='{0}'"
                                        , key);
                                    FCommand.Parameters["@Expenditure"].Value = ht[key];
                                    FCommand.ExecuteNonQuery();
                                }
                                SqlTrans.Commit();
                            }
                            catch (Exception err)
                            {
                                SqlTrans.Rollback();
                                xzException.WarnBox(err.Message);
                            }
                        }

                        #endregion
                        break;
                    case 1:
                        #region ��ȡ���ֲ���
                        //string s_Sql = string.Format("select Expenditure from tbDatumProductSort where TheCode='{0}'", TheCode);
                        //SqlCommand cmd = new SqlCommand(s_Sql, Connect);
                        //object objStream = cmd.ExecuteScalar();
                        //if (objStream != null && objStream != DBNull.Value)
                        //{
                        //    htResult.Add(0, objStream);
                        //}
                        #endregion
                        break;
                }
            }
            finally
            {
                Connect.Close();
            }            
            return htResult;            
        }
    }
}
