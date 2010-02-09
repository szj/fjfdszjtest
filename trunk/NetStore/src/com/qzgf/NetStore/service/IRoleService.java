package com.qzgf.NetStore.service;

import java.util.List;
import java.util.Map;

import com.qzgf.NetStore.persistence.Role;
import com.qzgf.NetStore.pub.Page;

public interface IRoleService {
	/**
	 * �˵��б�
	 */
	public Page queryRoles(int npage);
	
	public List queryRoles();
	/**
	 * ����id�õ��˵���Ϣ
	 */
	public Map queryRoleById(String id);
	/**
	 * ���²˵�
	 * @param Role
	 * @return
	 */
	public boolean updateRole(Role role);
	/**
	 * ��id��ɾ���˵�
	 * @param id
	 * @return
	 */
	public boolean deleteRoleByID(String id);
	/**
	 * ���Ӳ˵�
	 * @param Role
	 * @return
	 */
	public boolean addRole(Role role);
}
