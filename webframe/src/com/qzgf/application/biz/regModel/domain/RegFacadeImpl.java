package com.qzgf.application.biz.regModel.domain;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.qzgf.IbatisDaoTools.BaseSqlMapDAO;
import com.qzgf.context.PageList;
import com.qzgf.context.Pages;

/**
 * ��ܲ���ģ��
 * @author lsr
 *
 */
public class RegFacadeImpl implements RegFacade {
	@SuppressWarnings("unused")
	private static final Log logger = LogFactory.getLog(RegFacadeImpl.class);
	BaseSqlMapDAO baseSqlMapDAO;
	
	@SuppressWarnings("unchecked")
	public int insertTest(HashMap map){
		int st=0;
		st = baseSqlMapDAO.update("TestManage.insertTest", map);
		return st;
	}
	
	@SuppressWarnings("unchecked")
	public int deleteTestById(HashMap map) {
		int num = baseSqlMapDAO.update("TestManage.deleteTestById", map);
		return num;
	}
	
	@SuppressWarnings("unchecked")
	public int updateTestById(HashMap map) {
		int num = baseSqlMapDAO.update("TestManage.updateTestById", map);
		if (num == 1) {
			// �޸ĳɹ�
			return 1;
		}
		// �޸�ʧ��
		return 0;
	}
	
	@SuppressWarnings("unchecked")
	public PageList findTest(HashMap map,Pages pages) {
		//δ�ӷ�ҳ����
		/*System.out.println(baseSqlMapDAO.toString());
		List testList = baseSqlMapDAO.queryForList("TestManage.queryTest", map);
		if (!testList.isEmpty() && testList != null) {
			return testList;
		} else
			return null;*/
		
		
		//�ӷ�ҳ����
		PageList pl = new PageList();
		//�������
		if (pages.getTotalNum() == -1) {
			pages.setTotalNum(((Integer) baseSqlMapDAO.queryForObject(
					"TestManage.findTestCount", map)).intValue());
		}
		//�����ҳ��
		pages.executeCount();
		//��ʼ��¼
		map.put("START", pages.getSpage());
		//�����ʾ��¼��
		map.put("END", pages.getPerPageNum());
		//�б�����
		List testList = baseSqlMapDAO.queryForList("TestManage.queryTest", map);
		pl.setObjectList(testList);
		//��ҳ��Ϣ
		pl.setPages(pages);
		return pl;
	}

	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}

	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
}
