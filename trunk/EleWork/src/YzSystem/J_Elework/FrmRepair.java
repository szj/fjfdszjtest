package YzSystem.J_Elework;

import java.util.ArrayList;
import java.util.Properties;

import YzSystem.JMain.EditComponent;
import YzSystem.JMain.FrmFunctionBase;
import YzSystem.JMain.HttpBase;
import YzSystem.JMain.UtilDB;
import YzSystem.JMain.wlglException;

public class FrmRepair  extends FrmFunctionBase {
	  public String billType = "1003";
	    public String pre = "WX";
		
		   public FrmRepair() throws wlglException {
		        super();
		        Table = "tbeleworkrepair";
		        seqnField = "billno";
		        DetailTable = "tbeleworkrepairitem";
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
		        qry_selectSQL ="select 	a.TheSeqn, a.BillNo, a.TheDate, a.ClientCode,b.theName ClientName,a.RelTelephone, a.RelCode,  a.CopartnerType,a.ClientAdd," +
		        		"\n"+"a.ListNo, a.ProductCode,h.TheName ProductName,a.ProductSort,i.TheName ProductSortName,j.TheName ModelName,k.TheName SpecName,l.TheName UnitName," +
		        		"\n"+"a.IsKeep,case a.IsKeep when '1' then '��' else '��' end IsKeepName,a.ServiceSortCode,g.TheName ServiceSortName,a.Quedesc, a.InHandOver, a.InSelfSign,e.TheName InSelfSignName," +
		        		"\n"+"a.InDate,a.Configdesc, a.Appeardesc, a.Operdesc, a.Taskdesc, a.IsReject,case a.IsReject when '1' then '��' else '��' end IsRejectName,a.FinDate, a.CheckSign,c.TheName CheckName, a.EngineSign,d.TheName EngingName,a.ClientSign,a.ClientAttitud," +
		        		"\n"+"a.OutHandOver, a.OutSelfSign,f.TheName OutSelfSignName, a.TransferSort"+
		        		"\n"+ "from tbeleworkrepair a left outer join tbdatumcopartner b on a.ClientCode=b.TheCode and a.CopartnerType=b.CopartnerType" +
		        		"\n"+" left outer join tbdatumemployee c on c.TheCode=a.CheckSign left outer join tbdatumemployee d on d.TheCode=a.EngineSign"+
		        		"\n"+" left outer join tbdatumemployee e on e.TheCode=a.InSelfSign left outer join tbdatumemployee f on f.TheCode=a.OutSelfSign"+ 
		        		"\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"+ 
		        		"\n" + "where b.Flag='ServiceSortCode') g on g.RowNo=a.ServiceSortCode"
						+ "\n"+ "left outer join tbdatumproduct h on a.ProductCode=h.TheCode and a.Productsort=h.ProductTypecode"
						+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
						+ "\n"+ "where b.Flag='ProductTypeCode') i on i.RowNo=h.ProductTypeCode"
						+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
						+ "\n"+ "where b.Flag='ModelCode') j on j.RowNo=h.ModelCode"
						+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
						+ "\n"+ "where b.Flag='SpecCode') k on k.RowNo=h.SpecCode"
						+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
						+ "\n" + "where b.Flag='UnitCode') l on l.RowNo=h.UnitCode";

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
		        
		        Properties prop9 = new Properties();
		        prop9.setProperty("title", "���к�");
		        prop9.setProperty("data", "9");
		        columnsInfo.add(prop9);
		        
		        Properties prop10 = new Properties();
		        prop10.setProperty("title", "����ʱ��");
		        prop10.setProperty("data", "25");
		        columnsInfo.add(prop10);
		        
		        Properties prop11 = new Properties();
		        prop11.setProperty("title", "��Ʒ");
		        prop11.setProperty("data", "11");
		        columnsInfo.add(prop11);
		        
		        
		        Properties prop7 = new Properties();
		        prop7.setProperty("title", "����ʦ");
		        prop7.setProperty("data", "36");
		        columnsInfo.add(prop7);
		        
		        Properties prop8 = new Properties();
		        prop8.setProperty("title", "����ȷ��");
		        prop8.setProperty("data", "34");
		        columnsInfo.add(prop8);
		    } 
		    /**
		     * setAddInfo
		     * ������Ҫ�ı༭���
		     */
		    private void setAddInfo() {
		        ArrayList ret = new ArrayList();

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
		        ec7.setCaption("ͨ�ŵ�ַ");
		        ec7.setField("ClientAdd");
		        
		        EditComponent ec8 = new EditComponent();
		        ec8.setField("ListNo");
		        ec8.setCaption("���к�");
		        
		        EditComponent ec9 = new EditComponent();
		        ec9.setEdtType("Product");
		        ec9.setField("ProductCode");
		        ec9.setCaption("�豸����");
		        ec9.setDisID("ProductName");
		        ec9.setDefDisValue("����ѡ��");
		        ec9.setMode("readonly");
		        ec9.setMustFill(true);
		        ec9.setFillCompArray("['ProductSort','ModelName','SpecName','UnitName']");
		        ec9.setFillIndexArray("[1,9,5,7]");

		        EditComponent ec10 = new EditComponent();
		        ec10.setEdtType("ProductTypeCode ");
		        ec10.setField("ProductSort");
		        ec10.setDisID("ProductSortName");
		        ec10.setCaption("�豸���");
		        ec10.setMode("readonly");
		        
		        
		        EditComponent ec11 = new EditComponent();
		        ec11.setID("ModelName");
		        ec11.setCaption("�ͺ�");
		        ec11.setMode("readonly");
		        
		        EditComponent ec12 = new EditComponent();
		        ec12.setID("SpecName");
		        ec12.setCaption("���");
		        ec12.setMode("readonly");

		        EditComponent ec13 = new EditComponent();
		        ec13.setID("UnitName");
		        ec13.setCaption("��λ");
		        ec13.setMode("readonly");
		        
		        
		        EditComponent ec14 = new EditComponent();
		        ec14.setEdtType("bool");
		        ec14.setCaption("�Ƿ���");
		        ec14.setMode("readonly");
		        ec14.setField("IsKeep");
		        ec14.setDisID("IsKeepName");
		        
		        EditComponent ec15 = new EditComponent();
		        ec15.setEdtType("ServiceSortCode");
		        ec15.setCaption("����ʽ");
		        ec15.setMode("readonly");
		        ec15.setField("ServiceSortCode");
		        ec15.setDisID("ServiceSortName");
		        
		        
		        EditComponent ec16 = new EditComponent();
		        ec16.setEdtType("textarea");
		        ec16.setCaption("�������󼰹����ж�");
		        ec16.setField("Quedesc");
		        ec16.setColspan("5");
		        
		        
		        EditComponent ec17 = new EditComponent();
		        ec17.setCaption("������ǩ��(��)");
		        ec17.setField("InHandOver");
		        
		        EditComponent ec18 = new EditComponent();
		        ec18.setEdtType("Employee");
		        ec18.setCaption("�ڷ�ǩ��(��)");
		        ec18.setMode("readonly");
		        ec18.setField("InSelfSign");
		        ec18.setDisID("InSelfSignName");
		        
		        
		        EditComponent ec19 = new EditComponent();
		        ec19.setEdtType("date");
		        ec19.setCaption("�û�����ʱ��");
		        ec19.setMode("readonly");
		        ec19.setField("InDate");
		        
		        EditComponent ec20 = new EditComponent();
		        ec20.setEdtType("textarea");
		        ec20.setCaption("������������");
		        ec20.setField("Configdesc");
		        ec20.setColspan("5");
		        
		        
		        EditComponent ec21 = new EditComponent();
		        ec21.setEdtType("textarea");
		        ec21.setCaption("���������");
		        ec21.setField("Appeardesc");
		        ec21.setColspan("5");
		        
		        
		        EditComponent ec22 = new EditComponent();
		        ec22.setEdtType("textarea");
		        ec22.setCaption("�ͻ�Ҫ��");
		        ec22.setField("Operdesc");
		        ec22.setColspan("5");
		        
		        EditComponent ec23 = new EditComponent();
		        ec23.setEdtType("textarea");
		        ec23.setCaption("�����ų��ʹ�����");
		        ec23.setField("Taskdesc");
		        ec23.setColspan("5");      
		        
		        
		        EditComponent ec24 = new EditComponent();
		        ec24.setEdtType("bool");
		        ec24.setCaption("�Ƿ񱨷�");
		        ec24.setField("IsReject");
		        ec24.setDisID("IsRejectName");
		        
		        EditComponent ec25 = new EditComponent();
		        ec25.setEdtType("date");
		        ec25.setCaption("�������");
		        ec25.setField("FinDate");

		        EditComponent ec26 = new EditComponent();
		        ec26.setEdtType("Employee");
		        ec26.setCaption("����ʦ");
		        ec26.setField("EngineSign");
		        ec26.setDisID("EngineSignName");
		        ec26.setDefDisValue("����ѡ��");
		        ec26.setMode("readonly");
		        
		        EditComponent ec27= new EditComponent();
		        ec27.setEdtType("textarea");
		        ec27.setCaption("�û�����");
		        ec27.setField("ClientAttitud");
		        ec27.setColspan("5");		        
		        
		        EditComponent ec28 = new EditComponent();
		        ec28.setCaption("�û�ǩ��");
		        ec28.setField("ClientSign"); 
		        
		        EditComponent ec29 = new EditComponent();
		        ec29.setCaption("������ǩ��(��)");
		        ec29.setField("OutHandOver");
		        
		        EditComponent ec30 = new EditComponent();
		        ec30.setEdtType("Employee");
		        ec30.setCaption("�ڷ�ǩ��(��)");
		        ec30.setMode("readonly");
		        ec30.setField("OutSelfSign");
		        ec30.setDisID("OutSelfSignName");

		        EditComponent ec31 = new EditComponent();
		        ec31.setEdtType("bool");
		        ec31.setCaption("����ת��");
		        ec31.setField("TransferSort");
                ec31.setColspan("5");
                
                
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
		        
		        HttpBase tre8 = HttpBase.genHttpTR("btd");
		        tre8.getElements().add(ec20.genHttpBase());
		        
		        HttpBase tre9 = HttpBase.genHttpTR("btd");
		        tre9.getElements().add(ec21.genHttpBase());
		        
		        HttpBase tre10 = HttpBase.genHttpTR("btd");
		        tre10.getElements().add(ec22.genHttpBase());
		        
		        HttpBase tre11 = HttpBase.genHttpTR("btd");
		        tre11.getElements().add(ec23.genHttpBase());
		        
		        HttpBase tre12 = HttpBase.genHttpTR("btd");
		        tre12.getElements().add(ec24.genHttpBase());
		        tre12.getElements().add(ec25.genHttpBase());
		        tre12.getElements().add(ec26.genHttpBase());
		        
		        HttpBase tre13 = HttpBase.genHttpTR("btd");
		        tre13.getElements().add(ec27.genHttpBase());
		        
		        HttpBase tre14 = HttpBase.genHttpTR("btd");
		        tre14.getElements().add(ec28.genHttpBase());
		        tre14.getElements().add(ec29.genHttpBase());
		        tre14.getElements().add(ec30.genHttpBase());
		        
		        HttpBase tre15 = HttpBase.genHttpTR("btd");
		        tre15.getElements().add(ec31.genHttpBase());

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
		        editComps.add(ec20);
		        editComps.add(ec21);
		        editComps.add(ec22);
		        editComps.add(ec23);
		        editComps.add(ec24);
		        editComps.add(ec25);
		        editComps.add(ec26);
		        editComps.add(ec27);
		        editComps.add(ec28);
		        editComps.add(ec29);
		        editComps.add(ec30);
		        editComps.add(ec31);

		        // ���ӵ��༭���б�
		        editPanels.clear();
		        editPanels.add(tre1);
		        editPanels.add(tre2);
		        editPanels.add(tre3);
		        editPanels.add(tre4);
		        editPanels.add(tre5);
		        editPanels.add(tre6);
		        editPanels.add(tre7);
		        editPanels.add(tre8);
		        editPanels.add(tre9);
		        editPanels.add(tre10);
		        editPanels.add(tre11);
		        editPanels.add(tre12);
		        editPanels.add(tre13);
		        editPanels.add(tre14);
		        editPanels.add(tre15);
		    }

