package com.qzgf.NetStore.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import com.qzgf.NetStore.dao.IRoleValueDAO;
import com.qzgf.NetStore.persistence.RoleValue;
import com.qzgf.NetStore.service.IRoleValueService;
import com.qzgf.NetStore.util.node.NodesUtil;

public class RoleValueService implements IRoleValueService {
	IRoleValueDAO roleValueDAO;
    
	public IRoleValueDAO getRoleValueDAO() {
		return roleValueDAO;
	}
	public void setRoleValueDAO(IRoleValueDAO roleValueDAO) {
		this.roleValueDAO = roleValueDAO;
	}
	@SuppressWarnings("unchecked")
	
	public List queryRoleValues(String rid) {
		return this.roleValueDAO.queryRoleValues(rid);
	}

	@SuppressWarnings("unchecked")
	/**
	 * ����id�õ��˵���Ϣ
	 */
	public Map queryRoleValueById(Integer id){
		return this.roleValueDAO.queryRoleValueById(id);
	}
	/**
	 * ���²˵�
	 * @param Role
	 * @return
	 */
	public boolean updateRoleValue(RoleValue roleValue){
		return this.roleValueDAO.updateRoleValue(roleValue);
	}
	/**
	 * ��id��ɾ���˵�
	 * @param id
	 * @return
	 */
	public boolean deleteRoleValueByID(Integer id){
		return this.roleValueDAO.deleteRoleValue(id);
	}
	/**
	 * ���Ӳ˵�
	 * @param Role
	 * @return
	 */
	public boolean addRoleValue(RoleValue roleValue){
		return this.roleValueDAO.addRoleValue(roleValue);
	}
	/**
	 * �������Ӷ���
	 * @param roldInfo
	 * @param num
	 * @param expediteCarId
	 * @param roadType
	 */
	
	public boolean  updateRoleValuesShow(String[]data,String rid)
	{
		boolean st =false;
		//���ݱ��洦��
		List roleList=this.roleValueDAO.queryRoleValues(rid);
		Iterator it=roleList.iterator();
		List datalist=java.util.Arrays.asList(data);
		while(it.hasNext())
		{
			RoleValue ProleValue = new RoleValue();
			ProleValue=(RoleValue)it.next();
			if(datalist.contains(ProleValue.getMenuCode()))
			{
				ProleValue.setRoleId(Integer.valueOf(rid));
				ProleValue.setMenuCode(ProleValue.getMenuCode());
				ProleValue.setFunisShow(Byte.valueOf("1"));
				ProleValue.setPowerValue("111111");
				st=this.roleValueDAO.updateRoleValue(ProleValue);
			}
			else
			{
				ProleValue.setRoleId(Integer.valueOf(rid));
				ProleValue.setMenuCode(ProleValue.getMenuCode());
				ProleValue.setFunisShow(Byte.valueOf("0"));
				ProleValue.setPowerValue("111111");
				st=this.roleValueDAO.updateRoleValue(ProleValue);			
			}
		}
		return st;		
	}
	
	
//	public boolean addRoleValuesInfo(HashMap roleValue, int num,String rid) {
//		boolean st =false;
//		//��ɾ����ɫΪroleId����������
//		st=this.roleValueDAO.deleteAllRoleValue("roleId", rid);
//		
//		//���ݱ��洦��
//		int j=0;//����ѡ�������ύ����Ϣ
//		if (num >= 1){
//			String[] menuCode = (String[]) roleValue.get("menuCode");
//			String[] funisShow = (String[]) roleValue.get("funisShow");
//			String[] remark = (String[]) roleValue.get("remark");
//
//
//			for (int i = 0; i < num; i++) {
//				RoleValue ProleValue = new RoleValue();
//				//ProleValue.setRoleId(roleId[i]);
//				ProleValue.setRoleId(Integer.valueOf(rid));
//				ProleValue.setMenuCode(menuCode[i]);
//				if((j<funisShow.length)&&menuCode[i].equals(funisShow[j]))
//				{
//					j++;
//					ProleValue.setFunisShow(Byte.valueOf("1"));
//				}
//				else
//				{
//					ProleValue.setFunisShow(Byte.valueOf("0"));
//				}
//				ProleValue.setPowerValue("111111");//Ȩ��ֵ��д�ƺ�
//				ProleValue.setRemark(remark[i]);
//				st=this.roleValueDAO.addRoleValue(ProleValue);
//			}
//		}
//		return st;
//	}
	
	public String getTree(String rid,String root)
	{

		List roleValueList = roleValueDAO.queryChileRoleValues(rid,root);
		System.out.println("hello");
		NodesUtil nu = new NodesUtil();
		String json = nu.getTreeNodes(roleValueList,true);
		System.out.println(json);
		return json;

	}
}
