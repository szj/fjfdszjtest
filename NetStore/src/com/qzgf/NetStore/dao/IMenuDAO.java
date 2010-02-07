package com.qzgf.NetStore.dao;

import java.util.List;
import java.util.Map;


import com.qzgf.NetStore.persistence.Menu;

public interface IMenuDAO {
	@SuppressWarnings("unchecked")
	/** 
	 * �������еĲ˵�
	 * @return
	 */
	public List queryMenus();
	
	@SuppressWarnings("unchecked")
	/**
	 * ���ݳ���ID�Ų�ѯ����˵�����Ϣ,�������޸���
	 * @param id
	 * @return
	 */
	public Map queryMenuById(String id);
	/**
	 * ����ĳ���˵�����Ϣ
	 * @param mfr
	 * @return
	 */
	public boolean updateMenu(Menu mfr);
	/**
	 * ���ĳһ�˵�����Ϣ
	 * @param mfr
	 * @return
	 */
	public boolean addMenu(Menu mfr);
	/**
	 * ���ݱ��ɾ��ĳһ�˵�
	 * @param id
	 * @return
	 */
	public boolean deleteMenu(String id);
}
