package YzSystem.J_Subject;

import java.util.*;

import YzSystem.JMain.*;

public class FrmSubjectMain extends FrmFunctionBase {
	private String subjectSort="";

	   public FrmSubjectMain() throws wlglException
	   {
		super();
		Table = "tssystemrecord";
		seqnField = "TheCode";
		DetailTable = "tssystemsubjectrecord";
		DetailSeqnField = "RowNo";
		pageType = "masterDetail";

		subjectSort = UtilWebTools.getRequestParameter("tseqn");
		if (!inDetailMode) {
			// =========================��ѯ����==============================================
			if (mode.equals("query")) {
				// ���ò�ѯ���
				setQueryComp();
				// ���ò�ѯ��Ϣ
				setQueryInfo();
			}
			// =========================�������==============================================
			// ����������
			if (mode.equals("add")) {
				setUpdateComp();
				setAddInfo();
			}
			// =========================�޸�����==============================================
			// �����޸����
			if (mode.equals("edit")) {
				setUpdateComp();
				setUpdateInfo();
				setDetailQueryInfo();
			}
		} else {
			// =========================�������==============================================

			setDetailEditComp();
			// ����������
			if (mode.equals("add")) {
				setDetailAddInfo();
			}
			// =========================�޸�����==============================================
			// �����޸����
			if (mode.equals("edit")) {
				setDetailUpdateInfo();
			}
		}
	}


	    /**
		 * setQueryComp ������Ҫ�Ĳ�ѯ���
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
	    private void setQueryInfo() {
	        qry_selectSQL =
                "select a.TheCode, a.TheName, a.SubjectSort,b.TheName SubjectName,a.flag,a.Remark "
                +" from tssystemrecord a"
                +" left outer join tssystemfunction b on a.SubjectSort=b.TheCode";
	        
	        qry_whereSQL=" a.SubjectSort='"+subjectSort+"'";

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
	        prop2.setProperty("title", "���");
	        prop2.setProperty("data", "0");
	        columnsInfo.add(prop2);

	        Properties prop3 = new Properties();
	        prop3.setProperty("title", "����");
	        prop3.setProperty("data", "1");
	        columnsInfo.add(prop3);
	        
	        Properties prop4 = new Properties();
	        prop4.setProperty("title", "��Ŀ���");
	        prop4.setProperty("data", "3");
	        columnsInfo.add(prop4);
	        
	        Properties prop6 = new Properties();
	        prop6.setProperty("title", "���");
	        prop6.setProperty("data", "4");
	        columnsInfo.add(prop6);



	        Properties prop5 = new Properties();
	        prop5.setProperty("title", "��ע");
	        prop5.setProperty("data", "5");
	        columnsInfo.add(prop5);
	    }
	    /**
	     * setAddComp
	     * ������Ҫ�ı༭���
	     */
	    private void setUpdateComp() throws wlglException {
	        EditComponent ec1 = new EditComponent();
	        ec1.setCaption("���");
	        ec1.setField("thecode");
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
	        ec3.setField("flag");
	        ec3.setWidth("30");


	        EditComponent ec4 = new EditComponent();
	        ec4.setCaption("��ע");
	        ec4.setField("Remark");
	        ec4.setWidth("30");
	        ec4.setColspan("5");
	        
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
	        
	        

	        
	        //��Ŀ���
	        Properties prop7 = new Properties();
	        ret.add(prop7);
	        prop7.setProperty("type", "data");
	        prop7.setProperty("field", "SubjectSort");
	        prop7.setProperty("value", subjectSort);

	        
	        addExtraColumns.addAll(ret);
 
	    }



	    
	    
