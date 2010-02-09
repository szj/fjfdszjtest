package net.trust.application.baseArchives.recunitInfo.action;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.opensymphony.xwork.ActionContext;

import net.trust.PaginactionAction;
import net.trust.application.baseArchives.recunitInfo.domain.RecUnitFacade;
import net.trust.application.systemManage.manager.dto.UserInfo;

/**
 * ������λ��Ϣ����
 * @author zhengmh
 *
 */
public class RecUnitInfoAction extends PaginactionAction{
//	���ڵ��Ի��ӡ��Ϣ��Log
	Log log = LogFactory.getLog(RecUnitInfoAction.class);
	private RecUnitFacade recUnitFacade;	
	private List recunitList;
	private HashMap search=new HashMap();
	private String actionType;		
	private String action;
	private String xml;
	private String json;
	private String serviceName;
	
	public String execute() throws Exception {
		UserInfo userInfo=(UserInfo)ActionContext.getContext().getSession().get("UserInfo");		
		search.put("staffId", userInfo.getStaffId());
		if ("".equals(actionType) || null == actionType){
			if(super.queryFlag==0){//�жϲ�ѯ״̬				
				super.setPageRecord(15);//����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search);	//���ò�ѯ����
				super.setCount(recUnitFacade.findRecUnitInfoCount(search));//��ȡ��ѯ����ܼ�¼��
			}
			search = (HashMap)super.getParameter();
			recunitList = recUnitFacade.findRecUnitInfo(search);
			return "search";
			
		}else if ("new".equals(actionType)){
			action = "insert";
			return "new";	
			
		}else if ("insert".equals(actionType)){
			search.put("createMan", userInfo.getStaffId());//������
			int i = recUnitFacade.insertRecUnitInfo(search);
			if (i>0){
				super.addActionMessage("���������λ��Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_ComeandgoUnitInfo.window.location.reload();");				
				return SUCCESS;
			}else {
				super.addActionMessage("���������λ��Ϣ,����ʧ��");
				return ERROR;
			}
			
		}else if ("edit".equals(actionType)){;
			search.put("editorMan", userInfo.getStaffId());//�༭��
			search = (HashMap)(recUnitFacade.findRecUnitInfo(search).get(0));			
			action = "update";
			return "edit";
			
		}else if ("update".equals(actionType)){			
			int i = recUnitFacade.updateRecUnitInfo(search);
			if (i>=0){				
				super.addActionMessage("�޸�������λ��Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_ComeandgoUnitInfo.window.location.reload();");					
				return SUCCESS;
			}else {
				super.addActionMessage("�޸�������λ��Ϣ,����ʧ��");
				return ERROR;
			}
			
		}else if ("delete".equals(actionType)){		
			search.put("editorMan", userInfo.getStaffId());//�༭��
			int i = recUnitFacade.deleteRecUnitInfo(search);
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("<value>").append(""+i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";
			
		}else if ("view".equals(actionType)){
			search = (HashMap)(recUnitFacade.findRecUnitInfo(search).get(0));			
			return "view";
			
		}
		return ERROR;
	}
	
	public String ajaxJson(){
		recunitList = recUnitFacade.findRecUnitInfo(search);
		Iterator it = recunitList.iterator();
		StringBuffer sb = new StringBuffer();
		HashMap tmp = null;
		while (it.hasNext()){
			tmp = (HashMap)it.next();
			if (null != sb && !"".equals(sb.toString())){
				sb.append(",");
    		}
			sb.append("{");
			sb.append("\"text\":\"").append(tmp.get("coop_unit_name")).append("\"");
			sb.append(",\"id\":\"").append(tmp.get("coop_unit_id")).append("\"");
			sb.append(",\"leaf\":true");
			sb.append("}");
		}
		json = "[" +sb.toString()+ "]";
		return "json";
	}
	
	public RecUnitFacade getRecUnitFacade() {
		return recUnitFacade;
	}
	public void setRecUnitFacade(RecUnitFacade recUnitFacade) {
		this.recUnitFacade = recUnitFacade;
	}
	public List getRecunitList() {
		return recunitList;
	}
	public void setRecunitList(List recunitList) {
		this.recunitList = recunitList;
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
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public String getJson() {
		return json;
	}
	public void setJson(String json) {
		this.json = json;
	}
	
}
