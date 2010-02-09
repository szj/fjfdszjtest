package net.trust.application.report.rtpputonsteam.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * �ۺϱ���-->���͹���(�������������쳣)
 * @author zhemgmh
 *
 */
public class RtpPutonsteamFacadeImpl implements RtpPutonsteamFacade{
	BaseSqlMapDAO baseSqlMapDAO;
	/**
	 * ��ѯ�����ܼ�¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findRtpPutonsteamCount(HashMap map){
    	return ((Integer)baseSqlMapDAO.queryForObject("RtpPutonsteam.findRtpPutonsteamCount",map)).intValue();
    }
    /**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
    public List findRtpPutonsteam(HashMap map){
    	return baseSqlMapDAO.queryForList("RtpPutonsteam.findRtpPutonsteam",map);
    }
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
}
