package com.qzgf.application.systemManage.menu.dto;

public class MenuInfo {
	private String menuId;  //    �ַ�[50]	�˵���־*
	private String menuName;//	�ַ�[50]	�˵�����
	private String menuOrder;//	����[8]		�˵�˳��
	private String    isRoot="0"	;// 	����[1]		�Ƿ��Ǹ��˵�0����1��
	private String superId;// 	�ַ�[50]	���˵�ID
	private String imgSrc;// 		�ַ�[200]	ͼ���ַ
	private String title;//		�ַ�[100]	��ʾ
	private String haveSub = "0";// 	����[1]		�Ƿ����¼�0û��1��
	private String activeEvent;//	�ַ�[500]	�����Ҫ�������¼�
	private String isSeperator;//	����[1]		�ָ��� 1�� 0����
	private String state = "1";//		    ����[1]		״̬ 1���� 0������ 
	private String isMenu;//�ǲ˵����ǹ��ܽڵ�
	private String url; //��Ӧ�ĵ�ַ
	private String method ;//��Ӧ�ķ���  
	private String checked ="0" ;//���������ڸ���ɫ����Ȩ��ʱʹ�ã��ж�Ҫ����Ľ�ɫ�Ƿ����з����Ȩ��
	public String getActiveEvent() {
		return activeEvent;
	}
	public void setActiveEvent(String activeEvent) {
		this.activeEvent = activeEvent;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getHaveSub() {
		return haveSub;
	}
	public void setHaveSub(String haveSub) {
		this.haveSub = haveSub;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	public String getIsMenu() {
		return isMenu;
	}
	public void setIsMenu(String isMenu) {
		this.isMenu = isMenu;
	}
	public String getIsRoot() {
		return isRoot;
	}
	public void setIsRoot(String isRoot) {
		this.isRoot = isRoot;
	}
	public String getIsSeperator() {
		return isSeperator;
	}
	public void setIsSeperator(String isSeperator) {
		this.isSeperator = isSeperator;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuOrder() {
		return menuOrder;
	}
	public void setMenuOrder(String menuOrder) {
		this.menuOrder = menuOrder;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getSuperId() {
		return superId;
	}
	public void setSuperId(String superId) {
		this.superId = superId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}	
