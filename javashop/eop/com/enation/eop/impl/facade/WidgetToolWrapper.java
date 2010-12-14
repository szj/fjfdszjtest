/*
============================================================================
版权所有 (C) 2008-2010 易族智汇（北京）科技有限公司，并保留所有权利。
网站地址：http://www.javamall.com.cn

您可以在完全遵守《最终用户授权协议》的基础上，将本软件应用于任何用途（包括商
业用途），而不必支付软件版权授权费用。《最终用户授权协议》可以从我们的网站下载；
如果担心法律风险，您也可以联系我们获得书面版本的授权协议。在未经授权情况下不
允许对程序代码以任何形式任何目的的修改或再发布。
============================================================================
*/
package com.enation.eop.impl.facade;

import com.enation.eop.core.Request;
import com.enation.eop.core.Response;
import com.enation.eop.core.facade.AbstractFacadePageWrapper;
import com.enation.eop.model.FacadePage;

/**
 * @author kingapex
 * @version 1.0
 * @created 22-十月-2009 18:12:30
 */
public class WidgetToolWrapper extends AbstractFacadePageWrapper {

	private static final String toolsElement = "<div id=\"widget_setting\"></div><form id=\"pageForm\" method=\"POST\"><input type=\"hidden\" id=\"bodyHtml\" name=\"bodyHtml\"> </form></body>";

	/**
	 * 
	 * @param page
	 */
	public WidgetToolWrapper(FacadePage page, Request request) {
		super(page, request);
	}

	protected Response wrap(Response response) {
		String content = response.getContent();
		content = content.replaceAll("</body>", toolsElement);
		content = content.replaceAll("</BODY>", toolsElement);

		response.setContent(content);
		return response;
	}

}