	    /**
	     * setAddInfo
	     * ������Ҫ�ı༭���
	     */
	    private void setUpdateInfo() {
	        ArrayList ret = new ArrayList();
	        edt_selectSQL ="select a.TheCode, a.TheName, a.flag, a.Remark," +
	        		  "\n"+"a.Stater,a.StateTime,a.Editer,a.EditeTime from tssystemrecord a";
	        
	        edt_whereSQL=" a.SubjectSort='"+subjectSort+"'";


	        // ���ñ༭���Ӧ����
	        editColumns.setProperty("0", "0");
	        editColumns.setProperty("1", "1");
	        editColumns.setProperty("2", "2");
	        editColumns.setProperty("3", "3"); 

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
	    
	    //��ϸ
	    
	    /**
	     * setQueryInfo
	     * ������Ҫ�Ĳ�ѯ��Ϣ
	     */
	    private void setDetailQueryInfo() {

	    	detailSelectSQL  =
                "select a.TheCode,c.TheName RecordName, a.RowNo,a.TheName, a.SubjectSort,b.TheName SubjectName,a.RemarkItem "
                +" from tssystemsubjectrecord a"
                +" left outer join tssystemfunction b on a.SubjectSort=b.TheCode"+
                "\n"+" left outer join tssystemrecord c on a.TheCode=c.TheCode  and a.SubjectSort=c.SubjectSort";
        
	    	detailWhereSQL =" a.SubjectSort='"+subjectSort+"'";

	    	detailOrderSQL  = "order by a.TheName desc ";
	    	

	        // ����������(���ͣ����⣬��ȣ�������)
	        //columnsInfo.clear();
	        detailColumnsInfo.clear();
	        Properties prop1 = new Properties();
	        detailColumnsInfo.add(prop1);
	        prop1.setProperty("type", "radio");
	        prop1.setProperty("title", "ѡ��");
	        prop1.setProperty("width", "5%");
	        prop1.setProperty("data", "2");
	        
	        Properties prop2 = new Properties();
	        prop2.setProperty("title", "���");
	        prop2.setProperty("data", "2");
	        detailColumnsInfo.add(prop2);

	        Properties prop3 = new Properties();
	        prop3.setProperty("title", "����");
	        prop3.setProperty("data", "3");
	        detailColumnsInfo.add(prop3);

	        Properties prop6 = new Properties();
	        prop6.setProperty("title", "��ע");
	        prop6.setProperty("data", "6");
	        detailColumnsInfo.add(prop6);
	    }
	    
	    private void setDetailEditComp() throws wlglException {

	        EditComponent ec1 = new EditComponent();
	        ec1.setField("TheName");
	        ec1.setCaption("����");
	        ec1.setMustFill(true);
	  

	        EditComponent ec2 = new EditComponent();
	        ec2.setField("RemarkItem");
	        ec2.setCaption("��ע");
	        ec2.setWidth("50");
	        ec2.setColspan("5");

	        HttpBase tre1 = HttpBase.genHttpTR("btd");
	        tre1.getElements().add(ec1.genHttpBase());
	        tre1.getElements().add(ec2.genHttpBase());


	        // ���ӵ��༭�ؼ��б�
	        editComps.clear();
	        editComps.add(ec1);
	        editComps.add(ec2);

	        // ���ӵ��༭���б�
	        editPanels.clear();
	        editPanels.add(tre1);
	    }
	    
	    /**
	     * setAddInfo
	     * ������Ҫ�ı༭���
	     */
	    private void setDetailUpdateInfo() {
	        ArrayList ret = new ArrayList();
	        detailSelectSQL = "select a.TheCode,c.TheName RecordName, a.RowNo,a.TheName, a.SubjectSort,b.TheName SubjectName,a.RemarkItem "
                +" from tssystemsubjectrecord a"
                +" left outer join tssystemfunction b on a.SubjectSort=b.TheCode"+
                "\n"+" left outer join tssystemrecord c on a.TheCode=c.TheCode  and a.SubjectSort=c.SubjectSort";
	    	detailWhereSQL =" a.SubjectSort='"+subjectSort+"'";

	    	detailOrderSQL  = "order by a.TheCode ";

	        
	        // ���ñ༭���Ӧ����
	        editColumns.setProperty("0", "3");
	        editColumns.setProperty("1", "6");
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
	        prop2.setProperty("field", "TheCode");
	        
	        Properties prop3 = new Properties();
	        ret.add(prop3);
	        prop3.setProperty("type", "data");
	        prop3.setProperty("field", "SubjectSort");
	        prop3.setProperty("value", subjectSort);
	        
	        addExtraColumns.addAll(ret);
	    }

	    protected void doDelete(String atable, String aseqnfield, String aseqn)
			throws wlglException {

	        UtilDB utilDB = new UtilDB();
	        utilDB.beginTransaction();
	        try {
	            if (inDetailMode) {
	                beforeDelete(utilDB);
	                String tmpSQL =
	                        "delete from " + DetailTable + " where " +
	                        DetailSeqnField + " ='" +
	                        detailseqn + "'  and "+seqnField+"='"+seqn+"'" +" and SubjectSort='"+subjectSort+"'";
	                utilDB.exeUpdate(tmpSQL);
	                afterDelete(utilDB);
	                utilDB.commit();
	                utilDB.closeCon();

	            } else {
	                beforeDelete(utilDB);
	                String tmpSQL = "";
	                if (pageType.equals("masterDetail")) {
	                    tmpSQL =
	                            "delete from " + DetailTable + " where " +
	                            seqnField + "='" +seqn + "' "+" and SubjectSort='"+subjectSort+"'";
	                    utilDB.exeUpdate(tmpSQL);
	                }
	                tmpSQL = "delete from " + Table + " where " + seqnField +
	                         "='" +seqn + "' "+" and SubjectSort='"+subjectSort+"'";
	                utilDB.exeUpdate(tmpSQL);
	                afterDelete(utilDB);
	                utilDB.commit();
	                utilDB.closeCon();
	            }
	        } catch (wlglException ex) {
	            utilDB.rollback();
	            utilDB.closeCon();
	            throw ex;
	        }
	}


	    private void jbInit() throws Exception {
	    }
}
