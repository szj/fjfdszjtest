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
    public class HyLoginStorage
    {
        public static void Login(xzServerManage FServerManage)
        {
            string sql = xzSqlConnect.ConnectionString(FServerManage.ServerManageParam.SqlConnectParam);

            #region �ɹ�����
            SvrStockOrder.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrStockOrder), "ISvrStockOrder");                  //�ɹ�����

            SvrStockInvoice.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrStockInvoice), "ISvrStockInvoice");              //�ɹ���Ʊ

            SvrStockInvoiceVerify.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrStockInvoiceVerify), "ISvrStockInvoiceVerify");  //�ɹ���Ʊ����
            #endregion

            #region ���۹���
            SvrSaleOrder.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSaleOrder), "ISvrSaleOrder");      //���۶���

            SvrSaleOut.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSaleOut), "ISvrSaleOut");          //���۳���
            
            SvrSaleInvoice.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSaleInvoice), "ISvrSaleInvoice");  //���۷�Ʊ
            
            SvrSaleVerification.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSaleVerification), "ISvrSaleVerification");             //���۷�Ʊ����

            SvrSaleVerifyCancelMobile.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSaleVerifyCancelMobile), "ISvrSaleVerifyCancelMobile"); //�ƶ�ί�д������۷�Ʊ����

            SvrSaleVerifyCancelMobile.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSaleOutCancelMobile), "ISvrSaleOutCancelMobile");        //�ƶ�ί�д������۳������

            //SvrSaleVerificationMobile.ConnectStr = sql;
            //FServerManage.Server.StartupTCPServer(typeof(SvrSaleVerificationMobileBack), "ISvrSaleVerificationMobileBack"); //�ƶ�ί�д������۷�Ʊ����(��-->��,��-->��)

            SvrSaleVerificationMobile.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSaleVerificationMobile), "ISvrSaleVerificationMobile");        //�ƶ�ί�д������۷�Ʊ�����۳��⹴��

            SvrSaleVerificationMobileList.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSaleVerificationMobileList), "ISvrSaleVerificationMobileList");//�ƶ�ί�д������۴��Ź���

            SvrSaleListImput.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSaleListImput), "ISvrSaleListImput");                          //���봮������
            #endregion

            #region ������
            SvrStorStockIn.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrStorStockIn), "ISvrStorStockIn");    //��Ʒ�⹺���

            SvrStorOtherIn.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrStorOtherIn), "ISvrStorOtherIn");    //������ⵥ

            SvrStorOtherOut.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrStorOtherOut), "ISvrStorOtherOut");  //�������ⵥ

            SvrStorCheck.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrStorCheck), "ISvrStorCheck");        //��Ʒ�ֿ��̵�

            SvrStorRedeploy.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrStorRedeploy), "ISvrStorRedeploy");  //�ֿ�������͵�

            SvrStorMaintainPostSelf.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrStorMaintainPostSelf), "ISvrStorMaintainPostSelf"); //ά�޼ĳ�

            SvrStorVerificationReturnSelf.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrStorVerificationReturnSelf), "ISvrStorVerificationReturnSelf");  //ά�޷��غ���
            #endregion

            #region �ŵ����
            SvrSelfOrder.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSelfOrder), "ISvrSelfOrder");            //�ŵ궩����

            SvrSelfSaleOut.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSelfSaleOut), "ISvrSelfSaleOut");        //�ŵ꿪��
            #endregion
        }
    }

    ///<summary>
    /// ��Ʒ�⹺���
    ///</summary>
    public class SvrStorStockIn : SvrSystemDB, IServerSkedUserExecEx
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
                    HYVoucherManager FVoucherManager = new HYVoucherManager();
                    FVoucherManager.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, SrcBillSort, SupplyerCode,SupplyerType,TheDate
                             from tbStorStockIn where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbStorOtherIn";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    DataTable DetailTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbStorStockInItem where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(DetailTable);
                    DetailTable.TableName = "tbStorStockInItem";

                    DataTable ListTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbStorStockInItemDetail where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(ListTable);
                    ListTable.TableName = "tbStorStockInItemDetail";
                    #endregion

                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    bool isStorageIn = (!isRadBill && isCheck) || (isRadBill && !isCheck);

                    int SrcBillSort = (int)MasterRow["SrcBillSort"];

                    #region �ж�
                    foreach (DataRow DetailRow in DetailTable.Rows)
                    {
                        #region ����Ƿ��㹻(����)
                        if (!isStorageIn && !FStorageManager.StorageIsEnough(DetailRow["ProductSortCode"], DetailRow["ProductCode"],
                            DetailRow["StorageCode"], DetailRow["PlaceCode"], DetailRow["Number"])) 
                            xzException.WarnBox(HYStorageMessage._MsgStorageIsEnough);
                        #endregion

                        #region ƾ֤���ж�
                        switch (SrcBillSort)
                        {
                            case 1:
                                FVoucherManager.isUpdateStockOrder(isStorageIn, DetailRow);
                                break;
                            case 2:
                                FVoucherManager.isUpdateStockReturnNotice(isStorageIn, DetailRow);
                                break;
                        }
                        #endregion

                        DataRow[] ListRows = ListTable.Select(string.Format("BillNo = '{0}' and RowNo = {1}", DetailRow["BillNo"], DetailRow["RowNo"]));
                        foreach (DataRow ListRow in ListRows)
                        {
                            #region �����Ƿ��ڿ���д���

                            //����Ƿ����ظ�����(���)
                            if (isStorageIn)
                            {
                                bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], ListRow["ListNo"]);
                                if (isHasListNo)
                                {
                                    xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] ���ݿ����Ѿ����ڣ�", ListRow["ProductCode"], ListRow["ListNo"]));
                                }
                            }
                            //����Ƿ�����Ӧ����(����)
                            if (!isStorageIn)
                            {
                                bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], DetailRow["StorageCode"], DetailRow["PlaceCode"], ListRow["ListNo"]);
                                if (!isHasListNo)
                                {
                                    xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] �����ڲֿ���({2}),��λ({3})��", ListRow["ProductCode"], ListRow["ListNo"], DetailRow["StorageCode"], DetailRow["PlaceCode"]));
                                }
                            }
                            #endregion
                        }
                    }

                    #endregion

                    #region ����ƾ֤�Ĵ���
                    switch (SrcBillSort)
                    {
                        case 1:
                            FVoucherManager.UpdateStockOrder(isStorageIn, DetailTable);
                            break;
                        case 2:
                            FVoucherManager.UpdateStockReturnNotice(isStorageIn, DetailTable);
                            break;
                    }
                    #endregion

                    #region ���¿������
                    if (isRadBill)
                    {
                        FStorageManager.UpdateStorage3(isCheck, isStorageIn, HYStorageManager._StockInRed, HYStorageManager._StockInRedName,
                              MasterRow, DetailTable, ListTable);
                    }
                    else
                    {
                        FStorageManager.UpdateStorage3(isCheck, isStorageIn, HYStorageManager._StockIn, HYStorageManager._StockInName
                            , MasterRow, DetailTable, ListTable);
                    }
                    #endregion
                }
            }
        }

        protected override void updateBefore(xzSqlDataRelating SqlData, xzSourceExerciseEventArgs e, DataTable MasterTable,
            xzSqlDataParam[] ParamArg, SqlCommand cmd)
        {
            switch (e.SourceInsert)
            {
                case xzSourceExerciseDeal.Change:
                    #region ִ�и��Ĳ���ʱ

                    #region �������ǰ�����ĺ������
                    DataRow MasterRow = MasterTable.Rows[0];
                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);

                    DataTable ListTable = null, DetailTable = null;
                    foreach (xzSqlDataParam ParamItem in ParamArg)
                    {
                        if (ParamItem.Table.TableName == "tbStorStockInItem")
                            DetailTable = ParamItem.Table.Copy();
                        if (ParamItem.Table.TableName == "tbStorStockInItemDetail")
                            ListTable = ParamItem.Table.Copy();
                    }

                    DataTable HistoryListTable = null, HistoryDetailTable = null;
                    DataRow HistoryMasterRow = null;
                    if (e.HistoryDataSet != null)
                    {
                        HistoryListTable = e.HistoryDataSet.Tables["tbStorStockInItemDetail"];
                        HistoryDetailTable = e.HistoryDataSet.Tables["tbStorStockInItem"];
                        HistoryMasterRow = e.HistoryDataSet.Tables["tbStorStockIn"].Rows[0];
                    }
                    #endregion

                    #region ����������Ϣ
                    string ModuleSort = HYStorageManager._StockIn;
                    if (isRadBill) ModuleSort = HYStorageManager._StockInRed;

                    SvrGoubleParam FSvrGoubleParam = new SvrGoubleParam();
                    FSvrGoubleParam.Command = cmd;
                    DateTime ReckonTime = FSvrGoubleParam.getReckonTime();
                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;
                    if (HistoryMasterRow["SupplyerType"].ToString() != MasterRow["SupplyerType"].ToString()
                        || HistoryMasterRow["SupplyerCode"].ToString() != MasterRow["SupplyerCode"].ToString()
                        || HistoryMasterRow["TheDate"].ToString() != MasterRow["TheDate"].ToString())
                    {
                        foreach (DataRow ListRow in ListTable.Rows)
                            FStorageManager.UpdateListInfo(ReckonTime, MasterRow, ListRow, ModuleSort, true);
                        foreach (DataRow DetialRow in DetailTable.Rows)
                        {
                            if (Convert.ToInt32(DetialRow["isListNo"]) == 0)
                                FStorageManager.UpdateProductInfo(ReckonTime, MasterRow, DetialRow, ModuleSort, true);
                        }

                    }
                    else
                    {
                        foreach (DataRow ListRow in ListTable.Rows)
                            FStorageManager.UpdateListInfo(ReckonTime, MasterRow, ListRow, ModuleSort, false);
                        foreach (DataRow DetialRow in DetailTable.Rows)
                        {
                            if (Convert.ToInt32(DetialRow["isListNo"]) == 0)
                                FStorageManager.UpdateProductInfo(ReckonTime, MasterRow, DetialRow, ModuleSort, false);
                        }
                    }
                    #endregion

                    #endregion
                    break;
                case xzSourceExerciseDeal.Copy:
                case xzSourceExerciseDeal.Noraml:
                    break;
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
                        HYStorageMessage.HintChange(command, "tbStorStockIn", ht[0]);
                        #endregion
                        break;
                    case 2:
                        #region �����Ƿ����쿪����
                        string StrSql = @"select Count(*) from tbStorStockInItemDetail a
                                Left Outer Join tbStorStockIn b on a.BillNo = b.BillNo
                         where dbo.GetByteToBoolean(b.TheState,0x0001)=1
                             and a.ProductSortCode = '{0}' and ProductCode = '{1}' and  a.ListNo = '{2}'";
                        command.CommandText = string.Format(StrSql, ht[0], ht[1], ht[2]);
                        if (Convert.ToInt32(command.ExecuteScalar()) > 0) haReturn.Add(0, true);
                        else haReturn.Add(0, false);
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

    ///<summary>
    /// ������ⵥ
    ///</summary>
    public class SvrStorOtherIn : SvrSystemDB, IServerSkedUserExecEx
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

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;
                    HYVoucherManager FVoucherManager = new HYVoucherManager();
                    FVoucherManager.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse,FlowBit,UseState,AssistantCode,SrcBillSort, SupplyerCode,SupplyerType,TheDate
                             from tbStorOtherIn where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbStorOtherIn";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    DataTable DetailTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbStorOtherInItem where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(DetailTable);
                    DetailTable.TableName = "tbStorOtherInItem";

                    DataTable ListTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbStorOtherInItemDetail where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(ListTable);
                    ListTable.TableName = "tbStorOtherInItemDetail";
                    #endregion

                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    bool isStorageIn = (!isRadBill && isCheck) || (isRadBill && !isCheck);

                    string InMode = MasterRow["AssistantCode"].ToString();
                    int SrcBillSort = (int)MasterRow["SrcBillSort"];

                    #region �ж�
                    foreach (DataRow DetailRow in DetailTable.Rows)
                    {
                        #region ����Ƿ��㹻(����)
                        if (!isStorageIn && !FStorageManager.StorageIsEnough(DetailRow["ProductSortCode"], DetailRow["ProductCode"],
                            DetailRow["StorageCode"], DetailRow["PlaceCode"], DetailRow["Number"])) 
                            xzException.WarnBox(HYStorageMessage._MsgStorageIsEnough);
                        #endregion

                        #region �򵥵Ĳ�ͬ��;��������ص��ж�
                        switch (InMode)
                        {
                            case "WX":
                            #region ά�޷��ع���
                            #endregion
                            default:
                                #region ƾ֤���ж�
                                switch (SrcBillSort)
                                {
                                    case 1:
                                        if (!FVoucherManager.isUpdateStockOrder(isStorageIn, DetailRow))
                                            xzException.WarnBox(HYStorageMessage._MsgSourceBillIsEnough);
                                        break;
                                    case 2:
                                        if (!FVoucherManager.isUpdateStockReturnNotice(isStorageIn, DetailRow))
                                            xzException.WarnBox(HYStorageMessage._MsgSourceBillIsEnough);
                                        break;
                                }
                                break;
                                #endregion
                        }

                        #endregion

                        DataRow[] ListRows = ListTable.Select(string.Format("BillNo = '{0}' and RowNo = {1}", DetailRow["BillNo"], DetailRow["RowNo"]));
                        foreach (DataRow ListRow in ListRows)
                        {
                            #region �����Ƿ��ڿ���д���
                            //����Ƿ����ظ�����(���)
                            if (isStorageIn)
                            {
                                bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], ListRow["ListNo"]);
                                if (isHasListNo)
                                {
                                    xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] ���ݿ����Ѿ����ڣ�", ListRow["ProductCode"], ListRow["ListNo"]));
                                }
                            }
                            //����Ƿ�����Ӧ����(����)
                            if (!isStorageIn)
                            {
                                bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], DetailRow["StorageCode"], DetailRow["PlaceCode"], ListRow["ListNo"]);
                                if (!isHasListNo)
                                {
                                    xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] �����ڲֿ���({2}),��λ({3})��", ListRow["ProductCode"], ListRow["ListNo"], DetailRow["StorageCode"], DetailRow["PlaceCode"]));
                                }
                            }  
                            #endregion

                            #region �򵥵Ĳ�ͬ��;��������ص��ж�
                            switch (InMode)
                            {
                                case "WX":
                                    #region ά�޷��ع���
                                    if (ListRow["IsVerify"] != DBNull.Value && Convert.ToInt32(ListRow["IsVerify"]) > 0)
                                        xzException.WarnBox(HYStorageMessage._MsgHasVerify);
                                    break;
                                    #endregion
                                default:
                                    #region ƾ֤���ж�
                                    break;
                                    #endregion
                            }

                            #endregion
                        }
                    }
                    #endregion

                    #region ����ƾ֤�Ĵ���
                    switch (SrcBillSort)
                    {
                        case 1:
                            FVoucherManager.UpdateStockOrder(isStorageIn, DetailTable);
                            break;
                        case 2:
                            FVoucherManager.UpdateStockReturnNotice(isStorageIn, DetailTable);
                            break;
                    }

                    #endregion

                    #region ���¿������
                    switch (InMode)
                    {
                        case "WX":
                            #region ֱӪ��ά�޷���
                            if (isRadBill)
                            {
                                FStorageManager.UpdateStorage3(isCheck, isStorageIn, HYStorageManager._MaintainPostSelfReturnRed
                                    , HYStorageManager._MaintainPostSelfReturnRedName, MasterRow, DetailTable, ListTable);
                            }
                            else
                            {
                                FStorageManager.UpdateStorage3(isCheck, isStorageIn, HYStorageManager._MaintainPostSelfReturn
                                    , HYStorageManager._MaintainPostSelfReturnName, MasterRow, DetailTable, ListTable);
                            }
                            break;
                            #endregion
                        default:
                            #region �������
                            if (isRadBill)
                            {
                                FStorageManager.UpdateStorage3(isCheck, isStorageIn, HYStorageManager._OtherInRed, HYStorageManager._OtherInRedName,
                                      MasterRow, DetailTable, ListTable);
                            }
                            else
                            {
                                FStorageManager.UpdateStorage3(isCheck, isStorageIn, HYStorageManager._OtherIn, HYStorageManager._OtherInName
                                    , MasterRow, DetailTable, ListTable);
                            }
                            break;
                            #endregion
                    }
                    #endregion
                }
            }
        }

        protected override void updateBefore(xzSqlDataRelating SqlData, xzSourceExerciseEventArgs e, DataTable MasterTable,
            xzSqlDataParam[] ParamArg, SqlCommand cmd)
        {
            switch (e.SourceInsert)
            {
                case xzSourceExerciseDeal.Change:
                    #region ִ�и��Ĳ���ʱ

                    #region �������ǰ�����ĺ������
                    DataRow MasterRow = MasterTable.Rows[0];
                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    string InMode = MasterRow["AssistantCode"].ToString();
                    //HYStorageMessage.HintChange(cmd, "tbStorOtherIn", MasterRow["BillNo"]); //��������ж�
                    DataTable ListTable = null, DetailTable = null;
                    foreach (xzSqlDataParam ParamItem in ParamArg)
                    {
                        if (ParamItem.Table.TableName == "tbStorOtherInItem")
                            DetailTable = ParamItem.Table.Copy();
                        if (ParamItem.Table.TableName == "tbStorOtherInItemDetail")
                            ListTable = ParamItem.Table.Copy();
                    }

                    DataTable HistoryListTable = null, HistoryDetailTable = null;
                    DataRow HistoryMasterRow = null;
                    if (e.HistoryDataSet != null)
                    {
                        HistoryListTable = e.HistoryDataSet.Tables["tbStorOtherInItemDetail"];
                        HistoryDetailTable = e.HistoryDataSet.Tables["tbStorOtherInItem"];
                        HistoryMasterRow = e.HistoryDataSet.Tables["tbStorOtherIn"].Rows[0];
                    }
                    #endregion

                    #region ����������Ϣ
                    string ModuleSort = "";
                    switch (InMode)
                    {
                        case "WX":
                            ModuleSort = HYStorageManager._MaintainPostSelfReturn;
                            if (isRadBill) ModuleSort = HYStorageManager._MaintainPostSelfReturnRed;
                            break;
                        default:
                            ModuleSort = HYStorageManager._OtherIn;
                            if (isRadBill) ModuleSort = HYStorageManager._OtherInRed;
                            break;
                    }                   

                    SvrGoubleParam FSvrGoubleParam = new SvrGoubleParam();
                    FSvrGoubleParam.Command = cmd;
                    DateTime ReckonTime = FSvrGoubleParam.getReckonTime();
                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;
                    if (HistoryMasterRow["SupplyerType"].ToString() != MasterRow["SupplyerType"].ToString()
                        || HistoryMasterRow["SupplyerCode"].ToString() != MasterRow["SupplyerCode"].ToString()
                        || HistoryMasterRow["TheDate"].ToString() != MasterRow["TheDate"].ToString())
                    {
                        foreach (DataRow ListRow in ListTable.Rows)
                            FStorageManager.UpdateListInfo(ReckonTime, MasterRow, ListRow, ModuleSort, true);
                        foreach (DataRow DetialRow in DetailTable.Rows)
                        {
                            if (Convert.ToInt32(DetialRow["isListNo"]) == 0)
                                FStorageManager.UpdateProductInfo(ReckonTime, MasterRow, DetialRow, ModuleSort, true);
                        }
                    }
                    else
                    {
                        foreach (DataRow ListRow in ListTable.Rows)
                            FStorageManager.UpdateListInfo(ReckonTime, MasterRow, ListRow, ModuleSort, false);
                        foreach (DataRow DetialRow in DetailTable.Rows)
                        {
                            if (Convert.ToInt32(DetialRow["isListNo"]) == 0)
                                FStorageManager.UpdateProductInfo(ReckonTime, MasterRow, DetialRow, ModuleSort, false);
                        }
                    }
                    #endregion

                    #endregion
                    break;
                case xzSourceExerciseDeal.Copy:
                case xzSourceExerciseDeal.Noraml:
                    break;
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
                        HYStorageMessage.HintChange(command, "tbStorOtherIn", ht[0]);
                        #endregion
                        break;
                    case 2:
                        #region �����Ƿ����쿪����
                        string StrSql = @"select Count(*) from tbStorOtherInItemDetail a
                                Left Outer Join tbStorOtherIn b on a.BillNo = b.BillNo
                         where dbo.GetByteToBoolean(b.TheState,0x0001)=1
                             and a.ProductSortCode = '{0}' and ProductCode = '{1}' and  a.ListNo = '{2}'";
                        command.CommandText = string.Format(StrSql, ht[0], ht[1], ht[2]);
                        if (Convert.ToInt32(command.ExecuteScalar()) > 0) haReturn.Add(0, true);
                        else haReturn.Add(0, false);
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
    ///�ֿ������
    /// </summary>
    public class SvrStorRedeploy : SvrSystemDB, IServerSkedUserExecEx
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
                    FStorageManager.Field.FieldStorage = "OutStorageCode";
                    FStorageManager.Field.FieldPlace = "OutPlaceCode";
                    FStorageManager.Field.FieldSumMoney = "OutSumMoney";
                    FStorageManager.Field.FieldInCostPrice = "OutCostPrice";
                    FStorageManager.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse,FlowBit,UseState,SrcBillSort,TheDate, ShopInCode, ShopInSort, ShopOutCode,ShopOutSort
                         from tbStorRedeploy where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbStorRedeploy";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    DataTable DetailTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbStorRedeployItem where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(DetailTable);
                    DetailTable.TableName = "tbStorRedeployItem";

                    DataTable ListTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbStorRedeployItemDetail where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(ListTable);
                    ListTable.TableName = "tbStorRedeployItemDetail";
                    #endregion

                    #region �ж�
                    bool isStorageIn = !isCheck;

                    foreach (DataRow DetailRow in DetailTable.Rows)
                    {
                        #region ����Ƿ��㹻(����)
                        if (!isStorageIn && !FStorageManager.StorageIsEnough(DetailRow["ProductSortCode"], DetailRow["ProductCode"],
                            DetailRow["OutStorageCode"], DetailRow["OutPlaceCode"], DetailRow["Number"])) 
                            xzException.WarnBox(HYStorageMessage._MsgStorageIsEnough);
                        #endregion



                        DataRow[] ListRows = ListTable.Select(string.Format("BillNo = '{0}' and RowNo = {1}", DetailRow["BillNo"], DetailRow["RowNo"]));
                        foreach (DataRow ListRow in ListRows)
                        {
                            #region �����Ƿ��ڿ���д���
                            //����Ƿ����ظ�����(���)
                            if (isStorageIn)
                            {
                                bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], ListRow["ListNo"]);
                                if (isHasListNo)
                                {
                                    xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] ���ݿ����Ѿ����ڣ�", ListRow["ProductCode"], ListRow["ListNo"]));
                                }
                            }
                            //����Ƿ�����Ӧ����(����)
                            if (!isStorageIn)
                            {
                                bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], DetailRow["OutStorageCode"], DetailRow["OutPlaceCode"], ListRow["ListNo"]);
                                if (!isHasListNo)
                                {
                                    xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] �����ڲֿ���({2}),��λ({3})��", ListRow["ProductCode"], ListRow["ListNo"], DetailRow["OutStorageCode"], DetailRow["OutPlaceCode"]));
                                }
                            }  
                            #endregion
                        }
                    }
                    #endregion

                    #region ���¿������
                    FStorageManager.UpdateStorage3(isCheck, isStorageIn, HYStorageManager._Redeploy, HYStorageManager._RedeployName
                        , MasterRow, DetailTable, ListTable);
                    #endregion
                }
            }
        }

        protected override void updateBefore(xzSqlDataRelating SqlData, xzSourceExerciseEventArgs e, DataTable MasterTable,
            xzSqlDataParam[] ParamArg, SqlCommand cmd)
        {
            switch (e.SourceInsert)
            {
                case xzSourceExerciseDeal.Change:
                    #region ִ�и��Ĳ���ʱ

                    #region �������ǰ�����ĺ������
                    DataRow MasterRow = MasterTable.Rows[0];                    
                    DataTable ListTable = null, DetailTable = null;
                    foreach (xzSqlDataParam ParamItem in ParamArg)
                    {
                        if (ParamItem.Table.TableName == "tbStorRedeployItem")
                            DetailTable = ParamItem.Table.Copy();
                        if (ParamItem.Table.TableName == "tbStorRedeployItemDetail")
                            ListTable = ParamItem.Table.Copy();
                    }

                    DataTable HistoryListTable = null, HistoryDetailTable = null;
                    DataRow HistoryMasterRow = null;
                    if (e.HistoryDataSet != null)
                    {
                        HistoryListTable = e.HistoryDataSet.Tables["tbStorRedeployItemDetail"];
                        HistoryDetailTable = e.HistoryDataSet.Tables["tbStorRedeployItem"];
                        HistoryMasterRow = e.HistoryDataSet.Tables["tbStorRedeploy"].Rows[0];
                    }
                    #endregion

                    #region ��ת��Ϣ
                    
                    SvrGoubleParam FSvrGoubleParam = new SvrGoubleParam();
                    FSvrGoubleParam.Command = cmd;
                    DateTime ReckonTime = FSvrGoubleParam.getReckonTime();

                    string ModuleSort = HYStorageManager._Redeploy;
                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;
                    FStorageManager.Field.FieldSumMoney = "OutSumMoney";
                    FStorageManager.Field.FieldInCostPrice = "OutCostPrice";
                    foreach (DataRow ListRow in ListTable.Rows)
                        FStorageManager.UpdateListInfo(ReckonTime, MasterRow, ListRow, ModuleSort, false);
                    foreach (DataRow DetialRow in DetailTable.Rows)
                    {
                        if (Convert.ToInt32(DetialRow["isListNo"]) == 0)
                            FStorageManager.UpdateProductInfo(ReckonTime, MasterRow, DetialRow, ModuleSort, false);
                    }

                    bool isVerify = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermFive);
                    if (isVerify)
                    {
                        ModuleSort = HYStorageManager._RedeployIn;
                        FStorageManager.Field.FieldSumMoney = "InSumMoney";
                        FStorageManager.Field.FieldInCostPrice = "InCostPrice";
                        foreach (DataRow ListRow in ListTable.Rows)
                            FStorageManager.UpdateListInfo(ReckonTime, MasterRow, ListRow, ModuleSort, false);
                        foreach (DataRow DetialRow in DetailTable.Rows)
                        {
                            if (Convert.ToInt32(DetialRow["isListNo"]) == 0)
                                FStorageManager.UpdateProductInfo(ReckonTime, MasterRow, DetialRow, ModuleSort, false);
                        }
                    }

                    #endregion

                    #endregion
                    break;
                case xzSourceExerciseDeal.Copy:
                case xzSourceExerciseDeal.Noraml:
                    break;
            }
        }

        protected void ExecVerify(SqlCommand command, Hashtable ht)
        {
            #region ���µ�����״̬��Ϣ
            HYStorageManager FStorageManager = new HYStorageManager();
            FStorageManager.Field.FieldStorage = "InStorageCode";
            FStorageManager.Field.FieldPlace = "InPlaceCode";
            FStorageManager.Field.FieldSumMoney = "InSumMoney";
            FStorageManager.Command = command;
            HYVoucherManager FVoucherManager = new HYVoucherManager();
            FVoucherManager.Command = command;

            int i_UseState = Convert.ToInt32(ht[1]);
            bool FCheckAccept = BitTermMath.GetBitTrue(i_UseState, BitTermMath.TermFive);

            using (SqlDataAdapter sqlda = new SqlDataAdapter())
            {
                sqlda.SelectCommand = command;

                #region ��ʼ������
                command.CommandText = string.Format(@"select IsUse,FlowBit,UseState,SrcBillSort,TheDate, ShopInCode, ShopInSort, ShopOutCode,ShopOutSort
                         from tbStorRedeploy where BillNo = '{0}'", ht[0]);
                DataTable MasterTable = new DataTable();
                sqlda.Fill(MasterTable);
                MasterTable.TableName = "tbStorRedeploy";
                DataRow MasterRow = MasterTable.Rows[0];

                //�������
                if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                    xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                //�������ĵ�������
                if ((int)MasterRow["IsUse"] > 0)
                    xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                DataTable DetailTable = new DataTable();
                command.CommandText = string.Format("select * from tbStorRedeployItem where BillNo = '{0}'", ht[0]);
                sqlda.Fill(DetailTable);
                DetailTable.TableName = "tbStorRedeployItem";

                DataTable ListTable = new DataTable();
                command.CommandText = string.Format("select * from tbStorRedeployItemDetail where BillNo = '{0}'", ht[0]);
                sqlda.Fill(ListTable);
                ListTable.TableName = "tbStorRedeployItemDetail";
                #endregion

                int SrcBillSort = (int)MasterRow["SrcBillSort"];
                #region �ж�
                bool isStorageIn = FCheckAccept;

                foreach (DataRow DetailRow in DetailTable.Rows)
                {
                    #region ����Ƿ��㹻(����)
                    if (!isStorageIn && !FStorageManager.StorageIsEnough(DetailRow["ProductSortCode"], DetailRow["ProductCode"],
                        DetailRow["InStorageCode"], DetailRow["InPlaceCode"], DetailRow["Number"]))
                        xzException.WarnBox(HYStorageMessage._MsgStorageIsEnough);
                    #endregion

                    #region ƾ֤���ж�
                    switch (SrcBillSort)
                    {
                        case 1:
                            DataRow ShopRow = FVoucherManager.getUpdateSelfOrderInfo(DetailRow);
                            if (ShopRow == null)
                                xzException.WarnBox(string.Format("ԭ������[{0}]����������", DetailRow["SrcBillNo"]));

                            bool isAtShopIn = false;
                            string ShopCode = ShopRow["ShopCode"].ToString(), ShopSort = ShopRow["ShopSort"].ToString();
                            if (ShopCode == MasterRow["ShopInCode"].ToString() && ShopSort == MasterRow["ShopInSort"].ToString()) isAtShopIn = true;
                            if (isAtShopIn)
                            {
                                FVoucherManager.isUpdateSelfOrder(isStorageIn, DetailRow);
                            }
                            break;
                    }
                    #endregion

                    DataRow[] ListRows = ListTable.Select(string.Format("BillNo = '{0}' and RowNo = {1}", DetailRow["BillNo"], DetailRow["RowNo"]));
                    foreach (DataRow ListRow in ListRows)
                    {

                        #region �����Ƿ��ڿ���д���
                        //����Ƿ����ظ�����(���)
                        if (isStorageIn)
                        {
                            bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], ListRow["ListNo"]);
                            if (isHasListNo)
                            {
                                xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] ���ݿ����Ѿ����ڣ�", ListRow["ProductCode"], ListRow["ListNo"]));
                            }
                        }
                        //����Ƿ�����Ӧ����(����)
                        if (!isStorageIn)
                        {
                            bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], DetailRow["InStorageCode"], DetailRow["InPlaceCode"], ListRow["ListNo"]);
                            if (!isHasListNo)
                            {
                                xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] �����ڲֿ���({2}),��λ({3})��", ListRow["ProductCode"], ListRow["ListNo"], DetailRow["InStorageCode"], DetailRow["InPlaceCode"]));
                            }
                        }
                        #endregion
                    }
                }
                #endregion


                #region ����ƾ֤�Ĵ���
                foreach (DataRow DetailRow in DetailTable.Rows)
                {
                    switch (SrcBillSort)
                    {
                        case 1:
                            DataRow ShopRow = FVoucherManager.getUpdateSelfOrderInfo(DetailRow);
                            bool isAtShopIn = false;
                            string ShopCode = ShopRow["ShopCode"].ToString(), ShopSort = ShopRow["ShopSort"].ToString();
                            if (ShopCode == MasterRow["ShopInCode"].ToString() && ShopSort == MasterRow["ShopInSort"].ToString()) isAtShopIn = true;
                            if (isAtShopIn)
                            {
                                FVoucherManager.UpdateSelfOrder(isStorageIn, DetailRow);
                            }
                            break;
                    }
                }
                #endregion

                #region ����
                SqlTransaction SqlTran = command.Connection.BeginTransaction();
                try
                {
                    command.Transaction = SqlTran;
                    #region  ���µ�����������Ϣ
                    command.CommandText = string.Format(@"update tbStorRedeploy set UseState = {1}, VerifyCode = '{2}'
                             , ConfirmDate = {3}, VerifyRemark = '{4}'  where BillNo='{0}'", ht[0], ht[1], ht[2], ht[3], ht[4]);
                    command.ExecuteNonQuery();
                    #endregion

                    #region ���¿������
                    FStorageManager.UpdateStorage3(FCheckAccept, isStorageIn, HYStorageManager._RedeployIn, HYStorageManager._RedeployInName
                        , MasterRow, DetailTable, ListTable);
                    #endregion
                    SqlTran.Commit();
                }
                catch (Exception Ex)
                {
                    SqlTran.Rollback();
                    xzException.WarnBox(Ex.Message);
                }
                #endregion
            }

            #endregion
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
                        FStorageManager.Field.FieldStorage = "OutStorageCode";
                        FStorageManager.Field.FieldPlace = "OutPlaceCode";
                        haReturn.Add(0, FStorageManager.StorageHasListNo(ht[0], ht[1], ht[2], ht[3], ht[4]));
                        #endregion
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        HYStorageMessage.HintChange(command, "tbStorRedeploy", ht[0]);
                        #endregion
                        break;
                    case 2:
                        #region �������Ƿ񼺾�����
                        command.CommandText = string.Format(@"select UseState from tbSelfSaleOut where BillNo = '{0}'", ht[0]);
                        object UseState = command.ExecuteScalar();
                        if (BitTermMath.GetBitTrue((int)UseState, BitTermMath.TermFive)) haReturn.Add(0, true);
                        else haReturn.Add(0, false);
                        #endregion
                        break;
                    case 3:
                        #region ����������
                        ExecVerify(command, ht);
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
    /// �̵㵥
    /// </summary>
    public class SvrStorCheck : SvrSystemDB, IServerSkedUserExecEx
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
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate, StorageCode
                             from tbStorCheck where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbStorCheck";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    DataTable DetailTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbStorCheckItem where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(DetailTable);
                    DetailTable.TableName = "tbStorCheckItem";

                    DataTable ListTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbStorCheckItemDetail where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(ListTable);
                    ListTable.TableName = "tbStorCheckItemDetail";
                    #endregion                    

                    #region �ж�
                    foreach (DataRow DetailRow in DetailTable.Rows)
                    {
                        bool isCheckOut = xzSqlAnalysis.getValue(DetailRow["Number"]) < 0;
                        bool isStorageIn = (!isCheckOut && isCheck) || (isCheckOut && !isCheck);

                        #region ����Ƿ��㹻(����)
                        if (!isStorageIn && !FStorageManager.StorageIsEnough(DetailRow["ProductSortCode"], DetailRow["ProductCode"],
                                MasterRow["StorageCode"], DetailRow["PlaceCode"], DetailRow["Number"]))
                            xzException.WarnBox(HYStorageMessage._MsgStorageIsEnough);
                        #endregion

                        #region �����Ƿ��ڿ���д���
                        DataRow[] ListRows = ListTable.Select(string.Format("BillNo = '{0}' and RowNo = {1}", DetailRow["BillNo"], DetailRow["RowNo"]));
                        
                        foreach (DataRow ListRow in ListRows)
                        {
                            //����Ƿ����ظ�����(���)
                            if (isStorageIn)
                            {
                                bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], ListRow["ListNo"]);
                                if (isHasListNo)
                                {
                                    xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] ���ݿ����Ѿ����ڣ�", ListRow["ProductCode"], ListRow["ListNo"]));
                                }
                            }
                            //����Ƿ�����Ӧ����(����)
                            if (!isStorageIn)
                            {
                                bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], MasterRow["StorageCode"], DetailRow["PlaceCode"], ListRow["ListNo"]);
                                if (!isHasListNo)
                                {
                                    xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] �����ڲֿ���({2}),��λ({3})��", ListRow["ProductCode"], ListRow["ListNo"], MasterRow["StorageCode"], DetailRow["PlaceCode"]));
                                }
                            }  
                        }
                        #endregion
                    }
                    #endregion

                    #region ���¿������
                    FStorageManager.UpdateStorage3(isCheck, true, HYStorageManager._Check, HYStorageManager._CheckName,
                          MasterRow, DetailTable, ListTable);
                    #endregion
                }
            }
        }

        protected override void updateBefore(xzSqlDataRelating SqlData, xzSourceExerciseEventArgs e, DataTable MasterTable,
            xzSqlDataParam[] ParamArg, SqlCommand cmd)
        {
            switch (e.SourceInsert)
            {
                case xzSourceExerciseDeal.Change:
                    #region ִ�и��Ĳ���ʱ

                    #region �������ǰ�����ĺ������
                    DataRow MasterRow = MasterTable.Rows[0];
                    DataTable ListTable = null, DetailTable = null;
                    foreach (xzSqlDataParam ParamItem in ParamArg)
                    {
                        if (ParamItem.Table.TableName == "tbStorCheckItem")
                            DetailTable = ParamItem.Table.Copy();
                        if (ParamItem.Table.TableName == "tbStorCheckItemDetail")
                            ListTable = ParamItem.Table.Copy();
                    }

                    DataTable HistoryListTable = null, HistoryDetailTable = null;
                    DataRow HistoryMasterRow = null;
                    if (e.HistoryDataSet != null)
                    {
                        HistoryListTable = e.HistoryDataSet.Tables["tbStorCheckItemDetail"];
                        HistoryDetailTable = e.HistoryDataSet.Tables["tbStorCheckItem"];
                        HistoryMasterRow = e.HistoryDataSet.Tables["tbStorCheck"].Rows[0];
                    }
                    #endregion

                    #region ��ת��Ϣ

                    SvrGoubleParam FSvrGoubleParam = new SvrGoubleParam();
                    FSvrGoubleParam.Command = cmd;
                    DateTime ReckonTime = FSvrGoubleParam.getReckonTime();

                    string ModuleSort = HYStorageManager._Check;
                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;
                    foreach (DataRow ListRow in ListTable.Rows)
                        FStorageManager.UpdateListInfo(ReckonTime, MasterRow, ListRow, ModuleSort, false);
                    foreach (DataRow DetialRow in DetailTable.Rows)
                    {
                        if (Convert.ToInt32(DetialRow["isListNo"]) == 0)
                            FStorageManager.UpdateProductInfo(ReckonTime, MasterRow, DetialRow, ModuleSort, false);
                    }
                    #endregion

                    #endregion
                    break;
                case xzSourceExerciseDeal.Copy:
                case xzSourceExerciseDeal.Noraml:
                    break;
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
                        HYStorageMessage.HintChange(command, "tbStorCheck", ht[0]);
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
    /// ά�޼ĳ�
    /// </summary>
    public class SvrStorMaintainPostSelf : SvrSystemDB, IServerSkedUserExecEx
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
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate, SupplyerType, SupplyerCode 
                           from tbStorMaintainPostSelf where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbStorMaintainPostSelf";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    DataTable DetailTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbStorMaintainPostSelfItem where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(DetailTable);
                    DetailTable.TableName = "tbStorMaintainPostSelfItem";
                    #endregion

                    bool isStorageIn = !isCheck;

                    #region �ж�
                    foreach (DataRow DetailRow in DetailTable.Rows)
                    {
                        #region ����Ƿ��㹻(����)
                        if (!isStorageIn && !FStorageManager.StorageIsEnough(DetailRow["ProductSortCode"], DetailRow["ProductCode"],
                            DetailRow["StorageCode"], DetailRow["PlaceCode"], DetailRow["Number"]))
                            xzException.WarnBox(HYStorageMessage._MsgStorageIsEnough);
                        #endregion

                        #region ά�޼ĳ�����
                        if (DetailRow["IsVerify"] != DBNull.Value && Convert.ToInt32(DetailRow["IsVerify"]) > 0)
                            xzException.WarnBox(HYStorageMessage._MsgHasVerify);
                        #endregion

                        #region �����Ƿ��ڿ���д���
                        bool isHasListNo = FStorageManager.StorageHasListNo(DetailRow["ProductSortCode"], DetailRow["ProductCode"],
                            DetailRow["StorageCode"], DetailRow["PlaceCode"], DetailRow["ListNo"]);

                        //����Ƿ����ظ�����(���)
                        if (isStorageIn && isHasListNo)
                            xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] ���ݿ����Ѿ����ڣ�", DetailRow["ProductCode"], DetailRow["ListNo"]));

                        //����Ƿ�����Ӧ����(����)
                        if (!isStorageIn && !isHasListNo)
                            xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] ���ݿ��в����ڣ�", DetailRow["ProductCode"], DetailRow["ListNo"]));
                        #endregion
                    }
                    #endregion

                    #region ���¿������
                    FStorageManager.UpdateStorage2(isCheck, isStorageIn, HYStorageManager._MaintainPostSelf, HYStorageManager._MaintainPostSelfName,
                          MasterRow, DetailTable);
                    #endregion
                }
            }
        }

        protected override void updateBefore(xzSqlDataRelating SqlData, xzSourceExerciseEventArgs e, DataTable MasterTable,
            xzSqlDataParam[] ParamArg, SqlCommand cmd)
        {
            switch (e.SourceInsert)
            {
                case xzSourceExerciseDeal.Change:
                    #region ִ�и��Ĳ���ʱ

                    #region �������ǰ�����ĺ������
                    DataRow MasterRow = MasterTable.Rows[0];
                    DataTable DetailTable = null;
                    foreach (xzSqlDataParam ParamItem in ParamArg)
                    {
                        if (ParamItem.Table.TableName == "tbStorMaintainPostSelfItem")
                            DetailTable = ParamItem.Table.Copy();
                    }

                    DataTable HistoryDetailTable = null;
                    DataRow HistoryMasterRow = null;
                    if (e.HistoryDataSet != null)
                    {
                        HistoryDetailTable = e.HistoryDataSet.Tables["tbStorMaintainPostSelfItem"];
                        HistoryMasterRow = e.HistoryDataSet.Tables["tbStorMaintainPostSelf"].Rows[0];
                    }
                    #endregion

                    #region ��ת��Ϣ

                    SvrGoubleParam FSvrGoubleParam = new SvrGoubleParam();
                    FSvrGoubleParam.Command = cmd;
                    DateTime ReckonTime = FSvrGoubleParam.getReckonTime();

                    string ModuleSort = HYStorageManager._MaintainPostSelf;
                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;
                    foreach (DataRow DetialRow in DetailTable.Rows)
                    {
                        if (Convert.ToInt32(DetialRow["isListNo"]) == 0)
                            FStorageManager.UpdateProductInfo(ReckonTime, MasterRow, DetialRow, ModuleSort, false);
                        else FStorageManager.UpdateListInfo(ReckonTime, MasterRow, DetialRow, ModuleSort, false);
                    }

                    #endregion

                    #endregion
                    break;
                case xzSourceExerciseDeal.Copy:
                case xzSourceExerciseDeal.Noraml:
                    break;
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
                        HYStorageMessage.HintChange(command, "tbStorMaintainPostSelf", ht[0]);
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
    /// ���۳���
    /// </summary>
    public class SvrSaleOut : SvrSystemDB, IServerSkedUserExecEx
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

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;
                    HYVoucherManager FVoucherManager = new HYVoucherManager();
                    FVoucherManager.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse,FlowBit,UseState,AssistantCode,SrcBillSort, ClientCode,ClientType,TheDate
                             from tbSaleOut where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbSaleOut";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    DataTable DetailTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbSaleOutItem where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(DetailTable);
                    DetailTable.TableName = "tbSaleOutItem";

                    DataTable ListTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbSaleOutItemDetail where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(ListTable);
                    ListTable.TableName = "tbSaleOutItemDetail";
                    #endregion

                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    bool isStorageIn = (!isRadBill && !isCheck) || (isRadBill && isCheck);

                    string SaleModeCode = MasterRow["AssistantCode"].ToString();
                    int SrcBillSort = (int)MasterRow["SrcBillSort"];

                    #region �ж�
                    foreach (DataRow DetailRow in DetailTable.Rows)
                    {
                        #region ����Ƿ��㹻(����)
                        if (!isStorageIn && !FStorageManager.StorageIsEnough(DetailRow["ProductSortCode"], DetailRow["ProductCode"],
                            DetailRow["StorageCode"], DetailRow["PlaceCode"], DetailRow["Number"])) 
                            xzException.WarnBox(HYStorageMessage._MsgStorageIsEnough);
                        #endregion

                        #region �����ж�
                        if (xzSqlAnalysis.getAbsValue(DetailRow["VerifyTotalAmount"]) != 0)
                            xzException.WarnBox("���۳��⼺���뷢Ʊ���й������޷�ִ�е�ǰ�Ĳ�����");
                        #endregion

                        #region �򵥵Ĳ�ͬ��;��������ص��ж�
                        switch (SaleModeCode)
                        {
                            case "WTDXCSH":
                            #region ί�д�����ʼ��
                            #endregion
                            default:
                                #region ƾ֤���ж�
                                switch (SrcBillSort)
                                {
                                    case 1:
                                        FVoucherManager.isUpdateSaleOrder(isStorageIn, DetailRow);
                                        break;
                                    case 2:
                                        if (!FVoucherManager.isUpdateSaleInvoice(isStorageIn, DetailRow))
                                            xzException.WarnBox(HYStorageMessage._MsgSourceBillIsEnough);
                                        break;
                                    case 3:
                                        if (!FVoucherManager.isUpdateProductReturn(isStorageIn, DetailRow))
                                            xzException.WarnBox(HYStorageMessage._MsgSourceBillIsEnough);
                                        break;
                                }
                                break;
                                #endregion
                        }

                        #endregion

                        DataRow[] ListRows = ListTable.Select(string.Format("BillNo = '{0}' and RowNo = {1}", DetailRow["BillNo"], DetailRow["RowNo"]));
                        foreach (DataRow ListRow in ListRows)
                        {
                            #region �����Ƿ��ڿ���д���
                            //bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], ListRow["ListNo"]);
                            
                            #region �����ж�
                            if (xzSqlAnalysis.getAbsValue(ListRow["IsVerify"]) != 0)
                                xzException.WarnBox("���۳��⼺�����ƶ���ִ�����й������޷�ִ�е�ǰ�Ĳ�����");
                            #endregion

                            //����Ƿ����ظ�����(���)
                            if (isStorageIn)
                            {
                                bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], ListRow["ListNo"]);
                                if (isHasListNo)
                                {
                                    xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] ���ݿ����Ѿ����ڣ�", ListRow["ProductCode"], ListRow["ListNo"]));
                                }
                            }
                            //����Ƿ�����Ӧ����(����)
                            if (!isStorageIn)
                            {
                                bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], DetailRow["StorageCode"], DetailRow["PlaceCode"],ListRow["ListNo"]);
                                if (!isHasListNo)
                                {
                                    xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] �����ڲֿ���({2}),��λ({3})��", ListRow["ProductCode"], ListRow["ListNo"], DetailRow["StorageCode"], DetailRow["PlaceCode"]));
                                }
                            }  
                            #endregion
                        }
                    }
                    #endregion

                    #region ����ƾ֤�Ĵ���
                    switch (SaleModeCode)
                    {
                        case "WTDXCSH":
                        #region ί�д�����ʼ��
                        #endregion
                        default:
                            #region ƾ֤���ж�
                            switch (SrcBillSort)
                            {
                                case 1:
                                    FVoucherManager.UpdateSaleOrder(!isStorageIn, DetailTable);
                                    break;
                                case 2:
                                    FVoucherManager.UpdateSaleInvoice(!isStorageIn, DetailTable);
                                    break;
                                case 3:
                                    FVoucherManager.UpdateProductReturn(!isStorageIn, DetailTable);
                                    break;
                            }
                            break;
                            #endregion
                    }

                    #endregion

                    #region ���¿������
                    if (isRadBill)
                    {
                        FStorageManager.UpdateStorage3(isCheck, isStorageIn, HYStorageManager._SaleOutRed, HYStorageManager._SaleOutRedName,
                              MasterRow, DetailTable, ListTable);
                    }
                    else
                    {
                        FStorageManager.UpdateStorage3(isCheck, isStorageIn, HYStorageManager._SaleOut, HYStorageManager._SaleOutName
                            , MasterRow, DetailTable, ListTable);
                    }
                    #endregion
                }
            }
        }

        protected override void updateBefore(xzSqlDataRelating SqlData, xzSourceExerciseEventArgs e, DataTable MasterTable,
            xzSqlDataParam[] ParamArg, SqlCommand cmd)
        {
            switch (e.SourceInsert)
            {
                case xzSourceExerciseDeal.Change:
                    #region ִ�и��Ĳ���ʱ

                    #region �������ǰ�����ĺ������
                    DataRow MasterRow = MasterTable.Rows[0];
                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);                                  
                    DataTable ListTable = null, DetailTable = null;
                    foreach (xzSqlDataParam ParamItem in ParamArg)
                    {
                        if (ParamItem.Table.TableName == "tbSaleOutItem")
                            DetailTable = ParamItem.Table.Copy();
                        if (ParamItem.Table.TableName == "tbSaleOutItemDetail")
                            ListTable = ParamItem.Table.Copy();
                    }

                    DataTable HistoryListTable = null, HistoryDetailTable = null;
                    DataRow HistoryMasterRow = null;
                    if (e.HistoryDataSet != null)
                    {
                        HistoryListTable = e.HistoryDataSet.Tables["tbSaleOutItemDetail"];
                        HistoryDetailTable = e.HistoryDataSet.Tables["tbSaleOutItem"];
                        HistoryMasterRow = e.HistoryDataSet.Tables["tbSaleOut"].Rows[0];
                    }
                    #endregion

                    #region ����������Ϣ                   
                    SvrGoubleParam FSvrGoubleParam = new SvrGoubleParam();
                    FSvrGoubleParam.Command = cmd;
                    DateTime ReckonTime = FSvrGoubleParam.getReckonTime();

                    string ModuleSort = HYStorageManager._SaleOut;
                    if (isRadBill) ModuleSort = HYStorageManager._SaleOutRed;

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;
                    foreach (DataRow ListRow in ListTable.Rows)
                        FStorageManager.UpdateListInfo(ReckonTime, MasterRow, ListRow, ModuleSort, false);
                    foreach (DataRow DetialRow in DetailTable.Rows)
                    {
                        if (Convert.ToInt32(DetialRow["isListNo"]) == 0)
                            FStorageManager.UpdateProductInfo(ReckonTime, MasterRow, DetialRow, ModuleSort, false);
                    }
                    #endregion

                    #endregion
                    break;
                case xzSourceExerciseDeal.Copy:
                case xzSourceExerciseDeal.Noraml:
                    break;
            }
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            Hashtable haReturn = new Hashtable();
            HYStorageManager FStorageManager;
            HYSalePriceManager FSalePriceManager;

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
                        HYStorageMessage.HintChange(command, "tbSaleOut", ht[0]);
                        #endregion
                        break;
                    case 2:
                        #region �����Ƿ���������
                        string StrSql = @"select top 1 a.SupplyerType, a.SupplyerCode,a.InDate, a.BillNo, a.RowNo
                         from tbSaleOutItemDetail a
                         Left Outer Join tbSaleOut b on a.BillNo = b.BillNo
                         where dbo.GetByteToBoolean(b.TheState,0x0001)=1 and dbo.GetByteToBoolean(b.UseState,0x0001)=0
                             and a.ProductSortCode = '{0}' and ProductCode = '{1}' and  a.ListNo = '{2}'
                         order by b.TheDate desc";

                        command.CommandText = string.Format(StrSql, ht[0], ht[1], ht[2]);
                        using (SqlDataReader Reader = command.ExecuteReader())
                        {
                            if (Reader.Read())
                            {
                                haReturn.Add(0, true);
                                haReturn.Add(1, Reader["SupplyerType"].ToString());
                                haReturn.Add(2, Reader["SupplyerCode"].ToString());
                                haReturn.Add(3, Reader["InDate"].ToString());
                                haReturn.Add(4, Reader["BillNo"].ToString());
                                haReturn.Add(5, Reader["RowNo"].ToString());
                            }
                            else haReturn.Add(0, false);
                            Reader.Close();
                        }
                        #endregion
                        break;
                    case 3:
                        #region ��ȡ�쵥����Ϣ
                        DataTable MasterTable = new DataTable();
                        DataTable DetailTable = new DataTable();
                        using (SqlDataAdapter sqlda = new SqlDataAdapter())
                        {
                            sqlda.SelectCommand = command;
                            switch (ht[0].ToString())
                            {
                                case "1":
                                    #region ���۶���
                                    string sqlStr = @"select a.ClientCode,a.ClientType,a.SaleModeCode,a.AssistantCode,a.DeliveryModeCode,
                                                a.DeliveryPlace,a.DeptCode,a.DirectorCode,a.OperaterCode,a.ConsignerCode,
                                                a.VerifyCode,a.SrcBillSort,a.SaleMoney,a.TotalMoney,a.Remark,a.BillSort,
                                                --a.IsUse,a.TheState,a.Creater,a.CreateTime,a.Stater,a.StateTime,a.Editer,a.EditeTime,
                                                --a.UseState,a.FlowBit,a.FlowChart,j.TheName CreaterName,
                                                b.TheName ClientName,c.TheName SaleModeName,d.TheName DeliveryModeName,
                                                e.TheName DeptName,f.TheName DirectorName,g.TheName OperaterName,h.TheName ConsignerName,
                                                i.TheName VerifyName
                                            from tbSaleOut a
                                                left outer join (Select TheCode,TheName,SpellHelp,CopartnerSort from vDatumAllCustomer 
                                                                 Union all 
                                                                 Select TheCode,TheName,SpellHelp, null CopartnerSort from tbDatumScatBuyer)
                                                      b on a.ClientCode=b.TheCode
                                                left outer join vSaleMode c on a.SaleModeCode=c.TheCode
                                                left outer join vSaleDeliveryMode d on a.DeliveryModeCode=d.TheCode 
                                                Left outer join tbDatumDept e on a.DeptCode=e.TheCode 
                                                left outer join tbDatumEmployee f on a.DirectorCode=f.TheCode 
                                                left outer join tbDatumEmployee g on a.OperaterCode=g.TheCode 
                                                left outer join tbDatumEmployee h on a.ConsignerCode=h.TheCode 
                                                left outer join tbDatumEmployee i on a.VerifyCode=i.TheCode 
                                                left outer join tbDatumEmployee j on a.Creater=j.TheCode 
                                           where a.BillNo = '{0}'";
                                    command.CommandText = string.Format(sqlStr, ht[1]);
                                    command.ExecuteNonQuery();
                                    sqlda.Fill(MasterTable);
                                    haReturn.Add(0, MasterTable);
                                    
                                    sqlStr = @"select a.SrcBillNo,f.OppositeCode,f.OppositeName,f.OppositeConfig,
                                                    a.ProductSortCode,b.ProductSortName,a.ProductCode,b.TheName ProductName,b.ConfigName,b.UnitName,
                                                    a.IsListNo,a.ShouldNum,
                                                    (select Number - OutStoreNumber from tbSaleOrderItem where BillNo = a.SrcBillNo
                                                        and ProductSortCode = a.ProductSortCode and ProductCode = a.ProductCode) NotOutNum,
                                                    --a.InCostPrice,a.SumMoney,
                                                    a.SalePrice,a.TaxPrice,a.AgioRate,a.AgioMoney,a.FactPrice,a.FactTaxPrice,a.SaleMoney,
                                                    a.TaxRate,a.TaxMoney, a.TotalMoney, a.StorageCode,a.PlaceCode,c.TheName StorageName,
                                                    d.StorPlaceName PlaceName,a.Remark
                                                  from tbSaleOutItem a left outer join tbSaleOut e on a.BillNo=e.BillNo
                                                    left outer join vDatumProduct b on a.ProductCode=b.TheCode and a.ProductSortCode=b.ProductSort 
                                                    Left outer join tbDatumStorage  c on a.StorageCode=c.TheCode 
                                                    Left outer join tbDatumStorageItem d on a.StorageCode=d.StorageCode and a.PlaceCode=d.StorPlaceCode 
                                                    left outer join vDatumClientOpposite f on e.ClientCode=f.ClientCode and a.ProductCode=f.ProductCode
                                                         and a.ProductSortCode=f.ProductSort
                                                  where a.BillNo = '{0}' and a.RowNo = {1}";
                                    command.CommandText = string.Format(sqlStr, ht[1], ht[2]);
                                    command.ExecuteNonQuery();
                                    sqlda.Fill(DetailTable);
                                    haReturn.Add(1, DetailTable);
                                    #endregion
                                    break;
                            }
                        }
                        #endregion
                        break;
                    case 5:
                        #region ��ȡ������
                        FSalePriceManager = new HYSalePriceManager();
                        FSalePriceManager.Command = command;
                        haReturn.Add(0, FSalePriceManager.getSalePrice(ht[0], ht[1], ht[2], ht[3], ht[4], ht[5], ht[6]));
                        #endregion
                        break;
                    case 7:
                        #region ��ȡ�ۼ۴���ʽ
                        FSalePriceManager = new HYSalePriceManager();
                        FSalePriceManager.Command = command;
                        Hashtable htParam = FSalePriceManager.getPriceParam();
                        if (htParam != null) haReturn.Add(0, htParam);
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

    ///<summary>
    /// �������ⵥ
    ///</summary>
    public class SvrStorOtherOut : SvrSystemDB, IServerSkedUserExecEx
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

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;
                    HYVoucherManager FVoucherManager = new HYVoucherManager();
                    FVoucherManager.Command = cmd;

                    #region ��ʼ������
                    cmd.CommandText = string.Format(@"select IsUse,FlowBit,UseState, SrcBillSort, ClientCode, ClientType, TheDate
                             from tbStorOtherOut where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbStorOtherOut";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    DataTable DetailTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbStorOtherOutItem where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(DetailTable);
                    DetailTable.TableName = "tbStorOtherOutItem";

                    DataTable ListTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbStorOtherOutItemDetail where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(ListTable);
                    ListTable.TableName = "tbStorOtherOutItemDetail";
                    #endregion

                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    bool isStorageIn = (!isRadBill && !isCheck) || (isRadBill && isCheck);

                    int SrcBillSort = (int)MasterRow["SrcBillSort"];
                    #region �ж�
                    foreach (DataRow DetailRow in DetailTable.Rows)
                    {
                        #region ����Ƿ��㹻(����)
                        if (!isStorageIn && !FStorageManager.StorageIsEnough(DetailRow["ProductSortCode"], DetailRow["ProductCode"],
                            DetailRow["StorageCode"], DetailRow["PlaceCode"], DetailRow["Number"])) 
                            xzException.WarnBox(HYStorageMessage._MsgStorageIsEnough);
                        #endregion

                        #region �򵥵Ĳ�ͬ��;��������ص��ж�

                        #region ƾ֤���ж�
                        switch (SrcBillSort)
                        {
                            case 1:
                                FVoucherManager.isUpdateSaleOrder(isStorageIn, DetailRow);
                                break;
                            case 2:
                                if (!FVoucherManager.isUpdateSaleInvoice(isStorageIn, DetailRow))
                                    xzException.WarnBox(HYStorageMessage._MsgSourceBillIsEnough);
                                break;
                        }
                        #endregion

                        #endregion
                        DataRow[] ListRows = ListTable.Select(string.Format("BillNo = '{0}' and RowNo = {1}", DetailRow["BillNo"], DetailRow["RowNo"]));
                        foreach (DataRow ListRow in ListRows)
                        {
                            #region �����Ƿ��ڿ���д���
                            //bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], ListRow["ListNo"]);

                            //����Ƿ����ظ�����(���)
                            if (isStorageIn)
                            {
                                bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], ListRow["ListNo"]);
                                if (isHasListNo)
                                {
                                    xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] ���ݿ����Ѿ����ڣ�", ListRow["ProductCode"], ListRow["ListNo"]));
                                }
                            }
                            //����Ƿ�����Ӧ����(����)
                            if (!isStorageIn)
                            {
                                bool isHasListNo = FStorageManager.StorageHasListNo(ListRow["ProductSortCode"], ListRow["ProductCode"], DetailRow["StorageCode"], DetailRow["PlaceCode"], ListRow["ListNo"]);
                                if (!isHasListNo)
                                {
                                    xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] �����ڲֿ���({2}),��λ({3})��", ListRow["ProductCode"], ListRow["ListNo"], DetailRow["StorageCode"], DetailRow["PlaceCode"]));
                                }
                            }
                            #endregion
                        }
                    }
                    #endregion

                    #region ����ƾ֤�Ĵ���
                    switch (SrcBillSort)
                    {
                        case 1:
                            FVoucherManager.UpdateSaleOrder(!isStorageIn, DetailTable);
                            break;
                        case 2:
                            FVoucherManager.UpdateSaleInvoice(!isStorageIn, DetailTable);
                            break;
                        case 3:
                            FVoucherManager.UpdateProductReturn(!isStorageIn, DetailTable);
                            break;
                    }
                    #endregion

                    #region ���¿������
                    if (isRadBill)
                    {
                        FStorageManager.UpdateStorage3(isCheck, isStorageIn, HYStorageManager._OtherOutRed, HYStorageManager._OtherOutRedName,
                              MasterRow, DetailTable, ListTable);
                    }
                    else
                    {
                        FStorageManager.UpdateStorage3(isCheck, isStorageIn, HYStorageManager._OtherOut, HYStorageManager._OtherOutName
                            , MasterRow, DetailTable, ListTable);
                    }
                    #endregion
                }
            }
        }

        protected override void updateBefore(xzSqlDataRelating SqlData, xzSourceExerciseEventArgs e, DataTable MasterTable,
            xzSqlDataParam[] ParamArg, SqlCommand cmd)
        {
            switch (e.SourceInsert)
            {
                case xzSourceExerciseDeal.Change:
                    #region ִ�и��Ĳ���ʱ

                    #region �������ǰ�����ĺ������
                    DataRow MasterRow = MasterTable.Rows[0];
                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    DataTable ListTable = null, DetailTable = null;
                    foreach (xzSqlDataParam ParamItem in ParamArg)
                    {
                        if (ParamItem.Table.TableName == "tbStorOtherOutItem")
                            DetailTable = ParamItem.Table.Copy();
                        if (ParamItem.Table.TableName == "tbStorOtherOutItemDetail")
                            ListTable = ParamItem.Table.Copy();
                    }

                    DataTable HistoryListTable = null, HistoryDetailTable = null;
                    DataRow HistoryMasterRow = null;
                    if (e.HistoryDataSet != null)
                    {
                        HistoryListTable = e.HistoryDataSet.Tables["tbStorOtherOutItemDetail"];
                        HistoryDetailTable = e.HistoryDataSet.Tables["tbStorOtherOutItem"];
                        HistoryMasterRow = e.HistoryDataSet.Tables["tbStorOtherOut"].Rows[0];
                    }
                    #endregion

                    #region ����������Ϣ
                    SvrGoubleParam FSvrGoubleParam = new SvrGoubleParam();
                    FSvrGoubleParam.Command = cmd;
                    DateTime ReckonTime = FSvrGoubleParam.getReckonTime();

                    string ModuleSort = HYStorageManager._OtherOut;
                    if (isRadBill) ModuleSort = HYStorageManager._OtherOutRed;

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;
                    foreach (DataRow ListRow in ListTable.Rows)
                        FStorageManager.UpdateListInfo(ReckonTime, MasterRow, ListRow, ModuleSort, false);
                    foreach (DataRow DetialRow in DetailTable.Rows)
                    {
                        if (Convert.ToInt32(DetialRow["isListNo"]) == 0)
                            FStorageManager.UpdateProductInfo(ReckonTime, MasterRow, DetialRow, ModuleSort, false);
                    }
                    #endregion

                    #endregion
                    break;
                case xzSourceExerciseDeal.Copy:
                case xzSourceExerciseDeal.Noraml:
                    break;
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
                        HYStorageMessage.HintChange(command, "tbStorOtherOut", ht[0]);
                        #endregion
                        break;
                    case 2:
                        #region �����Ƿ����쿪����
                        string StrSql = @"select top 1 a.SupplyerType, a.SupplyerCode,a.InDate
                         from tbStorOtherOutItemDetail a
                         Left Outer Join tbStorOtherOut b on a.BillNo = b.BillNo
                         where dbo.GetByteToBoolean(b.TheState,0x0001)=1
                             and a.ProductSortCode = '{0}' and ProductCode = '{1}' and  a.ListNo = '{2}'
                         order by b.TheDate desc";

                        command.CommandText = string.Format(StrSql, ht[0], ht[1], ht[2]);
                        using (SqlDataReader Reader = command.ExecuteReader())
                        {
                            if (Reader.Read())
                            {
                                haReturn.Add(0, true);
                                haReturn.Add(1, Reader["SupplyerType"].ToString());
                                haReturn.Add(2, Reader["SupplyerCode"].ToString());
                                haReturn.Add(3, Reader["InDate"].ToString());
                            }
                            else haReturn.Add(0, false);
                            Reader.Close();
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

    ///<summary>
    ///�ŵ꿪��
    ///</summary>
    public class SvrSelfSaleOut : SvrSystemDB, IServerSkedUserExecEx
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
                           from tbSelfSaleOut where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbSelfSaleOut";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    DataTable DetailTable = new DataTable();
                    cmd.CommandText = string.Format("select * from tbSelfSaleOutItem where BillNo = '{0}'", Row["BillNo"]);
                    sqlda.Fill(DetailTable);
                    DetailTable.TableName = "tbSelfSaleOutItem";
                    #endregion

                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    bool isStorageIn = (!isRadBill && !isCheck) || (isRadBill && isCheck);

                    #region �ж�
                    foreach (DataRow DetailRow in DetailTable.Rows)
                    {
                        if (Convert.ToInt32(DetailRow["isListNo"]) == 1)
                        {
                            #region �����Ƿ��ڿ���д���
                            //����Ƿ����ظ�����(���)
                            if (isStorageIn)
                            {
                                bool isHasListNo = FStorageManager.StorageHasListNo(DetailRow["ProductSortCode"], DetailRow["ProductCode"], DetailRow["ListNo"]);
                                if (isHasListNo)
                                {
                                    xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] ���ݿ����Ѿ����ڣ�", DetailRow["ProductCode"], DetailRow["ListNo"]));
                                }
                            }
                            //����Ƿ�����Ӧ����(����)
                            if (!isStorageIn)
                            {
                                bool isHasListNo = FStorageManager.StorageHasListNo(DetailRow["ProductSortCode"], DetailRow["ProductCode"], DetailRow["StorageCode"], DetailRow["PlaceCode"], DetailRow["ListNo"]);
                                if (!isHasListNo)
                                {
                                    xzException.WarnBox(string.Format("��Ʒ���[{0}],����[{1}] �����ڲֿ���({2}),��λ({3})��", DetailRow["ProductCode"], DetailRow["ListNo"], DetailRow["StorageCode"], DetailRow["PlaceCode"]));
                                }
                            }
                            #endregion
                        }
                        else
                        {
                            #region ����Ƿ��㹻(����)
                            if (!isStorageIn && !FStorageManager.StorageIsEnough(DetailRow["ProductSortCode"], DetailRow["ProductCode"],
                                DetailRow["StorageCode"], DetailRow["PlaceCode"], DetailRow["Number"]))
                                xzException.WarnBox(HYStorageMessage._MsgStorageIsEnough);
                            #endregion
                        }
                    }
                    #endregion

                    #region ���¿������
                    if (!isRadBill)
                    {
                        FStorageManager.UpdateStorage2(isCheck, isStorageIn, HYStorageManager._SelfSaleOut, HYStorageManager._SelfSaleOutName,
                              MasterRow, DetailTable);
                    }
                    else
                    {
                        FStorageManager.UpdateStorage2(isCheck, isStorageIn, HYStorageManager._SelfSaleOutRed, HYStorageManager._SelfSaleOutRedName,
                              MasterRow, DetailTable);
                    }
                    #endregion
                }
            }
        }

        protected override void updateBefore(xzSqlDataRelating SqlData, xzSourceExerciseEventArgs e, DataTable MasterTable,
            xzSqlDataParam[] ParamArg, SqlCommand cmd)
        {
            switch (e.SourceInsert)
            {
                case xzSourceExerciseDeal.Change:
                    #region ִ�и��Ĳ���ʱ

                    #region �������ǰ�����ĺ������
                    DataRow MasterRow = MasterTable.Rows[0];
                    bool isRadBill = BitTermMath.GetBitTrue((int)MasterRow["UseState"], BitTermMath.TermOne);
                    DataTable DetailTable = null;
                    foreach (xzSqlDataParam ParamItem in ParamArg)
                    {
                        if (ParamItem.Table.TableName == "tbSelfSaleOutItem")
                            DetailTable = ParamItem.Table.Copy();
                    }

                    DataTable HistoryDetailTable = null;
                    DataRow HistoryMasterRow = null;
                    if (e.HistoryDataSet != null)
                    {
                        HistoryDetailTable = e.HistoryDataSet.Tables["tbSelfSaleOutItem"];
                        HistoryMasterRow = e.HistoryDataSet.Tables["tbSelfSaleOut"].Rows[0];
                    }
                    #endregion

                    #region ��ת��Ϣ

                    SvrGoubleParam FSvrGoubleParam = new SvrGoubleParam();
                    FSvrGoubleParam.Command = cmd;
                    DateTime ReckonTime = FSvrGoubleParam.getReckonTime();

                    string ModuleSort = HYStorageManager._SelfSaleOut;
                    if (isRadBill) ModuleSort = HYStorageManager._SelfSaleOutRed;

                    HYStorageManager FStorageManager = new HYStorageManager();
                    FStorageManager.Command = cmd;
                    foreach (DataRow DetialRow in DetailTable.Rows)
                    {
                        if (Convert.ToInt32(DetialRow["isListNo"]) == 0)
                            FStorageManager.UpdateProductInfo(ReckonTime, MasterRow, DetialRow, ModuleSort, false);
                        else FStorageManager.UpdateListInfo(ReckonTime, MasterRow, DetialRow, ModuleSort, false);
                    }

                    #endregion

                    #endregion
                    break;
                case xzSourceExerciseDeal.Copy:
                case xzSourceExerciseDeal.Noraml:
                    break;
            }
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            Hashtable haReturn = new Hashtable();
            HYStorageManager FStorageManager;
            HYSalePriceManager FSalePriceManager;

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
                        HYStorageMessage.HintChange(command, "tbSelfSaleOut", ht[0]);
                        #endregion
                        break;
                    case 2:
                        #region �����Ƿ���������
                        string StrSql = @"select top 1 a.BillNo
                         from tbSelfSaleOutItem a
                         Left Outer Join tbSelfSaleOut b on a.BillNo = b.BillNo
                         where dbo.GetByteToBoolean(b.TheState,0x0001)=1 and dbo.GetByteToBoolean(b.UseState,0x0001)=0
                             and a.ProductSortCode = '{0}' and ProductCode = '{1}' and  a.ListNo = '{2}'
                         order by b.TheDate desc";

                        command.CommandText = string.Format(StrSql, ht[0], ht[1], ht[2]);
                        using (SqlDataReader Reader = command.ExecuteReader())
                        {
                            if (Reader.Read())
                            {
                                haReturn.Add(0, true);
                                haReturn.Add(1, Reader["BillNo"].ToString());
                            }
                            else haReturn.Add(0, false);
                            Reader.Close();
                        }
                        #endregion
                        break;
                    case 3:
                        #region ��ȡ���Ŷ�Ӧ��������Ϣ
                        DataTable MasterTable = new DataTable();
                        DataTable DetailTable = new DataTable();
                        DataTable PromotionTable = new DataTable();
                        using (SqlDataAdapter sqlda = new SqlDataAdapter())
                        {
                            sqlda.SelectCommand = command;

                            string sqlStr = @"select --a.TheDate, a.ShopCode,a.AreaCode,a.ShopSort, d.TheName ShopName,a.CashMoney,a.TotalMoney, a.Customer,a.Phone,a.Address,a.InvoiceMoney,a.InvoiceNo,a.VirementMoney,a.PayCardMoney,GiftMoney,OtherMoney,
                                              a.ClientCode,a.ClientType,
                                               a.PayeeCode,a.OperaterCode,a.DirectorCode,
                                              a.ShopmanCode,f.TheName PayeeName,g.TheName OperaterName,
                                              h.TheName DirectorName, i.TheName ShopmanName,j.TheName ClassName,k.TheName ClientName
                                            from tbSelfSaleOut a 
                                                --Left Outer Join  vDatumShopArea d on a.ShopCode = d.TheCode
                                                left outer join tbDatumEmployee f on a.PayeeCode=f.TheCode 
                                                left outer join tbDatumEmployee g on a.OperaterCode=g.TheCode 
                                                left outer join tbDatumEmployee h on a.DirectorCode=h.TheCode 
                                                left outer join tbDatumEmployee i on a.ShopmanCode=i.TheCode 
                                                left outer join vSelfClass j on a.ClassCode=j.TheCode 
                                                left outer join vDatumAllCustomer k on a.ClientCode=k.TheCode and a.ClientType=k.CopartnerSort
                                            where a.BillNo = '{0}'";
                            command.CommandText = string.Format(sqlStr, ht[1]);
                            command.ExecuteNonQuery();
                            sqlda.Fill(MasterTable);
                            haReturn.Add(0, MasterTable);

                            sqlStr = @"select a.ListNo,a.ProductCode,a.ProductSortCode,a.Number,a.InCostPrice,a.SumMoney,
                                         a.SalePrice,a.TaxPrice,a.AgioRate,a.AgioMoney,a.FactPrice,
                                         a.FactTaxPrice,a.SaleMoney,a.ShopManMoney,a.PreferentialMoney,a.FactMoney,a.TaxRate,a.TaxMoney,a.TotalMoney,
                                         a.Remark,a.IsListNo,a.SupplyerType,a.SupplyerCode,a.InDate,
                                         b.TheName ProductName,b.ConfigName,b.UnitName
                                         --,c.TheName StorageName,d.StorPlaceName PlaceName 
                                       from tbSelfSaleOutItem a 
                                            left outer join vDatumProduct b on a.ProductCode=b.TheCode and a.ProductSortCode=b.ProductSort
                                            --left outer join tbDatumStorage c on c.TheCode=a.StorageCode
                                            --left outer join tbDatumStorageItem d on d.StorageCode=a.StorageCode and d.StorPlaceCode=a.PlaceCode
                                       where a.BillNo = '{0}'";
                            command.CommandText = string.Format(sqlStr, ht[1]);
                            command.ExecuteNonQuery();
                            sqlda.Fill(DetailTable);
                            haReturn.Add(1, DetailTable);

                            sqlStr = @"select a.PromotionSort, a.PromotionCode, b.TheName PromotionName, a.PromotionMoney ,a.TheCode, a.Remark 
                                       from tbSelfSaleOutPromotion a left outer join tbDatumMemberSort b on a.PromotionCode=b.TheCode 
                                       where a.BillNo = '{0}'";
                            command.CommandText = string.Format(sqlStr, ht[1]);
                            command.ExecuteNonQuery();
                            sqlda.Fill(PromotionTable);
                            haReturn.Add(2, PromotionTable);
                        }
                        #endregion
                        break;
                    case 4:
                        #region �жϵ����Ƿ񼺾���Ʊ
                        command.CommandText = string.Format(@"update tbSelfSaleOut set UseState = dbo.SetByteToBoolean(UseState,0x0008,{6}) 
                           ,InvoiceNo='{0}',InvoiceMoney={1} , Customer='{2}', Phone='{3}',Address='{4}' where BillNo = '{5}'"
                           , ht[0], ht[1], ht[2], ht[3], ht[4], ht[5], ht[6]);
                        command.ExecuteNonQuery();
                        #endregion
                        break;
                    case 5:
                        #region ��ȡ���ۼ�
                        FSalePriceManager = new HYSalePriceManager();
                        FSalePriceManager.Command = command;
                        haReturn.Add(0, FSalePriceManager.getSelfSalePrice(ht[0], ht[1], ht[2], ht[3], ht[4], ht[5], ht[6]));
                        #endregion
                        break;
                    case 6:
                        #region ��ȡ�ڲ����ۼ�
                        FSalePriceManager = new HYSalePriceManager();
                        FSalePriceManager.Command = command;
                        haReturn.Add(0, FSalePriceManager.getSelfSalePrice1(ht[0], ht[1], ht[2], ht[3], ht[4], ht[5], ht[6]));
                        #endregion
                        break;
                    case 7:
                        #region ��ȡ�ۼ۴���ʽ
                        FSalePriceManager = new HYSalePriceManager();
                        FSalePriceManager.Command = command;
                        Hashtable htParam = FSalePriceManager.getPriceParam();
                        if (htParam != null) haReturn.Add(0, htParam);
                        #endregion
                        break;
                    //��ʱ�������ۿ����쳣�ķ���
                    case 8://���ر��浽���ݿ�����ܽ��
                        //string StrSql = @"select sum(FactMoney) FactMoney from tbSelfSaleOutItem where BillNo='{0}'";
                        StrSql = @"select 1 from tbSelfSaleOut a 
                        where isnull(a.TotalMoney,0)<>(select sum(b.FactMoney) from tbSelfSaleOutItem b where a.billno=b.billno) and a.billno='{0}'";
                        command.CommandText = string.Format(StrSql, ht[0]);
                        int FinResult =Convert.ToInt32(command.ExecuteScalar());
                        if (FinResult== 1)
                        {
                            haReturn.Add(0, true);
                        }
                        else haReturn.Add(0, false);
                        break;
                    case 9://д��־���޸�����
                        StrSql = @"insert into tbSelfSaleOutLog Select * from tbSelfSaleOut where Billno='{0}'
                                           update tbSelfSaleOut set TotalMoney={1},CashMoney={2} where Billno='{0}' ";
                        command.CommandText = string.Format(StrSql, ht[0], ht[1], ht[2]);
                        haReturn.Add(0, command.ExecuteNonQuery());
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

    ///<summary>
    ///���۶���
    ///<summary>
    public class SvrSaleOrder : SvrSystemDB, IServerSkedUserExecEx
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
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate 
                           from tbSaleOrder where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbSaleOrder";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);
                    #endregion

                    #region �ж�

                    #endregion
                }
            }
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            Hashtable haReturn = new Hashtable();
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            HYSalePriceManager FSalePriceManager;
            Connect.Open();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Connection = Connect;
                switch (ID)
                {
                    case 0:
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        string TableName = "tbSaleOrder", BillNo = ht[0].ToString();

                        HYStorageMessage.HintLock(command, TableName, BillNo); //���ݱ���������
                        HYStorageMessage.HintChange(command, TableName, BillNo); //�������δ���
                        #endregion
                        break;
                    case 5:
                        #region ��ȡ������
                        FSalePriceManager = new HYSalePriceManager();
                        FSalePriceManager.Command = command;
                        haReturn.Add(0, FSalePriceManager.getSalePrice(ht[0], ht[1], ht[2], ht[3], ht[4], ht[5], ht[6]));
                        #endregion
                        break;
                    case 7:
                        #region ��ȡ�ۼ۴���ʽ
                        FSalePriceManager = new HYSalePriceManager();
                        FSalePriceManager.Command = command;
                        Hashtable htParam = FSalePriceManager.getPriceParam();
                        if (htParam != null) haReturn.Add(0, htParam);
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

    ///<summary>
    ///���۷�Ʊ
    ///<summary>
    public class SvrSaleInvoice : SvrSystemDB, IServerSkedUserExecEx
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
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate 
                           from tbSaleInvoice where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbSaleInvoice";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    //����������
                    cmd.CommandText = string.Format(@"select sum(VerifyTotalAmount)
                           from tbSaleInvoiceItem where BillNo = '{0}'", Row["BillNo"]);
                    decimal value = xzSqlAnalysis.getValue(cmd.ExecuteScalar());
                    if (value != 0)
                        xzException.WarnBox(HYStorageMessage._MsgHasVerify);
                    #endregion

                    #region �ж�

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
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        string TableName = "tbSaleInvoice", BillNo = ht[0].ToString();

                        HYStorageMessage.HintLock(command, TableName, BillNo); //���ݱ���������
                        HYStorageMessage.HintChange(command, TableName, BillNo); //�������δ���
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
    /// ֱӪ�깴���ռ�
    /// </summary>
    public class SvrStorVerificationReturnSelf : SvrSystemDB, IServerSkedVerification, IServerSkedUserExecEx
    {
        private const string _MaintainReturn = "ά�޷���";
        private const string _MaintainOut = "ά�޼ĳ�";

        public void VerificationDeal(Hashtable TableArg, bool isVerification, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "") 
                Connect.ConnectionString = RemotingParam.ConnectionString;

            #region ���µ��﷨
            string UptVerifyStr = "declare " + "\n"
                                + " @Count int, " + "\n"
                                + " @VerifyNo int, " + "\n"
                                + " @IsVerify int, " + "\n"
                                + " @VerifyDate datetime " + "\n"
                                + " set @Count=0 " + "\n"
                                + " set @IsVerify={2}" + "\n"
                                + " if @IsVerify=1" + "\n"
                                + " begin " + "\n"
                                + "   set @VerifyDate=getDate() " + "\n"
                                + "   select @VerifyNo=max(isnull(VerifyNo,0))+1 from tbStorMaintainPostSelfItem " + "\n"
                                + " end" + "\n"
                                + " else " + "\n"
                                + " begin " + "\n"
                                + "   set @VerifyDate=null " + "\n"
                                + "   set @VerifyNo=null " + "\n"
                                + " end" + "\n"
                                + " if exists(select 1 from tbStorMaintainPostSelfItem where BillNo='{0}' and RowNo={1} and IsVerify={2}) " + "\n"
                                + " begin " + "\n"
                                + "   goto Ex1 " + "\n"
                                + " end" + "\n"
                                + " if exists(select 1 from tbStorOtherInItemDetail where BillNo='{3}' and RowNo={4} and DetailNo={5} and IsVerify={2}) " + "\n"
                                + " begin" + "\n"
                                + "   goto Ex2" + "\n"
                                + " end" + "\n"
                                + " set xact_abort on" + "\n"
                                + " begin transaction" + "\n"
                                + " update tbStorMaintainPostSelfItem set IsVerify=@IsVerify,VerifyNo=@VerifyNo,VerifyDate=@VerifyDate where BillNo='{0}' and RowNo={1} " + "\n"
                                + " set @Count=@Count+@@rowcount " + "\n"
                                + " update tbStorOtherInItemDetail set IsVerify=@IsVerify,VerifyNo=@VerifyNo,VerifyDate=@VerifyDate where BillNo='{3}' and RowNo={4} and DetailNo={5} " + "\n"
                                + " if @Count+@@rowcount = 2" + "\n"
                                + " begin" + "\n"
                                + " commit transaction" + "\n"
                                + " select 2" + "\n"
                                + " return" + "\n"
                                + " end" + "\n"
                                + " else" + "\n"
                                + " begin" + "\n"
                                + " rollback transaction" + "\n"
                                + " select @Count+@@rowcount" + "\n"
                                + " return" + "\n"
                                + " end" + "\n"
                                + " Ex1:" + "\n"
                                + " begin" + "\n"
                                + "   select -1" + "\n"
                                + "   return" + "\n"
                                + " end" + "\n"
                                + " Ex2:" + "\n"
                                + " begin" + "\n"
                                + "   select -2" + "\n"
                                + "   return" + "\n"
                                + " end" + "\n";

                #region ���ӣ����Կ�����ѯ��������Ч����
                //declare
                //@Count int,
                //@VerifyNo int
                //set @Count=0
                //select @VerifyNo=max(isnull(VerifyNo,0))+1 from tbStorMaintainPostSelfItem
                //if exists(select 1 from tbStorMaintainPostSelfItem where BillNo='070705000' and RowNo=1 and IsVerify=1)
                //begin
                //  goto Ex1 
                //end
                //if exists(select 1 from tbStorOtherInItemDetail where BillNo='070627001' and RowNo=1 and DetailNo=1 and IsVerify=1)
                //begin
                //  goto Ex2 
                //end
                //update tbStorMaintainPostSelfItem set IsVerify=1,VerifyNo=@VerifyNo,VerifyDate=getDate() where BillNo='070705000' and RowNo=1
                //set @Count=@Count+@@rowcount
                //update tbStorOtherInItemDetail set IsVerify=1,VerifyNo=@VerifyNo,VerifyDate=getDate() where BillNo='070627001' and RowNo=1 and DetailNo=1
                //select @Count+@@rowcount
                //return 
                //Ex1:
                //begin
                //  select -1
                //  return 
                //end 
                //Ex2:
                //begin
                //  select -2
                //  return 
                //end
                #endregion

            #endregion

            Connect.Open();
            try
            {
                if (TableArg.Count == 0)
                    xzException.WarnBox("��ѡ��������Ӧ�ļ�¼");

                string strException = "";
                if (isVerification)
                {
                    #region ִ�й���
                    DataTable DtPost = null, DtReturn = null;
                    DtPost = TableArg["tbSelfPost"] as DataTable;
                    DtReturn = TableArg["tbSelfReturn"] as DataTable;
                    if (TableArg["tbSelfPost"] == null || TableArg["tbSelfReturn"] == null || DtPost.Rows.Count != 1 || DtReturn.Rows.Count != 1)
                        xzException.WarnBox("��ѡ��������Ӧ�ļ�¼");

                    SqlCommand cmdVerify = new SqlCommand(string.Format(UptVerifyStr, DtPost.Rows[0]["BillNo"], DtPost.Rows[0]["RowNo"],
                        HYStorageParam.IsOne(isVerification), DtReturn.Rows[0]["BillNo"], DtReturn.Rows[0]["RowNo"],
                        DtReturn.Rows[0]["DetailNo"]), Connect);
                    object ACount = cmdVerify.ExecuteScalar();

                    if ((Int32)ACount == -1 || (Int32)ACount == -2) strException += "�����ѹ����ļ�¼��" + "\n\n";
                    if ((Int32)ACount != 2) strException += "�������磡" + "\n\n";
                    xzException.WarnBox(strException == "" ? "�����ɹ�" : strException);
                    #endregion
                }
                else
                {
                    #region ִ�з�����
                    DataTable dtUnVerify = TableArg["VerificationRecord"] as DataTable;
                    Hashtable htRow = new Hashtable();
                    if (dtUnVerify.Rows.Count != 2)  xzException.WarnBox("��ѡ��������Ӧ�ļ�¼");
                    else
                    {
                        int verifyNo = 0;
                        foreach (DataRow dr in dtUnVerify.Rows)
                        {
                            if (verifyNo == 0)
                            {
                                verifyNo = Convert.ToInt32(dr["VerifyNo"]);
                            }
                            else
                            {
                                if (verifyNo != Convert.ToInt32(dr["VerifyNo"]))
                                {
                                    xzException.WarnBox("��ѡ��������Ӧ�ļ�¼");
                                }
                            }

                            if (dr["BillSort"].ToString() == "ά�޷���")
                                htRow.Add(dr["BillSort"].ToString() + "-DetailNo", dr["DetailNo"]);

                            htRow.Add(dr["BillSort"].ToString() + "-BillNo", dr["BillNo"]);
                            htRow.Add(dr["BillSort"].ToString() + "-RowNo", dr["RowNo"]);
                        }
                    }

                    SqlCommand cmdVerify = new SqlCommand(string.Format(UptVerifyStr, htRow["ά�޼ĳ�-BillNo"], htRow["ά�޼ĳ�-RowNo"],
                        HYStorageParam.IsOne(isVerification), htRow["ά�޷���-BillNo"], htRow["ά�޷���-RowNo"], htRow["ά�޷���-DetailNo"]), Connect);
                    object ACount = cmdVerify.ExecuteScalar();

                    if ((Int32)ACount == -1 || (Int32)ACount == -2) strException += "�����ѷ������ļ�¼��" + "\n\n";
                    if ((Int32)ACount != 2) strException += "�������磡" + "\n\n";
                    xzException.WarnBox(strException == "" ? "�������ɹ�" : strException);
                    #endregion
                }
            }
            finally
            {
                Connect.Close();
            }
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            Hashtable htResult = new Hashtable();

            Connect.Open();
            try
            {
                if (ht["VerificationRecord"] == null)
                    xzException.WarnBox("��ѡ��Ҫ���µļ�¼");

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Connect;
                DataTable Table = ht["VerificationRecord"] as DataTable;

                switch (ID)
                {
                    case 0:
                        #region ��д�۸�
                        string strException = "";
                        SqlTransaction SqlTran = Connect.BeginTransaction();
                        try
                        {
                            cmd.Transaction = SqlTran;
                            //����������е���(�������е�ά�޼ĳ�)
                            Hashtable htVerifyLog = new Hashtable();
                            foreach (DataRow Row in Table.Rows)
                            {
                                if (Row["BillSort"].ToString() == _MaintainReturn)
                                {
                                    string Key = string.Format("{0}\n{1}", Row["BillNo"], Row["RowNo"]);
                                    if (!htVerifyLog.ContainsKey(Key))
                                        htVerifyLog.Add(Key, Row);
                                }
                            }

                            foreach (string VerifyLog in htVerifyLog.Keys)
                            {
                                string[] keys = VerifyLog.Split('\n');
                                DataRow[] ReturnRows = Table.Select(string.Format("BillNo = '{0}' and RowNo = {1} and BillSort = '{2}' "
                                     , keys[0], keys[1], _MaintainReturn));
                                decimal sum_Return = Convert.ToDecimal((htVerifyLog[VerifyLog] as DataRow)["Number"]), sum_Out = 0;

                                Hashtable htUpdateRow = new Hashtable();
                                foreach (DataRow RowResturn in ReturnRows)
                                {
                                    DataRow[] OutRows = Table.Select(string.Format("VerifyNo = {0} and BillSort = '{1}'"
                                        , RowResturn["VerifyNo"], _MaintainOut));
                                    foreach (DataRow RowOut in OutRows)
                                    {
                                        decimal tmpInCostPrice = Convert.ToDecimal(RowOut["InCostPrice"]);
                                        if (tmpInCostPrice == 0)
                                        {
                                            strException = strException + string.Format("--���ݺ�:{0}-{1}�������ϸ���������--\n", keys[0], keys[1]);
                                            continue;
                                        }

                                        htUpdateRow.Add(RowResturn, RowOut);
                                        sum_Out = sum_Out + Convert.ToDecimal(RowOut["Number"]);
                                    }
                                }

                                //�Ϸ��ĸ�������(�Ѽĳ����µ�����)
                                strException = strException + string.Format("{0}\n", "".PadRight(10, '='));
                                if (sum_Return != 0 && sum_Return == sum_Out)
                                {
                                    //strException = strException + string.Format("���ݺ�:{0}-{1}���ɱ����³ɹ����ĳ�[{2}],����[{3}]\n"
                                    //    , keys[0], keys[1], sum_Out, sum_Return);

                                    decimal SumMoney = 0m;
                                    foreach (DataRow RowResturn in htUpdateRow.Keys)
                                    {
                                        DataRow RowOut = htUpdateRow[RowResturn] as DataRow;
                                        decimal Price = Convert.ToDecimal(RowOut["InCostPrice"]);
                                        SumMoney = SumMoney + Price;

                                        //���µ������
                                        string SqlDetail = @"update tbStorOtherInItemDetail set InCostPrice={0} 
                                                                        where BillNo = '{1}' and RowNo={2} and VerifyNo = {3}";
                                        cmd.CommandText = string.Format(SqlDetail, Price, keys[0], keys[1], RowOut["VerifyNo"]);
                                        cmd.ExecuteNonQuery();

                                        strException = strException + string.Format("*��Ʒ[{0}] ����:{1}���ɱ����³ɹ���\n"
                                            , RowOut["ProductName"], RowOut["ListNo"]);
                                    }

                                    //���µڶ����
                                    string SqlRow = @"update tbStorOtherInItem set InCostPrice=round({0}/Number,2), SumMoney= {0}
                                                   where BillNo = '{1}' and RowNo={2}";

                                    cmd.CommandText = string.Format(SqlRow, SumMoney, keys[0], keys[1]);
                                    cmd.ExecuteNonQuery();
                                }
                                else
                                {
                                    strException = strException + string.Format("���ݺ�:{0}-{1}�������ϸ����������ĳ�[{2}],����[{3}]\n"
                                        , keys[0], keys[1], sum_Out, sum_Return);
                                }
                            }

                            SqlTran.Commit();
                        }
                        catch (Exception ex)
                        {
                            SqlTran.Rollback();
                            xzException.WarnBox(ex.Message);

                        }
                        xzException.WarnBox(strException);
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

    ///<summary>
    ///�ɹ��������ݴ���
    ///<summary>
    public class SvrStockOrder : SvrSystemDB, IServerSkedUserExecEx
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
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate 
                           from tbStockOrder where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbStockOrder";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);
                    #endregion

                    #region �ж�

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
                SqlCommand FCommand = new SqlCommand();
                FCommand.Connection = Connect;
                switch (ID)
                {
                    case 0:
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        string TableName = "tbStockOrder", BillNo = ht[0].ToString();

                        HYStorageMessage.HintLock(FCommand, TableName, BillNo);   //���ݱ���������
                        HYStorageMessage.HintChange(FCommand, TableName, BillNo); //�������δ���
                        #endregion
                        break;
                    case 2:
                        #region ��ȡ�������������ܲ��������ܿ������
                        DateTime time = Convert.ToDateTime(ht[2]);
                        DateTime BeginTime = time, EndTime = time;
                        switch (time.DayOfWeek)
                        {
                            case DayOfWeek.Monday:
                                BeginTime = time.AddDays(-7).Date;
                                break;
                            case DayOfWeek.Tuesday:
                                BeginTime = time.AddDays(-8).Date;
                                break;
                            case DayOfWeek.Wednesday:
                                BeginTime = time.AddDays(-9).Date;
                                break;
                            case DayOfWeek.Thursday:
                                BeginTime = time.AddDays(-10).Date;
                                break;
                            case DayOfWeek.Friday:
                                BeginTime = time.AddDays(-11).Date;
                                break;
                            case DayOfWeek.Saturday:
                                BeginTime = time.AddDays(-12).Date;
                                break;
                            case DayOfWeek.Sunday:
                                BeginTime = time.AddDays(-13).Date;
                                break;
                        }
                        EndTime = BeginTime.AddDays(6).AddHours(23).AddMinutes(59).AddSeconds(59);

                        //--��������
                        FCommand.CommandText = string.Format(@"select Sum(Number)
                              from tbSaleOutItem a
                            Left Outer Join tbSaleOut b on a.BillNo = b.BillNo
                            where a.ProductSortCode = '{0}' and a.ProductCode = '{1}' and TheDate >='{2}'  and TheDate <='{3}' 
                              and dbo.GetByteToBoolean(b.TheState,0x0001)=1", ht[0], ht[1], BeginTime, EndTime);
                        decimal WeekSaleOut = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());

                        FCommand.CommandText = string.Format(@"select Sum(Number)
                              from tbSelfSaleOutItem a
                            Left Outer Join tbSelfSaleOut b on a.BillNo = b.BillNo
                            where a.ProductSortCode = '{0}' and a.ProductCode = '{1}' and TheDate >='{2}'  and TheDate <='{3}' 
                              and dbo.GetByteToBoolean(b.TheState,0x0001)=1", ht[0], ht[1], BeginTime, EndTime);
                        WeekSaleOut += xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
                        haReturn.Add(0, WeekSaleOut);

                        //--��������
                        FCommand.CommandText = string.Format(@"select Sum(Number)
                                  from tbStorStorage a
                                Left outer Join tbDatumStorage b on a.StorageCode = b.TheCode
                                Left Outer Join tbDatumShop   c on b.ShopCode = c.theCode
                                where a.ProductSortCode = '{0}' and a.ProductCode = '{1}' and c.ShopSort = '001'", ht[0], ht[1]);
                        decimal Storage = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
                        haReturn.Add(1, Storage);

                        //--��ǰ���
                        FCommand.CommandText = string.Format(@"select Sum(Number)
                                  from tbStorStorage a
                                Left outer Join tbDatumStorage b on a.StorageCode = b.TheCode
                                Left Outer Join tbDatumShop   c on b.ShopCode = c.theCode
                                where a.ProductSortCode = '{0}' and a.ProductCode = '{1}' and c.ShopSort in ('001','002')", ht[0], ht[1]);
                        Storage = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
                        haReturn.Add(2, Storage);

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

    ///<summary>
    ///�ɹ���Ʊ���ݴ���
    ///<summary>
    public class SvrStockInvoice : SvrSystemDB
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
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate 
                           from tbSaleInvoice where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbSaleInvoice";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);

                    //����������
                    cmd.CommandText = string.Format(@"select sum(VerifyTotalAmount)
                           from tbSaleInvoiceItem where BillNo = '{0}'", Row["BillNo"]);
                    decimal value = xzSqlAnalysis.getValue(cmd.ExecuteScalar());
                    if (value!=0)
                        xzException.WarnBox(HYStorageMessage._MsgHasVerify);
                    #endregion

                    #region �ж�

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
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        string TableName = "tbSaleInvoice", BillNo = ht[0].ToString();

                        HYStorageMessage.HintLock(command, TableName, BillNo);   //���ݱ���������
                        HYStorageMessage.HintChange(command, TableName, BillNo); //�������δ���
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
    /// ���۷�Ʊ����
    /// </summary>
    public class SvrSaleVerification : SvrSystemDB, IServerSkedVerification
    {
        public void VerificationDeal(Hashtable TableArg, bool isVerification, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "") Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {
                if (TableArg.Count == 0)
                {
                    xzException.WarnBox("��ѡ��Ʊ�򵥾�");
                }

                string sql = null;
                SqlCommand cmd = new SqlCommand(sql, Connect);
                SqlDataReader sdr = null;
                DataTable dtInvoice = null, dtBill = null;

                if (isVerification)
                {
                    dtInvoice = TableArg["Invoice"] as DataTable;
                    dtBill = TableArg["Bill"] as DataTable;
                    if (dtInvoice.Rows.Count == 0)
                    {
                        xzException.WarnBox("�޶�Ӧ��Ʊ��Ϣ");
                    }
                    else
                        //��ʱ����ÿ�ι���ֻ�ܶ�һ�ŷ�Ʊ���й���
                        //��Ҫ����Ʒ��ȡ�ɱ��й�ϵ���Խ�������޹�
                        if (dtInvoice.Rows.Count != 1)
                        {
                            xzException.WarnBox(string.Format("������ʱֻ�ܶ�<1>�ŷ�Ʊ���й�������ѡ����<{0}>�ŷ�Ʊ", dtInvoice.Rows.Count));
                        }
                    if (dtBill.Rows.Count == 0)
                    {
                        xzException.WarnBox("�޶�Ӧ������Ϣ");
                    }

                    #region �жϿͻ����Ʒ�Ƿ��Ӧ����������
                    Hashtable TmphtInvoice = new Hashtable(), TmphtBill = new Hashtable();
                    string TmpKey = "";
                    int TmpAmount = 0;
                    foreach (DataRow TmpDr in dtInvoice.Rows)
                    {
                        TmpKey = string.Format("�ͻ�Ϊ<{0}>,��ƷΪ<{1}>��������", TmpDr["ClientName"], TmpDr["ProductName"]);
                        if (!TmphtInvoice.ContainsKey(TmpKey))
                        {
                            TmphtInvoice.Add(TmpKey, TmpDr["NowAmount"]);
                        }
                        else
                        {
                            TmpAmount = Convert.ToInt32(TmphtInvoice[TmpKey]) + Convert.ToInt32(TmpDr["NowAmount"]);
                            TmphtInvoice.Remove(TmpKey);
                            TmphtInvoice.Add(TmpKey, TmpAmount);
                        }
                    }
                    foreach (DataRow TmpDr in dtBill.Rows)
                    {
                        TmpKey = string.Format("�ͻ�Ϊ<{0}>,��ƷΪ<{1}>��������", TmpDr["ClientName"], TmpDr["ProductName"]);
                        if (!TmphtBill.ContainsKey(TmpKey))
                        {
                            TmphtBill.Add(TmpKey, TmpDr["NowAmount"]);
                        }
                        else
                        {
                            TmpAmount = Convert.ToInt32(TmphtBill[TmpKey]) + Convert.ToInt32(TmpDr["NowAmount"]);
                            TmphtBill.Remove(TmpKey);
                            TmphtBill.Add(TmpKey, TmpAmount);
                        }
                    }

                    string strException = "";
                    bool notBillHas, notInvoiceHas;
                    foreach (string str1 in TmphtInvoice.Keys)
                    {
                        notBillHas = false;
                        foreach (string str2 in TmphtBill.Keys)
                        {
                            if (str2 == str1)
                            {
                                notBillHas = true;
                                if (Convert.ToInt32(TmphtBill[str2]) != Convert.ToInt32(TmphtInvoice[str1]))
                                {
                                    strException += "��Ʊ��Ϣ�У�" + str1 + TmphtInvoice[str1].ToString() + "\n" +
                                        "������Ϣ�У�" + str2 + TmphtBill[str2].ToString() + "\n\n";
                                }
                                break;
                            }
                            notInvoiceHas = false;
                            foreach (string str3 in TmphtInvoice.Keys)
                            {
                                if (str3 == str2)
                                {
                                    notInvoiceHas = true;
                                    break;
                                }
                            }
                            if (!notInvoiceHas)
                            {
                                strException += "��������Ӧ�ķ�Ʊ��Ϣ" + "\n" +
                                    "������Ϣ�У�" + str2 + TmphtBill[str2].ToString() + "\n\n";
                            }
                        }
                        if (!notBillHas)
                        {
                            strException += "��Ʊ��Ϣ�У�" + str1 + TmphtInvoice[str1].ToString() + "\n" +
                                "��������Ӧ�ĳ�����Ϣ" + "\n\n";
                        }
                    }
                    if (strException != "")
                    {
                        strException += "��Ʊ�����������������������ʧ�ܡ�";
                        xzException.WarnBox(strException);
                    }
                    #endregion

                    string VerifySort, BillSort, BillNo, RowNo, BillDate, TheDate, ClientSort, ClientCode, ProductSort, ProductCode;
                    int VerifyNo, NowAmount, TotalAmount, OddAmount;
                    double NowCostMoney, NowMoney, TotalCostMoney, TotalMoney, OddCostMoney, OddMoney;

                    VerifySort = "SaleInvoiceVerify";
                    cmd.CommandText = string.Format("select isnull(max(VerifyNo),0) from tsSystemVerifyLog where VerifySort='{0}'", VerifySort);
                    VerifyNo = Convert.ToInt32(cmd.ExecuteScalar());
                    TheDate = DateTime.Now.ToShortDateString();

                    #region �������۷�Ʊ������
                    foreach (DataRow drInvoice in dtInvoice.Rows)
                    {
                        BillSort = "���۷�Ʊ";
                        BillNo = Convert.ToString(drInvoice["BillNo"]);
                        RowNo = Convert.ToString(drInvoice["RowNo"]);
                        BillDate = Convert.ToString(drInvoice["TheDate"]);
                        ClientSort = Convert.ToString(drInvoice["ClientSort"]);
                        ClientCode = Convert.ToString(drInvoice["ClientCode"]);
                        ProductSort = Convert.ToString(drInvoice["ProductSortCode"]);
                        ProductCode = Convert.ToString(drInvoice["ProductCode"]);
                        NowAmount = Convert.ToInt32(drInvoice["NowAmount"]);
                        //������ڹ��������պõ��ڷ�Ʊ��δ��������
                        if (NowAmount == Convert.ToInt32(drInvoice["VerifyOddAmount"]))
                        {
                            NowCostMoney = 0; //Convert.ToDouble(drInvoice["VerifyOddCostMoney"]);
                            NowMoney = Convert.ToDouble(drInvoice["VerifyOddMoney"]);
                            TotalAmount = Convert.ToInt32(drInvoice["Number"]);
                            TotalCostMoney = 0; //Convert.ToDouble(drInvoice["SumMoney"]);
                            TotalMoney = Convert.ToDouble(drInvoice["TotalMoney"]);
                            OddAmount = 0;
                            OddCostMoney = 0.00;
                            OddMoney = 0.00;
                        }
                        else
                        {
                            NowCostMoney = 0; //Convert.ToDouble(drInvoice["SumMoney"]) / Convert.ToInt32(drInvoice["Number"]) * NowAmount;
                            NowMoney = Convert.ToDouble(drInvoice["TotalMoney"]) / Convert.ToInt32(drInvoice["Number"]) * NowAmount;
                            TotalAmount = Convert.ToInt32(drInvoice["VerifyTotalAmount"]) + NowAmount;
                            TotalCostMoney = 0; //Convert.ToDouble(drInvoice["VerifyTotalCostMoney"]) + NowCostMoney;
                            TotalMoney = Convert.ToDouble(drInvoice["VerifyTotalMoney"]) + NowMoney;
                            OddAmount = Convert.ToInt32(drInvoice["Number"]) - TotalAmount;
                            OddCostMoney = 0; //Convert.ToDouble(drInvoice["VerifyOddCostMoney"]) - NowCostMoney;
                            OddMoney = Convert.ToDouble(drInvoice["VerifyOddMoney"]) - NowMoney;
                        }
                        sql = string.Format("insert tsSystemVerifyLog values('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', '{12}', '{13}', '{14}', '{15}', '{16}', '{17}', '{18}', '{19}')",
                            VerifySort, VerifyNo + 1, BillSort, BillNo, RowNo, BillDate, TheDate, ClientSort, ClientCode, ProductSort, ProductCode, NowAmount, NowCostMoney, NowMoney, TotalAmount, TotalCostMoney, TotalMoney, OddAmount, OddCostMoney, OddMoney) + "\n";
                        sql += string.Format("update tbSaleInvoiceItem set VerifyNowAmount={0}, VerifyNowCostMoney={1}, VerifyNowMoney={2}, VerifyTotalAmount={3}, VerifyTotalCostMoney={4}, VerifyTotalMoney={5} where BillNo='{6}' and RowNo='{7}'",
                            NowAmount, NowCostMoney, NowMoney, TotalAmount, TotalCostMoney, TotalMoney, BillNo, RowNo) + "\n";
                        cmd.CommandText = sql;
                        cmd.ExecuteNonQuery();
                    }
                    #endregion

                    #region �������۳��������
                    foreach (DataRow drBill in dtBill.Rows)
                    {
                        BillSort = "���۳���";
                        BillNo = Convert.ToString(drBill["BillNo"]);
                        RowNo = Convert.ToString(drBill["RowNo"]);
                        BillDate = Convert.ToString(drBill["TheDate"]);
                        ClientSort = Convert.ToString(drBill["ClientSort"]);
                        ClientCode = Convert.ToString(drBill["ClientCode"]);
                        ProductSort = Convert.ToString(drBill["ProductSortCode"]);
                        ProductCode = Convert.ToString(drBill["ProductCode"]);
                        NowAmount = Convert.ToInt32(drBill["NowAmount"]);
                        //������ڹ��������պõ��ڵ��ݵ�δ��������
                        if (NowAmount == Convert.ToInt32(drBill["VerifyOddAmount"]))
                        {
                            NowCostMoney = Convert.ToDouble(drBill["VerifyOddCostMoney"]);
                            NowMoney = Convert.ToDouble(drBill["VerifyOddMoney"]);
                            TotalAmount = Convert.ToInt32(drBill["Number"]);
                            TotalCostMoney = Convert.ToDouble(drBill["CostMoney"]);
                            TotalMoney = Convert.ToDouble(drBill["TotalMoney"]);
                            OddAmount = 0;
                            OddCostMoney = 0.00;
                            OddMoney = 0.00;
                        }
                        else
                        {
                            NowCostMoney = Convert.ToDouble(drBill["CostPrice"]) * NowAmount;
                            NowMoney = Convert.ToDouble(drBill["TotalMoney"]) / Convert.ToInt32(drBill["Number"]) * NowAmount;
                            TotalAmount = Convert.ToInt32(drBill["VerifyTotalAmount"]) + NowAmount;
                            TotalCostMoney = Convert.ToDouble(drBill["VerifyTotalCostMoney"]) + NowCostMoney;
                            TotalMoney = Convert.ToDouble(drBill["VerifyTotalMoney"]) + NowMoney;
                            OddAmount = Convert.ToInt32(drBill["Number"]) - TotalAmount;
                            OddCostMoney = Convert.ToDouble(drBill["VerifyOddCostMoney"]) - NowCostMoney;
                            OddMoney = Convert.ToDouble(drBill["VerifyOddMoney"]) - NowMoney;
                        }
                        sql = string.Format("insert tsSystemVerifyLog values('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', '{12}', '{13}', '{14}', '{15}', '{16}', '{17}', '{18}', '{19}')",
                            VerifySort, VerifyNo + 1, BillSort, BillNo, RowNo, BillDate, TheDate, ClientSort, ClientCode, ProductSort, ProductCode, NowAmount, NowCostMoney, NowMoney, TotalAmount, TotalCostMoney, TotalMoney, OddAmount, OddCostMoney, OddMoney) + "\n";
                        sql += string.Format("update tbSaleOutItem set VerifyNowAmount={0}, VerifyNowCostMoney={1}, VerifyNowMoney={2}, VerifyTotalAmount={3}, VerifyTotalCostMoney={4}, VerifyTotalMoney={5} where BillNo='{6}' and RowNo='{7}'",
                            NowAmount, NowCostMoney, NowMoney, TotalAmount, TotalCostMoney, TotalMoney, BillNo, RowNo) + "\n";
                        cmd.CommandText = sql;
                        cmd.ExecuteNonQuery();
                    }
                    #endregion

                    xzException.WarnBox("�����ɹ�");
                }
                else
                {
                    int invoiceAmount = 0, billAmount = 0;
                    foreach (DataRow rows in (TableArg["VerificationRecord"] as DataTable).Rows)
                    {
                        if (rows["BillSort"].ToString() == "���۷�Ʊ")
                        {
                            invoiceAmount += Convert.ToInt32(rows["NowAmount"]);
                        }
                        else if (rows["BillSort"].ToString() == "���۳���")
                        {
                            billAmount += Convert.ToInt32(rows["NowAmount"]);
                        }
                    }
                    if (invoiceAmount != billAmount)
                    {
                        xzException.WarnBox("��Ʊ�����������������");
                    }
                    foreach (DataRow rows in (TableArg["VerificationRecord"] as DataTable).Rows)
                    {
                        #region ���¹�����־
                        sql = "select * from tsSystemVerifyLog where VerifySort='{4}' and BillSort='{0}' and BillNo='{1}' and RowNo='{2}' and VerifyNo>{3}";
                        cmd.CommandText = string.Format(sql, rows["BillSort"], rows["BillNo"], rows["RowNo"], rows["VerifyNo"], rows["VerifySort"]);
                        sdr = cmd.ExecuteReader();
                        sql = "";
                        while (sdr.Read())
                        {
                            sql += string.Format("update tsSystemVerifyLog set TotalAmount=TotalAmount-{0}, TotalCostMoney=TotalCostMoney-{1}, TotalMoney=TotalMoney-{2}, OddAmount=OddAmount+{0}, OddCostMoney=OddCostMoney+{1}, OddMoney=OddMoney+{2} where VerifySort='{3}' and VerifyNo='{4}' and BillSort='{5}' and BillNo='{6}' and RowNo='{7}'",
                                rows["NowAmount"], rows["NowCostMoney"], rows["NowMoney"], sdr["VerifySort"], sdr["VerifyNo"], sdr["BillSort"], sdr["BillNo"], sdr["RowNo"]) + "\n";
                        }
                        sql += string.Format("delete tsSystemVerifyLog where VerifySort='{0}' and VerifyNo='{1}' and BillSort='{2}' and BillNo='{3}' and RowNo='{4}'",
                           rows["VerifySort"], rows["VerifyNo"], rows["BillSort"], rows["BillNo"], rows["RowNo"]) + "\n";
                        sdr.Close();
                        cmd.CommandText = sql;
                        cmd.ExecuteNonQuery();
                        #endregion

                        #region �������۷�Ʊ�����۳���
                        sql = "select top 1 * from tsSystemVerifyLog where VerifySort='{3}' and BillSort='{0}' and BillNo='{1}' and RowNo='{2}' order by VerifyNo desc";
                        cmd.CommandText = string.Format(sql, rows["BillSort"], rows["BillNo"], rows["RowNo"], rows["VerifySort"]);
                        sdr = cmd.ExecuteReader();
                        int tmpAmount = 0, tmpTotalAmount = 0;
                        double tmpCostMoney = 0.00, tmpMoney = 0.00, tmpTotalCostMoney = 0.00, tmpTotalMoney = 0.00;
                        if (sdr.Read())
                        {
                            tmpAmount = Convert.ToInt32(sdr["NowAmount"]);
                            tmpCostMoney = Convert.ToDouble(sdr["NowCostMoney"]);
                            tmpMoney = Convert.ToDouble(sdr["NowMoney"]);
                            tmpTotalAmount = Convert.ToInt32(sdr["TotalAmount"]);
                            tmpTotalCostMoney = Convert.ToDouble(sdr["TotalCostMoney"]);
                            tmpTotalMoney = Convert.ToDouble(sdr["TotalMoney"]);
                        }
                        sdr.Close();
                        sql = "";
                        if (rows["BillSort"].ToString() == "���۷�Ʊ")
                        {
                            sql += string.Format("update tbSaleInvoiceItem set VerifyNowAmount={0}, VerifyNowCostMoney={1}, VerifyNowMoney={2}, VerifyTotalAmount={3}, VerifyTotalCostMoney={4}, VerifyTotalMoney={5} where BillNo='{6}' and RowNo='{7}'",
                               tmpAmount, tmpCostMoney, tmpMoney, tmpTotalAmount, tmpTotalCostMoney, tmpTotalMoney, rows["BillNo"], rows["RowNo"]) + "\n";
                        }
                        else if (rows["BillSort"].ToString() == "���۳���")
                        {
                            sql += string.Format("update tbSaleOutItem set VerifyNowAmount={0}, VerifyNowCostMoney={1}, VerifyNowMoney={2}, VerifyTotalAmount={3}, VerifyTotalCostMoney={4}, VerifyTotalMoney={5} where BillNo='{6}' and RowNo='{7}'",
                               tmpAmount, tmpCostMoney, tmpMoney, tmpTotalAmount, tmpTotalCostMoney, tmpTotalMoney, rows["BillNo"], rows["RowNo"]) + "\n";
                        }
                        cmd.CommandText = sql;
                        cmd.ExecuteNonQuery();
                        #endregion
                    }

                    xzException.WarnBox("�������ɹ�");
                }
            }
            finally
            {
                Connect.Close();
            }
        }
    }

    /// <summary>
    /// ���۷�Ʊ����[ί�д���-�ƶ�]
    /// </summary>
    public class SvrSaleVerifyCancelMobile : SvrSystemDB, IServerSkedVerification
    {
        private void UpdateInvoice(SqlCommand cmd, DataRow row, decimal Amount)
        {
            string StrSql = @"Update tbSaleInvoiceItem set VerifyTotalAmount = VerifyTotalAmount + {0} where BillNo = '{1}' and RowNo = {2}";
            cmd.CommandText = string.Format(StrSql, Amount, row["BillNo"], row["RowNo"]);
            cmd.ExecuteNonQuery();
        }

        //�õ�����δ��������
        private int InvoiceVerifyTotal(SqlCommand cmd, DataRow row)
        {
            string StrSql = @"select Number - isnull(VerifyTotalAmount,0) VerifyTotalAmount from tbSaleInvoiceItem where BillNo = '{0}' and RowNo = {1}";
            cmd.CommandText = string.Format(StrSql, row["BillNo"], row["RowNo"]);
            return Convert.ToInt32(cmd.ExecuteScalar());
        }

        public void VerificationDeal(Hashtable TableArg, bool isVerification, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "") Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = Connect;
                    if (isVerification)
                    {                        
                        #region ��Ʊ���к���
                        if (!TableArg.ContainsKey("InvoiceRubric"))
                            xzException.WarnBox("δѡ��[�쵥]��Ʊ��");
                        if (!TableArg.ContainsKey("Invoice"))
                            xzException.WarnBox("δѡ��[����]��Ʊ��");
                        DataTable dtInvoiceRubric = TableArg["InvoiceRubric"] as DataTable;
                        DataTable dtInvoice = TableArg["Invoice"] as DataTable;
                        if (dtInvoiceRubric.Rows.Count != 1)
                            xzException.WarnBox("ѡ��[�쵥]��Ʊ��������һ�ţ�");
                        if (dtInvoice.Rows.Count != 1)
                            xzException.WarnBox("ѡ��[����]��Ʊ��������һ�ţ�");

                        HYVerificationManager FVerificationManager = new HYVerificationManager();
                        FVerificationManager.Command = cmd;
                        decimal VerifyNo = FVerificationManager.getVerifyLogNo(HYVerificationManager._SaleInvoiceBlue);

                        SqlTransaction SqlTrans = Connect.BeginTransaction();
                        try
                        {
                            //�Ƿ񹳻����
                            int isverify = 0;
                            int Redisverify = 0;

                            cmd.Transaction = SqlTrans;

                            DataRow InvoiceRow = dtInvoice.Rows[0];
                            DataRow InvoiceRubricRow = dtInvoiceRubric.Rows[0];
                            decimal Amount = xzSqlAnalysis.getValue(InvoiceRow["VerifyTotalAmount"]);
                            decimal RubricAmount = xzSqlAnalysis.getAbsValue(InvoiceRubricRow["VerifyTotalAmount"]);

                            #region ҳ�滺������
                            if ((InvoiceVerifyTotal(cmd, InvoiceRow) != Amount) || (InvoiceVerifyTotal(cmd, InvoiceRubricRow) != -RubricAmount))
                                xzException.WarnBox("��ˢ��ҳ��!");
                            #endregion

                            if (Amount > RubricAmount)
                            {
                                Amount = RubricAmount;
                                Redisverify = 1;
                            }
                            else
                            {
                                isverify = 1;
                            }

                            UpdateInvoice(cmd, InvoiceRow, Amount);
                            UpdateInvoice(cmd, InvoiceRubricRow, -Amount);
                            FVerificationManager.InsertVerifyLog(InvoiceRow, HYVerificationManager._SaleInvoiceBlue
                                , HYVerificationManager._SaleInvoiceBlueName, VerifyNo, Amount, InvoiceRow["TheDate"].ToString(), 0, isverify);
                            FVerificationManager.InsertVerifyLog(InvoiceRubricRow, HYVerificationManager._SaleInvoiceRubric
                                , HYVerificationManager._SaleInvoiceRubricName, VerifyNo, -Amount, InvoiceRubricRow["TheDate"].ToString(), 0, Redisverify);
                            SqlTrans.Commit();
                        }
                        catch (Exception err)
                        {
                            SqlTrans.Rollback();
                            xzException.WarnBox(err.Message);
                        }
                        #endregion
                    }
                    else
                    {
                        #region ��Ʊ����ȡ������
                        if (!TableArg.ContainsKey("VerificationRecord"))
                            xzException.WarnBox("δѡ�񹴻����ݣ�");
                        DataTable dtVerificationRecord = TableArg["VerificationRecord"] as DataTable;                        

                        using (SqlDataAdapter sqlda = new SqlDataAdapter())
                        {
                            sqlda.SelectCommand = cmd;
                            ArrayList FList = new ArrayList();
                            foreach (DataRow VerificationRow in dtVerificationRecord.Rows)
                            {
                                string VerifyNo = VerificationRow["VerifyNo"].ToString();
                                if (!FList.Contains(VerifyNo)) FList.Add(VerifyNo);
                            }

                            dtVerificationRecord.Rows.Clear();
                            cmd.CommandText = string.Format("select * from tbSaleInvoiceVerifyLog where VerifyNo in {0} and VerifySort in ('{1}', '{2}')"
                                , xzSqlAnalysis.getListCause(FList), HYVerificationManager._SaleInvoiceBlue, HYVerificationManager._SaleInvoiceRubric);
                            sqlda.Fill(dtVerificationRecord);
                        }

                        HYVerificationManager FVerificationManager = new HYVerificationManager();
                        FVerificationManager.Command = cmd;

                        SqlTransaction SqlTrans = Connect.BeginTransaction();
                        try
                        {
                            cmd.Transaction = SqlTrans;
                            foreach (DataRow VerificationRow in dtVerificationRecord.Rows)
                            {
                                decimal Amount = xzSqlAnalysis.getAbsValue(VerificationRow["Number"]);
                                string VerifySort = VerificationRow["VerifySort"].ToString();
                                switch (VerifySort)
                                {
                                    case HYVerificationManager._SaleInvoiceBlue:
                                        UpdateInvoice(cmd, VerificationRow, -Amount);
                                        break;
                                    case HYVerificationManager._SaleInvoiceRubric:
                                        UpdateInvoice(cmd, VerificationRow, Amount);
                                        break;
                                }
                                FVerificationManager.DeleteVerifyLog(VerificationRow, VerifySort, xzSqlAnalysis.getValue(VerificationRow["VerifyNo"]));
                            }
                            SqlTrans.Commit();
                        }
                        catch (Exception err)
                        {
                            SqlTrans.Rollback();
                            xzException.WarnBox(err.Message);
                        }
                        #endregion
                    }
                }
            }
            finally
            {
                Connect.Close();
            }
        }
    }

    /// <summary>
    /// ���۳������[ί�д���-�ƶ�]
    /// </summary>
    public class SvrSaleOutCancelMobile : SvrSystemDB, IServerSkedVerification
    {
        private void UpdateSaleOut(SqlCommand cmd, DataRow row, decimal Amount)
        {
            string StrSql = @"Update tbSaleOutItem set VerifyTotalAmount = VerifyTotalAmount + {0} where BillNo = '{1}' and RowNo = {2}";
            cmd.CommandText = string.Format(StrSql, Amount, row["BillNo"], row["RowNo"]);
            cmd.ExecuteNonQuery();
        }
        //�õ�����δ��������
        private int SaleOutVerifyTotal(SqlCommand cmd, DataRow row)
        {
            string StrSql = @"select Number - isnull(VerifyTotalAmount,0) VerifyTotalAmount from tbSaleOutItem where BillNo = '{0}' and RowNo = {1}";
            cmd.CommandText = string.Format(StrSql, row["BillNo"], row["RowNo"]);
            return Convert.ToInt32(cmd.ExecuteScalar());
        }

        public void VerificationDeal(Hashtable TableArg, bool isVerification, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "") Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = Connect;
                    if (isVerification)
                    {
                        #region ���۳�����к���
                        if (!TableArg.ContainsKey("SaleOutRubric"))
                            xzException.WarnBox("δѡ��[�쵥]���۳��⣡");
                        if (!TableArg.ContainsKey("SaleOut"))
                            xzException.WarnBox("δѡ��[����]���۳��⣡");
                        DataTable dtSaleOutRubric = TableArg["SaleOutRubric"] as DataTable;
                        DataTable dtSaleOut = TableArg["SaleOut"] as DataTable;
                        if (dtSaleOutRubric.Rows.Count != 1)
                            xzException.WarnBox("ѡ��[�쵥]���۳�����������һ�ţ�");
                        if (dtSaleOut.Rows.Count != 1)
                            xzException.WarnBox("ѡ��[����]���۳�����������һ�ţ�");

                        HYVerificationManager FVerificationManager = new HYVerificationManager();
                        FVerificationManager.Command = cmd;
                        decimal VerifyNo = FVerificationManager.getVerifyLogNo(HYVerificationManager._SaleOutBlue);

                        SqlTransaction SqlTrans = Connect.BeginTransaction();
                        try
                        {
                            cmd.Transaction = SqlTrans;
                            //�Ƿ񹳻����
                            int isverify = 0;
                            int Redisverify = 0;

                            DataRow SaleOutRow = dtSaleOut.Rows[0];
                            DataRow SaleOutRubricRow = dtSaleOutRubric.Rows[0];
                            decimal Amount = xzSqlAnalysis.getValue(SaleOutRow["VerifyTotalAmount"]);
                            decimal RubricAmount = xzSqlAnalysis.getAbsValue(SaleOutRubricRow["VerifyTotalAmount"]);

                            #region ҳ�滺������
                            if((SaleOutVerifyTotal(cmd,SaleOutRow)!=Amount) || (SaleOutVerifyTotal(cmd,SaleOutRubricRow)!=-RubricAmount))
                            xzException.WarnBox("��ˢ��ҳ��!");
                            #endregion

                            if (Amount > RubricAmount)
                            {
                                Amount = RubricAmount;
                                Redisverify = 1;
                            }
                            else
                                isverify = 1;

                            UpdateSaleOut(cmd, SaleOutRow, Amount);
                            UpdateSaleOut(cmd, SaleOutRubricRow, -Amount);
                            FVerificationManager.InsertVerifyLog(SaleOutRow, HYVerificationManager._SaleOutBlue
                                , HYVerificationManager._SaleOutBlueName, VerifyNo, Amount, SaleOutRow["TheDate"].ToString(), 0, isverify);
                            FVerificationManager.InsertVerifyLog(SaleOutRubricRow, HYVerificationManager._SaleOutRubric
                                , HYVerificationManager._SaleOutRubricName, VerifyNo, -Amount, SaleOutRubricRow["TheDate"].ToString(), 0, Redisverify);
                            SqlTrans.Commit();
                        }
                        catch (Exception err)
                        {
                            SqlTrans.Rollback();
                            xzException.WarnBox(err.Message);
                        }
                        #endregion
                    }
                    else
                    {
                        #region ���۳������ȡ������
                        if (!TableArg.ContainsKey("VerificationRecord"))
                            xzException.WarnBox("δѡ�񹴻����ݣ�");
                        DataTable dtVerificationRecord = TableArg["VerificationRecord"] as DataTable;

                        using (SqlDataAdapter sqlda = new SqlDataAdapter())
                        {
                            sqlda.SelectCommand = cmd;
                            ArrayList FList = new ArrayList();
                            foreach (DataRow VerificationRow in dtVerificationRecord.Rows)
                            {
                                string VerifyNo = VerificationRow["VerifyNo"].ToString();
                                if (!FList.Contains(VerifyNo)) FList.Add(VerifyNo);
                            }

                            dtVerificationRecord.Rows.Clear();
                            cmd.CommandText = string.Format("select * from tbSaleInvoiceVerifyLog where VerifyNo in {0} and VerifySort in ('{1}', '{2}')"
                                , xzSqlAnalysis.getListCause(FList), HYVerificationManager._SaleOutBlue, HYVerificationManager._SaleOutRubric);
                            sqlda.Fill(dtVerificationRecord);
                        }

                        HYVerificationManager FVerificationManager = new HYVerificationManager();
                        FVerificationManager.Command = cmd;

                        SqlTransaction SqlTrans = Connect.BeginTransaction();
                        try
                        {
                            cmd.Transaction = SqlTrans;
                            foreach (DataRow VerificationRow in dtVerificationRecord.Rows)
                            {
                                decimal Amount = xzSqlAnalysis.getAbsValue(VerificationRow["Number"]);
                                string VerifySort = VerificationRow["VerifySort"].ToString();
                                switch (VerifySort)
                                {
                                    case HYVerificationManager._SaleOutBlue:
                                        UpdateSaleOut(cmd, VerificationRow, -Amount);
                                        break;
                                    case HYVerificationManager._SaleOutRubric:
                                        UpdateSaleOut(cmd, VerificationRow, Amount);
                                        break;
                                }
                                FVerificationManager.DeleteVerifyLog(VerificationRow, VerifySort, xzSqlAnalysis.getValue(VerificationRow["VerifyNo"]));
                            }
                            SqlTrans.Commit();
                        }
                        catch (Exception err)
                        {
                            SqlTrans.Rollback();
                            xzException.WarnBox(err.Message);
                        }
                        #endregion
                    }
                }
            }
            finally
            {
                Connect.Close();
            }
        }
    }

    /// <summary>
    /// ���۷�Ʊ����[ί�д���-�ƶ�]
    /// ��-->��,��-->��.
    /// </summary>
//    public class SvrSaleVerificationMobileBack : SvrSystemDB, IServerSkedVerification
//    {
//        private const string _SqlSelectInvoice =
//            @"select b.theDate, a.BillNo, a.RowNo, e.TheCode AdminAreaCode ,e.TheName AdminAreaName,a.FactPrice, SaleMoney,
//                 a.ProductSortCode, a.ProductCode,
//                 a.Number, a.Number - isnull(a.VerifyTotalAmount,0) NotNumber
//              from tbSaleInvoiceItem a 
//              left outer join tbSaleInvoice b on a.BillNo=b.BillNo 
//              left outer join vDatumMobileEntrust d on b.ClientCode=d.Clientcode and d.ClientSortCode=b.ClientType
//              left outer join tbDatumCityOpposite e on d.CCode=e.TheCode
//              where b.InvoiceMode = '002' and dbo.GetByteToBoolean(b.TheState,0x0001)=1 and b.AssistantCode in('WTDX','WTDXCSH') and e.EntrustSortCode='001'
//                  and a.Number <> VerifyTotalAmount {0}
//              order by theDate  ";

//        private const string _SqlSelectBill =
//            @"select b.theDate, a.BillNo, a.RowNo, e.TheCode AdminAreaCode ,e.TheName AdminAreaName, 0 isVerification,
//                  a.ProductSortCode, (case when a.ProductSortCode = '001' then c.ModelCode else a.ProductCode end) ProductCode,
//                  a.Number, a.Number - isnull(a.VerifyTotalAmount,0) NotNumber
//              from tbSaleOutItem a 
//              left outer join tbSaleOut b on a.BillNo=b.BillNo 
//              left outer join vDatumProduct c on a.ProductCode=c.TheCode and a.ProductSortCode=c.ProductSort
//              left outer join vDatumMobileEntrust d on b.ClientCode=d.Clientcode and d.ClientSortCode=b.ClientType
//              left outer join tbDatumCityOpposite e on d.CCode=e.TheCode
//              where dbo.GetByteToBoolean(b.TheState,0x0001)=1 and b.AssistantCode in('WTDX','WTDXCSH') and e.EntrustSortCode='001'
//              and a.Number <> VerifyTotalAmount {0}
//              order by theDate ";

//        private void UpdateInvoice(SqlCommand cmd, DataRow row, decimal Amount)
//        {
//            string StrSql = @"Update tbSaleInvoiceItem set VerifyTotalAmount = VerifyTotalAmount + {0} where BillNo = '{1}' and RowNo = {2}";
//            cmd.CommandText = string.Format(StrSql, Amount, row["BillNo"], row["RowNo"]);
//            cmd.ExecuteNonQuery();
//        }

//        private void UpdateBill(SqlCommand cmd, DataRow row, decimal Amount, decimal SaleMoney)
//        {
//            string StrSql = @"Update tbSaleOutItem set VerifyTotalAmount = VerifyTotalAmount + {0},
//                                VerifyTotalSaleMoney = VerifyTotalSaleMoney + {3} where BillNo = '{1}' and RowNo = {2}";
//            cmd.CommandText = string.Format(StrSql, Amount, row["BillNo"], row["RowNo"], SaleMoney);
//            cmd.ExecuteNonQuery();
//        }

//        //isVerification:trueΪ������falseΪ������
//        public void VerificationDeal(Hashtable TableArg, bool isVerification, xzRemotingParam RemotingParam)
//        {
//            if (RemotingParam.ConnectionString != "") Connect.ConnectionString = RemotingParam.ConnectionString;
//            Connect.Open();
//            try
//            {
//                if (TableArg.Count == 0) xzException.WarnBox("��ѡ��Ʊ�򵥾�");
//                using (SqlCommand cmd = new SqlCommand())
//                using (SqlDataAdapter sqlda = new SqlDataAdapter())
//                using (DataTable dtInvoice = new DataTable(), dtBill = new DataTable())
//                {
//                    cmd.Connection = Connect;
//                    sqlda.SelectCommand = cmd;
//                    if (isVerification)
//                    {
//                        #region ���к���
//                        if (!TableArg.ContainsKey("Invoice"))
//                            xzException.WarnBox("δѡ�����۷�Ʊ��");

//                        DataTable dtSelectInvoice = TableArg["Invoice"] as DataTable;

//                        //DataTable dtSelectBill = TableArg["Bill"] as DataTable;
//                        //��ȡ�ͻ��˴��͵Ĺ�������
//                        string[] StrInvoice = TableArg["StrInvoice"] as string[];
//                        string[] StrBill = TableArg["StrBill"] as string[];

//                        #region ͨ����Ʊ�������۳���
//                        //��ȡԭ����¼
//                        cmd.CommandText = xzSqlAnalysis.getSqlCommandText(_SqlSelectInvoice, StrInvoice);
//                        sqlda.Fill(dtInvoice);
//                        cmd.CommandText = xzSqlAnalysis.getSqlCommandText(_SqlSelectBill, StrBill);
//                        sqlda.Fill(dtBill);


//                        //�õ�������
//                        HYVerificationManager FVerificationManager = new HYVerificationManager();
//                        FVerificationManager.Command = cmd;
//                        decimal VerifyNo = FVerificationManager.getVerifyLogNo(HYVerificationManager._SaleInvoice);

//                        SqlTransaction SqlTrans = Connect.BeginTransaction();
//                        try
//                        {
//                            cmd.Transaction = SqlTrans;
//                            foreach (DataRow SelectInvoice in dtSelectInvoice.Rows)
//                            {
//                                //�ͻ��˴���ķ�Ʊ������(�ڹ��������н���Է�Ʊ�ۼ�)
//                                decimal ClientInvoiceAmount = xzSqlAnalysis.getAbsValue(SelectInvoice["NotNumber"]);

//                                #region ����Ʊ��ÿһ�ų��ⵥ���й���
//                                DataRow[] InvoiceRows = dtInvoice.Select(string.Format("AdminAreaCode = '{0}' and ProductSortCode = '{1}' and ProductCode = '{2}'"
//                                    , SelectInvoice["AdminAreaCode"], SelectInvoice["ProductSortCode"], SelectInvoice["ProductCode"]));

//                                foreach (DataRow InvoiceRow in InvoiceRows)
//                                {
//                                    string InvoiceDate = InvoiceRow["TheDate"].ToString();                      //��Ʊ����
//                                    decimal InvoiceAmount = xzSqlAnalysis.getAbsValue(InvoiceRow["NotNumber"]); //���巢Ʊ��δ��������
//                                    decimal InvoicePrice = xzSqlAnalysis.getValue(InvoiceRow["FactPrice"]);     //��Ʊƽ����
//                                    decimal InvoiceNumber = xzSqlAnalysis.getAbsValue(InvoiceRow["Number"]);    //���巢Ʊ������
//                                    decimal InvoiceMoney = xzSqlAnalysis.getAbsValue(InvoiceRow["SaleMoney"]);  //���巢Ʊ�Ľ��

//                                    //������η�Ʊ�����ڹ���������
//                                    decimal VerifyInvoiceAmount = InvoiceAmount;
//                                    if (ClientInvoiceAmount < VerifyInvoiceAmount) VerifyInvoiceAmount = ClientInvoiceAmount;

//                                    decimal tmp_InvoiceAmount = VerifyInvoiceAmount; //��������Գ��ⵥ�����ķ�Ʊ����(�ڹ��������н���Գ����ۼ�)

//                                    #region ���۳��ⵥ��������
//                                    //Ϊ���������ķ�Ʊ�����ķ�Ʊ���� - ���ķ�Ʊ�븺�ĳ�����й���
//                                    bool isRed = (xzSqlAnalysis.getValue(InvoiceRow["Number"]) < 0m);
//                                    string BillSign = ">"; if (isRed) BillSign = "<";

//                                    DataRow[] BillRows = dtBill.Select(string.Format(@"isVerification = 0 and AdminAreaCode = '{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' and Number {3} 0"
//                                        , InvoiceRow["AdminAreaCode"], InvoiceRow["ProductSortCode"], InvoiceRow["ProductCode"], BillSign));

//                                    if (BillRows.Length <= 0) continue;  //�����۳�������,ִ����һ�ʷ�Ʊ�Ĺ�������
//                                    foreach (DataRow BillRow in BillRows)
//                                    {
//                                        //������γ�������ڹ���������
//                                        decimal BillAmount = xzSqlAnalysis.getAbsValue(BillRow["NotNumber"]);  //�������δ��������
//                                        if (tmp_InvoiceAmount < BillAmount)
//                                        {
//                                            BillRow["NotNumber"] = BillAmount - tmp_InvoiceAmount;
//                                            BillAmount = tmp_InvoiceAmount;
//                                        }
//                                        else
//                                        {
//                                            BillRow["NotNumber"] = 0;
//                                        }
//                                        if (Convert.ToInt32(BillRow["NotNumber"]) == 0) BillRow["isVerification"] = 1;

//                                        tmp_InvoiceAmount = tmp_InvoiceAmount - BillAmount;

//                                        decimal SaleMoney = InvoicePrice * BillAmount;  //��������ʹ�÷�Ʊ�ĵ���

//                                        //����β����
//                                        if (VerifyInvoiceAmount == InvoiceAmount && tmp_InvoiceAmount == 0)
//                                            SaleMoney = SaleMoney + (InvoiceMoney - InvoicePrice * InvoiceNumber);

//                                        if (isRed)
//                                        {
//                                            UpdateBill(cmd, BillRow, -BillAmount, -SaleMoney);
//                                            FVerificationManager.InsertVerifyLog(BillRow, HYVerificationManager._SaleOut
//                                                , HYVerificationManager._SaleOutName, VerifyNo, -BillAmount, InvoiceDate, -SaleMoney);
//                                        }
//                                        else
//                                        {
//                                            UpdateBill(cmd, BillRow, BillAmount, SaleMoney);
//                                            FVerificationManager.InsertVerifyLog(BillRow, HYVerificationManager._SaleOut
//                                                , HYVerificationManager._SaleOutName, VerifyNo, BillAmount, InvoiceDate, SaleMoney);
//                                        }
//                                        if (tmp_InvoiceAmount == 0) break;
//                                    }
//                                    #endregion

//                                    VerifyInvoiceAmount = VerifyInvoiceAmount - tmp_InvoiceAmount;
//                                    if (isRed)
//                                    {
//                                        UpdateInvoice(cmd, InvoiceRow, -VerifyInvoiceAmount);
//                                        FVerificationManager.InsertVerifyLog(InvoiceRow, HYVerificationManager._SaleInvoice
//                                            , HYVerificationManager._SaleInvoiceName, VerifyNo, -VerifyInvoiceAmount, InvoiceDate, 0);
//                                    }
//                                    else
//                                    {
//                                        UpdateInvoice(cmd, InvoiceRow, VerifyInvoiceAmount);
//                                        FVerificationManager.InsertVerifyLog(InvoiceRow, HYVerificationManager._SaleInvoice
//                                            , HYVerificationManager._SaleInvoiceName, VerifyNo, VerifyInvoiceAmount, InvoiceDate, 0);
//                                    }
//                                    VerifyNo++;

//                                    ClientInvoiceAmount = ClientInvoiceAmount - VerifyInvoiceAmount;
//                                    if (ClientInvoiceAmount == 0) break;
//                                }
//                                #endregion
//                            }

//                            SqlTrans.Commit();
//                        }
//                        catch (Exception err)
//                        {
//                            SqlTrans.Rollback();
//                            xzException.WarnBox(err.Message);
//                        }
//                        #endregion

//                        #region ͨ�����۳��⹴����Ʊ

//                        #endregion

//                        #region ���ѡ����й���

//                        #endregion
//                        #endregion
//                    }
//                    else
//                    {
//                        #region ȡ������
//                        if (!TableArg.ContainsKey("VerificationRecord"))
//                            xzException.WarnBox("δѡ�񹴻����ݣ�");
//                        DataTable dtVerificationRecord = TableArg["VerificationRecord"] as DataTable;

//                        ArrayList FList = new ArrayList();
//                        foreach (DataRow VerificationRow in dtVerificationRecord.Rows)
//                        {
//                            string VerifyNo = VerificationRow["VerifyNo"].ToString();
//                            if (!FList.Contains(VerifyNo)) FList.Add(VerifyNo);
//                        }

//                        dtVerificationRecord.Rows.Clear();
//                        cmd.CommandText = string.Format("select * from tbSaleInvoiceVerifyLog where VerifyNo in {0} and VerifySort in ('{1}', '{2}')"
//                            , xzSqlAnalysis.getListCause(FList), HYVerificationManager._SaleInvoice, HYVerificationManager._SaleOut);
//                        sqlda.Fill(dtVerificationRecord);

//                        HYVerificationManager FVerificationManager = new HYVerificationManager();
//                        FVerificationManager.Command = cmd;

//                        SqlTransaction SqlTrans = Connect.BeginTransaction();
//                        try
//                        {
//                            cmd.Transaction = SqlTrans;
//                            foreach (DataRow VerificationRow in dtVerificationRecord.Rows)
//                            {
//                                decimal Amount = xzSqlAnalysis.getValue(VerificationRow["Number"]);
//                                decimal SaleMoney = xzSqlAnalysis.getValue(VerificationRow["SaleMoney"]);
//                                string VerifySort = VerificationRow["VerifySort"].ToString();
//                                switch (VerifySort)
//                                {
//                                    case HYVerificationManager._SaleInvoice:
//                                        UpdateInvoice(cmd, VerificationRow, -Amount);
//                                        break;
//                                    case HYVerificationManager._SaleOut:
//                                        UpdateBill(cmd, VerificationRow, -Amount, -SaleMoney);
//                                        break;
//                                }
//                                FVerificationManager.DeleteVerifyLog(VerificationRow, VerifySort, xzSqlAnalysis.getValue(VerificationRow["VerifyNo"]));
//                            }
//                            SqlTrans.Commit();
//                        }
//                        catch (Exception err)
//                        {
//                            SqlTrans.Rollback();
//                            xzException.WarnBox(err.Message);
//                        }
//                        #endregion
//                    }
//                }
//            }
//            finally
//            {
//                Connect.Close();
//            }
//        }
//    }

    /// <summary>
    /// ���۷�Ʊ����[ί�д���-�ƶ�]
    /// </summary>
    public class SvrSaleVerificationMobile : SvrSystemDB, IServerSkedVerification
    {
        private const string _SqlSelectInvoice =
            @"select b.theDate, a.BillNo, a.RowNo, e.TheCode AdminAreaCode ,e.TheName AdminAreaName,a.FactPrice, SaleMoney,
                 a.ProductSortCode, a.ProductCode,
                 a.Number, a.Number - isnull(a.VerifyTotalAmount,0) NotNumber
              from tbSaleInvoiceItem a 
              left outer join tbSaleInvoice b on a.BillNo=b.BillNo 
              left outer join vDatumMobileEntrust d on b.ClientCode=d.Clientcode and d.ClientSortCode=b.ClientType
              left outer join tbDatumCityOpposite e on d.CCode=e.TheCode
              where b.InvoiceMode = '002' and dbo.GetByteToBoolean(b.TheState,0x0001)=1 and b.AssistantCode in('WTDX','WTDXCSH') and e.EntrustSortCode='001'
                  and a.Number <> VerifyTotalAmount {0}
              order by b.theDate  ";

        private const string _SqlSelectBill =
            @"select b.theDate, a.BillNo, a.RowNo, e.TheCode AdminAreaCode ,e.TheName AdminAreaName, 0 isVerification,
                  a.ProductSortCode, (case when a.ProductSortCode = '001' then c.ModelCode else a.ProductCode end) ProductCode,
                  a.Number, a.Number - isnull(a.VerifyTotalAmount,0) NotNumber
              from tbSaleOutItem a 
              left outer join tbSaleOut b on a.BillNo=b.BillNo 
              left outer join vDatumProduct c on a.ProductCode=c.TheCode and a.ProductSortCode=c.ProductSort
              left outer join vDatumMobileEntrust d on b.ClientCode=d.Clientcode and d.ClientSortCode=b.ClientType
              left outer join tbDatumCityOpposite e on d.CCode=e.TheCode
              where dbo.GetByteToBoolean(b.TheState,0x0001)=1 and b.AssistantCode in('WTDX','WTDXCSH') and e.EntrustSortCode='001'
              and a.Number <> VerifyTotalAmount {0}
              order by b.theDate ";

        private void UpdateInvoice(SqlCommand cmd, DataRow row, decimal Amount)
        {
            string StrSql = @"Update tbSaleInvoiceItem set VerifyTotalAmount = VerifyTotalAmount + {0} where BillNo = '{1}' and RowNo = {2}";
            cmd.CommandText = string.Format(StrSql, Amount,  row["BillNo"], row["RowNo"]);
            cmd.ExecuteNonQuery();
        }

        private void UpdateBill(SqlCommand cmd, DataRow row, decimal Amount,decimal SaleMoney)
        {
            string StrSql = @"Update tbSaleOutItem set VerifyTotalAmount = VerifyTotalAmount + {0},
                                VerifyTotalSaleMoney = VerifyTotalSaleMoney + {3} where BillNo = '{1}' and RowNo = {2}";
            cmd.CommandText = string.Format(StrSql, Amount, row["BillNo"], row["RowNo"], SaleMoney);
            cmd.ExecuteNonQuery();
        }

        //isVerification:trueΪ������falseΪ������
        public void VerificationDeal(Hashtable TableArg, bool isVerification, xzRemotingParam RemotingParam)     
        {
            if (RemotingParam.ConnectionString != "") Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {                
                if (TableArg.Count == 0) xzException.WarnBox("��ѡ��Ʊ�򵥾�");
                using (SqlCommand cmd = new SqlCommand())
                using (SqlDataAdapter sqlda = new SqlDataAdapter())
                using (DataTable dtInvoice = new DataTable(), dtBill = new DataTable())
                {
                    cmd.Connection = Connect;
                    sqlda.SelectCommand = cmd;
                    if (isVerification)
                    {
                        #region ���к���
                        if (!TableArg.ContainsKey("Invoice"))
                            xzException.WarnBox("δѡ�����۷�Ʊ��");

                        DataTable dtSelectInvoice = TableArg["Invoice"] as DataTable;

                        //DataTable dtSelectBill = TableArg["Bill"] as DataTable;
                        //��ȡ�ͻ��˴��͵Ĺ�������
                        string[] StrInvoice = TableArg["StrInvoice"] as string[];
                        string[] StrBill = TableArg["StrBill"] as string[];

                        #region ͨ����Ʊ�������۳���
                        //��ȡԭ����¼
                        cmd.CommandText = xzSqlAnalysis.getSqlCommandText(_SqlSelectInvoice, StrInvoice);
                        sqlda.Fill(dtInvoice);
                        cmd.CommandText = xzSqlAnalysis.getSqlCommandText(_SqlSelectBill, StrBill);
                        sqlda.Fill(dtBill);


                        //�õ�������
                        HYVerificationManager FVerificationManager = new HYVerificationManager();
                        FVerificationManager.Command = cmd;
                        decimal VerifyNo = FVerificationManager.getVerifyLogNo(HYVerificationManager._SaleInvoice);

                        SqlTransaction SqlTrans = Connect.BeginTransaction();
                        try
                        {
                            cmd.Transaction = SqlTrans;
                            foreach (DataRow SelectInvoice in dtSelectInvoice.Rows)
                            {
                                //�ͻ��˴���ķ�Ʊ������(�ڹ��������н���Է�Ʊ�ۼ�)
                                decimal ClientInvoiceAmount = xzSqlAnalysis.getValue(SelectInvoice["NotNumber"]);

                                #region ����Ʊ��ÿһ�ų��ⵥ���й���
                                DataRow[] InvoiceRows = dtInvoice.Select(string.Format("AdminAreaCode = '{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' and NotNumber<>0"
                                    , SelectInvoice["AdminAreaCode"], SelectInvoice["ProductSortCode"], SelectInvoice["ProductCode"]), "theDate");

                                foreach (DataRow InvoiceRow in InvoiceRows)
                                {
                                    string InvoiceDate = InvoiceRow["TheDate"].ToString();                      //��Ʊ����
                                    decimal InvoiceAmount = xzSqlAnalysis.getValue(InvoiceRow["NotNumber"]); //���巢Ʊ��δ��������
                                    decimal InvoicePrice = xzSqlAnalysis.getValue(InvoiceRow["FactPrice"]);     //��Ʊƽ����
                                    decimal InvoiceNumber = xzSqlAnalysis.getValue(InvoiceRow["Number"]);    //���巢Ʊ������
                                    decimal InvoiceMoney = xzSqlAnalysis.getValue(InvoiceRow["SaleMoney"]);  //���巢Ʊ�Ľ��

                                    //������η�Ʊ�����ڹ���������
                                    decimal VerifyInvoiceAmount = InvoiceAmount; 
                                    if ((Math.Abs(ClientInvoiceAmount) < Math.Abs(VerifyInvoiceAmount)) && (Math.Sign(ClientInvoiceAmount) * Math.Sign(VerifyInvoiceAmount) > 0)) VerifyInvoiceAmount = ClientInvoiceAmount;                                   

                                    decimal tmp_InvoiceAmount = VerifyInvoiceAmount; //��������Գ��ⵥ�����ķ�Ʊ����(�ڹ��������н���Գ����ۼ�)

                                    #region ���۳��ⵥ��������
                                    //Ϊ���������ķ�Ʊ�����ķ�Ʊ���� - ���ķ�Ʊ�븺�ĳ�����й���

                                    DataRow[] BillRows = dtBill.Select(string.Format(@"isVerification = 0 and AdminAreaCode = '{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' and NotNumber<>0"
                                        , InvoiceRow["AdminAreaCode"], InvoiceRow["ProductSortCode"], InvoiceRow["ProductCode"]), "theDate");

                                    if (BillRows.Length <= 0) continue;  //�����۳�������,ִ����һ�ʷ�Ʊ�Ĺ�������
                                    foreach (DataRow BillRow in BillRows)
                                    {
                                        //������γ�������ڹ���������
                                        decimal BillAmount = xzSqlAnalysis.getValue(BillRow["NotNumber"]);  //�������δ��������
                                        //�����Ƿ񹳻����,��ҪĿ�Ľ�����۳��ⵥ��β������.
                                        int isVerify = 0;
                                        //ͬ���ҹ�����С�ڵ��ݵĿɹ�����
                                        if ((Math.Abs(tmp_InvoiceAmount) < Math.Abs(BillAmount)) && (Math.Sign(tmp_InvoiceAmount) * Math.Sign(BillAmount) > 0))
                                        {
                                            BillRow["NotNumber"] = BillAmount - tmp_InvoiceAmount;
                                            BillAmount = tmp_InvoiceAmount;
                                        }
                                        else
                                        {
                                            BillRow["NotNumber"] = 0;
                                            isVerify = 1;
                                        }
                                        if(Convert.ToInt32(BillRow["NotNumber"]) == 0) BillRow["isVerification"] = 1;

                                        tmp_InvoiceAmount = tmp_InvoiceAmount - BillAmount;

                                        decimal SaleMoney = InvoicePrice * BillAmount;  //��������ʹ�÷�Ʊ�ĵ���

                                        //����β����
                                        if (VerifyInvoiceAmount == InvoiceAmount && tmp_InvoiceAmount == 0)
                                            SaleMoney = SaleMoney + (InvoiceMoney - InvoicePrice * InvoiceNumber);

                                        UpdateBill(cmd, BillRow, BillAmount, SaleMoney);
                                        FVerificationManager.InsertVerifyLog(BillRow, HYVerificationManager._SaleOut
                                            , HYVerificationManager._SaleOutName, VerifyNo, BillAmount, InvoiceDate, SaleMoney, isVerify);
                                        if (tmp_InvoiceAmount == 0) break;
                                    }
                                    #endregion

                                    VerifyInvoiceAmount = VerifyInvoiceAmount - tmp_InvoiceAmount;

                                    if ((Math.Sign(VerifyInvoiceAmount) * Math.Sign(InvoiceNumber) < 0))
                                    {
                                        xzException.WarnBox("���ȶԷ�Ʊ�ĺ쵥���к���!");
                                        return;//�쳣�˳�
                                    }
                                    //�����Ƿ񹳻����,��ҪĿ�Ľ�����۳��ⵥ��β������.
                                    int InvoiceisVerify = 0;
                                    if (tmp_InvoiceAmount == 0) InvoiceisVerify = 1;

                                    UpdateInvoice(cmd, InvoiceRow, VerifyInvoiceAmount);
                                    FVerificationManager.InsertVerifyLog(InvoiceRow, HYVerificationManager._SaleInvoice
                                        , HYVerificationManager._SaleInvoiceName, VerifyNo, VerifyInvoiceAmount, InvoiceDate, 0, InvoiceisVerify);
                                    VerifyNo++;

                                    ClientInvoiceAmount = ClientInvoiceAmount - VerifyInvoiceAmount;
                                    if (ClientInvoiceAmount == 0) break;
                                }
                                #endregion
                            }

                            SqlTrans.Commit();
                        }
                        catch (Exception err)
                        {
                            SqlTrans.Rollback();
                            xzException.WarnBox(err.Message);
                        }
                        #endregion

                        #region ͨ�����۳��⹴����Ʊ

                        #endregion

                        #region ���ѡ����й���

                        #endregion
                        #endregion
                    }
                    else
                    {
                        #region ȡ������
                        if (!TableArg.ContainsKey("VerificationRecord"))
                            xzException.WarnBox("δѡ�񹴻����ݣ�");
                        DataTable dtVerificationRecord = TableArg["VerificationRecord"] as DataTable;

                        ArrayList FList = new ArrayList();
                        foreach (DataRow VerificationRow in dtVerificationRecord.Rows)
                        {
                            string VerifyNo = VerificationRow["VerifyNo"].ToString();
                            if (!FList.Contains(VerifyNo)) FList.Add(VerifyNo);
                        }

                        dtVerificationRecord.Rows.Clear();
                        cmd.CommandText = string.Format("select * from tbSaleInvoiceVerifyLog where VerifyNo in {0} and VerifySort in ('{1}', '{2}')"
                            , xzSqlAnalysis.getListCause(FList), HYVerificationManager._SaleInvoice, HYVerificationManager._SaleOut);
                        sqlda.Fill(dtVerificationRecord);

                        HYVerificationManager FVerificationManager = new HYVerificationManager();
                        FVerificationManager.Command = cmd;

                        SqlTransaction SqlTrans = Connect.BeginTransaction();
                        try
                        {
                            cmd.Transaction = SqlTrans;
                            foreach (DataRow VerificationRow in dtVerificationRecord.Rows)
                            {
                                decimal Amount = xzSqlAnalysis.getValue(VerificationRow["Number"]);
                                decimal SaleMoney = xzSqlAnalysis.getValue(VerificationRow["SaleMoney"]);
                                string VerifySort = VerificationRow["VerifySort"].ToString();
                                switch (VerifySort)
                                {
                                    case HYVerificationManager._SaleInvoice:
                                        UpdateInvoice(cmd, VerificationRow, -Amount);
                                        break;
                                    case HYVerificationManager._SaleOut:
                                        UpdateBill(cmd, VerificationRow, -Amount, -SaleMoney);
                                        break;
                                }
                                FVerificationManager.DeleteVerifyLog(VerificationRow, VerifySort, xzSqlAnalysis.getValue(VerificationRow["VerifyNo"]));
                            }
                            SqlTrans.Commit();
                        }
                        catch (Exception err)
                        {
                            SqlTrans.Rollback();
                            xzException.WarnBox(err.Message);
                        }
                        #endregion
                    }
                }
            }
            finally
            {
                Connect.Close();
            }
        }
    }

    /// <summary>
    /// ���۴��Ź���[ί�д���-�ƶ�]
    /// </summary>
    public class SvrSaleVerificationMobileList : SvrSystemDB, IServerSkedVerification, IServerSkedUserExecEx
    {        
        private int UpdateMobileRecord(SqlCommand cmd, object ProductCode, object ListNo
            , object BillNo, object RowNo, object DetailNo)
        {
            string StrSql = @"declare @Count int, @VerifyNo int, @TheTime datetime                
                set @Count=0
                select @VerifyNo=max(isnull(VerifyNo,0))+1 from tbSaleOutItemDetail
                if exists(select 1 from tbSaleOutMobileExcel where ProductCode='{0}' and ListNo='{1}' and IsVerify <> 0)
                begin
                  goto Ex1 
                end
                if exists(select 1 from tbSaleOutItemDetail where BillNo='{2}' and RowNo={3} and DetailNo={4} and IsVerify <> 0)
                begin
                  goto Ex2 
                end
                set @TheTime = getDate()
                update tbSaleOutMobileExcel set IsVerify=1,VerifyNo=@VerifyNo,VerifyDate=@TheTime where ProductCode='{0}' and ListNo='{1}'
                set @Count=@Count+@@rowcount
                update tbSaleOutItemDetail set IsVerify=1,VerifyNo=@VerifyNo,VerifyDate=@TheTime where BillNo='{2}' and RowNo={3} and DetailNo={4}
                select @Count+@@rowcount
                return 
                Ex1:
                begin
                  select -1
                  return 
                end 
                Ex2:
                begin
                  select -2
                  return 
                end";
            cmd.CommandText = string.Format(StrSql, ProductCode, ListNo, BillNo, RowNo, DetailNo);
            return (int)(xzSqlAnalysis.getValue(cmd.ExecuteNonQuery()));
        }

        private int UnUpdateMobileRecord(SqlCommand cmd, DataRow MobileRow, DataRow SaleOutRow)
        {
            string StrSql = @"declare @Count int, @TheTime datetime                
                set @Count=0
                if exists(select 1 from tbSaleOutMobileExcel where ProductCode='{0}' and ListNo='{1}' and IsVerify = 0)
                begin
                  goto Ex1 
                end
                if exists(select 1 from tbSaleOutItemDetail where BillNo='{2}' and RowNo={3} and DetailNo={4} and IsVerify = 0)
                begin
                  goto Ex2 
                end
                set @TheTime = getDate()
                update tbSaleOutMobileExcel set IsVerify=0,VerifyNo=null,VerifyDate=null where ProductCode='{0}' and ListNo='{1}'
                set @Count=@Count+@@rowcount
                update tbSaleOutItemDetail set IsVerify=0,VerifyNo=null,VerifyDate=null where BillNo='{2}' and RowNo={3} and DetailNo={4}
                select @Count+@@rowcount
                return 
                Ex1:
                begin
                  select -1
                  return 
                end 
                Ex2:
                begin
                  select -2
                  return 
                end";
            cmd.CommandText = string.Format(StrSql, MobileRow["ProductCode"], MobileRow["ListNo"],
                SaleOutRow["BillNo"], SaleOutRow["RowNo"], SaleOutRow["DetailNo"]);
            return (int)(xzSqlAnalysis.getValue(cmd.ExecuteNonQuery()));
        }

        private int UpdateSaleOutRedRecord(SqlCommand cmd, object BillNoRed, object RowNoRed, object DetailNoRed
             , object BillNo, object RowNo, object DetailNo)
        {
            string StrSql = @"declare @Count int, @VerifyNo int, @TheTime datetime                
                set @Count=0
                select @VerifyNo=max(isnull(VerifyNo,0))+1 from tbSaleOutItemDetail
                if exists(select 1 from tbSaleOutItemDetail where BillNo='{0}' and RowNo={1} and DetailNo={2} and IsVerify <> 0)
                begin
                  goto Ex1 
                end
                if exists(select 1 from tbSaleOutItemDetail where BillNo='{3}' and RowNo={4} and DetailNo={5} and IsVerify <> 0)
                begin
                  goto Ex2 
                end
                set @TheTime = getDate()
                update tbSaleOutItemDetail set IsVerify=2,VerifyNo=@VerifyNo,VerifyDate=@TheTime where BillNo='{0}' and RowNo={1} and DetailNo={2}
                set @Count=@Count+@@rowcount
                update tbSaleOutItemDetail set IsVerify=2,VerifyNo=@VerifyNo,VerifyDate=@TheTime where BillNo='{3}' and RowNo={4} and DetailNo={5}
                select @Count+@@rowcount
                return 
                Ex1:
                begin
                  select -1
                  return 
                end 
                Ex2:
                begin
                  select -2
                  return 
                end";
            cmd.CommandText = string.Format(StrSql, BillNoRed, RowNoRed, DetailNoRed, BillNo, RowNo, DetailNo);
            return (int)(xzSqlAnalysis.getValue(cmd.ExecuteNonQuery()));
        }

        private int UnUpdateSaleOutRedRecord(SqlCommand cmd, DataRow SaleOutRedRow, DataRow SaleOutRow)
        {
            string StrSql = @"declare @Count int, @TheTime datetime
                set @Count=0
                if exists(select 1 from tbSaleOutItemDetail where BillNo='{0}' and RowNo={1} and DetailNo={2} and IsVerify = 0)
                begin
                  goto Ex1 
                end
                if exists(select 1 from tbSaleOutItemDetail where BillNo='{3}' and RowNo={4} and DetailNo={5} and IsVerify = 0)
                begin
                  goto Ex2 
                end
                set @TheTime = getDate()
                update tbSaleOutItemDetail set IsVerify=0,VerifyNo=null,VerifyDate=null where BillNo='{0}' and RowNo={1} and DetailNo={2}
                set @Count=@Count+@@rowcount
                update tbSaleOutItemDetail set IsVerify=0,VerifyNo=null,VerifyDate=null where BillNo='{3}' and RowNo={4} and DetailNo={5}
                select @Count+@@rowcount
                return 
                Ex1:
                begin
                  select -1
                  return 
                end 
                Ex2:
                begin
                  select -2
                  return 
                end";
            cmd.CommandText = string.Format(StrSql, SaleOutRedRow["BillNo"], SaleOutRedRow["RowNo"], SaleOutRedRow["DetailNo"],
                SaleOutRow["BillNo"], SaleOutRow["RowNo"], SaleOutRow["DetailNo"]);
            return (int)(xzSqlAnalysis.getValue(cmd.ExecuteNonQuery()));
        }

        private void isVerify(DataTable dtSource, DataTable dtSaleOut)
        {
            if (dtSource.Rows.Count != 1 || dtSaleOut.Rows.Count != 1)
                xzException.WarnBox("��ѡ��������Ӧ�ļ�¼");
        }

        public void VerificationDeal(Hashtable TableArg, bool isVerification, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "") 
                Connect.ConnectionString = RemotingParam.ConnectionString;

            SqlTransaction SqlTrans = null;
            Connect.Open();
            try
            {
                using (SqlCommand FCommand = new SqlCommand())
                {
                    FCommand.Connection = Connect;
                    if (isVerification)
                    {
                        #region ���Ž��к���
                        bool isMobileExcel =  TableArg.ContainsKey("MobileExcel");
                        bool isSaleOutRed = TableArg.ContainsKey("SaleOutRed");
                        if (!(isMobileExcel ^ isSaleOutRed))
                            xzException.WarnBox("���۳���[�쵥]���ƶ��ۻ�������ͬʱû��ѡ��Ҳ����ͬʱû��ѡ��");

                        DataTable dtMobileExcel = null;
                        if (isMobileExcel) dtMobileExcel = TableArg["MobileExcel"] as DataTable;
                        DataTable dtSaleOutRed = null;
                        if (isSaleOutRed) dtSaleOutRed = TableArg["SaleOutRed"] as DataTable;

                        DataTable dtSaleOut = null;
                        if (TableArg.ContainsKey("SaleOut")) dtSaleOut = TableArg["SaleOut"] as DataTable;

                        if (dtSaleOut != null)
                        {
                            #region �ֶ�����
                            SqlTrans = Connect.BeginTransaction();
                            try
                            {
                                FCommand.Transaction = SqlTrans;
                                int iState = 0;
                                DataRow SaleOutRow = dtSaleOut.Rows[0];

                                #region �ƶ�����
                                if (isMobileExcel)
                                {
                                    isVerify(dtMobileExcel, dtSaleOut);
                                    DataRow MobileRow = dtMobileExcel.Rows[0];
                                    iState = UpdateMobileRecord(FCommand, MobileRow["ProductCode"], MobileRow["ListNo"]
                                        , SaleOutRow["BillNo"], SaleOutRow["RowNo"], SaleOutRow["DetailNo"]);
                                }
                                #endregion

                                #region ���ۺ�������
                                if (isSaleOutRed)
                                {
                                    isVerify(dtSaleOutRed, dtSaleOut);
                                    DataRow SaleOutRedRow = dtSaleOutRed.Rows[0];
                                    iState = UpdateSaleOutRedRecord(FCommand, SaleOutRedRow["BillNo"], SaleOutRedRow["RowNo"], SaleOutRedRow["DetailNo"]
                                        , SaleOutRow["BillNo"], SaleOutRow["RowNo"], SaleOutRow["DetailNo"]);
                                }
                                #endregion

                                switch (iState)
                                {
                                    case -1:
                                    case -2:
                                        xzException.WarnBox("�����ѹ����ļ�¼��");
                                        break;
                                    case 2:
                                        break;
                                    default:
                                        xzException.WarnBox("�������磡");
                                        break;
                                }
                                SqlTrans.Commit();
                            }
                            catch (Exception ex)
                            {
                                SqlTrans.Rollback();
                                xzException.WarnBox(ex.Message);
                            }
                            #endregion
                        }
                        else
                        {
                            #region �Զ�����
                            //����ﵽ����������
                            Hashtable htVerification = new Hashtable();
                            string strMessage = "";

                            #region �ƶ�����
                            if (isMobileExcel)
                            {
                                foreach (DataRow MobileRow in dtMobileExcel.Rows)
                                {
                                    FCommand.CommandText = string.Format(@"select top 1 a.BillNo,a.RowNo,a.DetailNo
                                                   from tbSaleOutItemDetail a
                                    Left Outer Join tbSaleOut b on a.BillNo = b.BillNo
                                      where a.ProductSortCode = '001' and a.ListNo ='{0}' and a.IsVerify = 0 and dbo.GetByteToBoolean(b.UseState,0x0001)=0
                                    order by b.theDate desc", MobileRow["ListNo"]);
                                    using (SqlDataReader Reader = FCommand.ExecuteReader())
                                    {
                                        if (Reader.Read())
                                        {
                                            string key = string.Format("{0}\r{1}", MobileRow["ProductCode"], MobileRow["ListNo"]);
                                            string value = string.Format("{0}\r{1}\r{2}", Reader["BillNo"], Reader["RowNo"], Reader["DetailNo"]);
                                            htVerification.Add(key, value);
                                        }
                                        else strMessage += string.Format("����[{0}]û����ص����۳���\n", MobileRow["ListNo"]);
                                        Reader.Close();
                                    }
                                }
                            }
                            #endregion

                            #region ���ۺ�������
                            if (isSaleOutRed)
                            {
                                foreach (DataRow SaleOutRedRow in dtSaleOutRed.Rows)
                                {
                                    FCommand.CommandText = string.Format(@"select top 1 a.BillNo,a.RowNo,a.DetailNo
                                                   from tbSaleOutItemDetail a
                                    Left Outer Join tbSaleOut b on a.BillNo = b.BillNo
                                      where a.ProductSortCode = '001' and a.ListNo ='{0}' and a.IsVerify = 0 and dbo.GetByteToBoolean(b.UseState,0x0001)=0
                                    order by b.theDate desc", SaleOutRedRow["ListNo"]);
                                    using (SqlDataReader Reader = FCommand.ExecuteReader())
                                    {
                                        if (Reader.Read())
                                        {
                                            string key = string.Format("{0}\r{1}\r{2}", SaleOutRedRow["BillNo"], SaleOutRedRow["RowNo"], SaleOutRedRow["DetailNo"]);
                                            string value = string.Format("{0}\r{1}\r{2}", Reader["BillNo"], Reader["RowNo"], Reader["DetailNo"]);
                                            htVerification.Add(key, value);
                                        }
                                        else strMessage += string.Format("����[{0}]û����ص����ۺ�����������\n", SaleOutRedRow["ListNo"]);
                                        Reader.Close();
                                    }
                                }
                            }
                            #endregion

                            //����Զ�����                            
                            SqlTrans = Connect.BeginTransaction();
                            try
                            {
                                FCommand.Transaction = SqlTrans;
                                foreach (string key in htVerification.Keys)
                                {
                                    string[] keys = key.Split('\r');
                                    string[] values = (htVerification[key].ToString()).Split('\r');
                                    int iState = 0;

                                    #region �ƶ�����
                                    if (isMobileExcel) iState = UpdateMobileRecord(FCommand, keys[0], keys[1], values[0], values[1], values[2]);
                                    #endregion

                                    #region ���ۺ�������
                                    if (isSaleOutRed) iState = UpdateSaleOutRedRecord(FCommand, keys[0], keys[1], keys[2], values[0], values[1], values[2]);
                                    #endregion

                                    switch (iState)
                                    {
                                        case -1:
                                        case -2:
                                            xzException.WarnBox("�����ѹ����ļ�¼��");
                                            break;
                                        case 2:
                                            break;
                                        default:
                                            xzException.WarnBox("�������磡");
                                            break;
                                    }
                                }
                                SqlTrans.Commit();                                
                            }
                            catch (Exception ex)
                            {
                                SqlTrans.Rollback();
                                xzException.WarnBox(ex.Message);
                            }
                            if (strMessage != "") xzException.WarnBox(strMessage);
                            #endregion
                        }
                        #endregion
                    }
                    else
                    {
                        #region ��Ʊ����ȡ������
                        if (!TableArg.ContainsKey("VerificationRecord"))
                            xzException.WarnBox("δѡ�񹴻����ݣ�");
                        DataTable dtVerificationRecord = TableArg["VerificationRecord"] as DataTable;
                        if (dtVerificationRecord.Rows.Count != 2) 
                            xzException.WarnBox("��ѡ��������Ӧ�ļ�¼");
                        DataRow MobileRow = null, SaleOutRow = null, SaleOutRedRow = null;
                        foreach (DataRow CurrRow in dtVerificationRecord.Rows)
                        {
                            switch (CurrRow["BillSort"].ToString())
                            {
                                case "�ƶ��ۻ�":
                                    MobileRow = CurrRow;
                                    break;
                                case "���۳���[�쵥]":
                                    SaleOutRedRow = CurrRow;
                                    break;
                                case "���۳���[����]":
                                    SaleOutRow = CurrRow;
                                    break;
                            }
                        }

                        if ((MobileRow == null && SaleOutRedRow == null) || SaleOutRow == null)
                            xzException.WarnBox("��ѡ��������Ӧ�ļ�¼");
                        bool isMobileExcel = MobileRow != null;
                        bool isSaleOutRed = SaleOutRedRow != null;

                        SqlTrans = Connect.BeginTransaction();
                        try
                        {
                            FCommand.Transaction = SqlTrans;
                            int iState = 0;
                            #region �ƶ�����
                            if (isMobileExcel)
                            {
                                if (Convert.ToInt32(MobileRow["VerifyNo"]) != Convert.ToInt32(SaleOutRow["VerifyNo"]))
                                    xzException.WarnBox("��ѡ��������Ӧ�ļ�¼");
                                iState = UnUpdateMobileRecord(FCommand, MobileRow, SaleOutRow);
                            }
                            #endregion

                            #region ���ۺ�������
                            if (isSaleOutRed)
                            {
                                if (Convert.ToInt32(SaleOutRedRow["VerifyNo"]) != Convert.ToInt32(SaleOutRow["VerifyNo"]))
                                    xzException.WarnBox("��ѡ��������Ӧ�ļ�¼");
                                iState = UnUpdateSaleOutRedRecord(FCommand, SaleOutRedRow, SaleOutRow);
                            }
                            #endregion

                            switch (iState)
                            {
                                case -1:
                                case -2:
                                    xzException.WarnBox("���ڵļ�¼δ������");
                                    break;
                                case 2:
                                    break;
                                default:
                                    xzException.WarnBox("�������磡");
                                    break;
                            }
                            SqlTrans.Commit();
                        }
                        catch (Exception ex)
                        {
                            SqlTrans.Rollback();
                            xzException.WarnBox(ex.Message);
                        }
                        #endregion
                    }
                }
            }
            finally
            {
                Connect.Close();
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
                switch (ID)
                {
                    case 0:
                        #region ɾ���ƶ��ۻ���Ϣ
                        using (SqlCommand FCommand = new SqlCommand())
                        {
                            SqlTransaction  SqlTrans = Connect.BeginTransaction();
                            try
                            {
                                FCommand.Connection = Connect;
                                FCommand.Transaction = SqlTrans;
                                DataTable Table = ht[0] as DataTable;
                                foreach (DataRow CurrRow in Table.Rows)
                                {
                                    FCommand.CommandText = string.Format("delete tbSaleOutMobileExcel where ProductCode= '{0}' and ListNo = '{1}'"
                                        , CurrRow["ProductCode"], CurrRow["ListNo"]);
                                    FCommand.ExecuteNonQuery();
                                }
                                SqlTrans.Commit();
                            }
                            catch (Exception ex)
                            {
                                SqlTrans.Rollback();
                                xzException.WarnBox(ex.Message);
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
            return haReturn;
        }
    }

    public class SvrSaleListImput : SvrSystemImput
    {
        public override Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            if (ID < 6) return base.getUserHashtable(ht, ID, RemotingParam);

            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            Hashtable haResult = new Hashtable();
            Connect.Open();
            try
            {
                switch (ID)
                {
                    case 6:
                        ArrayList MobileArg = new ArrayList(), ImputArg = new ArrayList();
                        using (SqlDataAdapter da = new SqlDataAdapter())
                        using (SqlCommand FCommand = new SqlCommand())
                        using (DataTable MobileTable = new DataTable())
                        {                            
                            FCommand.Connection = Connect;
                            FCommand.CommandText = string.Format(@"select ListNo from tbSaleOutMobileExcel
                               where SaleDate >= '{0}' and SaleDate <= '{1}'", ht[2], ht[3]);
                            da.SelectCommand = FCommand;
                            da.Fill(MobileTable);
                            foreach (DataRow row in MobileTable.Rows)
                                MobileArg.Add(row["ListNo"].ToString());
                        }

                        #region δ�����������
                        DataTable ImputTable = ht[0] as DataTable;
                        DataTable ResultImputTable = ImputTable.Clone();
                        foreach (DataColumn Column in ResultImputTable.Columns)
                        {
                            switch (Column.ColumnName)
                            {
                                case "ProductCode":
                                    Column.Caption = "Ʒ��";
                                    break;
                                case "ProductName":
                                    Column.Caption = "Ʒ��";
                                    break;
                                case "ListNo":
                                    Column.Caption = "����";
                                    break;
                            }
                        }
                        foreach (DataRow Row in ImputTable.Rows)
                        {
                            string ListNo = Row["ListNo"].ToString();
                            ImputArg.Add(ListNo);
                            if (!MobileArg.Contains(ListNo))
                                ResultImputTable.ImportRow(Row);
                        }
                        haResult.Add(1, ResultImputTable);
                        #endregion

                        #region ���������������
                        DataTable ResultMobileTable = new DataTable();
                        DataColumn MobileColumn = ResultMobileTable.Columns.Add();
                        MobileColumn.ColumnName = "ListNo";
                        MobileColumn.Caption = "����";
                        foreach (string ListNo in MobileArg)
                        {
                            if (!ImputArg.Contains(ListNo))
                            {
                                DataRow Row = ResultMobileTable.NewRow();
                                Row["ListNo"] = ListNo;
                                ResultMobileTable.Rows.Add(Row);
                            }
                        }
                        haResult.Add(0, ResultMobileTable);
                        #endregion
                        break;
                }
            }
            finally
            {
                Connect.Close();
            }
            return haResult;
        }
    }

    /// <summary>
    /// �ɹ���Ʊ����
    /// </summary>
    public class SvrStockInvoiceVerify : SvrSystemDB, IServerSkedVerification
    {
        public void VerificationDeal(Hashtable TableArg, bool isVerification, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "") Connect.ConnectionString = RemotingParam.ConnectionString;
            Connect.Open();
            try
            {
                if (TableArg.Count == 0)
                {
                    xzException.WarnBox("��ѡ��Ʊ�򵥾�");
                }

                string sql = null;
                SqlCommand cmd = new SqlCommand(sql, Connect);
                SqlDataReader sdr = null;
                DataTable dtInvoice = null, dtBill = null;

                if (isVerification)
                {
                    dtInvoice = TableArg["Invoice"] as DataTable;
                    dtBill = TableArg["Bill"] as DataTable;
                    if (dtInvoice.Rows.Count == 0)
                    {
                        xzException.WarnBox("�޶�Ӧ��Ʊ��Ϣ");
                    }
                    if (dtBill.Rows.Count == 0)
                    {
                        xzException.WarnBox("�޶�Ӧ�����Ϣ");
                    }

                    #region �жϹ�Ӧ�����Ʒ�Ƿ��Ӧ����������
                    Hashtable TmphtInvoice = new Hashtable(), TmphtBill = new Hashtable();
                    string TmpKey = "";
                    int TmpAmount = 0;
                    foreach (DataRow TmpDr in dtInvoice.Rows)
                    {
                        TmpKey = string.Format("��Ӧ��Ϊ<{0}>,��ƷΪ<{1}>��������", TmpDr["ClientName"], TmpDr["ProductName"]);
                        if (!TmphtInvoice.ContainsKey(TmpKey))
                        {
                            TmphtInvoice.Add(TmpKey, TmpDr["NowAmount"]);
                        }
                        else
                        {
                            TmpAmount = Convert.ToInt32(TmphtInvoice[TmpKey]) + Convert.ToInt32(TmpDr["NowAmount"]);
                            TmphtInvoice.Remove(TmpKey);
                            TmphtInvoice.Add(TmpKey, TmpAmount);
                        }
                    }
                    foreach (DataRow TmpDr in dtBill.Rows)
                    {
                        TmpKey = string.Format("��Ӧ��Ϊ<{0}>,��ƷΪ<{1}>��������", TmpDr["ClientName"], TmpDr["ProductName"]);
                        if (!TmphtBill.ContainsKey(TmpKey))
                        {
                            TmphtBill.Add(TmpKey, TmpDr["NowAmount"]);
                        }
                        else
                        {
                            TmpAmount = Convert.ToInt32(TmphtBill[TmpKey]) + Convert.ToInt32(TmpDr["NowAmount"]);
                            TmphtBill.Remove(TmpKey);
                            TmphtBill.Add(TmpKey, TmpAmount);
                        }
                    }

                    string strException = "";
                    bool notBillHas, notInvoiceHas;
                    foreach (string str1 in TmphtInvoice.Keys)
                    {
                        notBillHas = false;
                        foreach (string str2 in TmphtBill.Keys)
                        {
                            if (str2 == str1)
                            {
                                notBillHas = true;
                                if (Convert.ToInt32(TmphtBill[str2]) != Convert.ToInt32(TmphtInvoice[str1]))
                                {
                                    strException += "��Ʊ��Ϣ�У�" + str1 + TmphtInvoice[str1].ToString() + "\n" +
                                        "�����Ϣ�У�" + str2 + TmphtBill[str2].ToString() + "\n\n";
                                }
                                break;
                            }
                            notInvoiceHas = false;
                            foreach (string str3 in TmphtInvoice.Keys)
                            {
                                if (str3 == str2)
                                {
                                    notInvoiceHas = true;
                                    break;
                                }
                            }
                            if (!notInvoiceHas)
                            {
                                strException += "��������Ӧ�ķ�Ʊ��Ϣ" + "\n" +
                                    "�����Ϣ�У�" + str2 + TmphtBill[str2].ToString() + "\n\n";
                            }
                        }
                        if (!notBillHas)
                        {
                            strException += "��Ʊ��Ϣ�У�" + str1 + TmphtInvoice[str1].ToString() + "\n" +
                                "��������Ӧ�������Ϣ" + "\n\n";
                        }
                    }
                    if (strException != "")
                    {
                        strException += "��Ʊ�����������������������ʧ�ܡ�";
                        xzException.WarnBox(strException);
                    }
                    #endregion

                    string VerifySort, BillSort, BillNo, RowNo, BillDate, TheDate, ClientSort, ClientCode, ProductSort, ProductCode;
                    int VerifyNo, NowAmount, TotalAmount, OddAmount;
                    double NowCostMoney, NowMoney, TotalCostMoney, TotalMoney, OddCostMoney, OddMoney;

                    VerifySort = "StockInvoiceVerify";
                    cmd.CommandText = string.Format("select isnull(max(VerifyNo),0) from tsSystemVerifyLog where VerifySort='{0}'", VerifySort);
                    VerifyNo = Convert.ToInt32(cmd.ExecuteScalar());
                    TheDate = DateTime.Now.ToShortDateString();

                    #region ����ɹ���Ʊ������
                    foreach (DataRow drInvoice in dtInvoice.Rows)
                    {
                        BillSort = "�ɹ���Ʊ";
                        BillNo = Convert.ToString(drInvoice["BillNo"]);
                        RowNo = Convert.ToString(drInvoice["RowNo"]);
                        BillDate = Convert.ToString(drInvoice["TheDate"]);
                        ClientSort = Convert.ToString(drInvoice["ClientSort"]);
                        ClientCode = Convert.ToString(drInvoice["ClientCode"]);
                        ProductSort = Convert.ToString(drInvoice["ProductSortCode"]);
                        ProductCode = Convert.ToString(drInvoice["ProductCode"]);
                        NowAmount = Convert.ToInt32(drInvoice["NowAmount"]);
                        //������ڹ��������պõ��ڷ�Ʊ��δ��������
                        if (NowAmount == Convert.ToInt32(drInvoice["VerifyOddAmount"]))
                        {
                            NowCostMoney = Convert.ToDouble(drInvoice["VerifyOddCostMoney"]);
                            NowMoney = Convert.ToDouble(drInvoice["VerifyOddMoney"]);
                            TotalAmount = Convert.ToInt32(drInvoice["Number"]);
                            TotalCostMoney = Convert.ToDouble(drInvoice["SumMoney"]);
                            TotalMoney = Convert.ToDouble(drInvoice["TotalMoney"]);
                            OddAmount = 0;
                            OddCostMoney = 0.00;
                            OddMoney = 0.00;
                        }
                        else
                        {
                            NowCostMoney = Convert.ToDouble(drInvoice["SumMoney"]) / Convert.ToInt32(drInvoice["Number"]) * NowAmount;
                            NowMoney = Convert.ToDouble(drInvoice["TotalMoney"]) / Convert.ToInt32(drInvoice["Number"]) * NowAmount;
                            TotalAmount = Convert.ToInt32(drInvoice["VerifyTotalAmount"]) + NowAmount;
                            TotalCostMoney = Convert.ToDouble(drInvoice["VerifyTotalCostMoney"]) + NowCostMoney;
                            TotalMoney = Convert.ToDouble(drInvoice["VerifyTotalMoney"]) + NowMoney;
                            OddAmount = Convert.ToInt32(drInvoice["Number"]) - TotalAmount;
                            OddCostMoney = Convert.ToDouble(drInvoice["VerifyOddCostMoney"]) - NowCostMoney;
                            OddMoney = Convert.ToDouble(drInvoice["VerifyOddMoney"]) - NowMoney;
                        }
                        sql = string.Format("insert tsSystemVerifyLog values('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', '{12}', '{13}', '{14}', '{15}', '{16}', '{17}', '{18}', '{19}')",
                            VerifySort, VerifyNo + 1, BillSort, BillNo, RowNo, BillDate, TheDate, ClientSort, ClientCode, ProductSort, ProductCode, NowAmount, NowCostMoney, NowMoney, TotalAmount, TotalCostMoney, TotalMoney, OddAmount, OddCostMoney, OddMoney) + "\n";
                        sql += string.Format("update tbStockInvoiceItem set VerifyNowAmount={0}, VerifyNowCostMoney={1}, VerifyNowMoney={2}, VerifyTotalAmount={3}, VerifyTotalCostMoney={4}, VerifyTotalMoney={5} where BillNo='{6}' and RowNo='{7}'",
                            NowAmount, NowCostMoney, NowMoney, TotalAmount, TotalCostMoney, TotalMoney, BillNo, RowNo) + "\n";
                        cmd.CommandText = sql;
                        cmd.ExecuteNonQuery();
                    }
                    #endregion

                    #region �����⹺��������
                    foreach (DataRow drBill in dtBill.Rows)
                    {
                        BillSort = "�⹺���";
                        BillNo = Convert.ToString(drBill["BillNo"]);
                        RowNo = Convert.ToString(drBill["RowNo"]);
                        BillDate = Convert.ToString(drBill["TheDate"]);
                        ClientSort = Convert.ToString(drBill["ClientSort"]);
                        ClientCode = Convert.ToString(drBill["ClientCode"]);
                        ProductSort = Convert.ToString(drBill["ProductSortCode"]);
                        ProductCode = Convert.ToString(drBill["ProductCode"]);
                        NowAmount = Convert.ToInt32(drBill["NowAmount"]);
                        //������ڹ��������պõ��ڵ��ݵ�δ��������
                        if (NowAmount == Convert.ToInt32(drBill["VerifyOddAmount"]))
                        {
                            NowCostMoney = Convert.ToDouble(drBill["VerifyOddCostMoney"]);
                            NowMoney = Convert.ToDouble(drBill["VerifyOddMoney"]);
                            TotalAmount = Convert.ToInt32(drBill["Number"]);
                            TotalCostMoney = Convert.ToDouble(drBill["SumMoney"]);
                            TotalMoney = Convert.ToDouble(drBill["TotalMoney"]);
                            OddAmount = 0;
                            OddCostMoney = 0.00;
                            OddMoney = 0.00;
                        }
                        else
                        {
                            NowCostMoney = Convert.ToDouble(drBill["SumMoney"]) / Convert.ToInt32(drBill["Number"]) * NowAmount;
                            NowMoney = Convert.ToDouble(drBill["TotalMoney"]) / Convert.ToInt32(drBill["Number"]) * NowAmount;
                            TotalAmount = Convert.ToInt32(drBill["VerifyTotalAmount"]) + NowAmount;
                            TotalCostMoney = Convert.ToDouble(drBill["VerifyTotalCostMoney"]) + NowCostMoney;
                            TotalMoney = Convert.ToDouble(drBill["VerifyTotalMoney"]) + NowMoney;
                            OddAmount = Convert.ToInt32(drBill["Number"]) - TotalAmount;
                            OddCostMoney = Convert.ToDouble(drBill["VerifyOddCostMoney"]) - NowCostMoney;
                            OddMoney = Convert.ToDouble(drBill["VerifyOddMoney"]) - NowMoney;
                        }
                        sql = string.Format("insert tsSystemVerifyLog values('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', '{12}', '{13}', '{14}', '{15}', '{16}', '{17}', '{18}', '{19}')",
                            VerifySort, VerifyNo + 1, BillSort, BillNo, RowNo, BillDate, TheDate, ClientSort, ClientCode, ProductSort, ProductCode, NowAmount, NowCostMoney, NowMoney, TotalAmount, TotalCostMoney, TotalMoney, OddAmount, OddCostMoney, OddMoney) + "\n";
                        sql += string.Format("update tbStorStockInItem set VerifyNowAmount={0}, VerifyNowCostMoney={1}, VerifyNowMoney={2}, VerifyTotalAmount={3}, VerifyTotalCostMoney={4}, VerifyTotalMoney={5} where BillNo='{6}' and RowNo='{7}'",
                            NowAmount, NowCostMoney, NowMoney, TotalAmount, TotalCostMoney, TotalMoney, BillNo, RowNo) + "\n";
                        cmd.CommandText = sql;
                        cmd.ExecuteNonQuery();
                    }
                    #endregion

                    xzException.WarnBox("�����ɹ�");
                }
                else
                {
                    int invoiceAmount = 0, billAmount = 0;
                    foreach (DataRow rows in (TableArg["VerificationRecord"] as DataTable).Rows)
                    {
                        if (rows["BillSort"].ToString() == "�ɹ���Ʊ")
                        {
                            invoiceAmount += Convert.ToInt32(rows["NowAmount"]);
                        }
                        else if (rows["BillSort"].ToString() == "�⹺���")
                        {
                            billAmount += Convert.ToInt32(rows["NowAmount"]);
                        }
                    }
                    if (invoiceAmount != billAmount)
                    {
                        xzException.WarnBox("��Ʊ�����������������");
                    }
                    foreach (DataRow rows in (TableArg["VerificationRecord"] as DataTable).Rows)
                    {
                        #region ���¹�����־
                        sql = "select * from tsSystemVerifyLog where VerifySort='{4}' and BillSort='{0}' and BillNo='{1}' and RowNo='{2}' and VerifyNo>{3}";
                        cmd.CommandText = string.Format(sql, rows["BillSort"], rows["BillNo"], rows["RowNo"], rows["VerifyNo"], rows["VerifySort"]);
                        sdr = cmd.ExecuteReader();
                        sql = "";
                        while (sdr.Read())
                        {
                            sql += string.Format("update tsSystemVerifyLog set TotalAmount=TotalAmount-{0}, TotalCostMoney=TotalCostMoney-{1}, TotalMoney=TotalMoney-{2}, OddAmount=OddAmount+{0}, OddCostMoney=OddCostMoney+{1}, OddMoney=OddMoney+{2} where VerifySort='{3}' and VerifyNo='{4}' and BillSort='{5}' and BillNo='{6}' and RowNo='{7}'",
                                rows["NowAmount"], rows["NowCostMoney"], rows["NowMoney"], sdr["VerifySort"], sdr["VerifyNo"], sdr["BillSort"], sdr["BillNo"], sdr["RowNo"]) + "\n";
                        }
                        sql += string.Format("delete tsSystemVerifyLog where VerifySort='{0}' and VerifyNo='{1}' and BillSort='{2}' and BillNo='{3}' and RowNo='{4}'",
                           rows["VerifySort"], rows["VerifyNo"], rows["BillSort"], rows["BillNo"], rows["RowNo"]) + "\n";
                        sdr.Close();
                        cmd.CommandText = sql;
                        cmd.ExecuteNonQuery();
                        #endregion

                        #region �������۷�Ʊ�����۳���
                        sql = "select top 1 * from tsSystemVerifyLog where VerifySort='{3}' and BillSort='{0}' and BillNo='{1}' and RowNo='{2}' order by VerifyNo desc";
                        cmd.CommandText = string.Format(sql, rows["BillSort"], rows["BillNo"], rows["RowNo"], rows["VerifySort"]);
                        sdr = cmd.ExecuteReader();
                        int tmpAmount = 0, tmpTotalAmount = 0;
                        double tmpCostMoney = 0.00, tmpMoney = 0.00, tmpTotalCostMoney = 0.00, tmpTotalMoney = 0.00;
                        if (sdr.Read())
                        {
                            tmpAmount = Convert.ToInt32(sdr["NowAmount"]);
                            tmpCostMoney = Convert.ToDouble(sdr["NowCostMoney"]);
                            tmpMoney = Convert.ToDouble(sdr["NowMoney"]);
                            tmpTotalAmount = Convert.ToInt32(sdr["TotalAmount"]);
                            tmpTotalCostMoney = Convert.ToDouble(sdr["TotalCostMoney"]);
                            tmpTotalMoney = Convert.ToDouble(sdr["TotalMoney"]);
                        }
                        sdr.Close();
                        sql = "";
                        if (rows["BillSort"].ToString() == "�ɹ���Ʊ")
                        {
                            sql += string.Format("update tbStockInvoiceItem set VerifyNowAmount={0}, VerifyNowCostMoney={1}, VerifyNowMoney={2}, VerifyTotalAmount={3}, VerifyTotalCostMoney={4}, VerifyTotalMoney={5} where BillNo='{6}' and RowNo='{7}'",
                               tmpAmount, tmpCostMoney, tmpMoney, tmpTotalAmount, tmpTotalCostMoney, tmpTotalMoney, rows["BillNo"], rows["RowNo"]) + "\n";
                        }
                        else if (rows["BillSort"].ToString() == "�⹺���")
                        {
                            sql += string.Format("update tbStorStockInItem set VerifyNowAmount={0}, VerifyNowCostMoney={1}, VerifyNowMoney={2}, VerifyTotalAmount={3}, VerifyTotalCostMoney={4}, VerifyTotalMoney={5} where BillNo='{6}' and RowNo='{7}'",
                               tmpAmount, tmpCostMoney, tmpMoney, tmpTotalAmount, tmpTotalCostMoney, tmpTotalMoney, rows["BillNo"], rows["RowNo"]) + "\n";
                        }
                        cmd.CommandText = sql;
                        cmd.ExecuteNonQuery();
                        #endregion
                    }

                    xzException.WarnBox("�������ɹ�");
                }
            }
            finally
            {
                Connect.Close();
            }
        }
    }

    ///<summary>
    ///�ŵ궩�������ݴ���
    ///<summary>
    public class SvrSelfOrder : SvrSystemDB, IServerSkedUserExecEx
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
                    cmd.CommandText = string.Format(@"select IsUse, FlowBit, UseState, TheDate 
                           from tbSelfOrder where BillNo = '{0}'", Row["BillNo"]);
                    DataTable MasterTable = new DataTable();
                    sqlda.Fill(MasterTable);
                    MasterTable.TableName = "tbSelfOrder";
                    DataRow MasterRow = MasterTable.Rows[0];

                    //�������
                    if (BitTermMath.GetBitTrue((int)MasterRow["FlowBit"], BitTermMath.TermOne))
                        xzException.WarnBox(HYStorageMessage._MsgHasAuditing);

                    //�������ĵ�������
                    if ((int)MasterRow["IsUse"] > 0)
                        xzException.WarnBox(HYStorageMessage._MsgBillNoCheck);
                    #endregion

                    #region �ж�

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
                        break;
                    case 1:
                        #region �жϵ����Ƿ���Խ������
                        string TableName = "tbSelfOrder", BillNo = ht[0].ToString();

                        HYStorageMessage.HintLock(command, TableName, BillNo); //���ݱ���������
                        HYStorageMessage.HintChange(command, TableName, BillNo); //�������δ���
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
    /// ��Զ�ֿ�Ĳ���
    /// </summary>
    public sealed class HYStorageParam
    {
        //����
        public const string _StorageTableName = "tbStorStorage";
        public const string _StorageKey = "StorageCode;PlaceCode;ProductCode;ProductSortCode";
        public const string _StorageAmount = "Number";

        //���ű�
        public const string _StorageTableItem = "tbStorStorageItem";
        public const string _StorageKeyItem = "ProductCode;ListNo;SupplyerCode;StorageCode;PlaceCode;InDate;UnSaleDate;ProductSortCode";
        public const string _StorageItemNumber = "InCostPrice;InCostTaxPrice";
        public const string _StorageItemNumberOri = "InCostPrice";

        //���ż�¼���ٱ�
        public const string _StorageTableList = "tbStorStorageList";
        public const string _StorageKeyList = "ProductCode;ProductSortCode;ListNo;StorageCode;PlaceCode;TheDate;HandleCourse;BillNo;Copartner;CopartnerSort";
        public const string _StorageAmountList = "Number";


        //����(��Ʒ�黹����ʹ��)
        public static string TheDate = null, User = null, SrcBillNo = null, SrcBillSort = null;

        //�ֿ����
        public const string _StorageRedeploy = "Select distinct RedeployOutStorage,RedeployOutPlace,a.ProductCode,a.ProductSortCode,sum(a.Number) Number from {0} a "
                                               + "Left Outer Join {1} b on a.BillNo=b.BillNo "
                                               + "where a.BillNo = '{2}'  Group by a.RedeployOutStorage,a.RedeployOutPlace,a.ProductCode,a.ProductSortCode ";

        //public const string _StorageRedeploy = "Select distinct RedeployOutStorage,RedeployOutPlace,RedeployOutStorage,RedeployOutPlace,a.ProductCode,a.ProductSortCode,sum(a.Number) Number from {0} a "
        //                                       + "Left Outer Join {1} b on a.BillNo=b.BillNo "
        //                                       + "where a.BillNo = '{2}'  Group by a.RedeployOutStorage,a.RedeployOutPlace,a.ProductCode,a.ProductSortCode ";

        public const string _StorageRedeployList = "Select b.ProductCode,b.ProductSortCode,a.ListNo,a.SupplyerCode,b.RedeployOutStorage,b.RedeployOutPlace,b.RedeployInStorage,b.RedeployInPlace,a.InCostPrice,a.InCostTaxPrice,a.InDate,a.UnSaleDate,c.TheDate,1 Num from {0} a "
                                                    + "Left Outer Join {1} b on a.BillNo=b.BillNo and a.RowNo=b.RowNo "
                                                    + "Left Outer Join {2} c on b.BillNo=c.BillNo  "
                                                    + "where  a.ListNo is not null and b.BillNo={3} ";

        public const string _StorageRedeployListCk = "Select b.ProductCode,b.ProductSortCode,a.ListNo,d.SupplyerCode,b.RedeployOutStorage,b.RedeployOutPlace,b.RedeployInStorage,b.RedeployInPlace,d.InCostPrice,d.InCostTaxPrice,d.InDate,d.UnSaleDate,c.TheDate,1 Num from {0} a "
                                                    + " Left Outer Join {1} b on a.BillNo=b.BillNo and a.RowNo=b.RowNo "
                                                    + " Left Outer Join {2} c on b.BillNo=c.BillNo  "
                                                    + " left outer join tbStorStorageItem d on a.ListNo=d.ListNo and b.ProductCode=d.ProductCode "
                                                    + " and b.ProductSortCode=d.ProductSortCode and b.RedeployOutStorage=d.StorageCode and b.RedeployOutPlace=d.PlaceCode"
                                                    + " where b.IsListNo=1 and b.BillNo={3} ";

        //������
        public const string _StorageCommLeague = "Select distinct StorageCode,a.StorPlaceCode PlaceCode,a.ProductCode,a.ProductSortCode,sum(ABS(a.Number)) Number from {0} a "
                                           + "Left Outer Join {1} b on a.BillNo=b.BillNo "
                                           + "where a.BillNo = '{2}' Group by StorageCode,a.StorPlaceCode,a.ProductCode,a.ProductSortCode ";

        public const string _StorageComm = "Select distinct StorageCode,a.PlaceCode,a.ProductCode,a.ProductSortCode,sum(ABS(a.Number)) Number from {0} a "
                                           + "Left Outer Join {1} b on a.BillNo=b.BillNo "
                                           + "where a.BillNo = '{2}' Group by StorageCode,a.PlaceCode,a.ProductCode,a.ProductSortCode ";

        public const string _StorageCommOri = "Select distinct StorageCode,a.PlaceCode,a.ProductCode,a.ProductSortCode,sum(a.Number) Number from {0} a "
                                           + "Left Outer Join {1} b on a.BillNo=b.BillNo "
                                           + "where a.BillNo = '{2}' Group by StorageCode,a.PlaceCode,a.ProductCode,a.ProductSortCode ";
        //����/�쵥����
        public const string _StorageCommList = "Select b.RowNo,StorageCode,a.ProductCode,b.ProductSortCode,b.PlaceCode,a.ListNo,a.SupplyerCode,a.InCostPrice,a.InCostTaxPrice,TheDate,InDate,UnSaleDate,1 Num from {0} a "
                                             + "Left Outer Join {1} b on a.BillNo=b.BillNo and a.RowNo=b.RowNo "
                                             + "Left Outer Join {2} c on b.BillNo=c.BillNo where a.BillNo = '{3}' and ListNo is not null";
        //�������
        public const string _StorageCommListOri = "Select b.RowNo,StorageCode,a.ProductCode,b.ProductSortCode,b.PlaceCode,a.ListNo,a.SupplyerCode,b.InCostPrice,b.InCostTaxPrice,TheDate,InDate,UnSaleDate,1 Num from {0} a "
                                             + "Left Outer Join {1} b on a.BillNo=b.BillNo and a.RowNo=b.RowNo "
                                             + "Left Outer Join {2} c on b.BillNo=c.BillNo where a.BillNo = '{3}' and ListNo is not null";

        public const string _Number = " Select SrcBillNo,a.ProductCode,a.ProductSortCode,a.Number from {0} a "
                                           + " Left Outer Join {1} b on a.BillNo=b.BillNo where b.BillNo = '{2}'";

        public const string _StorageMargin = "Select distinct RowNo,InCostPrice*Number-SumMoney Margin from {0} where BillNo = '{1}'";

        //������������ר��
        public const string _RubricList = "Select ListNo,ProductCode,ProductSortCode,StorageCode,PlaceCode,TheDate from tbStorStorageList where "
                                          + " ListNo={0} and ProductCode={1} and ProductSortCode={2} and StorageCode={3} and PlaceCode={4} and HandleCourse={5}";

        public static string RubricIns(string Table, string Key0, string Key1, string Key2, string Key3, string Key4, string Key5, decimal Key6, decimal Key7, string Key8, string Key9)
        {
            string _RubricIns = string.Format("Insert into " + Table + " (ListNo,ProductCode,ProductSortCode,StorageCode,PlaceCode,SupplyerCode,InCostPrice,InCostTaxPrice,InDate,UnSaleDate)"
                               + " values ('{0}','{1}','{2}','{3}','{4}','{5}',{6}, {7},'{8}','{9}')", Key0, Key1, Key2, Key3, Key4, Key5, Key6, Key7, Key8, Key9);
            return _RubricIns;
        }

        public static string RubricDel(string Table, string Key0, string Key1, string Key2, string Key3, string Key4)
        {
            string _RubricDel = string.Format("delete " + Table + " where ListNo='{0}' and ProductCode='{1}' and ProductSortCode='{2}' and StorageCode='{3}' and PlaceCode='{4}'",
                                     Key0, Key1, Key2, Key3, Key4);
            return _RubricDel;
        }

        #region ���¿�Ʊ������ʱδ��ProductSortCode��Ϊ�������й��ˣ��ж�
        //��Ʊ���ݸ��� (����������д )
        public const string _UptSql = "Update {0} set {4} = {4} {6} {5} where BillNo = {1} and ProductCode = {2} and ProductSortCode={3}";

        //���µ��ݵ�״̬������Ʒ�黹�����ɵ�(�Ѿ�����)���۵���
        public const string _UptCheck = "Update {0} set IsUse = IsUse {3}{4} from {0},{1} where {0}.BillNo = {1}.SrcBillNo and {1}.BillNo = {2}";

        //���µ����Ƿ�ʹ��
        public const string _UptIsUse = "Update {0} set IsUse = dbo.SetByteToBoolean(IsUse,{3},{4}) from {0},{1} where {0}.BillNo = {1}.SrcBillNo and {1}.BillNo = {2}";

        //public const string _UptCheck = "Update {0} set IsUse = IsUse {3} dbo.SetByteToBoolean({4},0x0001,1) from {0},{1} where {0}.BillNo = {1}.SrcBillNo and {1}.BillNo = {2}";

        //�����ж�
        public const string _IsListNo = "select Count(*) from tbStorStorageItem where ProductCode={0} and ProductSortCode={1} and ListNo={2}";

        //�۸���ʷ
        public const string _InsPriceHistory = "if not exists(select 1 from tbDatumPriceHistory where ProductCode='{0}' and ProductSortCode='{1}' and TheDate='{2}' and BillNo='{7}' and BillSort='{8}')" + "\n"
            + " begin " + "\n"
            + " insert into tbDatumPriceHistory(ProductCode,ProductSortCode,TheDate,Price,TaxPrice,InCostPrice,InCostTaxPrice,BillNo,BillSort) " + "\n"
            + " values('{0}', '{1}', '{2}', {3}, {4}, {5}, {6}, '{7}', {8})" + "\n"
            + " end " + "\n";
        public const string _DelPriceHistory = "Delete from tbDatumPriceHistory where BillNo='{0}' and BillSort={1}";

        //����ж�
        public const string _JudgeStorage = "select count(*) from tbStorStorage where StorageCode='{0}' and PlaceCode='{1}' and ProductCode='{2}' and ProductSortCode='{3}' and Number>={4}";

        public const string _JudgeStorageItem = "select Count(*) from tbStorStorageItem where ProductCode={0} and ProductSortCode={1} and ListNo={2}  and StorageCode={3} and PlaceCode={4}";

        //��������������ж�
        public static bool JudgeStorage(DataTable Dt, SqlConnection Connect, SqlTransaction Tran)
        {
            foreach (DataRow r in Dt.Rows)
            {
                SqlCommand CmdJudgeStorage = new SqlCommand(string.Format(HYStorageParam._JudgeStorage, string.Format("{0}", r["StorageCode"]),
                    string.Format("{0}", r["PlaceCode"]), string.Format("{0}", r["ProductCode"]), string.Format("{0}", r["ProductSortCode"]),
                    string.Format("{0}", r["Number"])), Connect);
                CmdJudgeStorage.Transaction = Tran;
                object ACount = CmdJudgeStorage.ExecuteScalar();
                if ((Int32)ACount <= 0)
                {
                    return true;
                }
            }
            return false;
        }

        //��������������ж�(ͨ��)
        public static bool JudgeCommonStorage(string StorageCode, string PlaceCode, string ProductCode, string ProductSortCode,
            string Number, SqlConnection Connect, SqlTransaction Tran)
        {
            SqlCommand CmdJudgeStorage = new SqlCommand(string.Format(HYStorageParam._JudgeStorage, string.Format("{0}", StorageCode),
                string.Format("{0}", PlaceCode), string.Format("{0}", ProductCode), string.Format("{0}", ProductSortCode),
                string.Format("{0}", Number)), Connect);
            CmdJudgeStorage.Transaction = Tran;
            object ACount = CmdJudgeStorage.ExecuteScalar();
            if ((Int32)ACount <= 0)
            {
                return true;
            }
            return false;
        }

        //����ӱ��ŵ��жϣ�����жϣ�
        public static bool JudgeInStorageItem(string ProductCode, string ProductSortCode, string ListNo, SqlConnection Connect, SqlTransaction Tran)
        {
            string SqlStr = string.Format(HYStorageParam._IsListNo, string.Format("'{0}'", ProductCode),
                string.Format("'{0}'", ProductSortCode), string.Format("'{0}'", ListNo));
            SqlCommand cmd = new SqlCommand(SqlStr, Connect);
            cmd.Transaction = Tran;
            object ACount = cmd.ExecuteScalar();
            if ((Int32)ACount > 0)
            {
                return true;
                //HYArchivesParam.Warn("��Ʒ���[" + string.Format("'{0}'", ProductCode) + "],����[" + string.Format("'{0}'", ListNo) + "] ���ݿ����Ѿ�����!");
            }
            return false;
        }

        //����ӱ��ŵ��жϣ������жϣ�
        public static bool JudgeOutStorageItem(string ProductCode, string ProductSortCode, string ListNo, string StorageCode,
            string PlaceCode, SqlConnection Connect, SqlTransaction Tran)
        {
            string SqlStr = string.Format(HYStorageParam._JudgeStorageItem, string.Format("'{0}'", ProductCode),
                string.Format("'{0}'", ProductSortCode), string.Format("'{0}'", ListNo), string.Format("'{0}'", StorageCode),
                string.Format("'{0}'", PlaceCode));
            SqlCommand cmd = new SqlCommand(SqlStr, Connect);
            cmd.Transaction = Tran;
            object ACount = cmd.ExecuteScalar();
            if ((Int32)ACount <= 0)
            {
                return true;
                //HYArchivesParam.Warn("��Ʒ���[" + string.Format("'{0}'", ProductCode) + "],����[" + string.Format("'{0}'", ListNo) + "] ���ݿ����Ѿ�����!");
            }
            return false;
        }

        #endregion

        //�����
        public static string IsAdd(bool Isplus)
        {
            return (Isplus) ? "+" : "-";
        }

        //λ�����ж�ȡ�����һ
        public static string IsOne(bool Isplus)
        {
            return (Isplus) ? "1" : "0";
        }

        //��ȡ������
        public static DataTable GetDetailTableLeague(SqlConnection Conn, SqlTransaction Tran, string DetailTable, string MasterTable, string MasterKey)
        {
            using (SqlDataAdapter Comm = new SqlDataAdapter(string.Format(_StorageCommLeague, DetailTable, MasterTable, MasterKey), Conn))
            {
                Comm.SelectCommand.Transaction = Tran;
                DataTable Dt = new DataTable();
                Comm.Fill(Dt);
                return Dt;
            }
        }

        public static DataTable GetDetailTable(SqlConnection Conn, SqlTransaction Tran, string DetailTable, string MasterTable, string MasterKey)
        {
            using (SqlDataAdapter Comm = new SqlDataAdapter(string.Format(_StorageComm, DetailTable, MasterTable, MasterKey), Conn))
            {
                Comm.SelectCommand.Transaction = Tran;
                DataTable Dt = new DataTable();
                Comm.Fill(Dt);
                return Dt;
            }
        }

        public static DataTable GetDetailTableOri(SqlConnection Conn, SqlTransaction Tran, string DetailTable, string MasterTable, string MasterKey)
        {
            using (SqlDataAdapter Comm = new SqlDataAdapter(string.Format(_StorageCommOri, DetailTable, MasterTable, MasterKey), Conn))
            {
                Comm.SelectCommand.Transaction = Tran;
                DataTable Dt = new DataTable();
                Comm.Fill(Dt);
                return Dt;
            }
        }

        //��ȡ(���ű�)������
        public static DataTable GetListTable(SqlConnection Conn, SqlTransaction Tran, string ListTable, string DetailTable, string MasterTable, string MasterKey)
        {
            using (SqlDataAdapter Comm = new SqlDataAdapter(string.Format(_StorageCommList, ListTable, DetailTable, MasterTable, MasterKey), Conn))
            {
                Comm.SelectCommand.Transaction = Tran;
                DataTable Dtable = new DataTable();
                Comm.Fill(Dtable);
                return Dtable;
            }
        }

        //��ȡβ������
        public static DataTable GetMarginTable(SqlConnection Conn, SqlTransaction Tran, string DetailTable, string MasterKey)
        {
            using (SqlDataAdapter Comm = new SqlDataAdapter(string.Format(_StorageMargin, DetailTable, MasterKey), Conn))
            {
                Comm.SelectCommand.Transaction = Tran;
                DataTable Dtable = new DataTable();
                Comm.Fill(Dtable);
                return Dtable;
            }
        }

        public static DataTable GetListTableOri(SqlConnection Conn, SqlTransaction Tran, string ListTable, string DetailTable, string MasterTable, string MasterKey)
        {
            using (SqlDataAdapter Comm = new SqlDataAdapter(string.Format(_StorageCommListOri, ListTable, DetailTable, MasterTable, MasterKey), Conn))
            {
                Comm.SelectCommand.Transaction = Tran;
                DataTable Dtable = new DataTable();
                Comm.Fill(Dtable);
                return Dtable;
            }
        }

        //����
        public static DataTable GetDetailRedeployTable(SqlConnection Conn, SqlTransaction Tran, string DetailTable, string MasterTable, string MasterKey)
        {
            using (SqlDataAdapter Comm = new SqlDataAdapter(string.Format(_StorageRedeploy, DetailTable, MasterTable, MasterKey), Conn))
            {
                Comm.SelectCommand.Transaction = Tran;
                DataTable Dt = new DataTable();
                Comm.Fill(Dt);
                return Dt;
            }
        }

        //����
        public static DataTable GetListRedeployTable(SqlConnection Conn, SqlTransaction Tran, string ListTable, string DetailTable, string MasterTable, string MasterKey)
        {
            using (SqlDataAdapter Comm = new SqlDataAdapter(string.Format(_StorageRedeployList, ListTable, DetailTable, MasterTable, MasterKey), Conn))
            {
                Comm.SelectCommand.Transaction = Tran;
                DataTable Dtable = new DataTable();
                Comm.Fill(Dtable);
                return Dtable;
            }
        }

        //����
        public static DataTable GetListRedeployTableCk(SqlConnection Conn, SqlTransaction Tran, string ListTable, string DetailTable, string MasterTable, string MasterKey)
        {
            using (SqlDataAdapter Comm = new SqlDataAdapter(string.Format(_StorageRedeployListCk, ListTable, DetailTable, MasterTable, MasterKey), Conn))
            {
                Comm.SelectCommand.Transaction = Tran;
                DataTable Dtable = new DataTable();
                Comm.Fill(Dtable);
                return Dtable;
            }
        }

        //��ȡ��Ʊ����
        public static DataTable GetTable(SqlConnection Conn, SqlTransaction Tran, string MasterTable, string DetailTable, string MasterKey)
        {
            using (SqlDataAdapter SqlData = new SqlDataAdapter())
            {
                SqlCommand Comm = new SqlCommand(string.Format(_Number, DetailTable, MasterTable, string.Format("{0}", MasterKey)), Conn);
                Comm.Transaction = Tran;
                SqlData.SelectCommand = Comm;
                DataTable GetTable = new DataTable();
                SqlData.Fill(GetTable);
                return GetTable;
            }
        }

        //(����)��Ʊ���ݴ���
        public static DataTable UptTable(SqlConnection Conn, SqlTransaction Tran, string UptSql, string MasterTable, string MasterKey0, string MasterKey1,
            string MasterKey2, string MasterKey3, Int32 ValueKey, string isPlus)
        {
            using (SqlDataAdapter SqlData = new SqlDataAdapter())
            {
                SqlCommand Comm = new SqlCommand(string.Format(UptSql, MasterTable, string.Format("'{0}'", MasterKey0),
                                     string.Format("'{0}'", MasterKey1), string.Format("'{0}'", MasterKey2), MasterKey3,
                     ValueKey, isPlus), Conn);
                Comm.Transaction = Tran;
                SqlData.SelectCommand = Comm;
                DataTable UpdTable = new DataTable();
                SqlData.Fill(UpdTable);
                return UpdTable;
            }
        }

        //��ȡ�Զ���������
        public static DataTable UptSale(SqlConnection Conn, SqlTransaction Tran, string UptSql, string MasterTable, string DetailTable, string MasterKey, int valueKey)
        {
            using (SqlDataAdapter SqlData = new SqlDataAdapter())
            {
                SqlCommand Comm = new SqlCommand(string.Format(UptSql, MasterTable, DetailTable, string.Format("'{0}'", MasterKey), valueKey), Conn);
                Comm.Transaction = Tran;
                SqlData.SelectCommand = Comm;
                DataTable UptSale = new DataTable();
                SqlData.Fill(UptSale);
                return UptSale;
            }
        }

        //�Ƿ�����˵ĸ���
        public static DataTable UptIsUse(SqlConnection Conn, SqlTransaction Tran, string UptSql, string MasterTable, string DetailTable, string MasterKey, string isPlus, int valueKey)
        {
            using (SqlDataAdapter SqlData = new SqlDataAdapter())
            {
                SqlCommand Comm = new SqlCommand(string.Format(UptSql, MasterTable, DetailTable, string.Format("'{0}'", MasterKey), isPlus, valueKey), Conn);
                Comm.Transaction = Tran;
                SqlData.SelectCommand = Comm;
                DataTable UptSale = new DataTable();
                SqlData.Fill(UptSale);
                return UptSale;
            }
        }

        //�������
        public static string GetBillNo(SqlConnection Connect, SqlTransaction Tran, string TableName)
        {
            string result,
                sqlDate = DateTime.Now.ToString("yyMMdd"),
                sqlSelect = string.Format("Select max(BillNo) from {0} where BillNo like '{1}___'", string.Format("{0}", TableName), sqlDate);
            SqlCommand cmdBillNo = new SqlCommand(sqlSelect, Connect, Tran);
            try
            {
                string maxBillNo = Convert.ToString(cmdBillNo.ExecuteScalar());
                if (maxBillNo != "")
                {
                    string lastLetter = Convert.ToString(maxBillNo.Substring(maxBillNo.Length - 3, 3));
                    int maxLetter = Convert.ToInt32(lastLetter) + Convert.ToInt32(1);
                    string laster = Convert.ToString(maxLetter).PadLeft(3, '0');
                    result = sqlDate + Convert.ToString(laster);
                }
                else
                {
                    result = sqlDate + "001";
                }
            }
            finally
            {

            }
            return result;
        }

        //��ȡ��Ʒ����
        public static string GetTableName(string ProductSortCode)
        {
            if (ProductSortCode == "001")
            {
                return "tbDatumProductInfo";
            }
            else if (ProductSortCode == "002")
            {
                return "tbDatumFitting";
            }
            else if (ProductSortCode == "003")
            {
                return "tbDatumPhoneCard";
            }
            else
            {
                return "";
            }
        }

        //���������ݴ���----��ȡ���Ÿ��ټ�¼����Ӧ����
        public static DataTable GetStorageListTable(SqlConnection Conn, SqlTransaction Tran, string ListNo, string ProductCode, string ProductSortCode,
               string StorageCode, string PlaceCode, string HandleCourse)
        {
            using (SqlDataAdapter SqlData = new SqlDataAdapter())
            {
                SqlCommand Comm = new SqlCommand(string.Format(_RubricList, string.Format("'{0}'", ListNo), string.Format("'{0}'", ProductCode),
                    string.Format("'{0}'", ProductSortCode), string.Format("'{0}'", StorageCode),
                    string.Format("'{0}'", PlaceCode), string.Format("'{0}'", HandleCourse)), Conn);
                Comm.Transaction = Tran;
                SqlData.SelectCommand = Comm;
                DataTable GetTable = new DataTable();
                SqlData.Fill(GetTable);
                return GetTable;
            }
        }
    }
}