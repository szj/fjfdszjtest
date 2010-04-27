using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using XzzLibrary.Source;
using System.Collections;

namespace xzMesosphere.Source
{
    public class HyLoginAccount
    {
        public static void Login(xzServerManage FServerManage)
        {
            string sql = xzSqlConnect.ConnectionString(FServerManage.ServerManageParam.SqlConnectParam);

            #region �˿�
            SvrFinOrigin.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrFinOrigin), "ISvrFinOrigin");              //�ڳ����     

            SvrFinRecCash.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrFinRecCash), "ISvrFinRecCash");            //Ӧ�մ���  

            SvrFinPayCash.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrFinPayCash), "ISvrFinPayCash");            //Ӧ������

            SvrFinChanger.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrFinChanger), "ISvrFinChanger");            //ת������

            SvrFinLoseHandset.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrFinLoseHandset), "ISvrFinLoseHandset");     //Ա�������⳥����

            SvrFinPayCashLoseHandset.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrFinPayCashLoseHandset), "ISvrFinPayCashLoseHandset");//Ա�������⳥����
            #endregion

            #region Ӧ������
            SvrStockChargeOther.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrStockChargeOther), "ISvrStockChargeOther");          //��Ӧ����������

            SvrStockChargePromotion.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrStockChargePromotion), "ISvrStockChargePromotion");  //��Ӧ���г�����

            SvrStockChargeSettlement.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrStockChargeSettlement), "ISvrStockChargeSettlement");//��Ӧ�̷��ý���

            SvrStockPayApply.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrStockPayApply), "ISvrStockPayApply");                //�������뵥

            #endregion

            #region Ӧ�չ���
            SvrSaleChargeOther.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSaleChargeOther), "ISvrSaleChargeOther");            //������������

            SvrSaleChargePromotion.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSaleChargePromotion), "ISvrSaleChargePromotion");    //��Ӧ���г�����

            SvrSaleChargeSettlement.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSaleChargeSettlement), "ISvrSaleChargeSettlement"); //���۷��ý���

            #endregion
        }
    }

    #region �˿�

    /// <summary>
    /// �ڳ����
    /// </summary>
    public class SvrFinOrigin : SvrSystemDB, IServerSkedUserExecEx
    {
        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row, xzSourceStateEventArgs e)
        {
            //ȷ�ϲ���
            if (Row != null && e.SignBit == BitTermMath.TermOne)
            {
                using (SqlCommand cmd = new SqlCommand())
                using (SqlDataAdapter sqlda = new SqlDataAdapter())
                {
                    cmd.Connection = Connect;
                    cmd.Transaction = Tran;
                    sqlda.SelectCommand = cmd;

                    bool isCheck = !BitTermMath.GetBitTrue(e.SourceStateValue, e.SignBit);

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select CopartnerType, CopartnerCode, FlowBit,
                              AccountMoney,UsBail,OtherBail, 
                              NoBalanceProfit,NoBalanceKeepPrice,NoBalanceCharge, 
                              HasBalanceProfit,HasBalanceKeepPrice,HasBalanceCharge
                         from tbFinOrigin where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbFinOrigin";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    bool isStorageIn = isCheck;

                    #endregion

                    #region �ж�

                    #endregion

                    #region ���¼�ʱ���
                    HYTotailMoney FTotailMoney = new HYTotailMoney();
                    FTotailMoney.Command = cmd;
                    FTotailMoney.CalcMoney(isStorageIn, MasterRow["CopartnerType"], MasterRow["CopartnerCode"],"AccountMoney"
                        , xzSqlAnalysis.getValue(MasterRow["AccountMoney"]));
                    FTotailMoney.CalcMoney(isStorageIn, MasterRow["CopartnerType"], MasterRow["CopartnerCode"], "NoBalanceProfit"
                        , xzSqlAnalysis.getValue(MasterRow["NoBalanceProfit"]));
                    FTotailMoney.CalcMoney(isStorageIn, MasterRow["CopartnerType"], MasterRow["CopartnerCode"], "NoBalanceKeepPrice"
                        , xzSqlAnalysis.getValue(MasterRow["NoBalanceKeepPrice"]));
                    FTotailMoney.CalcMoney(isStorageIn, MasterRow["CopartnerType"], MasterRow["CopartnerCode"], "NoBalanceCharge"
                        , xzSqlAnalysis.getValue(MasterRow["NoBalanceCharge"]));
                    FTotailMoney.CalcMoney(isStorageIn, MasterRow["CopartnerType"], MasterRow["CopartnerCode"], "HasBalanceProfit"
                        , xzSqlAnalysis.getValue(MasterRow["HasBalanceProfit"]));
                    FTotailMoney.CalcMoney(isStorageIn, MasterRow["CopartnerType"], MasterRow["CopartnerCode"], "HasBalanceKeepPrice"
                        , xzSqlAnalysis.getValue(MasterRow["HasBalanceKeepPrice"]));
                    FTotailMoney.CalcMoney(isStorageIn, MasterRow["CopartnerType"], MasterRow["CopartnerCode"], "HasBalanceCharge"
                        , xzSqlAnalysis.getValue(MasterRow["HasBalanceCharge"]));
                    FTotailMoney.CalcMoney(isStorageIn, MasterRow["CopartnerType"], MasterRow["CopartnerCode"], "UsBail"
                        , xzSqlAnalysis.getValue(MasterRow["UsBail"]));
                    FTotailMoney.CalcMoney(isStorageIn, MasterRow["CopartnerType"], MasterRow["CopartnerCode"], "OtherBail"
                        , xzSqlAnalysis.getValue(MasterRow["OtherBail"]));
                    #endregion
                }
            }
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            Hashtable haReturn = new Hashtable();
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Connection = Connect;
                switch (ID)
                {
                    case 0:
                        #region 
                        #endregion
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        HYStorageMessage.HintChange(command, "tbFinOrigin", ht[0]);
                        #endregion
                        break;
                }
            }
            finally
            {
                Connect.Close();
            }
            return haReturn;
        }
    }

    /// <summary>
    /// Ӧ������
    /// </summary>
    public class SvrFinPayCash : SvrSystemDB, IServerSkedUserExecEx
    {
        //���¸������뵥�Ĵ���
        private void UpdatePayApply(SqlCommand cmd, DataRow row, decimal ApplyMoney,bool isCheck)
        {
            int isUse = 1;
            if (!isCheck) isUse = -1;
            string StrSql = @"Update tbStockPayApply set ProMoney = ProMoney + {0}*{1} where BillNo = '{2}'";
            cmd.CommandText = string.Format(StrSql, ApplyMoney, isUse, row["SourceBillNo"]);
            cmd.ExecuteNonQuery();

            StrSql = @"Update tbStockPayApply set IsUse = IsUse + {0} where BillNo = '{1}'";
            cmd.CommandText = string.Format(StrSql, isUse, row["SourceBillNo"]);
            cmd.ExecuteNonQuery();
        }
        private bool GetPayApplyNoApplyMoney(SqlCommand cmd, DataRow DetailRow, bool isCheck)
        {
            if (DetailRow["SourceBillNo"].ToString() != "")
            {
                cmd.CommandText = string.Format(@"select UseState from tbStockPayApply where BillNo = '{0}' 
                    and dbo.GetByteToBoolean(theState,0x0001)=1"
                    , DetailRow["SourceBillNo"]);
                object value = cmd.ExecuteScalar();
                if (value == null)
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]�����ڣ�����ԭ��δȷ�ϣ�",DetailRow["SourceBillNo"]));
                    return false;
                }

                if (BitTermMath.GetBitTrue((int)value, BitTermMath.TermSix))
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]������������ǰ��������ִ�У�", DetailRow["SourceBillNo"]));
                    return false;
                }

                decimal TotalMoney = xzSqlAnalysis.getAbsValue(DetailRow["TotalMoney"]);
                if (!isCheck) TotalMoney = -TotalMoney;
                string sql = @"select ProMoney from tbStockPayApply where BillNo = '{0}'";
                cmd.CommandText = string.Format(sql, DetailRow["SourceBillNo"]);
                value = cmd.ExecuteScalar();
                if (value == null && (xzSqlAnalysis.getValue(value) + TotalMoney) < 0)
                {
                    xzException.WarnBox(string.Format("���뵥���ݺ�:{0}����Ѿ����ڵ�δ������",DetailRow["SourceBillNo"]));
                    return false;
                }
            }
            return true;
        }

        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row, xzSourceStateEventArgs e)
        {
            //ȷ�ϲ���
            if (Row != null && e.SignBit == BitTermMath.TermOne)
            {
                using (SqlCommand cmd = new SqlCommand())
                using (SqlDataAdapter sqlda = new SqlDataAdapter())
                {
                    cmd.Connection = Connect;
                    cmd.Transaction = Tran;
                    sqlda.SelectCommand = cmd;

                    bool isCheck = !BitTermMath.GetBitTrue(e.SourceStateValue, e.SignBit);

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, SrcBillSort,UseState, TheDate, CopartnerType, CopartnerCode,  TotalMoney
                            from tbFinPayCash where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbFinPayCash";
                    DataRow MasterRow = MasterTable.Rows[0];

                    cmd.CommandText = string.Format(@"select BillNo,RowNo,SourceBillNo,SourceMoney,ApplyMoney,TotalMoney
                            from tbFinPayCashItem where BillNo = '{0}'", Row["BillNo"]);
                    DataTable DetailTable = new DataTable();
                    sqlda.Fill(DetailTable);
                    DetailTable.TableName = "tbFinPayCashItem";

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    bool isStorageIn = (!isRadBill && !isCheck) || (isRadBill && isCheck);
                    #endregion

                    #region �ж�
                    foreach (DataRow DetailRow in DetailTable.Rows)
                    {
                        decimal ApplyMoney = Convert.ToDecimal(DetailRow["TotalMoney"]);
                        #region ���²ɹ�����
                        if(GetPayApplyNoApplyMoney(cmd, DetailRow,isCheck))
                        UpdatePayApply(cmd, DetailRow, ApplyMoney, isCheck);
                        #endregion
                    }
                    #endregion

                    #region ���¼�ʱ���
                    HYTotailMoney FTotailMoney = new HYTotailMoney();
                    FTotailMoney.Command = cmd;

                    FTotailMoney.CalcMoney(isStorageIn, MasterRow["CopartnerType"], MasterRow["CopartnerCode"], "AccountMoney"
                        , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                    #endregion
                }
            }
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            Hashtable haReturn = new Hashtable();
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Connection = Connect;
                switch (ID)
                {
                    case 0:
                        #region
                        #endregion
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        HYStorageMessage.HintChange(command, "tbFinPayCash", ht[0]);
                        #endregion
                        break;
                    case 2:
                        #region ��ȡδ������
                        command.CommandText = string.Format(@"select AccountMoney  from tbFinTotalMoney where CopartnerType = '{0}' and CopartnerCode = '{1}'"
                            , ht[0], ht[1]);
                        haReturn.Add(0, command.ExecuteScalar());
                        #endregion
                        break;
                }
            }
            finally
            {
                Connect.Close();
            }
            return haReturn;
        }
    }

    /// <summary>
    /// Ӧ�մ���
    /// </summary>
    public class SvrFinRecCash : SvrSystemDB, IServerSkedUserExecEx
    {
        //�������۷�Ʊ�Ĵ���
        private void UpdateSaleInvoice(SqlCommand cmd, DataRow row, decimal ApplyMoney,bool isCheck)
        {
            int isUse = 1;
            if (!isCheck) isUse = -1;
            string StrSql = @"Update tbSaleInvoice set ProMoney = ProMoney + {0}*{1} where BillNo = '{2}'";
            cmd.CommandText = string.Format(StrSql, ApplyMoney, isUse, row["SourceBillNo"]);
            cmd.ExecuteNonQuery();

            StrSql = @"Update tbSaleInvoice set IsUse = IsUse + {0} where BillNo = '{1}'";
            cmd.CommandText = string.Format(StrSql, isUse, row["SourceBillNo"]);
            cmd.ExecuteNonQuery();
        }
        private Boolean GetSaleInvoiceNoApplyMoney(SqlCommand cmd, DataRow DetailRow, bool isCheck)
        {
            if (DetailRow["SourceBillNo"].ToString() != "")
            {
                cmd.CommandText = string.Format(@"select UseState from tbSaleInvoice where BillNo = '{0}' 
                    and dbo.GetByteToBoolean(theState,0x0001)=1"
                    , DetailRow["SourceBillNo"]);
                object value = cmd.ExecuteScalar();
                if (value == null)
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]�����ڣ�����ԭ��δȷ�ϣ�", DetailRow["SourceBillNo"]));
                    return false;
                }

                if (BitTermMath.GetBitTrue((int)value, BitTermMath.TermSix))
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]������������ǰ��������ִ�У�", DetailRow["SourceBillNo"]));
                    return false;
                }

                decimal TotalMoney = xzSqlAnalysis.getAbsValue(DetailRow["TotalMoney"]);
                if (!isCheck) TotalMoney = -TotalMoney;
                string sql = @"select ProMoney from tbSaleInvoice where BillNo = '{0}'";
                cmd.CommandText = string.Format(sql, DetailRow["SourceBillNo"]);
                value = cmd.ExecuteScalar();
                if (value == null && (xzSqlAnalysis.getValue(value) + TotalMoney) < 0)
                {
                    xzException.WarnBox(string.Format("���뵥���ݺ�:{0}����Ѿ����ڵ�δ������", DetailRow["SourceBillNo"]));
                    return false;
                }
            }
            return true;
        }

        //�������۶����Ĵ���
        private void UpdateSaleOrder(SqlCommand cmd, DataRow row, decimal ApplyMoney,bool isCheck)
        {
            int isUse = 1;
            if (!isCheck) isUse = -1;
            string StrSql = @"Update tbSaleOrder set ProMoney = ProMoney + {0}*{1} where BillNo = '{2}'";
            cmd.CommandText = string.Format(StrSql, ApplyMoney, isUse, row["SourceBillNo"]);
            cmd.ExecuteNonQuery();
            StrSql = @"Update tbSaleOrder set IsUse = IsUse + {0} where BillNo = '{1}'";
            cmd.CommandText = string.Format(StrSql, isUse, row["SourceBillNo"]);
            cmd.ExecuteNonQuery();
        }
        private Boolean GetSaleOrderNoApplyMoney(SqlCommand cmd, DataRow DetailRow,bool isCheck)
        {
            if (DetailRow["SourceBillNo"].ToString() != "")
            {
                cmd.CommandText = string.Format(@"select UseState from tbSaleOrder where BillNo = '{0}' 
                    and dbo.GetByteToBoolean(theState,0x0001)=1"
                    , DetailRow["SourceBillNo"]);
                object value = cmd.ExecuteScalar();
                if (value == null)
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]�����ڣ�����ԭ��δȷ�ϣ�", DetailRow["SourceBillNo"]));
                    return false;
                }

                if (BitTermMath.GetBitTrue((int)value, BitTermMath.TermSix))
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]������������ǰ��������ִ�У�", DetailRow["SourceBillNo"]));
                    return false;
                }

                decimal TotalMoney = xzSqlAnalysis.getAbsValue(DetailRow["TotalMoney"]);
                if (!isCheck) TotalMoney = -TotalMoney;
                string sql = @"select ProMoney from tbSaleOrder where BillNo = '{0}'";
                cmd.CommandText = string.Format(sql, DetailRow["SourceBillNo"]);
                value = cmd.ExecuteScalar();
                if (value == null && (xzSqlAnalysis.getValue(value) + TotalMoney) < 0)
                {
                    xzException.WarnBox(string.Format("���뵥���ݺ�:{0}����Ѿ����ڵ�δ������", DetailRow["SourceBillNo"]));
                    return false;
                }
            }
            return true;
        }

        //�������۳���Ĵ���
        private void UpdateSaleOut(SqlCommand cmd, DataRow row, decimal ApplyMoney,bool isCheck)
        {
            int isUse = 1;
            if (!isCheck) isUse = -1;
            string StrSql = @"Update tbSaleOut set ProMoney = ProMoney + {0}*{1} where BillNo = '{1}'";
            cmd.CommandText = string.Format(StrSql, ApplyMoney, isUse, row["SourceBillNo"]);
            cmd.ExecuteNonQuery();

            StrSql = @"Update tbSaleOut set IsUse = IsUse + {0} where BillNo = '{1}'";
            cmd.CommandText = string.Format(StrSql, isUse, row["SourceBillNo"]);
            cmd.ExecuteNonQuery();
        }
        private bool GetSaleOutNoApplyMoney(SqlCommand cmd, DataRow DetailRow, bool isCheck)
        {
            if (DetailRow["SourceBillNo"].ToString() != "")
            {
                cmd.CommandText = string.Format(@"select UseState from tbSaleOut where BillNo = '{0}' 
                    and dbo.GetByteToBoolean(theState,0x0001)=1"
                    , DetailRow["SourceBillNo"]);
                object value = cmd.ExecuteScalar();
                if (value == null)
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]�����ڣ�����ԭ��δȷ�ϣ�", DetailRow["SourceBillNo"]));
                    return false;
                }

                if (BitTermMath.GetBitTrue((int)value, BitTermMath.TermSix))
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]������������ǰ��������ִ�У�", DetailRow["SourceBillNo"]));
                    return false;
                }

                decimal TotalMoney = xzSqlAnalysis.getAbsValue(DetailRow["TotalMoney"]);
                if (!isCheck) TotalMoney = -TotalMoney;
                string sql = @"select ProMoney from tbSaleOut where BillNo = '{0}'";
                cmd.CommandText = string.Format(sql, DetailRow["SourceBillNo"]);
                value = cmd.ExecuteScalar();
                if (value == null && (xzSqlAnalysis.getValue(value) + TotalMoney) < 0)
                {
                    xzException.WarnBox(string.Format("���뵥���ݺ�:{0}����Ѿ����ڵ�δ������", DetailRow["SourceBillNo"]));
                    return false;
                }
            }
            return true;
        }

        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row, xzSourceStateEventArgs e)
        {
            //ȷ�ϲ���
            if (Row != null && e.SignBit == BitTermMath.TermOne)
            {
                using (SqlCommand cmd = new SqlCommand())
                using (SqlDataAdapter sqlda = new SqlDataAdapter())
                {
                    cmd.Connection = Connect;
                    cmd.Transaction = Tran;
                    sqlda.SelectCommand = cmd;

                    bool isCheck = !BitTermMath.GetBitTrue(e.SourceStateValue, e.SignBit);

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate,SrcBillSort,  
                                CopartnerType, CopartnerCode, BalanceProfit, BalanceKeepPrice, BalanceCharge,  TotalMoney, FactPayMoney
                           from tbFinRecCash where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbFinRecCash";
                    DataRow MasterRow = MasterTable.Rows[0];

                    cmd.CommandText = string.Format(@"select BillNo,RowNo,SourceBillNo,SourceMoney,ApplyMoney,TotalMoney
                            from tbFinRecCashItem where BillNo = '{0}'", Row["BillNo"]);
                    DataTable DetailTable = new DataTable();
                    sqlda.Fill(DetailTable);
                    DetailTable.TableName = "tbFinRecCashItem";

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    bool isStorageIn = isCheck;
                    #endregion

                    #region �ж�
                    switch (Convert.ToInt32(MasterRow["SrcBillSort"]))
                    {
                        case 0:
                            break;
                        case 1:
                            #region ���۶���
                            foreach (DataRow DetailRow in DetailTable.Rows)
                            {
                                decimal ApplyMoney = Convert.ToDecimal(DetailRow["TotalMoney"]);
                                #region ���²ɹ�����
                                if (GetSaleOrderNoApplyMoney(cmd, DetailRow,isCheck)) 
                                UpdateSaleOrder(cmd, DetailRow, ApplyMoney, isCheck);
                                #endregion
                            }
                            #endregion                           
                            break;
                        case 2:
                            #region ���۳���
                            foreach (DataRow DetailRow in DetailTable.Rows)
                            {
                                decimal ApplyMoney = Convert.ToDecimal(DetailRow["TotalMoney"]);
                                #region ���²ɹ�����
                                if(GetSaleOutNoApplyMoney(cmd, DetailRow,isCheck))
                                UpdateSaleOut(cmd, DetailRow, ApplyMoney, isCheck);
                                #endregion
                            }
                            #endregion
                            break;
                        case 3:
                            #region ���۷�Ʊ
                            foreach (DataRow DetailRow in DetailTable.Rows)
                            {
                                decimal ApplyMoney = Convert.ToDecimal(DetailRow["TotalMoney"]);
                                #region ���²ɹ�����
                                if (GetSaleInvoiceNoApplyMoney(cmd, DetailRow, isCheck))
                                    UpdateSaleInvoice(cmd, DetailRow, ApplyMoney, isCheck);
                                #endregion
                            }
                            #endregion
                            break;

                    }
                    #endregion

                    #region ���¼�ʱ���
                    HYTotailMoney FTotailMoney = new HYTotailMoney();
                    FTotailMoney.Command = cmd;
                    decimal Money = xzSqlAnalysis.getValue(MasterRow["BalanceProfit"]);
                    if (Money > 0m) FTotailMoney.CalcMoney(!isStorageIn, MasterRow["CopartnerType"], MasterRow["CopartnerCode"], "HasBalanceProfit", Money);
                    Money = xzSqlAnalysis.getValue(MasterRow["BalanceKeepPrice"]);
                    if (Money > 0m) FTotailMoney.CalcMoney(!isStorageIn, MasterRow["CopartnerType"], MasterRow["CopartnerCode"], "HasBalanceKeepPrice", Money);
                    Money = xzSqlAnalysis.getValue(MasterRow["BalanceCharge"]);
                    if (Money > 0m) FTotailMoney.CalcMoney(!isStorageIn, MasterRow["CopartnerType"], MasterRow["CopartnerCode"], "HasBalanceCharge", Money);

                    FTotailMoney.CalcMoney(!isStorageIn, MasterRow["CopartnerType"], MasterRow["CopartnerCode"], "AccountMoney"
                        , xzSqlAnalysis.getValue(MasterRow["FactPayMoney"]));
                    #endregion
                }
            }
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            Hashtable haReturn = new Hashtable();
            HYStorageManager FStorageManager;

            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Connection = Connect;
                switch (ID)
                {
                    case 0:
                        #region �жϴ����Ƿ��ڿ���д���
                        FStorageManager = new HYStorageManager();
                        FStorageManager.Command = command;
                        haReturn.Add(0, FStorageManager.StorageHasListNo(ht[0], ht[1], ht[2]));
                        #endregion
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        HYStorageMessage.HintChange(command, "tbFinRecCash", ht[0]);
                        #endregion
                        break;
                    case 2:
                        #region ��ȡδ������
                        command.CommandText = string.Format(@"select HasBalanceProfit, HasBalanceKeepPrice, HasBalanceCharge, AccountMoney
                               from tbFinTotalMoney where CopartnerType = '{0}' and CopartnerCode = '{1}'"
                            , ht[0], ht[1]);
                        SqlDataReader Reader = command.ExecuteReader();
                        if (Reader.Read())
                        {
                            haReturn.Add(0, Reader["HasBalanceProfit"]);
                            haReturn.Add(1, Reader["HasBalanceKeepPrice"]);
                            haReturn.Add(2, Reader["HasBalanceCharge"]);
                            haReturn.Add(3, Reader["AccountMoney"]);
                        }
                        else
                        {
                            haReturn.Add(0, 0m);
                            haReturn.Add(1, 0m);
                            haReturn.Add(2, 0m);
                            haReturn.Add(3, 0m);
                        }
                        #endregion
                        break;
                }
            }
            finally
            {
                Connect.Close();
            }
            return haReturn;
        }
    }

    /// <summary>
    /// ת������
    /// </summary>
    public class SvrFinChanger : SvrSystemDB
    {
        //protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row)
        //{
        //    bool b = BitTermMath.GetBitFalse((int)Row["TheState"], BitTermMath.TermOne);

        //    DataTable Dt = MoneyParam.GetFinChangeTable(Connect, Tran, "tbFinPurveyerChangerItem", "tbFinPurveyerChanger", string.Format("'{0}'", Row["BillNo"]));

        //    //����������{}
        //    string _UpdateFrom = "update tbFinPurveyCurBalance " + "\n"
        //                       + "set PayMoney=PayMoney{5}{1},NoBalanceProfit=NoBalanceProfit{5}{2},NoBalanceKeepPrice=NoBalanceKeepPrice{5}{3},NoBalanceCharge=NoBalanceCharge{5}{4} " + "\n"
        //                       + "where SupplyerCode='{0}' ",

        //            _UpdateTo = "update tbFinPurveyCurBalance " + "\n"
        //                       + "set PayMoney=PayMoney{5}{1},NoBalanceProfit=NoBalanceProfit{5}{2},NoBalanceKeepPrice=NoBalanceKeepPrice{5}{3},NoBalanceCharge=NoBalanceCharge{5}{4} " + "\n"
        //                       + "where SupplyerCode='{0}' ",

        //            _UpdateIns = "update tbFinPurveyCurBalance set InstantMoney=PayMoney-NoBalanceProfit-NoBalanceKeepPrice-NoBalanceCharge-VsBail+SupplyerBail";

        //    foreach (DataRow Dr in Dt.Rows)
        //    {
        //        //SqlCommand cmdFrom = new SqlCommand(string.Format(_UpdateFrom, (string)Dr["FromPurveyer"],
        //        //     Convert.ToDecimal(Dr["Cash"]), Convert.ToDecimal(Dr["BackBenefit"]), Convert.ToDecimal(Dr["KeepPrice"]),
        //        //     Convert.ToDecimal(Dr["Charge"]), MoneyParam.IsAdd(b)), Connect);
        //        SqlCommand cmdFrom = new SqlCommand(string.Format(_UpdateFrom, (string)Dr["FromPurveyer"],
        //                0, Convert.ToDecimal(Dr["BackBenefit"]), Convert.ToDecimal(Dr["KeepPrice"]),
        //                Convert.ToDecimal(Dr["Charge"]), MoneyParam.IsAdd(b)), Connect);
        //        cmdFrom.Transaction = Tran;
        //        cmdFrom.ExecuteNonQuery();

        //        //SqlCommand cmdTo = new SqlCommand(string.Format(_UpdateTo, (string)Dr["ToPurveyer"],
        //        //     Convert.ToDecimal(Dr["Cash"]), Convert.ToDecimal(Dr["BackBenefit"]), Convert.ToDecimal(Dr["KeepPrice"]),
        //        //     Convert.ToDecimal(Dr["Charge"]), MoneyParam.IsAdd(!b)), Connect);
        //        SqlCommand cmdTo = new SqlCommand(string.Format(_UpdateTo, (string)Dr["ToPurveyer"],
        //            0, Convert.ToDecimal(Dr["BackBenefit"]), Convert.ToDecimal(Dr["KeepPrice"]),
        //            Convert.ToDecimal(Dr["Charge"]), MoneyParam.IsAdd(!b)), Connect);
        //        cmdTo.Transaction = Tran;
        //        cmdTo.ExecuteNonQuery();
        //    }

        //    SqlCommand cmdIns = new SqlCommand(_UpdateIns, Connect);
        //    cmdIns.Transaction = Tran;
        //    cmdIns.ExecuteNonQuery();
        //}
    }

    /// <summary>
    /// Ա�������⳥����
    /// </summary>
    public class SvrFinLoseHandset : SvrSystemDB
    {
        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row, xzSourceStateEventArgs e)
        {
            if (Row != null && e.SignBit == BitTermMath.TermOne)
            {
                using (SqlCommand cmd = new SqlCommand())
                using (SqlDataAdapter sqlda = new SqlDataAdapter())
                {
                    cmd.Connection = Connect;
                    cmd.Transaction = Tran;
                    sqlda.SelectCommand = cmd;

                    bool isCheck = !BitTermMath.GetBitTrue(e.SourceStateValue, e.SignBit);

                    HYAccountCommon HYAccountPro = new HYAccountCommon();
                    HYAccountPro.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse,FlowBit,SrcBillSort from tbFinLoseHandset where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbSelfLoseHandset";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    DataTable DetailTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbFinLoseHandsetItem where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(DetailTable);
                    DetailTable.TableName = "tbSelfLoseHandsetItem";

                    #endregion

                    int SrcBillSort = (int)MasterRow["SrcBillSort"];

                    #region �ж�
                    foreach (DataRow DetailRow in DetailTable.Rows)
                    {
                        switch (SrcBillSort)
                        {
                            case 0:
                                #region �ֿ��̵㵥
                                HYAccountPro.UpdateSrcBill(Connect, Tran, isCheck, DetailTable, "tbStorCheck", "tbStorCheckItem", "CompensateNumber", "Number");
                                #endregion
                                break;
                        }
                    }
                    #endregion
                }
            }
        }
    }

    /// <summary>
    /// Ա�������⳥����
    /// </summary>
    public class SvrFinPayCashLoseHandset : SvrSystemDB
    {
        //���¸������뵥�Ĵ���
        private void UpdateFinLoseHandset(SqlCommand cmd, DataRow row, decimal ApplyMoney, bool isCheck)
        {
            int isUse = 1;
            if (!isCheck) isUse = -1;
            string StrSql = @"Update tbFinLoseHandsetItemDetail set PlayMoney = PlayMoney + {0}*{1} where BillNo = '{2}' and RowNo={3} and DetailNo='{4}'";
            cmd.CommandText = string.Format(StrSql, ApplyMoney, isUse, row["SourceBillNo"],row["RowNo"],row["DetailNo"]);
            cmd.ExecuteNonQuery();

            StrSql = @"Update tbFinLoseHandset set IsUse = IsUse + {0} where BillNo = '{1}'";
            cmd.CommandText = string.Format(StrSql, isUse, row["SourceBillNo"]);
            cmd.ExecuteNonQuery();
        }
        private bool GetFinLoseHandsetNoApplyMoney(SqlCommand cmd, DataRow DetailRow, bool isCheck)
        {
            if (DetailRow["SourceBillNo"].ToString() != "")
            {
                cmd.CommandText = string.Format(@"select UseState from tbFinLoseHandset where BillNo = '{0}' 
                    and dbo.GetByteToBoolean(theState,0x0001)=1"
                    , DetailRow["SourceBillNo"]);
                object value = cmd.ExecuteScalar();
                if (value == null)
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]�����ڣ�����ԭ��δȷ�ϣ�", DetailRow["SourceBillNo"]));
                    return false;
                }

                if (BitTermMath.GetBitTrue((int)value, BitTermMath.TermSix))
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]������������ǰ��������ִ�У�", DetailRow["SourceBillNo"]));
                    return false;
                }

                decimal TotalMoney = xzSqlAnalysis.getAbsValue(DetailRow["TotalMoney"]);
                if (!isCheck) TotalMoney = -TotalMoney;
                string sql = @"select PlayMoney from tbFinLoseHandsetItemDetail where BillNo = '{0}' and RowNo={1} and DetailNo='{2]'";
                cmd.CommandText = string.Format(sql, DetailRow["SourceBillNo"], DetailRow["RowNo"],DetailRow["DetailNo"]);
                value = cmd.ExecuteScalar();
                if (value == null && (xzSqlAnalysis.getValue(value) + TotalMoney) < 0)
                {
                    xzException.WarnBox(string.Format("���������ݺ�:{0}������̯����!", DetailRow["SourceBillNo"]));
                    return false;
                }
            }
            return true;
        }

        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row, xzSourceStateEventArgs e)
        {
            //ȷ�ϲ���
            if (Row != null && e.SignBit == BitTermMath.TermOne)
            {
                using (SqlCommand cmd = new SqlCommand())
                using (SqlDataAdapter sqlda = new SqlDataAdapter())
                {
                    cmd.Connection = Connect;
                    cmd.Transaction = Tran;
                    sqlda.SelectCommand = cmd;

                    bool isCheck = !BitTermMath.GetBitTrue(e.SourceStateValue, e.SignBit);

                    HYAccountCommon HYAccountPro = new HYAccountCommon();
                    HYAccountPro.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate, SrcBillSort
                           from tbFinRecCashLoseHandset where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbFinRecCashLoseHandset";
                    DataRow MasterRow = MasterTable.Rows[0];

                    DataTable DetailTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbFinRecCashLoseHandsetItem where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(DetailTable);
                    DetailTable.TableName = "tbFinRecCashLoseHandsetItem";

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    bool isStorageIn = isCheck;
                    #endregion

                    int SrcBillSort = (int)MasterRow["SrcBillSort"];

                    switch (SrcBillSort)
                    {
                        case 0:
                            #region Ա��������
                            foreach (DataRow DetailRow in DetailTable.Rows)
                            {
                                decimal ApplyMoney = Convert.ToDecimal(DetailRow["TotalMoney"]);
                                #region ���²ɹ�����
                                if (GetFinLoseHandsetNoApplyMoney(cmd, DetailRow, isCheck))
                                    UpdateFinLoseHandset(cmd, DetailRow, ApplyMoney, isCheck);
                                #endregion
                            }
                            #endregion
                            break;
                    }

                    #region ���¼�ʱ���

                    #endregion
                }
            }
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            Hashtable haReturn = new Hashtable();

            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Connection = Connect;
                switch (ID)
                {
                    case 0:
                        #region �жϴ����Ƿ��ڿ���д���
                        #endregion
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        HYStorageMessage.HintChange(command, "tbFinRecCashLoseHandset", ht[0]);
                        #endregion
                        break;
                    case 2:
                        #region ��ȡδ������
                        haReturn.Add(0, 0m);
//                        command.CommandText = string.Format(@"select HasBalanceProfit, HasBalanceKeepPrice, HasBalanceCharge, AccountMoney
//                               from tbFinTotalMoney where CopartnerType = '{0}' and CopartnerCode = '{1}'"
//                            , ht[0], ht[1]);
//                        SqlDataReader Reader = command.ExecuteReader();
//                        if (Reader.Read())
//                        {
//                            haReturn.Add(0, Reader["HasBalanceProfit"]);
//                            haReturn.Add(1, Reader["HasBalanceKeepPrice"]);
//                            haReturn.Add(2, Reader["HasBalanceCharge"]);
//                            haReturn.Add(3, Reader["AccountMoney"]);
//                        }
//                        else
//                        {
//                            haReturn.Add(0, 0m);
//                            haReturn.Add(1, 0m);
//                            haReturn.Add(2, 0m);
//                            haReturn.Add(3, 0m);
//                        }
                        #endregion
                        break;
                }
            }
            finally
            {
                Connect.Close();
            }
            return haReturn;
        }
    }
    #endregion

    #region Ӧ������
    /// <summary>
    /// ��Ӧ����������
    /// </summary>
    public class SvrStockChargeOther : SvrSystemDB, IServerSkedUserExecEx
    {
        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row, xzSourceStateEventArgs e)
        {
            //ȷ�ϲ���
            if (Row != null && e.SignBit == BitTermMath.TermOne)
            {
                using (SqlCommand cmd = new SqlCommand())
                using (SqlDataAdapter sqlda = new SqlDataAdapter())
                {
                    cmd.Connection = Connect;
                    cmd.Transaction = Tran;
                    sqlda.SelectCommand = cmd;

                    bool isCheck = !BitTermMath.GetBitTrue(e.SourceStateValue, e.SignBit);

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate ,SupplyerType, SupplyerCode
                             , TotalMoney, SettlementMoney
                           from tbStockChargeOther where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbStockChargeOther";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    //DataTable DetailTable = new DataTable();
                    //cmd.CommandText = string.Format("select * from tbStockChargeOtherItem where BillNo = '{0}'", Row["BillNo"]);
                    //sqlda.Fill(DetailTable);
                    //DetailTable.TableName = "tbStockChargeOtherItem";

                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    bool isStorageIn = (!isRadBill && isCheck) || (isRadBill && !isCheck);

                    #endregion

                    #region �ж�

                    #endregion

                    #region ���¼�ʱ���
                    HYTotailMoney FTotailMoney = new HYTotailMoney();
                    FTotailMoney.Command = cmd;
                    FTotailMoney.CalcMoney(isStorageIn, MasterRow["SupplyerType"], MasterRow["SupplyerCode"], "NoBalanceCharge"
                        , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                    #endregion
                }
            }
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            Hashtable haReturn = new Hashtable();

            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Connection = Connect;
                switch (ID)
                {
                    case 0:
                        #region �жϴ����Ƿ��ڿ���д���
                        #endregion
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        HYStorageMessage.HintChange(command, "tbStockChargeOther", ht[0]);
                        #endregion
                        break;
                }
            }
            finally
            {
                Connect.Close();
            }
            return haReturn;
        } 
    }

    /// <summary>
    ///��Ӧ���г�����
    /// </summary>
    public class SvrStockChargePromotion : SvrSystemDB, IServerSkedUserExecEx
    {
        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row, xzSourceStateEventArgs e)
        {
            //ȷ�ϲ���
            if (Row != null && e.SignBit == BitTermMath.TermOne)
            {
                using (SqlCommand cmd = new SqlCommand())
                using (SqlDataAdapter sqlda = new SqlDataAdapter())
                {
                    cmd.Connection = Connect;
                    cmd.Transaction = Tran;
                    sqlda.SelectCommand = cmd;

                    bool isCheck = !BitTermMath.GetBitTrue(e.SourceStateValue, e.SignBit);

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate ,BillSort ,SupplyerType, SupplyerCode
                             , TotalMoney, SettlementMoney
                           from tbStockChargePromotion where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbStockChargePromotion";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);


                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    bool isStorageIn = (!isRadBill && isCheck) || (isRadBill && !isCheck);

                    #endregion

                    #region �ж�

                    #endregion

                    #region ���¼�ʱ���
                    HYTotailMoney FTotailMoney = new HYTotailMoney();
                    FTotailMoney.Command = cmd;
                    switch (MasterRow["BillSort"].ToString())
                    {
                        case "001":
                            FTotailMoney.CalcMoney(isStorageIn, MasterRow["SupplyerType"], MasterRow["SupplyerCode"], "NoBalanceProfit"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            break;
                        case "002":
                            FTotailMoney.CalcMoney(isStorageIn, MasterRow["SupplyerType"], MasterRow["SupplyerCode"], "NoBalanceKeepPrice"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            break;
                    }
                    #endregion
                }
            }
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            Hashtable haReturn = new Hashtable();

            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Connection = Connect;
                switch (ID)
                {
                    case 0:
                        #region �жϴ����Ƿ��ڿ���д���

                        #endregion
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        HYStorageMessage.HintChange(command, "tbStockChargePromotion", ht[0]);
                        #endregion
                        break;
                }
            }
            finally
            {
                Connect.Close();
            }
            return haReturn;
        } 
    }

    /// <summary>
    ///��Ӧ�̷��ý���
    /// </summary>
    public class SvrStockChargeSettlement : SvrSystemDB, IServerSkedUserExecEx
    {
        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row, xzSourceStateEventArgs e)
        {
            //ȷ�ϲ���
            if (Row != null && e.SignBit == BitTermMath.TermOne)
            {
                using (SqlCommand cmd = new SqlCommand())
                using (SqlDataAdapter sqlda = new SqlDataAdapter())
                {
                    cmd.Connection = Connect;
                    cmd.Transaction = Tran;
                    sqlda.SelectCommand = cmd;

                    bool isCheck = !BitTermMath.GetBitTrue(e.SourceStateValue, e.SignBit);

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate, 
                                SrcBillSort, SupplyerType, SupplyerCode, TotalMoney
                           from tbStockChargeSettlement where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbStockChargeSettlement";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    bool isStorageIn = (!isRadBill && !isCheck) || (isRadBill && isCheck);
                    #endregion

                    #region �ж�

                    #endregion

                    #region ���¼�ʱ���
                    HYTotailMoney FTotailMoney = new HYTotailMoney();
                    FTotailMoney.Command = cmd;
                    switch (MasterRow["SrcBillSort"].ToString())
                    {
                        case "1":
                            FTotailMoney.CalcMoney(isStorageIn, MasterRow["SupplyerType"], MasterRow["SupplyerCode"], "NoBalanceProfit"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            FTotailMoney.CalcMoney(!isStorageIn, MasterRow["SupplyerType"], MasterRow["SupplyerCode"], "HasBalanceProfit"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            break;
                        case "2":
                            FTotailMoney.CalcMoney(isStorageIn, MasterRow["SupplyerType"], MasterRow["SupplyerCode"], "NoBalanceKeepPrice"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            FTotailMoney.CalcMoney(!isStorageIn, MasterRow["SupplyerType"], MasterRow["SupplyerCode"], "HasBalanceKeepPrice"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            break;
                        case "3":
                            FTotailMoney.CalcMoney(isStorageIn, MasterRow["SupplyerType"], MasterRow["SupplyerCode"], "NoBalanceCharge"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            FTotailMoney.CalcMoney(!isStorageIn, MasterRow["SupplyerType"], MasterRow["SupplyerCode"], "HasBalanceCharge"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            break;
                    }
                    #endregion
                }
            }
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            Hashtable haReturn = new Hashtable();

            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Connection = Connect;
                switch (ID)
                {
                    case 0:
                        #region �жϴ����Ƿ��ڿ���д���
                        #endregion
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        HYStorageMessage.HintChange(command, "tbStockChargeSettlement", ht[0]);
                        #endregion
                        break;
                    case 2:
                        #region ��ȡδ������
                        command.CommandText = string.Format(@"select isnull(NoBalanceProfit,0) + isnull(NoBalanceKeepPrice,0) 
                               + isnull(NoBalanceCharge,0) from tbFinTotalMoney where CopartnerType = '{0}' and CopartnerCode = '{1}'"
                            , ht[0], ht[1]);
                        haReturn.Add(0, command.ExecuteScalar());
                        #endregion
                        break;
                }
            }
            finally
            {
                Connect.Close();
            }
            return haReturn;
        }    
    }

    /// <summary>
    /// �������뵥����
    /// </summary>
    public class SvrStockPayApply : SvrSystemDB, IServerSkedUserExecEx
    {
        private void UpdateStockOrder(SqlCommand cmd, DataRow row, decimal ApplyMoney)
        {
            string StrSql = @"Update tbStockOrder set ApplyTotalMoney = ApplyTotalMoney + {0} where BillNo = '{1}'";
            cmd.CommandText = string.Format(StrSql, ApplyMoney, row["BillNo"]);
            cmd.ExecuteNonQuery();
        }

        private decimal GetStockOrderNoApplyMoney(SqlCommand cmd, DataRow row)
        {
            string StrSql = @"select  (TotalMoney-ApplyTotalMoney) NoApplyMoney from tbStockOrder where BillNo = '{0}'";
            cmd.CommandText = string.Format(StrSql, row["BillNo"]);
            return Convert.ToDecimal(cmd.ExecuteScalar());
        }

        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row, xzSourceStateEventArgs e)
        {
            //ȷ�ϲ���
            if (Row != null && e.SignBit == BitTermMath.TermOne)
            {
                using (SqlCommand cmd = new SqlCommand())
                using (SqlDataAdapter sqlda = new SqlDataAdapter())
                {
                    cmd.Connection = Connect;
                    cmd.Transaction = Tran;
                    sqlda.SelectCommand = cmd;

                    bool isCheck = !BitTermMath.GetBitTrue(e.SourceStateValue, e.SignBit);

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate,  
                                SupplyerType, SupplyerCode, BalanceProfit, BalanceKeepPrice, BalanceCharge,  TotalMoney, FactPayMoney
                           from tbStockPayApply where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbStockPayApply";
                    DataRow MasterRow = MasterTable.Rows[0];

                    cmd.CommandText = string.Format(@"select BillNo,RowNo,SrcBillSort,SourceBillNo,SourceMoney,ApplyMoney,
                        TotalMoney from tbStockPayApplyItem where BillNo = '{0}'", Row["BillNo"]);
                    DataTable DetailTable = new DataTable();
                    sqlda.Fill(DetailTable);
                    DetailTable.TableName = "tbStockPayApplyItem";

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    bool isStorageIn = isCheck;
                    #endregion

                    #region �ж�
                    foreach (DataRow DetailRow in DetailTable.Rows)
                    {
                        decimal NoApplyMoney= GetStockOrderNoApplyMoney(cmd, DetailRow);
                        decimal ApplyMoney=Convert.ToDecimal(DetailRow["TotalMoney"]);
                        if ((Convert.ToInt32(DetailRow["SrcBillSort"])!=0)&&( ApplyMoney>NoApplyMoney))
                        {
                            xzException.WarnBox(string.Format("�������Ѿ����ڵ��ݺ�:{0}��δ������{1}!",DetailRow["BillNo"],NoApplyMoney));
                        }
                        
                        #region ���²ɹ�����
                        UpdateStockOrder(cmd, DetailRow, ApplyMoney);
                        #endregion
                    }
                    #endregion

                    #region ���¼�ʱ���
                    HYTotailMoney FTotailMoney = new HYTotailMoney();
                    FTotailMoney.Command = cmd;
                    decimal Money = xzSqlAnalysis.getValue(MasterRow["BalanceProfit"]);
                    if (Money > 0m) FTotailMoney.CalcMoney(!isStorageIn, MasterRow["SupplyerType"], MasterRow["SupplyerCode"], "HasBalanceProfit", Money);
                    Money = xzSqlAnalysis.getValue(MasterRow["BalanceKeepPrice"]);
                    if (Money > 0m) FTotailMoney.CalcMoney(!isStorageIn, MasterRow["SupplyerType"], MasterRow["SupplyerCode"], "HasBalanceKeepPrice", Money);
                    Money = xzSqlAnalysis.getValue(MasterRow["BalanceCharge"]);
                    if (Money > 0m) FTotailMoney.CalcMoney(!isStorageIn, MasterRow["SupplyerType"], MasterRow["SupplyerCode"], "HasBalanceCharge", Money);

                    //FTotailMoney.CalcMoney(isStorageIn, MasterRow["SupplyerType"], MasterRow["SupplyerCode"], "AccountMoney"
                    //    , xzSqlAnalysis.getValue(MasterRow["FactPayMoney"]));
                    #endregion
                }
            }
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            Hashtable haReturn = new Hashtable();
            HYStorageManager FStorageManager;

            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Connection = Connect;
                switch (ID)
                {
                    case 0:
                        #region �жϴ����Ƿ��ڿ���д���
                        FStorageManager = new HYStorageManager();
                        FStorageManager.Command = command;
                        haReturn.Add(0, FStorageManager.StorageHasListNo(ht[0], ht[1], ht[2]));
                        #endregion
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        HYStorageMessage.HintChange(command, "tbStockPayApply", ht[0]);
                        #endregion
                        break;
                    case 2:
                        #region ��ȡδ������
                        command.CommandText = string.Format(@"select HasBalanceProfit, HasBalanceKeepPrice, HasBalanceCharge, AccountMoney
                               from tbFinTotalMoney where CopartnerType = '{0}' and CopartnerCode = '{1}'"
                            , ht[0], ht[1]);
                        SqlDataReader Reader = command.ExecuteReader();
                        if (Reader.Read())
                        {
                            haReturn.Add(0, Reader["HasBalanceProfit"]);
                            haReturn.Add(1, Reader["HasBalanceKeepPrice"]);
                            haReturn.Add(2, Reader["HasBalanceCharge"]);
                            haReturn.Add(3, Reader["AccountMoney"]);
                        }
                        else
                        {
                            haReturn.Add(0, 0m);
                            haReturn.Add(1, 0m);
                            haReturn.Add(2, 0m);
                            haReturn.Add(3, 0m);
                        }
                        #endregion
                        break;
                }
            }
            finally
            {
                Connect.Close();
            }
            return haReturn;
        }
    }

    #endregion

    #region Ӧ�չ���
    /// <summary>
    /// ������������
    /// </summary>
    public class SvrSaleChargeOther : SvrSystemDB, IServerSkedUserExecEx
    {
        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row, xzSourceStateEventArgs e)
        {
            //ȷ�ϲ���
            if (Row != null && e.SignBit == BitTermMath.TermOne)
            {
                using (SqlCommand cmd = new SqlCommand())
                using (SqlDataAdapter sqlda = new SqlDataAdapter())
                {
                    cmd.Connection = Connect;
                    cmd.Transaction = Tran;
                    sqlda.SelectCommand = cmd;

                    bool isCheck = !BitTermMath.GetBitTrue(e.SourceStateValue, e.SignBit);

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate ,ClientType, ClientCode
                             , TotalMoney, SettlementMoney
                           from tbSaleChargeOther where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbSaleChargeOther";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    //DataTable DetailTable = new DataTable();
                    //cmd.CommandText = string.Format("select * from tbStockChargeOtherItem where BillNo = '{0}'", Row["BillNo"]);
                    //sqlda.Fill(DetailTable);
                    //DetailTable.TableName = "tbStockChargeOtherItem";

                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    bool isStorageIn = (!isRadBill && isCheck) || (isRadBill && !isCheck);

                    #endregion

                    #region �ж�

                    #endregion

                    #region ���¼�ʱ���
                    HYTotailMoney FTotailMoney = new HYTotailMoney();
                    FTotailMoney.Command = cmd;
                    FTotailMoney.CalcMoney(isStorageIn, MasterRow["ClientType"], MasterRow["ClientCode"], "NoBalanceCharge"
                        , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                    #endregion
                }
            }
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            Hashtable haReturn = new Hashtable();

            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Connection = Connect;
                switch (ID)
                {
                    case 0:
                        #region �жϴ����Ƿ��ڿ���д���

                        #endregion
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        HYStorageMessage.HintChange(command, "tbSaleChargeOther", ht[0]);
                        #endregion
                        break;
                }
            }
            finally
            {
                Connect.Close();
            }
            return haReturn;
        }
    }

    /// <summary>
    ///�����г�����
    /// </summary>
    public class SvrSaleChargePromotion : SvrSystemDB, IServerSkedUserExecEx
    {
        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row, xzSourceStateEventArgs e)
        {
            //ȷ�ϲ���
            if (Row != null && e.SignBit == BitTermMath.TermOne)
            {
                using (SqlCommand cmd = new SqlCommand())
                using (SqlDataAdapter sqlda = new SqlDataAdapter())
                {
                    cmd.Connection = Connect;
                    cmd.Transaction = Tran;
                    sqlda.SelectCommand = cmd;

                    bool isCheck = !BitTermMath.GetBitTrue(e.SourceStateValue, e.SignBit);

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate ,BillSort ,ClientType, ClientCode
                             , TotalMoney, SettlementMoney
                           from tbSaleChargePromotion where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbSaleChargePromotion";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);


                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    bool isStorageIn = (!isRadBill && isCheck) || (isRadBill && !isCheck);

                    #endregion

                    #region �ж�

                    #endregion

                    #region ���¼�ʱ���
                    HYTotailMoney FTotailMoney = new HYTotailMoney();
                    FTotailMoney.Command = cmd;
                    switch (MasterRow["BillSort"].ToString())
                    {
                        case "001":
                            FTotailMoney.CalcMoney(isStorageIn, MasterRow["ClientType"], MasterRow["ClientCode"], "NoBalanceProfit"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            break;
                        case "002":
                            FTotailMoney.CalcMoney(isStorageIn, MasterRow["ClientType"], MasterRow["ClientCode"], "NoBalanceKeepPrice"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            break;
                    }
                    #endregion
                }
            }
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            Hashtable haReturn = new Hashtable();

            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Connection = Connect;
                switch (ID)
                {
                    case 0:
                        #region �жϴ����Ƿ��ڿ���д���

                        #endregion
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        HYStorageMessage.HintChange(command, "tbSaleChargePromotion", ht[0]);
                        #endregion
                        break;
                }
            }
            finally
            {
                Connect.Close();
            }
            return haReturn;
        }
    }

    /// <summary>
    ///���۷��ý���
    /// </summary>
    public class SvrSaleChargeSettlement : SvrSystemDB, IServerSkedUserExecEx
    {
        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row, xzSourceStateEventArgs e)
        {
            //ȷ�ϲ���
            if (Row != null && e.SignBit == BitTermMath.TermOne)
            {
                using (SqlCommand cmd = new SqlCommand())
                using (SqlDataAdapter sqlda = new SqlDataAdapter())
                {
                    cmd.Connection = Connect;
                    cmd.Transaction = Tran;
                    sqlda.SelectCommand = cmd;

                    bool isCheck = !BitTermMath.GetBitTrue(e.SourceStateValue, e.SignBit);

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate, 
                                SrcBillSort, ClientType, ClientCode, TotalMoney
                           from tbSaleChargeSettlement where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbSaleChargeSettlement";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    bool isStorageIn = (!isRadBill && !isCheck) || (isRadBill && isCheck);
                    #endregion

                    #region �ж�

                    #endregion

                    #region ���¼�ʱ���
                    HYTotailMoney FTotailMoney = new HYTotailMoney();
                    FTotailMoney.Command = cmd;
                    switch (MasterRow["SrcBillSort"].ToString())
                    {
                        case "1":
                            FTotailMoney.CalcMoney(isStorageIn, MasterRow["ClientType"], MasterRow["ClientCode"], "NoBalanceProfit"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            FTotailMoney.CalcMoney(!isStorageIn, MasterRow["ClientType"], MasterRow["ClientCode"], "HasBalanceProfit"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            break;
                        case "2":
                            FTotailMoney.CalcMoney(isStorageIn, MasterRow["ClientType"], MasterRow["ClientCode"], "NoBalanceKeepPrice"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            FTotailMoney.CalcMoney(!isStorageIn, MasterRow["ClientType"], MasterRow["ClientCode"], "HasBalanceKeepPrice"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            break;
                        case "3":
                            FTotailMoney.CalcMoney(isStorageIn, MasterRow["ClientType"], MasterRow["ClientCode"], "NoBalanceCharge"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            FTotailMoney.CalcMoney(!isStorageIn, MasterRow["ClientType"], MasterRow["ClientCode"], "HasBalanceCharge"
                                , xzSqlAnalysis.getValue(MasterRow["TotalMoney"]));
                            break;
                    }
                    #endregion
                }
            }
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            Hashtable haReturn = new Hashtable();

            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Connection = Connect;
                switch (ID)
                {
                    case 0:
                        #region �жϴ����Ƿ��ڿ���д���
                        #endregion
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        HYStorageMessage.HintChange(command, "tbSaleChargeSettlement", ht[0]);
                        #endregion
                        break;
                    case 2:
                        #region ��ȡδ������
                        command.CommandText = string.Format(@"select isnull(NoBalanceProfit,0) + isnull(NoBalanceKeepPrice,0) 
                               + isnull(NoBalanceCharge,0) from tbFinTotalMoney where CopartnerType = '{0}' and CopartnerCode = '{1}'"
                            , ht[0], ht[1]);
                        haReturn.Add(0, command.ExecuteScalar());
                        #endregion
                        break;
                }
            }
            finally
            {
                Connect.Close();
            }
            return haReturn;
        }
    }

    #endregion
}