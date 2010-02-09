package net.trust.application.report.localitymanage.action;

import java.util.HashMap;
import java.util.List;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.opensymphony.xwork.ActionContext;

import net.trust.PaginactionAction;
import net.trust.application.report.localitymanage.domain.LocalityManageFacade;
import net.trust.application.systemManage.manager.dto.UserInfo;
/**
 * �ۺϱ��� -�� λ�ù���
 * @author chenqf
 *
 */
public class LocalityManageAction extends PaginactionAction{
	private Log log = LogFactory.getLog(LocalityManageAction.class);
	private LocalityManageFacade localityManageFacade;
	
	private HashMap search = new HashMap();
	private List localityList;
	
	private String actionType;		
	private String action;
	private String xml;

	public String execute() throws Exception {
		UserInfo userInfo=(UserInfo)ActionContext.getContext().getSession().get("UserInfo");		
		
		if ("".equals(actionType) || null == actionType){
			if(super.queryFlag==0){//�жϲ�ѯ״̬		
				if (search == null || search.size()==0){
					localityList = new java.util.ArrayList();
					ActionContext.getContext().getSession().put("Qpagination",null);
					return "search";
				}
				this.exportFlag = "localityManage";
				search.put("staffId", userInfo.getStaffId());
				search.put("maintainState", "1");
				super.setPageRecord(15);//����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search);	//���ò�ѯ����
				super.setCount(localityManageFacade.findLocalityManageCount(search));//��ȡ��ѯ����ܼ�¼��
			}
			search = (HashMap)super.getParameter();
			localityList = localityManageFacade.findLocalityManage(search);
			return "search";
		}
		return ERROR;
	}

	public LocalityManageFacade getLocalityManageFacade() {
		return localityManageFacade;
	}

	public void setLocalityManageFacade(LocalityManageFacade localityManageFacade) {
		this.localityManageFacade = localityManageFacade;
	}

	public HashMap getSearch() {
		return search;
	}

	public void setSearch(HashMap search) {
		this.search = search;
	}

	public List getLocalityList() {
		return localityList;
	}

	public void setLocalityList(List localityList) {
		this.localityList = localityList;
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
