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
package com.enation.eop.core.resource.model;

/**
 * @author lzf
 *         <p>
 *         created_time 2009-11-27 下午01:42:00
 *         </p>
 * @version 1.0
 */
public class EopUserDetail {
	private Integer id;
	private Integer userid;
	private String bussinessscope;
	private String regaddress;
	private Long regdate;
	private Integer corpscope;
	private String corpdescript;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getBussinessscope() {
		return bussinessscope;
	}
	public void setBussinessscope(String bussinessscope) {
		this.bussinessscope = bussinessscope;
	}
	public String getRegaddress() {
		return regaddress;
	}
	public void setRegaddress(String regaddress) {
		this.regaddress = regaddress;
	}
	
	public Long getRegdate() {
		return regdate;
	}
	public void setRegdate(Long regdate) {
		this.regdate = regdate;
	}
	public Integer getCorpscope() {
		return corpscope;
	}
	public void setCorpscope(Integer corpscope) {
		this.corpscope = corpscope;
	}
	public String getCorpdescript() {
		return corpdescript;
	}
	public void setCorpdescript(String corpdescript) {
		this.corpdescript = corpdescript;
	}

}
