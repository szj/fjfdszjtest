package com.qzgf.application.gpsdata.service;

import java.util.List;

public interface GpsDataService {
	/**
	 * �ͻ�������ı���
	 */
	public List ProCommand(String commandStr);
	/**
	 * ��̬sql��ѯ���
	 */	
	public List DynamicCommand(String commandStr);
	
}