package socketclient;

import java.io.*;
import java.net.*;
import java.util.Properties;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class ClientFrameApp extends JFrame implements Runnable {
	//��ر�������
	JPanel contentPane; //�������
	JScrollPane scrollText = new JScrollPane(); //���������
	JTextArea txtArea = new JTextArea(); //�ı�����
	JTextField txtConet = new JTextField(); //�ı���
	JButton btnLink = new JButton(); //���Ӱ�ť
	JButton btnSend = new JButton(); //���Ͱ�ť
	JButton btnExit = new JButton(); //�˳���ť

	Socket clientSocket; //�ͻ��˷�����Ϣ��clientSocket
	BufferedReader clientBR; //�������ļ�
	PrintWriter clientPW; //��ӡ���ļ�

	private static String ip = ""; //Զ�̷�������ip
	private static int port = 0; //Զ�̷������Ķ˿�

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
		//������,�ı���������İ�
		scrollText.setBounds(new Rectangle(8, 5, 385, 186));
		txtArea.setText("");
		scrollText.getViewport().add(txtArea, null);
		txtArea.addKeyListener(new Frame1_txtArea_keyAdapter(this));
		//�����ļ���
		txtConet.setText("");
		txtConet.setBounds(new Rectangle(9, 197, 381, 32));
		//�س��¼�����
		txtConet.addKeyListener(new Frame1_txtConet_keyAdapter(this));
		//���ӷ���������
		btnLink.setBounds(new Rectangle(7, 243, 86, 27));
		btnLink.setText("����");
		btnLink.addActionListener(new Frame1_btnLink_actionAdapter(this));
		//������Ϣ��������
		btnSend.setBounds(new Rectangle(149, 244, 91, 27));
		btnSend.setEnabled(false);
		btnSend.setText("����");
		btnSend.addActionListener(new Frame1_btnSend_actionAdapter(this));
		//�˳��¼�����
		btnExit.setBounds(new Rectangle(294, 242, 94, 28));
		btnExit.setText("�˳�");
		btnExit.addActionListener(new Frame1_btnExit_actionAdapter(this));
		contentPane.add(scrollText, null);
		contentPane.add(txtConet, null);
		contentPane.add(btnLink, null);
		contentPane.add(btnSend, null);
		contentPane.add(btnExit, null);
	}

	/**
	 * �����̣߳���ȡ���ݣ�
	 * 
	 */
	private class GetInfo implements Runnable {
		public void run() {
			String str; //�����ʾ��Ϣ
			try {
				do{
					str = clientBR.readLine(); //������s����������һ��
					txtArea.append("�������Ϣ��" + str + "\n");
				}while(!str.equalsIgnoreCase("server_exit"));
				btnSend.setEnabled(false); //�쳣ʱ���Ͱ�ť�ر�
				btnLink.setEnabled(true);
				clientBR.close(); //�رջ�����
				clientPW.close(); //�ر������
				clientSocket.close(); //�ر�Socket
			} catch (Exception e) {
				txtArea.append(e.toString() + "\n");
			}
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
				clientPW.println("client_exit");
				clientPW.flush();
			} catch (Exception err) {
				txtArea.append(err.toString() + "\n");
			} finally {
				System.exit(0);
			}
		}
	}

	/**
	 * ͨ����ȡ�����ļ���Ϣ�õ�Զ�̵�IP��ַ�������Ϣ
	 */
	private static void GetRemoteAdd() {
		//����Properties�ļ���
		if ("".equals(ip)) {
			Properties properties = new Properties();
			ip="127.0.0.1";//local test
			port=5024;
//			try {
//				properties
//						.load(ClientFrameApp.class
//								.getResourceAsStream("/RemoteConfig.properties"));
//				ip = properties.getProperty("SMS.IP");
//				port = Integer.parseInt(properties.getProperty("SMS.PORT"));
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
		}
	}

	/**
	 * ������Ϣʱ�������̣߳������߳�
	 */
	public void run() {
		try {
			GetRemoteAdd();//ȡ��Զ�̵�ip�Ͷ˿ں�
			clientSocket = new Socket(ip, port);//����Ҫ���ʵ�Զ��Socket

			clientBR = new BufferedReader(new InputStreamReader(clientSocket
					.getInputStream()));//���ջ�����������
			clientPW = new PrintWriter(clientSocket.getOutputStream());//���ͻ�����������

			btnSend.setEnabled(true); //���Ͱ�ť����
			GetInfo getinfo = new GetInfo();
			Thread t = new Thread(getinfo);
			t.start();
			txtArea.append("�͑����Լ��룡\n");
			btnLink.setEnabled(false); //���Ӱ�ť������
		} catch (Exception e) {
			txtArea.append(e.toString() + "\n");
		}

	}

	/**
	 * �������ʱ���������̣߳�
	 * @param e
	 */
	void btnLink_actionPerformed(ActionEvent e) {
		Thread t = new Thread(this);
		t.start();
	}

	/**
	 * ���ͻ���������
	 */
	void btnSend_actionPerformed(ActionEvent e) {
		clientPW.println(txtConet.getText());
		clientPW.flush();
		txtArea.append("�͑�����Ϣ��" + txtConet.getText() + "\n");
		txtConet.setText("");
	}

	/**
	 * �˳���Ϣ����
	 */
	void btnExit_actionPerformed(ActionEvent e) {
		try {
			txtArea.append("�͑����˳���\n");
			clientPW.println("client_exit");
			clientPW.flush();
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
			clientPW.println(txtConet.getText());
			clientPW.flush();
			txtArea.append("�͑�����Ϣ��" + txtConet.getText() + "\n");
			txtConet.setText("");
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