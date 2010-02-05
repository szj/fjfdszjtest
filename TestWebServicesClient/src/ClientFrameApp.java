
/*
        service0.setProperty("mtom-enabled", "true");
        org.codehaus.xfire.client.Client.getInstance(var).setProperty("mtom-enabled","true");
        org.codehaus.xfire.client.Client.getInstance(var).setProperty(HttpTransport.CHUNKING_ENABLED,"true");
 */

import java.io.*;
import java.net.*;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

import org.codehaus.xfire.transport.http.HttpTransport;

import com.qzgf.GetListDatebyBytesClient;
import com.qzgf.GetListDatebyBytesPortType;
import com.qzgf.utils.FileZip;
import com.qzgf.utils.StringParseToXML;
import com.qzgf.utils.WriteFile;

public class ClientFrameApp extends JFrame {
	//��ر�������
	JPanel contentPane; //�������
	JScrollPane scrollText = new JScrollPane(); //���������
	JTextArea txtArea = new JTextArea(); //�ı�����
	JLabel lbSend = new JLabel(); // �ı���ʾ��
	JTextField txtConet = new JTextField(); //�ı���
	JButton btnLink = new JButton(); //���Ӱ�ť
	JButton btnSend = new JButton(); //���Ͱ�ť
	JButton btnExit = new JButton(); //�˳���ť
	
	JLabel lbHitMsg= new JLabel(); //��ʾ��Ϣ

