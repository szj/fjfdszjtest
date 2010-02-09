package com.qzgf.NetStore.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.qzgf.NetStore.persistence.RoleValue;


public interface IRoleValueService {
	/**
	 * �˵��б�
	 */
	public List queryRoleValues(String rid);
	/**
	 * ����id�õ��˵���Ϣ
	 */
	public Map queryRoleValueById(Integer id);
	/**
	 * ���²˵�
	 * @param RoleValue
	 * @return
	 */
	public boolean updateRoleValue(RoleValue roleValue);
	/**
	 * ��id��ɾ���˵�
	 * @param id
	 * @return
	 */
	public boolean deleteRoleValueByID(Integer id);
	/**
	 * ���Ӳ˵�
	 * @param RoleValue
	 * @return
	 */
	public boolean addRoleValue(RoleValue roleValue);
	/**
	 * �������Ӷ���
	 * @param roldInfo
	 * @param num
	 * @param expediteCarId
	 * @param roadType
	 */
	public boolean updateRoleValuesShow(String[]date,String rid);
	/**
	 * ���ɶ�̬��
	 * @param id
	 * @return
	 */
	public String getTree(String rid,String root);
}
