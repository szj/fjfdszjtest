package com.qzgf.NetStore.dao;

import java.util.List;
import java.util.Map;


import com.qzgf.NetStore.persistence.Role;
import com.qzgf.NetStore.pub.Page;

public interface IRoleDAO {
	@SuppressWarnings("unchecked")
	/** 
	 * �������еĲ˵�
	 * @return
	 */
	public Page queryRoles(int npage);
	
	public List queryRoles();
	
	@SuppressWarnings("unchecked")
	/**
	 * ���ݳ���ID�Ų�ѯ����˵�����Ϣ,�������޸���
	 * @param id
	 * @return
	 */
	public Map queryRoleById(String id);
	/**
	 * ����ĳ���˵�����Ϣ
	 * @param mfr
	 * @return
	 */
	public boolean updateRole(Role mfr);
	/**
	 * ���ĳһ�˵�����Ϣ
	 * @param mfr
	 * @return
	 */
	public boolean addRole(Role mfr);
	/**
	 * ���ݱ��ɾ��ĳһ�˵�
	 * @param id
	 * @return
	 */
	public boolean deleteRole(String id);
}
