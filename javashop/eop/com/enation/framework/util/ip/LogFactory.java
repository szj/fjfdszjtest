/*
============================================================================
��Ȩ���� (C) 2008-2010 �����ǻ㣨�������Ƽ����޹�˾������������Ȩ����
��վ��ַ��http://www.javamall.com.cn

����������ȫ���ء������û���ȨЭ�顷�Ļ����ϣ��������Ӧ�����κ���;��������
ҵ��;����������֧�������Ȩ��Ȩ���á��������û���ȨЭ�顷���Դ����ǵ���վ���أ�
������ķ��ɷ��գ���Ҳ������ϵ���ǻ������汾����ȨЭ�顣��δ����Ȩ����²�
����Գ���������κ���ʽ�κ�Ŀ�ĵ��޸Ļ��ٷ�����
============================================================================
*/
package com.enation.framework.util.ip;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

public class LogFactory {
	    private static final Logger logger;  
	    static {  
	        logger = Logger.getLogger("stdout");  
	        logger.setLevel(Level.DEBUG);  
	    }  
	  
	    public static void log(String info, Level level, Throwable ex) {  
	        logger.log(level, info, ex);  
	    }  
	      
	    public static Level  getLogLevel(){  
	        return logger.getLevel();  
	    }  
}
