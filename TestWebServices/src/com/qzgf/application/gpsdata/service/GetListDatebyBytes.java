package com.qzgf.application.gpsdata.service;

import java.util.List;

public interface GetListDatebyBytes {
	/**
	 * ѹ�����ݴ���
	 * @param commandStr
	 * @return
	 */
	public byte[] GetCompress(String commandStr);
	/**
	 * ������ת��Ϊbyte[]
	 * @param commandStr
	 * @return
	 */
	public byte[] GetListToByte(String commandStr);
	/**
	 * ������ת��Ϊxml
	 * @param commandStr
	 * @return
	 */
	public String GetListToXml(String commandStr);
	/**
	 * ������ת��Ϊlist->xml->byte
	 * @param commandStr
	 * @return
	 */
	public byte[] GetListToXmlToByte(String commandStr);
	
	/**
	 * ��̬sql��ѯ�����
	 * @param commandStr
	 * @return
	 */
	public String DynamicSqlListXml(String commandStr);
	
	/**
	 * ��̬sql��ѯ�����
	 * @param commandStr
	 * @return
	 */
	public byte[] DynamicSqlListXmlToByte(String commandStr);
}