package net.trust.application.baseArchives.institutionManage.action;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import net.trust.PaginactionAction;
import net.trust.application.baseArchives.institutionManage.domain.InstitutionFacade;
import net.trust.application.systemManage.manager.dto.UserInfo;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.opensymphony.xwork.ActionContext;


/**
 * �������
 * @author zhengmh
 *
 */
public class InstitutionManageAction extends PaginactionAction{
//	���ڵ��Ի��ӡ��Ϣ��Log
	Log log = LogFactory.getLog(InstitutionManageAction.class);
	private InstitutionFacade institutionFacade;
	
	private List institutionList;
	private HashMap search=new HashMap();
	private String actionType;		
	private String action;
	private String serviceName;
	private String xml;
	private String json;
	
	public String execute() throws Exception {
		UserInfo userInfo=(UserInfo)ActionContext.getContext().getSession().get("UserInfo");
		search.put("staffId", userInfo.getStaffId());
		
		if ("".equals(actionType) || null == actionType){
			if(super.queryFlag==0){//�жϲ�ѯ״̬				
				search.put("staffId", userInfo.getStaffId());
				super.setPageRecord(15);//����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search);	//���ò�ѯ����
				super.setCount(institutionFacade.findInstitutionCount(search));//��ȡ��ѯ����ܼ�¼��
			}
			search = (HashMap)super.getParameter();
			institutionList = institutionFacade.findInstitutionInfo(search);
			return "search";
			
		}else if ("new".equals(actionType)){
			action = "insert";
			return "new";			
			
		}else if ("insert".equals(actionType)){
			search.put("createMan", userInfo.getStaffId());//������
			int i = institutionFacade.insertInstitution(search);
			if (i>0){
				super.addActionMessage("��ӻ�����Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_InstitutionManage.window.location.reload();");			
				return SUCCESS;
			}else {
				super.addActionMessage("��ӻ�����Ϣ,����ʧ��");				
				return ERROR;
			}
			
		}else if ("edit".equals(actionType)){;
			search = (HashMap)(institutionFacade.findInstitutionInfo(search).get(0));
			action = "update";
			return "edit";
		}else if ("update".equals(actionType)){	
			search.put("editorMan", userInfo.getStaffId());//�༭��
			int i = institutionFacade.updateInstitutionInfo(search);
			if (i>=0){				
				super.addActionMessage("�޸Ļ�����Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_InstitutionManage.window.location.reload();");		
				return SUCCESS;
			}else {
				super.addActionMessage("�޸Ļ�����Ϣ,����ʧ��");				
				return ERROR;
			}
			
		}else if ("delete".equals(actionType)){		
			search.put("editorMan", userInfo.getStaffId());//�༭��
			int i = institutionFacade.deleteInstitutionInfo(search);							
			serviceName = "ɾ��������Ϣ";				
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("	<value>").append(""+i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";			
		}else if ("view".equals(actionType)){
			search = (HashMap)(institutionFacade.findInstitutionInfo(search).get(0));
			return "view";
		}
		
		return ERROR;
	}
	
	public String ajaxJson(){
		UserInfo userInfo=(UserInfo)ActionContext.getContext().getSession().get("UserInfo");
		search.put("staffId", userInfo.getStaffId());

		institutionList = institutionFacade.findInstitutionInfo(search);
		Iterator it = institutionList.iterator();
		StringBuffer sb = new StringBuffer();
		HashMap tmp = null;
		while (it.hasNext()){
			tmp = (HashMap)it.next();
			if (null != sb && !"".equals(sb.toString())){
				sb.append(",");
    		}
			sb.append("{");
			sb.append("\"text\":\"").append(tmp.get("company_name")).append("\"");
			sb.append(",\"id\":\"").append(tmp.get("company_id")).append("\"");
			sb.append(",\"leaf\":true");
			sb.append("}");
		}
		json = "[" +sb.toString()+ "]";
		return "json";
	}
	
	public Log getLog() {
		return log;
	}
	public void setLog(Log log) {
		this.log = log;
	}
	public InstitutionFacade getInstitutionFacade() {
		return institutionFacade;
	}
	public void setInstitutionFacade(InstitutionFacade institutionFacade) {
		this.institutionFacade = institutionFacade;
	}
	public List getInstitutionList() {
		return institutionList;
	}
	public void setInstitutionList(List institutionList) {
		this.institutionList = institutionList;
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
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
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
	
}
