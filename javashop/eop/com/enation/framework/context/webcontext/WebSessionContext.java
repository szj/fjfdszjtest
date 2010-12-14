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
package com.enation.framework.context.webcontext;

import java.util.Set;

import javax.servlet.http.HttpSession;

public interface WebSessionContext<T> {

	public static String sessionAttributeKey = "EOPSessionKey";

	public abstract HttpSession getSession();

	public abstract void setSession(HttpSession session);

	public abstract void invalidateSession();

	public abstract void setAttribute(String name, T value);

	public abstract T getAttribute(String name);

	public abstract Set<T> getAttributeNames();

	public abstract void removeAttribute(String name);
	
	public abstract void destory();

}