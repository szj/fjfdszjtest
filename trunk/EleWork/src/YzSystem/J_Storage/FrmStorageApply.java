package YzSystem.J_Storage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;

import YzSystem.JMain.*;
import YzSystem.J_System.BeanLogin;

public class FrmStorageApply extends FrmFunctionBase {
    public String billType = "01";
    public String pre = "CK";
    public void init() {
    }

    //���ɵ�ҳ�����̿���
    public FrmStorageApply() throws wlglException {
        super();
        init();
        // ����ҳ�����
        Table = "tbstorageapply";
        seqnField = "BillNo";
        DetailTable = "tbstorageapplyitem";
        DetailSeqnField = "RowNo";
        pageType = "masterDetail";
        if (!inDetailMode) {
//=========================��ѯ����==============================================
            if (mode.equals("query")) {
                // ���ò�ѯ���
                setQueryComp();
                // ���ò�ѯ��Ϣ
                setQueryInfo();
            }
//=========================�������==============================================
            // ����������
            if (mode.equals("add")) {
                setUpdateComp();
                setAddInfo();
            }
//=========================�޸�����==============================================
            // �����޸����
            if (mode.equals("edit")) {
                setUpdateComp();
                setUpdateInfo();
                setDetailQueryInfo();
            }
        } else {
//=========================�������==============================================
            //Table = "tbstorageapplyitem";
            //seqnField = "RowNo";

            setDetailEditComp();
            // ����������
            if (mode.equals("add")) {
                setDetailAddInfo();
            }
//=========================�޸�����==============================================
            // �����޸����
            if (mode.equals("edit")) {
                setDetailUpdateInfo();
            }

        }
    }
    
    /**
     * setQueryComp
     * ������Ҫ�������ѯ���
     */
    private void setQueryComp() throws wlglException {
        EditComponent e1 = new EditComponent("",
                                             "���ݺ�",
                                             "a.BillNo",
                                             "like",
                                             "QBillNo",
                                             "",
                                             "",
                                             "",
                                             "",
                                             "");
        //e1.setMode("readonly");
        EditComponent e2 = new EditComponent("date",
                                             "¼������",
                                             "a.TheDate",
                                             ">=",
                                             "Qbegindate",
                                             "",
                                             "",
                                             "",
                                             "",
                                             "");
        EditComponent e3 = new EditComponent("date",
                                             "��",
                                             "a.TheDate",
                                             "<=",
                                             "Qenddate",
                                             "",
                                             "",
                                             "",
                                             "",
                                             "");

        // ���ý����1������

        HttpBase tr1 = HttpBase.genHttpTR("btd");
        tr1.getElements().add(e1.genHttpBase());
        tr1.getElements().add(e2.genHttpBase());
        tr1.getElements().add(e3.genHttpBase());
        qryComps.clear();
        qryComps.add(e1);
        qryComps.add(e2);
        qryComps.add(e3);

        qryPanels.clear();
        qryPanels.add(tr1);
    }

