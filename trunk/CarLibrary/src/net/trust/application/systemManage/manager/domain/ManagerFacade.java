package net.trust.application.systemManage.manager.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.application.systemManage.manager.dto.UserInfo;


public interface ManagerFacade {
	public UserInfo findManagerById(UserInfo userInfo);
	/**
	 * ����ת���staffId��ȡ��Ա������չʾ�Ĳ˵�
	 * @param staffId
	 * @param subMenuId
	 * @return
	 */
	public List findMenuById(String staffId,String subMenuId);
	
	/**
	 * ��ѯ������Ա��Ϣ
	 * @param map
	 * @return
	 */
	public List findManagerInfo(HashMap map);
	
	/**
	 * ��ѯ������Ա��Ϣ�ܼ�¼��
	 * @param map
	 * @return
	 */
	public int findManagerInfoCount(HashMap map);
	
	/**
	 * ��ӹ�����Ա��Ϣ
	 * @param userInfo
	 * @return
	 */
	public int insertManagerInfo(UserInfo userInfo);
	
	/**
	 * �޸Ĺ���Ա��Ϣ
	 * @param userInfo
	 * @return
	 */
	public int updateManagerInfo(UserInfo userInfo);
	
	/**
	 * ɾ������Ա��Ϣ
	 * @param userInfo
	 * @return
	 */
	public int deleteManagerInfo(UserInfo userInfo);
	/**
	 * �г���Ա���еĽ�ɫ��û�еĽ�ɫ
	 * @param userid
	 * @return
	 */
	public List findRole(UserInfo userInfo);
	/**
	 * �����Ա���ɫ��ϵ
	 * @param roleId
	 * @param staffId
	 * @return
	 */
	public int insertManagerRoleAllot(String[] roleId, String staffId);
	
	/**
	 * �г���Ա���е�������û�е�����
	 * @param userid
	 * @return
	 */
	public List findCity(UserInfo userInfo);
	
	/**
	 * �����Ա�������ϵ
	 * @param roleId
	 * @param staffId
	 * @return
	 */
	public int insertManagerCityAllot(String[] cityId, String staffId);
}
