package net.trust.utils.sms;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.Vector;

import com.jasson.im.api.APIClient;
import com.jasson.im.api.MOItem;
import com.jasson.im.api.RPTItem;

/**
 * ApiTestDemo
 */
public class ApiTestDemo
{
	private String cmd = "11";
	private String mobileStr = "13599204724";//13600136666,13800138888
	private String content = "���ŷ��Ͳ������� via  IM JAVA API ";
	private long smId = 1;
	private int smType = 0;
	private String url = "wap.sohu.com";
	private String host = "113.18.101.88";
	private String dbName = "mas";
	private String apiId = "car";
	private String name = "car";
	private String pwd = "car";
	private APIClient handler = new APIClient();
	BufferedReader in = null;

	public ApiTestDemo(String[] args)
	{
		super();
		parseCmd(args);
		init();
		in = new BufferedReader(new InputStreamReader(System.in),512); 
	}

	public void init()
	{
		int connectRe = handler.init(host, name, pwd, apiId,dbName);
        if(connectRe == APIClient.IMAPI_SUCC)
        	info("��ʼ���ɹ�");
        else if(connectRe == APIClient.IMAPI_CONN_ERR)
        	info("����ʧ��");
        else if(connectRe == APIClient.IMAPI_API_ERR)
        	info("apiID������");
        if(connectRe != APIClient.IMAPI_SUCC)
        {
        	usage();
        	System.exit(-1);
        }
	}
	public void release()
	{
		handler.release();
		Thread.currentThread().interrupt();
	}
	
	public void testSend()
	{
		SendTask task = new SendTask();
		task.start();
	}
	public void sendSM()
	{
		String tmpMobile = null;
		String tmpContent = null;
		String tmpTypeStr = null;
		String tmpSrcID = null ;
		int tmpType = 0;
		String tmpUrl = null;
		
		info("������srcID�����س�������");
		tmpSrcID = readLine();
		if( tmpSrcID == null || tmpSrcID.trim().length() == 0 || getInt(tmpSrcID.trim()) == Integer.MIN_VALUE )
		{
			tmpSrcID = "" + smId;
		}
		
		info("�������ֻ����룬���������Ӣ�Ķ��Ÿ��������س�������");
		tmpMobile = readLine();
		if( tmpMobile == null || tmpMobile.trim().length() == 0 )
		{
			tmpMobile = mobileStr;
		}
		
		info("������������ݣ����س�������");
		tmpContent = readLine();
		if( tmpContent == null || tmpContent.trim().length() == 0)
		{
			 tmpContent = content;
		}
		info("��������������Ƿ�ΪWAP PUSH��Ϣ�����س�������Y/N[N]");
		tmpTypeStr = readLine();
		if( tmpTypeStr != null && tmpTypeStr.trim().equalsIgnoreCase("Y"))
		{
			 tmpType = 1;
			 info("��������������Ƿ�ΪWAP PUSH��Ϣ�����س�������Y/N[N]");
			tmpUrl = readLine();
			if( tmpUrl == null || tmpUrl.trim().length() == 0)
			{
			 	tmpUrl = url;
			 
			}
		}
		else
		{
			tmpType = smType;;
		}
		
		//�ֻ��Ŵ���
		Vector mobileList = new Vector();
        StringTokenizer st = new StringTokenizer(tmpMobile, ",");
        while(st.hasMoreElements())
        {
        	String tmp = (String)st.nextElement();
        	if( tmp.indexOf("-") != -1 )
        	{
        		//����һ��������ڵ��ֻ�,���Ͷ���
        		long min = Long.parseLong(tmp.substring(0, tmp.indexOf("-")));
        		long max = Long.parseLong(tmp.substring(tmp.indexOf("-") + 1));
        		
        		long i  = min;
        		while(i <= max)
        		{
        			mobileList.addElement(Long.toString(i));
        			i ++;
        		}
        	}
        	else
        	{
        		mobileList.addElement(tmp);
        	}
        }
        int len = mobileList.size();
        String[] mobiles = new String[len];
        for(int i = 0 ; i < len ; i++)
        {
        	mobiles[i] = (String)mobileList. elementAt(i);
        }
        //System.arraycopy(mobileList, 0, mobiles, 0, mobileList.size());
        //mobiles = (String[]) mobileList.toArray(mobiles);



        int result = 0;
        //wap push��ʽ
        if(tmpType == 1)
        {
        	if(url == null || url.length() == 0)
        	{
        		info("������Wap Push�����ӵ�ַ��");
        		return;
        	}
        	result = handler.sendSM(mobiles, tmpContent, smId, Long.parseLong(tmpSrcID), url);
        }else
        {
        	result = handler.sendSM(mobiles, tmpContent, smId , Long.parseLong(tmpSrcID));
        }
        if(result == APIClient.IMAPI_SUCC)
        {            
            info("���ͳɹ�\n");
        }
        else if(result == APIClient.IMAPI_INIT_ERR)
            info("δ��ʼ��");
        else if(result == APIClient.IMAPI_CONN_ERR)
            info("���ݿ�����ʧ��");
        else if(result == APIClient.IMAPI_DATA_ERR)
            info("��������");
        else if(result == APIClient.IMAPI_DATA_TOOLONG)
            info("��Ϣ����̫��");
        else if(result == APIClient.IMAPI_INS_ERR)
            info("���ݿ�������");
        else
            info("������������");
	}
	
