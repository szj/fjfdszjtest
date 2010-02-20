package YzSystem.J_System;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.http.HttpSession;

import YzSystem.JMain.EditComponent;
import YzSystem.JMain.FrmFunctionBase;
import YzSystem.JMain.HttpBase;
import YzSystem.JMain.UtilCommon;
import YzSystem.JMain.UtilDB;
import YzSystem.JMain.UtilWebFactory;
import YzSystem.JMain.UtilWebTools;
import YzSystem.JMain.UtilEJB2Local;
import YzSystem.JMain.wlglException;


public class FrmGroupUserManage extends FrmFunctionBase{
 
	   public FrmGroupUserManage() throws wlglException {
	        Table = "tssystemgroupuser";
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
	        qry_selectSQL =
            "select a.TheCode, a.TheName, a.GroupCode,b.TheName GroupName, a.EmployeCode,c.TheName EmployeName,a.PassWd,a.Remark" +
            "\n"+" from tssystemgroupuser a left outer join tssystemgroup b on a.Groupcode=b.thecode" +
            "\n"+" left outer join tbdatumemployee c on a.EmployeCode=c.TheCode";
	        
	        //qry_whereSQL=" a.SubjectSort='"+subjectSort+"'";

	        qry_orderSQL = "order by a.TheName desc ";

	        // ����������(���ͣ����⣬��ȣ�������)
	        columnsInfo.clear();
	        Properties prop1 = new Properties();
	        columnsInfo.add(prop1);
	        prop1.setProperty("type", "radio");
	        prop1.setProperty("title", "ѡ��");
	        prop1.setProperty("width", "5%");
	        prop1.setProperty("data", "0");
	        
	        Properties prop2 = new Properties();
	        prop2.setProperty("title", "�û����");
	        prop2.setProperty("data", "0");
	        columnsInfo.add(prop2);

	        Properties prop3 = new Properties();
	        prop3.setProperty("title", "�û�����");
	        prop3.setProperty("data", "1");
	        columnsInfo.add(prop3);
	        
	        Properties prop4 = new Properties();
	        prop4.setProperty("title", "��ɫ��");
	        prop4.setProperty("data", "3");
	        columnsInfo.add(prop4);
	        
	        Properties prop5 = new Properties();
	        prop5.setProperty("title", "Ա������");
	        prop5.setProperty("data", "5");
	        columnsInfo.add(prop5);
	        
	        Properties prop6 = new Properties();
	        prop6.setProperty("title", "��ע");
	        prop6.setProperty("data", "7");
	        columnsInfo.add(prop6);
	        
	    }

	    /**
	     * setAddComp
	     * ������Ҫ�ı༭���
	     */
	    private void setEditComp() throws wlglException {
	        EditComponent ec1 = new EditComponent();
	        ec1.setCaption("�û����");
	        ec1.setField("thecode");
	        ec1.setUnique(true);
	        ec1.setMustFill(true);
	        if(!mode.equals("add"))
	        {
	        	ec1.setMode("readonly");
	        }
	        
	        EditComponent ec2 = new EditComponent();
	        ec2.setCaption("�û�����");
	        ec2.setField("theName");
	        ec2.setUnique(true);
	        ec2.setMustFill(true);
	        
	        EditComponent ec3 = new EditComponent();
	        ec3.setEdtType("Group");
	        ec3.setField("GroupCode");
	        ec3.setCaption("��ɫ����");
	        ec3.setDisID("GroupName");
	        ec3.setDefDisValue("����ѡ��");
	        ec3.setMode("readonly");
	        
	        EditComponent ec4 = new EditComponent();
	        ec4.setEdtType("Employee");
	        ec4.setCaption("Ա������");
	        ec4.setField("EmployeCode");
	        ec4.setDisID("EmployeName");
	        ec4.setDefDisValue("����ѡ��");
	        ec4.setMode("readonly");
	        
	        EditComponent ec5 = new EditComponent();
	        ec5.setCaption("��ע");
	        ec5.setField("Remark");
	        ec5.setWidth("50");
	        ec5.setColspan("5");
	        
	        // ���ý���ÿ������
	        HttpBase tre1 = HttpBase.genHttpTR("btd");
	        tre1.getElements().add(ec1.genHttpBase());
	        tre1.getElements().add(ec2.genHttpBase());

	        
	        HttpBase tre2 = HttpBase.genHttpTR("btd");
	        tre2.getElements().add(ec3.genHttpBase());
	        tre2.getElements().add(ec4.genHttpBase());
	        
	        // ���ý���ÿ������
	        HttpBase tre3 = HttpBase.genHttpTR("btd");
	        tre3.getElements().add(ec5.genHttpBase());


	        // ���ӵ��༭�ؼ��б�
	        editComps.clear();
	        editComps.add(ec1);
	        editComps.add(ec2);
	        editComps.add(ec3);
	        editComps.add(ec4);
	        editComps.add(ec5);

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
	        
	        // ��ʼ������
	        Properties prop7 = new Properties();
	        ret.add(prop7);
	        prop7.setProperty("type", "data");
	        prop7.setProperty("field", "PassWd");
	        prop7.setProperty("value", "111111");

	        addExtraColumns.addAll(ret);
	    }



