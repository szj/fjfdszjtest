package net.trust.application.carManage.insurance.action;

import java.util.HashMap;
import java.util.List;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.opensymphony.xwork.ActionContext;

import net.trust.PaginactionAction;
import net.trust.application.carManage.insurance.domain.InsuranceFacade;
import net.trust.application.systemManage.manager.dto.UserInfo;
/**
 * ���չ���
 *
 */
public class InsuranceAction extends PaginactionAction{
//	���ڵ��Ի��ӡ��Ϣ��Log
	Log log = LogFactory.getLog(InsuranceAction.class);
	private InsuranceFacade insuranceFacade;	
	private List insuranceList;
	private HashMap search=new HashMap();
	private String actionType;		
	private String action;
	private String xml;

	public String execute() throws Exception {
		UserInfo userInfo=(UserInfo)ActionContext.getContext().getSession().get("UserInfo");		
		search.put("staffId", userInfo.getStaffId());
		
		if ("".equals(actionType) || null == actionType){
			if(super.queryFlag==0){//�жϲ�ѯ״̬				
				super.setPageRecord(15);//����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search);	//���ò�ѯ����
				super.setCount(insuranceFacade.findInsuranceCount(search));//��ȡ��ѯ����ܼ�¼��
			}
			search = (HashMap)super.getParameter();
			insuranceList = insuranceFacade.findInsurance(search);
			return "search";
		}else if ("new".equals(actionType)){
			action = "insert";
			return "new";		
		}else if ("insert".equals(actionType)){
			search.put("createMan", userInfo.getStaffId());//������
			int i = insuranceFacade.insertInsurance(search);
			if (i>0){
				
				super.addActionMessage("��ӱ�����Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_CarInsurance.window.location.reload();");				
				return SUCCESS;
			}else {
				super.addActionMessage("��ӱ�����Ϣ,����ʧ��");
				return ERROR;
			}
			
		}else if ("edit".equals(actionType)){;
			search = (HashMap)(insuranceFacade.findInsurance(search).get(0));
			action = "update";
			return "edit";
		}else if ("update".equals(actionType)){	
			search.put("editorMan", userInfo.getStaffId());//�༭��
			int i = insuranceFacade.updateInsurance(search);
			if (i>=0){				
				super.addActionMessage("�޸ı�����Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_CarInsurance.window.location.reload();");					
				return SUCCESS;
			}else {
				super.addActionMessage("�޸ı�����Ϣ,����ʧ��");
				return ERROR;
			}
		}else if ("delete".equals(actionType)){			
			search.put("editorMan", userInfo.getStaffId());//�༭��
			int i = insuranceFacade.deleteInsurance(search);
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("<value>").append(""+i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";
			
		}else if ("view".equals(actionType)){;
			search = (HashMap)(insuranceFacade.findInsurance(search).get(0));
			return "view";
			
		}	
		return ERROR;
}
	public InsuranceFacade getInsuranceFacade() {
		return insuranceFacade;
	}
	public void setInsuranceFacade(InsuranceFacade insuranceFacade) {
		this.insuranceFacade = insuranceFacade;
	}
	public List getInsuranceList() {
		return insuranceList;
	}
	public void setInsuranceList(List insuranceList) {
		this.insuranceList = insuranceList;
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
}
