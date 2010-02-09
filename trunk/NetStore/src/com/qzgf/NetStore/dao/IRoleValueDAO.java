package com.qzgf.NetStore.dao;

import java.util.List;
import java.util.Map;


import com.qzgf.NetStore.persistence.RoleValue;

public interface IRoleValueDAO {
	@SuppressWarnings("unchecked")
	/** 
	 * �������еĲ˵�
	 * @return
	 */
	public List queryRoleValues(String roleid);
	
	public List queryChileRoleValues(String roleid,String root);
	
	@SuppressWarnings("unchecked")
	/**
	 * ���ݳ���ID�Ų�ѯ����˵�����Ϣ,�������޸���
	 * @param id
	 * @return
	 */
	public Map queryRoleValueById(Integer id);
	/**
	 * ����ĳ���˵�����Ϣ
	 * @param mfr
	 * @return
	 */
	public boolean updateRoleValue(RoleValue mfr);
	/**
	 * ���ĳһ�˵�����Ϣ
	 * @param mfr
	 * @return
	 */
	public boolean addRoleValue(RoleValue mfr);
	/**
	 * ���ݱ��ɾ��ĳһ�˵�
	 * @param id
	 * @return
	 */
	public boolean deleteRoleValue(Integer id);
	
	/**
	 * ����ĳһ��ɫ��Ȩ��ֵ
	 * @param id
	 * @return
	 */	
	public boolean deleteAllRoleValue(String rname,String rid);
}