    /**
     * setQueryInfo
     * ���ò�ѯ��Ϣ
     */
    private void setQueryInfo() {
        qry_selectSQL =
                "select a.TheSeqn, a.BillNo, a.TheDate, a.ApplyDepCode, c.TheName ApplyDepName,a.ApplyerCode,b.TheName ApplyerName, a.ApplyerDate, a.Reason, a.HandleCode," +
                "d.TheName HandleMark, a.MarkerCode,e.TheName MarkerName,a.BillSortCode,f.TheName BillSortName from tbstorageapply a " +
                "  left outer join tbdatumemployee b on a.ApplyerCode=b.TheCode" +
                "  left outer join tbdatumdepartment c on  a.ApplyDepCode=c.TheCode" +
                "  left outer join tbdatumemployee d on a.ApplyerCode=d.TheCode left outer join tbdatumemployee e on a.ApplyerCode=e.TheCode" +
                "  left outer join tbstorageflow f on a.BillSortCode=f.BillNo";

        qry_orderSQL = "order by a.TheSeqn desc ";

        // ����������(���ͣ����⣬��ȣ�������)
        columnsInfo.clear();
        Properties prop1 = new Properties();
        columnsInfo.add(prop1);
        prop1.setProperty("type", "radio");
        prop1.setProperty("title", "ѡ��");
        prop1.setProperty("width", "5%");
        prop1.setProperty("data", "1");

        Properties prop2 = new Properties();
        prop2.setProperty("title", "���ݺ�");
        prop2.setProperty("width", "15%");
        prop2.setProperty("data", "1");
        columnsInfo.add(prop2);

        Properties prop3 = new Properties();
        prop3.setProperty("title", "��������");
        prop3.setProperty("width", "10%");
        prop3.setProperty("data", "2");
        columnsInfo.add(prop3);

        Properties prop4 = new Properties();
        prop4.setProperty("title", "���벿��");
        prop4.setProperty("width", "10%");
        prop4.setProperty("data", "4");
        columnsInfo.add(prop4);

        Properties prop5 = new Properties();
        prop5.setProperty("title", "������");
        prop5.setProperty("width", "10%");
        prop5.setProperty("data", "6");
        columnsInfo.add(prop5);
       

        Properties prop7 = new Properties();
        prop7.setProperty("title", "��������");
        prop7.setProperty("width", "20%");
        prop7.setProperty("data", "7");
        columnsInfo.add(prop7);
        
        Properties prop6 = new Properties();
        prop6.setProperty("title", "ԭ��");
        prop6.setProperty("width", "10%");
        prop6.setProperty("data", "8");
        columnsInfo.add(prop6);
        
        Properties prop8 = new Properties();
        prop8.setProperty("title", "������");
        prop8.setProperty("width", "10%");
        prop8.setProperty("data", "10");
        columnsInfo.add(prop8);
        
        Properties prop9 = new Properties();
        prop9.setProperty("title", "�Ƶ���");
        prop9.setProperty("width", "10%");
        prop9.setProperty("data", "12");
        columnsInfo.add(prop9);
        
        

    }
    
    /**
     * setAddInfo
     * ������Ҫ�ı༭Ĭ��ֵ
     */
    private void setAddInfo() {
        ArrayList ret = new ArrayList();
        //Table = "tssystemsubjectrecord";
        // ����������(���ͣ����⣬��ȣ�������)
        ret.clear();
        
        
        //������
        Properties prop1 = new Properties();
        ret.add(prop1);
        prop1.setProperty("type", "employeecode");
        prop1.setProperty("field", "Creater");
        //ִ����
        Properties prop2 = new Properties();
        ret.add(prop2);
        prop2.setProperty("type", "employeecode");
        prop2.setProperty("field", "Stater");
        //�༭��
        Properties prop3 = new Properties();
        ret.add(prop3);
        prop3.setProperty("type", "employeecode");
        prop3.setProperty("field", "Editer");

  
        // ����ʱ��
        Properties prop4 = new Properties();
        ret.add(prop4);
        prop4.setProperty("type", "time");
        prop4.setProperty("field", "CreateTime");
        // ִ��ʱ��
        Properties prop5 = new Properties();
        ret.add(prop5);
        prop5.setProperty("type", "time");
        prop5.setProperty("field", "StateTime");
        // �༭ʱ��
        Properties prop6 = new Properties();
        ret.add(prop6);
        prop6.setProperty("type", "time");
        prop6.setProperty("field", "EditeTime");
        

        // ���ݺ�
        Properties prop7 = new Properties();
        ret.add(prop7);
        prop7.setProperty("type", "billno");
        prop7.setProperty("field", "billno");
        prop7.setProperty("pre", pre);

        

        addExtraColumns.addAll(ret);
    }

