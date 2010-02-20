
//Ѳ��
package YzSystem.J_Elework;

import java.util.ArrayList;
import java.util.Properties;

import YzSystem.JMain.EditComponent;
import YzSystem.JMain.FrmFunctionBase;
import YzSystem.JMain.HttpBase;
import YzSystem.JMain.UtilDB;
import YzSystem.JMain.wlglException;

public class Frmpatrol extends FrmFunctionBase {
    public String billType = "1004";
    public String pre = "XJ";
	
	   public Frmpatrol() throws wlglException {
	        super();
	        Table = "tbeleworkpatrol";
	        seqnField = "billno";
	        DetailTable = "tbeleworkpatrolitem";
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
	        qry_selectSQL ="select a.TheSeqn, a.BillNo, a.TheDate, a.ClientCode,b.TheName ClientName," +
	        		"\n"+" a.CopartnerType, a.PatrolDate, a.CheckSign, c.TheName CheckSignName,a.EngineSign," +
	        		"\n"+"d.TheName EngineSignName, a.ClientSign, a.ClientAttitud, a.BillSortCode " +
	        		"\n"+ "from tbeleworkpatrol a left outer join tbdatumcopartner b on a.ClientCode=b.TheCode and a.CopartnerType=b.CopartnerType" +
	        		"\n"+" left outer join tbdatumemployee c on a.CheckSign=c.TheCode" +
	        		"\n"+"left outer join tbdatumemployee d on a.EngineSign=d.Thecode";

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

	        
	        Properties prop4 = new Properties();
	        prop4.setProperty("title", "�ͻ�");
	        prop4.setProperty("data", "4");
	        columnsInfo.add(prop4);
	        
	        Properties prop5 = new Properties();
	        prop5.setProperty("title", "Ѳ������");
	        prop5.setProperty("data", "6");
	        columnsInfo.add(prop5);
	        
	        
	        Properties prop6 = new Properties();
	        prop6.setProperty("title", "Ѳ����Ա");
	        prop6.setProperty("data", "10");
	        columnsInfo.add(prop6);
	        
	        Properties prop7 = new Properties();
	        prop7.setProperty("title", "֧��ǩ��");
	        prop7.setProperty("data", "11");
	        columnsInfo.add(prop7);
	        
	        Properties prop8 = new Properties();
	        prop8.setProperty("title", "֧�ֽ���");
	        prop8.setProperty("data", "12");
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
	        ec2.setEdtType("Client");
	        ec2.setField("ClientCode");
	        ec2.setCaption("�ͻ�����");
	        ec2.setDisID("ClientName");
	        ec2.setDefDisValue("����ѡ��");
	        ec2.setMode("readonly");
	        ec2.setMustFill(true);
	        ec2.setFillCompArray("['CopartnerType','CopartnerTypeName']");
	        ec2.setFillIndexArray("[1,4]");      
        
	        EditComponent ec3 = new EditComponent();
	        ec3.setEdtType("CopartnerType");
	        ec3.setField("CopartnerType");
	        ec3.setCaption("�ͻ����");
	        ec3.setDisID("CopartnerTypeName");
	        ec3.setDefDisValue("����ѡ��");
	        ec3.setMode("readonly");
	        
	        
	        EditComponent ec4 = new EditComponent();
	        ec4.setEdtType("date");
	        ec4.setCaption("Ѳ������");
	        ec4.setField("PatrolDate");
	        ec4.setMode("readonly");
	        ec4.setMustFill(true);

	        


	        EditComponent ec5 = new EditComponent();
	        ec5.setEdtType("Employee");
	        ec5.setCaption("Ѳ����Ա");
	        ec5.setField("EngineSign");
	        ec5.setDisID("EngineSignName");
	        ec5.setDefDisValue("����ѡ��");
	        ec5.setMode("readonly");
	        
	        
	        EditComponent ec6 = new EditComponent();
	        ec6.setCaption("֧��ǩ��");
	        ec6.setField("ClientSign");

	        EditComponent ec7= new EditComponent();
	        ec7.setEdtType("textarea");
	        ec7.setCaption("����");
	        ec7.setField("ClientAttitud");
	        ec7.setColspan("5");

	        
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


	        // ���ӵ��༭�ؼ��б�
	        editComps.clear();
	        editComps.add(ec1);
	        editComps.add(ec2);
	        editComps.add(ec3);
	        editComps.add(ec4);
	        editComps.add(ec5);
	        editComps.add(ec6);
	        editComps.add(ec7);

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
	    private void setUpdateInfo() {
	        ArrayList ret = new ArrayList();
	        edt_selectSQL ="select a.TheSeqn, a.BillNo, a.TheDate, a.ClientCode,b.TheName ClientName," +
    		"\n"+" a.CopartnerType, a.PatrolDate, a.CheckSign, c.TheName CheckSignName,a.EngineSign," +
    		"\n"+"d.TheName EngineSignName, a.ClientSign, a.ClientAttitud, a.BillSortCode " +
    		"\n"+ "from tbeleworkpatrol a left outer join tbdatumcopartner b on a.ClientCode=b.TheCode and a.CopartnerType=b.CopartnerType" +
    		"\n"+" left outer join tbdatumemployee c on a.CheckSign=c.TheCode" +
    		"\n"+"left outer join tbdatumemployee d on a.EngineSign=d.Thecode";


	        // ���ñ༭���Ӧ����
	        editColumns.setProperty("0", "1");
	        editColumns.setProperty("1", "3");
	        editColumns.setProperty("1d", "4");
	        editColumns.setProperty("2", "5");
	        editColumns.setProperty("3", "6");
	        editColumns.setProperty("4", "9");
	        editColumns.setProperty("4d", "10");
	        editColumns.setProperty("5", "11");
	        editColumns.setProperty("6", "12");

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
	    	detailSelectSQL = "select a.BillNo, a.RowNo, a.ProjectCode,c.theName ProjectName ,a.PatrolCode," +
	    			"\n"+"b.PatrolContent, a.IsNormal,case a.IsNormal when '1' then '��' else '��' end IsNormalName, a.Abnordesc from tbeleworkpatrolitem a" +
	    			"\n"+"left outer join tbpatrolreportitem b on a.ProjectCode=b.thecode and a.PatrolCode=b.Rowno" +
	    			"\n"+"left outer join tbpatrolreport c on a.ProjectCode=c.thecode ";

		detailOrderSQL = "order by a.RowNo ";

		// ����������(���ͣ����⣬��ȣ�������)
		detailColumnsInfo.clear();
		Properties prop1 = new Properties();
		detailColumnsInfo.add(prop1);
		prop1.setProperty("type", "radio");
		prop1.setProperty("title", "ѡ��");
		prop1.setProperty("width", "5%");
		prop1.setProperty("data", "1");

		Properties prop2 = new Properties();
		prop2.setProperty("title", "��Ŀ����");
		prop2.setProperty("data", "3");
		detailColumnsInfo.add(prop2);

		Properties prop3 = new Properties();
		prop3.setProperty("title", "�������");
		prop3.setProperty("data", "5");
		detailColumnsInfo.add(prop3);

		Properties prop4 = new Properties();
		prop4.setProperty("title", "�Ƿ�����");
		prop4.setProperty("data", "7");
		detailColumnsInfo.add(prop4);

		Properties prop5 = new Properties();
		prop5.setProperty("title", "�쳣����");
		prop5.setProperty("data", "8");
		detailColumnsInfo.add(prop5);

	    }
	    private void setDetailEditComp() throws wlglException {
	        EditComponent ec1 = new EditComponent();
	        ec1.setEdtType("bool");
	        ec1.setCaption("����");
	        ec1.setField("IsNormal");
	        ec1.setDisID("IsNormalName");


	        EditComponent ec2 = new EditComponent();
	        ec2.setEdtType("textarea");
	        ec2.setCaption("�쳣����");
	        ec2.setField("Abnordesc");


	        // ���ý���ÿ������
	        HttpBase tre1 = HttpBase.genHttpTR("btd");
	        tre1.getElements().add(ec1.genHttpBase());
	        
	        HttpBase tre2 = HttpBase.genHttpTR("btd");
	        tre2.getElements().add(ec2.genHttpBase());

	        // ���ӵ��༭�ؼ��б�
	        editComps.clear();
	        editComps.add(ec1);
	        editComps.add(ec2);

	        // ���ӵ��༭���б�
	        editPanels.clear();
	        editPanels.add(tre1);
	        editPanels.add(tre2);
	    }
 
	    private void setDetailUpdateInfo() {
	    	
	        ArrayList ret = new ArrayList();
	        detailSelectSQL = "select a.BillNo, a.RowNo, a.ProjectCode,c.theName ProjectName ,a.PatrolCode," +
			"\n"+"b.PatrolContent, a.IsNormal,case a.IsNormal when '1' then '��' else '��' end IsNormalName, a.Abnordesc from tbeleworkpatrolitem a" +
			"\n"+"left outer join tbpatrolreportitem b on a.ProjectCode=b.thecode and a.PatrolCode=b.Rowno" +
			"\n"+"left outer join tbpatrolreport c on a.ProjectCode=c.thecode ";
	        
	        detailOrderSQL = "order by a.RowNo";

	        // ���ñ༭���Ӧ����

	        editColumns.setProperty("0", "6");
	        editColumns.setProperty("0d", "7");
	        editColumns.setProperty("1", "8");
	        
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
	           if (!inDetailMode) {//������ʱ�����ӱ���Ϣ.
		           	String tmpSQL = "insert Into  tbeleworkpatrolitem (BillNo,RowNo,ProjectCode,PatrolCode) values(?,?,?,?)";
					ArrayList paramsvalue = new ArrayList();
					int RowNo=1;
					String RowNoStr="";
					try {
						utildb.exeQuery("select  TheCode,RowNo from tbpatrolreportitem where RowTheState=1");
						while (utildb.myRs.next()) {
							paramsvalue.add(seqn);
							RowNoStr= Integer.toString(RowNo);
							paramsvalue.add(RowNoStr);
							RowNo++;
							paramsvalue.add(utildb.myRs.getString(1));
							paramsvalue.add(utildb.myRs.getString(2));
							utildb.exeUpdate(tmpSQL, paramsvalue);
							paramsvalue.clear();
						}
					} catch (Exception ex) {
						throw new wlglException("�Զ�����Ѳ����Ŀ");
					}
		           }
	    }

	    private void jbInit() throws Exception {
	    }

}
