package com.qzgf.NetStore.pub;
import com.qzgf.NetStore.pub.sessionMgr.ServerUserContext;
import com.qzgf.NetStore.pub.sessionMgr.SessionManager;

/**
 * �̱߳���������,���ǵĿ���еĴ󲿷ֹؼ�����,
 *���統ǰ�û� ��ǰ���ݿ����ӵȶ����뵱ǰ�߳����,
 *�����Щ������Ҫͨ���˹�����ȡ��
 * @author ��ʥ��
 *
 */
public class ThreadVariableManager
{

	private static ThreadVariableManager instance;
	@SuppressWarnings("unchecked")
	private static final ThreadLocal sessionId = new ThreadLocal();
    
	private ThreadVariableManager()
	{
		super();
	}

	public static ThreadVariableManager getInstance()
	{
		if (instance == null)
		{
			instance = new ThreadVariableManager();

		}

		return instance;
	}

	
	@SuppressWarnings("unchecked")
	public void setCurrentSessionId(String id)
	{
		sessionId.set(id);
	}
	
	public String getCurrentSessionId()
	{
		return (String) sessionId.get();
	}
	
	public ServerUserContext getCurrentServerUserContext()
	{
		String sessionId = getCurrentSessionId();
		if(sessionId==""||"".equals(sessionId))
		{
			return null;
		} 
		return SessionManager.getInstance().getServerUserContext(sessionId); 
	}

	/**
	 * ����̱߳���,�ر������Դ
	 * @
	 */
	@SuppressWarnings("unchecked")
	public void clear() 
	{
		sessionId.set(null);		
	}

}
