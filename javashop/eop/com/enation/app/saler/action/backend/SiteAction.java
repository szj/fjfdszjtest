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
package com.enation.app.saler.action.backend;

import com.enation.eop.core.resource.ISiteManager;
import com.enation.eop.core.resource.model.EopSite;
import com.enation.framework.action.WWAction;

/**
 * 站点管理action
 * @author kingapex
 * 2010-7-24下午09:19:03
 */
public class SiteAction extends WWAction {

	private ISiteManager siteManager; 
	private EopSite site;
	private Integer id;
	private int point;
	
	public String edit(){
		this.site = this.siteManager.get(id);
		return "edit";
		
	}
	
	public String saveEdit(){
		this.siteManager.updatePoint(id, point);
		this.msgs.add("更新成功");
		return this.MESSAGE;
	}
	
	public String list(){
		this.webpage = this.siteManager.list(this.getPage(), this.getPageSize());
		return "list";
	}
	public ISiteManager getSiteManager() {
		return siteManager;
	}
	public void setSiteManager(ISiteManager siteManager) {
		this.siteManager = siteManager;
	}
	public EopSite getSite() {
		return site;
	}
	public void setSite(EopSite site) {
		this.site = site;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
	
	
}
