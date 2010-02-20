package YzSystem.J_Storage;

import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Properties;

import YzSystem.JMain.*;
import YzSystem.J_System.BeanLogin;
import YzSystem.J_System.BeanSystemGroupPower;

public class FrmStorageFlow extends FrmFunctionBase{
	
	 public FrmStorageFlow() throws wlglException {
	        super();
	        Table = "tbstorageflowlog";
	        seqnField = "TheSeqn";
	//=========================��ѯ����==============================================
	        if (mode.equals("query")) {
	            // ���ò�ѯ���
	            setQueryComp();
	            // ���ò�ѯ��Ϣ
	            setQueryInfo();
	        }
	//=========================�������==============================================
	        // ����������
	        if (mode.equals("edit")) {
	            setEditComp();
	            setUpdateInfo();
	        }
	    }
	    /**
	     * setQueryComp
	     * ������Ҫ�Ĳ�ѯ���
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
	        EditComponent e2 = new EditComponent("Employee",
	                                             "������",
	                                             "a.FlowApproveCode",
	                                             "=",
	                                             "QFlowApproveCode",
	                                             "QFlowApproveName",
	                                             "",
	                                             "",
	                                             "",
	                                             "");
	        
	        EditComponent e3 = new EditComponent("bool",
                    "�Ƿ����",
                    "a.IsCheck",
                    "=",
                    "QIsCheck",
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
	     * ������Ҫ�Ĳ�ѯ��Ϣ
	     */
	    private void setQueryInfo() {
	        qry_selectSQL = "select a.TheSeqn, a.BillNo, a.SerialNO, a.FlowCode, a.FlowRowNo,c.TheName FlowRownoName ,a.IsSameDep, a.IsFlowers, a.IsFlowMust,  " +
	        		"\n"+"a.FlowApproveCode , b.TheName FlowApproveName, a.ApproveCode, a.ApproveDate, a.Argumentum, a.Remark,case a.IsCheck when '1' then '��' else '��' end IsCheckName " +
	        		"\n"+" from tbstorageflowlog a left outer join tbdatumemployee b on a.FlowApproveCode=b.theCode  " +
	        		"\n"+"left outer join tbstorageflowitem c on a.FlowCode=c.BillNo and a.FlowRowNo=c.RowNo";
	        
	        qry_whereSQL=" a.TheSeqn not in" +
	        		"\n"+"(select a.TheSeqn from tbstorageflowlog a left outer join tbdatumemployee b on a.FlowApproveCode=b.theCode left outer join tbstorageapply c on a.billno=c.billno" +
	        		"\n"+" where a.IsSameDep='1' and b.DepCode!=c.ApplyDepCode)";//ѡ���Ƿ�ͬ����

	        qry_orderSQL = "order by a.billNo desc,a.SerialNo ";

	        // ����������(���ͣ����⣬��ȣ�������)
	        columnsInfo.clear();
	        Properties prop1 = new Properties();
	        columnsInfo.add(prop1);
	        prop1.setProperty("type", "radio");
	        prop1.setProperty("title", "���");
	        prop1.setProperty("width", "5%");
	        prop1.setProperty("data", "0");
	        
	        Properties prop2 = new Properties();
	        prop2.setProperty("title", "���ݺ�");
	        prop2.setProperty("data", "1");
	        columnsInfo.add(prop2);
	        
	        Properties prop8 = new Properties();
	        prop8.setProperty("title", "���ں�");
	        prop8.setProperty("data", "4");
	        columnsInfo.add(prop8);

	        Properties prop3 = new Properties();
	        prop3.setProperty("title", "��������");
	        prop3.setProperty("data", "5");
	        columnsInfo.add(prop3);
	        
	        Properties prop4 = new Properties();
	        prop4.setProperty("title", "�����");
	        prop4.setProperty("data", "10");
	        columnsInfo.add(prop4);
	        
	        Properties prop7 = new Properties();
	        prop7.setProperty("title", "��������");
	        prop7.setProperty("data", "12");
	        columnsInfo.add(prop7);

	        Properties prop5 = new Properties();
	        prop5.setProperty("title", "�������");
	        prop5.setProperty("data", "13");
	        columnsInfo.add(prop5);
	        
	        
	        Properties prop6 = new Properties();
	        prop6.setProperty("title", "��ע");
	        prop6.setProperty("data", "14");
	        columnsInfo.add(prop6);
	        
	        Properties prop9 = new Properties();
	        prop9.setProperty("title", "�Ƿ����");
	        prop9.setProperty("data", "15");
	        columnsInfo.add(prop9);


	    }

