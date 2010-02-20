package YzSystem.J_System;

import java.util.ArrayList;
import java.util.Properties;

import YzSystem.JMain.EditComponent;
import YzSystem.JMain.FrmFunctionBase;
import YzSystem.JMain.HttpBase;
import YzSystem.JMain.UtilDB;
import YzSystem.JMain.UtilWLGLFactory;
import YzSystem.JMain.UtilWebFactory;
import YzSystem.JMain.UtilWebTools;
import YzSystem.JMain.wlglException;

public class FrmFlowManage extends FrmFunctionBase {

	    public FrmFlowManage() throws wlglException {
	        super();

	        // ����ҳ�����
	        Table = "tbstorageflow";
	        seqnField = "BillNo";
	        DetailTable = "tbStorageFlowItem";
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
	        EditComponent e1 = new EditComponent("",
	                                             "���̱��",
	                                             "a.BillNo",
	                                             "like",
	                                             "QBillNo",
	                                             "",
	                                             "",
	                                             "",
	                                             "",
	                                             "");
	        //e1.setMode("readonly");
	        EditComponent e2 = new EditComponent("",
	                                             "��������",
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
	        qry_selectSQL = "select a.BillNo, a.TheName, a.Remark from tbstorageflow a";
	        
	       // qry_whereSQL = " TheCode='" +
	       //            billType + "' ";

	        qry_orderSQL = "order by a.BillNo ";

	        // ����������(���ͣ����⣬��ȣ�������)
	        columnsInfo.clear();
	        Properties prop1 = new Properties();
	        columnsInfo.add(prop1);
	        prop1.setProperty("type", "radio");
	        prop1.setProperty("title", "ѡ��");
	        prop1.setProperty("width", "5%");
	        prop1.setProperty("data", "0");

	        Properties prop2 = new Properties();
	        prop2.setProperty("title", "���̱��");
	        prop2.setProperty("data", "0");
	        columnsInfo.add(prop2);

	        Properties prop3 = new Properties();
	        prop3.setProperty("title", "��������");
	        prop3.setProperty("data", "1");
	        columnsInfo.add(prop3);

	        Properties prop4 = new Properties();
	        prop4.setProperty("title", "��ע");
	        prop4.setProperty("data", "2");
	        columnsInfo.add(prop4); 

	    }

	    /**
	     * setAddComp
	     * ������Ҫ�ı༭���
	     */
	    protected void setUpdateComp() throws wlglException {
	        editPanels.clear();
	     
	        EditComponent ec1 = new EditComponent();
	        ec1.setCaption("���");
	        ec1.setField("billno");
	        ec1.setUnique(true);
	        ec1.setMustFill(true);
	        if(!mode.equals("add"))
	        {
	        	ec1.setMode("readonly");
	        }


	        EditComponent ec2 = new EditComponent();
	        ec2.setCaption("����");
	        ec2.setField("TheName");
	        ec2.setMustFill(true);
	        
	        EditComponent ec3 = new EditComponent();
	        ec3.setCaption("��ע");
	        ec3.setField("Remark");
	        ec3.setWidth("180");
	        ec3.setColspan("5");

	        // ���ý���ÿ������
	        HttpBase tre1 = HttpBase.genHttpTR("btd");
	        tre1.getElements().add(ec1.genHttpBase());
	        tre1.getElements().add(ec2.genHttpBase());

	        
	        HttpBase tre2 = HttpBase.genHttpTR("btd");
	        tre2.getElements().add(ec3.genHttpBase());

	        // ���ӵ��༭�ؼ��б�
	        editComps.clear();
	        editComps.add(ec1);
	        editComps.add(ec2);
	        editComps.add(ec3);
	        
	        // ���ӵ��༭���б�
	        editPanels.clear();
	        editPanels.add(tre1);
	        editPanels.add(tre2);

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
	    protected void setUpdateInfo() {
	        ArrayList ret = new ArrayList();
	        
	        edt_selectSQL ="select a.BillNo, a.TheName, a.Remark from tbstorageflow a";

	        //edt_whereSQL =
	        //        " TheCode='" +
	         //       billType + "' ";    
	        // ���ñ༭���Ӧ����
	        editColumns.setProperty("0", "0");
	        editColumns.setProperty("1", "1");
	        editColumns.setProperty("2", "2");

	   
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
	    /**
	     * setDetailInfo
	     * ���������Ϣ
	     */
	    private void setDetailQueryInfo() {
	        // ������
	        detailSelectSQL = "select 	a.BillNo, a.RowNo, a.TheName, a.ArrayChildRowNo,a.IsFlowMust ,case a.IsFlowMust when '1' then '��' else '��' end IsFlowMustName," +
	        		"\n"+"a.IsSameDep,case a.IsSameDep when '1' then '��' else '��' end IsSameDepName, a.IsFlowers,case a.IsFlowers when '1' then '��' else '��'" +
	        		"\n"+"end IsFlowersName,a.ApproveCodeArray,a.ApproveCodeArray ApproveNameArray, a.remarkitem from tbstorageflowitem a";
	        //detailWhereSQL =" "; // �������
	        detailOrderSQL = " order by a.RowNo"; // �������

	        // ����������(���ͣ����⣬��ȣ�������)
	        detailColumnsInfo.clear();
	        Properties prop1 = new Properties();
	        prop1.setProperty("title", "ѡ��");
	        prop1.setProperty("type", "radio");
	        prop1.setProperty("data", "1");
	        detailColumnsInfo.add(prop1);

	        Properties prop2 = new Properties();
	        prop2.setProperty("title", "���ڱ��");
	        prop2.setProperty("data", "1");
	        detailColumnsInfo.add(prop2);

	        Properties prop3 = new Properties();
	        prop3.setProperty("title", "��������");
	        prop3.setProperty("data", "2");
	        detailColumnsInfo.add(prop3);

	        Properties prop4 = new Properties();
	        prop4.setProperty("title", "�����Ƿ����");
	        prop4.setProperty("data", "5");
	        detailColumnsInfo.add(prop4);
	      
	        Properties prop5 = new Properties();
	        prop5.setProperty("title", "�Ƿ�ɿ粿��");
	        prop5.setProperty("data", "7");
	        detailColumnsInfo.add(prop5);
	        
	        Properties prop6 = new Properties();
	        prop6.setProperty("title", "�Ƿ������");
	        prop6.setProperty("data", "9");
	        detailColumnsInfo.add(prop6);
	        
	        Properties prop7 = new Properties();
	        prop7.setProperty("title", "������Ա");
	        prop7.setProperty("data", "10");
	        detailColumnsInfo.add(prop7);

	        Properties prop11 = new Properties();
	        prop11.setProperty("title", "��ע");
	        prop11.setProperty("data", "12");
	        detailColumnsInfo.add(prop11);
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


	    /**
	     * setDetailAddComp
	     * ������Ҫ�ı༭���
	     */
	    private void setDetailEditComp() throws wlglException {

	        EditComponent ec1 = new EditComponent();
	        ec1.setField("TheName");
	        ec1.setCaption("��������");
	        ec1.setMustFill(true);


	        EditComponent ec2 = new EditComponent();
	        ec2.setEdtType("bool");
	        ec2.setField("IsFlowMust");
	        ec2.setDisID("IsFlowMustName");
	        ec2.setCaption("�����Ƿ����");

	        EditComponent ec3 = new EditComponent();
	        ec3.setEdtType("bool");
	        ec3.setField("IsSameDep");
	        ec3.setDisID("IsSameDepName");
	        ec3.setCaption("�Ƿ�ɿ粿��");


	        EditComponent ec4 = new EditComponent();
	        ec4.setEdtType("bool");
	        ec4.setField("IsFlowers");
	        ec4.setDisID("IsFlowersName");
	        ec4.setCaption("�Ƿ������");
	        
	        EditComponent ec5 = new EditComponent();
	        ec5.setEdtType("EmployeeEx");
	        ec5.setField("ApproveCodeArray");
	        ec5.setDisID("ApproveNameArray");
	        ec5.setCaption("������Ա");
	        ec5.setDefDisValue("����ѡ��");
	        ec5.setMode("readonly");
	        ec5.setColspan("3");


	        EditComponent ec6 = new EditComponent();
	        ec6.setField("remarkitem");
	        ec6.setCaption("��ע");
	        ec6.setColspan("5");
	        ec6.setWidth("120");

	        HttpBase tre1 = HttpBase.genHttpTR("btd");
	        tre1.getElements().add(ec1.genHttpBase());
	        tre1.getElements().add(ec2.genHttpBase());
	        tre1.getElements().add(ec3.genHttpBase());


	        HttpBase tre2 = HttpBase.genHttpTR("btd");
	        tre2.getElements().add(ec4.genHttpBase());
	        tre2.getElements().add(ec5.genHttpBase());
        
	        
	        HttpBase tre3 = HttpBase.genHttpTR("btd");
	        tre3.getElements().add(ec6.genHttpBase());      
	        
	        // ���ӵ��༭�ؼ��б�
	        editComps.clear();
	        editComps.add(ec1);
	        editComps.add(ec2);
	        editComps.add(ec3);
	        editComps.add(ec4);
	        editComps.add(ec5);
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
	        detailSelectSQL =  "select 	a.BillNo, a.RowNo, a.TheName, a.ArrayChildRowNo,a.IsFlowMust ,case a.IsFlowMust when '1' then '��' else '��' end IsFlowMustName," +
	        		"\n"+"a.IsSameDep,case a.IsSameDep when '1' then '��' else '��' end IsSameDepName, a.IsFlowers,case a.IsFlowers when '1' then '��' else '��'" +
	        		"\n"+"end IsFlowersName,''  ApproveCodeArray,'' ApproveNameArray,a.remarkitem from tbstorageflowitem a";
	        //detailWhereSQL =
	          //      "  TheCode='" +
	           //     billType + "'  ";

	        
	        // ���ñ༭���Ӧ����
	        editColumns.setProperty("0", "2");
	        editColumns.setProperty("1", "4");
	        editColumns.setProperty("1d", "5");
	        editColumns.setProperty("2", "6");
	        editColumns.setProperty("2d", "7");
	        editColumns.setProperty("3", "8");
	        editColumns.setProperty("3d", "9");
	        editColumns.setProperty("4", "10");
	        editColumns.setProperty("4d", "11");
	        editColumns.setProperty("5", "12");
	        // ���ø��ӵ��޸�������(���ͣ����⣬��ȣ�������)
	        ret.clear();
	        /*
	        Properties prop5 = new Properties();
	        prop5.setProperty("type", "comp");
	        prop5.setProperty("field", "realamount");
	        prop5.setProperty("comp", "oughtamount");
	        ret.add(prop5);
	        */

	        addExtraColumns.addAll(ret);
	    }

	    protected String validate() throws wlglException {
	        // Ĭ��У��
	        String val = super.validate();
	        if (!val.equals("")) {
	            return val;
	        }
	        // У���Ƿ��Ʒ�ظ�
	        if (inDetailMode) {
	            UtilDB utilDB = new UtilDB();

	          ArrayList param = new ArrayList();
	          param.add(UtilWebTools.getRequestParameter("BillNo"));
	          param.add(UtilWebTools.getRequestParameter("ProductCode"));
	          int count = 0;

	              ArrayList rs = utilDB.exeQueryOneRow(
	                      "select count(*) from tbstorageapplyitem "
	                      + " where BillNo=? and ProductCode=? ", param);
	              count = Integer.parseInt((String) rs.get(0));

	          utilDB.closeCon();

	          if (count > 0) {
	              val = "����Ʒ��ѡ��,������ѡ���ظ�����Ʒ!";
	          }


	        }
	        return val;
	    }
}
