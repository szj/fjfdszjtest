package net.trust.utils.interceptor;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.AfterReturningAdvice;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
import net.trust.application.systemManage.log.dto.OperateLog;
import net.trust.application.systemManage.manager.dto.UserInfo;
import net.trust.context.LoginContextUtil;

import java.lang.reflect.Method;

public class LoggingInterceptor implements AfterReturningAdvice{
	private Log log = LogFactory.getLog(LoggingInterceptor.class);
	private OperateLog operateLog=new OperateLog();
	private BaseSqlMapDAO baseSqlMapDAO = null;
	private String optTerm;

	public void afterReturning(Object returnValue, Method method, Object[] arg2, Object arg3) throws Throwable {
	    //��������
	    //��������д��־�����Ȩ���ж�
		if(log.isDebugEnabled()){
			log.debug("success-------------logging after! "+method.getDeclaringClass().getName()+"."+method.getName());
		}
		
		UserInfo userInfo = LoginContextUtil.getLoginContext();
		
		operateLog.setStaffId(userInfo.getStaffId());	//������ԱID
		operateLog.setOptTerm(userInfo.getIp());			//��½�ն˺�`
		operateLog.setOptResult(this.getResult(returnValue));		//���
//		operateLog.setTermType(userInfo.getAgent());		//�ն�����
//		operateLog.setOpertype(getOperType(method));
		operateLog.setServiceName(getMethod(method));		//������ҵ������
		operateLog.setOptMemo(getOpercontext(arg2)); 		//����˵��
		operateLog.setCityId(userInfo.getCityId()); 		//����˵��
		baseSqlMapDAO.insert("OperateLog.insertOpersteLog", operateLog);
 	}

	/**
	 * ȡ�ò�������
	 * */
	private String getOperType(Method method){
		String methodName=method.getName().toLowerCase();
		if(methodName.indexOf("find")>-1){
			return "S";
		}else if(methodName.indexOf("insert")>-1){
			return "I";
		}else if(methodName.indexOf("update")>-1){
			return "U";
		}else if(methodName.indexOf("delete")>-1){
			return "D";
		}else{
			return "O";
		}
	}
	/**
	 * ȡ�ò���������
	 * */
	private String getMethod(Method method){
		String methodName=method.getDeclaringClass().getName()+"."+method.getName();
		return methodName;
	}
	/**
	 * ȡ�ò���������
	 * */
	private String getOpercontext(Object[] arg2){
		if(arg2==null||arg2.length==0){
			return "";
		}
		String context;
		if(arg2[0]==null)
			context="NULL";
		else
			context=arg2[0].toString();
		for(int i=1;i<arg2.length;i++){
			if(arg2[i]==null)
				context+=","+"NULL";
			else
				context+=","+arg2[i].hashCode();
		}
		return context;
	}
	
	private String getResult(Object returnValue){
		if (returnValue == null){
			return "";
		}
		
		String result = String.valueOf(returnValue);
		//result = arg3.getClass().get
		
		return result;
	}

	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}

	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
	
	
}
