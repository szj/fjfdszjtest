package com.qzgf.NetStore.dao;

import java.util.List;

import com.qzgf.NetStore.persistence.Administrator;
/**
 * 
 * @author fjfdszj
 * �û���¼����
 * 
 */

public interface ILoginDAO {
	/**
	 * @param userPsw
	 * @param userId
	 * @return List �û���Ӧ����Ϣ
	 */
	public List LoginIsSuccess(String userPsw, String userId);
	/**
	 * ���ܣ��˵���ϸ���
	 * @param ad
	 * @param ParentCode
	 * @return
	 */
	public List GetMenu(Administrator ad,String ParentCode);
	/**
	 * ���ܣ��������˵�
	 * @param mlbh
	 * @param ad
	 * @return
	 */
	public List LoginTopMenu(String mlbh,Administrator ad);
	/**
	 * 
	 * ���ܣ�����ģ��˵�
	 * @param mlbh
	 * @param ad
	 * @return
	 */
	public List ModelMenu(String mlbh,Administrator ad);
	/**
	 * 
	 * ���ܣ������ܲ˵�
	 * @param mlbh
	 * @param ad
	 * @return
	 */
	public List FunctionMenu(String mlbh,Administrator ad);
	/**
	 * 
	 * ���ܸ���ģ���ŵõ�����
	 * @param thecode
	 * @return
	 */
	public String GetModelName(String thecode);
	
}
