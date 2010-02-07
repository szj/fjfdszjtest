package com.qzgf.NetStore.pub.sessionMgr;

import java.io.Serializable;
import java.util.Enumeration;
import java.util.Hashtable;

import com.qzgf.NetStore.persistence.Administrator;
import com.qzgf.NetStore.persistence.User;

@SuppressWarnings("serial")
public class ServerUserContext implements Serializable
{
	//sessionId
	private String sessionId;
	//��¼�û�ID
	private String curUserId;
	private User curUserInfo;
	private Administrator admin;  
	//�洢�û��Զ�����Ϣ�õĹ�ϣ��
	@SuppressWarnings("unchecked")
	private Hashtable userDefAttributes = new Hashtable();

	public String getSessionId()
	{
		return sessionId;
	}

	public void setSessionId(String sessionId)
	{
		this.sessionId = sessionId;
	}

	/**
	 * ��ǰ�����û�id
	 * 
	 * @return
	 */
	public String getCurUserId()
	{
		return curUserId;
	}

	public void setCurUserId(String curUserId)
	{
		this.curUserId = curUserId;
	}


	public Object getUserDefAttribute(String name)
	{
		return userDefAttributes.get(name);
	}

	@SuppressWarnings("unchecked")
	public Enumeration getUserDefAttributeNames()
	{
		return userDefAttributes.keys();
	}

	public void removeUserDefAttribute(String name)
	{
		userDefAttributes.remove(name);
	}

	@SuppressWarnings("unchecked")
	public void setUserDefAttribute(String name, Object value)
	{
		userDefAttributes.put(name, value);
	}

	public Administrator getAdmin() {
		return admin;
	}

	public void setAdmin(Administrator admin) {
		this.admin = admin;
	}
}
