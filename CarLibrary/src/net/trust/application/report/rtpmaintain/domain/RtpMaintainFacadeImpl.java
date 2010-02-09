package net.trust.application.report.rtpmaintain.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
import net.trust.utils.PubFunction;
/**
 * ��������
 * @author zhengmh
 *
 */
public class RtpMaintainFacadeImpl implements RtpMaintainFacade{
	BaseSqlMapDAO baseSqlMapDAO;
	/**
	 * ��ѯ���������¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findRtpMaintainCount(HashMap map){
    	return ((Integer)baseSqlMapDAO.queryForObject("RtpMaintain.findRtpMaintainCount",map)).intValue();
    }
    /**
	 * ��ѯ����������Ϣ
	 * @param map
	 * @return
	 */
    public List findRtpMaintain(HashMap map){
    	return baseSqlMapDAO.queryForList("RtpMaintain.findRtpMaintain",map);
    }

	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
}
