package net.trust.application.carManage.expedite.action;

import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.trust.PaginactionAction;
import net.trust.application.baseArchives.carInfo.domain.CarFacade;
import net.trust.application.carManage.expedite.domain.ExpediteFacade;
import net.trust.application.systemManage.manager.dto.UserInfo;

import com.opensymphony.xwork.ActionContext;

/**
 * �ɳ��Ǽ�
 * 
 */
public class ExpediteAction extends PaginactionAction {

	private static final long serialVersionUID = 1L;
	// ���ڵ��Ի��ӡ��Ϣ��Log
	//private Log log = LogFactory.getLog(ExpediteAction.class);
	private ExpediteFacade expediteFacade;

	private CarFacade carFacade;	
	

	private List expediteList;
	private List roldInfoList;
	private List gobackRoldList;
	//2009-02-26
	//��Ϊ�ɳ��������Ҫ����
	private List applyerList;
	private List flowerTaskList;
    //2009-04-14
	//��Ϊ�г���¼,����Žᴦ��
	private List driversmsList;
	
	private HashMap search = new HashMap();
	private HashMap roldInfo = new HashMap();
	//2009-02-26
	//��Ϊ�ɳ��������Ҫ����
	private HashMap flowerTask = new HashMap();

	private String actionType;
	private String action;
	private String xml;

