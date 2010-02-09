package net.trust.application.systemManage.login.domain;

import java.util.List;

import net.trust.application.systemManage.manager.dto.UserInfo;

import org.springframework.dao.DataAccessException;

/**
 * ϵͳ����Ա��¼
 *
 */
public interface LoginFacade {
	public UserInfo findManagerInfoByNo(UserInfo userInfo) throws DataAccessException ;
	
	/**
	 * @author chenf
	 * 
	 *  ����ת���userID��ȡ��Ա������չʾ�Ĳ˵�
	 * @param
	 *  userID ��¼�ߵı�־�ţ���ˮ�ţ�
	 * @return
	 *  ����MenuInof����ļ���
	 * */
	public List findMenuById(String staffId,String subMenuId);
	
	/**
	 * ���ݵ�¼��ȡ������Ӧ��ȫ��Ȩ��
	 * @param
	 *  userId ��¼�ߵı�־�ţ���ˮ�ţ�
	 * @return
	 *  ����string����ļ���
	 * @throws ��
	 * */
	public List findRoleIdById(String staffId);
	
	/**
	 * �жϵ�ǰ��¼���Ƿ���Խ���ϵͳ
	 * @param
	 * ��¼�ߵ�����Ĺ��ź�����
	 * @return UserInfo 1�ɹ� 0ʧ�ܣ�����
	 * */
	public UserInfo checkLogin(UserInfo userInfo);
	
	
	
}