		    /**
		     * setAddInfo
		     * ������Ҫ�ı༭���
		     */
		    private void setUpdateInfo() {
		        ArrayList ret = new ArrayList();
		        edt_selectSQL ="select 	a.TheSeqn, a.BillNo, a.TheDate, a.ClientCode,b.theName ClientName,a.CopartnerType,m.TheName CopartnerTypeName,a.RelTelephone, a.RelCode,  a.ClientAdd," +
        		"\n"+"a.ListNo, a.ProductCode,h.TheName ProductName,a.ProductSort,i.TheName ProductSortName,j.TheName ModelName,k.TheName SpecName,l.TheName UnitName," +
        		"\n"+"a.IsKeep,case a.IsKeep when '1' then '��' else '��' end IsKeepName,a.ServiceSortCode,g.TheName ServiceSortName,a.Quedesc, a.InHandOver, a.InSelfSign,e.TheName InSelfSignName," +
        		"\n"+"a.InDate,a.Configdesc, a.Appeardesc, a.Operdesc, a.Taskdesc, a.IsReject,case a.IsReject when '1' then '��' else '��' end IsRejectName,a.FinDate, a.CheckSign,c.TheName CheckName, a.EngineSign,d.TheName EngingName,a.ClientAttitud, a.ClientSign," +
        		"\n"+"a.OutHandOver, a.OutSelfSign,f.TheName OutSelfSignName,a.TransferSort"+
        		"\n"+ "from tbeleworkrepair a left outer join tbdatumcopartner b on a.ClientCode=b.TheCode and a.CopartnerType=b.CopartnerType" +
        		"\n"+" left outer join tbdatumemployee c on c.TheCode=a.CheckSign left outer join tbdatumemployee d on d.TheCode=a.EngineSign"+
        		"\n"+" left outer join tbdatumemployee e on e.TheCode=a.InSelfSign left outer join tbdatumemployee f on f.TheCode=a.OutSelfSign"+ 
        		
        		"\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"+ 
        		"\n" + "where b.Flag='ServiceSortCode') g on g.RowNo=a.ServiceSortCode"
				+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
				+ "\n"+ "where b.Flag='CopartnerType') m on m.RowNo=a.CopartnerType"
				+ "\n"+ "left outer join tbdatumproduct h on a.ProductCode=h.TheCode and a.Productsort=h.ProductTypecode"
				+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
				+ "\n"+ "where b.Flag='ProductTypeCode') i on i.RowNo=h.ProductTypeCode"
				+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
				+ "\n"+ "where b.Flag='ModelCode') j on j.RowNo=h.ModelCode"
				+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
				+ "\n"+ "where b.Flag='SpecCode') k on k.RowNo=h.SpecCode"
				+ "\n"+ "left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort"
				+ "\n" + "where b.Flag='UnitCode') l on l.RowNo=h.UnitCode";


		        // ���ñ༭���Ӧ����
		        editColumns.setProperty("0", "1");//billno
		        editColumns.setProperty("1", "2");
		        editColumns.setProperty("2", "3");
		        editColumns.setProperty("2d", "4");
		        editColumns.setProperty("3", "5");
		        editColumns.setProperty("3d", "6");
		        editColumns.setProperty("4", "7");
		        editColumns.setProperty("5", "8");
		        editColumns.setProperty("6", "9");
		        editColumns.setProperty("7", "10");//���к�
		        
		        editColumns.setProperty("8", "11");
		        editColumns.setProperty("8d", "12");
		        editColumns.setProperty("9", "13");
		        editColumns.setProperty("9d", "14");
		        editColumns.setProperty("10", "15");
		        editColumns.setProperty("11", "16");
		        editColumns.setProperty("12", "17");
		        
		        editColumns.setProperty("13", "18");//�Ƿ���
		        editColumns.setProperty("13d", "19");
		        editColumns.setProperty("14", "20");		        
		        editColumns.setProperty("14d", "21");//ServiceSortName
		        
		        editColumns.setProperty("15", "22");
		        editColumns.setProperty("16", "23");
		        editColumns.setProperty("17", "24");
		        editColumns.setProperty("17d", "25");
		        editColumns.setProperty("18", "26"); //����ʱ��
		        
		        editColumns.setProperty("19", "27");
		        editColumns.setProperty("20", "28");
		        editColumns.setProperty("21", "29");
		        editColumns.setProperty("22", "30");
		        
		        editColumns.setProperty("23", "31");//�Ƿ񱨷�
		        editColumns.setProperty("23d", "32");
		        editColumns.setProperty("24", "33");
		        
		        
		        editColumns.setProperty("25", "36");
		        editColumns.setProperty("25d", "37");
		        editColumns.setProperty("26", "38");
		        editColumns.setProperty("27", "39");
		        editColumns.setProperty("28", "40");
		        editColumns.setProperty("29", "41");	
		        editColumns.setProperty("29d", "42");	
		        
		        editColumns.setProperty("30", "43");
		        
		        

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
		detailSelectSQL = "select 	TheSeqn, a.BillNo, a.RowNo,a.FitCode,b.TheName ProductName, a.FitSort,c.TheName ProductSortName,d.TheName ModelName,e.TheName SpecName,f.TheName UnitName,"
				+ "\n"+ "a.Number, a.Price, a.TotalMoney, a.Remark from tbeleworkrepairitem a"
				+ "\n"+ "left outer join tbdatumproduct b on a.FitCode=b.TheCode and a.FitSort=b.ProductTypecode"
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

		Properties prop3 = new Properties();
		prop3.setProperty("title", "����");
		prop3.setProperty("data", "4");
		detailColumnsInfo.add(prop3);

		Properties prop4 = new Properties();
		prop4.setProperty("title", "�ͺ�");
		prop4.setProperty("data", "7");
		detailColumnsInfo.add(prop4);

		Properties prop5 = new Properties();
		prop5.setProperty("title", "���");
		prop5.setProperty("data", "8");
		detailColumnsInfo.add(prop5);
		
		Properties prop6 = new Properties();
		prop6.setProperty("title", "����");
		prop6.setProperty("data", "10");
		detailColumnsInfo.add(prop6);
		
		Properties prop7 = new Properties();
		prop7.setProperty("title", "���");
		prop7.setProperty("data", "11");
		detailColumnsInfo.add(prop7);
		


	}
		    private void setDetailEditComp() throws wlglException {
		    			        
		        EditComponent ec2 = new EditComponent();
		        ec2.setEdtType("Product");
		        ec2.setField("FitCode");
		        ec2.setCaption("��������");
		        ec2.setDisID("ProductName");
		        ec2.setDefDisValue("����ѡ��");
		        ec2.setMode("readonly");
		        ec2.setMustFill(true);
		        ec2.setFillCompArray("['FitSort','ModelName','SpecName','UnitName']");
		        ec2.setFillIndexArray("[1,9,5,7]");

		        EditComponent ec3 = new EditComponent();
		        ec3.setEdtType("ProductTypeCode ");
		        ec3.setField("FitSort");
		        ec3.setDisID("FitSortName");
		        ec3.setCaption("�������");
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
		        ec7.setField("Number");
		        ec7.setCaption("����");
		        ec7.setMustFill(true);
		        ec7.setMustInt(true);
		        ec7.setDefValue("0");
		        
		        EditComponent ec8 = new EditComponent();
		        ec8.setField("TotalMoney");
		        ec8.setCaption("�ܶ�");
		        ec8.setMustFill(true);
		        ec8.setMustFloat(true);
		        ec8.setDefValue("0.00");
		        ec8.setColspan("5");


		        // ���ý���ÿ������
		        HttpBase tre1 = HttpBase.genHttpTR("btd");
		        tre1.getElements().add(ec2.genHttpBase());
		        tre1.getElements().add(ec3.genHttpBase());
		        tre1.getElements().add(ec4.genHttpBase());
		        
		        HttpBase tre2 = HttpBase.genHttpTR("btd");
		        tre2.getElements().add(ec5.genHttpBase());
		        tre2.getElements().add(ec6.genHttpBase());
		        tre2.getElements().add(ec7.genHttpBase());
		        
		        HttpBase tre3 = HttpBase.genHttpTR("btd");
		        tre3.getElements().add(ec8.genHttpBase());
		        

		        // ���ӵ��༭�ؼ��б�
		        editComps.clear();
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
		    }
	 
		    private void setDetailUpdateInfo() {
		    	
		        ArrayList ret = new ArrayList();
		        detailSelectSQL =  "select 	TheSeqn, a.BillNo, a.RowNo,a.FitCode,b.TheName ProductName, a.FitSort,c.TheName ProductSortName,d.TheName ModelName,e.TheName SpecName,f.TheName UnitName,"
					+ "\n"+ "a.Number, a.Price, a.TotalMoney, a.Remark from tbeleworkrepairitem a"
					+ "\n"+ "left outer join tbdatumproduct b on a.FitCode=b.TheCode and a.FitSort=b.ProductTypecode"
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
