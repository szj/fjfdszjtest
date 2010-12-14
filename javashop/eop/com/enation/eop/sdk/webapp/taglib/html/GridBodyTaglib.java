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
package com.enation.eop.sdk.webapp.taglib.html;

import com.enation.eop.sdk.webapp.taglib.IListTaglibProvider;
import com.enation.eop.sdk.webapp.taglib.ListTaglibSupport;
import com.enation.eop.sdk.webapp.taglib.html.support.GridBodyParam;
import com.enation.eop.sdk.webapp.taglib.html.support.GridBodyProvider;

import javax.servlet.jsp.tagext.Tag;

public class GridBodyTaglib extends ListTaglibSupport{
	private GridBodyProvider gridBodyProvider;
	
	public GridBodyTaglib() {
		gridBodyProvider = new GridBodyProvider();
	}
	
	protected void loadProvider() {
		
		Tag tag = this.getParent();
		
		if(tag!=null){
			GridTaglib gridTaglib =(GridTaglib)tag;
			GridBodyParam bodyparm = new GridBodyParam();
			bodyparm.setFrom( gridTaglib.getFrom() );
			this.param =  bodyparm;
			
			this.tagProvider = this.gridBodyProvider;
		} else {
			this.print("body tag must be included in grid tag");
		}
	}
	
	
	protected String postStart() {
		return "<tr>";
	}

	
	protected String postEnd() {
		return "</tr>";
	}

	
	protected String postStartOnce() {
		return "<tbody>";
	}
	
	
	protected String postEndOnce() {
		return "</tbody>";
	}
}
