package net.trust.application.carManage.maintainmanage.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
import net.trust.utils.PubFunction;
/**
 * ��������
 *
 */
public class MaintainManageFacadeImpl implements MaintainManageFacade{
	BaseSqlMapDAO baseSqlMapDAO;
	/**
	 * ��ѯ���������¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findMaintainManageCount(HashMap map){
    	return ((Integer)baseSqlMapDAO.queryForObject("MaintainManageManage.findMaintainManageCount",map)).intValue();
    }
    /**
	 * ��ѯ����������Ϣ
	 * @param map
	 * @return
	 */
    public List findMaintainManage(HashMap map){
    	return baseSqlMapDAO.queryForList("MaintainManageManage.findMaintainManage",map);
    }
    /**
	 * ��ӱ���������Ϣ
	 * @param map
	 * @return
	 */
    public int insertMaintainManage(HashMap map) throws Exception{
    	
    	int st=0;    	
    	String pb_seq=baseSqlMapDAO.sequences("put_on_steam_id");
    	map.put("nurseId",pb_seq);
    	st=baseSqlMapDAO.update("MaintainManageManage.insertMaintainManage",map);
    	if (st == 0)
    		throw new Exception("����������¼ʱ����");
    	
    	//�������񵥾�
    	map.put("sourceOrderType",3);    	
		map.put("sourceOrderCode",pb_seq);
		st=baseSqlMapDAO.update("FinanceManage.insertFinance", map);
		if (st == 0)
    		throw new Exception("�������񵥾�ʱ����");
		
		//���������豸��¼
		int num = Integer.valueOf(PubFunction.getNulltoStr(map.get("carFixingNum")));
		if (num > 1){
			String[] fixingId = (String[])map.get("fixingId");
			HashMap param = null;
			
			for (int i=0; i<num; i++){
				param =  new HashMap();
				param.put("nurseId", pb_seq);
				param.put("carNoId", map.get("carNoId"));
				param.put("fixingId", fixingId[i]);
				st = baseSqlMapDAO.update("MaintainManageManage.insertNurseItem", param);
				if (st == 0)
		    		throw new Exception("����Ҫ�������豸��¼ ��");
			}
		}else{
			String fixingId = map.get("fixingId").toString();
			map.put("fixingId", fixingId);
			st = baseSqlMapDAO.update("MaintainManageManage.insertNurseItem", map);
			if (st == 0)
	    		throw new Exception("����Ҫ�������豸��¼ ��");
		}
		
    	return st;
    }
    /**
	 * �޸ı���������Ϣ
	 * @param map
	 * @return
	 */
	public int updateMaintainManage(HashMap map) throws Exception{
		int st = 0;
		st = baseSqlMapDAO.update("MaintainManageManage.updateMaintainManage",map);
		if (st == 0)
    		throw new Exception("�޸ı�����¼ʱ����");
		
		//�޸Ĳ��񵥾�
		map.put("sourceOrderCode", map.get("nurseId"));
		map.put("sourceOrderType", "3");
		map.put("charge", map.get("nurseCharge"));
		st = baseSqlMapDAO.update("FinanceManage.updateFinance", map);
		if (st == 0)
    		throw new Exception("�޸Ĳ��񵥾�ʱ����");
		
		//���ԭ�ȱ������豸��¼
		HashMap param = new HashMap();
		param.put("nurseId", map.get("nurseId"));
		param.put("carNoId", map.get("carNoId"));
		baseSqlMapDAO.update("MaintainManageManage.deleteNurseItem", param);
		
		//���������豸��¼
		int num = Integer.valueOf(PubFunction.getNulltoStr(map.get("carFixingNum")));
		if (num > 1){
			String[] fixingId = (String[])map.get("fixingId");
			
			
			for (int i=0; i<num; i++){
				param.put("nurseId", map.get("nurseId"));
				param.put("carNoId", map.get("carNoId"));
				param.put("fixingId", fixingId[i]);
				st = baseSqlMapDAO.update("MaintainManageManage.insertNurseItem", param);
				if (st == 0)
		    		throw new Exception("����Ҫ�������豸��¼ ��");
			}
		}else{
			String fixingId = map.get("fixingId").toString();
			map.put("fixingId", fixingId);
			st = baseSqlMapDAO.update("MaintainManageManage.insertNurseItem", map);
			if (st == 0)
	    		throw new Exception("����Ҫ�������豸��¼ ��");
		}
		return st;
	}
	
	/**
	 * ɾ������������Ϣ
	 * @param map
	 * @return
	 */
	public int deleteMaintainManage(HashMap map) throws Exception{
		int st = 0;
		st = baseSqlMapDAO.update("MaintainManageManage.deleteMaintainManage",map);
		if (st == 0)
    		throw new Exception("ɾ��������¼ʱ����");
		
		//ɾ�����񵥾�
		map.put("sourceOrderCode", map.get("nurseId"));
		map.put("sourceOrderType", "3");
		map.put("charge", map.get("nurseCharge"));
		st = baseSqlMapDAO.update("FinanceManage.deleteFinance",map);
		if (st == 0)
    		throw new Exception("ɾ�����񵥾�ʱ����");
		
		//���ԭ�ȱ������豸��¼
		baseSqlMapDAO.update("MaintainManageManage.deleteNurseItem", map);
		
		return st;
	
	}
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
}
