package com.qzgf.utils.export;

import java.sql.ResultSet;

import java.io.*;

public interface ExportIface {
	/**
	 * ���������ӿ�
	 * @author chenf
	 *
	 * @param out
	 *            �����
	 * @param rs
	 *            ��Ҫ����������
	 * @param sheetName
	 *            �ļ�����
	 * @param fields
	 *            Ҫ�������ֶ���
	 * @param colname
	 *            չʾ������
	 * @return boolean trueΪ�����ɹ���false����ʧ��
	 */
	public boolean export(PrintWriter out, ResultSet rs, String sheetName, String[] fields, String[] colName);
}
