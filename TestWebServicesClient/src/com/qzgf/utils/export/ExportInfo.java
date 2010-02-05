
package com.qzgf.utils.export;
/**
 *@author chenf
 *@date 2005��11��17��
 *@docRoot
 *    �������������������Ϣ�����磺�ļ����ơ���Ӧ��ibatis SqlMap�� select id
 *    ��Ҫչʾ������������Ӧ�������־�
 * */
public class ExportInfo {
	//��־id
	private String id = null;
	//��Ӧ��ibatis map���õ�select id
	private String sqlId = null;
	//�������ļ�����
	private String fileName = null;
	//������Ӧ����ͷ
	private String[] columns = null;
	//���ݿ����ֱ�
	private String[] fields = null;
	//��ע��Ϣ
	private String description = null;
	/**
	 * ��ȡ������Ӧ����ͷ
	 * */
	public String[] getColumns() {
		return columns;
	}
	/**
	 * ���õ�����Ӧ����ͷ
	 * */
	public void setColumns(String[] columns) {
		this.columns = columns;
	}
	/**
	 * ��ȡ��ע��Ϣ
	 * */
	public String getDescription() {
		return description;
	}
	/**
	 * ���ñ�ע��Ϣ
	 * */
	public void setDescription(String description) {
		this.description = description;
	}
	public String[] getFields() {
		return fields;
	}
	public void setFields(String[] fields) {
		this.fields = fields;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSqlId() {
		return sqlId;
	}
	public void setSqlId(String sqlId) {
		this.sqlId = sqlId;
	}
}
