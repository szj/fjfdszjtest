package com.qzgf.NetStore.service;

import java.util.List;



public interface IProductModifyService {
	@SuppressWarnings("unchecked")
	public List showOnlyProduct(String pId);
	
	
	@SuppressWarnings("unchecked")
	public List showProductBig();//��Ʒ�����б�
	
	
	@SuppressWarnings("unchecked")
	public List showUnit();//��λ�б�
	
	@SuppressWarnings("unchecked")
	public List showProductList();
	
	public String getGljgSimpleTree(String id);
	
	public String getProductName(String id);
	
	//������Ʒ��Ϣ
	public void updateProduct(String ProductId,String Productname,String CatalogId,
 			String ProductDate,String ManufacturerID,
 			String IfCommend,String MarketPrice,String MemberPrice,String Brand,
 			String ProductIntro,String SmallPath,String BigPath,
 			String Specification,String UnitId,String Stock,String isRelease,
 			String isNewGoods,String isSpecialPrice);
	
	@SuppressWarnings("unchecked")
	public List showManufacturer(); 
	
	
	//��ӱ���
 	public void addSave(String ProductId,String Productname,String CatalogId,
 			String ProductDate,String ManufacturerID,
 			String IfCommend,String MarketPrice,String MemberPrice,String Brand,
 			String ProductIntro,String SmallPath,String BigPath,
 			String Specification,String UnitId,String Stock,String isRelease,
 			String isNewGoods,String isSpecialPrice);
 	
 	@SuppressWarnings("unchecked")
	public List  showBrand();
 	
	
}
