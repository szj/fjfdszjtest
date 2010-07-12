package com.chinasms.JavaHttpSample;

import java.io.*;
import java.net.*;

/**
public class SmsDemo
{
	public static void main(String[] args)
	{
	   String str;  //��ŵ��÷��صĽ��,�жϳɹ����Ӧ�÷�������ַ���
       ChinaSms sms = new ChinaSms("huage8888","85272100");  //�����޸ĳ����Լ����û���������
	   str = sms.singleSend("13657912707","���Ե�������");  //�����޸ĳ�Ҫ���͵��ֻ�����ͷ�������
	   String newstring = null;
	   try
	   {
		   newstring = new String(str.getBytes("GBK"),"GB2312");
		   System.out.println(newstring);
	   }catch(Exception ex){
	      System.out.println("�쳣"); 
	   }	   
	}
}

������ChinaSms
˵�����򵥷�װ�й����Žӿڹ淶v1.2
������ʷ��
   1.2005-01-14 ����,ying_yu 
*/
public class ChinaSms
{
	private String comName;  //��ҵ�û���½��
	private String comPwd;   //��ҵ�û���½����

    public ChinaSms()
	{
      this("default","default");  
	}

	public ChinaSms(String name, String pwd)
	{
		this.comName = name;
		this.comPwd = pwd;
	}

	/*Ⱥ���ӿ�*/
	public String singleSend(String dst, String msg)
	{
		String sUrl = null;
		sUrl = "http://www.china-sms.com//send/gsend.asp?name="
		              +comName+"&pwd="+comPwd+"&dst="+dst+"&msg="+msg;
		System.out.println(sUrl);
	    return getUrl(sUrl);
	}

	/*ͨ�õ��ýӿ�*/
	public String getUrl(String urlString)
	{
		StringBuffer sb = new StringBuffer();

		try{
			URL url = new URL(urlString);
			URLConnection conn = url.openConnection();
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = null;
			while((line = reader.readLine()) != null)
			{
				sb.append(line + "\n");
			}
			reader.close();
		}
		catch(IOException e){
			System.out.println(e.toString());
		}
        //System.out.println(sb.toString());
		return sb.toString();
	}
}
