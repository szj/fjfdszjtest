using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using XzzLibrary.Source;
using System.Collections;

namespace xzMesosphere.Source
{
    public class HyTradeSample
    {
        public static void Login(xzServerManage FServerManage)
        {
            string sql = xzSqlConnect.ConnectionString(FServerManage.ServerManageParam.SqlConnectParam);

            SvrDatumProductItem.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrcOrderCustomerItem), "ISvrcOrderCustomerItem");   //��������

            SvrDatumProductSort.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrcSampleSend), "ISvrcSampleSend");                 //��������

            SvrDatumProduct.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrcManuFollow), "ISvrcManuFollow");                 //��������

            SvrDatumProduct.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrcManuTest), "ISvrcManuTest");                     //���ٲ���               
        }
    }

    public sealed class SampleParam
    {
        /// <summary>
        /// ȡ��״̬���Ӧ���������
        /// </summary>
        /// <param name="Isplus">״̬λ tree & false</param>
        /// <returns></returns> ����������� + & -
        public static string IsAdd(bool Isplus)
        {
            return (Isplus) ? "+" : "-";
        }

        /// <summary>
        /// ȡ��״̬���Ӧ��������ֵ
        /// </summary>
        /// <param name="Isplus"></param>
        /// <returns></returns> �� 0 �� 1
        public static string IsOne(bool Isplus)
        {
            return (Isplus) ? "0" : "1";
        }

        //���µ����Ƿ�ʹ��
        public const string _UptIsUse = "Update {0} set IsUse = dbo.SetByteToBoolean({0}.IsUse,{4},{3}) from {0},{1} where {0}.BargainCode = {1}.SrcBillNo and {1}.BillNo = {2}";
        
        //���¼������ݴӱ��¼״̬
        public const string _UptSendUseState = "Update tbcSampleSendItem set UseState = dbo.SetByteToBoolean(UseState,0x0001,{0}) where BillNo = '{1}' and RowNo = {2}";

        //���¿ͻ��������ӱ��¼��һ״̬λ
        public const string _UptOrderDetailOne = "Update tbcOrderCustomerItemDetail set UseState = dbo.SetByteToBoolean(UseState,0x0001,{0}) where BillNo = '{1}' and RowNo = {2} and DetailNo = {3}"; 

        //���¿ͻ��������ӱ��¼�ڶ�״̬λ
        public const string _UptOrderDetailTwo = "Update tbcOrderCustomerItemDetail set UseState = dbo.SetByteToBoolean(UseState,0x0002,{0}) where BillNo = '{1}' and RowNo = {2} and DetailNo = {3}";

        /// <summary>
        /// �������ñ��IsUse�ֶ�����־�����ѱ�����
        /// </summary>
        /// <param name="Conn"></param>
        /// <param name="Tran"></param>
        /// <param name="UptSql">���µ�SQL���</param>
        /// <param name="MasterTable">�����õı�</param>
        /// <param name="DetailTable">���ñ�</param>
        /// <param name="MasterKey">����</param>
        /// <param name="isPlus">��־��ǰ��������˻��Ƿ���</param>
        /// <param name="valueKey">�ؼ�ֵ</param>
        /// <returns></returns>
        public static DataTable UptIsUse(SqlConnection Conn, SqlTransaction Tran, string UptSql, string MasterTable, string DetailTable, string MasterKey, string isPlus, int valueKey)
        {
            using (SqlDataAdapter SqlData = new SqlDataAdapter())
            {
                SqlCommand Comm = new SqlCommand(string.Format(UptSql, MasterTable, DetailTable, string.Format("'{0}'", MasterKey), isPlus, valueKey), Conn);
                Comm.Transaction = Tran;
                SqlData.SelectCommand = Comm;
                DataTable UptIsUse = new DataTable();
                SqlData.Fill(UptIsUse);
                return UptIsUse;
            }
        }
    }


    /// <summary>
    /// ��������
    /// </summary>
    class SvrcOrderCustomerItem : SvrSystemDB, IServerSkedUserExec, IServerSkedUserExecEx
    {
        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row)
        {
            //bool b = BitTermMath.GetBitFalse((int)Row["TheState"], BitTermMath.TermOne);

            //bool FSampleSend = BitTermMath.GetBitTrue((int)Row["IsUse"], BitTermMath.TermOne);                //��������
            //if (FSampleSend)
            //{
            //    HYTradeParam.Warn(HYTradeParam.BillNoCheck);
            //}

            ////2007-09-25 ���·�дԴ��IsUse�ֶ�
            //DataTable UptIsUse = SampleParam.UptIsUse(Connect, Tran, SampleParam._UptIsUse,
            //                    "tbcOrderCustomer", "tbcSampleMake", (string)Row["BillNo"], SampleParam.IsOne(b), 1);
        }

        public void UserExec(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            Connect.Open();
            try
            {
                SqlCommand up_cmd = new SqlCommand();
                up_cmd.Connection = Connect;
                switch (ID)
                {
                    case 0: //������ɴ���
                        SqlTransaction Trans = Connect.BeginTransaction();
                        try
                        {
                            up_cmd.Transaction = Trans;
                            foreach (Hashtable haRecord in ht.Values)
                            {
                                up_cmd.CommandText = string.Format(@"Update tbcOrderCustomerItemDetail set UseState = {0}  where 
                                   BillNo = '{1}' and RowNo = {2} and DetailNo = {3}", haRecord[0], haRecord[1], haRecord[2], haRecord[3]);
                                up_cmd.ExecuteNonQuery();
                            }
                            Trans.Commit();
                        }
                        catch (Exception e)
                        {
                            Trans.Rollback();
                            xzException.WarnBox(e.Message);
                        }
                        break;
                    case 1:  //�����������
                        up_cmd.CommandText = "update tbcOrderCustomerItemDetail set Accessory = @Accessory where BillNo=@BillNo and RowNo = @RowNo and DetailNo = @DetailNo";
                        up_cmd.Parameters.Add("@Accessory", SqlDbType.Image);
                        up_cmd.Parameters["@Accessory"].Value = ht[0] as byte[];
                        up_cmd.Parameters.Add("@BillNo", SqlDbType.VarChar, 30);
                        up_cmd.Parameters["@BillNo"].Value = ht[1].ToString();
                        up_cmd.Parameters.Add("@RowNo", SqlDbType.Int);
                        up_cmd.Parameters["@RowNo"].Value = ht[2].ToString();
                        up_cmd.Parameters.Add("@DetailNo", SqlDbType.Int);
                        up_cmd.Parameters["@DetailNo"].Value = ht[3].ToString();
                        up_cmd.ExecuteNonQuery();
                        break;
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

        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "") Connect.ConnectionString = RemotingParam.ConnectionString;
            string sql = "select isnull(Max(NewNo),0)+1 from tbcOrderCustomerItem where SourceBillNo = '{0}' and RowNo={1}";
            Hashtable htResult = new Hashtable();
            switch (ID)
            {
                case 0: //��ȡ���ݺ�
                    Connect.Open();
                    try
                    {
                        SqlCommand cmd = new SqlCommand(string.Format(sql, ht[0], ht[1]), Connect);
                        object obj = cmd.ExecuteScalar();
                        if (obj != null && obj!=DBNull.Value)
                            htResult.Add(0, obj.ToString());
                    }
                    finally
                    {
                        Connect.Close();
                    }
                    break;
            }
            return htResult;
        }
    }

    /// <summary>
    /// ��������
    /// </summary>
    class SvrcSampleSend : SvrSystemDB, IServerSkedUserExec
    {
        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row)
        {
           //  bool b = BitTermMath.GetBitFalse((int)Row["TheState"], BitTermMath.TermOne);

            //bool FSampleSend = BitTermMath.GetBitTrue((int)Row["IsUse"], BitTermMath.TermOne);                //��������
            //if (FSampleSend)
            //{
            //    HYTradeParam.Warn(HYTradeParam.BillNoCheck);
            //}

            ////2007-09-25 ���·�дԴ��IsUse�ֶ�
            //DataTable UptIsUse = SampleParam.UptIsUse(Connect, Tran, SampleParam._UptIsUse,
            //                    "tbcSampleMake", "tbcSampleSend", (string)Row["BillNo"], SampleParam.IsOne(b), 8);
        }

        public void UserExec(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            Connect.Open();
            try
            {
                SqlCommand up_cmd = new SqlCommand();
                up_cmd.Connection = Connect;
                switch (ID)
                {
                    case 0: //������ɴ���
                        SqlTransaction Trans = Connect.BeginTransaction();
                        try
                        {
                            up_cmd.Transaction = Trans;
                            foreach (Hashtable haRecord in ht.Values)
                            {
                                up_cmd.CommandText = string.Format(@"Update tbcSampleSendItem set UseState = {0}  where 
                                   BillNo = '{1}' and RowNo = {2}", haRecord[0], haRecord[1], haRecord[2]);
                                up_cmd.ExecuteNonQuery();
                            }
                            Trans.Commit();
                        }
                        catch(Exception e)
                        {
                            Trans.Rollback();
                            xzException.WarnBox(e.Message);
                        }
                        break;
                    case 1:  //�����������
                        up_cmd.CommandText = "update tbcSampleSendItem set Accessory = @Accessory where BillNo=@BillNo and RowNo = @RowNo";
                        up_cmd.Parameters.Add("@Accessory", SqlDbType.Image);
                        up_cmd.Parameters["@Accessory"].Value = ht[0] as byte[];
                        up_cmd.Parameters.Add("@BillNo", SqlDbType.VarChar, 30);
                        up_cmd.Parameters["@BillNo"].Value = ht[1].ToString();
                        up_cmd.Parameters.Add("@RowNo", SqlDbType.Int);
                        up_cmd.Parameters["@RowNo"].Value = ht[2].ToString();
                        up_cmd.ExecuteNonQuery();
                        break;
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

        }
    }

    /// <summary>
    /// ��������
    /// </summary>
    class SvrcManuFollow : SvrSystemDB
    {
        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row)
        {
            //bool b = BitTermMath.GetBitFalse((int)Row["TheState"], BitTermMath.TermOne);

            ////bool FSampleSend = BitTermMath.GetBitTrue((int)Row["IsUse"], BitTermMath.TermOne);          
            ////if (FSampleSend)
            ////{
            ////    HYTradeParam.Warn(HYTradeParam.BillNoCheck);
            ////}

            ////2007-09-25 ���·�дԴ��IsUse�ֶ�
            //DataTable UptIsUse = SampleParam.UptIsUse(Connect, Tran, SampleParam._UptIsUse,
            //                    "tbcOrderCustomer", "tbcManuFollow", (string)Row["BillNo"], SampleParam.IsOne(b), 2);
        }
    }

    /// <summary>
    /// ��������
    /// </summary>
    class SvrcManuTest : SvrSystemDB
    {
        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row)
        {
            //bool b = BitTermMath.GetBitFalse((int)Row["TheState"], BitTermMath.TermOne);

            ////bool FSampleSend = BitTermMath.GetBitTrue((int)Row["IsUse"], BitTermMath.TermOne);          
            ////if (FSampleSend)
            ////{
            ////    HYTradeParam.Warn(HYTradeParam.BillNoCheck);
            ////}

            ////2007-09-25 ���·�дԴ��IsUse�ֶ�
            //DataTable UptIsUse = SampleParam.UptIsUse(Connect, Tran, SampleParam._UptIsUse,
            //                    "tbcOrderCustomer", "tbcManuTest", (string)Row["BillNo"], SampleParam.IsOne(b), 4);
        }
    }

}
