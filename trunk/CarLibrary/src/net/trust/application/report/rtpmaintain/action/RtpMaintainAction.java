package net.trust.application.report.rtpmaintain.action;

import java.util.HashMap;
import java.util.List;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.opensymphony.xwork.ActionContext;

import net.trust.PaginactionAction;
import net.trust.application.carManage.maintainmanage.domain.MaintainManageFacade;
import net.trust.application.report.rtpdistance.action.RtpDistanceAction;
import net.trust.application.report.rtpdistance.domain.RtpDistanceFacade;
import net.trust.application.report.rtpmaintain.domain.RtpMaintainFacade;
import net.trust.application.systemManage.manager.dto.UserInfo;
/**
 * �ۺϱ���-->��������
 * @author fjfdszj
 *
 */
public class RtpMaintainAction extends PaginactionAction{
	private Log log = LogFactory.getLog(RtpDistanceAction.class);
	private RtpMaintainFacade rtpMaintainFacade;

	private HashMap search = new HashMap();
	private List rtpMaintainList;
	
	private String actionType;		
	private String action;
	private String xml;
	
	public String execute() throws Exception {
		UserInfo userInfo=(UserInfo)ActionContext.getContext().getSession().get("UserInfo");
		if ("".equals(actionType) || null == actionType){
			if(super.queryFlag==0){//�жϲ�ѯ״̬				
				super.setPageRecord(15);//����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search);	//���ò�ѯ����
				super.setCount(rtpMaintainFacade.findRtpMaintainCount(search));//��ȡ��ѯ����ܼ�¼��
			}
			this.exportFlag = "rtpMaintain";
			search = (HashMap)super.getParameter();
			search.put("staffId", userInfo.getStaffId());
			rtpMaintainList = rtpMaintainFacade.findRtpMaintain(search);
			return "search";
			
		}
		return ERROR;
	}






	/**
	 * @return the rtpMaintainFacade
	 */
	public RtpMaintainFacade getRtpMaintainFacade() {
		return rtpMaintainFacade;
	}






	/**
	 * @param rtpMaintainFacade the rtpMaintainFacade to set
	 */
	public void setRtpMaintainFacade(RtpMaintainFacade rtpMaintainFacade) {
		this.rtpMaintainFacade = rtpMaintainFacade;
	}






	/**
	 * @return the rtpMaintainList
	 */
	public List getRtpMaintainList() {
		return rtpMaintainList;
	}






	/**
	 * @param rtpMaintainList the rtpMaintainList to set
	 */
	public void setRtpMaintainList(List rtpMaintainList) {
		this.rtpMaintainList = rtpMaintainList;
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
