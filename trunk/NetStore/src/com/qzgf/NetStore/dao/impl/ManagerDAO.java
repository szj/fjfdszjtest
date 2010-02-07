package com.qzgf.NetStore.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.qzgf.NetStore.dao.IManagerDAO;
import com.qzgf.NetStore.persistence.Administrator;
import com.qzgf.NetStore.pub.Page;
import com.qzgf.NetStore.pub.UtilDB;
import com.qzgf.NetStore.pub.wlglException;
 
public class ManagerDAO implements IManagerDAO {

	/**
	 * ��ѯ���еĹ�����Ա
	 */
	@SuppressWarnings("unchecked")
	public Page queryAdministrators(int npage) {
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String strsql="select a.*,b.roleName from t_administrators a left outer join t_role b on a.roleId=b.roleId";
		Page page=utilDB.executeQueryByPageForMySql(strsql.toString(), npage, Page.DEFAULT_PAGESIZE);
		ResultSet rs=page.getRowset();
		List managersList=new ArrayList();
		try {
			while(rs.next()){
				Map map=new HashMap();
				map.put("adminId", rs.getString("AdminId"));
				map.put("sex", rs.getString("sex"));
				map.put("realName", rs.getString("realName"));
				map.put("email", rs.getString("email"));
				map.put("localGrade", rs.getString("localGrade"));
				map.put("roleId", rs.getString("roleId"));
				map.put("roleName", rs.getString("roleName"));
				managersList.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		page.setResultList(managersList);
		
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return page;
			
	}
	
	/**
	 * ��ͨ����Ա���ݣɣĺŲ�ѯĳ���Լ�����Ϣ�����޸�
	 */
	@SuppressWarnings("unchecked")
	public Map queryAdministratorById(String id) {
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String strsql="select * from t_administrators where adminId='"+id+"'";
		ResultSet rs=null;
		try {
			rs=utilDB.executeQuery(strsql);
			
			while(rs.next()){
				Map map=new HashMap();
				map.put("adminId", rs.getString("AdminId"));
				map.put("sex", rs.getString("sex"));
				map.put("realName", rs.getString("realName"));
				map.put("email", rs.getString("email"));
				return map;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	/**
	 * ��ͨ����Ա�޸��Լ�����Ϣ
	 * @return
	 */
	public boolean updateManager(Administrator admin,boolean flag){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		StringBuffer sql=new StringBuffer();
		if(flag){
			//��Ҫ�޸�����
			sql.append("update t_administrators set realName='"+admin.getRealName()+"',sex='"+admin.getSex());
			sql.append("',email='"+admin.getEmail()+"',password='"+admin.getPassword()+"' where ");
			sql.append("adminId='"+admin.getAdminId()+"' and password='"+admin.getOld_password()+"'");
		} 
		else{
			sql.append("update t_administrators set realName='"+admin.getRealName()+"',sex='"+admin.getSex());
			sql.append("',email='"+admin.getEmail()+"' where ");
			sql.append("adminId='"+admin.getAdminId()+"'");
		}
		

		boolean tf=utilDB.executeUpdate(sql.toString());
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tf;
	}
	
	/**
	 * ��߼�����Ա�޸�ĳ������Ա����Ϣ
	 * @return
	 */
	public boolean updateAdmin(Administrator admin,boolean flag){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		StringBuffer sql=new StringBuffer();
		if(flag){
			//��Ҫ�޸�����
			sql.append("update t_administrators set realName='"+admin.getRealName()+"',sex='"+admin.getSex());
			sql.append("',email='"+admin.getEmail()+"',password='"+admin.getPassword()+"',roleId='");
			sql.append(admin.getRoleId()+"' where ");
			sql.append("adminId='"+admin.getAdminId()+"'");
		} 
		else{
			sql.append("update t_administrators set realName='"+admin.getRealName()+"',sex='"+admin.getSex());
			sql.append("',email='"+admin.getEmail()+"',roleId='"+admin.getRoleId()+"' where ");
			sql.append("adminId='"+admin.getAdminId()+"'");
		}
		
		boolean tf=utilDB.executeUpdate(sql.toString());
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tf;
		
	}
	
	/**
	 * ����ĳһ��Idɾ���ù�����Ա
	 * @param adminId
	 * @return
	 */
	public boolean deleteManagerByID(String adminId){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		String strsql="delete from t_administrators where adminId="+adminId;
		
		
	/*	UtilDB du=new UtilDB();
		try {
			return du.stmt.execute(strsql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;*/
		
		
		boolean tf=utilDB.executeUpdate(strsql.toString());
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tf;

		
	}
	
	/**
	 * ���һ��������Ա
	 * @param admin
	 * @return
	 */
	public boolean addAdmin(Administrator admin){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		StringBuffer strsql=new StringBuffer("insert into t_administrators(adminid,password,sex,realname,ifUse,email,roleId) values('");
		strsql.append(admin.getAdminId()+"','"+admin.getPassword()+"','"+admin.getSex()+"','");
		strsql.append(admin.getRealName()+"',"+admin.getIfUse()+",'");
		strsql.append(admin.getEmail()+"','"+admin.getRoleId()+"')");
		
		boolean tf=utilDB.executeUpdate(strsql.toString());
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tf;

		
		
	}
	
	/**
	 * ��߼�����Ա���ݣɣĺŲ�ѯĳ����ͨ����Ա��Ϣ�������޸�
	 */
	@SuppressWarnings("unchecked")
	public Map queryAdminById(String id) {
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String strsql="select * from t_administrators where adminId='"+id+"'";
		
		ResultSet rs=null;
		try {
			rs=utilDB.executeQuery(strsql);
			
			while(rs.next()){
				Map map=new HashMap();
				map.put("adminId", rs.getString("AdminId"));
				map.put("sex", rs.getString("sex"));
				map.put("realName", rs.getString("realName"));
				map.put("email", rs.getString("email"));
				map.put("ifUse", rs.getString("ifUse"));
				map.put("roleId", rs.getString("roleId"));
				return map;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	/**
	 * �����������Ƿ�����
	 * @param admin
	 * @param flag
	 * @return
	 */
	public boolean ifPwdEnterRight(String adminId,String adminPwd){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		StringBuffer sql=new StringBuffer();
		sql.append("select count(*) as num from t_administrators where adminId='"+adminId+"'");
		sql.append(" and password='"+adminPwd+"'");

		int num=0;
		try {
			ResultSet rs=utilDB.executeQuery(sql.toString());
			while(rs.next()){
				num=rs.getInt("num");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return num==1;
		
		
		
		
	}
	
}
