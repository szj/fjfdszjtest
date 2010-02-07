package com.qzgf.NetStore.pub.sessionMgr;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;

import com.cownew.ctk.common.DateUtils;
import com.qzgf.NetStore.persistence.Administrator;
import com.qzgf.NetStore.pub.RandomGUID;
import com.qzgf.NetStore.pub.ServerConfig;

/**
 * �Ự������
 * @author ��ʥ��
 *
 */
public class SessionManager
{
	private static SessionManager instance = null;	
	
	//sessionIdΪkey,ServerUserContextΪvalue
	@SuppressWarnings("unchecked")
	private Map sessionMap = Collections.synchronizedMap(new HashMap());
	
	//sessionIdΪkey,�Ự���ϴλ������ʱ��(����)Ϊvalue
	@SuppressWarnings("unchecked")
	private Map sessionActiveMap = Collections.synchronizedMap(new HashMap());

	private SessionManager()
	{
		super();
		
		//Ҫ���óɺ�̨�߳�,�������ɷ������޷������ر�
		Timer sessionClearTimer = new Timer(true);
		//һ����
		int oneMin = DateUtils.ONE_MINUTE; 
		//1�����Ժ�ʼ,ÿ��һ����̽��һ��
		sessionClearTimer.schedule(new SessionCleanerTimerTask(),oneMin,oneMin);
		
	}

	public static SessionManager getInstance()
	{
		if (instance == null)
		{
			instance = new SessionManager();
		}
		return instance;
	}

	/**
	 * ���ݻỰid�õ��û�������
	 * @param sessionId
	 * @return
	 */
	public ServerUserContext getServerUserContext(String sessionId)
	{
		return (ServerUserContext) sessionMap.get(sessionId);
	}	

	/**
	 * ��ù���Ա��Ϣ
	 * @param sessionId
	 * @return
	 */
	public Administrator getAdministrator(String sessionId)
	{
		return ((ServerUserContext) sessionMap.get(sessionId)).getAdmin();
	}
	
	/**
	 * �õ����лỰid�ļ���
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Set getSessionIdSet()
	{
		return Collections.unmodifiableSet(sessionMap.entrySet());
	}
	
	/**
	 * sessionId�Ƿ�Ϸ�(���ڲ���û�г�ʱ)
	 * @param sessionId
	 * @return
	 */
	public boolean isValid(String sessionId)
	{
		return sessionMap.containsKey(sessionId);
	}

	/**
	 * ���session
	 * @param object
	 */
	public void removeSession(String sessionId)
	{
		sessionMap.remove(sessionId);
		sessionActiveMap.remove(sessionId);
		
	}

	/**
	 * �������session
	 *
	 */
	public void removeAll()
	{
		sessionMap.clear();

	}

	/**
	 * ����һ���ỰId
	 * @param acName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String requestSessionId()
	{
		String sessionId = new RandomGUID().toString();

		ServerUserContext ctx = new ServerUserContext();
		ctx.setSessionId(sessionId);

		sessionMap.put(sessionId, ctx);
		sessionVisit(sessionId);
		return sessionId;
	}

	/**
	 * session�������
	 * @param sessionId
	 */
	@SuppressWarnings("unchecked")
	public void sessionVisit(String sessionId)
	{
		if (!sessionMap.containsKey(sessionId))
		{
			return;
		}
		sessionActiveMap.put(sessionId, new Integer(0));
	}	
	
	protected class SessionCleanerTimerTask extends TimerTask
	{ 
		private int timeOut = ServerConfig.getInstance().getSessionTimeOut();
        
		@SuppressWarnings("unchecked")
		public void run()
		{
			Set idSet = sessionActiveMap.keySet();
			Iterator idIt = idSet.iterator();
			
			// �Ѿ�ʧЧ��session��id�б�
			List invalidIdList = new ArrayList();
			while (idIt.hasNext())
			{
				String id = (String) idIt.next();

				// ���ϴη���������ʱ��
				Integer lastSpan = (Integer) sessionActiveMap.get(id);
				if (lastSpan.intValue() > timeOut)
				{
					invalidIdList.add(id);
				}
				sessionActiveMap.put(id, new Integer(lastSpan.intValue() + 1));
			}
			for (int i = 0, n = invalidIdList.size(); i < n; i++)
			{
				String id = (String) invalidIdList.get(i);
				removeSession(id);
				sessionActiveMap.remove(id);
			}
		}

	}
	
	@SuppressWarnings("unchecked")
	public String requestSessionId(ServerUserContext ctx)
	{
		String sessionId = new RandomGUID().toString();
		ctx.setSessionId(sessionId);
		sessionMap.put(sessionId, ctx);
		sessionVisit(sessionId);
		return sessionId;
	}
}
