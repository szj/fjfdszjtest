package net.trust.application.carManage.staffcheckin.action;

import java.util.HashMap;
import java.util.List;

import net.trust.PaginactionAction;
import net.trust.application.carManage.staffcheckin.domain.StaffCheckinManageFacade;
import net.trust.application.systemManage.manager.dto.UserInfo;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.opensymphony.xwork.ActionContext;
/**
 * ��Ա���ڹ���
 *
 */
public class StaffCheckinManageAction extends PaginactionAction{
	private Log log = LogFactory.getLog(StaffCheckinManageAction.class);
	
	private StaffCheckinManageFacade staffCheckinManageFacade;

	private HashMap search = new HashMap();
	private List staffCheckinList;
	
	private String actionType;		
	private String action;
	private String xml;
	
	private String method;//����Ϊic��1,��ic��
	
	public String execute() throws Exception {
		UserInfo userInfo=(UserInfo)ActionContext.getContext().getSession().get("UserInfo");		
		search.put("staffId", userInfo.getStaffId());
		search.put("method", "1");
		if ("".equals(actionType) || null == actionType){
			//method:1Ϊ(��IC�г���¼) ����Ϊ(δ��IC)
			method=search.get("method").toString();
			if(super.queryFlag==0){//�жϲ�ѯ״̬				
				search.put("maintainState", "1");
				super.setPageRecord(15);//����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search);	//���ò�ѯ����
				super.setCount(staffCheckinManageFacade.findStaffCheckinCount(search));//��ȡ��ѯ����ܼ�¼��
			}
			this.exportFlag = "staffCheckinManage";
			search = (HashMap)super.getParameter();
			staffCheckinList = staffCheckinManageFacade.findStaffCheckin(search);
			return "search";
		}
		
		return ERROR;
	}
	
	public String staffCheckinex() throws Exception {
		UserInfo userInfo=(UserInfo)ActionContext.getContext().getSession().get("UserInfo");		
		search.put("staffId", userInfo.getStaffId());
		search.put("method", "0");
		if ("".equals(actionType) || null == actionType){
			//method:1Ϊ(��IC�г���¼) ����Ϊ(δ��IC)
			method=search.get("method").toString();//�Ƴ�����
			search.remove("method");
			if(super.queryFlag==0){//�жϲ�ѯ״̬				
				search.put("maintainState", "1");
				super.setPageRecord(15);//����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search);	//���ò�ѯ����
				super.setCount(staffCheckinManageFacade.findStaffCheckinCount(search));//��ȡ��ѯ����ܼ�¼��
			}
			this.exportFlag = "staffCheckinManage";
			search = (HashMap)super.getParameter();
			search.remove("method");
			staffCheckinList = staffCheckinManageFacade.findStaffCheckin(search);
			return "search";
		}
		return ERROR;
	}


	public StaffCheckinManageFacade getStaffCheckinManageFacade() {
		return staffCheckinManageFacade;
	}

	public void setStaffCheckinManageFacade(
			StaffCheckinManageFacade staffCheckinManageFacade) {
		this.staffCheckinManageFacade = staffCheckinManageFacade;
	}

	public HashMap getSearch() {
		return search;
	}

	public void setSearch(HashMap search) {
		this.search = search;
	}

	public List getStaffCheckinList() {
		return staffCheckinList;
	}

	public void setStaffCheckinList(List staffCheckinList) {
		this.staffCheckinList = staffCheckinList;
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

	/**
	 * @return the method
	 */
	public String getMethod() {
		return method;
	}

	/**
	 * @param method the method to set
	 */
	public void setMethod(String method) {
		this.method = method;
	}
	
	
}
