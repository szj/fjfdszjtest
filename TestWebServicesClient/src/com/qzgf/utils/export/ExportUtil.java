package com.qzgf.utils.export;

/**
 *@author chenf
 *@date 2005��11��16��
 *@docRoot
 * ��������
 * */


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class ExportUtil {
	/**
	 * @author chenf
	 * @date 2005-11-18
	 * @docRoot
	 *  ���������ļ���������Ϣ������Ϣ������һ��xml�ļ����ʽ�磺
	 *	<?xml version="1.0" encoding="gb2312" ?>
	 *	<exports>
	 *		<export id="exportMenu" sqlId= "getMenus" filename="menu">
	 *			<description>�˵�������Ϣ</description>
	 *			<column name="menu_id">�˵�ID</column>
	 *			<column name="menu_name">�˵�����</column>
	 *			<column name="img_src">ͼƬ��ַ</column>
	 *		</export>
	 *	</exports>
	 *  ������������Ϣ��������ExportInfo������󱣴���List��
	 *  @param conifgfile �����ļ�·��
	 *  @return java.util.HashMap
	 */
	public HashMap exportConfig (String configfile){
		HashMap configList = new HashMap();
		try{
			InputStream in = getClass().getResourceAsStream(configfile);
			//��Ϊjar�ļ���ȡ�ļ������xml,���Ը�Ϊ����·��.
			//InputStream in = new InputStream()
			
			//�������dom4j��xml������
			SAXReader saxReader = new SAXReader();
		    Document document = saxReader.read(in);
		    //�������ļ���ȡ��������Ҫ�����Ľڵ���Ϣ
		    Iterator it = document.selectNodes("//exports/export").iterator();

		    while(it.hasNext()){
		    	Element element =(Element)it.next();
		    	//������Ϣ��Ӧ����
		    	ExportInfo ei = new ExportInfo();
		    	ei.setSqlId(element.attribute("sqlId").getValue());
		    	ei.setFileName(element.attribute("filename").getValue());

		    	List cols = element.selectNodes("column");
		    	String[] fields = null;
		    	String[] columns = null;
		    	if(cols.size()>0){
		    		fields = new String[cols.size()];
		    		columns = new String[cols.size()];
		    	}
		    	
		    	for(int i=0;i<cols.size();i++){
		    		Element elCol = (Element)cols.get(i);
		    		fields[i]=elCol.attribute("name").getValue();
		    		columns[i]=elCol.getText();
		    	}
		    	ei.setFields(fields);
		    	ei.setColumns(columns);
		    	ei.setDescription(element.selectSingleNode("description").getText());
		    	//����ID��ExportInfo����
		    	configList.put(element.attribute("id").getValue(),ei);
		    }
		    in.close();//�ر��ļ���
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return configList;
		
	}
}
