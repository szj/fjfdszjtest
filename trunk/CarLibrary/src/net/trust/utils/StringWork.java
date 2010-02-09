// Decompiled by DJ v2.9.9.61 Copyright 2000 Atanas Neshkov  Date: 2003-4-14 16:26:28
// Home Page : http://members.fortunecity.com/neshkov/dj.html  - Check often for new version!
// Decompiler options: packimports(3)
// Source File Name:   StringWork.java
/**
 * �ַ����ָ����
 */
package net.trust.utils;


import java.util.Vector;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class StringWork {
	public static final String BOXOFF2 = new String(new StringBuffer()
			.append((char) 2)); //& С

	public static final String BOXOFF3 = new String(new StringBuffer()
			.append((char) 3)); //# ��
	private static Log log = LogFactory.getLog(StringWork.class);
	public StringWork() {
	}


	/**
	 * �ַ����ָ�
	 * @param longStr  ���ָ
	 * @param strBreak �ָ��
	 * @return  �ַ�����������
	 */
	public static String[] breakString(String longStr, String strBreak) {
		String strResult[] = new String[0];
		if (longStr != null) {
			Vector vec = new Vector(5);
			int i;
			while ((i = longStr.indexOf(strBreak)) >= 0) {
				vec.addElement(longStr.substring(0, i));
				longStr = longStr.substring(i + strBreak.length());
			}
			if (longStr.length() != 0) {
				vec.addElement(longStr);
			}
			strResult = new String[vec.size()];
			vec.copyInto(strResult);
		}
		return strResult;
	}

	/**
	 * ���ַ��� �ָ�ɶ�ά����
	 * @param str   ���ָ
	 * @param strBig ��ָ��(��һ�ηָ��ʶ��)
	 * @param strSmall С�ָ��(�ڶ��ηָ��ʶ��)
	 * @return ��ά�ַ�����������
	 */
	public static String[][] StringToArray(String str, String strBig,
			String strSmall) {
		String[][] reArr = null;
		try {
			if (str != null && str.length() != 0) {
				String[] arr1 = breakString(str, strBig); //�� #
				if (arr1 != null && arr1.length != 0) {
					int len1 = arr1.length; //�������
					String[] arr2 = breakString(arr1[0], strSmall); //�����
					if (arr2 != null && arr2.length != 0) {
						int len2 = arr2.length; //�������
						reArr = new String[len1][len2]; //��ʼ����ά����
						for (int i = 0; i < len1; i++) {
							String[] arr3 = breakString(arr1[i], strSmall); //�� &
							for (int j = 0; j < len2; j++) {
								reArr[i][j] = arr3[j];
							}
						}
					}
				}
			}
		} catch (Exception ex) {
			log.error(ex);
		}
		return reArr;
	}

	/**
	 * ���ַ��� �ָ�ɶ�ά����
	 * @param str ���ָ ��(Ĭ�� # Ϊ��ָ����& ΪС�ָ��)
	 * @return ��ά����
	 */
	public String[][] StringToArray(String str) {
		String[][] reArr = null;
		try {
			reArr = StringToArray(str, BOXOFF3, BOXOFF2); //#  &
		} catch (Exception ex) {
			log.error(ex);
		} finally {

		}
		return reArr;
	}

	/**
	 * ��ArrayList ת���� String[]
	 * @param arr
	 * @return
	 */
	public String[] ArrayListToStringArray(java.util.ArrayList arr) {
		String[] arr1 = null;
		if (arr != null && arr.size() != 0) {
			arr1 = new String[arr.size()];
			for (int i = 0; i < arr.size(); i++) {
				arr1[i] = (String) arr.get(i);
			}
		}
		return arr1;
	}

}
