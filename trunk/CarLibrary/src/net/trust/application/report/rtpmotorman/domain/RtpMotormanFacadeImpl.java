package net.trust.application.report.rtpmotorman.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
import net.trust.utils.PubFunction;
/**
 * �ۺϱ��� -�� ������ѯ
 * @author chenqf
 *
 */
public class RtpMotormanFacadeImpl implements RtpMotormanFacade {
	private BaseSqlMapDAO baseSqlMapDAO;
	
	/**
	 * ��ѯ���������¼��Ϣ
	 * @param map
	 * @return
	 */
	public int findRtpMotormanCount(HashMap map){
    	return ((Integer)baseSqlMapDAO.queryForObject("RtpMotorman.findRtpMotormanCount",map)).intValue();
    }
    /**
	 * ��ѯ����������Ϣ
	 * @param map
	 * @return
	 */
    public List findRtpMotorman(HashMap map){
    	return baseSqlMapDAO.queryForList("RtpMotorman.findRtpMotorman",map);
    }
	
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
	
}
