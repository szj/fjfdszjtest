package com.qzgf.application.baseArchives.UploadExcel.domain;

import java.util.HashMap;
import java.util.List;

public interface UploadExcelFacade {
	
    @SuppressWarnings("unchecked")
	public int insertUploadExcel(HashMap map);
    
    
    @SuppressWarnings("unchecked")
	public int isExistNumber(HashMap map);
    
	public List findUploadExcelNumber(HashMap map);
    
    @SuppressWarnings("unchecked")
	public int updateUploadExcel(HashMap map);
    
    

    
    @SuppressWarnings("unchecked")
	public List findUploadExcelOnlyList(HashMap map);
    
    

    
	//���±���
	public int updateSaveUploadExcel(HashMap map);
	
    
	@SuppressWarnings("unchecked")
	public int findUploadExcelQueryCount(HashMap map);
	@SuppressWarnings("unchecked")
	public List UploadExcelQueryList(HashMap map);
	
    
	public int deleteUploadExcel(String employId);
	
	
    /**
	 * ��ѯ����������Ϣ
	 * @param map
	 * @return
	 */
   
}
