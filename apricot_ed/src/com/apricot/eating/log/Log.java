/**
 * 
 */
package com.apricot.eating.log;

/**
 * @author Administrator
 */
public final class Log {
	/**
	 * ��¼������־��Ϣ
	 * 
	 * @param message
	 * @param obj
	 */
	public static final void error(String message, Throwable e, Object obj) {
		org.apache.log4j.Logger.getLogger(obj.getClass()).error(message, e);
	}

	/**
	 * ��¼������Ϣ
	 * 
	 * @param message
	 * @param obj
	 */
	public static final void debug(String message, Object obj) {
		org.apache.log4j.Logger.getLogger(obj.getClass()).debug(message);
	}
}
