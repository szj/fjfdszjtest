package com.qzgf.application.biz.regModel.action;

import com.qzgf.application.BaseAction;

/**
 * ע��ģ��
 * @author lsr
 *
 */
@SuppressWarnings("serial")
public class RegAction extends BaseAction {
	public String input() throws Exception {
		this.setAction("add");
		return INPUT;
	}
	
	
}
