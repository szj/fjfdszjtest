package net.trust.application.carManage.attempermanage.action;

import java.util.HashMap;
import java.util.List;

import net.trust.PaginactionAction;
import net.trust.application.carManage.attempermanage.domain.AttemperManageFacade;
import net.trust.application.systemManage.manager.dto.UserInfo;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.opensymphony.xwork.ActionContext;
/**
 * ���ȹ���
 *
 */
public class AttemperManageAction extends PaginactionAction{
	private Log log = LogFactory.getLog(AttemperManageAction.class);
	private AttemperManageFacade attemperManageFacade;
	
	private HashMap search = new HashMap();
	public List attemperList;
	
	private String actionType;		
	private String action;
	private String xml;

	public String execute() throws Exception {
		UserInfo userInfo=(UserInfo)ActionContext.getContext().getSession().get("UserInfo");		
		search.put("staffId", userInfo.getStaffId());
		
		if ("".equals(actionType) || null == actionType){
			if(super.queryFlag==0){//�жϲ�ѯ״̬				
				search.put("maintainState", "1");
				super.setPageRecord(15);//����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search);	//���ò�ѯ����
				super.setCount(attemperManageFacade.findAttemperCount(search));//��ȡ��ѯ����ܼ�¼��
			}
			this.exportFlag = "attemperManage";
			search = (HashMap)super.getParameter();
			attemperList = attemperManageFacade.findAttemper(search);
			return "search";
			
		}else if ("new".equals(actionType)){
			action = "insert";
			return "new";		
			
		}else if ("insert".equals(actionType)){
			search.put("createMan", userInfo.getStaffId());//������
			search = attemperManageFacade.insertAttemper(search);
			int i = (Integer)search.get("st");
			
			switch(i){
				case 1:super.addActionMessage("��ӳ������ȼ�¼,�����ɹ�");
						addActionScript("parent.document.ifrm_AttemperManage.window.location.reload();");	
						search.put("sourceOrderType", "2");
						search.put("sourceOrderCode", search.get("attemperManageId"));

						return "AttemperSuccess";
				case 0:super.addActionMessage("��ӳ������ȼ�¼,����ʧ��");
						return ERROR;
				case -100:super.addActionMessage("�������Ϊ��,����ʧ��");
						return ERROR;
				case -101:super.addActionMessage("��ϵͳ���޸ó�����Ϣ,����ʧ��");
						return ERROR;
				case -200:super.addActionMessage("˾����Ϊ��,����ʧ��");
						return ERROR;
				case -201:super.addActionMessage("��ϵͳ����˾����Ϣ,����ʧ��");
						return ERROR;
			}
		}else if ("edit".equals(actionType)){;
			search = (HashMap)(attemperManageFacade.findAttemper(search).get(0));			
			action = "update";
			return "edit";
			
		}else if ("update".equals(actionType)){		
			search.put("editorMan", userInfo.getStaffId());//�༭��
			int i = attemperManageFacade.updateAttemper(search);
			if (i>=0){				
				super.addActionMessage("�޸ĳ������ȼ�¼,�����ɹ�");
				addActionScript("parent.document.ifrm_AttemperManage.window.location.reload();");					
				return SUCCESS;
			}else {
				super.addActionMessage("�޸ĳ������ȼ�¼,����ʧ��");
				return ERROR;
			}
			
		}else if ("delete".equals(actionType)){		
			search.put("editorMan", userInfo.getStaffId());//�༭��
			int i = attemperManageFacade.deleteAttemper(search);
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("	<value>").append(""+i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";
			
		}else if ("view".equals(actionType)){
			search = (HashMap)(attemperManageFacade.findAttemper(search).get(0));			
			return "view";
			
		}else if ("findGPS".equals(actionType)){
			attemperList = attemperManageFacade.getGPSCarLocus(search);
			
			return "findGPS";
		}
		return ERROR;
	}

	public AttemperManageFacade getAttemperManageFacade() {
		return attemperManageFacade;
	}

	public void setAttemperManageFacade(AttemperManageFacade attemperManageFacade) {
		this.attemperManageFacade = attemperManageFacade;
	}

	public HashMap getSearch() {
		return search;
	}

	public void setSearch(HashMap search) {
		this.search = search;
	}

	public List getAttemperList() {
		return attemperList;
	}

	public void setAttemperList(List attemperList) {
		this.attemperList = attemperList;
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
