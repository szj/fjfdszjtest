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
package com.enation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;

import com.enation.framework.util.FileUtil;

public class SaasImport {
	
	@Test
	public void impl(){
		int userid =2;
		int siteid  = 6;
		String sql = FileUtil.read("d:/javashop.sql","UTF-8");
		String pattern = "drop table if exists js_(\\w+);";
	 
		Pattern p = Pattern.compile(pattern, 2 | Pattern.DOTALL);
		Matcher m = p.matcher(sql);
		if (m.find()) {
			 sql = m.replaceAll("drop table if exists js_$1_"+userid+"_"+siteid+";");
		} 
		pattern="create table js_(\\w+)";
		p = Pattern.compile(pattern, 2 | Pattern.DOTALL);
		m = p.matcher(sql);
		if (m.find()) {
			 sql = m.replaceAll("create table js_$1_"+userid+"_"+siteid);
		} 
		String temp = sql;
		sql = FileUtil.read("d:/data.sql", "UTF-8");
		pattern="INSERT INTO `(\\w+)` VALUES";
		p = Pattern.compile(pattern, 2 | Pattern.DOTALL);
		m = p.matcher(sql);
		if (m.find()) {
			 sql = m.replaceAll("INSERT INTO `$1_"+userid+"_"+siteid+"` VALUES");
		} 		
		System.out.println(temp+sql);
		
	}
}
