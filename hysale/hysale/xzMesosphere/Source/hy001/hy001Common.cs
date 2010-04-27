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
    /// <summary>
    /// ������Ϣ
    /// </summary>
    public sealed class HYStorageMessage
    {
        public const string _MsgHasAuditing = "��ǰ�����Ѿ���ˣ�����ִ�е�ǰ�Ĳ�����";
        public const string _MsgHasVerify = "��ǰ�����Ѿ�����������ִ�е�ǰ�Ĳ�����";
        public const string _MsgBillNoCheck = "��ǰ�����Ѿ���������ִ�е�ǰ�Ĳ�����";
        public const string _MsgStorageIsEnough = "��治�㣡";
        public const string _MsgSourceBillIsEnough = "ԭ���������㣡";

        /// <summary>
        /// �������Ƿ���Խ��и���
        /// </summary>
        public static void HintChange(SqlCommand command, string TableName, params object[] keys)
        {
            //���񼺾����
            command.CommandText = string.Format(@"select FlowBit from {0}", TableName);
            command.CommandText = command.CommandText + string.Format(@" where BillNo = '{0}'", keys);
            object value = command.ExecuteScalar();

            if (BitTermMath.GetBitTrue((int)value, BitTermMath.TermOne))
                xzException.WarnBox(_MsgHasAuditing);
        }

        /// <summary>
        /// �������Ƿ���Լ���������
        /// </summary>
        public static void HintLock(SqlCommand command, string TableName, params object[] keys)
        {
            command.CommandText = string.Format(@"select UseState from {0}", TableName);
            command.CommandText = command.CommandText + string.Format(@" where BillNo = '{0}'", keys);
            object value = command.ExecuteScalar();

            if (BitTermMath.GetBitFalse((int)value, BitTermMath.TermSix))
                xzException.WarnBox("��ǰ����δ����������ִ�е�ǰ�Ĳ�����");
        }
    }

    /// <summary>
    /// Ĭ���ֶ�����
    /// </summary>
    public class HYField
    {
        #region Ĭ�ϵ��ֶ�����
        private string FFieldSrcBillNo = "SrcBillNo";
        [Description("ԭ������"), Category("Xzz")]
        public string FieldSrcBillNo
        {
            get
            {
                return FFieldSrcBillNo;
            }
            set
            {
                if (FFieldSrcBillNo != value)
                {
                    FFieldSrcBillNo = value;
                }
            }
        }

        private string FFieldProductSort = "ProductSortCode";
        [Description("��Ʒ�����"), Category("Xzz")]
        public string FieldProductSort
        {
            get
            {
                return FFieldProductSort;
            }
            set
            {
                if (FFieldProductSort != value)
                {
                    FFieldProductSort = value;
                }
            }
        }

        private string FFieldProduct = "ProductCode";
        [Description("�����ֶ�"), Category("Xzz")]
        public string FieldProduct
        {
            get
            {
                return FFieldProduct;
            }
            set
            {
                if (FFieldProduct != value)
                {
                    FFieldProduct = value;
                }
            }
        }

        private string FFieldStorage = "StorageCode";
        [Description("�ֿ��ֶ�"), Category("Xzz")]
        public string FieldStorage
        {
            get
            {
                return FFieldStorage;
            }
            set
            {
                if (FFieldStorage != value)
                {
                    FFieldStorage = value;
                }
            }
        }

        private string FFieldPlace = "PlaceCode";
        [Description("��λ�ֶ�"), Category("Xzz")]
        public string FieldPlace
        {
            get
            {
                return FFieldPlace;
            }
            set
            {
                if (FFieldPlace != value)
                {
                    FFieldPlace = value;
                }
            }
        }

        private string FFieldNumber = "Number";
        [Description("�����ֶ�"), Category("Xzz")]
        public string FieldNumber
        {
            get
            {
                return FFieldNumber;
            }
            set
            {
                if (FFieldNumber != value)
                {
                    FFieldNumber = value;
                }
            }
        }

        private string FFieldListNo = "ListNo";
        [Description("�����ֶ�"), Category("Xzz")]
        public string FieldListNo
        {
            get
            {
                return FFieldListNo;
            }
            set
            {
                if (FFieldListNo != value)
                {
                    FFieldListNo = value;
                }
            }
        }

        private string FFieldBillNo = "BillNo";
        [Description("���ݺ�"), Category("Xzz")]
        public string FieldBillNo
        {
            get
            {
                return FFieldBillNo;
            }
            set
            {
                if (FFieldBillNo != value)
                {
                    FFieldBillNo = value;
                }
            }
        }

        private string FFieldSupplyerType = "SupplyerType";
        [Description("��Ӧ�����"), Category("Xzz")]
        public string FieldSupplyerType
        {
            get
            {
                return FFieldSupplyerType;
            }
            set
            {
                if (FFieldSupplyerType != value)
                {
                    FFieldSupplyerType = value;
                }
            }
        }

        private string FFieldSupplyerCode = "SupplyerCode";
        [Description("��Ӧ��"), Category("Xzz")]
        public string FieldSupplyerCode
        {
            get
            {
                return FFieldSupplyerCode;
            }
            set
            {
                if (FFieldSupplyerCode != value)
                {
                    FFieldSupplyerCode = value;
                }
            }
        }

        private string FFieldClientType = "ClientType";
        [Description("�ͻ����"), Category("Xzz")]
        public string FieldClientType
        {
            get
            {
                return FFieldClientType;
            }
            set
            {
                if (FFieldClientType != value)
                {
                    FFieldClientType = value;
                }
            }
        }

        private string FFieldClientCode = "ClientCode";
        [Description("�ͻ�"), Category("Xzz")]
        public string FieldClientCode
        {
            get
            {
                return FFieldClientCode;
            }
            set
            {
                if (FFieldClientCode != value)
                {
                    FFieldClientCode = value;
                }
            }
        }

        private string FFieldAreaCode = "AreaCode";
        [Description("��������"), Category("Xzz")]
        public string FieldAreaCode
        {
            get
            {
                return FFieldAreaCode;
            }
            set
            {
                if (FFieldAreaCode != value)
                {
                    FFieldAreaCode = value;
                }
            }
        }
        
        private string FFieldInDate = "InDate";
        [Description("�������"), Category("Xzz")]
        public string FieldInDate
        {
            get
            {
                return FFieldInDate;
            }
            set
            {
                if (FFieldInDate != value)
                {
                    FFieldInDate = value;
                }
            }
        }

        private string FFieldRowNo = "RowNo";
        [Description("�ڶ�����ֶ�"), Category("Xzz")]
        public string FieldRowNo
        {
            get
            {
                return FFieldRowNo;
            }
            set
            {
                if (FFieldRowNo != value)
                {
                    FFieldRowNo = value;
                }
            }
        }

        private string FFieldDetailNo = "DetailNo";
        [Description("�����������ֶ�"), Category("Xzz")]
        public string FieldDetailNo
        {
            get
            {
                return FFieldDetailNo;
            }
            set
            {
                if (FFieldDetailNo != value)
                {
                    FFieldDetailNo = value;
                }
            }
        }

        private string FFieldTheDate = "TheDate";
        [Description("����"), Category("Xzz")]
        public string FieldTheDate
        {
            get
            {
                return FFieldTheDate;
            }
            set
            {
                if (FFieldTheDate != value)
                {
                    FFieldTheDate = value;
                }
            }
        }

        private string FFieldisListNo = "isListNo";
        [Description("�Ƿ���д��Ź���"), Category("Xzz")]
        public string FieldisListNo
        {
            get
            {
                return FFieldisListNo;
            }
            set
            {
                if (FFieldisListNo != value)
                {
                    FFieldisListNo = value;
                }
            }
        }

        private string FFieldInCostPrice = "InCostPrice";
        [Description("�ɱ�����"), Category("Xzz")]
        public string FieldInCostPrice
        {
            get
            {
                return FFieldInCostPrice;
            }
            set
            {
                if (FFieldInCostPrice != value)
                {
                    FFieldInCostPrice = value;
                }
            }
        }

        private string FFieldSumMoney = "SumMoney";
        [Description("�ɱ����"), Category("Xzz")]
        public string FieldSumMoney
        {
            get
            {
                return FFieldSumMoney;
            }
            set
            {
                if (FFieldSumMoney != value)
                {
                    FFieldSumMoney = value;
                }
            }
        }

        #endregion
    }

    #region �ɱ�ά������

    /// <summary>
    /// ��ʷ��¼����
    /// </summary>   
    public class xzFinPriceHistory
    {
        private string FHistoryNo = "";
        [Description("ִ�е���ʷ��¼��"), Category("Xzz")]
        public string HistoryNo
        {
            get
            {
                return FHistoryNo;
            }
            set
            {
                if (FHistoryNo != value)
                {
                    FHistoryNo = value;
                }
            }
        }

        private string FModuleName = "";
        [Description("ִ�е�ģ�������"), Category("Xzz")]
        public string ModuleName
        {
            get
            {
                return FModuleName;
            }
            set
            {
                if (FModuleName != value)
                {
                    FModuleName = value;
                }
            }
        }

        private string FUserNo = "";
        [Description("ִ�е��û�"), Category("Xzz")]
        public string UserNo
        {
            get
            {
                return FUserNo;
            }
            set
            {
                if (FUserNo != value)
                {
                    FUserNo = value;
                }
            }
        }

        private DateTime FTheDate = DateTime.MinValue;
        [Description("ά��������"), Category("Xzz")]
        public DateTime TheDate
        {
            get
            {
                return FTheDate;
            }
            set
            {
                if (FTheDate != value)
                {
                    FTheDate = value;
                }
            }
        }

        private SqlCommand FCommand = null;
        [Description("����"), Category("Xzz")]
        public SqlCommand Command
        {
            get
            {
                return FCommand;
            }
            set
            {
                if (FCommand != value)
                {
                    FCommand = value;
                }
            }
        }

        public DataTable getHistoryList()
        {
            string FSqlgetHistoryInfo = @"select top 10 BillNo,TheDate,UserNo from tbFinMaintainHistory 
                where ModuleName = '{0}' and  TheDate = '{1}' order by BillNo desc";

            DataTable Table = new DataTable();
            using (SqlDataAdapter sqlda = new SqlDataAdapter())
            {
                FCommand.CommandText = string.Format(FSqlgetHistoryInfo, ModuleName, FTheDate);
                sqlda.SelectCommand = FCommand;
                sqlda.Fill(Table);
            }
            return Table;
        }

        public byte[] getHistoryInfo()
        {
            string FSqlGetHistory = @"Select History from tbFinMaintainHistory where BillNo = '{0}'";            
            FCommand.CommandText = string.Format(FSqlGetHistory, FHistoryNo);
            object value = FCommand.ExecuteScalar();
            if (value != null && value != DBNull.Value) return value as byte[];
            else return null;
        }

        public void CreateHistory(byte[] bytes)
        {
            string FSqlCreateHistory = @"insert into tbFinMaintainHistory (BillNo, TheDate, UserNo, ModuleName, History)
                values (@BillNo, @TheDate, @UserNo, @ModuleName, @History) ";
            
            FCommand.CommandText = FSqlCreateHistory;
            FCommand.Parameters.Add("@BillNo", SqlDbType.VarChar, 30);
            FCommand.Parameters["@BillNo"].Value = HistoryNo;
            FCommand.Parameters.Add("@UserNo", SqlDbType.VarChar, 10);
            FCommand.Parameters["@UserNo"].Value = UserNo;
            FCommand.Parameters.Add("@TheDate", SqlDbType.DateTime);
            if (FTheDate == DateTime.MinValue) FTheDate = DateTime.Now;
            FCommand.Parameters["@TheDate"].Value = FTheDate;
            FCommand.Parameters.Add("@ModuleName", SqlDbType.VarChar, 50);
            FCommand.Parameters["@ModuleName"].Value = ModuleName;
            FCommand.Parameters.Add("@History", SqlDbType.Image);
            FCommand.Parameters["@History"].Value = bytes;
            FCommand.ExecuteNonQuery();
            FCommand.Parameters.Clear();
        }

        public virtual void ClearHistory()
        {
            string FSqlClearHistory = @"Delete from tbFinMaintainHistory where BillNo = '{0}'";
            FCommand.CommandText = string.Format(FSqlClearHistory, HistoryNo);
            FCommand.ExecuteNonQuery();
        }
    }

    /// <summary>
    /// ��ȡ�۸����
    /// </summary>
    public class xzFinPriceManage
    {
        private SqlCommand FCommand = null;
        [Description("����"), Category("Xzz")]
        public SqlCommand Command
        {
            get
            {
                return FCommand;
            }
            set
            {
                if (FCommand != value)
                {
                    FCommand = value;
                }
            }
        }

        private HYField FField = new HYField();
        [Description("Ĭ�ϵ��ֶ�����"), Category("Xzz")]
        public HYField Field
        {
            get
            {
                return FField;
            }
        }

        #region �޴��Ż�ȡ�ɱ�����

        #region ����ɹ�����
        public decimal getStockInCostPrice(DataRow CurrRow, object EndDate, string cause)
        {
            DateTime EndTime = Convert.ToDateTime(EndDate).Date.AddHours(23).AddMinutes(59).AddSeconds(59);
            string SqlGetPrice = @"
                select top 1 InCostPrice from tbStorStockInItem a
                Left Outer Join tbStorStockIn b on a.BillNo = b.BillNo
                where  dbo.GetByteToBoolean(b.TheState,0x0001)=1 and dbo.GetByteToBoolean(b.UseState,0x0001) = 0 
                      and InCostPrice <> 0 and TheDate<='{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' {3}
                order by b.TheDate desc";

            FCommand.CommandText = string.Format(SqlGetPrice, EndTime, CurrRow["ProductSortCode"], CurrRow["ProductCode"], cause);
            return xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
        }

        #endregion

        #region �����������
        public decimal getOtherInCostPrice(DataRow CurrRow, object EndDate, string cause)
        {
            DateTime EndTime = Convert.ToDateTime(EndDate).Date.AddHours(23).AddMinutes(59).AddSeconds(59);
            string SqlGetPrice = @"
                select top 1 InCostPrice from tbStorOtherInItem a
                Left Outer Join tbStorOtherIn b on a.BillNo = b.BillNo
                where  dbo.GetByteToBoolean(b.TheState,0x0001)=1 and dbo.GetByteToBoolean(b.UseState,0x0001) = 0 
                      and b.InModeCode <> '021' and b.InModeCode <> '022'
                      and InCostPrice <> 0 and TheDate<='{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' {3}
                order by b.TheDate desc";

            FCommand.CommandText = string.Format(SqlGetPrice, EndTime, CurrRow["ProductSortCode"], CurrRow["ProductCode"], cause);
            return xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
        }

        #endregion

        #region ������п�������
        public decimal getInCostPrice(DataRow CurrRow, object EndDate, string cause)
        {
            DateTime EndTime = Convert.ToDateTime(EndDate).Date.AddHours(23).AddMinutes(59).AddSeconds(59);
            string SqlGetPrice = @"
               select top 1 InCostPrice from
                  (
                    --�ɹ����
                    Select top 1 InCostPrice, TheDate from tbStorStockInItem a 
                      Left outer Join tbStorStockIn  b on a.BillNo = b.BillNo
                    where  b.TheDate<='{0}' and  ProductSortCode  = '{1}' and ProductCode='{2}' 
                      and dbo.GetByteToBoolean(b.TheState,0x0001)=1 and dbo.GetByteToBoolean(b.UseState,0x0001) = 0 
                      and a.InCostPrice <> 0 {3}
                    union all
                    -- ������� b.InModeCode='099'
                    select top 1 InCostPrice, TheDate from tbStorOtherInItem a
                      Left Outer Join tbStorOtherIn b on a.BillNo = b.BillNo
                    where  b.TheDate<='{0}' and ProductSortCode='{1}' and ProductCode = '{2}' 
                      and dbo.GetByteToBoolean(b.TheState,0x0001)=1 and dbo.GetByteToBoolean(b.UseState,0x0001) = 0 
                      and b.InModeCode <> '021' and b.InModeCode <> '022'
                      and  a.InCostPrice <> 0 {3}
                    union all
                    -- ��ȡ���۳��ⵥ(����)�ļ۸�
                    select top 1  InCostPrice, TheDate from tbSaleOutItem a 
                      Left Outer Join tbSaleOut b on a.BillNo = b.BillNo
                    where  b.TheDate<='{0}' and ProductSortCode='{1}' and ProductCode = '{2}' 
                      and dbo.GetByteToBoolean(b.TheState,0x0001)=1  and dbo.GetByteToBoolean(b.UseState,0x0001) = 1
                      and a.InCostPrice <> 0  {3}
                    union all
                    -- ��ȡ���ۿ���(����)�ļ۸� [�����ؼۿ���]
                    select top 1  InCostPrice, TheDate from tbSelfSaleOutItem a 
                      Left Outer Join tbSelfSaleOut b on a.BillNo = b.BillNo
                    where  b.TheDate<='{0}' and ProductSortCode='{1}' and ProductCode = '{2}' 
                      and dbo.GetByteToBoolean(b.TheState,0x0001)=1  and dbo.GetByteToBoolean(b.UseState,0x0001) = 1
                      and a.InCostPrice <> 0  {3}
                    union all
                    --��ȡ�������ⵥ(����)�ļ۸�
                    select top 1 InCostPrice, TheDate from tbStorOtherOutItem a 
                      Left Outer Join tbStorOtherOut b on a.BillNo = b.BillNo
                    where  b.TheDate<='{0}' and ProductSortCode='{1}' and ProductCode = '{2}' 
                      and dbo.GetByteToBoolean(b.TheState,0x0001)=1  and dbo.GetByteToBoolean(b.UseState,0x0001) = 1
                      and a.InCostPrice <> 0  {3}
                   ) aa
                order by TheDate desc ";

            FCommand.CommandText = string.Format(SqlGetPrice, EndTime, CurrRow["ProductSortCode"], CurrRow["ProductCode"], cause);
            return xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
        }

        #endregion

        #region �ڳ���Ȩƽ����
        public decimal getAvgCostPrice(DataRow CurrRow, object EndDate, string cause)
        {
            DateTime EndTime = Convert.ToDateTime(EndDate).Date.AddHours(23).AddMinutes(59).AddSeconds(59);
            string sqlStorMaxDate = @"select Max(theDate) from tbCourseStorPrice where theDate <= '{0}' {1}";
            FCommand.CommandText = string.Format(sqlStorMaxDate, EndTime, cause);
            object objDate = FCommand.ExecuteScalar();

            string sqlAvgCostPrice = @"select sum(SumMoney)/sum(Number) 
                from tbCourseStorPrice where theDate = '{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' {3}";
            FCommand.CommandText = string.Format(sqlAvgCostPrice, objDate, CurrRow["ProductSortCode"], CurrRow["ProductCode"], cause);
            return xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
        }

        #endregion

        #endregion

        #region ���Ż�ȡ�ɱ�����

        #region ����ɹ�����
        public decimal getStockInCostPriceList(DataRow CurrRow, object EndDate, string cause)
        {
            DateTime EndTime = Convert.ToDateTime(EndDate).Date.AddHours(23).AddMinutes(59).AddSeconds(59);
            //�ɹ����
            string SqlStr = @"
                   Select top 1 InCostPrice from tbStorStockInItemDetail a 
                   Left outer Join tbStorStockIn  b on a.BillNo = b.BillNo
                   where  b.TheDate<='{0}' and ProductSortCode = '{1}' and ProductCode='{2}' and ListNo = '{3}'
                         and dbo.GetByteToBoolean(b.TheState,0x0001)=1 and dbo.GetByteToBoolean(b.UseState,0x0001) = 0 
                         and a.InCostPrice <> 0 {4}
                   order by b.TheDate desc ";

            FCommand.CommandText = string.Format(SqlStr, EndTime, CurrRow["ProductSortCode"], CurrRow["ProductCode"], CurrRow["ListNo"], cause);
            object value = FCommand.ExecuteScalar();
            if (value != null && value != DBNull.Value)
                return Convert.ToDecimal(value);
            return 0;
        }

        #endregion

        #region �����������
        public decimal getOtherInCostPriceList(DataRow CurrRow, object EndDate, string cause)
        {
            DateTime EndTime = Convert.ToDateTime(EndDate).Date.AddHours(23).AddMinutes(59).AddSeconds(59);
            string SqlGetPrice = @"
                select top 1 InCostPrice from tbStorOtherInItemDetail a
                Left Outer Join tbStorOtherIn b on a.BillNo = b.BillNo
                where b.TheDate<='{0}' and ProductSortCode='{1}' and  ProductCode= '{2}' and ListNo='{3}' 
                    and dbo.GetByteToBoolean(b.TheState,0x0001)=1 and dbo.GetByteToBoolean(b.UseState,0x0001) = 0 
                    and  a.InCostPrice <> 0  {4}
                order by b.TheDate desc ";

            FCommand.CommandText = string.Format(SqlGetPrice, EndTime, CurrRow["ProductSortCode"], CurrRow["ProductCode"], CurrRow["ListNo"], cause);
            object value = FCommand.ExecuteScalar();
            if (value != null && value != DBNull.Value)
                return Convert.ToDecimal(value);
            return 0;
        }

        #endregion

        #region ������п�������
        public decimal getInCostPriceList(DataRow CurrRow, object EndDate, string cause)
        {
            DateTime EndTime = Convert.ToDateTime(EndDate).Date.AddHours(23).AddMinutes(59).AddSeconds(59);
            string SqlGetPrice = @"
               select top 1 InCostPrice from
                  (
                    --�ɹ����
                    Select top 1 InCostPrice, TheDate from tbStorStockInItemDetail a 
                      Left outer Join tbStorStockIn  b on a.BillNo = b.BillNo
                    where  b.TheDate<='{0}' and ProductSortCode = '{1}' and  ProductCode='{2}' and ListNo = '{3}'
                      and dbo.GetByteToBoolean(b.TheState,0x0001)=1 and dbo.GetByteToBoolean(b.UseState,0x0001) = 0 
                      and a.InCostPrice <> 0 {4}
                    union all
                    -- ������� b.InModeCode='099' and b.InModeCode <> '021' and b.InModeCode <> '022'
                    select top 1 InCostPrice, TheDate from tbStorOtherInItemDetail a
                      Left Outer Join tbStorOtherIn b on a.BillNo = b.BillNo
                    where  b.TheDate<='{0}' and ProductSortCode='{1}' and ProductCode = '{2}' and ListNo='{3}'
                      and dbo.GetByteToBoolean(b.TheState,0x0001)=1 and dbo.GetByteToBoolean(b.UseState,0x0001) = 0 
                      and  a.InCostPrice <> 0 {4}
                    union all
                    -- ��ȡ���۳��ⵥ(����)�ļ۸�
                    select top 1  InCostPrice, TheDate from tbSaleOutItemDetail a 
                      Left Outer Join tbSaleOut b on a.BillNo = b.BillNo
                    where  b.TheDate<='{0}' and ProductSortCode='{1}' and ProductCode = '{2}' and ListNo='{3}'
                      and dbo.GetByteToBoolean(b.TheState,0x0001)=1  and dbo.GetByteToBoolean(b.UseState,0x0001) = 1
                      and a.InCostPrice <> 0  {4}
                    union all
                    -- ��ȡ���ۿ���(����)�ļ۸� [�����ؼۿ���]
                    select top 1  InCostPrice, TheDate from tbSelfSaleOutItem a 
                      Left Outer Join tbSelfSaleOut b on a.BillNo = b.BillNo
                    where  b.TheDate<='{0}' and ProductSortCode='{1}' and ProductCode = '{2}' and ListNo='{3}'
                      and dbo.GetByteToBoolean(b.TheState,0x0001)=1  and dbo.GetByteToBoolean(b.UseState,0x0001) = 1
                      and a.InCostPrice <> 0  {4}
                    union all
                    --��ȡ�������ⵥ(����)�ļ۸�
                    select top 1 InCostPrice, TheDate from tbStorOtherOutItemDetail a 
                      Left Outer Join tbStorOtherOut b on a.BillNo = b.BillNo
                    where  b.TheDate<='{0}' and ProductSortCode='{1}' and ProductCode = '{2}' and ListNo='{3}'
                      and dbo.GetByteToBoolean(b.TheState,0x0001)=1  and dbo.GetByteToBoolean(b.UseState,0x0001) = 1
                      and a.InCostPrice <> 0  {4}
                   ) aa
                order by TheDate desc ";

            FCommand.CommandText = string.Format(SqlGetPrice, EndTime, CurrRow["ProductSortCode"], CurrRow["ProductCode"], CurrRow["ListNo"], cause);
            object value = FCommand.ExecuteScalar();
            if (value != null && value != DBNull.Value)
                return Convert.ToDecimal(value);

            return 0;
        }

        #endregion

        #region ����Ȩ��
        public decimal getAvgCostPriceList(DataRow CurrRow, object EndDate, string cause)
        {
            string sqlAvgCostPrice = @"select top 1 InCostPrice
                from tbCourseStorPriceList where theDate <= '{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' and ListNo = '{3}' {4}
                order by theDate desc";
            FCommand.CommandText = string.Format(sqlAvgCostPrice, EndDate, CurrRow["ProductSortCode"], CurrRow["ProductCode"], CurrRow["ListNo"], cause);
            return xzSqlAnalysis.getAbsValue(FCommand.ExecuteScalar());
        }

        #endregion
        #endregion

        #region ��ȡ��ʼ���ɱ��۸�
        public decimal getInitialCostPriceList(object ListNo, object ProductCode, object ProductSortCode, object EndDate)
        {
            //�������
            string SqlGetPrice = @"
                select top 1 InCostPrice from tbStorOtherInItemDetail a
                Left Outer Join tbStorOtherIn b on a.BillNo = b.BillNo
                where b.TheDate<='{0}' and ProductSortCode='{1}' and  ProductCode= '{2}' and ListNo='{3}' 
                    and dbo.GetByteToBoolean(b.TheState,0x0001)=1 and dbo.GetByteToBoolean(b.UseState,0x0001) = 0 
                    and  a.InCostPrice <> 0 and b.InModeCode='099'
                order by b.TheDate desc ";

            FCommand.CommandText = string.Format(SqlGetPrice, EndDate, ProductSortCode, ProductCode, ListNo);
            object value = FCommand.ExecuteScalar();
            if (value != null && value != DBNull.Value)
                return Convert.ToDecimal(value);
            return 0;
        }

        #endregion

        #region �޴��Ż�ȡ�۸�ķ�ʽ
        public decimal getInCostPriceNotList(object ProductCode, object ProductSortCode, object StorageCode, object PlaceCode,
            object EndDate, int PriceSort)
        {
            string SqlGetPrice = "", sqlStorMaxDate = "";
            object value = null, objDate = null;
            switch (PriceSort)
            {
                case 5:
                    SqlGetPrice = @"
                        select top 1 InCostPrice from tbStorStockInItem a
                        Left Outer Join tbStorStockIn b on a.BillNo = b.BillNo
                        where dbo.GetByteToBoolean(b.TheState,0x0001)=1 and dbo.GetByteToBoolean(b.UseState,0x0001) = 0 and InCostPrice <> 0 
                              and TheDate<='{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' and StorageCode = '{3}' and PlaceCode = '{4}'
                        order by b.TheDate desc";

                    FCommand.CommandText = string.Format(SqlGetPrice, EndDate, ProductSortCode, ProductCode, StorageCode, PlaceCode);
                    value = FCommand.ExecuteScalar();
                    if (value != null && value != DBNull.Value)
                        return Convert.ToDecimal(value);
                    break;
                case 6:
                    sqlStorMaxDate = @"select Max(theDate) from tbCourseStorPrice
                           where theDate <= '{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' and StorageCode = '{3}' and PlaceCode = '{4}'";
                    FCommand.CommandText = string.Format(sqlStorMaxDate, EndDate, ProductSortCode, ProductCode, StorageCode, PlaceCode);
                    objDate = FCommand.ExecuteScalar();
                    if (objDate != null && objDate != DBNull.Value)
                    {
                        SqlGetPrice = @"select AvgCostPrice from tbCourseStorPrice 
                           where theDate = '{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' and StorageCode = '{3}' and PlaceCode = '{4}'";

                        FCommand.CommandText = string.Format(SqlGetPrice, objDate, ProductSortCode, ProductCode, StorageCode, PlaceCode);
                        value = FCommand.ExecuteScalar();
                        if (value != null && value != DBNull.Value)
                            return Convert.ToDecimal(value);
                    }
                    break;
                case 7:
                    sqlStorMaxDate = @"select Max(theDate) from tbCourseStorPrice
                           where theDate <= '{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' and StorageCode = '{3}' and PlaceCode = '{4}'";
                    FCommand.CommandText = string.Format(sqlStorMaxDate, EndDate, ProductSortCode, ProductCode, StorageCode, PlaceCode);
                    objDate = FCommand.ExecuteScalar();
                    if (objDate != null && objDate != DBNull.Value)
                    {
                        SqlGetPrice = @"select SumMoney/Number from tbCourseStorPrice 
                           where theDate = '{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' and StorageCode = '{3}' and PlaceCode = '{4}'";

                        FCommand.CommandText = string.Format(SqlGetPrice, objDate, ProductSortCode, ProductCode, StorageCode, PlaceCode);
                        value = FCommand.ExecuteScalar();
                        if (value != null && value != DBNull.Value)
                            return Math.Round(Convert.ToDecimal(value), 2, MidpointRounding.AwayFromZero);
                    }
                    break;
            }
            return 0;
        }
        #endregion
    }

    /// <summary>
    /// ��������Ʒ�Ľ�� 
    /// </summary>    
    [Serializable]
    public class HYProductCostParam
    {
        private decimal FNumber = 0;
        [Description("����������������"), Category("Xzz")]
        public decimal Number
        {
            get
            {
                return FNumber;
            }
            set
            {
                if (FNumber != value)
                {
                    FNumber = value;
                }
            }
        }

        private decimal FSumMoney = 0;
        [Description("��������������"), Category("Xzz")]
        public decimal SumMoney
        {
            get
            {
                return FSumMoney;
            }
            set
            {
                if (FSumMoney != value)
                {
                    FSumMoney = value;
                }
            }
        }
    }

    /// <summary>
    /// ��Ʒ��ת�ɱ�
    /// </summary>
    public class HYProductFlowtCost
    {
        #region ��ԭ���ĳɱ����µ���ת��
        public static void UpdateFlowtCostMoney(SqlCommand cmd, DataRow CurrRow)
        {
            switch (CurrRow["HandleSort"].ToString())
            {
                case HYStorageManager._StockIn:
                case HYStorageManager._StockInRed:
                    cmd.CommandText = string.Format(@"select top 1 SumMoney from tbStorStockInItem where BillNo = '{0}' 
                       and RowNo = {1}", CurrRow["BillNo"], CurrRow["RowNo"]);
                    break;
                case HYStorageManager._OtherIn:
                case HYStorageManager._OtherInRed:
                case HYStorageManager._MaintainPostSelfReturn:
                case HYStorageManager._MaintainPostSelfReturnRed:
                    cmd.CommandText = string.Format(@"select top 1 SumMoney from tbStorOtherInItem where BillNo = '{0}' 
                       and RowNo = {1}", CurrRow["BillNo"], CurrRow["RowNo"]);
                    break;
                case HYStorageManager._SaleOut:
                case HYStorageManager._SaleOutRed:
                    cmd.CommandText = string.Format(@"select top 1 SumMoney from tbSaleOutItem where BillNo = '{0}' 
                       and RowNo = {1}", CurrRow["BillNo"], CurrRow["RowNo"]);
                    break;
                case HYStorageManager._OtherOut:
                case HYStorageManager._OtherOutRed:
                    cmd.CommandText = string.Format(@"select top 1 SumMoney from tbStorOtherOutItem where BillNo = '{0}' 
                       and RowNo = {1}", CurrRow["BillNo"], CurrRow["RowNo"]);
                    break;
                case HYStorageManager._SelfSaleOut:
                case HYStorageManager._SelfSaleOutRed:
                    cmd.CommandText = string.Format(@"select top 1 SumMoney from tbSelfSaleOutItem where BillNo = '{0}' 
                       and RowNo = {1}", CurrRow["BillNo"], CurrRow["RowNo"]);
                    break;
                case HYStorageManager._Redeploy:
                    cmd.CommandText = string.Format(@"select top 1 outSumMoney from tbStorRedeployItem where BillNo = '{0}' 
                       and RowNo = {1}", CurrRow["BillNo"], CurrRow["RowNo"]);
                    break;
                case HYStorageManager._RedeployIn:
                    cmd.CommandText = string.Format(@"select top 1 InSumMoney from tbStorRedeployItem where BillNo = '{0}' 
                       and RowNo = {1}", CurrRow["BillNo"], CurrRow["RowNo"]);
                    break;
                case HYStorageManager._Check:
                    cmd.CommandText = string.Format(@"select top 1 SumMoney from tbStorCheckItem where BillNo = '{0}' 
                       and RowNo = {1}", CurrRow["BillNo"], CurrRow["RowNo"]);
                    break;
                case HYStorageManager._MaintainPostSelf:
                case HYStorageManager._MaintainPostSelfRed:
                    cmd.CommandText = string.Format(@"select top 1 SumMoney from tbStorMaintainPostSelfItem where BillNo = '{0}' 
                       and RowNo = {1}", CurrRow["BillNo"], CurrRow["RowNo"]);
                    break;
            }
            decimal SumMoney = xzSqlAnalysis.getValue(cmd.ExecuteScalar());

            cmd.CommandText = string.Format(@"update tbStorStorageProduct set SumMoney = {0}
                                    where ProductSortCode = '{1}' and ProductCode = '{2}' and BillNo = '{3}' 
                                         and HandleSort = '{4}' and RowNo = {5}", SumMoney
                 , CurrRow["ProductSortCode"], CurrRow["ProductCode"], CurrRow["BillNo"]
                 , CurrRow["HandleSort"], CurrRow["RowNo"]);
            cmd.ExecuteNonQuery();
        }
        #endregion

        private SqlCommand FCommand = null;
        [Description("����"), Category("Xzz")]
        public SqlCommand Command
        {
            get
            {
                return FCommand;
            }
            set
            {
                if (FCommand != value)
                {
                    FCommand = value;
                }
            }
        }

        #region �ɱ�ά��
        private Hashtable htStockIn = new Hashtable();
        private void UpdateFlowtAndSourceCostMoney(DataRow CurrRow)
        {
            decimal SumMoney = xzSqlAnalysis.getValue(CurrRow["SumMoney"]);
            FCommand.CommandText = string.Format(@"update tbStorStorageProduct set SumMoney = {0}
                                    where ProductSortCode = '{1}' and ProductCode = '{2}' and BillNo = '{3}' 
                                         and HandleSort = '{4}' and RowNo = {5}", SumMoney
                 , CurrRow["ProductSortCode"], CurrRow["ProductCode"], CurrRow["BillNo"]
                 , CurrRow["HandleSort"], CurrRow["RowNo"]);
            FCommand.ExecuteNonQuery();

            string StrSql = "", StrBillNo = "";
            string HandleSort = CurrRow["HandleSort"].ToString();
            switch (HandleSort)
            {
                case HYStorageManager._StockIn:
                case HYStorageManager._StockInRed:
                    SumMoney = Math.Abs(SumMoney);
                    if (HandleSort == HYStorageManager._StockInRed) SumMoney = -SumMoney;
                    StrSql = @"update tbStorStockInItem set SumMoney = {0}
                       , InCostPrice = {0}  / Number
                       , Price = {0} * (1 + TaxRate/100) / (1 - AgioRate/100) / Number / (1 + TaxRate/100)
                       , TaxPrice = {0} * (1 + TaxRate/100) / (1 - AgioRate/100) / Number
                       , AgioMoney = {0} * (1 + TaxRate/100) / (1 - AgioRate/100) * AgioRate/100
                       , TaxMoney = ({0} * TaxRate)
                       , InCostTaxPrice = {0} * (1 + TaxRate/100) / Number
                       , TotalMoney = {0} * (1 + TaxRate/100) where BillNo = '{1}' and RowNo = {2}";
                    FCommand.CommandText = string.Format(StrSql, SumMoney, CurrRow["BillNo"], CurrRow["RowNo"]);
                    FCommand.ExecuteNonQuery();
                    StrBillNo = CurrRow["BillNo"].ToString();
                    if (!htStockIn.ContainsKey(StrBillNo))
                        htStockIn.Add(StrBillNo, CurrRow);
                    break;
                case HYStorageManager._OtherIn:
                case HYStorageManager._OtherInRed:
                case HYStorageManager._MaintainPostSelfReturn:
                case HYStorageManager._MaintainPostSelfReturnRed:
                    SumMoney = Math.Abs(SumMoney);
                    if (HandleSort == HYStorageManager._OtherInRed || HandleSort == HYStorageManager._MaintainPostSelfReturnRed)
                        SumMoney = -SumMoney;
                    StrSql = @"update tbStorOtherInItem set SumMoney = {0}
                       , InCostPrice = {0}  / Number where BillNo = '{1}' and RowNo = {2}";
                    FCommand.CommandText = string.Format(StrSql, SumMoney, CurrRow["BillNo"], CurrRow["RowNo"]);
                    FCommand.ExecuteNonQuery();
                    break;
                case HYStorageManager._SaleOut:
                case HYStorageManager._SaleOutRed:
                    SumMoney = Math.Abs(SumMoney);
                    if (HandleSort == HYStorageManager._SaleOutRed) SumMoney = -SumMoney;
                    StrSql = @"update tbSaleOutItem set SumMoney = {0}
                       , InCostPrice = {0}  / Number where BillNo = '{1}' and RowNo = {2}";
                    FCommand.CommandText = string.Format(StrSql, SumMoney, CurrRow["BillNo"], CurrRow["RowNo"]);
                    FCommand.ExecuteNonQuery();
                    break;
                case HYStorageManager._OtherOut:
                case HYStorageManager._OtherOutRed:
                    SumMoney = Math.Abs(SumMoney);
                    if (HandleSort == HYStorageManager._OtherOutRed) SumMoney = -SumMoney;
                    StrSql = @"update tbStorOtherOutItem set SumMoney = {0}
                       , InCostPrice = {0}  / Number where BillNo = '{1}' and RowNo = {2}";
                    FCommand.CommandText = string.Format(StrSql, SumMoney, CurrRow["BillNo"], CurrRow["RowNo"]);
                    FCommand.ExecuteNonQuery();
                    break;
                case HYStorageManager._SelfSaleOut:
                case HYStorageManager._SelfSaleOutRed:
                    SumMoney = Math.Abs(SumMoney);
                    if (HandleSort == HYStorageManager._SelfSaleOutRed) SumMoney = -SumMoney;
                    StrSql = @"update tbSelfSaleOutItem set SumMoney = {0}
                       , InCostPrice = {0}  / Number where BillNo = '{1}' and RowNo = {2}";
                    FCommand.CommandText = string.Format(StrSql, SumMoney, CurrRow["BillNo"], CurrRow["RowNo"]);
                    FCommand.ExecuteNonQuery();
                    break;
                case HYStorageManager._Redeploy:
                    SumMoney = Math.Abs(SumMoney);
                    StrSql = @"update tbStorRedeployItem set OutSumMoney = {0}
                       , OutCostPrice = {0}  / Number where BillNo = '{1}' and RowNo = {2}";
                    FCommand.CommandText = string.Format(StrSql, SumMoney, CurrRow["BillNo"], CurrRow["RowNo"]);
                    FCommand.ExecuteNonQuery();
                    break;
                case HYStorageManager._RedeployIn:
                    SumMoney = Math.Abs(SumMoney);
                    StrSql = @"update tbStorRedeployItem set InSumMoney = {0}
                       , InCostPrice = {0}  / Number where BillNo = '{1}' and RowNo = {2}";
                    FCommand.CommandText = string.Format(StrSql, SumMoney, CurrRow["BillNo"], CurrRow["RowNo"]);
                    FCommand.ExecuteNonQuery();
                    break;
                case HYStorageManager._Check:
                    StrSql = @"update tbStorCheckItem set SumMoney = {0}
                       , InCostPrice = {0}  / Number where BillNo = '{1}' and RowNo = {2}";
                    FCommand.CommandText = string.Format(StrSql, SumMoney, CurrRow["BillNo"], CurrRow["RowNo"]);
                    FCommand.ExecuteNonQuery();
                    break;
                case HYStorageManager._MaintainPostSelf:
                case HYStorageManager._MaintainPostSelfRed:
                    SumMoney = Math.Abs(SumMoney);
                    if (HandleSort == HYStorageManager._MaintainPostSelfRed) SumMoney = -SumMoney;
                    StrSql = @"update tbStorMaintainPostSelfItem set SumMoney = {0}
                       , InCostPrice = {0}  / Number where BillNo = '{1}' and RowNo = {2}";
                    FCommand.CommandText = string.Format(StrSql, SumMoney, CurrRow["BillNo"], CurrRow["RowNo"]);
                    FCommand.ExecuteNonQuery();
                    break;
            }
        }

        private void UpdateFlowtAndSourceCostMoney()
        {
            foreach (DataRow CurrRow in htStockIn.Values)
            {
                decimal SumMoney = 0m;
                decimal TotalMoney = 0m;
                FCommand.CommandText = string.Format(@"select sum(SumMoney) SumMoney,  sum(TotalMoney) from tbStorStockInItem
                                    where BillNo = '{0}'", CurrRow["BillNo"]);
                SqlDataReader Reader = FCommand.ExecuteReader();
                if (Reader.Read())
                {
                    SumMoney = xzSqlAnalysis.getValue(Reader[0]);
                    TotalMoney = xzSqlAnalysis.getValue(Reader[1]);
                }
                Reader.Close();
                FCommand.CommandText = string.Format(@"update tbStorStockIn set SumMoney = {0}, TotalMoney = {1}
                                    where BillNo = '{2}'", SumMoney, TotalMoney, CurrRow["BillNo"]);
                FCommand.ExecuteNonQuery();
            }
        }

        public void UpdateFlowtAndSourceCostMoney(DataTable Table)
        {
            htStockIn.Clear();
            foreach (DataRow CurrRow in Table.Rows)
                UpdateFlowtAndSourceCostMoney(CurrRow);
            UpdateFlowtAndSourceCostMoney();
        }

        #endregion

        private string getKey(DataRow Row)
        {
            return string.Format("{0}\r{1}\r{2}\r{3}", Row["StorageCode"], Row["PlaceCode"], Row["ProductSortCode"], Row["ProductCode"]);
        }

        #region ��ȡ�ڳ����ɱ�
        public Hashtable getStorPrice(SqlDataAdapter sqlda, DateTime ATime, string cause)
        {
            Hashtable HaResult = new Hashtable();
            DateTime TheDate = ATime.AddDays(-1).Date.AddHours(23).AddMinutes(59).AddSeconds(59);
            FCommand.CommandText = string.Format(@"select StorageCode, PlaceCode, ProductSortCode, ProductCode, Number, SumMoney
              from tbCourseStorPrice  where TheDate = '{0}' {1}", TheDate, cause);

            using (DataTable Table = new DataTable())
            {
                sqlda.Fill(Table);
                foreach (DataRow Row in Table.Rows)
                {
                    string key = getKey(Row);
                    decimal Number = xzSqlAnalysis.getValue(Row["Number"]);
                    decimal SumMoney = xzSqlAnalysis.getValue(Row["SumMoney"]);
                    if (!HaResult.ContainsKey(key))
                    {
                        HYProductCostParam FProductCostParam = new HYProductCostParam();
                        FProductCostParam.Number = Number;
                        FProductCostParam.SumMoney = SumMoney;
                        HaResult.Add(key, FProductCostParam);
                    }
                }
            }
            return HaResult;
        }
        #endregion

        #region ������̵ļ�¼

        private DataTable getHistoryTable()
        {
            DataTable Table = new DataTable();
            DataColumn Column = Table.Columns.Add();
            Column.ColumnName = "TheSort";
            Column.DataType = typeof(Int32);
            Column = Table.Columns.Add();
            Column.ColumnName = "ProductSortCode";
            Column.MaxLength = 10;
            Column.DataType = typeof(string);
            //Column = Table.Columns.Add();
            //Column.ColumnName = "ProductSortName";
            //Column.MaxLength = 10;
            //Column.DataType = typeof(string);
            Column = Table.Columns.Add();
            Column.ColumnName = "ProductCode";
            Column.MaxLength = 30;
            Column.DataType = typeof(string);
            //Column = Table.Columns.Add();
            //Column.ColumnName = "ProductName";
            //Column.MaxLength = 50;
            //Column.DataType = typeof(string);
            //Column = Table.Columns.Add();
            //Column.ColumnName = "ConfigName";
            //Column.MaxLength = 50;
            //Column.DataType = typeof(string);
            Column = Table.Columns.Add();
            Column.ColumnName = "SerialNo";
            Column.DataType = typeof(decimal);
            Column = Table.Columns.Add();
            Column.ColumnName = "HandleSort";
            Column.MaxLength = 10;
            Column.DataType = typeof(string);
            Column = Table.Columns.Add();
            Column.ColumnName = "HandleCourse";
            Column.MaxLength = 30;
            Column.DataType = typeof(string);
            Column = Table.Columns.Add();
            Column.ColumnName = "BillNo";
            Column.MaxLength = 20;
            Column.DataType = typeof(string);
            Column = Table.Columns.Add();
            Column.ColumnName = "RowNo";
            Column.DataType = typeof(Int32);
            Column = Table.Columns.Add();
            Column.ColumnName = "TheDate";
            Column.DataType = typeof(DateTime);
            Column = Table.Columns.Add();
            Column.ColumnName = "StorageCode";
            Column.MaxLength = 10;
            Column.DataType = typeof(string);
            //Column = Table.Columns.Add();
            //Column.ColumnName = "StorageName";
            //Column.MaxLength = 30;
            //Column.DataType = typeof(string);
            Column = Table.Columns.Add();
            Column.ColumnName = "PlaceCode";
            Column.MaxLength = 10;
            Column.DataType = typeof(string);
            //Column = Table.Columns.Add();
            //Column.ColumnName = "PlaceName";
            //Column.MaxLength = 30;
            //Column.DataType = typeof(string);
            Column = Table.Columns.Add();
            Column.ColumnName = "StorNumber1";
            Column.DataType = typeof(Int32);
            Column = Table.Columns.Add();
            Column.ColumnName = "StorSumMoney1";
            Column.DataType = typeof(decimal);
            Column = Table.Columns.Add();
            Column.ColumnName = "StorPrice1";
            Column.DataType = typeof(decimal);
            Column = Table.Columns.Add();
            Column.ColumnName = "Number";
            Column.DataType = typeof(Int32);
            Column = Table.Columns.Add();
            Column.ColumnName = "SumMoney";
            Column.DataType = typeof(decimal);
            Column = Table.Columns.Add();
            Column.ColumnName = "StorNumber2";
            Column.DataType = typeof(Int32);
            Column = Table.Columns.Add();
            Column.ColumnName = "StorSumMoney2";
            Column.DataType = typeof(decimal);
            Column = Table.Columns.Add();
            Column.ColumnName = "StorPrice2";
            Column.DataType = typeof(decimal);
            return Table;
        }

        private void NewHistoryRow(DataTable HistoryTable, DataRow CurrRow, int TheSort
            , decimal StorNum1, decimal StorMoney1, decimal StorNum2, decimal StorMoney2)
        {
            DataRow HistoryRow = HistoryTable.NewRow();
            foreach (DataColumn Column in CurrRow.Table.Columns)
            {
                if (HistoryTable.Columns.Contains(Column.ColumnName))
                    HistoryRow[Column.ColumnName] = CurrRow[Column.ColumnName];
            }
            HistoryRow["TheSort"] = TheSort;
            HistoryRow["StorNumber1"] = StorNum1;
            HistoryRow["StorSumMoney1"] = StorMoney1;
            if (StorNum1 == 0m) HistoryRow["StorPrice1"] = 0m;
            else HistoryRow["StorPrice1"] = StorMoney1 / StorNum1;
            HistoryRow["StorNumber2"] = StorNum2;
            HistoryRow["StorSumMoney2"] = StorMoney2;
            if (StorNum2 == 0m) HistoryRow["StorPrice2"] = 0m;
            else HistoryRow["StorPrice2"] = StorMoney2 / StorNum2;
            HistoryTable.Rows.Add(HistoryRow);
        }

        #endregion
        
        #region �ɱ�����
        private void DealCalcRedeployIn(DataTable Table, DataRow Row, Hashtable HaPrice, DataTable HistoryTable)
        {
            DataRow[] Rows = Table.Select(string.Format(@"ProductSortCode = '{0}' and ProductCode = '{1}' and BillNo = '{2}'  and RowNo = {3}
                and HandleSort = '{4}'", Row["ProductSortCode"], Row["ProductCode"], Row["BillNo"], Row["RowNo"], HYStorageManager._RedeployIn));
            foreach (DataRow CurrRow in Rows)
            {
                string key = getKey(CurrRow);
                HYProductCostParam FProductCostParam = null;
                CurrRow["SumMoney"] = -xzSqlAnalysis.getValue(Row["SumMoney"]);
                decimal Number = xzSqlAnalysis.getValue(CurrRow["Number"]);
                decimal SumMoney = xzSqlAnalysis.getValue(CurrRow["SumMoney"]);
                decimal Number1 = 0m, SumMoney1 = 0m;
                if (!HaPrice.ContainsKey(key))
                {
                    FProductCostParam = new HYProductCostParam();
                    FProductCostParam.Number = Number;
                    FProductCostParam.SumMoney = SumMoney;
                    HaPrice.Add(key, FProductCostParam);
                }
                else
                {
                    FProductCostParam = HaPrice[key] as HYProductCostParam;
                    Number1 = FProductCostParam.Number;
                    SumMoney1 = FProductCostParam.SumMoney;
                    FProductCostParam.Number = FProductCostParam.Number + Number;
                    FProductCostParam.SumMoney = FProductCostParam.SumMoney + SumMoney;
                }
                if (FProductCostParam.Number == 0) FProductCostParam.SumMoney = 0;
                UpdateFlowtAndSourceCostMoney(CurrRow);
                NewHistoryRow(HistoryTable, CurrRow, 1, Number1, SumMoney1
                    , FProductCostParam.Number, FProductCostParam.SumMoney);
            }
        }

        public void DealCalc(DataTable Table, Hashtable HaPrice, DateTime TheDate, string cause, xzFinPriceHistory FinPriceHistory)
        {
            DataTable HistoryTable = getHistoryTable();

            #region ����ƾ֤����
            foreach (DataRow CurrRow in Table.Rows)
            {
                string key = getKey(CurrRow);
                decimal Number = xzSqlAnalysis.getValue(CurrRow["Number"]);
                decimal SumMoney = xzSqlAnalysis.getValue(CurrRow["SumMoney"]);
                string StrHandleSort = CurrRow["HandleSort"].ToString();
                HYProductCostParam FProductCostParam = null;
                decimal Number1 = 0m, SumMoney1 = 0m;
                switch (StrHandleSort)
                {
                    case HYStorageManager._Check:
                    case HYStorageManager._StockIn:
                    case HYStorageManager._StockInRed:
                    case HYStorageManager._OtherIn:
                    case HYStorageManager._OtherInRed:
                    case HYStorageManager._SaleOutRed:
                    case HYStorageManager._OtherOutRed:
                    case HYStorageManager._SelfSaleOutRed:
                        if (!HaPrice.ContainsKey(key))
                        {
                            FProductCostParam = new HYProductCostParam();
                            FProductCostParam.Number = Number;
                            FProductCostParam.SumMoney = SumMoney;
                            HaPrice.Add(key, FProductCostParam);
                        }
                        else
                        {
                            FProductCostParam = HaPrice[key] as HYProductCostParam;
                            Number1 = FProductCostParam.Number;
                            SumMoney1 = FProductCostParam.SumMoney;
                            FProductCostParam.Number = FProductCostParam.Number + Number;
                            FProductCostParam.SumMoney = FProductCostParam.SumMoney + SumMoney;
                        }
                        
                        NewHistoryRow(HistoryTable, CurrRow, 0, Number1, SumMoney1, FProductCostParam.Number, FProductCostParam.SumMoney);
                        break;
                    case HYStorageManager._SaleOut:
                    case HYStorageManager._OtherOut:
                    case HYStorageManager._SelfSaleOut:
                    case HYStorageManager._Redeploy:
                        if (HaPrice.ContainsKey(key))
                        {
                            FProductCostParam = HaPrice[key] as HYProductCostParam;
                            if (FProductCostParam.SumMoney != 0)
                            {
                                Number1 = FProductCostParam.Number;
                                SumMoney1 = FProductCostParam.SumMoney;

                                SumMoney = SumMoney1 / Number1 * Number;
                                CurrRow["SumMoney"] = SumMoney;

                                FProductCostParam.SumMoney = FProductCostParam.SumMoney + SumMoney;
                                FProductCostParam.Number = FProductCostParam.Number + Number;

                                //��������Ϊ�����Ϊ��
                                if (FProductCostParam.Number == 0 && FProductCostParam.SumMoney != 0)
                                {
                                    CurrRow["SumMoney"] = SumMoney + FProductCostParam.SumMoney;
                                    FProductCostParam.SumMoney = 0;
                                }

                                if (StrHandleSort == HYStorageManager._Redeploy)
                                    DealCalcRedeployIn(Table, CurrRow, HaPrice, HistoryTable);

                                UpdateFlowtAndSourceCostMoney(CurrRow); //������ϸ��
                            }
                            NewHistoryRow(HistoryTable, CurrRow, 1, Number1, SumMoney1, FProductCostParam.Number, FProductCostParam.SumMoney);
                        }                        
                        break;
                }
            }
            UpdateFlowtAndSourceCostMoney(); //��������
            #endregion
            
            #region ����������
            ArrayList HistoryArg = new ArrayList();
            HistoryArg.Add(HistoryTable);
            byte[] bytes = xzStreamStorage.getArrayToStream(HistoryArg);
            FinPriceHistory.CreateHistory(bytes);
            #endregion

            #region ���н��
            string SqlStr = "delete tbCourseStorPrice where theDate = '{0}' {1}";
            FCommand.CommandText = string.Format(SqlStr, TheDate, cause);
            FCommand.ExecuteNonQuery();
            SqlStr = @"insert into tbCourseStorPrice (StorageCode,PlaceCode,ProductSortCode,ProductCode,number,SumMoney,theDate) 
                       values ('{0}','{1}','{2}','{3}',{4},{5},'{6}')";
            foreach (string key in HaPrice.Keys)
            {
                string[] keys = key.Split('\r');
                HYProductCostParam FProductCostParam = HaPrice[key] as HYProductCostParam;
                FCommand.CommandText = string.Format(SqlStr, keys[0], keys[1], keys[2], keys[3]
                    , FProductCostParam.Number, FProductCostParam.SumMoney, TheDate);
                FCommand.ExecuteNonQuery();
            }
            #endregion
        }
        #endregion
    }

    /// <summary>
    /// ά�޼ĳ��Ĳ���
    /// </summary>
    [Serializable]
    public class HYListCostMaintainParam
    {
        private int FVerifyNo = -1;
        [Description("������"), Category("Xzz")]
        public int VerifyNo
        {
            get
            {
                return FVerifyNo;
            }
            set
            {
                if (FVerifyNo != value)
                {
                    FVerifyNo = value;
                }
            }
        }

        private decimal FInCostPrice = 0;
        [Description("���洮�ŵ�ά�޼ĳ��ĳɱ�"), Category("Xzz")]
        public decimal InCostPrice
        {
            get
            {
                return FInCostPrice;
            }
            set
            {
                if (FInCostPrice != value)
                {
                    FInCostPrice = value;
                }
            }
        }
    }

    /// <summary>
    /// ������ת�ɱ�
    /// </summary>
    public class HYListFlowtCost
    {
        public static void UpdateFlowtCostMoney(SqlCommand cmd, DataRow CurrRow)
        {
            switch (CurrRow["HandleSort"].ToString())
            {
                case HYStorageManager._StockIn:
                case HYStorageManager._StockInRed:
                    cmd.CommandText = string.Format(@"select top 1 InCostPrice from tbStorStockInItemDetail where BillNo = '{0}' 
                       and ListNo = '{1}'", CurrRow["BillNo"], CurrRow["ListNo"]);
                    break;
                case HYStorageManager._OtherIn:
                case HYStorageManager._OtherInRed:
                    cmd.CommandText = string.Format(@"select top 1 InCostPrice from tbStorOtherInItemDetail where BillNo = '{0}' 
                       and ListNo = '{1}'", CurrRow["BillNo"], CurrRow["ListNo"]);
                    break;
                case HYStorageManager._SaleOut:
                case HYStorageManager._SaleOutRed:
                    cmd.CommandText = string.Format(@"select top 1 InCostPrice from tbSaleOutItemDetail where BillNo = '{0}' 
                       and ListNo = '{1}'", CurrRow["BillNo"], CurrRow["ListNo"]);
                    break;
                case HYStorageManager._OtherOut:
                case HYStorageManager._OtherOutRed:
                    cmd.CommandText = string.Format(@"select top 1 InCostPrice from tbStorOtherOutItemDetail where BillNo = '{0}' 
                       and ListNo = '{1}'", CurrRow["BillNo"], CurrRow["ListNo"]);
                    break;
                case HYStorageManager._SelfSaleOut:
                case HYStorageManager._SelfSaleOutRed:
                    cmd.CommandText = string.Format(@"select top 1 InCostPrice from tbSelfSaleOutItem where BillNo = '{0}' 
                       and isListNo = 1 and ListNo = '{1}'", CurrRow["BillNo"], CurrRow["ListNo"]);
                    break;
                case HYStorageManager._Redeploy:
                    cmd.CommandText = string.Format(@"select top 1 OutCostPrice from tbStorRedeployItemDetail where BillNo = '{0}' 
                       and ListNo = '{1}'", CurrRow["BillNo"], CurrRow["ListNo"]);
                    break;
                case HYStorageManager._RedeployIn:
                    cmd.CommandText = string.Format(@"select top 1 InCostPrice from tbStorRedeployItemDetail where BillNo = '{0}' 
                       and ListNo = '{1}'", CurrRow["BillNo"], CurrRow["ListNo"]);
                    break;
                case HYStorageManager._Check:
                    cmd.CommandText = string.Format(@"select top 1 InCostPrice from tbStorCheckItemDetail where BillNo = '{0}' 
                       and ListNo = '{1}'", CurrRow["BillNo"], CurrRow["ListNo"]);
                    break;
            }
            decimal SumMoney = xzSqlAnalysis.getValue(cmd.ExecuteScalar());

            cmd.CommandText = string.Format(@"update tbStorStorageList set SumMoney = {0} * Number
                                    where ProductSortCode = '{1}' and ProductCode = '{2}' and BillNo = '{3}' 
                                         and HandleSort = '{4}' and ListNo = '{5}'", SumMoney
                 , CurrRow["ProductSortCode"], CurrRow["ProductCode"], CurrRow["BillNo"]
                 , CurrRow["HandleSort"], CurrRow["ListNo"]);
            cmd.ExecuteNonQuery();
        }

        private SqlCommand FCommand = null;
        [Description("����"), Category("Xzz")]
        public SqlCommand Command
        {
            get
            {
                return FCommand;
            }
            set
            {
                if (FCommand != value)
                {
                    FCommand = value;
                }
            }
        }

        #region �ɱ�ά��
        private Hashtable htStockIn = new Hashtable();
        private Hashtable htOtherIn = new Hashtable();
        private Hashtable htSaleOut = new Hashtable();
        private Hashtable htOtherOut = new Hashtable();
        private Hashtable htRedeployOut = new Hashtable();
        private Hashtable htRedeployIn = new Hashtable();
        private Hashtable htCheck = new Hashtable();
        private void UpdateFlowtAndSourceCostMoney(DataRow CurrRow)
        {
            decimal InCostPrice = xzSqlAnalysis.getValue(CurrRow["InCostPrice"]);
            FCommand.CommandText = string.Format(@"update tbStorStorageList set SumMoney = {0} * Number
                                    where ProductSortCode = '{1}' and ProductCode = '{2}' and BillNo = '{3}' 
                                         and HandleSort = '{4}' and ListNo = '{5}'", InCostPrice
                 , CurrRow["ProductSortCode"], CurrRow["ProductCode"], CurrRow["BillNo"]
                 , CurrRow["HandleSort"], CurrRow["ListNo"]);
            FCommand.ExecuteNonQuery();
            InCostPrice = Math.Abs(InCostPrice);
            string StrSql = "", StrKey = string.Format("{0}\r{1}", CurrRow["BillNo"], CurrRow["RowNo"]);
            string HandleSort = CurrRow["HandleSort"].ToString();
            switch (HandleSort)
            {
                case HYStorageManager._StockIn:
                case HYStorageManager._StockInRed:
                    StrSql = @"update tbStorStockInItemDetail set InCostPrice = {0} where BillNo = '{1}' and  RowNo = {2} and ListNo = '{3}'";
                    FCommand.CommandText = string.Format(StrSql, InCostPrice, CurrRow["BillNo"], CurrRow["RowNo"], CurrRow["ListNo"]);
                    FCommand.ExecuteNonQuery();
                    if (!htStockIn.ContainsKey(StrKey))
                        htStockIn.Add(StrKey, CurrRow);
                    break;
                case HYStorageManager._OtherIn:
                case HYStorageManager._OtherInRed:
                case HYStorageManager._MaintainPostSelfReturn:
                case HYStorageManager._MaintainPostSelfReturnRed:
                    StrSql = @"update tbStorOtherInItemDetail set InCostPrice = {0} where BillNo = '{1}' and  RowNo = {2} and ListNo = '{3}'";
                    FCommand.CommandText = string.Format(StrSql, InCostPrice, CurrRow["BillNo"], CurrRow["RowNo"], CurrRow["ListNo"]);
                    FCommand.ExecuteNonQuery();
                    if (!htOtherIn.ContainsKey(StrKey))
                        htOtherIn.Add(StrKey, CurrRow);
                    break;
                case HYStorageManager._SaleOut:
                case HYStorageManager._SaleOutRed:
                    StrSql = @"update tbSaleOutItemDetail set InCostPrice = {0} where BillNo = '{1}' and  RowNo = {2} and ListNo = '{3}'";
                    FCommand.CommandText = string.Format(StrSql, InCostPrice, CurrRow["BillNo"], CurrRow["RowNo"], CurrRow["ListNo"]);
                    FCommand.ExecuteNonQuery();
                    if (!htSaleOut.ContainsKey(StrKey))
                        htSaleOut.Add(StrKey, CurrRow);
                    break;
                case HYStorageManager._OtherOut:
                case HYStorageManager._OtherOutRed:
                    StrSql = @"update tbStorOtherOutItemDetail set InCostPrice = {0} where BillNo = '{1}' and  RowNo = {2} and ListNo = '{3}'";
                    FCommand.CommandText = string.Format(StrSql, InCostPrice, CurrRow["BillNo"], CurrRow["RowNo"], CurrRow["ListNo"]);
                    FCommand.ExecuteNonQuery();
                    if (!htOtherOut.ContainsKey(StrKey))
                        htOtherOut.Add(StrKey, CurrRow);
                    break;
                case HYStorageManager._SelfSaleOut:
                case HYStorageManager._SelfSaleOutRed:
                    StrSql = @"update tbSelfSaleOutItem set InCostPrice = {0}, SumMoney = {0} * Number
                                  where BillNo = '{1}' and  RowNo = {2} and ListNo = '{3}'";
                    FCommand.CommandText = string.Format(StrSql, InCostPrice, CurrRow["BillNo"], CurrRow["RowNo"], CurrRow["ListNo"]);
                    FCommand.ExecuteNonQuery();
                    break;
                case HYStorageManager._Redeploy:
                    StrSql = @"update tbStorRedeployItemDetail set outCostPrice = {0} where BillNo = '{1}' and  RowNo = {2} and ListNo = '{3}'";
                    FCommand.CommandText = string.Format(StrSql, InCostPrice, CurrRow["BillNo"], CurrRow["RowNo"], CurrRow["ListNo"]);
                    FCommand.ExecuteNonQuery();
                    if (!htRedeployOut.ContainsKey(StrKey))
                        htRedeployOut.Add(StrKey, CurrRow);
                    break;
                case HYStorageManager._RedeployIn:
                    StrSql = @"update tbStorRedeployItemDetail set InCostPrice = {0} where BillNo = '{1}' and  RowNo = {2} and ListNo = '{3}'";
                    FCommand.CommandText = string.Format(StrSql, InCostPrice, CurrRow["BillNo"], CurrRow["RowNo"], CurrRow["ListNo"]);
                    FCommand.ExecuteNonQuery();
                    if (!htRedeployIn.ContainsKey(StrKey))
                        htRedeployIn.Add(StrKey, CurrRow);
                    break;
                case HYStorageManager._Check:
                    StrSql = @"update tbStorCheckItemDetail set InCostPrice = {0} where BillNo = '{1}' and  RowNo = {2} and ListNo = '{3}'";
                    FCommand.CommandText = string.Format(StrSql, InCostPrice, CurrRow["BillNo"], CurrRow["RowNo"], CurrRow["ListNo"]);
                    FCommand.ExecuteNonQuery();
                    if (!htCheck.ContainsKey(StrKey))
                        htCheck.Add(StrKey, CurrRow);
                    break;
                case HYStorageManager._MaintainPostSelf:
                case HYStorageManager._MaintainPostSelfRed:
                    StrSql = @"update tbStorMaintainPostSelfItem set InCostPrice = {0}, SumMoney = {0} * Number
                                 where BillNo = '{1}' and  RowNo = {2} and ListNo = '{3}'";
                    FCommand.CommandText = string.Format(StrSql, InCostPrice, CurrRow["BillNo"], CurrRow["RowNo"], CurrRow["ListNo"]);
                    FCommand.ExecuteNonQuery();
                    break;
            }
        }

        private Hashtable htStockInEx = new Hashtable();
        private void UpdateFlowtAndSourceCostMoney()
        {
            foreach (DataRow CurrRow in htStockIn.Values)
            {
                decimal InCostPrice = 0m;
                FCommand.CommandText = string.Format(@"select sum(InCostPrice) / count(*) from tbStorStockInItemDetail
                                    where BillNo = '{0}' and RowNo = {1} and isnull(InCostPrice,0)<>0", CurrRow["BillNo"], CurrRow["RowNo"]);
                InCostPrice = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
                FCommand.CommandText = string.Format(
                            @"update tbStorStockInItem set SumMoney = {0} * Number
                               , InCostPrice = {0}
                               , Price = {0} * (1 + TaxRate/100) / (1 - AgioRate/100)  / (1 + TaxRate/100)
                               , TaxPrice = {0} * (1 + TaxRate/100) / (1 - AgioRate/100)
                               , AgioMoney = {0} * Number * (1 + TaxRate/100) / (1 - AgioRate/100) * AgioRate/100
                               , TaxMoney = {0} * Number * TaxRate
                               , InCostTaxPrice = {0} * (1 + TaxRate/100)
                               , TotalMoney = {0} * Number * (1 + TaxRate/100) 
                             where BillNo = '{1}' and RowNo = {2}", InCostPrice, CurrRow["BillNo"], CurrRow["RowNo"]);
                FCommand.ExecuteNonQuery();

                string StrBillNo = CurrRow["BillNo"].ToString();
                if (!htStockInEx.ContainsKey(StrBillNo))
                    htStockInEx.Add(StrBillNo, CurrRow);
            }

            foreach (DataRow CurrRow in htOtherIn.Values)
            {
                decimal InCostPrice = 0m;
                FCommand.CommandText = string.Format(@"select sum(InCostPrice) / count(*) InCostPrice from tbStorOtherInItemDetail
                                    where BillNo = '{0}' and RowNo = {1} and isnull(InCostPrice,0)<>0", CurrRow["BillNo"], CurrRow["RowNo"]);
                InCostPrice = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
                FCommand.CommandText = string.Format(
                            @"update tbStorOtherInItem set SumMoney = {0} * Number, InCostPrice = {0}
                             where BillNo = '{1}' and RowNo = {2}", InCostPrice, CurrRow["BillNo"], CurrRow["RowNo"]);
                FCommand.ExecuteNonQuery();
            }

            foreach (DataRow CurrRow in htSaleOut.Values)
            {
                decimal InCostPrice = 0m;
                FCommand.CommandText = string.Format(@"select sum(InCostPrice) / count(*) InCostPrice from tbSaleOutItemDetail
                                    where BillNo = '{0}' and RowNo = {1} and isnull(InCostPrice,0)<>0", CurrRow["BillNo"], CurrRow["RowNo"]);
                InCostPrice = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
                FCommand.CommandText = string.Format(
                            @"update tbSaleOutItem set SumMoney = {0} * Number, InCostPrice = {0}
                             where BillNo = '{1}' and RowNo = {2}", InCostPrice, CurrRow["BillNo"], CurrRow["RowNo"]);
                FCommand.ExecuteNonQuery();
            }

            foreach (DataRow CurrRow in htOtherOut.Values)
            {
                decimal InCostPrice = 0m;
                FCommand.CommandText = string.Format(@"select sum(InCostPrice) / count(*) InCostPrice from tbStorOtherOutItemDetail
                                    where BillNo = '{0}' and RowNo = {1} and isnull(InCostPrice,0)<>0", CurrRow["BillNo"], CurrRow["RowNo"]);
                InCostPrice = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
                FCommand.CommandText = string.Format(
                            @"update tbStorOtherOutItem set SumMoney = {0} * Number, InCostPrice = {0}
                             where BillNo = '{1}' and RowNo = {2}", InCostPrice, CurrRow["BillNo"], CurrRow["RowNo"]);
                FCommand.ExecuteNonQuery();
            }

            foreach (DataRow CurrRow in htRedeployOut.Values)
            {
                decimal OutCostPrice = 0m;
                FCommand.CommandText = string.Format(@"select sum(OutCostPrice)/count(*) OutCostPrice from tbStorRedeployItemDetail
                                    where BillNo = '{0}' and RowNo = {1} and isnull(OutCostPrice,0)<>0", CurrRow["BillNo"], CurrRow["RowNo"]);
                OutCostPrice = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
                FCommand.CommandText = string.Format(
                            @"update tbStorRedeployItem set OutSumMoney = {0} * Number, OutCostPrice = {0}
                             where BillNo = '{1}' and RowNo = {2}", OutCostPrice, CurrRow["BillNo"], CurrRow["RowNo"]);
                FCommand.ExecuteNonQuery();
            }

            foreach (DataRow CurrRow in htRedeployIn.Values)
            {
                decimal InCostPrice = 0m;
                FCommand.CommandText = string.Format(@"select sum(InCostPrice) / count(*) InCostPrice from tbStorRedeployItemDetail
                                    where BillNo = '{0}' and RowNo = {1} and isnull(InCostPrice,0)<>0", CurrRow["BillNo"], CurrRow["RowNo"]);
                InCostPrice = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
                FCommand.CommandText = string.Format(
                            @"update tbStorRedeployItem set InSumMoney = {0} * Number, InCostPrice = {0}
                             where BillNo = '{1}' and RowNo = {2}", InCostPrice, CurrRow["BillNo"], CurrRow["RowNo"]);
                FCommand.ExecuteNonQuery();
            }

            foreach (DataRow CurrRow in htCheck.Values)
            {
                decimal InCostPrice = 0m;
                FCommand.CommandText = string.Format(@"select sum(InCostPrice) / count(*) InCostPrice from tbStorCheckItemDetail
                                    where BillNo = '{0}' and RowNo = {1} and isnull(InCostPrice,0)<>0", CurrRow["BillNo"], CurrRow["RowNo"]);
                InCostPrice = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
                FCommand.CommandText = string.Format(
                            @"update tbStorCheckItem set SumMoney = {0} * Number, InCostPrice = {0}
                             where BillNo = '{1}' and RowNo = {2}", InCostPrice, CurrRow["BillNo"], CurrRow["RowNo"]);
                FCommand.ExecuteNonQuery();
            }
        }

        private void UpdateFlowtAndSourceCostMoneyEx()
        {
            foreach (DataRow CurrRow in htStockInEx.Values)
            {
                decimal SumMoney = 0m;
                decimal TotalMoney = 0m;
                FCommand.CommandText = string.Format(@"select sum(SumMoney) SumMoney,  sum(TotalMoney) from tbStorStockInItem
                                    where BillNo = '{0}'", CurrRow["BillNo"]);
                SqlDataReader Reader = FCommand.ExecuteReader();
                if (Reader.Read())
                {
                    SumMoney = xzSqlAnalysis.getValue(Reader[0]);
                    TotalMoney = xzSqlAnalysis.getValue(Reader[1]);
                }
                Reader.Close();
                FCommand.CommandText = string.Format(@"update tbStorStockIn set SumMoney = {0}, TotalMoney = {1}
                                    where BillNo = '{2}'", SumMoney, TotalMoney, CurrRow["BillNo"]);
                FCommand.ExecuteNonQuery();
            }
        }

        public void UpdateFlowtAndSourceCostMoney(DataTable Table)
        {
            foreach (DataRow CurrRow in Table.Rows)
                UpdateFlowtAndSourceCostMoney(CurrRow);
            UpdateFlowtAndSourceCostMoney();
            UpdateFlowtAndSourceCostMoneyEx();
        }
        #endregion

        private string getKey(DataRow Row)
        {
            return string.Format("{0}\r{1}\r{2}", Row["ProductSortCode"], Row["ProductCode"], Row["ListNo"]);
        }

        private string getKey(DataRow Row, object TheMode)
        {
            return string.Format("{0}\r{1}\r{2}\r{3}\r{4}", TheMode, Row["ProductSortCode"], Row["ProductCode"]
                        , Row["ListNo"], Row["BillNo"]);
        }

        #region ��ȡ�ڳ����ɱ�
        public Hashtable getStorPrice(SqlDataAdapter sqlda, DateTime ATime)
        {
            Hashtable HaResult = new Hashtable();
            DateTime TheDate = ATime.AddDays(-1).Date.AddHours(23).AddMinutes(59).AddSeconds(59);
            FCommand.CommandText = string.Format(@"select ProductSortCode, ProductCode, ListNo, InCostPrice  
              from tbCourseStorPriceList  where TheDate = '{0}'", TheDate);
            using (DataTable Table = new DataTable())
            {
                sqlda.Fill(Table);
                foreach (DataRow Row in Table.Rows)
                {
                    decimal InCostPrice = xzSqlAnalysis.getValue(Row["InCostPrice"]);
                    if (InCostPrice != 0m)
                    {
                        string key = getKey(Row);
                        if (!HaResult.ContainsKey(key))
                            HaResult.Add(key, InCostPrice);
                    }
                }
            }
            return HaResult;
        }
        #endregion

        #region ������̵ļ�¼

        private DataTable getHistoryTable()
        {
            DataTable Table = new DataTable();
            DataColumn Column = Table.Columns.Add();
            Column.ColumnName = "TheSort";
            Column.DataType = typeof(Int32);
            Column = Table.Columns.Add();
            Column.ColumnName = "ProductSortCode";
            Column.MaxLength = 10;
            Column.DataType = typeof(string);
            //Column = Table.Columns.Add();
            //Column.ColumnName = "ProductSortName";
            //Column.MaxLength = 10;
            //Column.DataType = typeof(string);
            Column = Table.Columns.Add();
            Column.ColumnName = "ProductCode";
            Column.MaxLength = 30;
            Column.DataType = typeof(string);
            Column = Table.Columns.Add();
            Column.ColumnName = "ListNo";
            Column.MaxLength = 20;
            Column.DataType = typeof(string);
            //Column = Table.Columns.Add();
            //Column.ColumnName = "ProductName";
            //Column.MaxLength = 50;
            //Column.DataType = typeof(string);
            //Column = Table.Columns.Add();
            //Column.ColumnName = "ConfigName";
            //Column.MaxLength = 50;
            //Column.DataType = typeof(string);
            Column = Table.Columns.Add();
            Column.ColumnName = "SerialNo";
            Column.DataType = typeof(decimal);
            Column = Table.Columns.Add();
            Column.ColumnName = "HandleSort";
            Column.MaxLength = 10;
            Column.DataType = typeof(string);
            Column = Table.Columns.Add();
            Column.ColumnName = "HandleCourse";
            Column.MaxLength = 30;
            Column.DataType = typeof(string);
            Column = Table.Columns.Add();
            Column.ColumnName = "BillNo";
            Column.MaxLength = 20;
            Column.DataType = typeof(string);
            Column = Table.Columns.Add();
            Column.ColumnName = "RowNo";
            Column.DataType = typeof(Int32);
            Column = Table.Columns.Add();
            Column.ColumnName = "TheDate";
            Column.DataType = typeof(DateTime);
            Column = Table.Columns.Add();
            Column.ColumnName = "StorageCode";
            Column.MaxLength = 10;
            Column.DataType = typeof(string);
            //Column = Table.Columns.Add();
            //Column.ColumnName = "StorageName";
            //Column.MaxLength = 30;
            //Column.DataType = typeof(string);
            Column = Table.Columns.Add();
            Column.ColumnName = "PlaceCode";
            Column.MaxLength = 10;
            Column.DataType = typeof(string);
            //Column = Table.Columns.Add();
            //Column.ColumnName = "PlaceName";
            //Column.MaxLength = 30;
            //Column.DataType = typeof(string);
            Column = Table.Columns.Add();
            Column.ColumnName = "OldCostPrice";
            Column.DataType = typeof(decimal);
            Column = Table.Columns.Add();
            Column.ColumnName = "NewCostPrice";
            Column.DataType = typeof(decimal);
            Column = Table.Columns.Add();
            Column.ColumnName = "InCostPrice";
            Column.DataType = typeof(decimal);
            return Table;
        }

        private void NewHistoryRow(DataTable HistoryTable, DataRow CurrRow, int TheSort
            , decimal OldCostPrice, decimal NewCostPrice, decimal InCostPrice)
        {
            DataRow HistoryRow = HistoryTable.NewRow();
            foreach (DataColumn Column in CurrRow.Table.Columns)
            {
                if (HistoryTable.Columns.Contains(Column.ColumnName))
                    HistoryRow[Column.ColumnName] = CurrRow[Column.ColumnName];
            }
            HistoryRow["TheSort"] = TheSort;
            HistoryRow["OldCostPrice"] = OldCostPrice;
            HistoryRow["NewCostPrice"] = NewCostPrice;
            HistoryRow["InCostPrice"] = InCostPrice;
            HistoryTable.Rows.Add(HistoryRow);
        }

        #endregion

        #region �ɱ�����
        public Hashtable getMaintainOpposite(SqlDataAdapter sqlda, DateTime BeginTime, DateTime EndTime)
        {
            Hashtable HaResult = new Hashtable();
            FCommand.CommandText = string.Format(
               @"select a.VerifyNo,a.ProductSortCode,a.ProductCode,a.BillNo,a.ListNo, c.BillNo ReturnBillNo, c.ListNo ReturnListNo, c.InCostPrice
                   from tbStorOtherInItemDetail a
                Left Outer Join tbStorOtherIn b on a.BillNo = b.BillNo
                Left Outer Join tbStorMaintainPostSelfItem c on a.VerifyNo = c.VerifyNo
                where a.isVerify = 1 and b.TheDate>='{0}' and b.TheDate<='{1}'", BeginTime, EndTime);
            using (DataTable Table = new DataTable())
            {
                sqlda.Fill(Table);
                foreach (DataRow Row in Table.Rows)
                {
                    int VerifyNo = Convert.ToInt32(Row["VerifyNo"]);
                    HYListCostMaintainParam FListCostMaintainParam = new HYListCostMaintainParam();
                    FListCostMaintainParam.VerifyNo = VerifyNo;
                    FListCostMaintainParam.InCostPrice = xzSqlAnalysis.getValue(Row["InCostPrice"]);
                    string key = getKey(Row, 1);
                    HaResult.Add(key, FListCostMaintainParam);

                    key = string.Format("{0}\r{1}\r{2}\r{3}\r{4}", 0, Row["ProductSortCode"], Row["ProductCode"]
                        , Row["ReturnListNo"], Row["ReturnBillNo"]);
                    FListCostMaintainParam = new HYListCostMaintainParam();
                    FListCostMaintainParam.VerifyNo = VerifyNo;
                    FListCostMaintainParam.InCostPrice = 0m;
                    HaResult.Add(key, FListCostMaintainParam);
                }
            }
            return HaResult;
        }

        private void SetOpposite(Hashtable HaMaintainOpposite, Hashtable HaOpposite, DataRow CurrRow, int TheMode)
        {
            string OppositeKey = getKey(CurrRow, TheMode);
            if (HaMaintainOpposite.ContainsKey(OppositeKey))
            {
                HYListCostMaintainParam FListCostMaintainParam = HaMaintainOpposite[OppositeKey] as HYListCostMaintainParam;
                xzOppositeObject FOppositeObject;
                if (!HaOpposite.ContainsKey(FListCostMaintainParam.VerifyNo))
                {
                    FOppositeObject = new xzOppositeObject();
                    HaOpposite.Add(FListCostMaintainParam.VerifyNo, FOppositeObject);
                }
                else FOppositeObject = HaOpposite[FListCostMaintainParam.VerifyNo] as xzOppositeObject;

                switch (TheMode)
                {
                    case 0:                        
                        FOppositeObject.SourceObject = CurrRow; 
                        break;
                    case 1:
                        FOppositeObject.DestObject = CurrRow;
                        break;
                }
            }
        }

        private void DealCalcNotPriceRows(Hashtable HaMaintainOpposite, ArrayList NotPriceRowsArg
            , Hashtable HaOpposite, Hashtable HaPrice, DataTable HistoryTable)
        {
            ArrayList tmpNotPriceRowsArg = new ArrayList();            
            foreach (DataRow CurrRow in NotPriceRowsArg)
            {
                decimal InCostPrice = xzSqlAnalysis.getValue(CurrRow["InCostPrice"]);
                decimal OldCostPrice = 0m;
                decimal NewCostPrice = 0m;
                string key = getKey(CurrRow);                
                string HandleSort = CurrRow["HandleSort"].ToString();
                switch (HandleSort)
                {
                    case HYStorageManager._MaintainPostSelfReturn:
                    case HYStorageManager._MaintainPostSelfReturnRed:
                        if (HaMaintainOpposite.ContainsKey(CurrRow))
                        {
                            if (HaMaintainOpposite[CurrRow] is DataRow)
                            {
                                DataRow CurrRowOut = HaMaintainOpposite[CurrRow] as DataRow;
                                NewCostPrice = xzSqlAnalysis.getValue(CurrRowOut["InCostPrice"]);
                            }
                            else NewCostPrice = xzSqlAnalysis.getValue(HaMaintainOpposite[CurrRow]);
                            if (NewCostPrice != 0m)
                            {
                                if (HaPrice.ContainsKey(key))
                                {
                                    OldCostPrice = xzSqlAnalysis.getValue(HaPrice[key]);
                                    HaPrice[key] = NewCostPrice;
                                }
                                else HaPrice.Add(key, NewCostPrice);

                                NewHistoryRow(HistoryTable, CurrRow, 1, OldCostPrice, NewCostPrice, InCostPrice);

                                CurrRow["InCostPrice"] = NewCostPrice;
                                UpdateFlowtAndSourceCostMoney(CurrRow);
                                tmpNotPriceRowsArg.Add(CurrRow);
                                continue;
                            }
                        }
                        break;
                    case HYStorageManager._MaintainPostSelfRed:
                    case HYStorageManager._MaintainPostSelf:
                    case HYStorageManager._SaleOut:
                    case HYStorageManager._OtherOut:
                    case HYStorageManager._SelfSaleOut:
                    case HYStorageManager._Redeploy:
                    case HYStorageManager._RedeployIn:
                        if (HaPrice.ContainsKey(key)) NewCostPrice = xzSqlAnalysis.getValue(HaPrice[key]);
                        if (NewCostPrice != 0m)
                        {
                            InCostPrice = xzSqlAnalysis.getValue(CurrRow["InCostPrice"]);
                            CurrRow["InCostPrice"] = NewCostPrice;
                            UpdateFlowtAndSourceCostMoney(CurrRow);

                            NewHistoryRow(HistoryTable, CurrRow, 1, 0, NewCostPrice, InCostPrice);

                            tmpNotPriceRowsArg.Add(CurrRow);
                            continue;
                        }
                        break;
                }
            }

            //ͨ���ݹ���ɳɱ��Ļ�ȡ
            if (tmpNotPriceRowsArg.Count > 0)
            {
                foreach (DataRow CurrRow in tmpNotPriceRowsArg)
                    NotPriceRowsArg.Remove(CurrRow);
                DealCalcNotPriceRows(HaMaintainOpposite, NotPriceRowsArg, HaOpposite, HaPrice, HistoryTable);
            }
        }

        public void DealCalc(DataTable Table, Hashtable HaMaintainOpposite, Hashtable HaPrice, DateTime TheDate
            , string cause, xzFinPriceHistory FinPriceHistory)
        {
            DataTable HistoryTable = getHistoryTable();

            #region ����ƾ֤����
            Hashtable HaOpposite = new Hashtable();      //�ĳ��뷵�صĶ�Ӧ��ϵ[����]
            ArrayList NotPriceRowsArg = new ArrayList(); //�޷��ɱ�����ļ�¼

            foreach (DataRow CurrRow in Table.Rows)
            {
                string key = getKey(CurrRow);
                decimal InCostPrice = xzSqlAnalysis.getValue(CurrRow["InCostPrice"]);
                decimal OldCostPrice = 0m;
                decimal NewCostPrice = 0m;
                string HandleSort = CurrRow["HandleSort"].ToString();
                switch (HandleSort)
                {
                    case HYStorageManager._Check:
                    case HYStorageManager._StockIn:
                    case HYStorageManager._StockInRed:
                    case HYStorageManager._OtherIn:
                    case HYStorageManager._OtherInRed:
                    case HYStorageManager._SaleOutRed:
                    case HYStorageManager._OtherOutRed:
                    case HYStorageManager._SelfSaleOutRed:
                        if (InCostPrice != 0m)
                        {
                            if (HaPrice.ContainsKey(key))
                            {
                                OldCostPrice = xzSqlAnalysis.getValue(HaPrice[key]);
                                HaPrice[key] = InCostPrice;
                            }
                            else HaPrice.Add(key, InCostPrice);
                            NewCostPrice = InCostPrice; 
                            NewHistoryRow(HistoryTable, CurrRow, 0, OldCostPrice, NewCostPrice, 0);
                        }
                        break;
                    case HYStorageManager._SaleOut:
                    case HYStorageManager._OtherOut:
                    case HYStorageManager._SelfSaleOut:
                    case HYStorageManager._Redeploy:
                    case HYStorageManager._RedeployIn:
                        if (HaPrice.ContainsKey(key))
                        {
                            NewCostPrice = xzSqlAnalysis.getValue(HaPrice[key]);
                            CurrRow["InCostPrice"] = NewCostPrice;
                            UpdateFlowtAndSourceCostMoney(CurrRow);

                            NewHistoryRow(HistoryTable, CurrRow, 1, 0, NewCostPrice, InCostPrice);
                        }
                        else NotPriceRowsArg.Add(CurrRow);
                        break;
                    case HYStorageManager._MaintainPostSelfRed:
                    case HYStorageManager._MaintainPostSelf:
                        SetOpposite(HaMaintainOpposite, HaOpposite, CurrRow, 0);
                        NotPriceRowsArg.Add(CurrRow);
                        break;
                    case HYStorageManager._MaintainPostSelfReturn:
                    case HYStorageManager._MaintainPostSelfReturnRed:
                        SetOpposite(HaMaintainOpposite, HaOpposite, CurrRow, 1);
                        NotPriceRowsArg.Add(CurrRow);
                        break;
                }
            }

            //�������ؼ�ά�޵Ķ�Ӧ��
            Hashtable HaMaintainOppositeEx = new Hashtable();
            foreach (xzOppositeObject OppositeObject in HaOpposite.Values)
            {
                if (OppositeObject.DestObject != null)
                {
                    if (OppositeObject.SourceObject == null)
                    {
                        string key = getKey(OppositeObject.DestObject as DataRow, 1);
                        if (HaMaintainOpposite.ContainsKey(key))
                        {
                            HYListCostMaintainParam FListCostMaintainParam = HaMaintainOpposite[key] as HYListCostMaintainParam;
                            if (FListCostMaintainParam.InCostPrice != 0m)
                                HaMaintainOppositeEx.Add(OppositeObject.DestObject, FListCostMaintainParam.InCostPrice);
                        }
                    }
                    else HaMaintainOppositeEx.Add(OppositeObject.DestObject, OppositeObject.SourceObject);
                }
            }

            //�ݹ��㾡���гɱ�
            DealCalcNotPriceRows(HaMaintainOppositeEx, NotPriceRowsArg, HaOpposite, HaPrice, HistoryTable);

            UpdateFlowtAndSourceCostMoney();
            UpdateFlowtAndSourceCostMoneyEx();
            #endregion

            #region ����������
            ArrayList HistoryArg = new ArrayList();
            HistoryArg.Add(HistoryTable);
            byte[] bytes = xzStreamStorage.getArrayToStream(HistoryArg);
            FinPriceHistory.CreateHistory(bytes);
            #endregion

            #region ���н��                       
            foreach (string key in HaPrice.Keys)
            {
                string[] keys = key.Split('\r');
                string SqlStr = @"delete tbCourseStorPriceList where ProductSortCode='{0}' and ProductCode = '{1}'
                                    and ListNo = '{2}' and theDate = '{3}'";
                FCommand.CommandText = string.Format(SqlStr, keys[0], keys[1], keys[2], TheDate);
                FCommand.ExecuteNonQuery();
                SqlStr = @"insert into tbCourseStorPriceList (ProductSortCode,ProductCode,ListNo,InCostPrice,theDate) 
                             values ('{0}','{1}','{2}',{3},'{4}')";
                FCommand.CommandText = string.Format(SqlStr, keys[0], keys[1], keys[2], HaPrice[key], TheDate);
                FCommand.ExecuteNonQuery();
            }
            #endregion
        }
        #endregion
    } 

    #endregion

    #region ������

    /// <summary>
    /// ���ŵĿ����Ϣ
    /// </summary>
    [Serializable]
    public class HYStorageListInfo
    {
        private string FProductSort = "";
        [Description("��Ʒ�����"), Category("Xzz")]
        public string ProductSort
        {
            get
            {
                return FProductSort;
            }
            set
            {
                if (FProductSort != value)
                {
                    FProductSort = value;
                }
            }
        }

        private string FProductCode = "";
        [Description("����"), Category("Xzz")]
        public string ProductCode
        {
            get
            {
                return FProductCode;
            }
            set
            {
                if (FProductCode != value)
                {
                    FProductCode = value;
                }
            }
        }

        private string FStorageCode = "";
        [Description("�ֿ�"), Category("Xzz")]
        public string StorageCode
        {
            get
            {
                return FStorageCode;
            }
            set
            {
                if (FStorageCode != value)
                {
                    FStorageCode = value;
                }
            }
        }

        private string FPlaceCode = "";
        [Description("��λ"), Category("Xzz")]
        public string PlaceCode
        {
            get
            {
                return FPlaceCode;
            }
            set
            {
                if (FPlaceCode != value)
                {
                    FPlaceCode = value;
                }
            }
        }

        private decimal FNumber = 0;
        [Description("����"), Category("Xzz")]
        public decimal Number
        {
            get
            {
                return FNumber;
            }
            set
            {
                if (FNumber != value)
                {
                    FNumber = value;
                }
            }
        }

        private decimal FSumMoney = 0;
        [Description("�ɱ�"), Category("Xzz")]
        public decimal SumMoney
        {
            get
            {
                return FSumMoney;
            }
            set
            {
                if (FSumMoney != value)
                {
                    FSumMoney = value;
                }
            }
        }

        private string FListNo = "";
        [Description("����"), Category("Xzz")]
        public string ListNo
        {
            get
            {
                return FListNo;
            }
            set
            {
                if (FListNo != value)
                {
                    FListNo = value;
                }
            }
        }

        private string FSupplyerCode = "";
        [Description("��Ӧ��"), Category("Xzz")]
        public string SupplyerCode
        {
            get
            {
                return FSupplyerCode;
            }
            set
            {
                if (FSupplyerCode != value)
                {
                    FSupplyerCode = value;
                }
            }
        }

        private string FSupplyerType = "";
        [Description("��Ӧ�����"), Category("Xzz")]
        public string SupplyerType
        {
            get
            {
                return FSupplyerType;
            }
            set
            {
                if (FSupplyerType != value)
                {
                    FSupplyerType = value;
                }
            }
        }

        private DateTime FInDate;
        [Description("�������"), Category("Xzz")]
        public DateTime InDate
        {
            get
            {
                return FInDate;
            }
            set
            {
                if (FInDate != value)
                {
                    FInDate = value;
                }
            }
        }
    }

    /// <summary>
    /// ������
    /// </summary>
    public class HYStorageManager
    {
        private SqlCommand FCommand = null;
        [Description("����"), Category("Xzz")]
        public SqlCommand Command
        {
            get
            {
                return FCommand;
            }
            set
            {
                if (FCommand != value)
                {
                    FCommand = value;
                }
            }
        }

        private HYField FField = new HYField();
        [Description("Ĭ�ϵ��ֶ�����"), Category("Xzz")]
        public HYField Field
        {
            get
            {
                return FField;
            }
        }

        #region ���ݵ����Ƽ���Ӧ�ı��
        public const string _StockIn = "010";
        public const string _StockInName = "�⹺��ⵥ";
        public const string _StockInRed = "011";
        public const string _StockInRedName = "�⹺��ⵥ(�쵥)";

        public const string _OtherIn = "020";
        public const string _OtherInName = "������ⵥ";
        public const string _OtherInRed = "021";
        public const string _OtherInRedName = "������ⵥ(�쵥)";

        public const string _Redeploy = "030";
        public const string _RedeployName = "�ֿ������(ȷ��)";

        public const string _RedeployIn = "035";
        public const string _RedeployInName = "�ֿ������(����)";

        public const string _MaintainPostSelf = "040";
        public const string _MaintainPostSelfName = "ֱӪ��ά���ĳ���";
        public const string _MaintainPostSelfRed = "041";
        public const string _MaintainPostSelfRedName = "ֱӪ��ά���ĳ���(�쵥)";

        public const string _MaintainPostSelfReturn = "050";
        public const string _MaintainPostSelfReturnName = "ֱӪ��ά�����ص�";
        public const string _MaintainPostSelfReturnRed = "051";
        public const string _MaintainPostSelfReturnRedName = "ֱӪ��ά�����ص�(�쵥)";

        public const string _Check = "060";
        public const string _CheckName = "�ֿ�ӯ���̵�";

        public const string _SaleOut = "100";
        public const string _SaleOutName = "���۳���";
        public const string _SaleOutRed = "101";
        public const string _SaleOutRedName = "���۳���(�쵥)";

        public const string _OtherOut = "110";
        public const string _OtherOutName = "�������ⵥ";
        public const string _OtherOutRed = "111";
        public const string _OtherOutRedName = "�������ⵥ(�쵥)";

        public const string _SelfSaleOut = "120";
        public const string _SelfSaleOutName = "���ۿ���";
        public const string _SelfSaleOutRed = "121";
        public const string _SelfSaleOutRedName = "���ۿ���(�쵥)";
        #endregion

        #region �жϿ���е������Ƿ��㹻
        /// <summary>
        /// �жϿ���е������Ƿ��㹻
        /// </summary>
        public bool StorageIsEnough(DataTable Table)
        {
            Hashtable HaStorage = new Hashtable();
            foreach (DataRow row in Table.Rows)
            {
                string key = string.Format("{0}\n{1}\n{2}\n{3}", row[FField.FieldProductSort], row[FField.FieldProduct]
                   , row[FField.FieldStorage], row[FField.FieldPlace]);
                if (!HaStorage.ContainsKey(key)) HaStorage.Add(key, xzSqlAnalysis.getValue(row[FField.FieldNumber]));
                else HaStorage[key] = Convert.ToDecimal(HaStorage[key]) + xzSqlAnalysis.getValue(row[FField.FieldNumber]);
            }

            foreach (string key in HaStorage.Keys)
            {
                string[] Params = key.Split('\n');
                string Sql = @"select sum(Number) from tbStorStorage where ProductSortCode='{0}' and ProductCode='{1}'
                                      and StorageCode='{2}' and PlaceCode='{3}'";
                Command.CommandText = string.Format(Sql, Params[0], Params[1], Params[2], Params[3], HaStorage[key]);
                object Number = Command.ExecuteScalar();
                if (xzSqlAnalysis.getValue(Number) < xzSqlAnalysis.getValue(HaStorage[key])) return false;
            }

            return true;
        }

        /// <summary>
        /// �жϿ���е������Ƿ��㹻
        /// </summary>
        public bool StorageIsEnough(object ProductSortCode, object ProductCode, object StorageCode, object PlaceCode, object Number)
        {
            string Sql = @"select sum(Number) from tbStorStorage where ProductSortCode='{0}' and ProductCode='{1}'
                                      and StorageCode='{2}' and PlaceCode='{3}'";
            Command.CommandText = string.Format(Sql, ProductSortCode, ProductCode, StorageCode, PlaceCode);
            object StorageNumber = Command.ExecuteScalar();
            if (xzSqlAnalysis.getValue(StorageNumber) >= xzSqlAnalysis.getAbsValue(Number)) return true;
            else return false;
        }
        #endregion

        #region �жϴ��Ƿ��ڿ���м�������ָ���Ĵ���
        /// <summary>
        /// �жϴ��Ƿ��ڿ���м�������ָ���Ĵ���
        /// </summary>
        public bool StorageHasListNo(object ProductSortCode, object ProductCode, object ListNo)
        {
            string Sql = @"select Count(*) from tbStorStorageItem where ProductSortCode='{0}' and ProductCode='{1}' and ListNo='{2}'";
            Command.CommandText = string.Format(Sql, ProductSortCode, ProductCode, ListNo);
            object ACount = Command.ExecuteScalar();
            return (Int32)ACount > 0;
        }

        public bool StorageHasListNo(DataTable Table)
        {
            foreach (DataRow row in Table.Rows)
            {
                if (StorageHasListNo(row[FField.FieldProductSort], row[FField.FieldProduct], row[FField.FieldListNo])) return true;
            }
            return false;
        }

        /// <summary>
        /// �жϴ��Ƿ���ָ���Ŀ���м�������ָ���Ĵ���
        /// </summary>
        public bool StorageHasListNo(object ProductSortCode, object ProductCode, object StorageCode, object PlaceCode, object ListNo)
        {
            string Sql = @"select Count(*) from tbStorStorageItem where ProductSortCode='{0}' and ProductCode='{1}' 
              and StorageCode = '{2}' and PlaceCode = '{3}' and ListNo='{4}'";
            Command.CommandText = string.Format(Sql, ProductSortCode, ProductCode, StorageCode, PlaceCode, ListNo);
            object ACount = Command.ExecuteScalar();
            return (Int32)ACount > 0;
        }
        #endregion

        #region ���¿������
        /// <summary>
        /// ������ת��Ĺ�Ӧ����Ϣ
        /// </summary>
        private void setFlowInfo(HYStorageListInfo FStorageListInfo, DataRow MasterRow, string ModuleSort)
        {
            FStorageListInfo.InDate = Convert.ToDateTime(MasterRow[FField.FieldTheDate]);
            switch (ModuleSort)
            {
                case _StockIn:
                case _StockInRed:
                case _OtherIn:
                case _OtherInRed:
                case _MaintainPostSelf:
                    FStorageListInfo.SupplyerType = MasterRow[FField.FieldSupplyerType].ToString();
                    FStorageListInfo.SupplyerCode = MasterRow[FField.FieldSupplyerCode].ToString();
                    break;
                case _SaleOut:
                case _SaleOutRed:
                case _OtherOut:
                case _OtherOutRed:
                case _SelfSaleOut:
                case _SelfSaleOutRed:
                    FStorageListInfo.SupplyerType = MasterRow[FField.FieldClientType].ToString();
                    FStorageListInfo.SupplyerCode = MasterRow[FField.FieldClientCode].ToString();
                    break;
                case _RedeployIn:
                    FStorageListInfo.SumMoney = -FStorageListInfo.SumMoney;
                    break;
            }
        }

        private void UpdateStorageListFlow(bool isCheck, HYStorageListInfo FStorageListInfo, DataRow ListRow, DataRow MasterRow
            , string ModuleSort, string ModuleName)
        {
            setFlowInfo(FStorageListInfo, MasterRow, ModuleSort);
            string sql = "";
            #region ������ת��
            if (isCheck)
            {
                sql = @"select Max(SerialNo) from tbStorStorageList where ProductSortCode = '{0}' and ProductCode = '{1}' and ListNo = '{2}'";
                FCommand.CommandText = string.Format(sql, FStorageListInfo.ProductSort, FStorageListInfo.ProductCode, ListRow[FField.FieldListNo]);
                object objSerialNo = FCommand.ExecuteScalar();

                int SerialNo = 0;
                if (int.TryParse(objSerialNo.ToString(), out SerialNo)) SerialNo++;

                sql = @"insert into tbStorStorageList (ListNo, BillNo, RowNo, HandleSort, HandleCourse, TheDate, CopartnerSort, Copartner,
                               StorageCode,PlaceCode, ProductSortCode, ProductCode, SerialNo, Number, SumMoney) values 
                         ('{0}','{1}',{2},'{3}','{4}','{5}','{6}','{7}','{8}','{9}', '{10}', '{11}', {12}, {13}, {14})";

                FCommand.CommandText = string.Format(sql, FStorageListInfo.ListNo, ListRow[FField.FieldBillNo], ListRow[FField.FieldRowNo]
                    , ModuleSort, ModuleName
                    , MasterRow[FField.FieldTheDate], FStorageListInfo.SupplyerType, FStorageListInfo.SupplyerCode
                    , FStorageListInfo.StorageCode, FStorageListInfo.PlaceCode, FStorageListInfo.ProductSort, FStorageListInfo.ProductCode
                    , SerialNo, FStorageListInfo.Number, FStorageListInfo.SumMoney);

                FCommand.ExecuteNonQuery();
            }
            else
            {
                sql = @"delete tbStorStorageList where ProductSortCode = '{0}' and ProductCode = '{1}' and
                             ListNo = '{2}' and  HandleSort = '{3}' and BillNo = '{4}'";
                FCommand.CommandText = string.Format(sql, FStorageListInfo.ProductSort, FStorageListInfo.ProductCode
                    , FStorageListInfo.ListNo, ModuleSort, ListRow[FField.FieldBillNo]);
                FCommand.ExecuteNonQuery();
            }
            #endregion
        }

        private void UpdateStorageProductFlow(bool isCheck, bool isStorageIn, HYStorageListInfo FStorageListInfo
            , DataRow DetailRow, DataRow MasterRow, string ModuleSort, string ModuleName)
        {
            setFlowInfo(FStorageListInfo, MasterRow, ModuleSort);            
            string sql = "";
            #region ��Ʒ��ת��
            if (isCheck)
            {
                string sign = "";
                if (!isStorageIn) sign = "-";

                sql = @"select Max(SerialNo) from tbStorStorageProduct where ProductSortCode = '{0}' and ProductCode = '{1}'";
                FCommand.CommandText = string.Format(sql, FStorageListInfo.ProductSort, FStorageListInfo.ProductCode);
                object objSerialNo = FCommand.ExecuteScalar();

                int SerialNo = 0;
                if (int.TryParse(objSerialNo.ToString(), out SerialNo)) SerialNo ++;

                sql = @"insert into tbStorStorageProduct (ProductSortCode, ProductCode, BillNo, RowNo, HandleSort, HandleCourse, TheDate,
                               CopartnerSort, Copartner, StorageCode,PlaceCode, isListNo, SerialNo, Number, SumMoney) values 
                         ('{0}','{1}','{2}',{3},'{4}','{5}','{6}','{7}','{8}','{9}','{10}',{11}, {12}, {13}{14}, {15}{16})";
                FCommand.CommandText = string.Format(sql, FStorageListInfo.ProductSort, FStorageListInfo.ProductCode
                    , DetailRow[FField.FieldBillNo], DetailRow[FField.FieldRowNo], ModuleSort, ModuleName, MasterRow[FField.FieldTheDate]
                    , FStorageListInfo.SupplyerType, FStorageListInfo.SupplyerCode
                    , FStorageListInfo.StorageCode, FStorageListInfo.PlaceCode
                    , DetailRow[FField.FieldisListNo], SerialNo, sign, xzSqlAnalysis.getAbsValue(DetailRow[FField.FieldNumber])
                    , sign, xzSqlAnalysis.getAbsValue(FStorageListInfo.SumMoney));
                FCommand.ExecuteNonQuery();
            }
            else
            {
                sql = @"delete tbStorStorageProduct where ProductSortCode = '{0}' and ProductCode = '{1}' and HandleSort = '{2}'
                         and BillNo = '{3}' and RowNo = {4}";
                FCommand.CommandText = string.Format(sql, FStorageListInfo.ProductSort, FStorageListInfo.ProductCode, ModuleSort
                    , DetailRow[FField.FieldBillNo], DetailRow[FField.FieldRowNo]);
                FCommand.ExecuteNonQuery();
            }
            #endregion
        }

        private bool setStorageListInfo(HYStorageListInfo FStorageListInfo, DataRow ListRow)
        {
            bool Result = false;
            string sql = @"select SupplyerType, SupplyerCode, StorageCode, PlaceCode,ProductSortCode, ProductCode, ListNo, InDate
                              from tbStorStorageItem where ProductSortCode = '{0}' and ProductCode = '{1}' and ListNo = '{2}'";
            FCommand.CommandText = string.Format(sql, FStorageListInfo.ProductSort, FStorageListInfo.ProductCode, FStorageListInfo.ListNo);
            using (SqlDataReader Reader = FCommand.ExecuteReader())
            {
                if (Reader.Read())
                {
                    FStorageListInfo.SupplyerType = Reader[FField.FieldSupplyerType].ToString();
                    FStorageListInfo.SupplyerCode = Reader[FField.FieldSupplyerCode].ToString();
                    FStorageListInfo.ProductSort = Reader[FField.FieldProductSort].ToString();
                    FStorageListInfo.ProductCode = Reader[FField.FieldProduct].ToString();
                    FStorageListInfo.ListNo = Reader[FField.FieldListNo].ToString();
                    FStorageListInfo.InDate = Convert.ToDateTime(Reader[FField.FieldInDate]);
                    Reader.Close();
                    Result = true;
                }
                else Reader.Close();
            }
            return Result;
        }

        private void UpdateStorageList3(bool isStorageIn, HYStorageListInfo FStorageListInfo, DataRow ListRow)
        {
            string sql = "";
            #region ��ǰ��洮�ű�
            if (isStorageIn)
            {
                sql = @"insert into tbStorStorageItem (SupplyerType, SupplyerCode, StorageCode, PlaceCode,ProductSortCode, ProductCode, ListNo
                             , InDate, Number) values ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}', {8})";
                FCommand.CommandText = string.Format(sql, FStorageListInfo.SupplyerType, FStorageListInfo.SupplyerCode
                    , FStorageListInfo.StorageCode, FStorageListInfo.PlaceCode, FStorageListInfo.ProductSort, FStorageListInfo.ProductCode
                    , FStorageListInfo.ListNo, FStorageListInfo.InDate, FStorageListInfo.Number);

                FCommand.ExecuteNonQuery();
            }
            else
            {
                #region ����ǰ�Ŀ����Ϣ��д�����ݽ��б���(�Ա㷴��ȷʱ�����Իָ������Ϣ)
                if (setStorageListInfo(FStorageListInfo, ListRow))
                {
                    sql = @"update {0} set SupplyerType='{1}', SupplyerCode = '{2}', ProductSortCode = '{3}', ProductCode = '{4}'
                                  , ListNo = '{5}' , InDate = '{6}'  where BillNo = '{7}' and RowNo = {8} and DetailNo = {9}";

                    FCommand.CommandText = string.Format(sql, ListRow.Table.TableName, FStorageListInfo.SupplyerType, FStorageListInfo.SupplyerCode
                        , FStorageListInfo.ProductSort, FStorageListInfo.ProductCode, FStorageListInfo.ListNo, FStorageListInfo.InDate
                        , ListRow[FField.FieldBillNo], ListRow[FField.FieldRowNo], ListRow[FField.FieldDetailNo]);

                    FCommand.ExecuteNonQuery();
                }
                #endregion

                sql = @"delete tbStorStorageItem where ProductSortCode = '{0}' and ProductCode = '{1}' and ListNo = '{2}'";
                FCommand.CommandText = string.Format(sql, FStorageListInfo.ProductSort, FStorageListInfo.ProductCode, FStorageListInfo.ListNo);
                FCommand.ExecuteNonQuery();

            }
            #endregion
        }

        private void UpdateStorageList2(bool isStorageIn, HYStorageListInfo FStorageListInfo, DataRow DetailRow)
        {
            string sql = "";
            #region ��ǰ��洮�ű�
            if (isStorageIn)
            {
                sql = @"insert into tbStorStorageItem (SupplyerType, SupplyerCode, StorageCode, PlaceCode,ProductSortCode, ProductCode, ListNo
                             , InDate, Number) values ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}', {8})";
                FCommand.CommandText = string.Format(sql, FStorageListInfo.SupplyerType, FStorageListInfo.SupplyerCode
                    , FStorageListInfo.StorageCode, FStorageListInfo.PlaceCode, FStorageListInfo.ProductSort, FStorageListInfo.ProductCode
                    , FStorageListInfo.ListNo, FStorageListInfo.InDate, FStorageListInfo.Number);

                FCommand.ExecuteNonQuery();
            }
            else
            {
                #region ����ǰ�Ŀ����Ϣ��д�����ݽ��б���(�Ա㷴��ȷʱ�����Իָ������Ϣ)
                if (setStorageListInfo(FStorageListInfo, DetailRow))
                {
                    sql = @"update {0} set SupplyerType='{1}', SupplyerCode = '{2}', ProductSortCode = '{3}', ProductCode = '{4}'
                                  , ListNo = '{5}' , InDate = '{6}'  where BillNo = '{7}' and RowNo = {8}";

                    FCommand.CommandText = string.Format(sql, DetailRow.Table.TableName, FStorageListInfo.SupplyerType, FStorageListInfo.SupplyerCode
                        , FStorageListInfo.ProductSort, FStorageListInfo.ProductCode, FStorageListInfo.ListNo, FStorageListInfo.InDate
                        , DetailRow[FField.FieldBillNo], DetailRow[FField.FieldRowNo]);

                    FCommand.ExecuteNonQuery();
                }
                #endregion

                sql = @"delete tbStorStorageItem where ProductSortCode = '{0}' and ProductCode = '{1}' and ListNo = '{2}'";
                FCommand.CommandText = string.Format(sql, FStorageListInfo.ProductSort, FStorageListInfo.ProductCode, FStorageListInfo.ListNo);
                FCommand.ExecuteNonQuery();

            }
            #endregion
        }

        /// <summary>
        /// ���¿�����������
        /// </summary>
        public void UpdateStorage3(bool isCheck, bool isStorageIn, string ModuleSort, string ModuleName
            , DataRow MasterRow, DataTable DetailTable, DataTable ListTable)
        {
            string StorageCode = "";
            xzDepositoryStorage Depository = new xzDepositoryStorage(), FlowDepository = new xzDepositoryStorage(); 
            Depository.Initial("tbStorStorage", "StorageCode;PlaceCode;ProductSortCode;ProductCode", "Number");
            foreach (DataRow DetailRow in DetailTable.Rows)
            {
                switch (ModuleSort)
                {
                    case _Check:
                        bool isCheckOut = xzSqlAnalysis.getValue(DetailRow[FField.FieldNumber]) < 0; //�Ƿ��̳�
                        StorageCode = MasterRow[FField.FieldStorage].ToString();
                        isStorageIn = (!isCheckOut && isCheck) || (isCheckOut && !isCheck);
                        break;
                    default:
                        StorageCode = DetailRow[FField.FieldStorage].ToString();
                        break;
                }

                #region ��ǰ����
                Depository.Exec(isStorageIn, Command.Connection, Command.Transaction
                    , string.Format("'{0}';'{1}';'{2}';'{3}'", StorageCode, DetailRow[FField.FieldPlace]
                    , DetailRow[FField.FieldProductSort], DetailRow[FField.FieldProduct])
                    , string.Format("{0}", xzSqlAnalysis.getAbsValue(DetailRow["Number"])));
                #endregion

                HYStorageListInfo FStorageListInfo = new HYStorageListInfo();
                FStorageListInfo.ProductSort = DetailRow[FField.FieldProductSort].ToString();
                FStorageListInfo.ProductCode = DetailRow[FField.FieldProduct].ToString();
                FStorageListInfo.StorageCode = StorageCode;
                FStorageListInfo.PlaceCode = DetailRow[FField.FieldPlace].ToString();

                if (Convert.ToInt32(DetailRow[FField.FieldisListNo]) == 1)
                {
                    int Number = 1;
                    if (!isStorageIn) Number = -1;
                    FStorageListInfo.Number = Number;

                    DataRow[] ListRows = ListTable.Select(string.Format("BillNo = '{0}' and RowNo = {1}"
                        , DetailRow[FField.FieldBillNo], DetailRow[FField.FieldRowNo]));
                    foreach (DataRow ListRow in ListRows)
                    {
                        #region ���ű������Ϣ
                        FStorageListInfo.ListNo = ListRow[FField.FieldListNo].ToString();
                        FStorageListInfo.SumMoney = xzSqlAnalysis.getValue(ListRow[FField.FieldInCostPrice]) * Number;

                        switch (ModuleSort)
                        {
                            case _StockIn:
                            case _StockInRed:
                            case _OtherIn:
                            case _OtherInRed:
                            case _MaintainPostSelfReturn:
                            case _MaintainPostSelfReturnRed:
                                FStorageListInfo.InDate = Convert.ToDateTime(MasterRow[FField.FieldTheDate]);
                                FStorageListInfo.SupplyerType = MasterRow[FField.FieldSupplyerType].ToString();
                                FStorageListInfo.SupplyerCode = MasterRow[FField.FieldSupplyerCode].ToString();

                                UpdateStorageList3(isStorageIn, FStorageListInfo, ListRow);
                                break;
                            case _RedeployIn:
                                FStorageListInfo.InDate = Convert.ToDateTime(ListRow[FField.FieldInDate]);
                                FStorageListInfo.SupplyerType = ListRow[FField.FieldSupplyerType].ToString();
                                FStorageListInfo.SupplyerCode = ListRow[FField.FieldSupplyerCode].ToString();

                                UpdateStorageList3(isStorageIn, FStorageListInfo, ListRow);
                                break;
                            case _Redeploy:
                            case _SaleOut:
                            case _OtherOut:
                                if (!isCheck)
                                {
                                    FStorageListInfo.InDate = Convert.ToDateTime(ListRow[FField.FieldInDate]);
                                    FStorageListInfo.SupplyerType = ListRow[FField.FieldSupplyerType].ToString();
                                    FStorageListInfo.SupplyerCode = ListRow[FField.FieldSupplyerCode].ToString();
                                }

                                UpdateStorageList3(isStorageIn, FStorageListInfo, ListRow);
                                break;
                            case _SaleOutRed:
                            case _OtherOutRed:
                                if (isCheck)
                                {
                                    if (ListRow[FField.FieldInDate] != DBNull.Value)
                                        FStorageListInfo.InDate = Convert.ToDateTime(ListRow[FField.FieldInDate]);
                                    FStorageListInfo.SupplyerType = ListRow[FField.FieldSupplyerType].ToString();
                                    FStorageListInfo.SupplyerCode = ListRow[FField.FieldSupplyerCode].ToString();
                                    if (FStorageListInfo.InDate == DateTime.MinValue)
                                        FStorageListInfo.InDate = Convert.ToDateTime(MasterRow[FField.FieldTheDate]);
                                }
                                else
                                {
                                    if (ListRow[FField.FieldInDate] != DBNull.Value)
                                        FStorageListInfo.InDate = Convert.ToDateTime(ListRow[FField.FieldInDate]);
                                    FStorageListInfo.SupplyerType = ListRow[FField.FieldSupplyerType].ToString();
                                    FStorageListInfo.SupplyerCode = ListRow[FField.FieldSupplyerCode].ToString();
                                }

                                UpdateStorageList3(isStorageIn, FStorageListInfo, ListRow);
                                break;
                            case _Check:
                                if (isCheck)
                                {
                                    bool isCheckIn = xzSqlAnalysis.getValue(DetailRow[FField.FieldNumber]) > 0; //�Ƿ�����
                                    if (isCheckIn && !setStorageListInfo(FStorageListInfo, ListRow))
                                    {
                                        if (FStorageListInfo.InDate == DateTime.MinValue)
                                            FStorageListInfo.InDate = Convert.ToDateTime(MasterRow[FField.FieldTheDate]);
                                    }
                                }
                                else
                                {
                                    if (ListRow[FField.FieldInDate] != DBNull.Value)
                                        FStorageListInfo.InDate = Convert.ToDateTime(ListRow[FField.FieldInDate]);
                                    FStorageListInfo.SupplyerType = ListRow[FField.FieldSupplyerType].ToString();
                                    FStorageListInfo.SupplyerCode = ListRow[FField.FieldSupplyerCode].ToString();
                                }
                                FStorageListInfo.StorageCode = StorageCode;

                                UpdateStorageList3(isStorageIn, FStorageListInfo, ListRow); //��ǰ��洮�ű�
                                break;
                            default:
                                break;
                        }
                        #endregion

                        #region ������ת���
                        UpdateStorageListFlow(isCheck, FStorageListInfo, ListRow, MasterRow, ModuleSort, ModuleName);
                        #endregion
                    }
                }
                else
                {
                    #region ��Ʒ��ת��
                    FStorageListInfo.SumMoney = xzSqlAnalysis.getValue(DetailRow[FField.FieldSumMoney]);
                    UpdateStorageProductFlow(isCheck, isStorageIn, FStorageListInfo, DetailRow, MasterRow, ModuleSort, ModuleName);
                    #endregion
                }
            }           
        }

        /// <summary>
        /// ���¿�����������
        /// </summary>
        public void UpdateStorage2(bool isCheck, bool isStorageIn, string ModuleSort, string ModuleName
            , DataRow MasterRow, DataTable DetailTable)
        {
            xzDepositoryStorage Depository = new xzDepositoryStorage(), FlowDepository = new xzDepositoryStorage();
            Depository.Initial("tbStorStorage", "StorageCode;PlaceCode;ProductSortCode;ProductCode", "Number");
            foreach (DataRow DetailRow in DetailTable.Rows)
            {
                #region ��ǰ����
                Depository.Exec(isStorageIn, Command.Connection, Command.Transaction
                    , string.Format("'{0}';'{1}';'{2}';'{3}'", DetailRow[FField.FieldStorage], DetailRow[FField.FieldPlace]
                    , DetailRow[FField.FieldProductSort], DetailRow[FField.FieldProduct])
                    , string.Format("{0}", xzSqlAnalysis.getAbsValue(DetailRow["Number"])));
                #endregion

                HYStorageListInfo FStorageListInfo = new HYStorageListInfo();
                FStorageListInfo.StorageCode = DetailRow[FField.FieldStorage].ToString();
                FStorageListInfo.PlaceCode = DetailRow[FField.FieldPlace].ToString();
                FStorageListInfo.ProductSort = DetailRow[FField.FieldProductSort].ToString();
                FStorageListInfo.ProductCode = DetailRow[FField.FieldProduct].ToString();

                if (Convert.ToInt32(DetailRow[FField.FieldisListNo]) == 1)
                {
                    #region ��ǰ�����ű�
                    int Number = 1;
                    if (!isStorageIn) Number = -1;

                    FStorageListInfo.Number = Number;
                    FStorageListInfo.ListNo = DetailRow[FField.FieldListNo].ToString();
                    FStorageListInfo.SumMoney = xzSqlAnalysis.getValue(DetailRow[FField.FieldInCostPrice]) * Number;

                    switch (ModuleSort)
                    {
                        case _MaintainPostSelf:
                        case _SelfSaleOut:
                            if (isCheck)
                            {
                                if (!setStorageListInfo(FStorageListInfo, DetailRow))
                                {
                                    if (FStorageListInfo.InDate == DateTime.MinValue)
                                        FStorageListInfo.InDate = Convert.ToDateTime(MasterRow[FField.FieldTheDate]);
                                }
                            }
                            else
                            {
                                FStorageListInfo.InDate = Convert.ToDateTime(DetailRow[FField.FieldInDate]);
                                FStorageListInfo.SupplyerType = DetailRow[FField.FieldSupplyerType].ToString();
                                FStorageListInfo.SupplyerCode = DetailRow[FField.FieldSupplyerCode].ToString();
                            }
                            break;
                        case _SelfSaleOutRed:
                            if (isCheck)
                            {
                                if (DetailRow[FField.FieldInDate] != DBNull.Value)
                                    FStorageListInfo.InDate = Convert.ToDateTime(DetailRow[FField.FieldInDate]);
                                FStorageListInfo.SupplyerType = DetailRow[FField.FieldSupplyerType].ToString();
                                FStorageListInfo.SupplyerCode = DetailRow[FField.FieldSupplyerCode].ToString();
                                if (FStorageListInfo.InDate == DateTime.MinValue)
                                    FStorageListInfo.InDate = Convert.ToDateTime(MasterRow[FField.FieldTheDate]);
                            }
                            else
                            {
                                if (DetailRow[FField.FieldInDate] != DBNull.Value)
                                    FStorageListInfo.InDate = Convert.ToDateTime(DetailRow[FField.FieldInDate]);
                                FStorageListInfo.SupplyerType = DetailRow[FField.FieldSupplyerType].ToString();
                                FStorageListInfo.SupplyerCode = DetailRow[FField.FieldSupplyerCode].ToString();
                            }
                            break;

                    }
                    UpdateStorageList2(isStorageIn, FStorageListInfo, DetailRow); //��ǰ��洮�ű�

                    #region ������ת���
                    UpdateStorageListFlow(isCheck, FStorageListInfo, DetailRow, MasterRow, ModuleSort, ModuleName);
                    #endregion
                    #endregion
                }
                else
                {
                    #region ��Ʒ��ת��
                    FStorageListInfo.SumMoney = xzSqlAnalysis.getValue(DetailRow[FField.FieldSumMoney]);
                    UpdateStorageProductFlow(isCheck, isStorageIn, FStorageListInfo, DetailRow, MasterRow, ModuleSort, ModuleName);
                    #endregion
                }
            }
        }

        #endregion

        #region ����������ĳɱ�
        /// <summary>
        /// ���³ɴ�����صĵ��ݵĴ�����Ϣ
        /// </summary>
        public void UpdateListInfo(DateTime ReckonTime, DataRow MasterRow, DataRow ListRow, string ModuleSort
            , bool isUpdateInInfo)
        {
            if (isUpdateInInfo)
            {
                #region ���������Ϣ
                #region ���¿�洮�ſ�������Ϣ
                #region ���ż�ʱ����
                FCommand.CommandText = string.Format(@"update tbStorStorageItem set SupplyerType = '{3}', SupplyerCode = '{4}',InDate = '{5}'  
                        where ProductSortCode = '{0}' and ProductCode = '{1}' and ListNo = '{2}'"
                    , ListRow[FField.FieldProductSort], ListRow[FField.FieldProduct], ListRow[FField.FieldListNo]
                    , MasterRow[FField.FieldSupplyerType], MasterRow[FField.FieldSupplyerCode], MasterRow[FField.FieldTheDate]);
                FCommand.ExecuteNonQuery();
                #endregion

                #region ������ת���
                //�⹺��ⵥ,������ⵥ
                FCommand.CommandText = string.Format(@"update tbStorStorageList set CopartnerSort = '{4}', Copartner = '{5}', TheDate = '{6}'  
                          where TheDate>'{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' and  ListNo = '{3}'
                             and HandleSort in ('010','011', '020', '021')"
                    , ReckonTime, ListRow[FField.FieldProductSort], ListRow[FField.FieldProduct], ListRow[FField.FieldListNo]
                    , MasterRow[FField.FieldSupplyerType], MasterRow[FField.FieldSupplyerCode], MasterRow[FField.FieldTheDate]);
                FCommand.ExecuteNonQuery();
                //����������ת��¼
                FCommand.CommandText = string.Format(@"update tbStorStorageList set CopartnerSort = '{4}', Copartner = '{5}'
                          where TheDate>'{0}' and ProductSortCode = '{1}' and ProductCode = '{2}' and  ListNo = '{3}'
                             and HandleSort in ('030','035')"
                 , ReckonTime, ListRow[FField.FieldProductSort], ListRow[FField.FieldProduct], ListRow[FField.FieldListNo]
                 , MasterRow[FField.FieldSupplyerType], MasterRow[FField.FieldSupplyerCode]);
                FCommand.ExecuteNonQuery();
                #endregion
                #endregion

                #region ���¿�洮�ŵ����ƾ֤����Ϣ
                string sql = "";
                //�̵㵥
                sql = @"update tbStorCheckItemDetail set SupplyerType = '{2}', SupplyerCode = '{3}',InDate = '{4}'
                        from tbStorCheckItemDetail a
                        Left Outer Join tbStorCheck b on a.BillNo = b.BillNo
                        where b.theDate> '{0}' and ListNo = '{1}' ";
                FCommand.CommandText = string.Format(sql, ReckonTime, ListRow[FField.FieldListNo], MasterRow[FField.FieldSupplyerType]
                    , MasterRow[FField.FieldSupplyerCode], MasterRow[FField.FieldTheDate]);
                FCommand.ExecuteNonQuery();

                //ά�޼ĳ�
                sql = @"update tbStorMaintainPostSelfItem set SupplyerType = '{2}', SupplyerCode = '{3}',InDate = '{4}'
                        from tbStorMaintainPostSelfItem a
                        Left Outer Join tbStorMaintainPostSelf b on a.BillNo = b.BillNo
                        where b.theDate> '{0}' and ListNo = '{1}' ";
                FCommand.CommandText = string.Format(sql, ReckonTime, ListRow[FField.FieldListNo], MasterRow[FField.FieldSupplyerType]
                    , MasterRow[FField.FieldSupplyerCode], MasterRow[FField.FieldTheDate]);
                FCommand.ExecuteNonQuery();

                //������
                sql = @"update tbStorRedeployItemDetail set SupplyerType = '{2}', SupplyerCode = '{3}',InDate = '{4}'
                        from tbStorRedeployItemDetail a
                        Left Outer Join tbStorRedeploy b on a.BillNo = b.BillNo
                        where b.theDate> '{0}' and ListNo = '{1}' ";
                FCommand.CommandText = string.Format(sql, ReckonTime, ListRow[FField.FieldListNo], MasterRow[FField.FieldSupplyerType]
                    , MasterRow[FField.FieldSupplyerCode], MasterRow[FField.FieldTheDate]);
                FCommand.ExecuteNonQuery();

                //���۳��ⵥ
                sql = @"update tbSaleOutItemDetail set SupplyerType = '{2}', SupplyerCode = '{3}',InDate = '{4}'
                        from tbSaleOutItemDetail a
                        Left Outer Join tbSaleOut b on a.BillNo = b.BillNo
                        where b.theDate> '{0}' and  ListNo = '{1}' ";
                FCommand.CommandText = string.Format(sql, ReckonTime, ListRow[FField.FieldListNo], MasterRow[FField.FieldSupplyerType]
                    , MasterRow[FField.FieldSupplyerCode], MasterRow[FField.FieldTheDate]);
                FCommand.ExecuteNonQuery();

                //�������ⵥ
                sql = @"update tbStorOtherOutItemDetail set SupplyerType = '{2}', SupplyerCode = '{3}',InDate = '{4}'
                        from tbStorOtherOutItemDetail a
                        Left Outer Join tbStorOtherOut b on a.BillNo = b.BillNo
                        where b.theDate> '{0}' and ListNo = '{1}' ";
                FCommand.CommandText = string.Format(sql, ReckonTime, ListRow[FField.FieldListNo], MasterRow[FField.FieldSupplyerType]
                    , MasterRow[FField.FieldSupplyerCode], MasterRow[FField.FieldTheDate]);
                FCommand.ExecuteNonQuery();

                //���ۿ���
                sql = @"update tbSelfSaleOutItem set SupplyerType = '{2}', SupplyerCode = '{3}',InDate = '{4}'
                        from tbSelfSaleOutItem a
                        Left Outer Join tbSelfSaleOut b on a.BillNo = b.BillNo
                        where b.theDate> '{0}' and ListNo = '{1}' ";
                FCommand.CommandText = string.Format(sql, ReckonTime, ListRow[FField.FieldListNo], MasterRow[FField.FieldSupplyerType]
                    , MasterRow[FField.FieldSupplyerCode], MasterRow[FField.FieldTheDate]);
                FCommand.ExecuteNonQuery();
                #endregion
                #endregion
            }

            #region ������ת��ɱ�
            string OtherStrSql = "";
            switch (ModuleSort)
            {
                case _StockIn:
                case _StockInRed:
                case _OtherIn:
                case _OtherInRed:
                case _MaintainPostSelf:
                case _MaintainPostSelfRed:
                    OtherStrSql = string.Format(", CopartnerSort = '{0}' , Copartner = '{1}'"
                        , MasterRow[FField.FieldSupplyerType], MasterRow[FField.FieldSupplyerCode]);
                    break;
                case _SaleOut:
                case _SaleOutRed:
                case _OtherOut:
                case _OtherOutRed:
                case _SelfSaleOut:
                case _SelfSaleOutRed:
                    OtherStrSql = string.Format(", CopartnerSort = '{0}' , Copartner = '{1}'"
                        , MasterRow[FField.FieldClientType], MasterRow[FField.FieldClientCode]);
                    break;
                default:
                    break;
            }

            FCommand.CommandText = string.Format(@"update tbStorStorageList set SumMoney = {6} * Number , TheDate='{0}' {7} 
                          where ProductSortCode = '{1}' and ProductCode = '{2}' and BillNo = '{3}' and ListNo = '{4}'
                                and HandleSort = '{5}'"
                , MasterRow[FField.FieldTheDate], ListRow[FField.FieldProductSort], ListRow[FField.FieldProduct]
                , ListRow[FField.FieldBillNo], ListRow[FField.FieldListNo], ModuleSort
                , xzSqlAnalysis.getValue(ListRow[FField.FieldInCostPrice]), OtherStrSql);
            FCommand.ExecuteNonQuery();

//            switch (ModuleSort)
//            {
//                case _Redeploy:
//                    FCommand.CommandText = string.Format(@"update tbStorStorageList set SumMoney = {6} * Number , TheDate='{0}'
//                          where ProductSortCode = '{1}' and ProductCode = '{2}' and BillNo = '{3}' and ListNo = '{4}'
//                                and HandleSort = '{5}'"
//                        , MasterRow[FField.FieldTheDate], ListRow[FField.FieldProductSort], ListRow[FField.FieldProduct]
//                        , ListRow[FField.FieldBillNo], ListRow[FField.FieldListNo], ModuleSort
//                        , xzSqlAnalysis.getValue(ListRow[FField.FieldInCostPrice]));
//                    FCommand.ExecuteNonQuery();
//                    break;
//                default:

//                    break;
//            }
            #endregion
        }

        /// <summary>
        /// ���³���Ʒ��ص���Ʒ��ת��Ϣ
        /// </summary>
        public void UpdateProductInfo(DateTime ReckonTime, DataRow MasterRow, DataRow DetailRow, string ModuleSort
            , bool isUpdateInInfo)
        {
            if (isUpdateInInfo)
            {
                #region ���������Ϣ
                FCommand.CommandText = string.Format(@"update tbStorStorageProduct set CopartnerSort = '{3}', Copartner = '{4}', TheDate = '{5}'  
                          where TheDate>'{0}' and ProductSortCode = '{1}' and ProductCode = '{2}'
                             and HandleSort in ('010','011', '020', '021')"
                    , ReckonTime, DetailRow[FField.FieldProductSort], DetailRow[FField.FieldProduct]
                    , MasterRow[FField.FieldSupplyerType], MasterRow[FField.FieldSupplyerCode], MasterRow[FField.FieldTheDate]);
                FCommand.ExecuteNonQuery();
                #endregion
            }

            #region ������ת��ɱ�
            FCommand.CommandText = string.Format(@"update tbStorStorageProduct set SumMoney = {6}, TheDate='{0}'
                          where  ProductSortCode = '{1}' and ProductCode = '{2}' and BillNo = '{3}' and RowNo = '{4}'
                                   and HandleSort = '{5}'"
                , MasterRow[FField.FieldTheDate], DetailRow[FField.FieldProductSort], DetailRow[FField.FieldProduct]
                , DetailRow[FField.FieldBillNo], DetailRow[FField.FieldRowNo], ModuleSort
                , xzSqlAnalysis.getValue(DetailRow[FField.FieldSumMoney]));
            FCommand.ExecuteNonQuery();

//            switch (ModuleSort)
//            {
//                case _Redeploy:
//                    FCommand.CommandText = string.Format(@"update tbStorStorageProduct set SumMoney = {6}, TheDate='{0}'
//                          where  ProductSortCode = '{1}' and ProductCode = '{2}' and BillNo = '{3}' and RowNo = '{4}'
//                                   and HandleSort = '{5}'"
//                        , MasterRow[FField.FieldTheDate], DetailRow[FField.FieldProductSort], DetailRow[FField.FieldProduct]
//                        , DetailRow[FField.FieldBillNo], DetailRow[FField.FieldRowNo], ModuleSort
//                        , xzSqlAnalysis.getValue(DetailRow[FField.FieldSumMoney]));

//                    FCommand.ExecuteNonQuery();
//                    break;
//                default:

//                    break;
//            }
            #endregion
        }
        #endregion
    }

    /// <summary>
    /// ԭʼƾ֤����
    /// </summary>
    public class HYVoucherManager
    {
        private SqlCommand FCommand = null;
        [Description("����"), Category("Xzz")]
        public SqlCommand Command
        {
            get
            {
                return FCommand;
            }
            set
            {
                if (FCommand != value)
                {
                    FCommand = value;
                }
            }
        }

        private HYField FField = new HYField();
        [Description("Ĭ�ϵ��ֶ�����"), Category("Xzz")]
        public HYField Field
        {
            get
            {
                return FField;
            }
        }

        #region �ɹ�֪ͨ��
        public bool isUpdateStockOrder(bool isAdd, DataRow DetailRow)
        {
            if (DetailRow[FField.FieldSrcBillNo].ToString() != "")
            {
                FCommand.CommandText = string.Format(@"select UseState from tbStockOrder where BillNo = '{0}' 
                    and dbo.GetByteToBoolean(theState,0x0001)=1", DetailRow[FField.FieldSrcBillNo]);
                object value = FCommand.ExecuteScalar();
                if (value == null)
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]�����ڣ�����ԭ��δȷ�ϣ�", DetailRow[FField.FieldSrcBillNo]));
                    return false;
                }

                if (BitTermMath.GetBitTrue((int)value, BitTermMath.TermSix))
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]������������ǰ��������ִ�У�", DetailRow[FField.FieldSrcBillNo]));
                    return false;
                }

                decimal Number = xzSqlAnalysis.getAbsValue(DetailRow[FField.FieldNumber]);
                if (!isAdd) Number = -Number;
                string sql = @"select InStoreNumber from tbStockOrderItem where BillNo = '{0}'  and ProductSortCode='{1}' and ProductCode = '{2}'";
                FCommand.CommandText = string.Format(sql, DetailRow[FField.FieldSrcBillNo], DetailRow[FField.FieldProductSort]
                    , DetailRow[FField.FieldProduct]);
                value = FCommand.ExecuteScalar();
                if (value == null || (xzSqlAnalysis.getAbsValue(value) + Number) < 0)
                {
                    xzException.WarnBox(HYStorageMessage._MsgSourceBillIsEnough);
                    return false;
                }
            }
            return true;
        }

        public void UpdateStockOrder(bool isAdd, DataTable DetailTable)
        {
            int isUse = 1;
            if (!isAdd) isUse = -1;
            foreach (DataRow row in DetailTable.Rows)
            {
                //��ԭ���ĳ������ݴ�����ɵ�����
                if (row[FField.FieldSrcBillNo].ToString() != "")
                {
                    decimal Number = xzSqlAnalysis.getValue(row[FField.FieldNumber]);
                    if (!isAdd) Number = -Number;
                    string sql = @"Update tbStockOrderItem set InStoreNumber = InStoreNumber + {0} where BillNo = '{1} '
                                       and ProductSortCode='{2}' and ProductCode = '{3}'";
                    FCommand.CommandText = string.Format(sql, Number, row[FField.FieldSrcBillNo], row[FField.FieldProductSort], row[FField.FieldProduct]);
                    FCommand.ExecuteNonQuery();
                }

                //��ԭ�����ϼ���ʹ�õı�־
                if (row[FField.FieldSrcBillNo].ToString() != "")
                {
                    string sql = "Update tbStockOrder set isUse = isUse + {0} where BillNo = '{1}'";
                    FCommand.CommandText = string.Format(sql, isUse, row[FField.FieldSrcBillNo]);
                    FCommand.ExecuteNonQuery();
                }
            }
        }
        #endregion

        #region �˻�֪ͨ��
        public bool isUpdateStockReturnNotice(bool isAdd, DataRow DetailRow)
        {
            if (DetailRow[FField.FieldSrcBillNo].ToString() != "")
            {
                decimal Number = xzSqlAnalysis.getValue(DetailRow[FField.FieldNumber]);
                if (!isAdd) Number = -Number;
                string sql = @"select InStoreNumber from tbStockReturnNoticeItem where BillNo = '{0}' 
                                     and ProductSortCode='{1}' and ProductCode = '{2}'";
                FCommand.CommandText = string.Format(sql, DetailRow[FField.FieldSrcBillNo], DetailRow[FField.FieldProductSort]
                    , DetailRow[FField.FieldProduct]);
                object value = FCommand.ExecuteScalar();
                if (value == null && (xzSqlAnalysis.getValue(value) + Number) < 0)
                    return false;
            }
            return true;
        }

        public void UpdateStockReturnNotice(bool isAdd, DataTable DetailRow)
        {
            int isUse = 1;
            if (!isAdd) isUse = -1;
            foreach (DataRow row in DetailRow.Rows)
            {
                //��ԭ���ĳ������ݴ�����ɵ�����
                if (row[FField.FieldSrcBillNo].ToString() != "")
                {
                    decimal Number = xzSqlAnalysis.getValue(row[FField.FieldNumber]);
                    if (!isAdd) Number = -Number;
                    string sql = @"Update tbStockReturnNoticeItem set InStoreNumber = InStoreNumber + {0} where BillNo = '{1}'
                                       and ProductSortCode='{2}' and ProductCode = '{3}'";
                    FCommand.CommandText = string.Format(sql, Number, row[FField.FieldSrcBillNo], row[FField.FieldProductSort]
                        , row[FField.FieldProduct]);
                    FCommand.ExecuteNonQuery();
                }

                //��ԭ�����ϼ���ʹ�õı�־
                if (row[FField.FieldSrcBillNo].ToString() != "")
                {
                    string sql = "Update tbStockReturnNotice set isUse = isUse + {0} where BillNo = '{1}'";
                    FCommand.CommandText = string.Format(sql, isUse, row[FField.FieldSrcBillNo]);
                    FCommand.ExecuteNonQuery();
                }
            }
        }
        #endregion

        #region �ŵ궩����

        public DataRow getUpdateSelfOrderInfo(DataRow DetailRow)
        {
            if (DetailRow[FField.FieldSrcBillNo].ToString() != "")
            {
                DataTable Table = new DataTable();
                using (SqlDataAdapter sqlda = new SqlDataAdapter())
                {
                    FCommand.CommandText = string.Format("select ShopCode,ShopSort from tbSelfOrder where BillNo = '{0}'", DetailRow["SrcBillNo"]);
                    sqlda.SelectCommand = FCommand;
                    sqlda.Fill(Table);
                    if (Table.Rows.Count > 0) return Table.Rows[0];
                }
                
            }
            return null;
        }

        public bool isUpdateSelfOrder(bool isAdd, DataRow DetailRow)
        {
            if (DetailRow[FField.FieldSrcBillNo].ToString() != "")
            {
                FCommand.CommandText = string.Format(@"select UseState from tbSelfOrder where BillNo = '{0}' 
                    and dbo.GetByteToBoolean(theState,0x0001)=1", DetailRow[FField.FieldSrcBillNo]);
                object value = FCommand.ExecuteScalar();
                if (value == null)
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]�����ڣ�����ԭ��δȷ�ϣ�", DetailRow[FField.FieldSrcBillNo]));
                    return false;
                }

                if (BitTermMath.GetBitTrue((int)value, BitTermMath.TermSix))
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]������������ǰ��������ִ�У�", DetailRow[FField.FieldSrcBillNo]));
                    return false;
                }

                decimal Number = xzSqlAnalysis.getAbsValue(DetailRow[FField.FieldNumber]);
                if (!isAdd) Number = -Number;
                string sql = @"select OutStoreNumber from tbSelfOrderItem where BillNo = '{0}' 
                                     and ProductSortCode='{1}' and ProductCode = '{2}'";
                FCommand.CommandText = string.Format(sql, DetailRow[FField.FieldSrcBillNo], DetailRow[FField.FieldProductSort]
                    , DetailRow[FField.FieldProduct]);
                value = FCommand.ExecuteScalar();
                if (value == null || (xzSqlAnalysis.getAbsValue(value) + Number) < 0)
                {
                    xzException.WarnBox(HYStorageMessage._MsgSourceBillIsEnough);
                    return false;
                }
            }
            return true;
        }

        public void UpdateSelfOrder(bool isAdd, DataRow DetailRow)
        {
            int isUse = 1;
            if (!isAdd) isUse = -1;
            //��ԭ���ĳ������ݴ�����ɵ�����
            if (DetailRow[FField.FieldSrcBillNo].ToString() != "")
            {
                decimal Number = xzSqlAnalysis.getValue(DetailRow[FField.FieldNumber]);
                if (!isAdd) Number = -Number;
                string sql = @"Update tbSelfOrderItem set OutStoreNumber = OutStoreNumber + {0} where BillNo = '{1}'
                                       and ProductSortCode='{2}' and ProductCode = '{3}'";
                FCommand.CommandText = string.Format(sql, Number, DetailRow[FField.FieldSrcBillNo], DetailRow[FField.FieldProductSort]
                    , DetailRow[FField.FieldProduct]);
                FCommand.ExecuteNonQuery();
            }

            //��ԭ�����ϼ���ʹ�õı�־
            if (DetailRow[FField.FieldSrcBillNo].ToString() != "")
            {
                string sql = "Update tbSelfOrder set isUse = isUse + {0} where BillNo = '{1}'";
                FCommand.CommandText = string.Format(sql, isUse, DetailRow[FField.FieldSrcBillNo]);
                FCommand.ExecuteNonQuery();
            }
        }
        #endregion

        #region ���۶���
        public bool isUpdateSaleOrder(bool isAdd, DataRow DetailRow)
        {
            if (DetailRow[FField.FieldSrcBillNo].ToString() != "")
            {
                FCommand.CommandText = string.Format(@"select UseState from tbSaleOrder where BillNo = '{0}' 
                    and dbo.GetByteToBoolean(theState,0x0001)=1"
                    , DetailRow[FField.FieldSrcBillNo]);
                object value = FCommand.ExecuteScalar();
                if (value == null)
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]�����ڣ�����ԭ��δȷ�ϣ�", DetailRow[FField.FieldSrcBillNo]));
                    return false;
                }

                if (BitTermMath.GetBitTrue((int)value, BitTermMath.TermSix))
                {
                    xzException.WarnBox(string.Format("Դ����:[{0}]������������ǰ��������ִ�У�", DetailRow[FField.FieldSrcBillNo]));
                    return false;
                }

                decimal Number = xzSqlAnalysis.getAbsValue(DetailRow[FField.FieldNumber]);
                if (!isAdd) Number = -Number;
                string sql = @"select OutStoreNumber from tbSaleOrderItem where BillNo = '{0}'  and ProductSortCode='{1}' and ProductCode = '{2}'";
                FCommand.CommandText = string.Format(sql, DetailRow[FField.FieldSrcBillNo], DetailRow[FField.FieldProductSort]
                    , DetailRow[FField.FieldProduct]);
                value = FCommand.ExecuteScalar();
                if (value == null && (xzSqlAnalysis.getValue(value) + Number) < 0)
                {
                    xzException.WarnBox(HYStorageMessage._MsgSourceBillIsEnough);
                    return false;
                }
            }
            return true;
        }

        public void UpdateSaleOrder(bool isAdd, DataTable DetailTable)
        {
            int isUse = 1;
            if (!isAdd) isUse = -1;
            foreach (DataRow row in DetailTable.Rows)
            {
                //��ԭ���ĳ������ݴ�����ɵ�����
                if (row[FField.FieldSrcBillNo].ToString() != "")
                {
                    decimal Number = xzSqlAnalysis.getAbsValue(row[FField.FieldNumber]);
                    if (!isAdd) Number = -Number;
                    string sql = @"Update tbSaleOrderItem set OutStoreNumber = OutStoreNumber + {0} where BillNo = '{1} '
                                       and ProductSortCode='{2}' and ProductCode = '{3}'";
                    FCommand.CommandText = string.Format(sql, Number, row[FField.FieldSrcBillNo], row[FField.FieldProductSort], row[FField.FieldProduct]);
                    FCommand.ExecuteNonQuery();
                }

                //��ԭ�����ϼ���ʹ�õı�־
                if (row[FField.FieldSrcBillNo].ToString() != "")
                {
                    string sql = "Update tbSaleOrder set isUse = isUse + {0} where BillNo = '{1}'";
                    FCommand.CommandText = string.Format(sql, isUse, row[FField.FieldSrcBillNo]);
                    FCommand.ExecuteNonQuery();
                }
            }
        }
        #endregion

        #region ���۷�Ʊ
        public bool isUpdateSaleInvoice(bool isAdd, DataRow DetailRow)
        {
            if (DetailRow[FField.FieldSrcBillNo].ToString() != "")
            {
                decimal Number = xzSqlAnalysis.getValue(DetailRow[FField.FieldNumber]);
                if (!isAdd) Number = -Number;
                string sql = @"select OutStoreNumber from tbSaleInvoiceItem where BillNo = '{0}'  and ProductSortCode='{1}' and ProductCode = '{2}'";
                FCommand.CommandText = string.Format(sql, DetailRow[FField.FieldSrcBillNo], DetailRow[FField.FieldProductSort]
                    , DetailRow[FField.FieldProduct]);
                object value = FCommand.ExecuteScalar();
                if (value == null && (xzSqlAnalysis.getValue(value) + Number) < 0)
                    return false;
            }
            return true;
        }

        public void UpdateSaleInvoice(bool isAdd, DataTable DetailTable)
        {
            int isUse = 1;
            if (!isAdd) isUse = -1;
            foreach (DataRow row in DetailTable.Rows)
            {
                //��ԭ���ĳ������ݴ�����ɵ�����
                if (row[FField.FieldSrcBillNo].ToString() != "")
                {
                    decimal Number = xzSqlAnalysis.getValue(row[FField.FieldNumber]);
                    if (!isAdd) Number = -Number;
                    string sql = @"Update tbSaleInvoiceItem set OutStoreNumber = OutStoreNumber + {0} where BillNo = '{1} '
                                       and ProductSortCode='{2}' and ProductCode = '{3}'";
                    FCommand.CommandText = string.Format(sql, Number, row[FField.FieldSrcBillNo]
                        , row[FField.FieldProductSort], row[FField.FieldProduct]);
                    FCommand.ExecuteNonQuery();
                }

                //��ԭ�����ϼ���ʹ�õı�־
                if (row[FField.FieldSrcBillNo].ToString() != "")
                {
                    string sql = "Update tbSaleInvoice set isUse = isUse + {0} where BillNo = '{1}'";
                    FCommand.CommandText = string.Format(sql, isUse, row[FField.FieldSrcBillNo]);
                    FCommand.ExecuteNonQuery();
                }
            }
        }
        #endregion

        #region �黹ת����
        public bool isUpdateProductReturn(bool isAdd, DataRow DetailRow)
        {
            if (DetailRow[FField.FieldSrcBillNo].ToString() != "")
            {
                decimal Number = xzSqlAnalysis.getValue(DetailRow[FField.FieldNumber]);
                if (!isAdd) Number = -Number;
                string sql = @"select OutStoreNumber from tbStorOtherOutItem where BillNo = '{0}'  and ProductSortCode='{1}' and ProductCode = '{2}'";
                FCommand.CommandText = string.Format(sql, DetailRow[FField.FieldSrcBillNo], DetailRow[FField.FieldProductSort]
                    , DetailRow[FField.FieldProduct]);
                object value = FCommand.ExecuteScalar();
                if (value == null && (xzSqlAnalysis.getValue(value) + Number) < 0)
                    return false;
            }
            return true;
        }

        public void UpdateProductReturn(bool isAdd, DataTable DetailTable)
        {
            int isUse = 1;
            if (!isAdd) isUse = -1;
            foreach (DataRow row in DetailTable.Rows)
            {
                //��ԭ���ĳ������ݴ�����ɵ�����
                if (row[FField.FieldSrcBillNo].ToString() != "")
                {
                    decimal Number = xzSqlAnalysis.getValue(row[FField.FieldNumber]);
                    if (!isAdd) Number = -Number;
                    string sql = @"Update tbStorOtherOutItem set OutStoreNumber = OutStoreNumber + {0} where BillNo = '{1} '
                                       and ProductSortCode='{2}' and ProductCode = '{3}'";
                    FCommand.CommandText = string.Format(sql, Number, row[FField.FieldSrcBillNo], row[FField.FieldProductSort]
                        , row[FField.FieldProduct]);
                    FCommand.ExecuteNonQuery();
                }

                //��ԭ�����ϼ���ʹ�õı�־
                if (row[FField.FieldSrcBillNo].ToString() != "")
                {
                    string sql = "Update tbStorOtherOut set isUse = isUse + {0} where BillNo = '{1}'";
                    FCommand.CommandText = string.Format(sql, isUse, row[FField.FieldSrcBillNo]);
                    FCommand.ExecuteNonQuery();
                }
            }
        }
        #endregion
    }

    /// <summary>
    /// ������������
    /// </summary>
    public class HYVerificationManager
    {
        private SqlCommand FCommand = null;
        [Description("����"), Category("Xzz")]
        public SqlCommand Command
        {
            get
            {
                return FCommand;
            }
            set
            {
                if (FCommand != value)
                {
                    FCommand = value;
                }
            }
        }

        public const string _SaleInvoiceBlue = "000A";    //���۷�Ʊ����
        public const string _SaleInvoiceBlueName = "���۷�Ʊ[����]";
        public const string _SaleInvoiceRubric = "000B";  //���۷�Ʊ�쵥
        public const string _SaleInvoiceRubricName = "���۷�Ʊ[�쵥]";

        public const string _SaleInvoice = "001A";        //���۷�Ʊ����
        public const string _SaleInvoiceName = "���۷�Ʊ";
        public const string _SaleOut = "001B";            //���۷�Ʊ�쵥
        public const string _SaleOutName = "���۳���";

        public const string _SaleOutBlue = "002A";    //���۳�������
        public const string _SaleOutBlueName = "���۳���[����]";
        public const string _SaleOutRubric = "002B";  //���۳���쵥
        public const string _SaleOutRubricName = "���۳���[�쵥]";

        private HYField FField = new HYField();
        [Description("Ĭ�ϵ��ֶ�"), Category("Xzz")]
        public HYField Field
        {
            get
            {
                return FField;
            }
        }

        public decimal getVerifyLogNo(string VerifySort)
        {
            FCommand.CommandText = string.Format("select isnull(max(VerifyNo),0) from tbSaleInvoiceVerifyLog where VerifySort='{0}'", VerifySort);
            return xzSqlAnalysis.getValue(FCommand.ExecuteScalar()) + 1;
        }

        public void InsertVerifyLog(DataRow row, string VerifySort,string VerifyName, decimal VerifyNo, decimal Amount, string InvoiceDate,decimal SaleMoney,int isverify)
        {
            string StrSql = @"Insert into tbSaleInvoiceVerifyLog (VerifySort, VerifyNo, VerifyName, BillNo, RowNo, ProductSortCode, ProductCode, Number, VerifyTime,InvoiceDate,SaleMoney,isVerify)
                   values ('{0}', {1}, '{2}','{3}', {4}, '{5}', '{6}', {7}, getdate(),'{8}',{9},{10})";
            FCommand.CommandText = string.Format(StrSql, VerifySort, VerifyNo, VerifyName, row[FField.FieldBillNo], row[FField.FieldRowNo],
                row[FField.FieldProductSort], row[FField.FieldProduct], Amount, InvoiceDate, SaleMoney, isverify);
            FCommand.ExecuteNonQuery();
        }

        public void DeleteVerifyLog(DataRow row, string VerifySort, decimal VerifyNo)
        {
            string StrSql = @"Delete tbSaleInvoiceVerifyLog  where VerifySort = '{0}' and VerifyNo = {1} and  BillNo = '{2}' and RowNo = {3}";
            FCommand.CommandText = string.Format(StrSql, VerifySort, VerifyNo, row[FField.FieldBillNo], row[FField.FieldRowNo]);
            FCommand.ExecuteNonQuery();
        }
    }
    #endregion

    #region �ۼ۹���
    /// <summary>
    /// ��ȡ�ۼ�
    /// </summary>
    public class HYSalePriceManager
    {
        private SqlCommand FCommand = null;
        [Description("����"), Category("Xzz")]
        public SqlCommand Command
        {
            get
            {
                return FCommand;
            }
            set
            {
                if (FCommand != value)
                {
                    FCommand = value;
                }
            }
        }

        private HYField FField = new HYField();
        [Description("Ĭ�ϵ��ֶ�����"), Category("Xzz")]
        public HYField Field
        {
            get
            {
                return FField;
            }
        }

        #region ���ۼ�
        public decimal getSelfSalePrice(object ProductSort, object ProductCode, object ClientType, object ClientCode
            , object AreaCode, object ClientSort, object TheDate)
        {
            decimal Price = 0m;
            //��ȡ�ͻ������ۼ�
            FCommand.CommandText = string.Format(@"select top 1 SelfSalePrice from tbDatumPriceManage 
                  where PriceSort = '004' and ProductSortCode = '{0}' and ProductCode = '{1}' and  TheSort = '{2}' and TheCode = '{3}'
                    and BeginTime<= '{4}' and dbo.GetByteToBoolean(TheState,0x0001)=1"
                , ProductSort, ProductCode, ClientType, ClientCode  , TheDate);
            Price = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
            if (Price != 0m) return Price;

            //��ȡ�������ۼ�
            FCommand.CommandText = string.Format(@"select top 1 SelfSalePrice from tbDatumPriceManage 
                  where PriceSort = '003' and ProductSortCode = '{0}' and ProductCode = '{1}' and  TheSort = '' and TheCode = '{2}'
                    and BeginTime<= '{3}' and dbo.GetByteToBoolean(TheState,0x0001)=1"
                , ProductSort, ProductCode, ClientSort, TheDate);
            Price = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
            if (Price != 0m) return Price;

            //��ȡ��������ۼ�
            FCommand.CommandText = string.Format(@"select top 1 SelfSalePrice from tbDatumPriceManage 
                  where PriceSort = '002' and ProductSortCode = '{0}' and ProductCode = '{1}' and  TheSort = '' and TheCode = '{2}'
                    and BeginTime<= '{3}' and dbo.GetByteToBoolean(TheState,0x0001)=1"
                , ProductSort, ProductCode, AreaCode , TheDate);
            Price = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
            if (Price != 0m) return Price;

            //��ȡͳһ�����ۼ�
            FCommand.CommandText = string.Format(@"select top 1 SelfSalePrice from tbDatumPriceManage 
                  where PriceSort = '001' and ProductSortCode = '{0}' and ProductCode = '{1}'
                    and BeginTime<= '{2}' and dbo.GetByteToBoolean(TheState,0x0001)=1"
                , ProductSort, ProductCode, TheDate);
            Price = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
            if (Price != 0m) return Price;

            return 0m;
        }

        public decimal getSelfSalePrice1(object ProductSort, object ProductCode, object ClientType, object ClientCode
            , object AreaCode, object ClientSort, object TheDate)
        {
            decimal Price = 0m;
            //��ȡ�ͻ������ۼ�
            FCommand.CommandText = string.Format(@"select SelfSalePrice1 from tbDatumPriceManage 
                  where PriceSort = '004' and ProductSortCode = '{0}' and ProductCode = '{1}' and  TheSort = '{2}' and TheCode = '{3}'
                    and BeginTime<= '{4}' and dbo.GetByteToBoolean(TheState,0x0001)=1"
                , ProductSort, ProductCode, ClientType, ClientCode, TheDate);
            Price = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
            if (Price != 0m) return Price;

            //��ȡ�������ۼ�
            FCommand.CommandText = string.Format(@"select SelfSalePrice1 from tbDatumPriceManage 
                  where PriceSort = '003' and ProductSortCode = '{0}' and ProductCode = '{1}' and  TheSort = '' and TheCode = '{2}'
                    and BeginTime<= '{3}' and dbo.GetByteToBoolean(TheState,0x0001)=1"
                , ProductSort, ProductCode, ClientSort, TheDate);
            Price = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
            if (Price != 0m) return Price;

            //��ȡ��������ۼ�
            FCommand.CommandText = string.Format(@"select SelfSalePrice1 from tbDatumPriceManage 
                  where PriceSort = '002' and ProductSortCode = '{0}' and ProductCode = '{1}' and  TheSort = '' and TheCode = '{2}'
                    and BeginTime<= '{3}' and dbo.GetByteToBoolean(TheState,0x0001)=1"
                , ProductSort, ProductCode, AreaCode, TheDate);
            Price = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
            if (Price != 0m) return Price;

            //��ȡͳһ�����ۼ�
            FCommand.CommandText = string.Format(@"select SelfSalePrice1 from tbDatumPriceManage 
                  where PriceSort = '001' and ProductSortCode = '{0}' and ProductCode = '{1}'
                    and BeginTime<= '{2}' and dbo.GetByteToBoolean(TheState,0x0001)=1"
                , ProductSort, ProductCode, TheDate);
            Price = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
            if (Price != 0m) return Price;

            return 0m;
        }
        #endregion

        #region ������
        public decimal getSalePrice(object ProductSort, object ProductCode, object ClientType, object ClientCode
            , object AreaCode, object ClientSort, object TheDate)
        {
            decimal Price = 0m;
            //��ȡ�ͻ������ۼ�
            FCommand.CommandText = string.Format(@"select SalePrice from tbDatumPriceManage 
                  where PriceSort = '004' and ProductSortCode = '{0}' and ProductCode = '{1}' and  TheSort = '{2}' and TheCode = '{3}'
                    and BeginTime<= '{4}' and dbo.GetByteToBoolean(TheState,0x0001)=1"
                , ProductSort, ProductCode, ClientType, ClientCode, TheDate);
            Price = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
            if (Price != 0m) return Price;

            //��ȡ�������ۼ�
            FCommand.CommandText = string.Format(@"select SalePrice from tbDatumPriceManage 
                  where PriceSort = '003' and ProductSortCode = '{0}' and ProductCode = '{1}' and  TheSort = '' and TheCode = '{2}'
                    and BeginTime<= '{3}' and dbo.GetByteToBoolean(TheState,0x0001)=1"
                , ProductSort, ProductCode, ClientSort, TheDate);
            Price = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
            if (Price != 0m) return Price;

            //��ȡ��������ۼ�
            FCommand.CommandText = string.Format(@"select SalePrice from tbDatumPriceManage 
                  where PriceSort = '002' and ProductSortCode = '{0}' and ProductCode = '{1}' and  TheSort = '' and TheCode = '{2}'
                    and BeginTime<= '{3}' and dbo.GetByteToBoolean(TheState,0x0001)=1"
                , ProductSort, ProductCode, AreaCode, TheDate);
            Price = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
            if (Price != 0m) return Price;

            //��ȡͳһ�����ۼ�
            FCommand.CommandText = string.Format(@"select SalePrice from tbDatumPriceManage 
                  where PriceSort = '001' and ProductSortCode = '{0}' and ProductCode = '{1}'
                    and BeginTime<= '{2}' and dbo.GetByteToBoolean(TheState,0x0001)=1"
                , ProductSort, ProductCode, TheDate);
            Price = xzSqlAnalysis.getValue(FCommand.ExecuteScalar());
            if (Price != 0m) return Price;

            return 0m;
        }
        #endregion

        #region �۸����
        public Hashtable getPriceParam()
        {
            FCommand.CommandText = string.Format(@"select SystemOther from tsSystem where TheCode = '{0}'", SystemGuble._PlacelNo);
            object objsender = FCommand.ExecuteScalar();
            if (objsender != null && objsender != DBNull.Value)
                return xzStreamStorage.getHasTable(objsender as byte[]);
            else return null;
        }
        #endregion
    }

    #endregion

    #region ��Ա����

    /// <summary>
    /// ��ȡ���ַ���
    /// </summary>
    //public class HYTotalExpenditure
    //{
    //    private SqlConnection FConnect = null;
    //    public SqlConnection Connect
    //    {
    //        get
    //        {
    //            return FConnect;
    //        }
    //        set
    //        {
    //            if (FConnect != value) FConnect = value;
    //        }
    //    }

    //    //����ʹ�õĻ���
    //    private int getValue(string VipCode, Hashtable FParamhash, decimal Amount)
    //    {
    //        xzTotalExpenditure FTotalExpenditure = null;
    //        if (FParamhash.ContainsKey(VipCode)) //VIP
    //        {
    //            FTotalExpenditure = FParamhash[VipCode] as xzTotalExpenditure;
    //            int m = FTotalExpenditure.RationList.Count;
    //            if (m > 0)
    //            {
    //                for (int i = 0; i < m; i++)
    //                {
    //                    decimal f_Ration = (decimal)(FTotalExpenditure.RationList[i]);
    //                    if (Amount < f_Ration && i > 0)
    //                    {
    //                        decimal FRation = (decimal)(FTotalExpenditure.RationList[i - 1]);
    //                        FRation = (decimal)(FTotalExpenditure.RationHash[f_Ration]);
    //                        switch (FTotalExpenditure.ExpenditureMode)
    //                        {
    //                            case xzTotalExpenditureMode.RationNum:
    //                                return Convert.ToInt32(Decimal.Round(FRation, MidpointRounding.AwayFromZero));
    //                            case xzTotalExpenditureMode.MultiplicativeRate:
    //                                return Convert.ToInt32(Decimal.Round(Amount * FRation, MidpointRounding.AwayFromZero));
    //                            case xzTotalExpenditureMode.DivisionRate:
    //                                return Convert.ToInt32(Decimal.Round(Amount / FRation, MidpointRounding.AwayFromZero));
    //                        }
    //                    }
    //                }

    //                decimal FRation1 = (decimal)(FTotalExpenditure.RationList[m - 1]);
    //                FRation1 = (decimal)(FTotalExpenditure.RationHash[FTotalExpenditure.RationList[m - 1]]);
    //                switch (FTotalExpenditure.ExpenditureMode)
    //                {
    //                    case xzTotalExpenditureMode.RationNum:
    //                        return Convert.ToInt32(Decimal.Round(FRation1, MidpointRounding.AwayFromZero));
    //                    case xzTotalExpenditureMode.MultiplicativeRate:
    //                        return Convert.ToInt32(Decimal.Round(Amount * FRation1, MidpointRounding.AwayFromZero));
    //                    case xzTotalExpenditureMode.DivisionRate:
    //                        return Convert.ToInt32(Decimal.Round(Amount / FRation1, MidpointRounding.AwayFromZero));
    //                }
    //            }
    //        }

    //        if (FParamhash.ContainsKey(""))  //��������
    //        {
    //            FTotalExpenditure = FParamhash[""] as xzTotalExpenditure;
    //            int m = FTotalExpenditure.RationList.Count;
    //            if (m > 0)
    //            {
    //                for (int i = 0; i < m; i++)
    //                {
    //                    decimal f_Ration = (decimal)(FTotalExpenditure.RationList[i]);
    //                    if (Amount < f_Ration && i > 0)
    //                    {
    //                        decimal FRation = (decimal)(FTotalExpenditure.RationList[i - 1]);
    //                        FRation = (decimal)(FTotalExpenditure.RationHash[f_Ration]);
    //                        switch (FTotalExpenditure.ExpenditureMode)
    //                        {
    //                            case xzTotalExpenditureMode.RationNum:
    //                                return Convert.ToInt32(Decimal.Round(FRation, MidpointRounding.AwayFromZero));
    //                            case xzTotalExpenditureMode.MultiplicativeRate:
    //                                return Convert.ToInt32(Decimal.Round(Amount * FRation, MidpointRounding.AwayFromZero));
    //                            case xzTotalExpenditureMode.DivisionRate:
    //                                return Convert.ToInt32(Decimal.Round(Amount / FRation, MidpointRounding.AwayFromZero));
    //                        }
    //                    }
    //                }

    //                decimal FRation2 = (decimal)(FTotalExpenditure.RationList[m - 1]);
    //                FRation2 = (decimal)(FTotalExpenditure.RationHash[FTotalExpenditure.RationList[m - 1]]);
    //                switch (FTotalExpenditure.ExpenditureMode)
    //                {
    //                    case xzTotalExpenditureMode.RationNum:
    //                        return Convert.ToInt32(Decimal.Round(FRation2, MidpointRounding.AwayFromZero));
    //                    case xzTotalExpenditureMode.MultiplicativeRate:
    //                        return Convert.ToInt32(Decimal.Round(Amount * FRation2, MidpointRounding.AwayFromZero));
    //                    case xzTotalExpenditureMode.DivisionRate:
    //                        return Convert.ToInt32(Decimal.Round(Amount / FRation2, MidpointRounding.AwayFromZero));
    //                }
    //            }
    //        }
    //        return 0;
    //    }

    //    //��ȡʹ�õĻ��ֶ���
    //    public int getTotalExpenditure(string VipCode, string ProductCode, int TheSort, decimal Amount)
    //    {
    //        Hashtable FParamhash = null;
    //        switch (TheSort)
    //        {
    //            case 0:
    //                //Connect.Open();
    //                try
    //                {
    //                    string s_Sql = string.Format("select Expenditure from tbDatumProductInfo where TheCode='{0}'", ProductCode);
    //                    SqlCommand cmd = new SqlCommand(s_Sql, Connect);
    //                    object objStream = cmd.ExecuteScalar();
    //                    if (objStream != null && objStream != DBNull.Value)
    //                    {
    //                        FParamhash = xzStreamStorage.getHasTable(objStream as byte[]);
    //                        return getValue(VipCode, FParamhash, Amount);
    //                    }

    //                    cmd.CommandText = "select Expenditure from tbDatumProductSort where TheCode='001'";
    //                    objStream = cmd.ExecuteScalar();
    //                    if (objStream != null && objStream != DBNull.Value)
    //                    {
    //                        FParamhash = xzStreamStorage.getHasTable(objStream as byte[]);
    //                        return getValue(VipCode, FParamhash, Amount);
    //                    }
    //                }
    //                finally
    //                {
    //                    //Connect.Close();
    //                }
    //                break;
    //            case 1:
    //                //Connect.Open();
    //                try
    //                {
    //                    string s_Sql = string.Format("select Expenditure from tbDatumFitting where TheCode='{0}'", ProductCode);
    //                    SqlCommand cmd = new SqlCommand(s_Sql, Connect);
    //                    object objStream = cmd.ExecuteScalar();
    //                    if (objStream != null && objStream != DBNull.Value)
    //                    {
    //                        FParamhash = xzStreamStorage.getHasTable(objStream as byte[]);
    //                        return getValue(VipCode, FParamhash, Amount);
    //                    }

    //                    cmd.CommandText = "select Expenditure from tbDatumProductSort where TheCode='002'";
    //                    objStream = cmd.ExecuteScalar();
    //                    if (objStream != null && objStream != DBNull.Value)
    //                    {
    //                        FParamhash = xzStreamStorage.getHasTable(objStream as byte[]);
    //                        return getValue(VipCode, FParamhash, Amount);
    //                    }
    //                }
    //                finally
    //                {
    //                    //Connect.Close();
    //                }
    //                break;
    //            case 2:
    //                //Connect.Open();
    //                try
    //                {
    //                    string s_Sql = string.Format("select Expenditure from tbDatumPhoneCard where TheCode='{0}'", ProductCode);
    //                    SqlCommand cmd = new SqlCommand(s_Sql, Connect);
    //                    object objStream = cmd.ExecuteScalar();
    //                    if (objStream != null && objStream != DBNull.Value)
    //                    {
    //                        FParamhash = xzStreamStorage.getHasTable(objStream as byte[]);
    //                        return getValue(VipCode, FParamhash, Amount);
    //                    }

    //                    cmd.CommandText = "select Expenditure from tbDatumProductSort where TheCode='003'";
    //                    objStream = cmd.ExecuteScalar();
    //                    if (objStream != null && objStream != DBNull.Value)
    //                    {
    //                        FParamhash = xzStreamStorage.getHasTable(objStream as byte[]);
    //                        return getValue(VipCode, FParamhash, Amount);
    //                    }
    //                }
    //                finally
    //                {
    //                    //Connect.Close();
    //                }
    //                break;
    //            case 3:
    //                //Connect.Open();
    //                try
    //                {
    //                    string s_Sql = string.Format("select Expenditure from tbDatumLargess where TheCode='{0}'", ProductCode);
    //                    SqlCommand cmd = new SqlCommand(s_Sql, Connect);
    //                    object objStream = cmd.ExecuteScalar();
    //                    if (objStream != null && objStream != DBNull.Value)
    //                    {
    //                        FParamhash = xzStreamStorage.getHasTable(objStream as byte[]);
    //                    }

    //                    cmd.CommandText = "select Expenditure from tbDatumProductSort where TheCode='004'";
    //                    objStream = cmd.ExecuteScalar();
    //                    if (objStream != null && objStream != DBNull.Value)
    //                    {
    //                        FParamhash = xzStreamStorage.getHasTable(objStream as byte[]);
    //                        return getValue(VipCode, FParamhash, Amount);
    //                    }
    //                }
    //                finally
    //                {
    //                    //Connect.Close();
    //                }
    //                break;
    //        }
    //        return 0;
    //    }
    //}
    #endregion

    #region �ʿ����
    /// <summary>
    /// Ĭ���ֶ�����
    /// </summary>
    public class HYAccountField
    {
        #region Ĭ�ϵ��ֶ�����
        private string FFieldSrcBillNo = "SrcBillNo";
        [Description("ԭ������"), Category("Xzz")]
        public string FieldSrcBillNo
        {
            get
            {
                return FFieldSrcBillNo;
            }
            set
            {
                if (FFieldSrcBillNo != value)
                {
                    FFieldSrcBillNo = value;
                }
            }
        }

        private string FFieldSrcRowNo = "SrcRowNo";
        [Description("ԭ���к�"), Category("Xzz")]
        public string FieldSrcRowNo
        {
            get
            {
                return FFieldSrcRowNo;
            }
            set
            {
                if (FFieldSrcRowNo != value)
                {
                    FFieldSrcRowNo = value;
                }
            }
        }
        #endregion
    }

    /// <summary>
    /// Դ������
    /// </summary>
    public class HYAccountCommon
    {
        private SqlCommand FCommand = null;
        [Description("����"), Category("Xzz")]
        public SqlCommand Command
        {
            get
            {
                return FCommand;
            }
            set
            {
                if (FCommand != value)
                {
                    FCommand = value;
                }
            }
        }

        private HYAccountField FField = new HYAccountField();
        [Description("Ĭ�ϵ��ֶ�����"), Category("Xzz")]
        public HYAccountField Field
        {
            get
            {
                return FField;
            }
        }

        private void UpdataCurBalance(SqlConnection Conn, SqlTransaction Tran, bool isAdd, DataTable DetailTable, string FieldChange)
        {
            //�޸ļ�ʱ�˿�.
            string UpdateStr = "if Exists(select 1 from tbFinCurBalance where CopartnerCode='{0}' and CopartnerType='{1}' and BillSort='{2}') " + "\n"
                                + "begin" + "\n"
                                + "update tbFinCurBalance set CurMoney=CurMoney+{3}," + "\n"
                                + "InstantMoney=CurMoney+{3}+OtherBail-NoBalanceProfit-NoBalanceKeepPrice-NoBalanceCharge-UsBail" + "\n"
                                + "where CopartnerCode='{0}' and CopartnerType='{1}' and BillSort='{2}'" + "\n"
                                + "end";
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = Conn;
                cmd.Transaction = Tran;
                foreach (DataRow row in DetailTable.Rows)
                {
                    decimal FieldChangeValue = xzSqlAnalysis.getAbsValue(row[FieldChange]);
                    if (!isAdd) FieldChangeValue = -FieldChangeValue;
                    FCommand.CommandText = string.Format(UpdateStr, row[FField.FieldSrcBillNo], row[FField.FieldSrcRowNo], row[FField.FieldSrcBillNo], FieldChangeValue);
                    FCommand.ExecuteNonQuery();
                }
            }
        }

        public void UpdateSrcBill(SqlConnection Conn, SqlTransaction Tran, bool isAdd, DataTable DetailTable
            , string MTableName, string STableName, string SrcColumn, string Column)
        {
            int isUse = 1;
            if (!isAdd) isUse = -1;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = Conn;
                cmd.Transaction = Tran;
                foreach (DataRow row in DetailTable.Rows)
                {
                    //��ԭ���ĳ������ݴ�����ɵ�����
                    if (row[FField.FieldSrcBillNo].ToString() != "")
                    {
                        decimal ColumnValue = xzSqlAnalysis.getAbsValue(row[Column]);
                        if (!isAdd) ColumnValue = -ColumnValue;
                        string sql = @"Update {0} set {1} = {1} + {2} where BillNo = '{3} 'and RowNo='{4}' ";
                        FCommand.CommandText = string.Format(sql, STableName, SrcColumn, ColumnValue, row[FField.FieldSrcBillNo], row[FField.FieldSrcRowNo]);
                        FCommand.ExecuteNonQuery();
                    }

                    //��ԭ�����ϼ���ʹ�õı�־
                    if (row[FField.FieldSrcBillNo].ToString() != "")
                    {
                        string sql = "Update {0} set isUse = isUse + {1} where BillNo = '{2}'";
                        FCommand.CommandText = string.Format(sql, MTableName, isUse, row[FField.FieldSrcBillNo]);
                        FCommand.ExecuteNonQuery();
                    }
                }
            }
        }
    }

    /// <summary>
    /// �ʿ�
    /// </summary>
    public class HYTotailMoney
    {
        private SqlCommand FCommand = null;
        [Description("����"), Category("Xzz")]
        public SqlCommand Command
        {
            get
            {
                return FCommand;
            }
            set
            {
                if (FCommand != value)
                {
                    FCommand = value;
                }
            }
        }

        public void CalcMoney(bool isStor, object CopartnerType, object CopartnerCode, string FieldMoney, decimal Money)
        {
            if (isStor)
            {
                string StrSql = "select count(*) from tbFinTotalMoney where CopartnerType = '{0}' and CopartnerCode = '{1}'";
                FCommand.CommandText = string.Format(StrSql, CopartnerType, CopartnerCode);

                int i = Convert.ToInt32(FCommand.ExecuteScalar());
                switch (i)
                {
                    case 0:
                        StrSql = "insert into tbFinTotalMoney (CopartnerType, CopartnerCode, {0}) values ('{1}','{2}', {3})";
                        FCommand.CommandText = string.Format(StrSql, FieldMoney, CopartnerType, CopartnerCode, Money);
                        FCommand.ExecuteNonQuery();
                        break;
                    case 1:
                        StrSql = "update tbFinTotalMoney set {0} = {0} + {1} where CopartnerType = '{2}' and CopartnerCode = '{3}'";
                        FCommand.CommandText = string.Format(StrSql, FieldMoney, Money, CopartnerType, CopartnerCode);
                        FCommand.ExecuteNonQuery();
                        break;
                }
            }
            else
            {
                string StrSql = "update tbFinTotalMoney set {0} = {0} - {1} where CopartnerType = '{2}' and CopartnerCode = '{3}'";
                FCommand.CommandText = string.Format(StrSql, FieldMoney, Money, CopartnerType, CopartnerCode);
                FCommand.ExecuteNonQuery();

                StrSql = @"delete tbFinTotalMoney where CopartnerType = '{1}' and CopartnerCode = '{2}'
                   and AccountMoney = 0 and NoBalanceProfit = 0 and NoBalanceKeepPrice = 0 and NoBalanceCharge = 0
                   and UsBail = 0 and OtherBail = 0 and HasBalanceProfit = 0 and HasBalanceKeepPrice = 0 and HasBalanceCharge = 0";
                FCommand.CommandText = string.Format(StrSql, FieldMoney, CopartnerType, CopartnerCode);
                FCommand.ExecuteNonQuery();
            }
        }
    }

    #endregion
}