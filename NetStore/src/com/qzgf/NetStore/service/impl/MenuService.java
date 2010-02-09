package com.qzgf.NetStore.service.impl;

import java.util.List;
import java.util.Map;

import com.qzgf.NetStore.dao.IMenuDAO;
import com.qzgf.NetStore.persistence.Menu;
import com.qzgf.NetStore.service.IMenuService;

public class MenuService implements IMenuService {
    IMenuDAO menuDAO;
    
	public IMenuDAO getMenuDAO() {
		return menuDAO;
	}
	public void setMenuDAO(IMenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}
	@SuppressWarnings("unchecked")
	@Override
	/**
	 * �˵��б�
	 */
	public List queryMenus() {
		return this.menuDAO.queryMenus();
	}

	@SuppressWarnings("unchecked")
	/**
	 * ����id�õ��˵���Ϣ
	 */
	public Map queryMenuById(String id){
		return this.menuDAO.queryMenuById(id);
	}
	/**
	 * ���²˵�
	 * @param menu
	 * @return
	 */
	public boolean updateMenu(Menu menu){
		return this.menuDAO.updateMenu(menu);
	}
	/**
	 * ��id��ɾ���˵�
	 * @param id
	 * @return
	 */
	public boolean deleteMenuByID(String id){
		return this.menuDAO.deleteMenu(id);
	}
	/**
	 * ���Ӳ˵�
	 * @param menu
	 * @return
	 */
	public boolean addMenu(Menu menu){
		return this.menuDAO.addMenu(menu);
	}
}
