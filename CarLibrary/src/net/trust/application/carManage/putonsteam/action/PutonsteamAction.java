package net.trust.application.carManage.putonsteam.action;

import java.util.HashMap;
import java.util.List;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.opensymphony.xwork.ActionContext;

import net.trust.PaginactionAction;

import net.trust.application.carManage.putonsteam.domain.PutonsteamFacade;
import net.trust.application.systemManage.manager.dto.UserInfo;
/**
 * ���͹���
 *
 */
public class PutonsteamAction extends PaginactionAction{
//	���ڵ��Ի��ӡ��Ϣ��Log
	Log log = LogFactory.getLog(PutonsteamAction.class);
	private PutonsteamFacade putonsteamFacade;	
	private List putonsteamList;
	private HashMap search=new HashMap();
	private String actionType;		
	private String action;
	private String xml;
	
	public String execute() throws Exception {
		UserInfo userInfo=(UserInfo)ActionContext.getContext().getSession().get("UserInfo");		
		search.put("staffId", userInfo.getStaffId());
		search.put("staffName", userInfo.getStaffName());
		
		if ("".equals(actionType) || null == actionType){
			if(super.queryFlag==0){//�жϲ�ѯ״̬				
				super.setPageRecord(15);//����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search);	//���ò�ѯ����
				super.setCount(putonsteamFacade.findPutonsteamCount(search));//��ȡ��ѯ����ܼ�¼��
			}
			this.exportFlag = "putOnSteam";
			search = (HashMap)super.getParameter();
			putonsteamList = putonsteamFacade.findPutonsteam(search);
			return "search";
			
		}else if ("new".equals(actionType)){
			action = "insert";
			return "new";			
			
		}else if ("insert".equals(actionType)){
			search.put("createMan", userInfo.getStaffId());//������
			int i = putonsteamFacade.insertPutonsteam(search);
			if (i>0){
				super.addActionMessage("��Ӽ�����Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_PutOnSteamManage.window.location.reload();");				
				return SUCCESS;
			}else {
				super.addActionMessage("��Ӽ�����Ϣ,����ʧ��");
				return ERROR;
			}
			
		}else if ("edit".equals(actionType)){;
			search = (HashMap)(putonsteamFacade.findPutonsteam(search).get(0));
			action = "update";
			return "edit";
			
		}else if ("update".equals(actionType)){	
			search.put("editorMan", userInfo.getStaffId());//�༭��
			int i = putonsteamFacade.updatePutonsteam(search);
			if (i>=0){				
				super.addActionMessage("�޸ļ�����Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_PutOnSteamManage.window.location.reload();");					
				return SUCCESS;
			}else {
				super.addActionMessage("�޸ļ�����Ϣ,����ʧ��");
				return ERROR;
			}
			
		}else if ("delete".equals(actionType)){	
			search.put("editorMan", userInfo.getStaffId());//�༭��
			int i = putonsteamFacade.deletePutonsteam(search);
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("<value>").append(""+i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";
			
		}else if ("view".equals(actionType)){;
			search = (HashMap)(putonsteamFacade.findPutonsteam(search).get(0));
			return "view";
			
		}
		return ERROR;
	}
	public PutonsteamFacade getPutonsteamFacade() {
		return putonsteamFacade;
	}
	public void setPutonsteamFacade(PutonsteamFacade putonsteamFacade) {
		this.putonsteamFacade = putonsteamFacade;
	}
	public List getPutonsteamList() {
		return putonsteamList;
	}
	public void setPutonsteamList(List putonsteamList) {
		this.putonsteamList = putonsteamList;
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
