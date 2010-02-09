package net.trust.application.systemManage.menu.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import net.trust.PaginactionAction;
import net.trust.application.systemManage.menu.domain.MenuFacade;
import net.trust.application.systemManage.menu.dto.MenuInfo;


public class MenuAction extends PaginactionAction {
	private Log log = LogFactory.getLog(MenuAction.class);
	private MenuFacade menuFacade;
	
	private List menus;
	
	private MenuInfo menuInfo = new MenuInfo();
	private String actionType;
	
	public String execute() throws Exception {
		if(null == actionType || "".equals(actionType)){
			if(menuInfo.getSuperId()==null || menuInfo.getSuperId().trim().length()==0)
	    		menuInfo.setSuperId("Root");
	    	menus=menuFacade.findMenuNodesBySuperId(menuInfo);
	    	
	    	if("1".equals(menuInfo.getIsMenu()))
	    		return "resMenus";//�˵��ڵ�
	    	else
	    		return "resFuns";//���ܽڵ�
		}else if("insert".equals(actionType)){
			int i=menuFacade.insertMenuInfo(menuInfo);
			if (i>0){
				super.addActionMessage("��Ӳ˵�,�����ɹ�");
				super.reload.append("parent.FunListFrm.window.location.reload();");
				super.reload.append("parent.MenuListFrm.window.location.reload();");
				return SUCCESS;
			}else{
				super.addActionMessage("��Ӳ˵�,����ʧ��");
				return ERROR;
			}

		}else if("delete".equals(actionType)){
			menuInfo.setState("0");
    		int i=menuFacade.deleteMenuInfo(menuInfo);
    		
    		if (i>0){
    			super.addActionMessage("ɾ���˵�,�����ɹ�");
    			super.reload.append("parent.FunListFrm.window.location.reload();");
				super.reload.append("parent.MenuListFrm.window.location.reload();");
				return SUCCESS;
    		}else{
    			super.addActionMessage("ɾ���˵�,����ʧ��");
				return ERROR;
    		}

		}else if("update".equals(actionType)){
			int i=menuFacade.updateMenuInfo(menuInfo);
			if (i>0){
				super.addActionMessage("�޸Ĳ˵�,�����ɹ�");
				super.reload.append("parent.FunListFrm.window.location.reload();");
				super.reload.append("parent.MenuListFrm.window.location.reload();");
				return SUCCESS;
			}else{
				super.addActionMessage("�޸Ĳ˵�,����ʧ��");
				return ERROR;
			}
		}else if("edit".equals(actionType)){
			menuInfo=menuFacade.findMenuInfoById(menuInfo.getMenuId());
			actionType="update";
			return "edit";
		}else if("new".equals(actionType)){
			actionType="insert";
			return "new";
		}
		
		return ERROR;
	}

	public MenuFacade getMenuFacade() {
		return menuFacade;
	}

	public void setMenuFacade(MenuFacade menuFacade) {
		this.menuFacade = menuFacade;
	}

	public List getMenus() {
		return menus;
	}

	public void setMenus(List menus) {
		this.menus = menus;
	}

	public MenuInfo getMenuInfo() {
		return menuInfo;
	}

	public void setMenuInfo(MenuInfo menuInfo) {
		this.menuInfo = menuInfo;
	}

	public String getActionType() {
		return actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}
	
}