    /**
     * setAddComp
     * ������Ҫ�ı༭���
     */
    protected void setUpdateComp() throws wlglException {
        editPanels.clear();
        EditComponent ec1 = new EditComponent();
        ec1.setCaption("���ݺ�");
        ec1.setField("billno");
        ec1.setUnique(true);
        ec1.setMode("readonly");
        ec1.setDefValue("ϵͳ����");
        ec1.setMustFill(true); 

        EditComponent ec2 = new EditComponent();
        ec2.setEdtType("date");
        ec2.setCaption("��������");
        ec2.setField("TheDate");
        ec2.setMode("readonly");
        ec2.setMustFill(true);
        ec2.setColspan("3");
        ec2.setDefDisValue("ϵͳ����");
        
        EditComponent ec3 = new EditComponent();
        ec3.setEdtType("Department");
        ec3.setField("ApplyDepCode");
        ec3.setCaption("���벿��");
        ec3.setDisID("DeptName");
        ec3.setDefDisValue("����ѡ��");
        ec3.setMode("readonly");
        
        EditComponent ec4 = new EditComponent();
        ec4.setEdtType("Employee");
        ec4.setField("ApplyerCode");
        ec4.setCaption("������");
        ec4.setDisID("ApplyerName");
        ec4.setDefDisValue("����ѡ��");
        ec4.setMode("readonly");
        
        EditComponent ec5 = new EditComponent();
        ec5.setEdtType("date");
        ec5.setField("ApplyerDate");
        ec5.setCaption("��������");
        ec5.setDisID("ApplyerDate");
        ec5.setDefDisValue("ϵͳ����");
        ec5.setMode("readonly");
        
        EditComponent ec6 = new EditComponent();
        ec6.setCaption("����");
        ec6.setField("Reason");
        ec6.setWidth("180");
        ec6.setColspan("5");
        
        EditComponent ec7 = new EditComponent();
        ec7.setEdtType("Employee");
        ec7.setField("HandleCode");
        ec7.setCaption("������");
        ec7.setDisID("HandleName");
        ec7.setDefDisValue("����ѡ��");
        ec7.setMode("readonly");
        
        EditComponent ec8 = new EditComponent();
        ec8.setEdtType("Employee");
        ec8.setField("MarkerCode");
        ec8.setCaption("�Ƶ���");
        ec8.setDisID("MarkerName");
        ec8.setDefDisValue("����ѡ��");
        ec8.setMode("readonly");
        ec8.setColspan("3");
       


        EditComponent ec9 = new EditComponent();
        ec9.setCaption("��ע");
        ec9.setField("Remark");
        ec9.setWidth("100");
        ec9.setColspan("3");
        
        EditComponent ec10 = new EditComponent();
        ec10.setEdtType("StorageFlow");
        ec10.setCaption("��������");
        ec10.setField("BillSortCode");
        ec10.setDisID("BillSortName");
        
        
        // ���ý���ÿ������
        HttpBase tre1 = HttpBase.genHttpTR("btd");
        tre1.getElements().add(ec1.genHttpBase());
        tre1.getElements().add(ec2.genHttpBase());

        
        HttpBase tre2 = HttpBase.genHttpTR("btd");
        tre2.getElements().add(ec3.genHttpBase());
        tre2.getElements().add(ec4.genHttpBase());
        tre2.getElements().add(ec5.genHttpBase());

        HttpBase tre4 = HttpBase.genHttpTR("btd");
        tre4.getElements().add(ec6.genHttpBase());
        
        HttpBase tre5 = HttpBase.genHttpTR("btd");
        tre5.getElements().add(ec7.genHttpBase());
        tre5.getElements().add(ec8.genHttpBase());
        
        HttpBase tre6 = HttpBase.genHttpTR("btd");
        tre6.getElements().add(ec9.genHttpBase());
        tre6.getElements().add(ec10.genHttpBase());

        // ���ӵ��༭�ؼ��б�
        editComps.clear();
        editComps.add(ec1);
        editComps.add(ec2);
        editComps.add(ec3);
        editComps.add(ec4);
        editComps.add(ec5);
        editComps.add(ec6);
        editComps.add(ec7);
        editComps.add(ec8);
        editComps.add(ec9);
        editComps.add(ec10);

        // ���ӵ��༭���б�
        editPanels.clear();
        editPanels.add(tre1);
        editPanels.add(tre2);
        editPanels.add(tre4);
        editPanels.add(tre5);
        editPanels.add(tre6);

    }
    
