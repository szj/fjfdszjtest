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
package com.enation.eop.utils;

import org.junit.Test;

import com.enation.framework.util.FileUtil;

public class EopUtilTest {

	private static final String PATH = "http://static.eop.com/";

	@Test
	public void testWrapHtml() {

		String content = FileUtil
				.readFile("com/enation/eop/utils/index.html");
		content = EopUtil.wrapcss(content, PATH);
		content = EopUtil.wrapimage(content, PATH);
	    content = EopUtil.wrapjavascript(content, PATH);
		System.out.println(content);
		String result = FileUtil
		.readFile("com/enation/eop/utils/result.html");
	//	Assert.assertEquals(result,content);
	}
}
