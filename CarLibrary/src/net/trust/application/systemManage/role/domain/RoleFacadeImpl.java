package net.trust.application.systemManage.role.domain;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
import net.trust.security.AuthoritiesMethods;
import net.trust.security.AuthoritiesPages;

public class RoleFacadeImpl implements RoleFacade{
	private Log log = LogFactory.getLog(RoleFacadeImpl.class);
	
	private BaseSqlMapDAO baseSqlMapDAO;
	
	private AuthoritiesMethods authoritiesMethods;
	private AuthoritiesPages authoritiesPages;

	/**
	 * ��ѯ��ɫ�ܼ�¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findRoleCount(HashMap map){
    	return ((Integer)baseSqlMapDAO.queryForObject("RoleManage.findRoleCount",map)).intValue();
    }
    /**
	 * ��ѯ��ɫ��Ϣ
	 * @param map
	 * @return
	 */
    public List findRoleInfo(HashMap map){
    	return baseSqlMapDAO.queryForList("RoleManage.findRoleInfo",map);
    }
    /**
	 * ����ɫ��Ϣ
	 * @param map
	 * @return
	 */
    public int insertRole(HashMap map){
    	return baseSqlMapDAO.update("RoleManage.insertRole",map);
    }
    /**
	 * �޸Ľ�ɫ��Ϣ
	 * @param map
	 * @return
	 */
	public int updateRoleInfo(HashMap map){
		return baseSqlMapDAO.update("RoleManage.updateRole",map);
	}
	
	/**
	 * ɾ����ɫ��Ϣ
	 * @param map
	 * @return
	 */
	public int deleteRoleInfo(HashMap map){
		int st = baseSqlMapDAO.update("RoleManage.deleteRole",map);
		if(log.isDebugEnabled()){
			log.debug("���¼���Ȩ�����ÿ�ʼ");
		}
		authoritiesPages.loadPageRole();
		authoritiesMethods.loadMethodRole();
		if(log.isDebugEnabled()){
			log.debug("���¼���Ȩ�����ý���");
		}
		return st;
	
	}
	
	/**
	 * ��ȡ��ǰ��Ա��ͱ�е�Ȩ����
	 * @param map
	 * @return
	 */
	public List findMenuTree(HashMap map){
		return baseSqlMapDAO.queryForList("RoleManage.findMenuTree", map);
	}
	
	/**
	 * ��ɫȨ�޷���
	 * @param menuId
	 * @param roleId
	 * @return
	 */
	public int insertRoleMenu(String[] CheckData,String roleId, String superId){
		HashMap param = new HashMap();
		
		//�����ɫȨ��ǰ��ɾ��ԭ�еļ�¼
		param.put("roleId", roleId);
		param.put("superId", superId);
		baseSqlMapDAO.delete("RoleManage.deleteRoleMenu", param);
		
		if(null == CheckData || CheckData.length==0)
			return 1;

		//���ַ��������е�ֵ��ӵ�����
		for (int i=0;i<CheckData.length;i++){
			param = new HashMap();
			param.put("menuId", CheckData[i]);
			param.put("roleId", roleId);
			baseSqlMapDAO.insert("RoleManage.insertRoleMenu", param);
		}
		
//		String[] menuId = menuIds.split(",");
//		HashMap map = new HashMap();
//		
//		//��menuIdÿ������ǰ�������'��
//		menuIds = "";
//		for (int i=0; i<menuId.length; i++){
//			if (!"".equals(menuIds)){
//				menuIds += ",";
//			}
//			menuIds += "'" + menuId[i] + "'";
//		}
//		map.put("menuIds", menuIds);
//		map.put("roleId", roleId);
//		//���Ȩ��
//		baseSqlMapDAO.delete("RoleManage.deleteRoleMenu", map);
//		//����Ȩ��
//		baseSqlMapDAO.insert("RoleManage.insertRoleMenu", map);

		if(log.isDebugEnabled()){
			log.debug("���¼���Ȩ�����ÿ�ʼ");
		}
		authoritiesPages.loadPageRole();
		authoritiesMethods.loadMethodRole();
		if(log.isDebugEnabled()){
			log.debug("���¼���Ȩ�����ý���");
		}
		
		return 1;
	}
	
	public List execMenuTreeProc(HashMap map){
		return baseSqlMapDAO.queryForList("RoleManage.findMenuTreeProc", map);
	}
	
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
	public AuthoritiesMethods getAuthoritiesMethods() {
		return authoritiesMethods;
	}
	public void setAuthoritiesMethods(AuthoritiesMethods authoritiesMethods) {
		this.authoritiesMethods = authoritiesMethods;
	}
	public AuthoritiesPages getAuthoritiesPages() {
		return authoritiesPages;
	}
	public void setAuthoritiesPages(AuthoritiesPages authoritiesPages) {
		this.authoritiesPages = authoritiesPages;
	}
}