	    /**
	     * setAddComp
	     * ������Ҫ�ı༭���
	     */
	    private void setEditComp() throws wlglException {
	        EditComponent ec1 = new EditComponent();
	        ec1.setEdtType("date");
	        ec1.setCaption("��������");
	        ec1.setField("ApproveDate");
	        ec1.setMustFill(true);

	        /*
	        EditComponent ec2 = new EditComponent();
	        ec2.setEdtType("Employee");
	        ec2.setCaption("������");
	        ec2.setField("ApproveCode");
	        ec2.setDisID("ApproveName");
	        ec2.setMustFill(true);
	        */
	        
	        EditComponent ec3 = new EditComponent();
	        ec3.setCaption("�������");
	        ec3.setField("Argumentum");
	        ec3.setColspan("3");

	        EditComponent ec5 = new EditComponent();
	        ec5.setCaption("��ע");
	        ec5.setField("Remark");
	        ec5.setColspan("5");



	        // ���ý���ÿ������
	        HttpBase tre1 = HttpBase.genHttpTR("btd");
	        tre1.getElements().add(ec1.genHttpBase());
	        //tre1.getElements().add(ec2.genHttpBase());
	        tre1.getElements().add(ec3.genHttpBase());
	        
	        HttpBase tre2 = HttpBase.genHttpTR("btd");
	        //tre2.getElements().add(ec4.genHttpBase());
	        tre2.getElements().add(ec5.genHttpBase());


	        // ���ӵ��༭�ؼ��б�
	        editComps.clear();
	        editComps.add(ec1);
	        //editComps.add(ec2);
	        editComps.add(ec3);
	        //editComps.add(ec4);
	        editComps.add(ec5);

	        // ���ӵ��༭���б�
	        editPanels.clear();
	        editPanels.add(tre1);
	        editPanels.add(tre2);
	    }

