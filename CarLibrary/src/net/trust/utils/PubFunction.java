package net.trust.utils;

public class PubFunction {
	/**
	 *  nullת��Ϊstring
	 *  ժ�������ҳ϶�ϵͳ�Ĺ�����
	 * @param Object
	 * @return
	 */
	public static String getNulltoStr(Object o) {
		String str = "";
		try{
			if (o != null)
				str = o.toString();
		}catch(Exception e){
			return "";
		}
		return str;
	}
	/**
	 *  �ж��Ƿ�Ϊ��
	 * @param boolean
	 * @return
	 */
	public static boolean bIsEmpty(String str) {
		boolean bisNull = false;
		if (str == null || str == "" || str.trim().equals(""))
			bisNull = true;
		return bisNull;
	}
}
