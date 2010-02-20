package YzSystem.J_Archive;

import java.util.*;
import YzSystem.JMain.*;

public class FrmCopartnerManage extends FrmFunctionBase {
	
	   public FrmCopartnerManage() throws wlglException {
	        Table = "tbdatumcopartner";
	        seqnField = "thecode";
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
	        }
	        try {
	            jbInit();
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }

	    /**
	     * setQueryComp
	     * ������Ҫ�Ĳ�ѯ���
	     */
	    private void setQueryComp() throws wlglException {
	        EditComponent e1 = new EditComponent("",
	                                             "���",
	                                             "a.TheCode",
	                                             "like",
	                                             "QTheCode",
	                                             "",
	                                             "",
	                                             "",
	                                             "",
	                                             "");
	        EditComponent e2 = new EditComponent("",
	                                             "����",
	                                             "a.TheName",
	                                             "like",
	                                             "QTheName",
	                                             "",
	                                             "",
	                                             "",
	                                             "",
	                                             "");

	        // ���ý����1������

	        HttpBase tr1 = HttpBase.genHttpTR("btd");
	        tr1.getElements().add(e1.genHttpBase());
	        tr1.getElements().add(e2.genHttpBase());
	        qryComps.clear();
	        qryComps.add(e1);
	        qryComps.add(e2);
	        qryPanels.clear();
	        qryPanels.add(tr1);
	    }

	    /**
	     * setQueryInfo
	     * ������Ҫ�Ĳ�ѯ��Ϣ
	     */
	    private void setQueryInfo() {
	        qry_selectSQL = "select a.TheCode, a.TheName, a.TheShortName, a.CopartnerType,c.TheName CopartnerTypeName, a.RelFax, a.RelTelephone, a.RelName, a.Remark" +
	               "\n"+ "from tbdatumcopartner a" +
	        		"\n"+"left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort" +
	           		"\n"+"where b.Flag='CopartnerType') c on c.RowNo=a.CopartnerType" ;
	        

	        qry_orderSQL = "order by a.TheCode";

	        // ����������(���ͣ����⣬��ȣ�������)
	        columnsInfo.clear();
	        Properties prop1 = new Properties();
	        columnsInfo.add(prop1);
	        prop1.setProperty("type", "radio");
	        prop1.setProperty("title", "ѡ��");
	        prop1.setProperty("width", "5%");
	        prop1.setProperty("data", "0");
	        
	        Properties prop2 = new Properties();
	        prop2.setProperty("title", "���");
	        prop2.setProperty("data", "0");
	        columnsInfo.add(prop2);

	        Properties prop3 = new Properties();
	        prop3.setProperty("title", "����");
	        prop3.setProperty("data", "1");
	        columnsInfo.add(prop3);
	        
	        Properties prop4 = new Properties();
	        prop4.setProperty("title", "���");
	        prop4.setProperty("data", "2");
	        columnsInfo.add(prop4);

	        Properties prop5 = new Properties();
	        prop5.setProperty("title", "�ͻ����");
	        prop5.setProperty("data", "4");
	        columnsInfo.add(prop5);
	        
	        Properties prop6 = new Properties();
	        prop6.setProperty("title", "����");
	        prop6.setProperty("data", "5");
	        columnsInfo.add(prop6);
	        
	        Properties prop7 = new Properties();
	        prop7.setProperty("title", "��ϵ�绰");
	        prop7.setProperty("data", "6");
	        columnsInfo.add(prop7);
	        
	        Properties prop8 = new Properties();
	        prop8.setProperty("title", "��ϵ��");
	        prop8.setProperty("data", "7");
	        columnsInfo.add(prop8);
	        
	        Properties prop9 = new Properties();
	        prop9.setProperty("title", "��ע");
	        prop9.setProperty("data", "8");
	        columnsInfo.add(prop9);


	    }

	    /**
	     * setAddComp
	     * ������Ҫ�ı༭���
	     */
	    private void setEditComp() throws wlglException {
	        EditComponent ec1 = new EditComponent();
	        ec1.setCaption("���");
	        ec1.setField("thecode");
	        ec1.setUnique(true);
	        ec1.setMustFill(true);
	        if(!mode.equals("add"))
	        {
	        	ec1.setMode("readonly");
	        }

	        EditComponent ec2 = new EditComponent();
	        ec2.setCaption("����");
	        ec2.setField("theName");
	        ec2.setUnique(true);
	        ec2.setMustFill(true);
	        
	        EditComponent ec3 = new EditComponent();
	        ec3.setCaption("���");
	        ec3.setField("TheShortName");
	        
       

	        EditComponent ec4 = new EditComponent();
	        ec4.setEdtType("CopartnerType");
	        ec4.setCaption("�ͻ����");
	        ec4.setField("CopartnerType");
	        ec4.setDisID("CopartnerTypeName");
	        
	        EditComponent ec5 = new EditComponent();
	        ec5.setCaption("����");
	        ec5.setField("RelFax");

	        EditComponent ec6 = new EditComponent();
	        ec6.setCaption("�绰");
	        ec6.setField("RelTelephone");
	        
	        EditComponent ec7 = new EditComponent();
	        ec7.setCaption("��ϵ��");
	        ec7.setField("RelName");
	        

	        EditComponent ec8 = new EditComponent();
	        ec8.setCaption("��ע");
	        ec8.setField("Remark");
	        ec8.setColspan("3");
	        ec8.setWidth("30");



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
	        
	        

	        addExtraColumns.addAll(ret);
	    }



	    /**
	     * setAddInfo
	     * ������Ҫ�ı༭���
	     */
	    private void setUpdateInfo() {
	        ArrayList ret = new ArrayList();
	       
	        edt_selectSQL = "select a.TheCode, a.TheName, a.TheShortName, a.CopartnerType,c.TheName CopartnerTypeName, a.RelFax, a.RelTelephone, a.RelName, a.Remark" +
            "\n"+ "from tbdatumcopartner a" +
    		"\n"+"left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort" +
       		"\n"+"where b.Flag='CopartnerType') c on c.RowNo=a.CopartnerType" ;
	        
	        //edt_whereSQL=" ";


	        // ���ñ༭���Ӧ����
	        editColumns.setProperty("0", "0");
	        editColumns.setProperty("1", "1");
	        editColumns.setProperty("2", "2");
	        editColumns.setProperty("3", "3");
	        editColumns.setProperty("3d", "4");
	        editColumns.setProperty("4", "5");
	        editColumns.setProperty("5", "6");
	        editColumns.setProperty("6", "7");
	        editColumns.setProperty("7", "8");

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

	    private void jbInit() throws Exception {
	    }



}
