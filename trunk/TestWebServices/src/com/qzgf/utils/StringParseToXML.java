package com.qzgf.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class StringParseToXML {

	/**
	 * ���б���Ϣת��xml��ʽ�ַ������б��е�ÿһ�������HashMap,�������ܻ�ȡ����ṹ
	 * @param list HashMap���б�
	 * @return xml��ʽ�ַ���
	 * @throws Exception 
	 */
	public static String parseToXML(List list){
		
		if(list== null || list.size()==0){
			return "";
		}
		
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"GBK\"?>\r\n");
		sb.append("<ROOT>\r\n");
	
		Iterator it = list.iterator();// �������:�õ���¼
		while (it.hasNext()) {
			sb.append("\t<NODE>\r\n");
			HashMap rowlist = (HashMap) it.next();

			Iterator rowit = rowlist.keySet().iterator();
			while (rowit.hasNext()) {
				String key = ((String) rowit.next());
				String value = rowlist.get(key).toString();
				sb.append("\t\t<id='").append(key).append("' name='").append(
						value).append("'/>\r\n");
			}
			sb.append("\t</NODE>\r\n");
		}	
		sb.append("</ROOT>");
//		System.out.println(sb.toString());
		return sb.toString();
	}
	
	
	public static void main(String[] args) {
		
		HashMap map = new HashMap();
		map.put("CITY_CODE","0591");
		map.put("CITY_NAME","����");
		
		HashMap map2 = new HashMap();
		map2.put("CITY_CODE","0592");
		map2.put("CITY_NAME","����");
		
		ArrayList list = new ArrayList();
		//list.add(map);
		//list.add(map2);
		
		System.out.println(StringParseToXML.parseToXML(list));
	}
}
