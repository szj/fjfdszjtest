package net.trust.application.carManage.maintainRoad.action;

import java.util.HashMap;
import java.util.List;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.opensymphony.xwork.ActionContext;

import net.trust.PaginactionAction;

import net.trust.application.carManage.maintainRoad.domain.MaintainRoadFacade;
import net.trust.application.systemManage.manager.dto.UserInfo;
/**
 * ��·�ѹ���
 *
 */
public class MaintainRoadAction extends PaginactionAction{
//	���ڵ��Ի��ӡ��Ϣ��Log
	Log log = LogFactory.getLog(MaintainRoadAction.class);
	private MaintainRoadFacade maintainRoadFacade;	
	private List maintainRoadList;
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
				super.setCount(maintainRoadFacade.findMaintainRoadCount(search));//��ȡ��ѯ����ܼ�¼��
			}
			
			this.exportFlag = "maintainRoad";
			search = (HashMap)super.getParameter();
			maintainRoadList = maintainRoadFacade.findMaintainRoad(search);
			return "search";
			
		}else if ("new".equals(actionType)){
			action = "insert";
			return "new";			
			
		}else if ("insert".equals(actionType)){
			search.put("createMan", userInfo.getStaffId());//������
			int i = maintainRoadFacade.insertMaintainRoad(search);
			if (i>0){
				super.addActionMessage("�����·����Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_MaintainRoadExpenses.window.location.reload();");				
				return SUCCESS;
			}else {
				super.addActionMessage("�����·����Ϣ,����ʧ��");
				return ERROR;
			}
			
		}else if ("edit".equals(actionType)){;
			search = (HashMap)(maintainRoadFacade.findMaintainRoad(search).get(0));
			action = "update";
			return "edit";
			
		}else if ("update".equals(actionType)){	
			search.put("editorMan", userInfo.getStaffId());//�༭��
			int i = maintainRoadFacade.updateMaintainRoad(search);
			if (i>=0){				
				super.addActionMessage("�޸���·����Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_MaintainRoadExpenses.window.location.reload();");					
				return SUCCESS;
			}else {
				super.addActionMessage("�޸���·����Ϣ,����ʧ��");
				return ERROR;
			}
			
		}else if ("delete".equals(actionType)){		
			search.put("editorMan", userInfo.getStaffId());//�༭��
			int i = maintainRoadFacade.deleteMaintainRoad(search);
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("	<value>").append(""+i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";
			
		}else if ("view".equals(actionType)){;
			search = (HashMap)(maintainRoadFacade.findMaintainRoad(search).get(0));
			return "view";
			
		}	
		return ERROR;
	}
	public MaintainRoadFacade getMaintainRoadFacade() {
		return maintainRoadFacade;
	}
	public void setMaintainRoadFacade(MaintainRoadFacade maintainRoadFacade) {
		this.maintainRoadFacade = maintainRoadFacade;
	}
	public List getMaintainRoadList() {
		return maintainRoadList;
	}
	public void setMaintainRoadList(List maintainRoadList) {
		this.maintainRoadList = maintainRoadList;
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
