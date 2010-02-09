package com.qzgf.NetStore.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.qzgf.NetStore.dao.IManufacturerDAO;
import com.qzgf.NetStore.persistence.Manufacturer;
import com.qzgf.NetStore.pub.Page;
import com.qzgf.NetStore.pub.UtilDB;
import com.qzgf.NetStore.pub.wlglException;

public class ManufacturerDAO implements IManufacturerDAO {
	
	/** 
	 * �������еĳ���
	 * @param npage:Ҫ��ת����һҳ
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Page queryManufacturers(int npage){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		String sql="select * from t_manufacturer";
		Page page=utilDB.executeQueryByPageForMySql(sql, npage, Page.DEFAULT_PAGESIZE);
		ResultSet rs=page.getRowset();
		List list=new ArrayList();
		try {
			while(rs.next()){
				Map map=new HashMap();
				map.put("manufacturerId", rs.getString("ManufacturerId"));
				map.put("manufacturerName", rs.getString("ManufacturerName"));
				map.put("producerHomePage", rs.getString("ProducerHomePage"));
				map.put("phone", rs.getString("Phone"));
				map.put("cellPhone", rs.getString("CellPhone"));
				map.put("contactMan", rs.getString("ContactMan"));
				map.put("contactAddress", rs.getString("ContactAddress"));
				map.put("postCode", rs.getString("PostCode"));
				list.add(map);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		page.setResultList(list);
		
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return page;
    }
	
	/**
	 * ���ݳ���ID�Ų�ѯ������ҵ���Ϣ,�������޸���
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map queryManufacturersById(String id){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		
		
		String sql="select * from t_manufacturer where manufacturerId='"+id+"'";
		try {
			ResultSet rs=utilDB.executeQuery(sql);
			while(rs.next()){
				Map map=new HashMap();
				map.put("manufacturerId", rs.getString("ManufacturerId"));
				map.put("manufacturerName", rs.getString("ManufacturerName"));
				map.put("manufacturerInfo", rs.getString("ManufacturerInfo"));
				map.put("producerHomePage", rs.getString("ProducerHomePage"));
				map.put("phone", rs.getString("Phone"));
				map.put("cellPhone", rs.getString("CellPhone"));
				map.put("contactMan", rs.getString("ContactMan"));
				map.put("contactAddress", rs.getString("ContactAddress"));
				map.put("postCode", rs.getString("PostCode"));
				return map;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	 * ����ĳ�������̵���Ϣ
	 * @param mfr
	 * @return
	 */
	public boolean updateManufacturer(Manufacturer mfr){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		
		StringBuffer sql=new StringBuffer("update t_manufacturer set manufacturerName='"+mfr.getManufacturerName()+"',");
		    sql.append("producerHomePage='"+mfr.getProducerHomePage()+"',phone='"+mfr.getPhone()+"',cellPhone='"+mfr.getCellPhone());
		    sql.append("',contactMan='"+mfr.getContactMan()+"',contactAddress='"+mfr.getContactAddress()+"',postCode='");
		    sql.append(mfr.getPostCode()+"',manufacturerInfo='"+mfr.getManufacturerInfo()+"' where manufacturerId='"+mfr.getManufacturerId()+"'");
		
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
	 * ���ĳһ�����̵���Ϣ
	 * @param mfr
	 * @return
	 */
	public boolean addManufacturer(Manufacturer mfr){
		
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		
		StringBuffer sql=new StringBuffer("insert into t_manufacturer(manufacturerName,producerHomePage,");
		    sql.append("phone,cellPhone,contactMan,contactAddress,postcode,manufacturerInfo)");
		sql.append("values('"+mfr.getManufacturerName()+"','"+mfr.getProducerHomePage()+"','"+mfr.getPhone()+"','");
		sql.append(mfr.getCellPhone()+"','"+mfr.getContactMan()+"','"+mfr.getContactAddress()+"','"+mfr.getPostCode()+"','");
		sql.append(mfr.getManufacturerInfo()+"')");
		
         boolean tf=utilDB.executeUpdate(sql.toString());
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			e.printStackTrace();
		}
		
		return tf;
		
		
	}
	
	/**
	 * ���ݱ��ɾ��ĳһ��������
	 * @param id
	 * @return
	 */
	public boolean deleteManufacturer(String id){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		
		
		
		String sql="delete from t_manufacturer where manufacturerId='"+id+"'";
		
		
		
		/*boolean flag=false;
		try {
			flag=du.stmt.execute(sql);
			return flag;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;*/
		
    boolean tf=utilDB.executeUpdate(sql.toString());
		
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tf;
			
		
		
		
	}
}