    /**
     * setAddInfo
     * ������Ҫ�ı༭���
     */
    protected void setUpdateInfo() {
        ArrayList ret = new ArrayList();
        
        edt_selectSQL =
            "select a.TheSeqn, a.BillNo, a.TheDate, a.ApplyDepCode, c.TheName ApplyDepName,a.ApplyerCode,b.TheName ApplyerName, a.ApplyerDate, a.Reason, a.HandleCode," +
            "d.TheName HandleMark, a.MarkerCode,e.TheName MarkerName,a.Remark,a.BillSortCode,f.TheName BillSortName  from tbstorageapply a " +
            "  left outer join tbdatumemployee b on a.ApplyerCode=b.TheCode" +
            "  left outer join tbdatumdepartment c on  a.ApplyDepCode=c.TheCode" +
            "  left outer join tbdatumemployee d on a.ApplyerCode=d.TheCode left outer join tbdatumemployee e on a.ApplyerCode=e.TheCode" +
            "  left outer join tbstorageflow f on a.BillSortCode=f.BillNo";

        editColumns.setProperty("0", "1");
        editColumns.setProperty("1", "2");
        editColumns.setProperty("2", "3");
        editColumns.setProperty("2d", "4");
        editColumns.setProperty("3", "5");
        editColumns.setProperty("3d", "6");
        editColumns.setProperty("4", "7");
        editColumns.setProperty("5", "8");
        editColumns.setProperty("6", "9");
        editColumns.setProperty("6d", "10");
        editColumns.setProperty("7", "11");
        editColumns.setProperty("7d", "12");
        editColumns.setProperty("8", "13");
        editColumns.setProperty("9", "14");
        editColumns.setProperty("9d", "15");
        // ���ø��ӵ��޸�������(���ͣ����⣬��ȣ�������)
        ret.clear();


        //ִ����
        Properties prop1 = new Properties();
        ret.add(prop1);
        prop1.setProperty("type", "employeecode");
        prop1.setProperty("field", "Stater");
        //�༭��
        Properties prop2 = new Properties();
        ret.add(prop2);
        prop2.setProperty("type", "employeecode");
        prop2.setProperty("field", "Editer");

        // ִ��ʱ��
        Properties prop3 = new Properties();
        ret.add(prop3);
        prop3.setProperty("type", "time");
        prop3.setProperty("field", "StateTime");
        // �༭ʱ��
        Properties prop4 = new Properties();
        ret.add(prop4);
        prop4.setProperty("type", "time");
        prop4.setProperty("field", "EditeTime");

        addExtraColumns.addAll(ret);
    }
    
    
    //----------------------------------------------------------------------------------------------------------------------------------------------
    //��ϸ����Ϣ����
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    /**
     * setDetailInfo
     * ���������Ϣ
     */
    private void setDetailQueryInfo() {
        // ������
        detailSelectSQL = "select a.TheSeqn, a.BillNo, a.RowNo, a.ProductCode,b.TheName ProductName,c.TheName SpecName,e.TheName UnitName,a.Number, a.Price, a.TotalMoney,a.RemarkItem " +
        		" from tbstorageapplyitem a left outer join tbdatumproduct b on a.ProductCode=b.TheCode" +
           		"\n"+"left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort" +
           		"\n"+"where b.Flag='SpecCode') c on c.RowNo=b.SpecCode" +
           		"\n"+"left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort" +
           		"\n"+"where b.Flag='UnitCode') e on e.RowNo=b.UnitCode";
        //detailWhereSQL ="d.flag='SpecCode' and f.flag='UnitCode'";; // �������
        detailOrderSQL = " order by a.RowNo"; // �������

        // ����������(���ͣ����⣬��ȣ�������)
        detailColumnsInfo.clear();
        Properties prop1 = new Properties();
        prop1.setProperty("title", "ѡ��");
        prop1.setProperty("type", "radio");
        prop1.setProperty("width", "5%");
        prop1.setProperty("data", "2");
        detailColumnsInfo.add(prop1);

        Properties prop2 = new Properties();
        prop2.setProperty("title", "��Ʒ���");
        prop2.setProperty("width", "10%");
        prop2.setProperty("data", "3");
        detailColumnsInfo.add(prop2);

        Properties prop3 = new Properties();
        prop3.setProperty("title", "��Ʒ����");
        prop3.setProperty("width", "15%");
        prop3.setProperty("data", "4");
        detailColumnsInfo.add(prop3);

        Properties prop4 = new Properties();
        prop4.setProperty("title", "���");
        prop4.setProperty("width", "5%");
        prop4.setProperty("data", "5");
        detailColumnsInfo.add(prop4);
      
        Properties prop5 = new Properties();
        prop5.setProperty("title", "��λ");
        prop5.setProperty("width", "5%");
        prop5.setProperty("data", "6");
        detailColumnsInfo.add(prop5);

        Properties prop7 = new Properties();
        prop7.setProperty("title", "����");
        prop7.setProperty("width", "5%");
        prop7.setProperty("data", "7");
        detailColumnsInfo.add(prop7);
        
        /*
        Properties prop8 = new Properties();
        prop8.setProperty("title", "����");
        prop8.setProperty("width", "5%");
        prop8.setProperty("data", "8");
        detailColumnsInfo.add(prop8);
        */
        
        Properties prop9 = new Properties();
        prop9.setProperty("title", "�ܶ�");
        prop9.setProperty("width", "5%");
        prop9.setProperty("data", "9");
        detailColumnsInfo.add(prop9);

        Properties prop11 = new Properties();
        prop11.setProperty("title", "��ע");
        prop11.setProperty("data", "10");
        detailColumnsInfo.add(prop11);

    }


