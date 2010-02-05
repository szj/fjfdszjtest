package com.qzgf.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.io.*;

import com.qzgf.utils.export.ExportInfo;
import com.qzgf.utils.export.ExportUtil;


public class WriteFile { 
	public String ProWriteFilebyList(String CarNum,String FilePathPre,String cmdStr,List ls)
	{
		String resultFilePathName = "";// �ļ����ƣ�����·��.
		//������
		String[] cmdArrary=cmdStr.split(",");

		try {
		    //��ȡ������Ϣ 
			ExportUtil eu=new ExportUtil();
			HashMap exporthsmap=eu.exportConfig("export-config.xml");
			ExportInfo ei=(ExportInfo)exporthsmap.get(cmdArrary[1].toString().toUpperCase());//�����ʶid.ת��Ϊ��д
			//�ļ�������
			resultFilePathName=FilePathPre + FileNameByDateTime(CarNum);
			FileWriter fw  = new FileWriter(resultFilePathName);
			//����д�ļ�ʱ��
			fw.write("д�ļ���ʼʱ��:"+(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")).format(new Date())+"\r\n");
			// �ļ�ͷ
			fw.write("��Ϣ����:"+ei.getFileName()+"\t��������Ϣ:"+cmdStr+"\r\n");
			// �ֶ�����
			for(int i=0;i<ei.getColumns().length;i++)
				fw.write(ei.getColumns()[i].toString()+"\t");
			fw.write("\r\n");
			//�ֶ�ֵ
			Iterator it = ls.iterator();// �������:�õ���¼
			while (it.hasNext()) {
				HashMap rowlist= (HashMap) it.next();	
				for(int i=0;i<ei.getFields().length;i++)
				{
					String FiledValue=rowlist.get(ei.getFields()[i].toString()).toString();
					fw.write(FiledValue+ "\t");
				}
				fw.write("\r\n");// �س�����
			}
			//����д�ļ�ʱ��
			fw.write("д�ļ�����ʱ��:"+(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")).format(new Date())+"\r\n");
			fw.close();
		} catch (IOException e) {
			resultFilePathName=e.toString();
			e.printStackTrace();
		}
		return resultFilePathName;

	}
	/**
	 * �ļ������ɹ���ǰ׺������+��׺(�ļ�����).
	 * @return
	 */
	private String FileNameByDateTime(String PreCarName)
	{
		String resultName="";//����ֵ
		String Pre="����GPS����-"+PreCarName+"-";  //ǰ׺
		String Suffix=".txt";//��׺
	    Date date = new Date();
	    DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss"); //���ڸ�ʽ��
	    resultName=Pre+dateFormat.format(date)+Suffix;
		return resultName;
	}

}
