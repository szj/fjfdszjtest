
package com.qzgf.utils;

import java.util.Timer;
import java.util.TimerTask;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/***
 * ������ʾJVM���Խ����������չ��������Ǹ���ʾ���ܲ�������JVM���Ͻ����������չ�����
 * GcUtil��һ����ʱ�࣬�̳���TimerTask�࣬����ָ���ļ��ʱ��ѭ��ִ��run()������
 * @author lsr
 * @date 20081103
 * */
public class GcUtil extends TimerTask {
	//
	private final Log log = LogFactory.getLog(GcUtil.class) ;
	//Ĭ�ϵ������ڴ�С��20Mʱ����ʾ�ڴ����
	long minMemory =1024*1024*200;
	//����gc�ļ��ʱ��
	long timer = 10000;
	//�ϴ�gc��ʱ��
	long preGcTime;
	public GcUtil(){
	}
	public void run(){

		//С�ڹ涨��gc���ʱ�䣬������gc
		if(System.currentTimeMillis()-preGcTime<timer){
			if(log.isInfoEnabled())
				log.info("gc���ʱ��̫��");
			return ;
		}
		
		long maxMemory = Runtime.getRuntime().maxMemory();
		long totalMemory = Runtime.getRuntime().totalMemory();
		long freeMemory = Runtime.getRuntime().freeMemory();
		
		if(freeMemory < minMemory){
			System.gc();
			preGcTime=System.currentTimeMillis();
			if(log.isInfoEnabled())
				log.info((new java.util.Date(preGcTime))+" ���:"+maxMemory+" ��ǰ���:"+totalMemory+" ��ǰ����:"+freeMemory);
		}
		
	}
	public long getMinMemory() {
		return minMemory;
	}
	public void setMinMemory(long minMemory) {
		this.minMemory = minMemory;
	}
	public static void main(String[] args){
		Timer timer = new Timer (true);
		timer.schedule(new GcUtil(),5,1000);
		while(true);
/*		GcUtil gu = new GcUtil();
		gu.setMinMemory(994152);
		
		
		java.util.List list = new java.util.ArrayList();
		int i =1;
		while(true){
			try{
				java.util.HashMap obj = new java.util.HashMap();
				obj.put("AAAA","DDDDDDDD");
				obj.put("AAAA1","DDDDDDDD");
				obj.put("AAAA2","DDDDDDDD");
				obj.put("AAAA3","DDDDDDDD");
				java.util.HashMap obj2 = new java.util.HashMap();
				obj2.put("AAAA","DDDDDDDD");
				obj2.put("AAAA1","DDDDDDDD");
				obj2.put("AAAA2","DDDDDDDD");
				obj2.put("AAAA3","DDDDDDDD");
				java.util.HashMap obj3 = new java.util.HashMap();
				obj3.put("AAAA","DDDDDDDD");
				obj3.put("AAAA1","DDDDDDDD");
				obj3.put("AAAA2","DDDDDDDD");
				obj3.put("AAAA3","DDDDDDDD");
				list.add(obj);
				list.add(obj2);
				list.add(obj3);
				gu.run();
				Thread.sleep(10);
				
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}*/
	}
	public long getTimer() {
		return timer;
	}
	public void setTimer(long timer) {
		this.timer = timer;
	}
}
