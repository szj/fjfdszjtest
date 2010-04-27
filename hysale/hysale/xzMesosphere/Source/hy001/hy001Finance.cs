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
    public class HyLoginFinance
    {
        public static void Login(xzServerManage FServerManage)
        {
            string sql = xzSqlConnect.ConnectionString(FServerManage.ServerManageParam.SqlConnectParam);

            #region �۸񷽰�
            SvrSelfPriceManage.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSelfPriceManage), "ISvrSelfPriceManage");��          //�ŵ�۸����
            SvrDatumPriceChange.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrDatumPriceChange), "ISvrDatumPriceChange");��        //�ܲ��۸�������
            #endregion

            #region ������
            SvrFinReckoning.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrFinReckoning), "ISvrFinReckoning");��                //���ݽ��

            #endregion

            #region �ɱ�����
            SvrSystemErrorPriceAdjust.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrSystemErrorPriceAdjust), "ISvrSystemErrorPriceAdjust");��     //�ɱ�������          
            
            SvrFinCosting.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrFinCosting), "ISvrFinCosting");

            SvrFinCostingList.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrFinCostingList), "ISvrFinCostingList");

            SvrFinCostingRecord.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrFinCostingRecord), "ISvrFinCostingRecord");��               //�ɱ�ά���ռ�
            #endregion

            #region ����
            SvrReportListNotSame.ConnectStr = sql;
            FServerManage.Server.StartupTCPServer(typeof(SvrReportListNotSame), "ISvrReportListNotSame");��            //���ųɱ���һ��
            #endregion
        }
    }

    /// <summary>
    /// �ŵ�۸������ϵ
    /// </summary>
    public class SvrSelfPriceManage : SvrSystemDB
    {
        #region  �������ݴ���
        string IsNum = "Select Count(*)Amount from tbHQPriceSystemFour where ProductCode = {0} "
                      + " and ProductSortCode ={1} and ShopCode={2} ";

        string SelStr = "Select a.BillNo,a.ProductCode,a.ProductSortCode,a.TradePrice,a.MinPrice,a.RetailPrice,b.ShopCode from "
                       + " tbSelfPriceManageItem a Left outer join tbSelfPriceManage b on a.BillNo=b.BillNo where b.BillNo = {0}";

        private DataTable SelTab(SqlConnection Connect, SqlTransaction Tran, string str, string BillNo)
        {
            using (SqlDataAdapter SqlData = new SqlDataAdapter())
            {
                SqlCommand comm = new SqlCommand(string.Format(str,
                    string.Format("{0}", BillNo)), Connect);
                comm.Transaction = Tran;
                SqlData.SelectCommand = comm;
                DataTable DT = new DataTable();
                SqlData.Fill(DT);
                return DT;
            }
        }

        private DataTable ADataTable(SqlConnection Connect, SqlTransaction Tran, string AData)
        {
            using (SqlDataAdapter Comm = new SqlDataAdapter(string.Format(AData), Connect))
            {
                Comm.SelectCommand.Transaction = Tran;
                DataTable Dtable = new DataTable();
                Comm.Fill(Dtable);
                return Dtable;
            }
        }

        private string DelFormat(string ProductCode, string ProductSortCode, string ShopCode)
        {
            string Delete = string.Format("Delete from tbHQPriceSystemFour where ProductCode={0}"
                    + " and ProductSortCode={1} and ShopCode = {2}"
                    , ProductCode, ProductSortCode, ShopCode);
            return Delete;
        }

        private string InsertFormat(string ProductCode, string ProductSortCode, string ShopCode, string TradePrice,
                            string RetailPrice, string MinPrice)
        {
            string Insert = string.Format("Insert into tbHQPriceSystemFour(ProductCode,ProductSortCode,ShopCode,TradePrice,RetailPrice,MinPrice) "
                 + " values ('{0}',{1},'{2}',{3},{4},{5})", ProductCode, ProductSortCode, ShopCode, TradePrice, RetailPrice, MinPrice);
            return Insert;
        }
        #endregion

        protected override void ExecState(SqlConnection Connect, SqlTransaction Tran, DataRow Row)
        {
            if ((int)Row["TheState"] == 1)
            {
                bool b = BitTermMath.GetBitTrue((int)Row["TheState"], BitTermMath.TermOne);
                DataTable DtPrice = SelTab(Connect, Tran, SelStr, (string)Row["BillNo"]);
                if (b)
                {
                    foreach (DataRow Dt in DtPrice.Rows)
                    {
                        string sql = string.Format(IsNum, string.Format("'{0}'", Dt["ProductCode"]), string.Format("'{0}'", Dt["ProductSortCode"]),
                                               string.Format("'{0}'", Dt["ShopCode"]));
                        SqlCommand cmd = new SqlCommand(sql, Connect);
                        cmd.Transaction = Tran;
                        object objItem = cmd.ExecuteScalar();

                        if ((int)objItem > 0)
                        {
                            string DelTable = DelFormat(string.Format("'{0}'", Dt["ProductCode"]), string.Format("'{0}'", Dt["ProductSortCode"])
                                                , string.Format("'{0}'", Dt["ShopCode"]));
                            DataTable FDataTable = ADataTable(Connect, Tran, DelTable);

                            string InsTable = InsertFormat((string)Dt["ProductCode"], string.Format("'{0}'", Dt["ProductSortCode"]),
                                                           string.Format("{0}", Dt["ShopCode"]), string.Format("{0}", Dt["TradePrice"]),
                                                           string.Format("{0}", Dt["RetailPrice"]), string.Format("{0}", Dt["MinPrice"]));
                            DataTable LDataTable = ADataTable(Connect, Tran, InsTable);
                        }
                        else
                        {
                            string InsTable = InsertFormat((string)Dt["ProductCode"], string.Format("'{0}'", Dt["ProductSortCode"]),
                                                           string.Format("{0}", Dt["ShopCode"]), string.Format("{0}", Dt["TradePrice"]),
                                                           string.Format("{0}", Dt["RetailPrice"]), string.Format("{0}", Dt["MinPrice"]));
                            DataTable FDataTable = ADataTable(Connect, Tran, InsTable);
                        }
                    }
                }
            }
            else
            {
                Exception e = new Exception("��ǰ������Ч!");
                e.Data.Add(xzException.Key, new xzException(xzExceptionMode.User));
                throw e;
            }
        }
    }

    /// <summary>
    /// �ܲ��۸�������
    /// </summary>
    public class SvrDatumPriceChange : SvrSystemDB
    {
    }

    /// <summary>
    /// ���ݽ��
    /// </summary>
    public class SvrFinReckoning : SvrSystemDB, IServerSkedUserExecEx
    {
        //������ʵĽṹ��Ϣ
        private void SaveReckonInfo(SqlCommand cmd, object time)
        {
            string SqlStr = @"update tsSystem set ReckonTime='{0}' where TheCode = '{1}'";
            cmd.CommandText = string.Format(SqlStr, time, SystemGuble._PlacelNo);
            cmd.ExecuteNonQuery();
        }

        //�ж��Ƿ��޴�����Ʒ�����Ϣ�Ƿ�һ��
        private bool isExecReckon(SqlCommand cmd, object time)
        {
            string SqlStr = @"select max(TheDate) from tbCourseStorStorage where TheDate<'{0}'";
            cmd.CommandText = string.Format(SqlStr, time);
            object sender = cmd.ExecuteScalar();
            if (sender == null || sender == DBNull.Value) sender = Convert.ToDateTime("1900-1-1");
            SqlStr =
              @"select ProductSortCode, ProductCode, StorageCode,PlaceCode, sum(Number) Number, sum(CostMoney) CostMoney
                into #tmp
                from
                  (
                   --���
                    select ProductSortCode, ProductCode, StorageCode,PlaceCode,Number, CostMoney
                    from tbCourseStorStorage
                    where TheDate='{0}'  and (ProductSortCode in ('003','002','004')) -- and (a.ProductSortCode in ('003','002'))
                    ----�ڳ�
                    union all
                    --�⹺��ⵥ
                    select a.ProductSortCode, a.ProductCode, a.StorageCode,a.PlaceCode,a.Number, a.SumMoney
                    from tbStorStockInItem a
                    left outer join tbStorStockIn b on a.BillNo=b.BillNo
                    where dbo.GetByteToBoolean(b.TheState,0x0001)=1 and b.AssistantCode<>'ZGRKCSH'  and ((b.TheDate > '{0}' and b.TheDate <= '{1}') and a.ProductSortCode in ('003','002','004')) and a.isListNo = 0
                    union all
                    --������ⵥ
                    select a.ProductSortCode, a.ProductCode,a.StorageCode,a.PlaceCode, a.Number, a.SumMoney
                    from tbStorOtherInItem a
                    left outer join tbStorOtherIn b on a.BillNo=b.BillNo
                    where dbo.GetByteToBoolean(b.TheState,0x0001)=1 and b.AssistantCode<>'DKHX'  and ((b.TheDate > '{0}' and b.TheDate <= '{1}') and a.ProductSortCode in ('003','002','004')) and a.isListNo = 0
                    union all
                    --�̵�
                    select a.ProductSortCode, a.ProductCode,b.StorageCode, a.PlaceCode,a.Number, a.SumMoney
                    from tbStorCheckItem a
                    left outer join tbStorCheck b on a.BillNo=b.BillNo
                    where dbo.GetByteToBoolean(b.TheState,0x0001)=1  and ((b.TheDate > '{0}' and b.TheDate <= '{1}') and a.ProductSortCode in ('003','002','004'))  and a.isListNo = 0
                    union all
                    --�������
                    select a.ProductSortCode, a.ProductCode,a.InStorageCode,a.InPlaceCode,a.Number, a.InSumMoney
                    from tbStorRedeployItem a
                    left outer join tbStorRedeploy b on a.BillNo=b.BillNo
                    where dbo.GetByteToBoolean(b.UseState,0x0010)=1  and ((b.ConfirmDate > '{0}' and b.ConfirmDate <= '{1}') and a.ProductSortCode in ('003','002','004'))  and a.isListNo = 0
                    union all
                    --���۳��ⵥ
                    select a.ProductSortCode, a.ProductCode, a.StorageCode,a.PlaceCode,-a.Number, -a.SumMoney
                    from tbSaleOutItem a
                    left outer join tbSaleOut b on a.BillNo=b.BillNo
                    where dbo.GetByteToBoolean(b.TheState,0x0001)=1 and b.AssistantCode<>'WTDXCSH'  and ((b.TheDate > '{0}' and b.TheDate <= '{1}') and a.ProductSortCode in ('003','002','004'))  and a.isListNo = 0
                    union all
                    --���ۿ���
                    select a.ProductSortCode, a.ProductCode,a.StorageCode,a.PlaceCode, -a.Number, -a.SumMoney
                    from tbSelfSaleOutItem a
                    left outer join tbSelfSaleOut b on a.BillNo=b.BillNo
                    where dbo.GetByteToBoolean(b.TheState,0x0001)=1  and ((b.TheDate > '{0}' and b.TheDate <= '{1}') and a.ProductSortCode in ('003','002','004'))  and a.isListNo = 0
                    union all
                    --��������
                    select a.ProductSortCode, a.ProductCode,a.OutStorageCode,a.OutPlaceCode, -a.Number, -a.OutSumMoney
                    from tbStorRedeployItem a
                    left outer join tbStorRedeploy b on a.BillNo=b.BillNo
                    where dbo.GetByteToBoolean(b.TheState,0x0001)=1  and ((b.TheDate > '{0}' and b.TheDate <= '{1}') and a.ProductSortCode in ('003','002','004'))  and a.isListNo = 0
                    union all
                    --��������
                    select a.ProductSortCode, a.ProductCode,a.StorageCode,a.PlaceCode, -a.Number, -a.SumMoney
                    from tbStorOtherOutItem a
                    left outer join tbStorOtherOut b on a.BillNo=b.BillNo
                    where dbo.GetByteToBoolean(b.TheState,0x0001)=1  and ((b.TheDate > '{0}' and b.TheDate <= '{1}') and a.ProductSortCode in ('003','002','004'))  and a.isListNo = 0
                    union all
                    --ά�޼ĳ�
                    select a.ProductSortCode, a.ProductCode, a.StorageCode,a.PlaceCode,-a.Number, -a.SumMoney
                    from tbStorMaintainPostSelfItem a
                    left outer join tbStorMaintainPostSelf b on a.BillNo=b.BillNo
                    where dbo.GetByteToBoolean(b.TheState,0x0001)=1 and b.AssistantCode<>'WXCCSH'  and ((b.TheDate > '{0}' and b.TheDate <= '{1}') and a.ProductSortCode in ('003','002','004'))  and a.isListNo = 0
                    union all
                    --�ɱ�����
                    select a.ProductSortCode, a.ProductCode, a.StorageCode,a.PlaceCode,0, a.TotalMoney
                    from tbFinCostAdjustItem a
                    Left outer Join tbFinCostAdjust b on a.BillNo = b.BillNo
                    where dbo.GetByteToBoolean(b.TheState,0x0001)=1  and ((b.TheDate > '{0}' and b.TheDate <= '{1}') and a.ProductSortCode in ('003','002','004'))  and a.isListNo = 0
                ) mm
                group by ProductSortCode, ProductCode, StorageCode,PlaceCode

                -------------���-------------
                select count(*) from #tmp a
                Left Outer Join tbCourseStorPrice b on a.ProductSortCode = b.ProductSortCode and a.ProductCode = b.ProductCode
                     and a.StorageCode = b.StorageCode and a.PlaceCode = b.PlaceCode and b.theDate = '{1}'
                where isnull(a.Number,0) <> isnull(b.Number,0)
                drop table #tmp
            ";

            cmd.CommandText = string.Format(SqlStr, sender, time);
            return xzSqlAnalysis.getValue(cmd.ExecuteScalar()) == 0m;
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;

            Hashtable haResult = new Hashtable();
            Connect.Open();
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Connect;
                switch (ID)
                {
                    case 0:
                        if (!isExecReckon(cmd, ht[0])) xzException.WarnBox("[�޴�����Ʒ]�ĺ�����治һ����");
                        SaveReckonInfo(cmd, ht[0]);
                        break;
                    case 1:                        
                        SaveReckonInfo(cmd, ht[0]);
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

    #region �ɱ�ά��

    /// <summary>
    /// �ɱ�����
    /// </summary>
    public class SvrFinCostingBase : SvrSystemDB
    {
        protected void isEnter(SqlCommand cmd, Hashtable ht)
        {
            string sqlcheck = @"  
                            select count(*) from tbStorStockIn
                            where  dbo.GetByteToBoolean(TheState,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlcheck, ht[3], ht[4]);
            int m_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (m_count > 0)
                xzException.WarnBox(string.Format("�⹺��ⵥ ���� {0}�� δȷ�ϵ���", m_count));

            sqlcheck = @"  
                            select count(*) from tbStorOtherIn
                            where  dbo.GetByteToBoolean(TheState,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlcheck, ht[3], ht[4]);
            m_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (m_count > 0)
                xzException.WarnBox(string.Format("������ⵥ ���� {0}�� δȷ�ϵ���", m_count));

            sqlcheck = @"  
                            select count(*) from tbStorCheck
                            where  dbo.GetByteToBoolean(TheState,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlcheck, ht[3], ht[4]);
            m_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (m_count > 0)
                xzException.WarnBox(string.Format("����̵㵥 ���� {0}�� δȷ�ϵ���", m_count));

            sqlcheck = @"  
                            select count(*) from tbSaleOut
                            where  dbo.GetByteToBoolean(TheState,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlcheck, ht[3], ht[4]);
            m_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (m_count > 0)
                xzException.WarnBox(string.Format("���۳��ⵥ ���� {0}�� δȷ�ϵ���", m_count));

            sqlcheck = @"  
                            select count(*) from tbStorOtherOut
                            where  dbo.GetByteToBoolean(TheState,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlcheck, ht[3], ht[4]);
            m_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (m_count > 0)
                xzException.WarnBox(string.Format("�������ⵥ ���� {0}�� δȷ�ϵ���", m_count));

            sqlcheck = @"  
                            select count(*) from tbSelfSaleOut
                            where  dbo.GetByteToBoolean(TheState,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlcheck, ht[3], ht[4]);
            m_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (m_count > 0)
                xzException.WarnBox(string.Format("���ۿ��� ���� {0}�� δȷ�ϵ���", m_count));

            sqlcheck = @"  
                            select count(*) from tbStorMaintainPostSelf
                            where  dbo.GetByteToBoolean(TheState,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlcheck, ht[3], ht[4]);
            m_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (m_count > 0)
                xzException.WarnBox(string.Format("ֱӪ��ά���ĳ��� ���� {0} δȷ�ϵ���", m_count));

            sqlcheck = @"  
                            select count(*) from tbStorRedeploy
                            where  dbo.GetByteToBoolean(TheState,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlcheck, ht[3], ht[4]);
            m_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (m_count > 0)
                xzException.WarnBox(string.Format("�ֿ������ ���� {0} δȷ�ϵ���", m_count));
        }

        protected void isCheck(SqlCommand cmd, Hashtable ht)
        {
            string sqlAuditing = @"  
                            select count(*) from tbStorStockIn
                            where  dbo.GetByteToBoolean(FlowBit,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlAuditing, ht[3], ht[4]);
            int mAuditing_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (mAuditing_count > 0)
                xzException.WarnBox(string.Format("�⹺��ⵥ ���� {0}�� δ��˵���", mAuditing_count));

            sqlAuditing = @"  
                            select count(*) from tbStorOtherIn
                            where  dbo.GetByteToBoolean(FlowBit,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlAuditing, ht[3], ht[4]);
            mAuditing_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (mAuditing_count > 0)
                xzException.WarnBox(string.Format("������ⵥ ���� {0}�� δ��˵���", mAuditing_count));

            sqlAuditing = @"  
                            select count(*) from tbStorCheck
                            where  dbo.GetByteToBoolean(FlowBit,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlAuditing, ht[3], ht[4]);
            mAuditing_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (mAuditing_count > 0)
                xzException.WarnBox(string.Format("����̵㵥 ���� {0}�� δ��˵���", mAuditing_count));

            sqlAuditing = @"  
                            select count(*) from tbSaleOut
                            where  dbo.GetByteToBoolean(FlowBit,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlAuditing, ht[3], ht[4]);
            mAuditing_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (mAuditing_count > 0)
                xzException.WarnBox(string.Format("���۳��ⵥ ���� {0}�� δ��˵���", mAuditing_count));

            sqlAuditing = @"  
                            select count(*) from tbStorOtherOut
                            where  dbo.GetByteToBoolean(FlowBit,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlAuditing, ht[3], ht[4]);
            mAuditing_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (mAuditing_count > 0)
                xzException.WarnBox(string.Format("�������ⵥ ���� {0}�� δ��˵���", mAuditing_count));

            sqlAuditing = @"  
                            select count(*) from tbSelfSaleOut
                            where  and dbo.GetByteToBoolean(FlowBit,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlAuditing, ht[3], ht[4]);
            mAuditing_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (mAuditing_count > 0)
                xzException.WarnBox(string.Format("���ۿ��� ���� {0}�� δ��˵���", mAuditing_count));

            sqlAuditing = @"  
                            select count(*) from tbStorMaintainPostSelf
                            where  dbo.GetByteToBoolean(FlowBit,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlAuditing, ht[3], ht[4]);
            mAuditing_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (mAuditing_count > 0)
                xzException.WarnBox(string.Format("ֱӪ��ά���ĳ��� ���� {0} δ��˵���", mAuditing_count));

            sqlAuditing = @"  
                            select count(*) from tbStorRedeploy
                            where  dbo.GetByteToBoolean(FlowBit,0x0001)=0 and TheDate>='{0}' and TheDate<='{1}'";
            cmd.CommandText = string.Format(sqlAuditing, ht[3], ht[4]);
            mAuditing_count = Convert.ToInt32(cmd.ExecuteScalar());
            if (mAuditing_count > 0)
                xzException.WarnBox(string.Format("�ֿ������ ���� {0} δ��˵���", mAuditing_count));
        }
    }

    /// <summary>
    /// �ɱ�����[��Ʒ]
    /// </summary>
    public class SvrFinCosting : SvrFinCostingBase, IServerSkedUserExecEx
    {
        public decimal getProductCost(Hashtable ht, int ID, SqlCommand cmd)
        {
            decimal InCostPrice = 0m;
            xzFinPriceManage FPriceManage = new xzFinPriceManage();
            FPriceManage.Command = cmd;
            DataRow CurrRow = (ht[0] as DataTable).Rows[0];
            bool isStorage = Convert.ToBoolean(ht[9]);
            string cause = "";
            if (ht.ContainsKey(3)) cause = ht[3].ToString();
            if (isStorage) cause = string.Format(" and StorageCode = '{0}'", CurrRow["StorageCode"]);
            switch (ID)
            {
                case 0:
                    #region ���ɹ�����
                    InCostPrice = FPriceManage.getStockInCostPrice(CurrRow, CurrRow["TheDate"], cause);
                    #endregion
                    break;
                case 1:
                    #region �����������
                    InCostPrice = FPriceManage.getOtherInCostPrice(CurrRow, CurrRow["TheDate"], cause);
                    #endregion
                    break;
                case 2:
                    #region �������
                    InCostPrice = FPriceManage.getInCostPrice(CurrRow, CurrRow["TheDate"], cause);                   
                    #endregion
                    break;
                case 3:
                    #region ����Ȩ��
                    InCostPrice = FPriceManage.getAvgCostPrice(CurrRow, CurrRow["TheDate"], cause);
                    #endregion
                    break;
            }
            return InCostPrice;
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            DataTable Table;
            SqlTransaction SqlTrans;
            HYProductFlowtCost FProductFlowtCost;
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;
            Hashtable haResult = new Hashtable();
            Connect.Open();
            try
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = Connect;
                    switch (ID)
                    {
                        case 0:
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                            haResult.Add(0, getProductCost(ht, ID, cmd));//��ȡ�۸�
                            break;
                        case 5:
                            isEnter(cmd, ht); //ȷ����֤
                            break;
                        case 6:
                            isCheck(cmd, ht); //��˼��
                            break;
                        case 7:
                            #region ��˼��
                            string StrSql = @"select count(*) from tbStorStorageProduct 
                                   where HandleSort in ('010','020','060','101','111','121') and isnull(SumMoney,0) = 0
                                         and TheDate>='{0}' and TheDate<='{1}'";
                            cmd.CommandText = string.Format(StrSql, ht[3], ht[4]);
                            int count = Convert.ToInt32(cmd.ExecuteScalar());
                            if (count > 0)
                                xzException.WarnBox(string.Format("�ɱ�ά��δ��� ���� {0}�� δά��", count));
                            #endregion
                            break;
                        case 10:
                            #region  ��Դ���ĳɱ����µ���ת����
                            Table = ht[0] as DataTable;
                            SqlTrans = Connect.BeginTransaction();
                            try
                            {
                                cmd.Transaction = SqlTrans;
                                foreach (DataRow CurrRow in Table.Rows)
                                    HYProductFlowtCost.UpdateFlowtCostMoney(cmd, CurrRow);
                                SqlTrans.Commit();
                            }
                            catch(Exception err)
                            {
                                SqlTrans.Rollback();
                                xzException.WarnBox(err.Message);
                            }
                            #endregion
                            break;
                        case 11:
                            #region  ͬʱ������ת��ԭ��������
                            Table = ht[0] as DataTable;
                            SqlTrans = Connect.BeginTransaction();
                            try
                            {
                                cmd.Transaction = SqlTrans;
                                FProductFlowtCost = new HYProductFlowtCost();
                                FProductFlowtCost.Command = cmd;
                                FProductFlowtCost.UpdateFlowtAndSourceCostMoney(Table);
                                SqlTrans.Commit();
                            }
                            catch(Exception err)
                            {
                                SqlTrans.Rollback();
                                xzException.WarnBox(err.Message);
                            }
                            #endregion
                            break;
                        case 12:
                            #region  ���гɱ�����
                            Table = new DataTable();
                            using (SqlDataAdapter sqlda = new SqlDataAdapter())
                            {
                                sqlda.SelectCommand = cmd;
                                DateTime BeginTime = Convert.ToDateTime(ht[3]), EndTime = Convert.ToDateTime(ht[4]);
                                string cuase = ht[5].ToString();
                                if (cuase != "") cuase = string.Format(" and {0}", cuase);
                                
                                //���������̵Ķ���
                                xzFinPriceHistory FinPriceHistory = new xzFinPriceHistory();
                                FinPriceHistory.HistoryNo = GetBillNo("yyyyMMdd?????", "", "tbFinMaintainHistory", "BillNo", Connect);
                                FinPriceHistory.ModuleName = ht[1].ToString();
                                FinPriceHistory.UserNo = ht[2].ToString();
                                FinPriceHistory.TheDate = EndTime;
                                FinPriceHistory.Command = cmd;
   
                                #region ִ�к���
                                FProductFlowtCost = new HYProductFlowtCost();
                                FProductFlowtCost.Command = cmd;

                                //��ȡ���ڽ��۸��嵥
                                Hashtable HaPrice = FProductFlowtCost.getStorPrice(sqlda, BeginTime, cuase);

                                //��ȡά��������
                                cmd.CommandText =
                                    string.Format(@"select * from tbStorStorageProduct 
                                     Where TheDate >= '{0}' and TheDate <= '{1}' {2} 
                                  order by ProductSortCode, ProductCode, SerialNo", BeginTime, EndTime, cuase);
                                sqlda.Fill(Table);

                                SqlTrans = Connect.BeginTransaction();
                                try
                                {
                                    FProductFlowtCost.Command.Transaction = SqlTrans;
                                    FProductFlowtCost.DealCalc(Table, HaPrice, EndTime, cuase, FinPriceHistory);
                                    SqlTrans.Commit();
                                }
                                catch (Exception err)
                                {
                                    SqlTrans.Rollback();
                                    xzException.WarnBox(err.Message);
                                }  
                                #endregion
                            }
                            #endregion
                            break;
                    }
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
    /// �ɱ�����[����]
    /// </summary>
    public class SvrFinCostingList : SvrFinCostingBase, IServerSkedUserExecEx
    {
        public decimal getListCost(Hashtable ht, int ID, SqlCommand cmd)
        {
            decimal InCostPrice = 0m;
            xzFinPriceManage FPriceManage = new xzFinPriceManage();
            FPriceManage.Command = cmd;
            DataRow CurrRow = (ht[0] as DataTable).Rows[0];
            bool isStorage = Convert.ToBoolean(ht[9]);
            string cause = "";
            if (ht.ContainsKey(3)) cause = ht[3].ToString();
            if (isStorage) cause = string.Format(" and StorageCode = '{0}'", CurrRow["StorageCode"]);
            switch (ID)
            {
                case 0:
                    #region ���ɹ�����
                    InCostPrice = FPriceManage.getStockInCostPriceList(CurrRow, CurrRow["TheDate"], cause);
                    #endregion
                    break;
                case 1:
                    #region �����������
                    InCostPrice = FPriceManage.getOtherInCostPriceList(CurrRow, CurrRow["TheDate"], cause);
                    #endregion
                    break;
                case 2:
                    #region �������
                    InCostPrice = FPriceManage.getInCostPriceList(CurrRow, CurrRow["TheDate"], cause);
                    #endregion
                    break;
                case 3:
                    #region ����Ȩ��
                    InCostPrice = FPriceManage.getAvgCostPriceList(CurrRow, CurrRow["TheDate"], cause);
                    #endregion
                    break;
            }
            return InCostPrice;
        }

        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            DataTable Table;
            SqlTransaction SqlTrans;
            HYListFlowtCost FListFlowtCost;
            string StrSql;
            int count;
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;
            Hashtable haResult = new Hashtable();
            Connect.Open();
            try
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = Connect;
                    switch (ID)
                    {
                        case 0:
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                            haResult.Add(0, getListCost(ht, ID, cmd));//��ȡ�۸�
                            break;
                        case 5:
                            isEnter(cmd, ht); //ȷ����֤
                            break;
                        case 6:
                            isCheck(cmd, ht); //��˼��
                            break;
                        case 7:
                            #region ��˼��
                            StrSql = @"select count(*) from tbStorStorageList 
                                   where HandleSort in ('010','020','060','101','111','121') and isnull(SumMoney,0) = 0
                                         and TheDate>='{0}' and TheDate<='{1}'";
                            cmd.CommandText = string.Format(StrSql, ht[3], ht[4]);
                            count = Convert.ToInt32(cmd.ExecuteScalar());
                            if (count > 0)
                                xzException.WarnBox(string.Format("�ɱ�ά��δ��� ���� {0}�� δά��", count));
                            #endregion
                            break;
                        case 8:
                            #region �ĳ�ά�޷��ؼ��[�Ƿ����Ե��ݼ�������]
                            StrSql = @"select count(*)
                                        from tbStorOtherInItemDetail a 
                                       left outer join tbStorOtherInItem b on a.BillNo=b.BillNo and a.RowNo=b.RowNo 
                                       left outer join tbStorOtherIn c on a.BillNo=c.BillNo 
                                       where a.IsVerify=0 and c.TheDate>='{0}'and c.TheDate<='{1}' 
                                           and c.InModeCode in ('001','099') and  dbo.GetByteToBoolean(c.TheState,0x0001)=1 ";
                            cmd.CommandText = string.Format(StrSql, ht[3], ht[4]);
                            count = Convert.ToInt32(cmd.ExecuteScalar());
                            if (count > 0)
                                xzException.WarnBox(string.Format("�ĳ�ά�޷��ص� ���� {0}�� δ��������", count));
                            #endregion
                            break;
                        case 10:
                            #region  ��Դ���ĳɱ����µ���ת����
                            Table = ht[0] as DataTable;
                            SqlTrans = Connect.BeginTransaction();
                            try
                            {
                                cmd.Transaction = SqlTrans;
                                foreach (DataRow CurrRow in Table.Rows)
                                    HYListFlowtCost.UpdateFlowtCostMoney(cmd, CurrRow);
                                SqlTrans.Commit();
                            }
                            catch (Exception err)
                            {
                                SqlTrans.Rollback();
                                xzException.WarnBox(err.Message);
                            }
                            #endregion
                            break;
                        case 11:
                            #region  ͬʱ������ת��ԭ��������
                            Table = ht[0] as DataTable;
                            SqlTrans = Connect.BeginTransaction();
                            try
                            {
                                cmd.Transaction = SqlTrans;
                                FListFlowtCost = new HYListFlowtCost();
                                FListFlowtCost.Command = cmd;
                                FListFlowtCost.UpdateFlowtAndSourceCostMoney(Table);
                                SqlTrans.Commit();
                            }
                            catch (Exception err)
                            {
                                SqlTrans.Rollback();
                                xzException.WarnBox(err.Message);
                            }
                            #endregion
                            break;
                        case 12:
                            #region  ���гɱ�����
                            Table = new DataTable();
                            using (SqlDataAdapter sqlda = new SqlDataAdapter())
                            {
                                sqlda.SelectCommand = cmd;
                                DateTime BeginTime = Convert.ToDateTime(ht[3]), EndTime = Convert.ToDateTime(ht[4]);
                                string cuase = ht[5].ToString();
                                if (cuase != "") cuase = string.Format(" and {0}", cuase);

                                //���������̵Ķ���
                                xzFinPriceHistory FinPriceHistory = new xzFinPriceHistory();
                                FinPriceHistory.HistoryNo = GetBillNo("yyyyMMdd?????", "", "tbFinMaintainHistory", "BillNo", Connect);
                                FinPriceHistory.ModuleName = ht[1].ToString();
                                FinPriceHistory.UserNo = ht[2].ToString();
                                FinPriceHistory.TheDate = EndTime;
                                FinPriceHistory.Command = cmd;

                                #region ִ�к���
                                FListFlowtCost = new HYListFlowtCost();
                                FListFlowtCost.Command = cmd;

                                //��ȡ���ڽ��۸��嵥
                                Hashtable HaPrice = FListFlowtCost.getStorPrice(sqlda, BeginTime);

                                //��ȡ�����ռǶ��ձ�
                                Hashtable HaMaintainOpposite = FListFlowtCost.getMaintainOpposite(sqlda, BeginTime, EndTime);

                                //��ȡά��������
                                cmd.CommandText = string.Format(@"select *, SumMoney / Number InCostPrice 
                                  from tbStorStorageList Where TheDate >= '{0}' and TheDate <= '{1}' {2}
                                  order by ProductSortCode, ProductCode, ListNo, SerialNo", BeginTime, EndTime, cuase);
                                sqlda.Fill(Table);
                                SqlTrans = Connect.BeginTransaction();
                                try
                                {
                                    FListFlowtCost.Command.Transaction = SqlTrans;
                                    FListFlowtCost.DealCalc(Table, HaMaintainOpposite, HaPrice, EndTime, cuase, FinPriceHistory);
                                    SqlTrans.Commit();
                                }
                                catch (Exception err)
                                {
                                    SqlTrans.Rollback();
                                    xzException.WarnBox(err.Message);
                                }
                                #endregion
                            }
                            #endregion
                            break;
                    }
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
    /// ά���ռ�
    /// </summary>
    public class SvrFinCostingRecord : SvrSystemDB, IServerSkedUserExecEx
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
                        #region ��ȡ��ʷ��¼
                        using (SqlCommand FCommand = new SqlCommand())
                        {
                            FCommand.Connection = Connect;
                            xzFinPriceHistory FinPriceHistory = new xzFinPriceHistory();
                            FinPriceHistory.Command = FCommand;
                            FinPriceHistory.ModuleName = ht[0].ToString();
                            FinPriceHistory.TheDate = Convert.ToDateTime(ht[1]);
                            htResult.Add(0, FinPriceHistory.getHistoryList());
                        }
                        #endregion
                        break;
                    case 1:
                        #region ��ȡ��ʷ��¼��Ϣ
                        using (SqlCommand FCommand = new SqlCommand())
                        {
                            FCommand.Connection = Connect;
                            xzFinPriceHistory FinPriceHistory = new xzFinPriceHistory();
                            FinPriceHistory.Command = FCommand;
                            FinPriceHistory.HistoryNo = ht[0].ToString();
                            byte[] bytes = FinPriceHistory.getHistoryInfo();
                            if (bytes != null)
                            {
                                ArrayList HistoryArg = xzStreamStorage.getStreamToArray(bytes);
                                htResult.Add(0, HistoryArg);
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
            return htResult;
        }
    }

    /// <summary>
    /// �ɱ�������
    /// </summary>
    public class SvrSystemErrorPriceAdjust : SvrSystemDB, IServerSkedUserExecEx
    {
        public Hashtable getUserHashtable(Hashtable ht, int ID, xzRemotingParam RemotingParam)
        {
            if (RemotingParam.ConnectionString != "")
                Connect.ConnectionString = RemotingParam.ConnectionString;
            Hashtable htResult = new Hashtable();

            //���ɵ���
            xzLoginInfo FLoginInfo = ht[2] as xzLoginInfo;
            string s_BillNo = "", sStyle = "yyyyMMdd???";
            byte[] bytes = LoadSystemModuleParam("FinCostAdjust", RemotingParam);
            xzSystemModuleParam FSystemModuleParam = xzSystemDeal.getSystemModuleParam(bytes);
            if (FSystemModuleParam != null)
            {
                xzSystemModuleCode FModuleCode = xzSystemDeal.getSystemModuleCode(FSystemModuleParam, FLoginInfo, null);
                FModuleCode.TableName = "tbFinCostAdjust";
                FModuleCode.FieldCode = "BillNo";
                sStyle = GetBillNo(FModuleCode, RemotingParam);
                s_BillNo = xzSystemDeal.getBillNo(sStyle, FModuleCode);
            }
            else s_BillNo = GetBillNo(sStyle, "", "tbFinCostAdjust", "BillNo", RemotingParam);

            Connect.Open();
            try
            {
                SqlTransaction SqlTran = Connect.BeginTransaction();
                try
                {
                    string sqlMaster = @"Insert into tbFinCostAdjust (BillNo,TheDate,BillSort,TheState,Creater,CreateTime,Stater,StateTime,Editer,EditeTime)
                        values ('{0}',{1},'001',1,'{2}',getdate(),'{2}',getdate(),'{2}',getdate())";
                    string sqlDetail = @"Insert into tbFinCostAdjustItem (BillNo,RowNo,StorageCode,PlaceCode,
                        ProductSortCode,ProductCode,IsListNo,TotalMoney) values ('{0}',{1},'{2}','{3}','{4}','{5}',0, {6})";
                    DataTable Table = ht[0] as DataTable;
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = Connect;
                        cmd.Transaction = SqlTran;
                        cmd.CommandText = string.Format(sqlMaster, s_BillNo, ht[3], FLoginInfo.LoginUser);
                        cmd.ExecuteNonQuery();

                        int i = 1;
                        foreach (DataRow row in Table.Rows)
                        {
                            cmd.CommandText = string.Format(sqlDetail, s_BillNo, i, row["StorageCode"], row["PlaceCode"],
                                row["ProductSortCode"], row["ProductCode"], -Convert.ToDecimal(row["SumMoney"]));
                            cmd.ExecuteNonQuery();
                            i++;
                        }
                    }
                    SqlTran.Commit();
                }
                catch
                {
                    SqlTran.Rollback();
                    throw;
                }

            }
            finally
            {
                Connect.Close();
            }
            return htResult;
        }
    }
    #endregion

    #region ����

    /// <summary>
    /// ���ųɱ���һ����ѯ
    /// </summary>
    public class SvrReportListNotSame : SvrReport
    {
        public override DataTable GetDataTable(Hashtable htParameters, string command, xzRemotingParam RemotingParam)
        {            
            DataTable Table = base.GetDataTable(htParameters, command, RemotingParam);
            DataTable ReturnTable = Table.Clone();

            ArrayList PriceArg = new ArrayList();
            string ListNo = "";
            decimal SumMoney = 0m;
            foreach (DataRow row in Table.Rows)
            {
                string tmpListNo = row["ListNo"].ToString();
                decimal tmpSumMoney = xzSqlAnalysis.getAbsValue(row["SumMoney"]);

                if (ListNo == "" || (tmpListNo == ListNo && tmpSumMoney != SumMoney))
                    PriceArg.Add(row);

                if (tmpListNo != ListNo)
                {
                    if (PriceArg.Count > 1)
                    {
                        foreach (DataRow CurrRow in PriceArg)
                            ReturnTable.ImportRow(CurrRow);
                    }
                    PriceArg.Clear();
                }
                ListNo = tmpListNo;
                SumMoney = tmpSumMoney;
            }
            return ReturnTable;
        }
    }

    #endregion
}