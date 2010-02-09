package net.trust.application.systemManage.role.domain;

import java.util.HashMap;
import java.util.List;

public interface RoleFacade {
	/**
	 * ��ѯ��ɫ�ܼ�¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findRoleCount(HashMap map);
    /**
	 * ��ѯ��ɫ��Ϣ
	 * @param map
	 * @return
	 */
    public List findRoleInfo(HashMap map);
    /**
	 * ��ӽ�ɫ��Ϣ
	 * @param map
	 * @return
	 */
    public int insertRole(HashMap map);
    /**
	 * �޸Ľ�ɫ��Ϣ
	 * @param map
	 * @return
	 */
	public int updateRoleInfo(HashMap map);
	
	/**
	 * ɾ����ɫ��Ϣ
	 * @param map
	 * @return
	 */
	public int deleteRoleInfo(HashMap map);
	/**
	 * ��ȡ��ǰ��Ա��ͱ�е�Ȩ����
	 * @param map
	 * @return
	 */
	public List findMenuTree(HashMap map);
	
	/**
	 * ��ɫȨ�޷���
	 * @param menuId
	 * @param roleId
	 * @return
	 */
	public int insertRoleMenu(String[] CheckData,String roleId, String superId);
	public List execMenuTreeProc(HashMap map);
}
