package net.trust.application.systemManage.warninglog.action;

import java.util.HashMap;
import java.util.List;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.opensymphony.xwork.ActionContext;

import net.trust.PaginactionAction;
import net.trust.application.systemManage.manager.dto.UserInfo;
import net.trust.application.systemManage.warninglog.domain.WarningLogManageFacade;
/**
 * Ԥ������
 *
 */
public class WarningLogManageAction extends PaginactionAction {
	private Log log = LogFactory.getLog(WarningLogManageAction.class);
	private WarningLogManageFacade warningLogManageFacade;
	
	private List warningLogList;
	private HashMap search = new HashMap();
	
	private String actionType;
	private String action;
	private String xml;
	
	public String execute() throws Exception {
		UserInfo userInfo = (UserInfo) ActionContext.getContext().getSession().get("UserInfo");
		search.put("staffId", userInfo.getStaffId());
		
		if ("".equals(actionType) || null == actionType) {
			if (super.queryFlag == 0) {// �жϲ�ѯ״̬
				super.setPageRecord(15);// ����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search); // ���ò�ѯ����
				super.setCount(warningLogManageFacade.findWarningLogCount(search));// ��ȡ��ѯ����ܼ�¼��
			}
			search = (HashMap) super.getParameter();
			warningLogList = warningLogManageFacade.findWarningLog(search);
			return "search";
		}else if ("opt".equals(actionType)){
			int i = warningLogManageFacade.updateWarningLog(search);
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<result>");
			sb.append("	<value>").append(""+i).append("</value>");
			sb.append("</result>");
			xml = sb.toString();
			return "xml";
		}
		return ERROR;
	}

	public WarningLogManageFacade getWarningLogManageFacade() {
		return warningLogManageFacade;
	}

	public void setWarningLogManageFacade(
			WarningLogManageFacade warningLogManageFacade) {
		this.warningLogManageFacade = warningLogManageFacade;
	}

	public List getWarningLogList() {
		return warningLogList;
	}

	public void setWarningLogList(List warningLogList) {
		this.warningLogList = warningLogList;
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