	    /**
	     * setAddInfo
	     * ������Ҫ�ı༭���
	     */
	    private void setUpdateInfo() {
	        ArrayList ret = new ArrayList();
	        edt_selectSQL = "select a.TheCode, a.TheName, a.GroupCode,b.TheName GroupName, a.EmployeCode,c.TheName EmployeName,a.PassWd,a.Remark" +
            "\n"+" from tssystemgroupuser a left outer join tssystemgroup b on a.Groupcode=b.thecode" +
            "\n"+" left outer join tbdatumemployee c on a.EmployeCode=c.TheCode";
	        //edt_whereSQL=" a.SubjectSort='"+subjectSort+"'";


	        // ���ñ༭���Ӧ����
	        editColumns.setProperty("0", "0");
	        editColumns.setProperty("1", "1");
	        editColumns.setProperty("2", "2");
	        editColumns.setProperty("2d", "3");
	        editColumns.setProperty("3", "4");
	        editColumns.setProperty("3d", "5");
	        editColumns.setProperty("4", "7");

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

	    private void jbInit() throws Exception {
	    }
	    
	    
	    /**
	     * doModifyPwd
	     * ���ܣ��޸ı�Ա������.
	     * @param
	     * @return modifyPwdCode
	     */
	    public String doModifyPwd() throws wlglException {
	        String oldpwd = UtilWebTools.getRequestParameter("oldpwd");
	        String newpwd = UtilWebTools.getRequestParameter("newpwd");
	        HttpSession session = UtilWebTools.getSession();
	        String logoinseqn;
	        BeanLogin userinfo = ((BeanLogin) session.getAttribute(
	                "userInfo"));
	        logoinseqn = userinfo.getLoginSeqn();
	        UtilDB utilDB = new UtilDB();
	        try {
	            ResultSet rs = null;
	            ArrayList myParams = new ArrayList();
	            myParams.add(logoinseqn);
	            myParams.add(oldpwd);
	            rs = utilDB.exeQuery(
	                    "select * from tsSystemGroupUser where TheCode=? and passwd=?",
	                    myParams);
	            if (rs.next()) {
	                myParams.clear();
	                myParams.add(newpwd);
	                myParams.add(logoinseqn);
	                utilDB.exeUpdate(
	                        "update tsSystemGroupUser set passwd=? where TheCode=?",
	                        myParams);
	                modifyPwdCode = "true";
	            } else {
	                modifyPwdCode = "error";
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            utilDB.closeCon();
	        }
	        return modifyPwdCode;
	    }
	    
	    private String modifyPwdCode; //�޸�����return Code
		   

		/**
		 * @param modifyPwdCode the modifyPwdCode to set
		 */
		public void setModifyPwdCode(String modifyPwdCode) {
			this.modifyPwdCode = modifyPwdCode;
		}

		/**
		 * @return the modifyPwdCode
		 */
		public String getModifyPwdCode() {
			return modifyPwdCode;
		}
		
	    public String doPrint() throws wlglException {
	    	String ReturnStr="";
	    	ReturnStr = "alert('��ӡ!');\n"
                + "self.location.href='" + "/main/function_print.faces" +
                findparam + "&ReportName='Groupuser.jasper';";
	    	return ReturnStr;
	    }

}
