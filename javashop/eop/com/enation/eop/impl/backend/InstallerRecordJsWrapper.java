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
package com.enation.eop.impl.backend;

import com.enation.eop.EopSetting;
import com.enation.eop.core.Request;
import com.enation.eop.core.Response;
import com.enation.eop.core.facade.AbstractFacadePagetParser;
import com.enation.eop.model.FacadePage;
import com.enation.framework.util.PropertiesUtil;

public class InstallerRecordJsWrapper extends AbstractFacadePagetParser {

	public InstallerRecordJsWrapper(FacadePage page, Request request) {
		super(page, request);
	}

	@Override
	protected Response parse(Response response) {
		String version = EopSetting.VERSION;
		String content = response.getContent();
		StringBuffer js = new StringBuffer();
		
		js.append("<script>");
		js.append("var src='http://www.enationsoft.com/eop/recordInstaller.do?version="+version+"';");
		js.append("var frm = $('<iframe style=\"width:0px;height:0px\"></iframe>').appendTo('body');");
		js.append("frm.attr('src',src);");
		js.append("</script>");
		content=content + js;
		response.setContent(content);
		return response;
	}

}