	/**
	 * �ɳ�ģ��
	 */
	public String execute() throws Exception {
		UserInfo userInfo = (UserInfo) ActionContext.getContext().getSession().get("UserInfo");
		search.put("staffId", userInfo.getStaffId());
        //��������0��ʱ�ɳ�
		search.put("billType", "0");
		if ("".equals(actionType) || null == actionType) {
			if (super.queryFlag == 0) {// �жϲ�ѯ״̬
				super.setPageRecord(15);// ����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search); // ���ò�ѯ����
				super.setCount(expediteFacade.findExpediteCount(search));// ��ȡ��ѯ����ܼ�¼��
			}
			this.exportFlag = "expedite";
			search = (HashMap) super.getParameter();
			search.put("billType", "0");
			expediteList = expediteFacade.findExpedite(search);
			return "search";
		} else if ("new".equals(actionType)) {
			//�õ��ɳ�������Ϣ
			HashMap param = new HashMap();
			param.put("expediteapplyId", search.get("expediteapplyId"));
			param = (HashMap) (expediteFacade.findApplyer(param).get(0));
			
			search.put("applyerList",param);
			
			action = "insert";
			return "new";
		} else if ("insert".equals(actionType)) {
	        //��������0��ʱ�ɳ�
			search.put("billType", "0");
			//����һ������Ϊ��һ��׼��
			String expediteapplyId=search.get("expediteapplyId").toString();
			search.put("expediteapplyId", expediteapplyId);// �ɳ����뵥
			search.put("createMan", userInfo.getStaffId());// ������
			
			String carNoId = (String)search.get("carNoId");
			search.put("carNoId", carNoId);//2009-12-20�޸�ʵ�ַ�����Ϊ����ͨ��tree�¼���ȡ
			
			search = expediteFacade.insertExpedite(search, roldInfo);
			int i= Integer.valueOf(search.get("st").toString());

			if (i > 0) {
				//ͬʱ���£��ɳ����뵥��
				addActionScript("try{");
				addActionScript("	parent.document.ifrm_Applyering.window.location.reload();");
				addActionScript("}catch(e){ }");
				
				super.addActionMessage("����ɳ���Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_ExpediteCarBooking.window.location.reload();");
				addActionScript("try{");
				addActionScript("	parent.document.ifrm_GoBackCarBooking.window.location.reload();");
				addActionScript("}catch(e){ }");

				search.put("sourceOrderType", "1");
				search.put("sourceOrderCode", search.get("expediteCarId"));

				return "ExpSuccess";
			} else {
				super.addActionMessage("����ɳ���Ϣ,����ʧ��");
				return ERROR;
			}

		} else if ("edit".equals(actionType)) {
			//�õ��ɳ�������Ϣ
			HashMap param = new HashMap();
			
			param.put("expediteapplyId", search.get("expediteapplyId"));
			param = (HashMap) (expediteFacade.findApplyer(param).get(0));

			search.put("roadType", "1");
			roldInfoList = expediteFacade.findRoldInfo(search);
			search = (HashMap) (expediteFacade.findExpedite(search).get(0));

			search.put("applyerList",param);

			action = "update";
			return "edit";

		} else if ("update".equals(actionType)) {
			search.put("editorMan", userInfo.getStaffId());// �༭��

			String carNoId = (String)search.get("carNoId");
			search.put("carNoId", carNoId);//2009-12-20�޸�ʵ�ַ�����Ϊ����ͨ��tree�¼���ȡ
			
			search = expediteFacade.updateExpedite(search, roldInfo);
			int i = Integer.valueOf(search.get("st").toString());
			
			if (i > 0) {
				super.addActionMessage("�޸��ɳ���Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_ExpediteCarBooking.window.location.reload();");
				
				search.put("sourceOrderType", "1");
				search.put("sourceOrderCode", search.get("expediteCarId"));

				return "ExpSuccess";
			} else {
				super.addActionMessage("�޸��ɳ���Ϣ,����ʧ��");
				return ERROR;
			}

		} else if ("delete".equals(actionType)) {
			search.put("editorMan", userInfo.getStaffId());// �༭��
			int i = expediteFacade.deleteExpedite(search);
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("<value>").append("" + i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";

		} else if ("view".equals(actionType)) {
			//�õ��ɳ�������Ϣ
			HashMap param = new HashMap();
			param.put("expediteapplyId", search.get("expediteapplyId"));
			param = (HashMap) (expediteFacade.findApplyer(param).get(0));

			search.put("roadType", "1");
			roldInfoList = expediteFacade.findRoldInfo(search);
			search = (HashMap) (expediteFacade.findExpedite(search).get(0));
			
			search.put("applyerList",param);
			
			return "view";

		}
		return ERROR;
	}
	
    /**
     * 2009-06-18
     * ��ʱ�ɳ�ģ��
     * @return
     * @throws Exception
     */
	public String expediteex() throws Exception {
		UserInfo userInfo = (UserInfo) ActionContext.getContext().getSession().get("UserInfo");
		search.put("staffId", userInfo.getStaffId());
        //��������1��ʱ�ɳ�
		search.put("billType", "1");
		if ("".equals(actionType) || null == actionType) {
			if (super.queryFlag == 0) {// �жϲ�ѯ״̬
				super.setPageRecord(15);// ����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search); // ���ò�ѯ����
				super.setCount(expediteFacade.findExpediteCount(search));// ��ȡ��ѯ����ܼ�¼��
			}
			this.exportFlag = "expedite";
			search = (HashMap) super.getParameter();
			search.put("billType", "1");
			expediteList = expediteFacade.findExpedite(search);
			return "search";
		} else if ("new".equals(actionType)) {
			//�õ��ɳ�������Ϣ
			HashMap param = new HashMap();
			param.put("expediteapplyId","");
			action = "insert";
			return "new";
		} else if ("insert".equals(actionType)) {
            //��������1��ʱ�ɳ�
			search.put("billType", "1");
			//����һ������Ϊ��һ��׼��
			search.put("expediteapplyId", "");// �ɳ����뵥
			search.put("createMan", userInfo.getStaffId());// ������
			
			String carNoId = (String)search.get("carNoId");
			search.put("carNoId", carNoId.substring(0, carNoId.indexOf("|")));
			//search.put("carNoId", carNoId);
			
			search = expediteFacade.insertExpedite(search, roldInfo);
			int i= Integer.valueOf(search.get("st").toString());
				
			if (i > 0) {
				super.addActionMessage("�����ʱ�ɳ���Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_ExpediteCarBookingEx.window.location.reload();");
				addActionScript("try{");
				addActionScript("	parent.document.ifrm_GoBackCarBooking.window.location.reload();");
				addActionScript("}catch(e){ }");

				search.put("sourceOrderType", "1");
				search.put("sourceOrderCode", search.get("expediteCarId"));

				return "ExpSuccess";
			} else {
				super.addActionMessage("�����ʱ�ɳ���Ϣ,����ʧ��");
				return ERROR;
			}
		} else if ("edit".equals(actionType)) {
			//�õ��ɳ�������Ϣ
			search.put("roadType", "1");
			roldInfoList = expediteFacade.findRoldInfo(search);
			search = (HashMap) (expediteFacade.findExpedite(search).get(0));
			action = "update";
			return "edit";

		} else if ("update".equals(actionType)) {
			search.put("editorMan", userInfo.getStaffId());// �༭��

			String carNoId = (String)search.get("carNoId");
			search.put("carNoId", carNoId.substring(0, carNoId.indexOf("|")));
			//search.put("carNoId", carNoId);
			
			search = expediteFacade.updateExpedite(search, roldInfo);
			int i = Integer.valueOf(search.get("st").toString());
			
			if (i > 0) {
				super.addActionMessage("�޸���ʱ�ɳ���Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_ExpediteCarBookingEx.window.location.reload();");
				
				search.put("sourceOrderType", "1");
				search.put("sourceOrderCode", search.get("expediteCarId"));

				return "ExpSuccess";
			} else {
				super.addActionMessage("�޸���ʱ�ɳ���Ϣ,����ʧ��");
				return ERROR;
			}
		} else if ("delete".equals(actionType)) {
			search.put("editorMan", userInfo.getStaffId());// �༭��
			int i = expediteFacade.deleteExpedite(search);
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("<value>").append("" + i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";
		} else if ("view".equals(actionType)) {
			//�õ��ɳ�������Ϣ
			search.put("roadType", "1");
			roldInfoList = expediteFacade.findRoldInfo(search);
			search = (HashMap) (expediteFacade.findExpedite(search).get(0));
			return "view";
		}
		return ERROR;
	}
	
	// �س��Ǽ�
	public String goback() throws Exception {
		UserInfo userInfo = (UserInfo) ActionContext.getContext().getSession().get("UserInfo");
		search.put("staffId", userInfo.getStaffId());
		if ("".equals(actionType) || null == actionType) {
			if (super.queryFlag == 0) {// �жϲ�ѯ״̬
				super.setPageRecord(15);// ����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search); // ���ò�ѯ����
				super.setCount(expediteFacade.findExpediteAndGobackCount(search));// ��ȡ��ѯ����ܼ�¼��
			}
			this.exportFlag = "goback";
			search = (HashMap) super.getParameter();
			expediteList = expediteFacade.findExpediteAndGoback(search);
			return "search";
		} else if ("new".equals(actionType)) {
			search.put("roadType", "1");
			roldInfoList = expediteFacade.findRoldInfo(search);
			search.put("roadType", "2");
			gobackRoldList = expediteFacade.findRoldInfo(search);
			
			search = (HashMap) (expediteFacade.findExpedite(search).get(0));
			
			//����������
			HashMap carmarkHs=new HashMap();
			carmarkHs.put("carNoCode", search.get("car_no_code").toString());
			
			//String mileage = carFacade.findGPSCarCurrMileage(carmarkHs);
			//�ݲ��Ժ�̨��sqlserver�����ݽ��вɼ�
			String mileage="0";
			if (null == mileage || "".equals(mileage))
			{
				mileage = "0";
			}
			search.put("totalDistance", mileage);

			action = "insert";
			return "new";
		} else if ("insert".equals(actionType)) {
			search.put("editorMan", userInfo.getStaffId());// �༭��
			int i = expediteFacade.insertGoBack(search, roldInfo);
			if (i > 0) {
				super.addActionMessage("��ӻس���Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_GoBackCarBooking.window.location.reload();");
				addActionScript("try{");
				addActionScript(" parent.document.ifrm_ExpediteCarBookingEx.window.location.reload();");
				addActionScript("}catch(e){ }");

				return SUCCESS;
			} else {
				super.addActionMessage("��ӻس���Ϣ,����ʧ��");
				return ERROR;
			}
		} else if ("edit".equals(actionType)) {
			search.put("roadType", "1");
			roldInfoList = expediteFacade.findRoldInfo(search);//�ɳ�����תվ��Ϣ
			search.put("roadType", "2");
			gobackRoldList = expediteFacade.findRoldInfo(search);//�س�����תվ��Ϣ
			
			HashMap param = new HashMap();
			param.put("expediteCarId", search.get("expediteCarId"));

			search = (HashMap) (expediteFacade.findGoback(search).get(0));
			param = (HashMap) (expediteFacade.findExpedite(param).get(0));
			
			search.putAll(param);
			
			action = "update";
			return "edit";
		} else if ("update".equals(actionType)) {
			search.put("editorMan", userInfo.getStaffId());// �༭��
			int i = expediteFacade.updateGoBack(search, roldInfo);
			if (i > 0) {
				super.addActionMessage("�޸Ļس���Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_GoBackCarBooking.window.location.reload();");
				addActionScript("parent.document.ifrm_ExpediteCarBookingEx.window.location.reload();");
				return SUCCESS;
			} else {
				super.addActionMessage("�޸Ļس���Ϣ,����ʧ��");
				return ERROR;
			}
		} else if ("delete".equals(actionType)) {
			search.put("editorMan", userInfo.getStaffId());// �༭��
			int i = expediteFacade.deleteGoback(search);
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("<value>").append("" + i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";
		}  else if ("feedback".equals(actionType)) {
			search.put("editorMan", userInfo.getStaffId());// �༭��
			int i=expediteFacade.sendFeedback(search);
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("<value>").append("" + i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";
		} else if ("view".equals(actionType)) {
			search.put("roadType", "1");
			roldInfoList = expediteFacade.findRoldInfo(search);
			search.put("roadType", "2");
			gobackRoldList = expediteFacade.findRoldInfo(search);
			
			HashMap param = new HashMap();
			param.put("expediteCarId", search.get("expediteCarId"));
			
			expediteList = expediteFacade.findGoback(search);
			if (null != expediteList && expediteList.size() > 0){
				search = (HashMap)expediteList.get(0);
			}
			
			param = (HashMap) (expediteFacade.findExpedite(param).get(0));
			
			search.put("expediteInfo", param);
			return "view";
		}
		return ERROR;
	}

	
	// �ɳ�����
	public String applyer() throws Exception {
		UserInfo userInfo = (UserInfo) ActionContext.getContext().getSession().get("UserInfo");
		search.put("staffId", userInfo.getStaffId());
		search.put("extdeptId", userInfo.getBelongTodept());
		if ("".equals(actionType) || null == actionType) {
			if (super.queryFlag == 0) {// �жϲ�ѯ״̬
				super.setPageRecord(15);// ����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search); // ���ò�ѯ����
				super.setCount(expediteFacade.findApplyerCount(search));// ��ȡ��ѯ����ܼ�¼��
			}
			this.exportFlag = "applyer";
			search = (HashMap) super.getParameter();
			applyerList = expediteFacade.findApplyer(search);
			return "search";
		} else if ("new".equals(actionType)) {
			action = "insert";
			return "new";
		} else if ("insert".equals(actionType)) {
		    //��ȥ�ύ�Ļس���
			Pattern p = Pattern.compile("\t|\r|\n");
			Matcher m = p.matcher(search.get("useExcuse").toString());
			search.put("useExcuse",m.replaceAll(""));
			//�����뱣���ύ
			search.put("createMan", userInfo.getStaffId());// ������
			search.put("editorMan", userInfo.getStaffId());// ������
			int i=expediteFacade.saveApplyer(search);
			if (i > 0) {
				super.addActionMessage("����ɳ�����,�����ɹ�");
				addActionScript("parent.document.ifrm_Applyering.window.location.reload();");
				return SUCCESS;
			} else {
				super.addActionMessage("����ɳ�����,����ʧ��");
				return ERROR;
			}
		} else if ("edit".equals(actionType)) {
			search = (HashMap) (expediteFacade.findApplyer(search).get(0));
			action = "update";
			return "edit";
		} else if ("update".equals(actionType)) {
		    //��ȥ�ύ�Ļس���
			Pattern p = Pattern.compile("\t|\r|\n");
			Matcher m = p.matcher(search.get("useExcuse").toString());
			search.put("useExcuse",m.replaceAll(""));
			//�����뱣���ύ
			search.put("editorMan", userInfo.getStaffId());// �༭��
			int i=expediteFacade.saveApplyer(search);
			
			if (i > 0) {
				super.addActionMessage("�޸��ɳ�����,�����ɹ�");
				addActionScript("parent.document.ifrm_Applyering.window.location.reload();");
				return SUCCESS;
			} else {
				super.addActionMessage("�޸��ɳ�����,����ʧ��");
				return ERROR;
			}
		} else if ("delete".equals(actionType)) {
			search.put("editorMan", userInfo.getStaffId());// �༭��
			int i = expediteFacade.deleteApplyer(search);
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("<value>").append("" + i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";
		} else if ("agent".equals(actionType)) {
			search.put("editorMan", userInfo.getStaffId());// �༭��
			search.put("approveCode", userInfo.getStaffId());
			search.put("approveRemark", "");
			int i=expediteFacade.proAgent(search);
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("<value>").append("" + i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";
		} else if ("view".equals(actionType)) {
			flowerTaskList = expediteFacade.findFlowerTask(search);
			search = (HashMap) (expediteFacade.findApplyer(search).get(0));
			return "view";
		}
		return ERROR;
	}
	
	//2009-04-14
	// ˾���г��Ǽ�
	public String driversms() throws Exception {
		UserInfo userInfo = (UserInfo) ActionContext.getContext().getSession().get("UserInfo");
		search.put("staffId", userInfo.getStaffId());
		if ("".equals(actionType) || null == actionType) {
			if (super.queryFlag == 0) {// �жϲ�ѯ״̬
				super.setPageRecord(15);// ����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search); // ���ò�ѯ����
				super.setCount(expediteFacade.findDriversmsCount(search));// ��ȡ��ѯ����ܼ�¼��
			}
			this.exportFlag = "driversms";
			search = (HashMap) super.getParameter();
			driversmsList = expediteFacade.findDriversms(search);
			return "search";
		} else if ("new".equals(actionType)) {
			action = "insert";
			return "new";
		} else if ("insert".equals(actionType)) {
			search.put("createMan", userInfo.getStaffId());// ������
			int i = expediteFacade.insertDriversms(search);
			if (i > 0) {
				super.addActionMessage("����г���¼,�����ɹ�");
				addActionScript("parent.document.ifrm_Driversms.window.location.reload();");
				return SUCCESS;
			} else {
				super.addActionMessage("����г���¼,����ʧ��");
				return ERROR;
			}
		} else if ("edit".equals(actionType)) {
			search=(HashMap)(expediteFacade.findDriversms(search).get(0));
			action = "update";
			return "edit";
		} else if ("update".equals(actionType)) {
			search.put("editorMan", userInfo.getStaffId());// �༭��
			int i = expediteFacade.updateDriversms(search);
			if (i > 0) {
				super.addActionMessage("�޸��г���¼,�����ɹ�");
				addActionScript("parent.document.ifrm_Driversms.window.location.reload();");
				return SUCCESS;
			} else {
				super.addActionMessage("�޸��г���¼,����ʧ��");
				return ERROR;
			}
		} else if ("delete".equals(actionType)) {
			search.put("editorMan", userInfo.getStaffId());// �༭��
			int i = expediteFacade.deleteDriversms(search);
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("<value>").append("" + i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";
		}  else if ("view".equals(actionType)) {
			search=(HashMap)(expediteFacade.findDriversms(search).get(0));
			return "view";
		}
		return ERROR;
	}
	
	// 2009-04-24
	// �س��Ǽǵ�������
	public String gobackExcel() throws Exception {
		UserInfo userInfo = (UserInfo) ActionContext.getContext().getSession().get("UserInfo");
		search.put("staffId", userInfo.getStaffId());
		if ("".equals(actionType) || null == actionType) {
			if (super.queryFlag == 0) {// �жϲ�ѯ״̬
				super.setPageRecord(15);// ����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search); // ���ò�ѯ����
				super.setCount(expediteFacade.findRoldInfoExcelCount(search));// ��ȡ��ѯ����ܼ�¼��
			}
			this.exportFlag = "gobackExcel";
			search = (HashMap) super.getParameter();
			expediteList = expediteFacade.findRoldInfoExcel(search);
			return "search";
		}
		return ERROR;
	}
	
	public HashMap getSearch() {
		return search;
	}

	public void setSearch(HashMap search) {
		this.search = search;
	}

	public String getActionType() {
		return actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getXml() {
		return xml;
	}

	public void setXml(String xml) {
		this.xml = xml;
	}

	public ExpediteFacade getExpediteFacade() {
		return expediteFacade;
	}

	public void setExpediteFacade(ExpediteFacade expediteFacade) {
		this.expediteFacade = expediteFacade;
	}

	public List getExpediteList() {
		return expediteList;
	}

	public void setExpediteList(List expediteList) {
		this.expediteList = expediteList;
	}

	public List getRoldInfoList() {
		return roldInfoList;
	}

	public void setRoldInfoList(List roldInfoList) {
		this.roldInfoList = roldInfoList;
	}

	public HashMap getRoldInfo() {
		return roldInfo;
	}

	public void setRoldInfo(HashMap roldInfo) {
		this.roldInfo = roldInfo;
	}

	public List getGobackRoldList() {
		return gobackRoldList;
	}

	public void setGobackRoldList(List gobackRoldList) {
		this.gobackRoldList = gobackRoldList;
	}

	/**
	 * @return the applyerList
	 */
	public List getApplyerList() {
		return applyerList;
	}

	/**
	 * @param applyerList the applyerList to set
	 */
	public void setApplyerList(List applyerList) {
		this.applyerList = applyerList;
	}

	/**
	 * @return the flowerTaskList
	 */
	public List getFlowerTaskList() {
		return flowerTaskList;
	}

	/**
	 * @param flowerTaskList the flowerTaskList to set
	 */
	public void setFlowerTaskList(List flowerTaskList) {
		this.flowerTaskList = flowerTaskList;
	}

	/**
	 * @return the flowerTask
	 */
	public HashMap getFlowerTask() {
		return flowerTask;
	}

	/**
	 * @param flowerTask the flowerTask to set
	 */
	public void setFlowerTask(HashMap flowerTask) {
		this.flowerTask = flowerTask;
	}

	/**
	 * @return the carFacade
	 */
	public CarFacade getCarFacade() {
		return carFacade;
	}

	/**
	 * @param carFacade the carFacade to set
	 */
	public void setCarFacade(CarFacade carFacade) {
		this.carFacade = carFacade;
	}

	/**
	 * @return the driversmsList
	 */
	public List getDriversmsList() {
		return driversmsList;
	}

	/**
	 * @param driversmsList the driversmsList to set
	 */
	public void setDriversmsList(List driversmsList) {
		this.driversmsList = driversmsList;
	}
}