    /**
     * setDetailAddComp
     * ������Ҫ�ı༭���
     */
    private void setDetailEditComp() throws wlglException {

        EditComponent ec1 = new EditComponent();
        ec1.setEdtType("Product");
        ec1.setField("ProductCode");
        ec1.setCaption("��Ʒ��");
        ec1.setDisID("ProductName");
        ec1.setDefDisValue("����ѡ��");
        ec1.setMode("readonly");
        ec1.setMustFill(true);
        ec1.setFillCompArray("['SpecName','UnitName']");
        ec1.setFillIndexArray("[5,7]");
        ec1.setWidth("20");

        EditComponent ec2 = new EditComponent();
        ec2.setID("SpecName");
        ec2.setCaption("���");
        ec2.setMode("readonly");

        EditComponent ec3 = new EditComponent();
        ec3.setID("UnitName");
        ec3.setCaption("��λ");
        ec3.setMode("readonly");


        EditComponent ec5 = new EditComponent();
        ec5.setField("Number");
        ec5.setCaption("����");
        ec5.setMustFill(true);
        ec5.setMustInt(true);
        ec5.setDefValue("0");
        
        /*
        EditComponent ec7 = new EditComponent();
        ec7.setField("Price");
        ec7.setCaption("����");
        ec7.setMustFill(true);
        ec7.setMustFloat(true);
        ec7.setDefValue("0.00");
        */
        
        EditComponent ec8 = new EditComponent();
        ec8.setField("TotalMoney");
        ec8.setCaption("�ܶ�");
        ec8.setMustFill(true);
        ec8.setMustFloat(true);
        ec8.setDefValue("0.00");
        ec8.setColspan("3");

        EditComponent ec6 = new EditComponent();
        ec6.setField("remarkItem");
        ec6.setCaption("��ע");
        ec6.setWidth("130");
        ec6.setColspan("5");

        HttpBase tre1 = HttpBase.genHttpTR("btd");
        tre1.getElements().add(ec1.genHttpBase());
        tre1.getElements().add(ec2.genHttpBase());
        tre1.getElements().add(ec3.genHttpBase());

        HttpBase tre2 = HttpBase.genHttpTR("btd");
        tre2.getElements().add(ec5.genHttpBase());
        //tre2.getElements().add(ec7.genHttpBase());
        tre2.getElements().add(ec8.genHttpBase());
        
        HttpBase tre3 = HttpBase.genHttpTR("btd");
        tre3.getElements().add(ec6.genHttpBase());
        
        

        // ���ӵ��༭�ؼ��б�
        editComps.clear();
        editComps.add(ec1);
        editComps.add(ec2);
        editComps.add(ec3);
        editComps.add(ec5);
        editComps.add(ec8);
        //editComps.add(ec7);
        editComps.add(ec6);

        // ���ӵ��༭���б�
        editPanels.clear();
        editPanels.add(tre1);
        editPanels.add(tre2);
        editPanels.add(tre3);
    }

