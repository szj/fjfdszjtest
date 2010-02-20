
//����ά��
package YzSystem.J_Elework;

import java.util.ArrayList;
import java.util.Properties;

import YzSystem.JMain.EditComponent;
import YzSystem.JMain.FrmFunctionBase;
import YzSystem.JMain.HttpBase;
import YzSystem.JMain.UtilDB;
import YzSystem.JMain.wlglException;

public class FrmOutRepair extends FrmFunctionBase {
	  public String billType = "1002";
	    public String pre = "WH";
		
		   public FrmOutRepair() throws wlglException {
		        super();
		        Table = "tbEleworkOutRepair";
		        seqnField = "billno";
		        DetailTable = "tbEleworkOutRepairItem";
		        DetailSeqnField = "rowno";
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
		        	            	setEditComp();
		        	                setAddInfo();
		        	            }
		        	//=========================�޸�����==============================================
		        	            // �����޸����
		        	            if (mode.equals("edit")) {
		        	            	setEditComp();
		        	                setUpdateInfo();
		        	                setDetailQueryInfo();
		        	            }
		        	        } else {
		        	//=========================�������==============================================

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
		     * ������Ҫ�Ĳ�ѯ���
		     */
		    private void setQueryComp() throws wlglException {
		    EditComponent e1 = new EditComponent("", "���", "a.BillNo", "like",
					"QBillNo", "", "", "", "", "");
			EditComponent e2 = new EditComponent("date", "¼������", "a.TheDate", ">=",
					"Qbegindate", "", "", "", "", "");
			EditComponent e3 = new EditComponent("date", "��", "a.TheDate", "<=",
					"Qenddate", "", "", "", "", "");

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
			 * setQueryInfo ������Ҫ�Ĳ�ѯ��Ϣ
			 */
		    private void setQueryInfo() {
		        qry_selectSQL ="select 	a.TheSeqn, a.BillNo, a.TheDate, a.ClientCode,b.theName ClientName,a.RelTelephone, a.RelCode,  a.CopartnerType," +
		        		"\n"+"a.FaxCode, a.WorkArray, a.IsFinally, a.NoticeDate, a.TrafficeDate, a.AskDate, a.TrafficeFee, a.StartDate, a.FinDate, " +
		        		"\n"+"a.ClientSign, a.CheckSign,c.TheName CheckName, a.EngineSign,d.TheName EngingName,a.ClientAttitud, a.TransferSort " +
		        		"\n"+ "from tbeleworkoutrepair a left outer join tbdatumcopartner b on a.ClientCode=b.TheCode and a.CopartnerType=b.CopartnerType" +
		        		"\n"+" left outer join tbdatumemployee c on c.TheCode=a.CheckSign left outer join tbdatumemployee d on d.TheCode=a.EngineSign";
		        qry_whereSQL="a.BillSortCode='"+billType+"'";
		        qry_orderSQL = "order by a.BillNo desc";

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
		        prop2.setProperty("data", "1");
		        columnsInfo.add(prop2);
		        
		        Properties prop3 = new Properties();
		        prop3.setProperty("title", "��������");
		        prop3.setProperty("data", "2");
		        columnsInfo.add(prop3);

		        Properties prop4 = new Properties();
		        prop4.setProperty("title", "�ͻ�");
		        prop4.setProperty("data", "4");
		        columnsInfo.add(prop4);
		        
		        Properties prop5 = new Properties();
		        prop5.setProperty("title", "��ϵ��");
		        prop5.setProperty("data", "6");
		        columnsInfo.add(prop5);
		        
		        
		        Properties prop6 = new Properties();
		        prop6.setProperty("title", "��ϵ�绰");
		        prop6.setProperty("data", "5");
		        columnsInfo.add(prop6);
		        
		        Properties prop7 = new Properties();
		        prop7.setProperty("title", "����ʦ");
		        prop7.setProperty("data", "21");
		        columnsInfo.add(prop7);
		        
		        Properties prop8 = new Properties();
		        prop8.setProperty("title", "����ȷ��");
		        prop8.setProperty("data", "19");
		        columnsInfo.add(prop8);
		    } 
		    /**
		     * setAddInfo
		     * ������Ҫ�ı༭���
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
		        
		        //�������
		        Properties prop8 = new Properties();
		        ret.add(prop8);
		        prop8.setProperty("type", "data");
		        prop8.setProperty("field", "BillSortCode");
		        prop8.setProperty("value", billType);

		        addExtraColumns.addAll(ret);
		    }
		    
		    /**
		     * setAddComp
		     * ������Ҫ�ı༭���
		     */
		    private void setEditComp() throws wlglException {
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
		        
		        EditComponent ec3 = new EditComponent();
		        ec3.setEdtType("Client");
		        ec3.setField("ClientCode");
		        ec3.setCaption("�ͻ�����");
		        ec3.setDisID("ClientName");
		        ec3.setDefDisValue("����ѡ��");
		        ec3.setMode("readonly");
		        ec3.setMustFill(true);
		        ec3.setFillCompArray("['CopartnerType','CopartnerTypeName']");
		        ec3.setFillIndexArray("[1,4]");      
	        
		        EditComponent ec4 = new EditComponent();
		        ec4.setEdtType("CopartnerType");
		        ec4.setField("CopartnerType");
		        ec4.setCaption("�ͻ����");
		        ec4.setDisID("CopartnerTypeName");
		        ec4.setDefDisValue("����ѡ��");
		        ec4.setMode("readonly");
		        
		        EditComponent ec5 = new EditComponent();
		        ec5.setCaption("�绰");
		        ec5.setField("RelTelephone");
		        
		        EditComponent ec6 = new EditComponent();
		        ec6.setCaption("��ϵ��");
		        ec6.setField("RelCode");

		        EditComponent ec7 = new EditComponent();
		        ec7.setCaption("����");
		        ec7.setField("FaxCode");
		        
		        EditComponent ec8 = new EditComponent();
		        ec8.setCaption("��Ա����");
		        ec8.setField("WorkArray");
		        
		        
		        EditComponent ec9 = new EditComponent();
		        ec9.setEdtType("date");
		        ec9.setCaption("֪ͨʱ��");
		        ec9.setMode("readonly");
		        ec9.setField("NoticeDate");
		        
		        EditComponent ec10 = new EditComponent();
		        ec10.setEdtType("date");
		        ec10.setCaption("��ͨʱ��");
		        ec10.setMode("readonly");
		        ec10.setField("TrafficeDate");
		        
		        
		        EditComponent ec11 = new EditComponent();
		        ec11.setEdtType("date");
		        ec11.setCaption("Ҫ��ʱ��");
		        ec11.setMode("readonly");
		        ec11.setField("AskDate");
		        
		        
		        EditComponent ec12 = new EditComponent();
		        ec12.setCaption("��ͨ����");
		        ec12.setField("TrafficeFee");
		        
		        EditComponent ec13 = new EditComponent();
		        ec13.setEdtType("date");
		        ec13.setCaption("��ʼʱ��");
		        ec13.setMode("readonly");
		        ec13.setField("StartDate");
		        
		        
		        EditComponent ec14 = new EditComponent();
		        ec14.setEdtType("date");
		        ec14.setCaption("���ʱ��");
		        ec14.setMode("readonly");
		        ec14.setField("FinDate");
	        
		        
		        EditComponent ec15 = new EditComponent();
		        ec15.setEdtType("Employee");
		        ec15.setCaption("����ʦ");
		        ec15.setField("EngineSign");
		        ec15.setDisID("EngineSignName");
		        ec15.setDefDisValue("����ѡ��");
		        ec15.setMode("readonly");
		        
		        EditComponent ec16= new EditComponent();
		        ec16.setEdtType("textarea");
		        ec16.setCaption("�û�����");
		        ec16.setField("ClientAttitud");
		        ec16.setColspan("5");		        
		        
		        EditComponent ec17 = new EditComponent();
		        ec17.setCaption("�û�ǩ��");
		        ec17.setField("ClientSign"); 
		        
		        EditComponent ec18 = new EditComponent();
		        ec18.setEdtType("bool");
		        ec18.setCaption("�Ƿ����");
		        ec18.setField("IsFinally");
		        
		        
		        EditComponent ec19 = new EditComponent();
		        ec19.setEdtType("bool");
		        ec19.setCaption("����ת��");
		        ec19.setField("TransferSort");

		        // ���ý���ÿ������
		        HttpBase tre1 = HttpBase.genHttpTR("btd");
		        tre1.getElements().add(ec1.genHttpBase());
		        tre1.getElements().add(ec2.genHttpBase());
		        tre1.getElements().add(ec3.genHttpBase());
		        
		        HttpBase tre2 = HttpBase.genHttpTR("btd");
		        tre2.getElements().add(ec4.genHttpBase());
		        tre2.getElements().add(ec5.genHttpBase());
		        tre2.getElements().add(ec6.genHttpBase());
		        
		        HttpBase tre3 = HttpBase.genHttpTR("btd");
		        tre3.getElements().add(ec7.genHttpBase());
		        tre3.getElements().add(ec8.genHttpBase());
		        tre3.getElements().add(ec9.genHttpBase());

		        HttpBase tre4 = HttpBase.genHttpTR("btd");
		        tre4.getElements().add(ec10.genHttpBase());
		        tre4.getElements().add(ec11.genHttpBase());
		        tre4.getElements().add(ec12.genHttpBase());
		        
		        HttpBase tre5 = HttpBase.genHttpTR("btd");
		        tre5.getElements().add(ec13.genHttpBase());
		        tre5.getElements().add(ec14.genHttpBase());
		        tre5.getElements().add(ec15.genHttpBase());

		        HttpBase tre6 = HttpBase.genHttpTR("btd");
		        tre6.getElements().add(ec16.genHttpBase());
		        
		        HttpBase tre7 = HttpBase.genHttpTR("btd");
		        tre7.getElements().add(ec17.genHttpBase());
		        tre7.getElements().add(ec18.genHttpBase());
		        tre7.getElements().add(ec19.genHttpBase());

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
		        editComps.add(ec11);
		        editComps.add(ec12);
		        editComps.add(ec13);
		        editComps.add(ec14);
		        editComps.add(ec15);
		        editComps.add(ec16);
		        editComps.add(ec17);
		        editComps.add(ec18);
		        editComps.add(ec19);

		        // ���ӵ��༭���б�
		        editPanels.clear();
		        editPanels.add(tre1);
		        editPanels.add(tre2);
		        editPanels.add(tre3);
		        editPanels.add(tre4);
		        editPanels.add(tre5);
		        editPanels.add(tre6);
		        editPanels.add(tre7);
		    }

		    /**
		     * setAddInfo
		     * ������Ҫ�ı༭���
		     */
		    private void setUpdateInfo() {
		        ArrayList ret = new ArrayList();
		        edt_selectSQL ="select 	a.TheSeqn, a.BillNo, a.TheDate, a.ClientCode,b.theName ClientName, a.CopartnerType,a.RelTelephone, a.RelCode, " +
      		"\n"+"a.FaxCode, a.WorkArray, a.NoticeDate, a.TrafficeDate, a.AskDate, a.TrafficeFee, a.StartDate, a.FinDate, " +
      		"\n"+"a.EngineSign, d.TheName EngingName,a.ClientAttitud,a.ClientSign,a.IsFinally, case a.IsFinally when '1' then '��' else '��' end IsFinallyName,a.TransferSort,a.CheckSign,c.TheName CheckName" +
      		"\n"+ "from tbeleworkoutrepair a left outer join tbdatumcopartner b on a.ClientCode=b.TheCode and a.CopartnerType=b.CopartnerType" +
      		"\n"+" left outer join tbdatumemployee c on c.TheCode=a.CheckSign left outer join tbdatumemployee d on d.TheCode=a.EngineSign";
		        
		        edt_whereSQL="a.BillSortCode='"+billType+"'";


		        // ���ñ༭���Ӧ����
		        editColumns.setProperty("0", "1");
		        editColumns.setProperty("1", "2");
		        editColumns.setProperty("2", "3");
		        editColumns.setProperty("2d", "4");
		        editColumns.setProperty("3", "5");
		        editColumns.setProperty("4", "6");
		        editColumns.setProperty("5", "7");
		        editColumns.setProperty("6", "8");
		        editColumns.setProperty("7", "9");
		        
		        editColumns.setProperty("8", "10");
		        editColumns.setProperty("9", "11");
		        editColumns.setProperty("10", "12");
		        editColumns.setProperty("11", "13");
		        editColumns.setProperty("12", "14");
		        editColumns.setProperty("13", "15");
		        
		        editColumns.setProperty("14", "16");
		        editColumns.setProperty("14d", "17");
		        editColumns.setProperty("15", "18");
		        
		        editColumns.setProperty("16", "19");
		        editColumns.setProperty("17", "20");
		        editColumns.setProperty("17d", "21");
		        editColumns.setProperty("18", "22");
		        editColumns.setProperty("18d", "23");
		        

		        // ���ø��ӵ��޸�������(���ͣ����⣬��ȣ�������)
		        ret.clear();
		        
		        //ִ����
		        Properties prop1 = new Properties();
		        ret.add(prop1);
		        prop1.setProperty("type", "employeecode");
		        prop1.setProperty("field", "Stater");

		  
		        // ����ʱ��
		        Properties prop2 = new Properties();
		        ret.add(prop2);
		        prop2.setProperty("type", "time");
		        prop2.setProperty("field", "StateTime");
		        
		        //�༭��
		        Properties prop3 = new Properties();
		        ret.add(prop3);
		        prop3.setProperty("type", "employeecode");
		        prop3.setProperty("field", "Editer");

		  
		        //�༭ʱ��
		        Properties prop4 = new Properties();
		        ret.add(prop4);
		        prop4.setProperty("type", "time");
		        prop4.setProperty("field", "EditeTime");

		        addExtraColumns.addAll(ret);
		    }
		    
		    // ��ϸ��Ϣ
	private void setDetailQueryInfo() {
		detailSelectSQL = "select 	TheSeqn, a.BillNo, a.RowNo, a.ListNo, a.ProductCode,b.TheName ProductName, a.ProductSort,c.TheName ProductSortName,d.TheName ModelName,e.TheName SpecName,f.TheName UnitName,"
				+ "\n"+ "a.Quedesc, a.Taskdesc, a.Remark from tbeleworkoutrepairitem a"
				+ "\n"+ "left outer join tbdatumproduct b on a.ProductCode=b.TheCode and a.Productsort=b.ProductTypecode"
				+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
				+ "\n"+ "where b.Flag='ProductTypeCode') c on c.RowNo=b.ProductTypeCode"
				+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
				+ "\n"+ "where b.Flag='ModelCode') d on d.RowNo=b.ModelCode"
				+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
				+ "\n"+ "where b.Flag='SpecCode') e on e.RowNo=b.SpecCode"
				+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
				+ "\n" + "where b.Flag='UnitCode') f on f.RowNo=b.UnitCode";

		detailOrderSQL = "order by a.RowNo ";

		// ����������(���ͣ����⣬��ȣ�������)
		detailColumnsInfo.clear();
		Properties prop1 = new Properties();
		detailColumnsInfo.add(prop1);
		prop1.setProperty("type", "radio");
		prop1.setProperty("title", "ѡ��");
		prop1.setProperty("width", "5%");
		prop1.setProperty("data", "2");

		Properties prop2 = new Properties();
		prop2.setProperty("title", "���к�");
		prop2.setProperty("data", "3");
		detailColumnsInfo.add(prop2);

		Properties prop3 = new Properties();
		prop3.setProperty("title", "��Ʒ");
		prop3.setProperty("data", "5");
		detailColumnsInfo.add(prop3);

		Properties prop4 = new Properties();
		prop4.setProperty("title", "�ͺ�");
		prop4.setProperty("data", "7");
		detailColumnsInfo.add(prop4);

		Properties prop5 = new Properties();
		prop5.setProperty("title", "���");
		prop5.setProperty("data", "8");
		detailColumnsInfo.add(prop5);

	}
		    private void setDetailEditComp() throws wlglException {
		    	
		        EditComponent ec1 = new EditComponent();
		        ec1.setField("ListNo");
		        ec1.setCaption("���к�");
		        
		        EditComponent ec2 = new EditComponent();
		        ec2.setEdtType("Product");
		        ec2.setField("ProductCode");
		        ec2.setCaption("�豸����");
		        ec2.setDisID("ProductName");
		        ec2.setDefDisValue("����ѡ��");
		        ec2.setMode("readonly");
		        ec2.setMustFill(true);
		        ec2.setFillCompArray("['ProductSort','ModelName','SpecName','UnitName']");
		        ec2.setFillIndexArray("[1,9,5,7]");

		        EditComponent ec3 = new EditComponent();
		        ec3.setEdtType("ProductTypeCode ");
		        ec3.setField("ProductSort");
		        ec3.setDisID("ProductSortName");
		        ec3.setCaption("�豸���");
		        ec3.setMode("readonly");
		        
		        
		        EditComponent ec4 = new EditComponent();
		        ec4.setID("ModelName");
		        ec4.setCaption("�ͺ�");
		        ec4.setMode("readonly");
		        
		        EditComponent ec5 = new EditComponent();
		        ec5.setID("SpecName");
		        ec5.setCaption("���");
		        ec5.setMode("readonly");

		        EditComponent ec6 = new EditComponent();
		        ec6.setID("UnitName");
		        ec6.setCaption("��λ");
		        ec6.setMode("readonly");


		        EditComponent ec7 = new EditComponent();
		        ec7.setEdtType("textarea");
		        ec7.setCaption("�������");
		        ec7.setField("Quedesc");
		        ec7.setColspan("5");
		        
		        EditComponent ec8 = new EditComponent();
		        ec8.setEdtType("textarea");
		        ec8.setCaption("��������");
		        ec8.setField("Taskdesc");
		        ec8.setColspan("5");


		        // ���ý���ÿ������
		        HttpBase tre1 = HttpBase.genHttpTR("btd");
		        tre1.getElements().add(ec1.genHttpBase());
		        tre1.getElements().add(ec2.genHttpBase());
		        tre1.getElements().add(ec3.genHttpBase());
		        
		        HttpBase tre2 = HttpBase.genHttpTR("btd");
		        tre2.getElements().add(ec4.genHttpBase());
		        tre2.getElements().add(ec5.genHttpBase());
		        tre2.getElements().add(ec6.genHttpBase());
		        
		        HttpBase tre3 = HttpBase.genHttpTR("btd");
		        tre3.getElements().add(ec7.genHttpBase());
		        
		        HttpBase tre4 = HttpBase.genHttpTR("btd");
		        tre4.getElements().add(ec8.genHttpBase());

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

		        // ���ӵ��༭���б�
		        editPanels.clear();
		        editPanels.add(tre1);
		        editPanels.add(tre2);
		        editPanels.add(tre3);
		        editPanels.add(tre4);
		    }
	 
		    private void setDetailUpdateInfo() {
		    	
		        ArrayList ret = new ArrayList();
		        detailSelectSQL = "select 	a.BillNo, a.RowNo, a.ListNo, a.ProductCode,b.TheName ProductName, a.ProductSort,c.TheName ProductSortName,d.TheName ModelName,e.TheName SpecName,f.TheName UnitName,"
					+ "\n"+ "a.Quedesc, a.Taskdesc, a.Remark from tbeleworkoutrepairitem a"
					+ "\n"+ "left outer join tbdatumproduct b on a.ProductCode=b.TheCode and a.Productsort=b.ProductTypecode"
					+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
					+ "\n"+ "where b.Flag='ProductTypeCode') c on c.RowNo=b.ProductTypeCode"
					+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
					+ "\n"+ "where b.Flag='ModelCode') d on d.RowNo=b.ModelCode"
					+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
					+ "\n"+ "where b.Flag='SpecCode') e on e.RowNo=b.SpecCode"
					+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
					+ "\n" + "where b.Flag='UnitCode') f on f.RowNo=b.UnitCode";
		        
		        detailOrderSQL = "order by a.RowNo";

		        // ���ñ༭���Ӧ����

		        editColumns.setProperty("0", "2");
		        editColumns.setProperty("1", "3");
		        editColumns.setProperty("1d", "4");
		        editColumns.setProperty("2", "5");
		        editColumns.setProperty("2d", "6");
		        editColumns.setProperty("3", "7");
		        editColumns.setProperty("4", "8");
		        editColumns.setProperty("5", "9");
		        editColumns.setProperty("6", "10");
		        editColumns.setProperty("7", "11");
		        
		        // ���ø��ӵ��޸�������(���ͣ����⣬��ȣ�������)
		        ret.clear();

		        addExtraColumns.addAll(ret);
		    }
		    
		    private void setDetailAddInfo() {
		        ArrayList ret = new ArrayList();
		        //Table = "tssystemsubjectrecord";
		        // ����������(���ͣ����⣬��ȣ�������)
		        ret.clear();
		        
		        Properties prop1 = new Properties();
		        ret.add(prop1);
		        prop1.setProperty("type", "DetailSeqn");
		        prop1.setProperty("mainkey",seqnField);
		        prop1.setProperty("field", "RowNo");
		        
		        Properties prop7 = new Properties();
		        ret.add(prop7);
		        prop7.setProperty("type", "seqn");
		        prop7.setProperty("field", "BillNo");

		        addExtraColumns.addAll(ret);
		    }
		    
		    
		    
		    //����Ĭ�ϵ���Ŀ��������ݡ�
		    protected void afterAddSave(UtilDB utildb) throws wlglException {
		    }

		    private void jbInit() throws Exception {
		    }


}
