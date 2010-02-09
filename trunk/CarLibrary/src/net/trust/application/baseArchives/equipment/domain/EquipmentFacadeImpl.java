package net.trust.application.baseArchives.equipment.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
import net.trust.utils.PubFunction;
/**
 * �豸����
 * @author chenqf
 *
 */
public class EquipmentFacadeImpl implements EquipmentFacade{
	BaseSqlMapDAO baseSqlMapDAO;
	/**
	 * ��ѯ�豸�ܼ�¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findEquipmentCount(HashMap map){
    	return ((Integer)baseSqlMapDAO.queryForObject("EquipmentManage.findEquipmentCount",map)).intValue();
    }
    /**
	 * ��ѯ�豸��Ϣ
	 * @param map
	 * @return
	 */
    public List findEquipmentInfo(HashMap map){
    	return baseSqlMapDAO.queryForList("EquipmentManage.findEquipmentInfo",map);
    }
    /**
	 * �޸��豸��Ϣ
	 * @param userInfo
	 * @return
	 */
    public int insertEquipment(HashMap map){
    	String fixingId = baseSqlMapDAO.sequences("equipment_id");
    	map.put("fixingId", fixingId);
    	int st = baseSqlMapDAO.update("EquipmentManage.insertEquipment",map);
    	
    	if (st > 0){
	    	int num = Integer.valueOf(PubFunction.getNulltoStr(map.get("paramNum")));
	    	
	    	if (num > 1){
	    		String[] paramType = (String[])map.get("paramType");
	    		String[] paramValue = (String[])map.get("paramValue");
	    		
	    		for (int i=0; i<num; i++){
	    			map.clear();
	    			map.put("fixingId", fixingId);
	    			map.put("paramType", paramType[i]);
	    			map.put("paramValue", paramValue[i]);
	    			baseSqlMapDAO.update("EquipmentManage.insertEquipmentParam", map);
	    		}
	    	}else if (num == 1){
	    		String paramType = PubFunction.getNulltoStr(map.get("paramType"));
	    		String paramValue = PubFunction.getNulltoStr(map.get("paramValue"));
	    		
	    		map.clear();
				map.put("fixingId", fixingId);
				map.put("paramType", paramType);
				map.put("paramValue", paramValue);
				baseSqlMapDAO.update("EquipmentManage.insertEquipmentParam", map);
	    	}
    	}
    	return st;
    }
    /**
	 * �޸��豸��Ϣ
	 * @param userInfo
	 * @return
	 */
	public int updateEquipmentInfo(HashMap map){
		int st = baseSqlMapDAO.update("EquipmentManage.updateEquipment",map);
		
		if (st > 0){
			String fixingId = map.get("fixingId").toString();
			//���ԭѡ����
			baseSqlMapDAO.update("EquipmentManage.deleteEquipmentParam", map);
			
			//������в���
			int num = Integer.valueOf(PubFunction.getNulltoStr(map.get("paramNum")));
	    	
	    	if (num > 1){
	    		String[] paramType = (String[])map.get("paramType");
	    		String[] paramValue = (String[])map.get("paramValue");
	    		
	    		for (int i=0; i<num; i++){
	    			map.clear();
	    			map.put("fixingId", fixingId);
	    			map.put("paramType", paramType[i]);
	    			map.put("paramValue", paramValue[i]);
	    			baseSqlMapDAO.update("EquipmentManage.insertEquipmentParam", map);
	    		}
	    	}else{
	    		String paramType = PubFunction.getNulltoStr(map.get("paramType"));
	    		String paramValue = PubFunction.getNulltoStr(map.get("paramValue"));
	    		
	    		map.clear();
				map.put("fixingId", fixingId);
				map.put("paramType", paramType);
				map.put("paramValue", paramValue);
				baseSqlMapDAO.update("EquipmentManage.insertEquipmentParam", map);
	    	}
		}
		return st;
	}
	
	/**
	 * ɾ���豸��Ϣ
	 * @param userInfo
	 * @return
	 */
	public int deleteEquipmentInfo(HashMap map){
		return baseSqlMapDAO.update("EquipmentManage.deleteEquipment",map);
	
	}
	
	/**
	 * ��ȡ�豸��������
	 * @param map
	 * @return
	 */
	public List findEquipmentParam(HashMap map){
		return baseSqlMapDAO.queryForList("EquipmentManage.findEquipmentParam", map);
	}
	
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
}