	/**
	 * ���췽��
	 * 
	 */
	public ClientFrameApp() {
		enableEvents(AWTEvent.WINDOW_EVENT_MASK);
		try {
			jbInit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * �ؼ���ʼ��
	 * @throws Exception
	 */
	private void jbInit() throws Exception {
		//�½����
		contentPane = (JPanel) this.getContentPane();
		contentPane.setLayout(null);
		this.setSize(new Dimension(500, 400));
		this.setTitle("����GPS�͑���");
		// ������Ϣ���ı���ͱ�ǩ.
		lbSend.setText("���ͱ���");
		lbSend.setBounds(new Rectangle(8, 5, 50, 20));
		//�����ļ���
		txtConet.setText("R,��K00212,2008-11-01,2008-11-05");
		txtConet.setBounds(new Rectangle(65, 5, 200, 20));
		//�س��¼�����
		txtConet.addKeyListener(new Frame1_txtConet_keyAdapter(this));
		//������,�ı���������İ�
		scrollText.setBounds(new Rectangle(8, 30, 450, 300));
		txtArea.setText("");
		scrollText.getViewport().add(txtArea, null);
		txtArea.addKeyListener(new Frame1_txtArea_keyAdapter(this));
		//������Ϣ��������
		btnSend.setBounds(new Rectangle(280,5,80, 20));
		btnSend.setText("����");
		btnSend.addActionListener(new Frame1_btnSend_actionAdapter(this));
		//�˳��¼�����
		btnExit.setBounds(new Rectangle(380, 5, 80, 20));
		btnExit.setText("�˳�");
		btnExit.addActionListener(new Frame1_btnExit_actionAdapter(this));
		
		// ��ʾ��Ϣ
		lbHitMsg.setText("���ĸ�ʽ:ָ��,�������,���Ľ��տ�ʼʱ��,����ʱ�� �ղ������뾭��'*'�Ŵ���!");
		lbHitMsg.setForeground(Color.red);
		lbHitMsg.setBounds(new Rectangle(8, 335, 450, 40));

		contentPane.add(lbSend, null);
		contentPane.add(txtConet, null);
		contentPane.add(btnSend, null);
		contentPane.add(btnExit, null);
//		contentPane.add(btnLink, null);
		contentPane.add(scrollText, null);
		contentPane.add(lbHitMsg, null);
		
        Timer timer = new Timer(true);
        //�������è���ݲɼ�����ΪÿСʱ����
        TimerTask getGpsRecorderTimerTask = new GetGpsRecordTimer();
        timer.schedule(getGpsRecorderTimerTask, 0, 60 * 60 * 1000);
        Calendar cal = Calendar.getInstance();
        String timertaskhit="��ʱ���Ѿ�����������ÿ��23��"+ cal.get(Calendar.MINUTE)+"��ʱ��ȡ�õ������г�������ʻ��¼��";
        txtArea.append(timertaskhit + "\n");
	}
	/**
	 * �����ļ�����
	 * ָ���ʽ:str��"����" ,������ָ�����������ţ�,'��ʼ����','��������'
	 */
	private void ProRemoteDate(String str)
	{
		try {

	        GetListDatebyBytesClient client = new GetListDatebyBytesClient();
	        
	        GetListDatebyBytesPortType service = client.getGetListDatebyBytesHttpPort();
	        
			List ls=(List)FileZip.uncompressList(service.getCompress(str));
			
//			����delphi��ʹ��
//			byte[] bytestr=service.getListToXmlToByte(str);
//			
//			String xmlstr=(String)FileZip.ByteToXml(bytestr);
//			System.out.println(xmlstr);
			
			// 2.Զ�̷��������
			AddMsgTextArea("�����ȡ�����ݣ�");
			if (ls.size() == 0) {
				AddMsgTextArea("���������ݲ����ڻ���û��Ȩ�ޣ�");
			} else {
				// 3.�ͻ��˿�ʼ��������
				AddMsgTextArea("�ͻ��˿�ʼд����!");
				WriteFile wf = new WriteFile();
				//String filename=wf.ProWriteFilebyList("./",str,ls);
				//����·��
				String filename=wf.ProWriteFilebyList("",System.getProperty("user.dir")+"\\",str,ls);
				//System.out.println(System.getProperty("user.dir"));//user.dirָ���˵�ǰ��·��
				AddMsgTextArea("�ͻ������д���ݣ��ļ�����Ϊ:"+filename);
			}
		} catch (Exception e) {
			AddMsgTextArea("�޷�ȡ��Զ�̷�����������!\r\n"+e.toString());
		}
	}
	
	/**
	 * ���ͻ���������
	 */
	void btnSend_actionPerformed(ActionEvent e) {
		
		// 1.���ļ���Ϣ��֤
		String strCmd = txtConet.getText();
		// 2.���ͱ�����Ϣ
		String str = "���ļ�������Ϣ��" + txtConet.getText();
		AddMsgTextArea(str);
		if (str.split(",").length == 4) {
			// 3.����������
			String AreaStr = "103,";// ��������Ȩ�������.
			strCmd = AreaStr + strCmd;
			ProRemoteDate(strCmd);
		} else {
			str="���ĸ�ʽ����,�뿴���˵��";
			AddMsgTextArea(str);	
		}
	}
	/**
	 * windows�Ĺرհ�ť�¼�����
	 */
	protected void processWindowEvent(WindowEvent e) {
		super.processWindowEvent(e);
		if (e.getID() == WindowEvent.WINDOW_CLOSING) {
			try {
				txtArea.append("�͑����˳���\n");
			} catch (Exception err) {
				txtArea.append(err.toString() + "\n");
			} finally {
				System.exit(0);
			}
		}
	}

	/**
	 * �������ʱ���������̣߳�
	 * @param e
	 */
	void btnLink_actionPerformed(ActionEvent e) {
	}

	/**
	 * ��Ϣ�����������Ϣ
	 */
	public void  AddMsgTextArea(String MsgStr)
	{
		txtArea.append(MsgStr + "\n");
		txtConet.setText("");		
	}

	/**
	 * �˳���Ϣ����
	 */
	void btnExit_actionPerformed(ActionEvent e) {
		try {
			txtArea.append("�͑����˳���\n");
		} catch (Exception err) {
			txtArea.append(err.toString() + "\n");
		} finally {
			System.exit(0);
		}
	}

	/**
	 * �ı���س��¼�
	 */
	void txtConet_keyPressed(KeyEvent e) {
		char a=e.getKeyChar();
		if (e.getKeyChar() == KeyEvent.VK_ENTER) {
			// 1.���ļ���Ϣ��֤
			String strCmd = txtConet.getText();
			// 2.���ͱ�����Ϣ
			String str = "���ļ�������Ϣ��" + txtConet.getText();
			AddMsgTextArea(str);
			if (str.split(",").length == 4) {
				// 3.����������
				String AreaStr = "103,";// ��������Ȩ�������.
				strCmd = AreaStr + strCmd;
				ProRemoteDate(strCmd);
			} else {
				str="���ĸ�ʽ����,�뿴���˵��";
				AddMsgTextArea(str);	
			}
		}
	}

	/**
	 * �ı���������¼�
	 */
	void txtArea_keyF1(KeyEvent e) {
		if (e.getKeyCode() == KeyEvent.VK_F1) {
			txtArea.setText("");
		}
	}
}

//�����¼�
class Frame1_btnLink_actionAdapter implements java.awt.event.ActionListener {
	ClientFrameApp adaptee;

	Frame1_btnLink_actionAdapter(ClientFrameApp adaptee) {
		this.adaptee = adaptee;
	}

	public void actionPerformed(ActionEvent e) {
		adaptee.btnLink_actionPerformed(e);
	}
}

//�����¼�
class Frame1_btnSend_actionAdapter implements java.awt.event.ActionListener {
	ClientFrameApp adaptee;

	Frame1_btnSend_actionAdapter(ClientFrameApp adaptee) {
		this.adaptee = adaptee;
	}

	public void actionPerformed(ActionEvent e) {
		adaptee.btnSend_actionPerformed(e);
	}
}

//�˳��¼�
class Frame1_btnExit_actionAdapter implements java.awt.event.ActionListener {
	ClientFrameApp adaptee;

	Frame1_btnExit_actionAdapter(ClientFrameApp adaptee) {
		this.adaptee = adaptee;
	}

	public void actionPerformed(ActionEvent e) {
		adaptee.btnExit_actionPerformed(e);
	}
}

//�س��¼�
class Frame1_txtConet_keyAdapter extends java.awt.event.KeyAdapter {
	ClientFrameApp adaptee;

	Frame1_txtConet_keyAdapter(ClientFrameApp adaptee) {
		this.adaptee = adaptee;
	}

	public void keyPressed(KeyEvent e) {
		adaptee.txtConet_keyPressed(e);
	}
}

//����¼�
class Frame1_txtArea_keyAdapter extends java.awt.event.KeyAdapter {
	ClientFrameApp adaptee;

	Frame1_txtArea_keyAdapter(ClientFrameApp adaptee) {
		this.adaptee = adaptee;
	}

	public void keyPressed(KeyEvent e) {
		adaptee.txtArea_keyF1(e);
	}
}