	    private void setUpdateInfo() {
	        ArrayList ret = new ArrayList();
	       
	        edt_selectSQL = "select a.TheSeqn, a.BillNo, a.SerialNO, a.FlowCode, a.FlowRowNo,c.TheName FlowRownoName ,a.IsSameDep, a.IsFlowers, a.IsFlowMust,  " +
    		"\n"+"a.FlowApproveCode , b.TheName FlowApproveName,a.ApproveCode, a.ApproveDate, a.Argumentum, a.Remark" +
    		"\n"+" from tbstorageflowlog a left outer join tbdatumemployee b on a.FlowApproveCode=b.theCode  " +
    		"\n"+"left outer join tbstorageflowitem c on a.FlowCode=c.BillNo and a.FlowRowNo=c.RowNo";
	        
	        //edt_whereSQL=" ";


	        // ���ñ༭���Ӧ����
	        editColumns.setProperty("0", "12");
	        editColumns.setProperty("1", "13");
	        editColumns.setProperty("2", "14");
       

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
	    
	    /*
	     * 
	     * (non-Javadoc)
	     * @see YzSystem.JMain.FrmFunctionBase#genHtmlRightButtons(YzSystem.J_System.BeanSystemGroupPower)
	     */
	    //��ť��д���ɷ�ʽ


	    protected String genHtmlRightButtons(BeanSystemGroupPower SystemPower) throws wlglException 
	    {
	    	String val = "";
	    	HttpBase base = new HttpBase();
	    	base=genHttpMainBtns();
	    	val=base.GenHtml();
	    	return val;
		
	    }
	    
	    protected HttpBase genHttpBaseSingleEditBtns() throws wlglException {
	        // ���á����水ť����
	        HttpBase tableApprove = new HttpBase();
	        tableApprove.setTag("table");
	        tableApprove.getProperties().setProperty("class", "btd3");
	        tableApprove.getProperties().setProperty("border", "0");
	        tableApprove.getProperties().setProperty("cellspacing", "1");
	        tableApprove.getProperties().setProperty("cellpadding", "5");
	        tableApprove.getProperties().setProperty("width", "100%");
	        HttpBase trApprove = HttpBase.genHttpTR("btd");
	        HttpBase tdApprove = HttpBase.genHttpTD("", "right", "", "");
	        
	        UtilDB utildb= new UtilDB();
	        ArrayList params= new ArrayList();
	        params.add(seqn);
	        ArrayList rs=utildb.exeQueryOneRow("select IsCheck from tbstorageflowlog where TheSeqn=? ",params);
	        utildb.closeCon();
	        String checkflag=(String)rs.get(0);
	        
	        if (checkflag.equalsIgnoreCase("0")){
	            HttpBase btnAudit = UtilWebFactory.genHttpBaseBtn("btnUnAudit",
	                    "���",
	                    "doAction('audit')");
	            tdApprove.getElements().add(btnAudit);
	        }
	        else {
	            HttpBase btnUnAudit = UtilWebFactory.genHttpBaseBtn("btnUnAudit",
	                    "�����",
	                    "doAction('unaudit')");
	            tdApprove.getElements().add(btnUnAudit);
	        }
	        
	        trApprove.getElements().add(tdApprove);
	        tdApprove.getElements().add(UtilWebFactory.genHttpBaseBtnCancel("btnCancel"));
	        
	        tableApprove.getElements().add(trApprove);
	        return tableApprove;
	    }
	    
        protected HttpBase genHttpMainBtns() throws wlglException {
        HttpBase base = new HttpBase();
        HttpBase table11 = HttpBase.genHttpTable("btd", "100%", "1", "5",
                                                 "0");
        base.getElements().add(table11);
        HttpBase tr111 = HttpBase.genHttpTR("btd");
        table11.getElements().add(tr111);
        HttpBase td1111 = new HttpBase();
        td1111.setTag("td");
        td1111.getProperties().setProperty("height", "36");
        td1111.getProperties().setProperty("align", "right");
        tr111.getElements().add(td1111);
        td1111.getElements().add(UtilWebFactory.genHttpBaseBtnEdit("btnEdit"));
        return base;
    }

    /**
     * doAction
     * ����: ��������
     */
    protected HttpBase doAction() throws wlglException {
        if (UtilWebTools.getRequestParameter("action").equals("audit")) {
            return (HttpBaseDoAudit());
        }
        else if (UtilWebTools.getRequestParameter("action").equals("unaudit")) {
            return (HttpBaseDounAudit());
        }
        return null;
    }

    /**
     * HttpBaseDoAudit
     * ����:���洦��
     * @return HttpBase  ���洦���Ľ����ϢHttpBase
     */
    private HttpBase HttpBaseDoAudit() throws wlglException {
        HttpBase val = null;
        String HideMessage=ProApproveSeqn(seqn);
        if (HideMessage.equals("")) {
			UtilDB utildb = new UtilDB();
			utildb.beginTransaction();
			// ����
			BeanLogin aUser = (BeanLogin) UtilWebTools.getSession()
					.getAttribute("userInfo");
			String ApproveCode = aUser.getEmployeCode();
			String ApproveDate = UtilWebTools
					.getRequestParameter("ApproveDate");
			String Argumentum = UtilWebTools.getRequestParameter("Argumentum");
			String Remark = UtilWebTools.getRequestParameter("Remark");
			String mysql = " update tbstorageflowlog set IsCheck=?,ApproveCode=?,ApproveDate=?,Argumentum=?,Remark=? where TheSeqn=? ";
			ArrayList params = new ArrayList();
			params.add(1);
			params.add(ApproveCode);
			params.add(ApproveDate);
			params.add(Argumentum);
			params.add(Remark);
			params.add(seqn);
			utildb.exeUpdate(mysql, params);
			utildb.commit();
			utildb.closeCon();
			HideMessage="��˳ɹ�!";
		}
        String tmp = "";
        tmp = "alert('"+HideMessage+"');\n"
              + "self.location.href='" + UtilWebTools.getRequestPath() +
              findparam + "';";

        val = HttpBase.genHttpScript(tmp);
        return val;
    }
    
    private HttpBase HttpBaseDounAudit() throws wlglException {
        HttpBase val = null;
        String HideMessage=ProApproveSeqn(seqn);
        if (HideMessage.equals("")) {

			UtilDB utildb = new UtilDB();
			utildb.beginTransaction();
			// ����
			BeanLogin aUser = (BeanLogin) UtilWebTools.getSession()
					.getAttribute("userInfo");
			String ApproveCode = aUser.getEmployeCode();
			String ApproveDate = UtilWebTools
					.getRequestParameter("ApproveDate");
			String Argumentum = UtilWebTools.getRequestParameter("Argumentum");
			String Remark = UtilWebTools.getRequestParameter("Remark");
			String mysql = " update tbstorageflowlog set IsCheck=?,ApproveCode=?,ApproveDate=?,Argumentum=?,Remark=? where TheSeqn=? ";
			ArrayList params = new ArrayList();
			params.add(0);
			params.add(ApproveCode);
			params.add(ApproveDate);
			params.add(Argumentum);
			params.add(Remark);
			params.add(seqn);
			utildb.exeUpdate(mysql, params);
			utildb.commit();
			utildb.closeCon();
			HideMessage="����˳ɹ�!";
		}
		String tmp = "";
		tmp = "alert('"+HideMessage+"');\n" + "self.location.href='"
				+ UtilWebTools.getRequestPath() + findparam + "';";

		val = HttpBase.genHttpScript(tmp);
		return val;
    }
    
    /*
	 * 2008-06-09 ���̴���ʽ szj
	 * 
	 * 
	 */
    
    // �õ���˵������һ�ŵ������
    private int GetMinApproveSeqn(String billno,UtilDB utildbchild) throws wlglException
    {
    	int returnvalue=0;
    	//Query_SQL,Query_SQLParam
		//UtilDB utildbchild = new UtilDB();
		ArrayList paramsvalue = new ArrayList();
		paramsvalue.add(billno);
		paramsvalue.add(billno);
		ArrayList rs = utildbchild.exeQueryOneRow(
                    "select min(TheSeqn) from tbstorageflowlog where BillNo=? and " +
                    "\n"+"FlowRowNo in (select max(aa.FlowRowNo) from tbstorageflowlog aa where aa.BillNo=? and aa.IsCheck=1 and  aa.TheSeqn not in" +
	        		"\n"+"(select a.TheSeqn from tbstorageflowlog a left outer join tbdatumemployee b on a.FlowApproveCode=b.theCode left outer join tbstorageapply c on a.billno=c.billno" +
	        		"\n"+" where a.IsSameDep='1' and b.DepCode!=c.ApplyDepCode))", paramsvalue);
		if(rs.get(0)==null)
		{
			ArrayList tmprs = utildbchild.exeQueryOneRow("select min(TheSeqn) from tbstorageflowlog where BillNo='"+billno+"'");
			returnvalue=Integer.parseInt((String) tmprs.get(0));;
		}
		else
		{
			returnvalue =  Integer.parseInt((String) rs.get(0));
		}
    	return returnvalue;
    }
    //�õ�������˵ĵ���
    /*
     * IsFlowMust�����Ƿ���� ,��ȷ������
     * IsMust ��Ա�Ƿ����,��ȷ���Ƿ����
     * ǰ���Ѿ����˶ಿ��
     * С�ڵ���
     */
    private int GetMaxApproveSeqn(String billno,UtilDB utildbchild) throws wlglException
    {
    	int returnvalue=0;
		//UtilDB utildbchild = new UtilDB();
		ArrayList paramsvalue = new ArrayList();
		paramsvalue.add(billno);
		paramsvalue.add(billno);
		ArrayList rs = utildbchild.exeQueryOneRow(
                    "select max(TheSeqn) from tbstorageflowlog where BillNo=? and " +
                   "\n"+"FlowRowNo in (select min(aa.FlowRowNo) from tbstorageflowlog aa where aa.BillNo=? and aa.IsFlowMust=1 and aa.IsFlowers=1 and aa.IsCheck=0 and  aa.TheSeqn not in" +
	        		"\n"+"(select a.TheSeqn from tbstorageflowlog a left outer join tbdatumemployee b on a.FlowApproveCode=b.theCode left outer join tbstorageapply c on a.billno=c.billno" +
	        		"\n"+" where a.IsSameDep='1' and b.DepCode!=c.ApplyDepCode))", paramsvalue);
		if(rs.get(0)==null)
		{
			ArrayList tmprs = utildbchild.exeQueryOneRow("select max(TheSeqn) from tbstorageflowlog where BillNo='"+billno+"'");
			returnvalue=Integer.parseInt((String) tmprs.get(0));;
		}
		else
		{
			returnvalue =  Integer.parseInt((String) rs.get(0));
		}
    	return returnvalue;
    }
    private String ProApproveSeqn(String TheSeqn)throws wlglException
    {
    	String returnvalue="";
    	UtilDB utildbchild = new UtilDB();
		ArrayList paramsvalue = new ArrayList();
		paramsvalue.add(TheSeqn);
		ArrayList rs = utildbchild.exeQueryOneRow("select billNo from tbstorageflowlog where TheSeqn=? ", paramsvalue);
		int minseqn=GetMinApproveSeqn((String)rs.get(0),utildbchild);
		int maxseqn=GetMaxApproveSeqn((String)rs.get(0),utildbchild);
		int selfseqn=Integer.parseInt(TheSeqn);
		utildbchild.closeCon();
		if(selfseqn<minseqn)
		{
			returnvalue ="֮�󻷽�,�������!";  	
		}
		else if(selfseqn>maxseqn)
		{
			returnvalue ="֮ǰ����,����δ��!";	
		}
    	return returnvalue;
    }

}
