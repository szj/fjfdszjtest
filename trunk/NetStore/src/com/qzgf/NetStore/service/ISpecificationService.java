package com.qzgf.NetStore.service;

import java.util.List;

public interface ISpecificationService {
	@SuppressWarnings("unchecked")
	public List specList();
	
	// ���
	public void addSpec(String specName);
	
	//ɾ��
	public void deleteSpec(String specId);
	
	//����
	public void updateSpec(String specId,String specName);
	
	

}
