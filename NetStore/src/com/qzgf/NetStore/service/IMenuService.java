package com.qzgf.NetStore.service;

import java.util.List;
import java.util.Map;

import com.qzgf.NetStore.persistence.Administrator;
import com.qzgf.NetStore.persistence.Menu;

public interface IMenuService {
	/**
	 * �˵��б�
	 */
	public List queryMenus();
	/**
	 * ����id�õ��˵���Ϣ
	 */
	public Map queryMenuById(String id);
	/**
	 * ���²˵�
	 * @param menu
	 * @return
	 */
	public boolean updateMenu(Menu menu);
	/**
	 * ��id��ɾ���˵�
	 * @param id
	 * @return
	 */
	public boolean deleteMenuByID(String id);
	/**
	 * ���Ӳ˵�
	 * @param menu
	 * @return
	 */
	public boolean addMenu(Menu menu);
}
