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
package com.enation.app.saler.service;

import java.util.ArrayList;
import java.util.List;

import com.enation.framework.context.webcontext.ThreadContextHolder;

public class InstallUtil {
	public static void putMessaage(String msg){
		if(ThreadContextHolder.getSessionContext()!=null){
		List msgList = (List)ThreadContextHolder.getSessionContext().getAttribute("installMsg");
		if(msgList==null){
			msgList = new ArrayList();
		}
		msgList.add(msg);
		ThreadContextHolder.getSessionContext().setAttribute("installMsg", msgList);
		}
	}
}
