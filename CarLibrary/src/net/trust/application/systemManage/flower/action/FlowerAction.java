package net.trust.application.systemManage.flower.action;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.opensymphony.xwork.ActionContext;

import net.trust.PaginactionAction;
import net.trust.application.systemManage.flower.domain.FlowerFacade;
import net.trust.application.systemManage.manager.dto.UserInfo;


public class FlowerAction extends PaginactionAction{
	// ���ڵ��Ի��ӡ��Ϣ��Log
	private Log log = LogFactory.getLog(FlowerAction.class);
	private FlowerFacade flowerFacade;//�ӿ�����
	
    //�û�ǰ̨������List����
	private List flowerDefineList;//���̶���
	private List flowerNodeList;  //���̽��
	
	//���ݴ������
	private HashMap search = new HashMap();
	private HashMap flowerNode = new HashMap();

	//��������
	private String actionType;
	private String action;
	private String xml;
	
	public String execute() throws Exception {
		//�û��е�seesion��Ϣ����
		UserInfo userInfo = (UserInfo) ActionContext.getContext().getSession().get("UserInfo");
		search.put("staffId", userInfo.getStaffId());
		if ("".equals(actionType) || null == actionType) {
			if (super.queryFlag == 0) {// �жϲ�ѯ״̬
				super.setPageRecord(15);// ����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search); // ���ò�ѯ����
				super.setCount(flowerFacade.findFlowerDefineCount(search));// ��ȡ��ѯ����ܼ�¼��
			}
			search = (HashMap) super.getParameter();
			flowerDefineList = flowerFacade.findFlowerDefine(search);
			return "search";
		} else if ("new".equals(actionType)) {
			action = "insert";
			return "new";
		} else if ("insert".equals(actionType)) {
			search.put("createMan", userInfo.getStaffId());// ������
			//�������ӱ�һ�𱣴棬������search��List�е�"st"���洦������
			search = flowerFacade.insertFlowerDefine(search, flowerNode);
			int i = Integer.valueOf(search.get("st").toString());
			if (i > 0) {
				super.addActionMessage("������̶���,�����ɹ�");
				addActionScript("parent.document.ifrm_FlowerInfo.window.location.reload();");
				return  SUCCESS;
			} else {
				super.addActionMessage("����ɳ���Ϣ,����ʧ��");
				return ERROR;
			}

		} else if ("edit".equals(actionType)) {
			flowerNodeList = flowerFacade.findFlowerNode(search);
			search = (HashMap) (flowerFacade.findFlowerDefine(search).get(0));
			action = "update";
			return "edit";
		} else if ("update".equals(actionType)) {
			search.put("editorMan", userInfo.getStaffId());// �༭��
			//�������ӱ�һ����£�������search��List�е�"st"���洦������
			search = flowerFacade.updateFlowerDefine(search, flowerNode);
			int i = Integer.valueOf(search.get("st").toString());
			if (i > 0) {
				super.addActionMessage("�޸��ɳ���Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_FlowerInfo.window.location.reload();");
				return SUCCESS;
			} else {
				super.addActionMessage("�޸��ɳ���Ϣ,����ʧ��");
				return ERROR;
			}
		} else if ("delete".equals(actionType)) {
			search.put("editorMan", userInfo.getStaffId());// �༭��
			int i = flowerFacade.deleteFlowerDefine(search);
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("<value>").append("" + i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";
		} else if ("view".equals(actionType)) {
			flowerNodeList = flowerFacade.findFlowerNode(search);
			search = (HashMap) (flowerFacade.findFlowerDefine(search).get(0));
			return "view";
		}
		return ERROR;
	}

	/**
	 * @return the flowerFacade
	 */
	public FlowerFacade getFlowerFacade() {
		return flowerFacade;
	}

	/**
	 * @param flowerFacade the flowerFacade to set
	 */
	public void setFlowerFacade(FlowerFacade flowerFacade) {
		this.flowerFacade = flowerFacade;
	}

	/**
	 * @return the flowerDefineList
	 */
	public List getFlowerDefineList() {
		return flowerDefineList;
	}

	/**
	 * @param flowerDefineList the flowerDefineList to set
	 */
	public void setFlowerDefineList(List flowerDefineList) {
		this.flowerDefineList = flowerDefineList;
	}

	/**
	 * @return the flowerNodeList
	 */
	public List getFlowerNodeList() {
		return flowerNodeList;
	}

	/**
	 * @param flowerNodeList the flowerNodeList to set
	 */
	public void setFlowerNodeList(List flowerNodeList) {
		this.flowerNodeList = flowerNodeList;
	}

	/**
	 * @return the search
	 */
	public HashMap getSearch() {
		return search;
	}

	/**
	 * @param search the search to set
	 */
	public void setSearch(HashMap search) {
		this.search = search;
	}

	/**
	 * @return the flowerNode
	 */
	public HashMap getFlowerNode() {
		return flowerNode;
	}

	/**
	 * @param flowerNode the flowerNode to set
	 */
	public void setFlowerNode(HashMap flowerNode) {
		this.flowerNode = flowerNode;
	}

	/**
	 * @return the actionType
	 */
	public String getActionType() {
		return actionType;
	}

	/**
	 * @param actionType the actionType to set
	 */
	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	/**
	 * @return the action
	 */
	public String getAction() {
		return action;
	}

	/**
	 * @param action the action to set
	 */
	public void setAction(String action) {
		this.action = action;
	}

	/**
	 * @return the xml
	 */
	public String getXml() {
		return xml;
	}

	/**
	 * @param xml the xml to set
	 */
	public void setXml(String xml) {
		this.xml = xml;
	}
}
