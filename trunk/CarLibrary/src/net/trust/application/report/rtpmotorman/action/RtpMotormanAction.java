package net.trust.application.report.rtpmotorman.action;

import java.util.HashMap;
import java.util.List;

import net.trust.PaginactionAction;
import net.trust.application.report.rtpmotorman.domain.RtpMotormanFacade;
import net.trust.application.systemManage.manager.dto.UserInfo;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.opensymphony.xwork.ActionContext;
/**
 * �ۺϱ��� -�� ������ѯ
 * @author chenqf
 *
 */
public class RtpMotormanAction extends PaginactionAction{
	private Log log = LogFactory.getLog(RtpMotormanAction.class);
	private RtpMotormanFacade rtpMotormanFacade;
	
	private List rtpMotormanList;
	
	private HashMap search = new HashMap();
	
	private String actionType;		
	private String action;
	private String xml;
	
	public String execute() throws Exception {
		UserInfo userInfo=(UserInfo)ActionContext.getContext().getSession().get("UserInfo");
		if ("".equals(actionType) || null == actionType){
			if(super.queryFlag==0){//�жϲ�ѯ״̬	
				super.setPageRecord(15);//����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search);	//���ò�ѯ����
				super.setCount(rtpMotormanFacade.findRtpMotormanCount(search));//��ȡ��ѯ����ܼ�¼��
			}
			this.exportFlag = "rtpMotorman";
			search = (HashMap)super.getParameter();
			search.put("staffId", userInfo.getStaffId());
			rtpMotormanList = rtpMotormanFacade.findRtpMotorman(search);
			return "search";			
		}
		return ERROR;
	}

	/**
	 * @return the rtpMotormanFacade
	 */
	public RtpMotormanFacade getRtpMotormanFacade() {
		return rtpMotormanFacade;
	}

	/**
	 * @param rtpMotormanFacade the rtpMotormanFacade to set
	 */
	public void setRtpMotormanFacade(RtpMotormanFacade rtpMotormanFacade) {
		this.rtpMotormanFacade = rtpMotormanFacade;
	}

	/**
	 * @return the rtpMotormanList
	 */
	public List getRtpMotormanList() {
		return rtpMotormanList;
	}

	/**
	 * @param rtpMotormanList the rtpMotormanList to set
	 */
	public void setRtpMotormanList(List rtpMotormanList) {
		this.rtpMotormanList = rtpMotormanList;
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
