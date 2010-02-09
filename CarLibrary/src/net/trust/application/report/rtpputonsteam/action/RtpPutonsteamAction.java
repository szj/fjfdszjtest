package net.trust.application.report.rtpputonsteam.action;

import java.util.HashMap;
import java.util.List;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.opensymphony.xwork.ActionContext;

import net.trust.PaginactionAction;

import net.trust.application.carManage.putonsteam.domain.PutonsteamFacade;
import net.trust.application.report.rtpdistance.action.RtpDistanceAction;
import net.trust.application.report.rtpdistance.domain.RtpDistanceFacade;
import net.trust.application.report.rtpputonsteam.domain.RtpPutonsteamFacade;
import net.trust.application.systemManage.manager.dto.UserInfo;
/**
 * �ۺϱ���-->���͹���(�������������쳣)
 * @author zhemgmh
 *
 */
public class RtpPutonsteamAction extends PaginactionAction{
	private Log log = LogFactory.getLog(RtpDistanceAction.class);
	private RtpPutonsteamFacade rtpPutonsteamFacade;
	
	private List rtpPutonsteamList;

	private HashMap search = new HashMap();
	
	private String actionType;		
	private String action;
	private String xml;
	
	public String execute() throws Exception {
		UserInfo userInfo=(UserInfo)ActionContext.getContext().getSession().get("UserInfo");	
		search.put("staffId", userInfo.getStaffId());
		
		if ("".equals(actionType) || null == actionType){
			if(super.queryFlag==0){//�жϲ�ѯ״̬	
				if (search == null || search.size()==1){
					rtpPutonsteamList = new java.util.ArrayList();
					ActionContext.getContext().getSession().put("Qpagination",null);
					return "search";
				}
				super.setPageRecord(15);//����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search);	//���ò�ѯ����
				super.setCount(rtpPutonsteamFacade.findRtpPutonsteamCount(search));//��ȡ��ѯ����ܼ�¼��
			}
			this.exportFlag = "rtpPutonsteam";
			search = (HashMap)super.getParameter();
			rtpPutonsteamList = rtpPutonsteamFacade.findRtpPutonsteam(search);
			return "search";			
		}
		return ERROR;
	}


	/**
	 * @return the rtpPutonsteamFacade
	 */
	public RtpPutonsteamFacade getRtpPutonsteamFacade() {
		return rtpPutonsteamFacade;
	}


	/**
	 * @param rtpPutonsteamFacade the rtpPutonsteamFacade to set
	 */
	public void setRtpPutonsteamFacade(RtpPutonsteamFacade rtpPutonsteamFacade) {
		this.rtpPutonsteamFacade = rtpPutonsteamFacade;
	}


	/**
	 * @return the rtpPutonsteamList
	 */
	public List getRtpPutonsteamList() {
		return rtpPutonsteamList;
	}


	/**
	 * @param rtpPutonsteamList the rtpPutonsteamList to set
	 */
	public void setRtpPutonsteamList(List rtpPutonsteamList) {
		this.rtpPutonsteamList = rtpPutonsteamList;
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