	public void recvSM()
	{
		MOItem[] mos = handler.receiveSM();
        int len = 0, i = 0;
        StringBuffer sb = new StringBuffer("");
        if(mos == null)
        {
            info("δ��ʼ�������ʧ��");
            return;
        }
        else if(mos.length == 0)
        {
            info("û��MO����");
        }
        else
        {
            len = mos.length;
            while(i < len)
            {
                sb.append("�ֻ�����: ");
                sb.append(mos[i].getMobile() + " ");
                sb.append("��������: ");
                sb.append(mos[i].getContent());
                sb.append("MOʱ��: ");
                sb.append(mos[i].getMoTime());
                sb.append("\n");
                i++;
            }
             
            info(sb.toString() );
        }
	}
	
	
	public void recvRPT()
	{
		RPTItem[] rpts = handler.receiveRPT();
        int len = 0, i = 0;
        StringBuffer sb = new StringBuffer("");
        if(rpts == null)
        {
            info("δ��ʼ�������ʧ��");
            return;
        }
        else if(rpts.length == 0)
        {
            info("û�л�ִ");
        }
        else
        {
            len = rpts.length;
            while(i < len)
            {
                sb.append("�ֻ�: ");
                sb.append(rpts[i].getMobile() + " ");
                sb.append("��ִ����: ");
                sb.append(rpts[i].getCode() + " ");
                sb.append("��ִ����: ");
                sb.append(rpts[i].getDesc() + " ");
                sb.append("��ִʱ��: ");
                sb.append(rpts[i].getRptTime() + " ");
                sb.append("\n");
                i++;
            }
            info(sb.toString());
        }
	}
	public void error(Object obj , Throwable thr)
	{
		info(obj);
		thr.printStackTrace();
	}
	public void info(Object obj)
	{
		System.out.println(obj);
	}
	public String readLine()
	{
		String line = null;
		try
		{
			line = in.readLine();
		}
		catch(IOException e)
		{
			error("",e);
		}
		return line;
	}
	public int getInt(String str)
	{
		int ret = Integer.MIN_VALUE;
		try
		{
			ret = Integer.parseInt(str);
		}catch(NumberFormatException e)
		{
			ret = Integer.MIN_VALUE;
		}
		return ret;
	}
	public void usage()
	{
		info("Usage : java ApiTestDemo [-h host] [-n name] [-p password] [-i apiCode]");
		info("\t-h host        ��Ϣ����ַ");
		info("\t-n name        API��½��");
		info("\t-p password    API��½����");
		info("\t-i apiCode     API����");

	}
	public void menu()
	{
		info("\n------------------------------");
		info("1\t ���Ͷ���");
		info("2\t ���Ͷ���(srcID����)");
		info("3\t ���ն���");
		info("4\t ���ջ�ִ");
		info("5\t �鿴����");
		info("6\t �˳�");
		info("------------------------------");
		info("��������Ҫ���в���������:");
	}
	public void quit()
	{
		release();
		System.exit(0);
	}
	public void run()
	{
		while(true)
		{
			menu();
			int menu = 0;
			menu = parseMenu(readLine());
			//try{menu = in.read();}catch(Exception e){error("",e);}
			if(menu < 1 || menu > 6)
			{
				continue;
			}
			switch(menu)
			{
				case 1 : sendSM();break;
				case 2 : testSend();break;
				case 3 : recvSM();break;
				case 4 : recvRPT();break;
				case 5 : usage();break;
				case 6 : quit();break;
				default:;break;
			}
		}
	}
	public int parseMenu(String menu)
	{
		int cmd = 0;
		try
		{
			cmd = Integer.parseInt(menu);
		}
		catch(Exception e)
		{
			cmd = -1;
		}
		return cmd;
	}
	public void parseCmd(String[] args)
	{
		String tmp = "";
		int index = 0;
		int len = args.length;
		if(args.length > 0)
		{
			info("parse argements....");
			while(index < len)
			{
				tmp = args[index++].trim();
				if(tmp.equalsIgnoreCase("-h"))
				{
					host = args[index++];
					info(" host  = "+host);
				}
				else if(tmp.equalsIgnoreCase("-n"))
				{
					name = args[index++];
					info(" name  = "+name);
				}
				else if(tmp.equalsIgnoreCase("-p"))
				{
					pwd = args[index++];
					info(" pwd   = "+pwd);
				}
				else if(tmp.equalsIgnoreCase("-i"))
				{
					apiId = args[index++];
					info(" apiId = "+apiId);
				}
				else
				{
					index += 2;
					continue;
				}
			}
		}
	}
	
	class SendTask extends Thread
	{
		int loop = 10;
		long interval = 2000L;
		public SendTask()
		{
			
		}
		public void run()
		{
			Random random = new Random();
			long tmpSmId = 0;
			long tmpSrcId = 0;
			while(loop > 0)
			{
				try
				{
					Thread.sleep(interval);
				}catch(InterruptedException e)
				{
				}
				
				tmpSmId = random.nextInt(1000);
				tmpSrcId = random.nextInt(100);
				System.out.println("TestSend:"+loop + "[smId:"+tmpSmId+";srcId:"+tmpSrcId+"]");
				handler.sendSM(mobileStr.split(","), content,  tmpSmId, tmpSrcId);
				
				loop--;          
			}
			System.out.println("Test completed.");
		}
	}
	public static void main(String[] args)
	{
		ApiTestDemo demo = new ApiTestDemo(args);
		demo.run();
	}

}
