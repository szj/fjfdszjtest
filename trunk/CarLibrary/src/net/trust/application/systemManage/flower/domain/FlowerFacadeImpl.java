package net.trust.application.systemManage.flower.domain;


import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;

public class FlowerFacadeImpl implements FlowerFacade {
	private BaseSqlMapDAO baseSqlMapDAO;
	
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}

	/**
	 * ���̶�����Ϣ����
	 * @param map
	 * @return
	 */
	public int findFlowerDefineCount(HashMap map) {
		return ((Integer) baseSqlMapDAO.queryForObject("FlowerInfo.findFlowerDefineCount", map)).intValue();
	}
	/**
	 * ���̶�����Ϣ
	 */
	public List findFlowerDefine(HashMap map) {
		return baseSqlMapDAO.queryForList("FlowerInfo.findFlowerDefine", map);
	}
	/**
	 * �����ɳ���¼
	 */
	public HashMap insertFlowerDefine(HashMap map, HashMap flowernode) throws Exception {
		//���̶�������
		String flowerdefineId = baseSqlMapDAO.sequences("flowerdefine_id");
		map.put("flowerdefineId", flowerdefineId);
		// �����ɳ���Ϣ��
		int st = baseSqlMapDAO.update("FlowerInfo.insertFlowerDefine", map);
		if (st == 0) {
			throw new Exception("������̶���ʧ��.");
		}
		// �������̶�������Ϣ��������¼
		if (null != flowernode && flowernode.size() > 0) {
			this.addFlowerNode(flowernode, Integer.valueOf(flowernode.get("num").toString()).intValue(), flowerdefineId);
		}
		map.clear();
		map.put("st", st);
		map.put("flowerdefineId", flowerdefineId);
		return map;
	}

	/**
	 * �޸����̶�����Ϣ
	 */
	public HashMap updateFlowerDefine(HashMap map, HashMap flowerNode) throws Exception {
		int st = 0;
		String flowerdefineId = map.get("flowerdefineId").toString();
		
		//�������
		st = baseSqlMapDAO.update("FlowerInfo.updateFlowerDefine", map);
		if (st == 0) {
			throw new Exception("�޸����̶���ʱ����");
		}
		//�������̽����Ϣ
		this.deleteFlowerNode(map);// ����תվ��Ϣȫ��Ϊ�鵵������������´����µ���תվ��Ϣ
		if (st == 0) {
			throw new Exception("������̽����Ϣ����");
		}
		
		// ������תվ��Ϣ��������¼
		if (null != flowerNode && flowerNode.size() > 0) {
			this.addFlowerNode(flowerNode, Integer.valueOf(flowerNode.get("num").toString()).intValue(), flowerdefineId);
		}
		
		map.clear();
		map.put("st", st);
		map.put("flowernodeId", flowerdefineId);
		return map;
	}

	/**
	 * ɾ�����̶�����Ϣ
	 */
	public int deleteFlowerDefine(HashMap map) throws Exception{
		int st = 0;
		//ɾ������
		st = baseSqlMapDAO.update("FlowerInfo.deleteFlowerDefine", map);
		if (st == 0){
			throw new Exception("ɾ�����̶�����Ϣʱ����");
		}
		//ɾ���ӱ�
		st = baseSqlMapDAO.update("FlowerInfo.deleteFlowerNode", map);
		if (st == 0){
			throw new Exception("ɾ�����̶�����Ϣʱ����");
		}		
		return st;
	}

	/**
	 * ���̽����Ϣ
	 * @param map
	 * @return
	 */
	public List findFlowerNode(HashMap map) {
		return baseSqlMapDAO.queryForList("FlowerInfo.findFlowerNode", map);
	}

	public int insertFlowerNode(HashMap map) {
		return baseSqlMapDAO.update("FlowerInfo.insertFlowerNode", map);
	}

	public int updateFlowerNode(HashMap map) {
		return baseSqlMapDAO.update("FlowerInfo.updateFlowerNode", map);
	}

	public int deleteFlowerNode(HashMap map) {
		return baseSqlMapDAO.update("FlowerInfo.deleteFlowerNode", map);

	}
    //�������̽����Ϣ
	public void addFlowerNode(HashMap flowerNode, int num, String flowerdefineId)
			throws Exception {
		int st = 0;
		HashMap map = new HashMap();
		if (num == 1) {
			flowerNode.put("flowerdefineId", flowerdefineId);
			flowerNode.put("flowernodeRowno",0);
			st = baseSqlMapDAO.update("FlowerInfo.insertFlowerNode", flowerNode);// �����תվ�����
			if (st < 1) {
				throw new Exception("������̽����Ϣʧ��.");
			}
		}else if (num > 1){
			String[] flowernodeName = (String[]) flowerNode.get("flowernodeName");
			String[] isFlowmust = (String[]) flowerNode.get("isFlowmust");
			String[] isSamedep = (String[]) flowerNode.get("isSamedep");
			String[] isFlowers = (String[]) flowerNode.get("isFlowers");
			String[] approveCodearray = (String[]) flowerNode.get("approveCodearray");
			String[] approveCodearrayname = (String[]) flowerNode.get("approveCodearrayname");

			for (int i = 0; i < num; i++) {
				map.clear();
				map.put("flowernodeName", flowernodeName[i]);
				map.put("isFlowmust", isFlowmust[i]);
				map.put("isSamedep", isSamedep[i]);
				map.put("isFlowers", isFlowers[i]);
				map.put("approveCodearray",approveCodearray[i]);
				map.put("approveCodearrayname",approveCodearrayname[i]);
				
				map.put("flowerdefineId",flowerdefineId);
				map.put("flowernodeRowno",i);
				
				st = baseSqlMapDAO.update("FlowerInfo.insertFlowerNode",map);// ������̽����Ϣ
				if (st < 1) {
					throw new Exception("������̽����Ϣʧ��.");
				}
			}
		}
	}
}
