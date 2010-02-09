package net.trust.application.systemManage.login.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
import net.trust.application.systemManage.manager.dto.UserInfo;
import net.trust.application.systemManage.menu.dto.MenuInfo;
import net.trust.security.MD5;

import org.springframework.dao.DataAccessException;

public class LoginFacadeImpl implements LoginFacade{
	private BaseSqlMapDAO baseSqlMapDAO;
	
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}

	public UserInfo findManagerInfoByNo(UserInfo userInfo) throws DataAccessException{
		return (UserInfo)baseSqlMapDAO.queryForObject("ManagerInfo.findManagerById", userInfo);
	}
	
	/**
	 * @author chenf
	 * 
	 *  ����ת���userID��ȡ��Ա������չʾ�Ĳ˵�
	 * @param
	 *  userID ��¼�ߵı�־�ţ���ˮ�ţ�
	 * @return
	 *  ����MenuInof����ļ���
	 * */
	public List findMenuById(String staffId,String subMenuId){
		HashMap map = new HashMap();
		map.put("staffId", staffId);
		map.put("superId", subMenuId);
		return baseSqlMapDAO.queryForList("ManagerInfo.findMenuByStaffId", map);
	}
	
	/**
	 * ���ݵ�¼��ȡ������Ӧ��ȫ��Ȩ��
	 * @param
	 *  userId ��¼�ߵı�־�ţ���ˮ�ţ�
	 * @return
	 *  ����string����ļ���
	 * @throws ��
	 * */
	public List findRoleIdById(String staffId){
		return baseSqlMapDAO.queryForList("ManagerInfo.findRoleIdByStaffId", staffId);
	}
	
	/**
	 * �жϵ�ǰ��¼���Ƿ���Խ���ϵͳ
	 * @param
	 * ��¼�ߵ�����Ĺ��ź�����
	 * @return UserInfo 1�ɹ� 0ʧ�ܣ�����
	 * */
	public UserInfo checkLogin(UserInfo userInfo){
		UserInfo temp = (UserInfo)baseSqlMapDAO.queryForObject("ManagerInfo.findManagerById", userInfo);
		
		if(null != temp){
			String userpwd = new MD5().StrToMd5(userInfo.getPassword());
			if(null != temp && temp.getPassword().toUpperCase().equals(userpwd)){
				//�����¼�ɹ�,ȡ�õ�ǰ��¼�ߵ�Ȩ��
	    		List powers = baseSqlMapDAO.queryForList("ManagerInfo.findManagePower", temp.getStaffId());
	    		int ilen = powers.size();
	    		StringBuffer power = new StringBuffer();
	    		
	    		MenuInfo menu ;
	    		for(int i=0;i<ilen;i++){
	    			menu = (MenuInfo)powers.get(i);
	    			power.append((char)2).append(menu.getMenuId()).append((char)2);
	    			if(menu.getMethod()!=null){
	    				power.append((char)2).append(menu.getMethod()).append((char)2);
	    			}
	    		}
	    		
	    		temp.setPowers(power.toString());
	    		
	    		//ȡ��ǰ��¼�ߵĽ�ɫ
	    		temp.setRoles(findRoleIdById(temp.getStaffId()));
	    		
	    		//����ǰ��¼����Ա��¼״̬��Ϊ����
	    		UserInfo tmp = new UserInfo();
	    		tmp.setIsOnline("1");
	    		tmp.setStaffId(temp.getStaffId());
	    		baseSqlMapDAO.update("ManagerInfo.updateManagerInfo", tmp);
	    		
	    		return temp;
			}
		}
		return null;
	}
}
