package net.trust.application.systemManage.manager.domain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
import net.trust.application.systemManage.manager.dto.UserInfo;

public class ManagerFacadeImpl implements ManagerFacade {
	BaseSqlMapDAO baseSqlMapDAO;
	
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}

	public UserInfo findManagerById(UserInfo userInfo){
		return (UserInfo)baseSqlMapDAO.queryForObject("ManagerInfo.findManagerById", userInfo);
	}
	/**
	 * ����ת���staffId��ȡ��Ա������չʾ�Ĳ˵�
	 * @param staffId
	 * @param subMenuId
	 * @return
	 */
	public List findMenuById(String staffId,String subMenuId){
		Map map = new HashMap();
		map.put("staffId",staffId);
		map.put("superId",subMenuId);
		return baseSqlMapDAO.queryForList("ManagerInfo.findMenuByManagerId", map);
	}
	
	/**
	 * ��ѯ������Ա��Ϣ
	 * @param map
	 * @return
	 */
	public List findManagerInfo(HashMap map){
		return baseSqlMapDAO.queryForList("ManagerInfo.findManagerInfo", map);
	}
	
	/**
	 * ��ѯ������Ա��Ϣ�ܼ�¼��
	 * @param map
	 * @return
	 */
	public int findManagerInfoCount(HashMap map){
		return ((Integer)baseSqlMapDAO.queryForObject("ManagerInfo.findManagerInfoCount", map)).intValue();
	}
	
	/**
	 * ��ӹ�����Ա��Ϣ
	 * @param userInfo
	 * @return
	 */
	public int insertManagerInfo(UserInfo userInfo){
		//userInfo.setStaffId(baseSqlMapDAO.sequences("staff_id"));
		return baseSqlMapDAO.update("ManagerInfo.insertManagerInfo", userInfo);
	}
	
	/**
	 * �޸Ĺ���Ա��Ϣ
	 * @param userInfo
	 * @return
	 */
	public int updateManagerInfo(UserInfo userInfo){
		return baseSqlMapDAO.update("ManagerInfo.updateManagerInfo", userInfo);
	}
	
	/**
	 * ɾ������Ա��Ϣ
	 * @param userInfo
	 * @return
	 */
	public int deleteManagerInfo(UserInfo userInfo){
		return baseSqlMapDAO.update("ManagerInfo.updateManagerInfo", userInfo);
	}
	/**
	 * �г���Ա���еĽ�ɫ��û�еĽ�ɫ
	 * @param userid
	 * @return
	 */
	public List findRole(UserInfo userInfo){
		return baseSqlMapDAO.queryForList("ManagerInfo.findRole", userInfo);
	}
	/**
	 * �����Ա���ɫ��ϵ
	 * @param roleId
	 * @param staffId
	 * @return
	 */
	public int insertManagerRoleAllot(String[] roleId, String staffId){
		if (roleId != null){
			baseSqlMapDAO.update("ManagerInfo.deleteManagerRole", staffId);
			
			HashMap map;
			for (int i=0; i<roleId.length; i++){
				map = new HashMap();
				map.put("staffId",staffId);
				map.put("roleId",roleId[i]);
				baseSqlMapDAO.insert("ManagerInfo.insertManagerRole", map);
			}
		}else{
			baseSqlMapDAO.update("ManagerInfo.deleteManagerRole", staffId);
		}
		return 1;
	}
	/**
	 * �г���Ա���е�������û�е�����
	 * @param userid
	 * @return
	 */
	public List findCity(UserInfo userInfo){
		return baseSqlMapDAO.queryForList("ManagerInfo.findCity", userInfo);
	}
	/**
	 * �����Ա�������ϵ
	 * @param roleId
	 * @param staffId
	 * @return
	 */
	public int insertManagerCityAllot(String[] cityId, String staffId){
		if (cityId != null){
			baseSqlMapDAO.update("ManagerInfo.deleteManagerCity", staffId);
			
			HashMap map;
			for (int i=0; i<cityId.length; i++){
				map = new HashMap();
				map.put("staffId",staffId);
				map.put("cityId",cityId[i]);
				baseSqlMapDAO.insert("ManagerInfo.insertManagerCity", map);
			}
		}else{
			baseSqlMapDAO.update("ManagerInfo.deleteManagerCity", staffId);
		}
		return 1;
	}

}
