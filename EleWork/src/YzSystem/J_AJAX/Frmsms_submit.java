package YzSystem.J_AJAX;

import java.util.*;

import YzSystem.JMain.*;
import YzSystem.J_System.BeanLogin;

public class Frmsms_submit extends FrmFunctionBase  {
	   String userCode="";
	   public Frmsms_submit() throws wlglException {
	        Table = "tsSystemWinShortCut";
	        seqnField = "TheSeqn";
	        //�õ��û���Ϣ
	     	BeanLogin userInfo = (BeanLogin) UtilWebTools.getSession().getAttribute("userInfo");
	     		if (userInfo != null) {
	     			userCode=userInfo.getLoginSeqn();
	     		}
	        
	        
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
	        qry_selectSQL = "select a.TheSeqn, a.TheCode, a.TheName, a.PathHref, a.UserCode, a.Remark from tssystemwinshortcut a";
	        qry_whereSQL="a.UserCode='"+userCode+"'";
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
	        prop2.setProperty("data", "1");
	        columnsInfo.add(prop2);

	        Properties prop3 = new Properties();
	        prop3.setProperty("title", "����");
	        prop3.setProperty("data", "2");
	        columnsInfo.add(prop3);
	        
	        Properties prop4 = new Properties();
	        prop4.setProperty("type","winopen");
	        prop4.setProperty("title", "·��");
	        prop4.setProperty("data", "3");
	        columnsInfo.add(prop4);

	        Properties prop6 = new Properties();
	        prop6.setProperty("title", "��ע");
	        prop6.setProperty("data", "5");
	        columnsInfo.add(prop6);


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
	        ec3.setCaption("·��");
	        ec3.setField("PathHref");


	        EditComponent ec5 = new EditComponent();
	        ec5.setCaption("��ע");
	        ec5.setField("Remark");
	        ec5.setColspan("5");



	        // ���ý���ÿ������
	        HttpBase tre1 = HttpBase.genHttpTR("btd");
	        tre1.getElements().add(ec1.genHttpBase());
	        tre1.getElements().add(ec2.genHttpBase());
	        tre1.getElements().add(ec3.genHttpBase());
	        
	        HttpBase tre2 = HttpBase.genHttpTR("btd");
	        tre2.getElements().add(ec5.genHttpBase());


	        // ���ӵ��༭�ؼ��б�
	        editComps.clear();
	        editComps.add(ec1);
	        editComps.add(ec2);
	        editComps.add(ec3);
	        editComps.add(ec5);

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
	        
	        
	        // ��ݷ�ʽ�û�
	        Properties prop7 = new Properties();
	        ret.add(prop7);
	        prop7.setProperty("type", "data");
	        prop7.setProperty("field", "UserCode");
	        prop7.setProperty("value", userCode);	        
	        
	        addExtraColumns.addAll(ret);
	    }



	    /**
	     * setAddInfo
	     * ������Ҫ�ı༭���
	     */
	    private void setUpdateInfo() {
	        ArrayList ret = new ArrayList();
	        
	        edt_selectSQL ="select a.TheSeqn, a.TheCode, a.TheName, a.PathHref, a.UserCode, a.Remark from tssystemwinshortcut a";
	        
	        edt_whereSQL="a.UserCode='"+userCode+"'";
	        
	        edt_orderSQL= "order by a.TheCode";


	        // ���ñ༭���Ӧ����
	        editColumns.setProperty("0", "1");
	        editColumns.setProperty("1", "2");
	        editColumns.setProperty("2", "3");
	        editColumns.setProperty("4", "4");
       

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
	    
	    public static String GetBillNoAudit()
	    {
	    	String result="0";
	    	try{
	    	UtilDB utildb=new UtilDB();
            String tmpSQL = "select count(*) from tbeleworkrepair where CheckSign=? and TheState=? ";
			ArrayList paramsvalue = new ArrayList();
			paramsvalue.add("001");
			paramsvalue.add("1");
			ArrayList al=utildb.exeQueryOneRow(tmpSQL, paramsvalue);
			result=al.get(0).toString();
			
	    	}catch(Exception ex)
	    	{
	    		System.out.print("failed");
	    	}
	    	return result;
	    }

}
