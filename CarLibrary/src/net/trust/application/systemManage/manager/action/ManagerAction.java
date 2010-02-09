package net.trust.application.systemManage.manager.action;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork.ActionContext;

import net.trust.PaginactionAction;
import net.trust.application.systemManage.manager.domain.ManagerFacade;
import net.trust.application.systemManage.manager.dto.UserInfo;
import net.trust.security.MD5;

public class ManagerAction extends PaginactionAction{
	private Log log = LogFactory.getLog(ManagerAction.class);
	private ManagerFacade managerFacade;
	
	private UserInfo userInfo = new UserInfo();
	
	private List userList ;
	private String actionType;
	private String action;
	private HashMap search = new HashMap();
	private String serviceName;
	
	private List roleList ;//��ɫ�б�
	private String[] roleId;//Ҫ������ɫ��ID��
	
	private List cityList;//�����б�
	private String[] cityId;//Ҫ���������ID��
	
	private String oldPassword;//������
	private String password;	//������
	
	private String xml;
	private String json;
	
	public String execute() throws Exception {
		String res="";
		UserInfo userInfo2=(UserInfo)ActionContext.getContext().getSession().get("UserInfo");		
		 search.put("staffId2", userInfo2.getStaffId());
		if ("".equals(actionType) || null == actionType){
			if(super.queryFlag==0){//�жϲ�ѯ״̬
				search.put("userInfo",userInfo);
				super.setPageRecord(15);//����ҳ�浥ҳ��ʾ�ܼ�¼��
				super.setParameter(search);	//���ò�ѯ����
				super.setCount(managerFacade.findManagerInfoCount(search));//��ȡ��ѯ����ܼ�¼��
			}
			search=(HashMap)super.getParameter();					
			userList = managerFacade.findManagerInfo(search);
			if (search.containsKey("action")) {
				if ("extSearch".equals(search.get("action").toString())) {
					return "extSearch";
				}else if ("extSignSearch".equals(search.get("action").toString())) {
					return "extSignSearch";
				}
			} else {
				return "search";
			}
		}else if ("new".equals(actionType)){
			action = "insert";
			return "new";
		}else if ("insert".equals(actionType)){
			userInfo.setPassword(new MD5().StrToMd5(userInfo.getPassword()));
			int i = managerFacade.insertManagerInfo(userInfo);
			if (i>0){
				super.addActionMessage("��ӹ���Ա��Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_SystemManager.window.location.reload();");
				return SUCCESS;
			}else{
				super.addActionMessage("��ӹ���Ա��Ϣ,����ʧ��");
				return ERROR;
			}
		}else if ("edit".equals(actionType)){
			userInfo = managerFacade.findManagerById(userInfo);
			action = "update";
			
			return "edit";
		}else if ("update".equals(actionType)){
			if (userInfo.getPassword()!=null && !"".equals(userInfo.getPassword())){
				userInfo.setPassword(new MD5().StrToMd5(userInfo.getPassword()));
			}
			int i = managerFacade.updateManagerInfo(userInfo);
			if (i>0){
				super.addActionMessage("�޸Ĺ���Ա��Ϣ,�����ɹ�");
				addActionScript("parent.document.ifrm_SystemManager.window.location.reload();");
				return SUCCESS;
			}else{
				super.addActionMessage("�޸Ĺ���Ա��Ϣ,����ʧ��");
				return ERROR;
			}
		}else if ("delete".equals(actionType)){
			userInfo.setStaffState("0");
			int i = managerFacade.deleteManagerInfo(userInfo);
			serviceName = "ɾ����Ա��Ϣ";
			
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<delete>");
			sb.append("<value>").append(""+i).append("</value>");
			sb.append("</delete>");
			xml = sb.toString();
			return "xml";
		}else if ("role".equals(actionType)){
			userInfo.setTemp(userInfo2.getStaffId());
			roleList = managerFacade.findRole(userInfo);
			actionType="roleAllot";
			
			return "role";
		}else if ("roleAllot".equals(actionType)){
			int i = managerFacade.insertManagerRoleAllot(roleId,userInfo.getStaffId());
			this.addActionMessage("������Ϊ"+userInfo.getStaffNo()+ "��" + userInfo.getStaffName() +"��Ա�����ɫ�����ɹ���");
			return SUCCESS;
			
		}else if ("city".equals(actionType)){
			cityList = managerFacade.findCity(userInfo);
			actionType="cityAllot";
			
			return "city";
		}else if ("cityAllot".equals(actionType)){
			int i = managerFacade.insertManagerCityAllot(cityId,userInfo.getStaffId());
			this.addActionMessage("������Ϊ"+userInfo.getStaffNo()+ "��" + userInfo.getStaffName() +"��Ա������������ɹ���");
			return SUCCESS;

		}else if ("ifExist".equals(actionType)){
			search.put("userInfo",userInfo);
			int ifExist = managerFacade.findManagerInfoCount(search);
			java.lang.StringBuffer sb = new StringBuffer();
			sb.append("<isExist>");
			sb.append("	<value>").append(""+ifExist).append("</value>");
			sb.append("</isExist>");
			xml = sb.toString();
			return "xml";
		}
		return SUCCESS;
	}

