package com.qzgf.NetStore.service;

import java.util.List;

public interface IUnitService {
	@SuppressWarnings("unchecked")
	public List unitList();
	
	// ���
	public void addUnit(String unitName);
	
	//ɾ��
	public void delete(String uId);
	
	public void update(String unitId,String unitName);
	
}
