package YzSystem.J_System;

import YzSystem.JMain.*;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;
import java.sql.*;

/**
 * <p>
 * Title:jobManage.jsp���崦�����
 * </p>
 * 
 * <p>
 * Description: ����jobManage.jsp������
 * </p>
 * 
 * <p>
 * Copyright: Copyright (c) 2005
 * </p>
 * 
 * <p>
 * Company: Ȫ��������Ϣ��������
 * </p>
 * 
 * @author qsy
 * @version 1.0 ��ʷ: 2005-04-13 ���ɴ���
 */
public class FrmGroupManage extends FrmFunctionBase{

	   public FrmGroupManage() throws wlglException {
	        super();
	        Table = "tssystemgroup";
	        seqnField = "thecode";
	        DetailTable = "tssystemgrouppower";
	        DetailSeqnField = "FunCode";
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
	        qry_selectSQL =
             "select a.TheCode, a.TheName,a.Remark "
             +" from tssystemgroup a";
	        
	        //qry_whereSQL=" a.SubjectSort='"+subjectSort+"'";

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
	        prop4.setProperty("title", "��ע");
	        prop4.setProperty("data", "2");
	        columnsInfo.add(prop4);
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
	        ec2.setWidth("30");


	        EditComponent ec3 = new EditComponent();
	        ec3.setCaption("��ע");
	        ec3.setField("Remark");
	        ec3.setWidth("110");
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
	    private void setUpdateInfo() {
	        ArrayList ret = new ArrayList();
	        edt_selectSQL ="select a.TheCode, a.TheName,a.Remark from tssystemgroup a";
	        
	        //edt_whereSQL=" a.SubjectSort='"+subjectSort+"'";


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
	    
	    //��ϸ��Ϣ
	    private void setDetailQueryInfo() {
	    	detailSelectSQL = "select a.TheCode,b.TheName GroupName, a.FunCode,c.TheName FunName, a.FunisShow, "
				+ "\n"
				+ "case a.FunisShow when '1' then '��' else '��' end FunisShowName,a.PowerValue, a.Remark"
				+ "\n"
				+ " from tssystemgrouppower a left outer join tsSystemGroup b on a.TheCode=b.TheCode"
				+ "\n"
				+ " left outer join tsSystemFunction c on a.Funcode=c.TheCode";

		// detailWhereSQL="d.flag='Sex' and f.flag='EmployeTypeCode'and
		// h.flag='CertifyTypeCode' ";

		detailOrderSQL = "order by a.FunCode ";

		// ����������(���ͣ����⣬��ȣ�������)
		detailColumnsInfo.clear();
		Properties prop1 = new Properties();
		detailColumnsInfo.add(prop1);
		prop1.setProperty("type", "radio");
		prop1.setProperty("title", "ѡ��");
		prop1.setProperty("width", "5%");
		prop1.setProperty("data", "2");

		Properties prop2 = new Properties();
		prop2.setProperty("title", "����ģ��");
		prop2.setProperty("data", "3");
		detailColumnsInfo.add(prop2);

		Properties prop3 = new Properties();
		prop3.setProperty("title", "�Ƿ���ʾ");
		prop3.setProperty("data", "5");
		detailColumnsInfo.add(prop3);

		Properties prop4 = new Properties();
		prop4.setProperty("title", "Ȩ��ֵ");
		prop4.setProperty("data", "6");
		detailColumnsInfo.add(prop4);

		Properties prop5 = new Properties();
		prop5.setProperty("title", "��ע");
		prop5.setProperty("data", "7");
		detailColumnsInfo.add(prop5);

	    }
	    private void setDetailEditComp() throws wlglException {
	        EditComponent ec1 = new EditComponent();
	        ec1.setEdtType("Function");
	        ec1.setCaption("����ģ��");
	        ec1.setField("FunCode");
	        ec1.setDisID("FunName");
	        ec1.setMustFill(true);
	        ec1.setUnique(true);
	        if(!mode.equals("add"))
	        {
	        	ec1.setMode("readonly");
	        }


	        EditComponent ec2 = new EditComponent();
	        ec2.setEdtType("bool");
	        ec2.setCaption("�Ƿ���ʾ");
	        ec2.setField("FunisShow");
	        ec2.setDisID("FunisShowName");
	        

	        EditComponent ec3 = new EditComponent();
	        ec3.setCaption("Ȩ��ֵ(��,��,��,ɾ)");
	        ec3.setField("PowerValue");

	        EditComponent ec4 = new EditComponent();
	        ec4.setCaption("��ע");
	        ec4.setField("Remark");
	        ec4.setColspan("5");
	        ec4.setWidth("100");
	        

	        // ���ý���ÿ������
	        HttpBase tre1 = HttpBase.genHttpTR("btd");
	        tre1.getElements().add(ec1.genHttpBase());
	        tre1.getElements().add(ec2.genHttpBase());
	        tre1.getElements().add(ec3.genHttpBase());
	        
	        HttpBase tre2 = HttpBase.genHttpTR("btd");
	        tre2.getElements().add(ec4.genHttpBase());

	        

	        // ���ӵ��༭�ؼ��б�
	        editComps.clear();
	        editComps.add(ec1);
	        editComps.add(ec2);
	        editComps.add(ec3);
	        editComps.add(ec4);


	        // ���ӵ��༭���б�
	        editPanels.clear();
	        editPanels.add(tre1);
	        editPanels.add(tre2);
	    }
  
	    private void setDetailUpdateInfo() {
	    	
	        ArrayList ret = new ArrayList();
	        detailSelectSQL ="select a.TheCode,b.TheName GroupName, a.FunCode,c.TheName FunName, a.FunisShow, " +
    		"\n"+"case a.FunisShow when '1' then '��' else '��' end FunisShowName,a.PowerValue, a.Remark" +
    		"\n"+" from tssystemgrouppower a left outer join tsSystemGroup b on a.TheCode=b.TheCode" +
    		"\n"+" left outer join tsSystemFunction c on a.Funcode=c.TheCode";
	        
	        
	        //edt_whereSQL="d.flag='Sex' and  f.flag='EmployeTypeCode'and  h.flag='CertifyTypeCode' ";
	        

	        detailOrderSQL = "order by a.TheCode ";


	        // ���ñ༭���Ӧ����

	        editColumns.setProperty("0", "2");
	        editColumns.setProperty("0d", "3");
	        editColumns.setProperty("1", "4");
	        editColumns.setProperty("1d", "5");
	        editColumns.setProperty("2", "6");
	        editColumns.setProperty("3", "7");
	        
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
	    
	    private void setDetailAddInfo() {
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
	        
	        
	        
	        Properties prop7 = new Properties();
	        ret.add(prop7);
	        prop7.setProperty("type", "seqn");
	        prop7.setProperty("field", "TheCode");
	        
	        

	        addExtraColumns.addAll(ret);
	    }
	    
	    
	    
	    //�����¼�
	    protected void afterAddSave(UtilDB utildb) throws wlglException {
	    		
            if (!inDetailMode) {//������ʱ�����ӱ���Ϣ.
            	String tmpSQL = "insert Into  tssystemgrouppower (TheCode,FunCode,FunisShow,PowerValue) values(?,?,?,?)";
			ArrayList paramsvalue = new ArrayList();
			try {
				utildb.exeQuery("select  TheCode from tsSystemFunction");
				while (utildb.myRs.next()) {
					
					paramsvalue.add(seqn);
					paramsvalue.add(utildb.myRs.getString(1));
					paramsvalue.add("1");
					paramsvalue.add("111111");
					utildb.exeUpdate(tmpSQL, paramsvalue);
					paramsvalue.clear();
				}
			} catch (Exception ex) {
				throw new wlglException("�Զ�����Ȩ�ޱ�ʧ��!");
				
			}
            }
	    }

	    private void jbInit() throws Exception {
	    }

}