    /**
     * setAddInfo
     * ������Ҫ�ı༭���
     */
    private void setDetailUpdateInfo() {
        ArrayList ret = new ArrayList();
        detailSelectSQL =  "select a.TheSeqn, a.BillNo, a.RowNo, a.ProductCode,b.TheName ProductName,b.SpecCode,c.TheName SpecName, b.UnitCode,e.TheName UnitName,a.Number, a.Price, a.TotalMoney,a.RemarkItem " +
		" from tbstorageapplyitem a left outer join tbdatumproduct b on a.ProductCode=b.TheCode" +
   		"\n"+"left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort" +
   		"\n"+"where b.Flag='SpecCode') c on c.RowNo=b.SpecCode" +
   		"\n"+"left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort" +
   		"\n"+"where b.Flag='UnitCode') e on e.RowNo=b.UnitCode";
       //detailWhereSQL ="d.flag='SpecCode' and f.flag='UnitCode'";
        
        // ���ñ༭���Ӧ����
        editColumns.setProperty("0", "3");
        editColumns.setProperty("0d", "4");
        editColumns.setProperty("1", "6");
        editColumns.setProperty("2", "8");
        editColumns.setProperty("3", "9");
        //editColumns.setProperty("4", "10");
        editColumns.setProperty("4", "11");
        editColumns.setProperty("5", "12");
        // ���ø��ӵ��޸�������(���ͣ����⣬��ȣ�������)
        ret.clear();
        addExtraColumns.addAll(ret);
    }
    /**
     * setAddInfo
     * ������Ҫ�ı༭���
     */
    private void setDetailAddInfo() {
        ArrayList ret = new ArrayList();
        // ����������(���ͣ����⣬��ȣ�������)
        ret.clear();
        Properties prop1 = new Properties();
        ret.add(prop1);
        prop1.setProperty("type", "DetailSeqn");
        prop1.setProperty("mainkey",seqnField);
        prop1.setProperty("field", "RowNo");

        Properties prop2 = new Properties();
        ret.add(prop2);
        prop2.setProperty("type", "seqn");
        prop2.setProperty("field", "BillNo");
        
        addExtraColumns.addAll(ret);
    }
    /*  2008-06-09
     *  ���̴���ʽ
     *  szj
     *  
     * 
     */
    //������������
    
    protected void afterAddSave(UtilDB utildb) throws wlglException {
    	
    	// �õ���������
		if (!inDetailMode) {// ������ʱ�����ӱ���Ϣ.
			String billno = seqn;
			String billsortcode = UtilWebTools.getRequestParameter("BillSortCode");

			String tmpSQL = "insert Into  tbstorageflowlog (BillNo,SerialNO,FlowCode,FlowRowNo,IsSameDep,IsFlowers,IsFlowMust,FlowApproveCode) "
					+ "\n" + "values(?,?,?,?,?,?,?,?)";

			ArrayList paramsvalue = new ArrayList();
			try {
				utildb.exeQuery("select  BillNo, RowNo,IsSameDep, IsFlowers, IsFlowMust,ApproveCodeArray from tbstorageflowitem where BillNo='"
								+ billsortcode + "'");
				int i = 0;
				while (utildb.myRs.next()) {
					// ��Ա����
					String flowApproveArray[] = utildb.myRs.getString(6)
							.split(",");
					for (int j = 0; j < flowApproveArray.length; j++) {
						paramsvalue.add(billno);
						paramsvalue.add(i++);
						paramsvalue.add(utildb.myRs.getString(1));
						paramsvalue.add(utildb.myRs.getString(2));
						paramsvalue.add(utildb.myRs.getString(3));
						paramsvalue.add(utildb.myRs.getString(4));
						paramsvalue.add(utildb.myRs.getString(5));
						if (!flowApproveArray[j].equals("")) {
							paramsvalue.add(flowApproveArray[j]);
							utildb.exeUpdate(tmpSQL, paramsvalue);
						}
						paramsvalue.clear();
					}
				}
			} catch (Exception ex) {
				throw new wlglException("�Զ�����Ȩ�ޱ�ʧ��!");
			}
		}
    }
    
    protected String canDelete() throws wlglException {
    	String val = "";
		if (!inDetailMode) {// ������ʱ�����ӱ���Ϣ.
			String billno = seqn;
			ArrayList paramsvalue = new ArrayList();
			paramsvalue.add(billno);
				UtilDB utildbchild = new UtilDB();
				ArrayList rs = utildbchild.exeQueryOneRow(
		                    "select count(*) from tbstorageflowlog where BillNo=? and IsCheck=1", paramsvalue);
				int count =  Integer.parseInt((String) rs.get(0));
				if ((count >= 1)) {
		                val = "�Ѿ��������,����ɾ��!";
		        }
				utildbchild.closeCon();
		}
        return val;

    }
    
    protected void afterDelete(UtilDB utildb) throws wlglException {
    	String billno = seqn;
		ArrayList params = new ArrayList();
		params.add(billno);
		String sqlStr="delete from tbstorageflowlog where BillNo=?";
    	UtilDB utildbchild = new UtilDB();
    	utildbchild.exeUpdate(sqlStr, params);
    }
}