	public String modifyPassword()throws Exception{
//		ȡ���Ự�еĵ�½����Ϣ
		UserInfo temp = (UserInfo)ActionContext.getContext().getSession().get("UserInfo");
		java.lang.StringBuffer sb = new StringBuffer();
		sb.append("<Result>");
		
		if (!temp.getPassword().toUpperCase().equals(new MD5().StrToMd5(oldPassword).toUpperCase())){
			sb.append("<errCode>0</errCode>");
			sb.append("<errMsg>�Բ���,������ľ����벻��ȷ��</errMsg>");
			sb.append("</Result>");
			xml = sb.toString();
			return SUCCESS;
		}
			
		userInfo.setPassword(new MD5().StrToMd5(password).toUpperCase());
		userInfo.setStaffId(temp.getStaffId());
		int i = managerFacade.updateManagerInfo(userInfo);
		
		//���޸������������Session
		temp.setPassword(userInfo.getPassword());
		ActionContext.getContext().getSession().put("UserInfo",temp);
		
		if (i ==0){
			sb.append("<errCode>0</errCode>");
			sb.append("<errMsg>�Բ���,�����޸�ʧ�ܡ�</errMsg>");
			sb.append("</Result>");
			xml = sb.toString();
			return SUCCESS;
		}
		
		sb.append("<errCode>1</errCode>");
		sb.append("<errMsg>�����޸ĳɹ���</errMsg>");
		sb.append("</Result>");
		xml = sb.toString();
		return SUCCESS;
	}

	public ManagerFacade getManagerFacade() {
		return managerFacade;
	}

	public void setManagerFacade(ManagerFacade managerFacade) {
		this.managerFacade = managerFacade;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public List getUserList() {
		return userList;
	}

	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}

	public void setUserList(List userList) {
		this.userList = userList;
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

	public HashMap getSearch() {
		return search;
	}

	public void setSearch(HashMap search) {
		this.search = search;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public List getRoleList() {
		return roleList;
	}

	public void setRoleList(List roleList) {
		this.roleList = roleList;
	}

	public String[] getRoleId() {
		return roleId;
	}

	public void setRoleId(String[] roleId) {
		this.roleId = roleId;
	}

	public String getXml() {
		return xml;
	}

	public void setXml(String xml) {
		this.xml = xml;
	}

	public List getCityList() {
		return cityList;
	}

	public void setCityList(List cityList) {
		this.cityList = cityList;
	}

	public String[] getCityId() {
		return cityId;
	}

	public void setCityId(String[] cityId) {
		this.cityId = cityId;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
