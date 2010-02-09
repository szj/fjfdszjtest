package net.trust.application.systemManage.role.action;

import java.util.HashMap;
import java.util.List;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.opensymphony.xwork.ActionContext;

import net.sf.json.JSONArray;
import net.trust.PaginactionAction;
import net.trust.application.systemManage.manager.dto.UserInfo;
import net.trust.application.systemManage.role.domain.RoleFacade;
import net.trust.utils.PubFunction;
import net.trust.utils.node.NodesUtil;

/**
 * ����Ա�û���
 *
 */
public class RoleInfoAction extends PaginactionAction{
//	���ڵ��Ի��ӡ��Ϣ��Log
	Log log = LogFactory.getLog(RoleInfoAction.class);
	private RoleFacade roleFacade;	
	private List roleInfoList;
	private HashMap search=new HashMap();
	
	private String actionType;		
	private String action;
	
	private String xml;
	private String json = "";
	
	private String superId = "";
	
	private String CheckData[];//�û�ѡ��Ľ�ɫ
	
	public String execute() throws Exception {
		UserInfo userInfo=(UserInfo)ActionContext.getContext().getSession().get("UserInfo");		
		search.put("staffId", userInfo.getStaffId());	
		if ("".equals(actionType) || null == actionType){
			if(super.queryFlag==0){//�жϲ�ѯ״̬				
				super.setPageRecord(15);//����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search);	//���ò�ѯ����
				super.setCount(roleFacade.findRoleCount(search));//��ȡ��ѯ����ܼ�¼��
			}
			search = (HashMap)super.getParameter();
			roleInfoList = roleFacade.findRoleInfo(search);
			
			return "search";
			
		}else if ("new".equals(actionType)){			
			action = "insert";
			return "new";	
			
		}else if ("insert".equals(actionType)){			
			search.put("staffId", userInfo.getStaffId());			
			int i = roleFacade.insertRole(search);
			if (i>0){				
				super.addActionMessage("��ӽ�ɫ��Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_UserRole.window.location.reload();");			
				return SUCCESS;
			}else {
				super.addActionMessage("��ӽ�ɫ��Ϣ,����ʧ��");				
				return ERROR;
			}
			
		}else if ("edit".equals(actionType)){			
			search = (HashMap)(roleFacade.findRoleInfo(search).get(0));				
			action = "update";
			return "edit";
		}else if ("update".equals(actionType)){			
			int i = roleFacade.updateRoleInfo(search);
			if (i>=0){				
				super.addActionMessage("�޸Ľ�ɫ��Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_UserRole.window.location.reload();");			
				return SUCCESS;
			}else {
				super.addActionMessage("�޸Ľ�ɫ��Ϣ,����ʧ��");				
				return ERROR;
			}
			
		}else if ("delete".equals(actionType)){			
			int i = roleFacade.deleteRoleInfo(search);							
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("<value>").append(""+i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";			
		}else if ("menuTreeJson".equals(actionType)){
			
			search.put("superId", superId);
			roleInfoList = roleFacade.execMenuTreeProc(search);
			NodesUtil nu = new NodesUtil();
			xml = nu.getTreeNodes(roleInfoList,true);
			return "xml";

			
		}else if ("allot".equals(actionType)){
			roleFacade.insertRoleMenu(CheckData, PubFunction.getNulltoStr(search.get("roleId")), superId);
			
			addActionMessage("����Ȩ�޲����ɹ�");
			return SUCCESS;
		}
		
		return ERROR;
	}
	public RoleFacade getRoleFacade() {
		return roleFacade;
	}
	public void setRoleFacade(RoleFacade roleFacade) {
		this.roleFacade = roleFacade;
	}
	public List getRoleInfoList() {
		return roleInfoList;
	}
	public void setRoleInfoList(List roleInfoList) {
		this.roleInfoList = roleInfoList;
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
	public String getJson() {
		return json;
	}
	public void setJson(String json) {
		this.json = json;
	}
	public String getSuperId() {
		return superId;
	}
	public void setSuperId(String superId) {
		this.superId = superId;
	}
	public String[] getCheckData() {
		return CheckData;
	}
	public void setCheckData(String[] checkData) {
		CheckData = checkData;
	}
	
}
