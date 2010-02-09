package com.qzgf.NetStore.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.qzgf.NetStore.dao.IMenuDAO;
import com.qzgf.NetStore.dao.IRoleDAO;
import com.qzgf.NetStore.dao.IRoleValueDAO;
import com.qzgf.NetStore.persistence.Menu;
import com.qzgf.NetStore.persistence.Role;
import com.qzgf.NetStore.persistence.RoleValue;
import com.qzgf.NetStore.pub.Page;
import com.qzgf.NetStore.service.IRoleService;

public class RoleService implements IRoleService {
	IRoleDAO roleDAO;
	IRoleValueDAO roleValueDAO;
    IMenuDAO menuDAO;
	public IRoleDAO getRoleDAO() {
		return roleDAO;
	}
	public void setRoleDAO(IRoleDAO roleDAO) {
		this.roleDAO = roleDAO;
	}
	/**
	 * @return the roleValueDAO
	 */
	public IRoleValueDAO getRoleValueDAO() {
		return roleValueDAO;
	}
	/**
	 * @param roleValueDAO the roleValueDAO to set
	 */
	public void setRoleValueDAO(IRoleValueDAO roleValueDAO) {
		this.roleValueDAO = roleValueDAO;
	}
	/**
	 * @return the menoDAO
	 */
	public IMenuDAO getMenuDAO() {
		return menuDAO;
	}
	/**
	 * @param menoDAO the menoDAO to set
	 */
	public void setMenuDAO(IMenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}
	@SuppressWarnings("unchecked")
	@Override
	/**
	 * �˵��б�
	 */
	public Page queryRoles(int npage) {
		return this.roleDAO.queryRoles(npage);
	}
	
	public List queryRoles() {
		return this.roleDAO.queryRoles();
	}

	@SuppressWarnings("unchecked")
	/**
	 * ����id�õ��˵���Ϣ
	 */
	public Map queryRoleById(String id){
		return this.roleDAO.queryRoleById(id);
	}
	/**
	 * ���²˵�
	 * @param Role
	 * @return
	 */
	public boolean updateRole(Role role){
		return this.roleDAO.updateRole(role);
	}
	/**
	 * ��id��ɾ���˵�
	 * @param id
	 * @return
	 */
	public boolean deleteRoleByID(String id){
		boolean flag=this.roleDAO.deleteRole(id);
		//ͬʱɾ���ӱ���Ϣ
		flag=flag&this.roleValueDAO.deleteAllRoleValue("roleId", id);
		return flag;
	}
	/**
	 * ���Ӳ˵�
	 * @param Role
	 * @return
	 */
	public boolean addRole(Role role){
		
		boolean flag=this.roleDAO.addRole(role);
		//ͬʱ�����ӽ��
		List menuList=this.menuDAO.queryMenus();
		Iterator it=menuList.iterator();  
		RoleValue roleValue=new RoleValue();
		while(it.hasNext())
		{
			String menCode=((Menu)it.next()).getTheCode();
			roleValue.setFunisShow(Byte.valueOf("0"));
			roleValue.setMenuCode(menCode);
			roleValue.setPowerValue("111111");
			roleValue.setRemark("");
			roleValue.setRoleId(Integer.valueOf(role.getRoleId().toString()));
			flag=flag&this.roleValueDAO.addRoleValue(roleValue);
		}
		return flag;
	}
}
