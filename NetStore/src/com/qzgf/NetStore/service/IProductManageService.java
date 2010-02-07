package com.qzgf.NetStore.service;

import java.util.List;

public interface IProductManageService {
	@SuppressWarnings("unchecked")
	public List showProductBig();//��Ʒ�����б�
	
	// ���
	public void addProductBig(String productName);
	
	//ɾ�� ������С�ࡡ����
	public void deleteProductBig(String id);
	
	//���¡�������С�ࡡ����
	public void updateProductBig(String id,String productName);
	
	//�Ƿ�������
	public String isUseProduct(String id);
	
	
	///////��ƷС�����
	@SuppressWarnings("unchecked")
	public List showSmallCatalog(String pid );

	//����С��
	public void addProductSmall(String pid, String  catalogName);
	
	
	public String catalogNameValue(String id);
	
	
	
	
}
