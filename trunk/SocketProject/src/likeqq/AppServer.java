package likeqq;
/*С�� QQ:3312883*/
import java.awt.event.*;
import java.io.*;
import java.net.*;

//�ͻ���Ϣ
class Customer implements Serializable
{
	//���� �û��� ����
	String custName;
	String custPassword;
	
}
public class AppServer extends Thread
{
	//�����������׽���
	ServerSocket serverSocket;
	public AppServer()
	{
		try//�����쳣
		{
		serverSocket = new ServerSocket(1001);//��ʼ�� �������׽��� ���÷������˿�Ϊ 1001
	    }
	    catch(IOException e)
	    {
	    	fail(e,"��������������");//�����ʼ��ʧ�� ���� ��ʾ�쳣
	    }
	    System.out.println("���������� . . .");//��������ʼ���ɹ�
	    start();//�����߳�
	}
	public static void fail(Exception e,String str)//�Զ����쳣
	{
		System.out.println(str + "." + e);
	}
	public void run()//�����߳̿�ʼ
	{
		try//�����쳣
		{
			while(true)//while��Ϳ�ʼ�����ͻ�������
			{
				Socket client = serverSocket.accept();//��ȡ�ͻ���Socket  �������ݵ���ʱ ������װ��client��
				/*Connection con =*/ new Connection(client);//Ȼ�� ��ʼ��һ��Connection (PS:��ΪAppServer�ൽ�������ѭ���� �����Ұ�ǰ���Ƕ�ע�͵���ûӰ��:)
			}
		}
		catch(IOException e)//�������������� ������
		{
			fail(e,"Not listening");
		}
	}

	
    public static void main(String args[])//�������
	{
		new AppServer();//��ʼ�� AppServer
	}
}

class Connection extends Thread
{
	//����һ���ͻ��˵��׽���(PS:�����Ǹ��Ƿ������׽��� ����ǿͻ��˵�)�� һ���������������
	protected Socket netClient;//�ͻ��˵�Socket
	protected ObjectInputStream fromClient;//�ӿͻ��˻������
	protected PrintStream toClient;//�������ݵ��ͻ���
	public Connection(Socket client)//�������41�� �����ʼ��Connection 
	{
		netClient = client;//��client��ֵ��netClient��
		try//�����쳣
		{
		fromClient = new ObjectInputStream(netClient.getInputStream());//��ʼ��һ�������� ��netClient������ݸ�ֵ��fromClient��
		toClient = new PrintStream(netClient.getOutputStream());//��ʼ��һ������� ��netClient����������ݸ�ֵ��toClient��
	    }
	    catch(IOException e)//�������ĳ�ʼ�������� �͹ر��׽���
	    {
	    	try
	    	{
	    	netClient.close();//�ر��׽���
	        }
	        catch(IOException el)
	        {
	        	System.err.println("Unable to set up streams" + el);
	        	return;
	        }
	    }
	    this.start();//�����ڶ����߳�
	}
	public void run()//�����ڶ����߳̿�ʼ
	{
		//����һ��Customer�� (PS:Customer�������������� Customer��ʵ����һ�����ݽṹ)
		Customer clientMessage;
		try//�����쳣
		{
			for(;;)//�����ж�ѭ��
			{
			clientMessage = (Customer)fromClient.readObject();//�����ǽ�68�г�ʼ����fromClient�����ݶ����� ת����Customer���� Ȼ���ڸ�ֵ��clientMessage��
			if(clientMessage == null)//�������Ϊ�� ��break
			break;
			toClient.println("�յ���������������:" +"�û���"+ clientMessage.custName+"����"+clientMessage.custPassword);//��toClient�������ݻؿͻ���
			System.out.println("��½:" + "�û���" +clientMessage.custName+"����"+clientMessage.custPassword);//����ڷ���������̨����ʾ �����Ϸ������Ŀͻ��� �û�������
		    }
		}
		catch(IOException e)//����IO�쳣
		{
			System.out.println("Error in reading object" + e);
		}
		catch(ClassNotFoundException el)
		{
			System.out.println("Error in reading object" + el);
		}
		finally//finally�����Ӹ�����...
		{
//			try
//			{
//				netClient.close();
//			}
//			catch(IOException e)
//			{
//				
//			}
		}
	}
}