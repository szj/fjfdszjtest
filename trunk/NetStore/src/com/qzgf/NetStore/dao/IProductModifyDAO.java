package com.qzgf.NetStore.dao;

import java.util.List;


public interface IProductModifyDAO {
	@SuppressWarnings("unchecked")
	public List showOnlyProduct(String pId);//��Ʒ�б������޸��ļ�
	
	@SuppressWarnings("unchecked")
	public List showProductBig();//��Ʒ�����б�
	
	
	@SuppressWarnings("unchecked")
	public List showUnit();//��λ�б�
	
	
	//@SuppressWarnings("unchecked")
	//public void updateProduct(Product  product);//��λ�б�
	
	public String getGljgSimpleTree(String id);
	
	public String getProductName(String id);
	
	@SuppressWarnings("unchecked")
	public List showManufacturer();  //��Ӧ��
	

	
	

	
}
