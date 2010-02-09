package net.trust.application.systemManage.log.action;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork.ActionContext;

import net.trust.PaginactionAction;
import net.trust.application.systemManage.log.domain.LogFacade;
import net.trust.application.systemManage.log.dto.OperateLog;
import net.trust.application.systemManage.manager.dto.UserInfo;

public class LogAcition extends PaginactionAction {
	private Log log = LogFactory.getLog(LogAcition.class);
	private OperateLog operateLog = new OperateLog();
	private HashMap search = new HashMap();
	private List logList;
	private LogFacade logFacade;

	public String execute() throws Exception {
		UserInfo userInfo=(UserInfo)ActionContext.getContext().getSession().get("UserInfo");		
		search.put("staffId", userInfo.getStaffId());	
		if(super.queryFlag==0){//�жϲ�ѯ״̬
		search.put("operateLog", operateLog);
		super.setPageRecord(15);// ����ҳ�浥ҳ��ʾ�ܼ�¼��
		super.setParameter(search); // ���ò�ѯ����
		super.setCount(logFacade.findLogCount(search));// ��ȡ��ѯ����ܼ�¼��
		}
		search = (HashMap) super.getParameter();
		logList = logFacade.findLogInfo(search);
		return "search";
	}

	public Log getLog() {
		return log;
	}

	public void setLog(Log log) {
		this.log = log;
	}

	public OperateLog getOperateLog() {
		return operateLog;
	}

	public void setOperateLog(OperateLog operateLog) {
		this.operateLog = operateLog;
	}

	public HashMap getSearch() {
		return search;
	}

	public void setSearch(HashMap search) {
		this.search = search;
	}

	public List getLogList() {
		return logList;
	}

	public void setLogList(List logList) {
		this.logList = logList;
	}

	public LogFacade getLogFacade() {
		return logFacade;
	}

	public void setLogFacade(LogFacade logFacade) {
		this.logFacade = logFacade;
	}

}
