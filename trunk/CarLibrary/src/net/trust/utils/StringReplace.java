package net.trust.utils;

public class StringReplace {

	public static final String BOXOFF2 = new String(new StringBuffer()
			.append((char) 2));//&

	public static final String BOXOFF3 = new String(new StringBuffer()
			.append((char) 3));//#

	/**
	 �滻�ַ���
	 ����: str �е� str1 �滻��Ϊ str2 ���ɴ� ����
	 */
	public static java.lang.String stringReplace(String str, String str1,
			String str2) {
		StringBuffer strbuff = new StringBuffer();
		try {
			if (str != null && str.length() != 0) {
				int intL = str.indexOf(str1);
				while (intL != -1) {
					strbuff.append(str.substring(0, intL) + str2);
					str = str.substring(intL + str1.length(), str.length());
					intL = str.indexOf(str1);
				}
				if (str != null && str.length() != 0) {
					strbuff.append(str.substring(0, str.length()));
				}
			}
		} catch (Exception ex) {
			System.out.print(ex.toString());
		}
		return strbuff.toString();
	}

	/*
	 ת���ո� �� ����
	 */
	public static java.lang.String textReplace(String str) {
		try {
			if (str != null && str.length() != 0) {
				str = stringReplace(str, "\n", "<BR>");
				str = stringReplace(str, " ", "&nbsp;");
			}
		} catch (Exception ex) {
			System.out.print(ex.toString());
		}
		return str;
	}

	/**
	 * ȥ���ո�
	 * @param str
	 * @param strAStr
	 * @return
	 */
	public String trimSpace(String str) {
		String str1 = null;
		if (str != null && str.length() != 0) {
			str1 = str.trim();
		}
		return str1;
	}

	/**
	 �滻��һ�����ֵ��ַ���
	 ����: str �е� str1 �滻��Ϊ str2 ���ɴ� ����
	 */
	public static java.lang.String stringReplaceFirst(String str, String str1,
			String str2) {
		StringBuffer strbuff = new StringBuffer();
		try {
			if (str != null && str.length() != 0) {
				int intL = str.indexOf(str1);
				if (intL != -1) {
					strbuff.append(str.substring(0, intL) + str2);
					str = str.substring(intL + str1.length(), str.length());
				}
				if (str != null && str.length() != 0) {
					strbuff.append(str.substring(0, str.length()));
				}
			}
		} catch (Exception ex) {
			System.out.print(ex.toString());
		}
		return strbuff.toString();
	}

	/**
	 �滻��һ�����ֵ��ַ���
	 ����: str �е� str1 �滻��Ϊ str2 ���ɴ� ����
	 */
	public static java.lang.String stringReplaceLast(String str, String str1,
			String str2) {
		StringBuffer strbuff = new StringBuffer();
		try {
			if (str != null && str.length() != 0) {
				int intL = str.lastIndexOf(str1);
				if (intL != -1) {
					strbuff.append(str.substring(0, intL) + str2);
					str = str.substring(intL + str1.length(), str.length());
				}
				if (str != null && str.length() != 0) {
					strbuff.append(str.substring(0, str.length()));
				}
			}
		} catch (Exception ex) {
			System.out.print(ex.toString());
		}
		return strbuff.toString();
	}

	/**
	 * �滻ĳһ�ַ���ָ����ʼλ�úͳ��ȵ��ִ�.
	 * @param str ԭ�ַ���
	 * @param iStart �Ӵ��Ŀ�ʼλ��.ע��λ�ô�0��ʼ��
	 * @param iLength �Ӵ��ĳ���
	 * @param strRep Ҫ�滻���ַ���.
	 * @return
	 */
	public static java.lang.String stringReplacet(String str, int iStart,
			int iLength, String strRep) {
		StringBuffer strbuff = new StringBuffer();
		try {
			if (str != null && str.length() != 0) {
				strbuff.append(str.substring(0, iStart)).append(strRep).append(
						str.substring(iStart + iLength));
			}
		} catch (Exception ex) {
		}
		return strbuff.toString();
	}

	/**
	 * ���ַ���str1�п۳��ַ���str2
	 * @param args
	 */
	public String deductString(String str1, String str2) {
		if (str1 == null || str1.trim().length() == 0 || str2 == null
				|| str2.trim().length() == 0) {
			return str1;
		}
		int iStart = str1.indexOf(str2, 0);
		int len = str2.length();
		while (iStart != -1) {
			str1 = str1.substring(0, iStart) + str1.substring(iStart + len);
			iStart = str1.indexOf(str2, 0);
		}
		return str1;
	}

	public static void main(String[] args) {
/*		StringReplace a = new StringReplace();
		String str = a.stringReplacet("abcdefgabcfefg", 2, 2, "zz");
		System.out.println(str);
		str = a.deductString("123456*jj232jjjkjtggjj", "123456");
		System.out.println(str);*/

	}
}