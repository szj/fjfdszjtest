package com.qzgf.NetStore.pub.lifeMgr;

import com.qzgf.NetStore.pub.ThreadVariableManager;
import com.qzgf.NetStore.pub.sessionMgr.SessionManager;

public class SessionServiceLifeListener implements IServiceLifeListener {
	public void beforeInvoke(String sessionId) {
		// ���ڵ�¼�����ϵͳ������˵���������Ҳ�޷��õ�sessionId��,��Ϊ��ʱ��û��һ��sessionId
		// ����Ҫ���зǿ��ж�
		if (sessionId != null && !"".equals(sessionId)) {
			SessionManager sessionMgr = SessionManager.getInstance();
			boolean valid = sessionMgr.isValid(sessionId);
			// �ж�sessionId�Ƿ�Ϸ�
			if (!valid) {
				System.out.println("sessionId���Ϸ�");
				//
			}
			sessionMgr.sessionVisit(sessionId);
			ThreadVariableManager.getInstance().setCurrentSessionId(sessionId);
		}
	}

	public void afterInvoke(String sessionId) {
		ThreadVariableManager.getInstance().clear();
	}

}
