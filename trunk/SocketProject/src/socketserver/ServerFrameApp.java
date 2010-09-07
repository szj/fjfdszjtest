package socketserver;

import java.net.*;
import java.util.Properties;
import java.io.*;
import java.awt.*;
import java.awt.event.*;

import javax.swing.*;

import socketclient.ClientFrameApp;

public class ServerFrameApp extends JFrame implements Runnable {

	// ��ر�������
	JPanel contentPane; // �������
	JScrollPane scrollText = new JScrollPane(); // ���������
	JTextArea txtArea = new JTextArea(); // �ı�����
	JLabel lbSend = new JLabel(); // �ı���ʾ��
	JTextField txtConet = new JTextField(); // �ı���

	JButton btnSend = new JButton(); // ���Ͱ�ť
	JButton btnExit = new JButton(); // �˳���ť

	Socket socket; // �ͻ���Socket
	ServerSocket serversocket; // �����Socket
	BufferedReader clientBR; // �������ļ�
	PrintWriter clientPW; // ��ӡ���ļ�

	private static String ip = ""; // Զ�̷�������ip
	private static int port = 0; // Զ�̷������Ķ˿�
	
	private static boolean flag = true; // Զ�̷������Ķ˿�

	/**
	 * ���캯��
	 */
	public ServerFrameApp() {
		enableEvents(AWTEvent.WINDOW_EVENT_MASK);
		try {
			jbInit();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * ��ʼ���ؼ�
	 * 
	 */
	private void jbInit() throws Exception {
		// ���
		contentPane = (JPanel) this.getContentPane();
		contentPane.setLayout(null);
		this.setSize(new Dimension(500, 400));
		this.setTitle("����GPS�����");
		// ���ù����������ı�����Ĺ���
		scrollText.setBounds(new Rectangle(15, 5, 371, 182));
		txtArea.setText("");
		scrollText.getViewport().add(txtArea, null);
		txtArea.addKeyListener(new Frame1_txtArea_keyAdapter(this));
		// ������Ϣ���ı���ͱ�ǩ.
		lbSend.setText("������Ϣ");
		lbSend.setBounds(new Rectangle(17, 198, 52, 20));
		txtConet.setText("");
		txtConet.setBounds(new Rectangle(76, 197, 309, 28));
		txtConet.addKeyListener(new Frame1_txtConet_keyAdapter(this));
		// ���Ͱ�ť
		btnSend.setBounds(new Rectangle(20, 255, 105, 28));
		btnSend.setEnabled(false);
		btnSend.setText("����");
		btnSend.addActionListener(new Frame1_btnSend_actionAdapter(this));
		// �˳���ť
		btnExit.setBounds(new Rectangle(189, 257, 112, 27));
		btnExit.setText("�˳�");
		btnExit.addActionListener(new Frame1_btnExit_actionAdapter(this));

		contentPane.add(scrollText, null);
		contentPane.add(lbSend, null);
		contentPane.add(txtConet, null);
		contentPane.add(btnSend, null);
		contentPane.add(btnExit, null);
		// ���������߳�
		Thread t = new Thread(this);
		t.start();
	}

	/**
	 * ����һ���ڲ��࣬������Ϣ
	 * 
	 * @author fjfdszj
	 * 
	 */
	private class GetInfo implements Runnable {
		public void run() {
			String str;
			try {
				do{
					str = clientBR.readLine();// �����ӽ��ջ�������ȡһ������
					txtArea.append("�͑�����Ϣ��" + str + "\n");
				}while(!str.equalsIgnoreCase("client_exit"));
				clientBR.close(); // �رս��ջ���������
				clientPW.close(); // �رշ��ͻ���������
				socket.close(); // �ر�socket
				//serversocket.close(); // �ر�serversocket
				btnSend.setEnabled(false);
				//flag=false;
				// ���������߳�
				//Thread t = new Thread(this);
				//t.start();				
			} catch (Exception e) {
				txtArea.append(e.toString() + "\n");
			}
		}
	}

	/**
	 * ͨ����ȡ�����ļ���Ϣ�õ�Զ�̵�IP��ַ�������Ϣ
	 */
	private static void GetRemoteAdd() {
		// ����Properties�ļ���
		if ("".equals(ip)) {
			Properties properties = new Properties();
			ip="127.0.0.1";
			port=5024;
//			try {
//				properties.load(ClientFrameApp.class.getResourceAsStream("/LocalConf.properties"));
//				ip = properties.getProperty("SMS.IP");
//				port = Integer.parseInt(properties.getProperty("SMS.PORT"));
//
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
		}
	}

	/**
	 * �����̷߳���
	 */
	public void run() {
		try {
			GetRemoteAdd();// ȡ�ñ��ص�ip�Ͷ˿ں�
			if(flag)serversocket = new ServerSocket(port);
			while (true) {
				socket = serversocket.accept();// ���տ͑��˵�socket��Ϣ
				clientBR = new BufferedReader(new InputStreamReader(socket
						.getInputStream()));// ���ջ�����
				clientPW = new PrintWriter(socket.getOutputStream());// ���ͻ�����
				if (socket != null) {
					txtArea.append("�͑������ӳɹ���\n");
					txtArea.append("�µ�����: " + socket.getInetAddress() + ":"
							+ socket.getPort() + "\n");
					btnSend.setEnabled(true);
				}
				GetInfo getinfo = new GetInfo();
				Thread t = new Thread(getinfo);// �������տ͑�����Ϣ�ľ���
				t.start();
			}
		} catch (Exception e) {
			txtArea.append(e.toString() + "\n");
		}

	}

	/***************************************************************************
	 * windows�ر��¼�
	 */
	protected void processWindowEvent(WindowEvent e) {
		super.processWindowEvent(e);
		if (e.getID() == WindowEvent.WINDOW_CLOSING) {
			try {
				txtArea.append("������˳���\n");
				clientPW.println("server_exit");
				clientPW.flush();
			} catch (Exception err) {
				txtArea.append(err.toString() + "\n");
			} finally {
				System.exit(0);
			}
		}
	}

	/**
	 * ������Ϣ
	 * 
	 * @param e
	 */
	void btnSend_actionPerformed(ActionEvent e) {
		clientPW.println(txtConet.getText());
		clientPW.flush();
		txtArea.append("�������Ϣ��" + txtConet.getText() + "\n");
		txtConet.setText("");
	}

	/**
	 * ������˳�
	 * 
	 * @param e
	 */
	void btnExit_actionPerformed(ActionEvent e) {
		try {
			txtArea.append("������˳���\n");
			clientPW.println("server_exit");
			clientPW.flush();
		} catch (Exception err) {
			txtArea.append(err.toString() + "\n");
		} finally {
			System.exit(0);
		}
	}

	void txtConet_keyPressed(KeyEvent e) {
		if (e.getKeyChar() == KeyEvent.VK_ENTER) {
			clientPW.println(txtConet.getText());
			clientPW.flush();
			txtArea.append("�������Ϣ��" + txtConet.getText() + "\n");
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

class Frame1_btnSend_actionAdapter implements java.awt.event.ActionListener {
	ServerFrameApp adaptee;

	Frame1_btnSend_actionAdapter(ServerFrameApp adaptee) {
		this.adaptee = adaptee;
	}

	public void actionPerformed(ActionEvent e) {
		adaptee.btnSend_actionPerformed(e);
	}
}

class Frame1_btnExit_actionAdapter implements java.awt.event.ActionListener {
	ServerFrameApp adaptee;

	Frame1_btnExit_actionAdapter(ServerFrameApp adaptee) {
		this.adaptee = adaptee;
	}

	public void actionPerformed(ActionEvent e) {
		adaptee.btnExit_actionPerformed(e);
	}
}

class Frame1_txtConet_keyAdapter extends java.awt.event.KeyAdapter {
	ServerFrameApp adaptee;

	Frame1_txtConet_keyAdapter(ServerFrameApp adaptee) {
		this.adaptee = adaptee;
	}

	public void keyPressed(KeyEvent e) {
		adaptee.txtConet_keyPressed(e);
	}
}

class Frame1_txtArea_keyAdapter extends java.awt.event.KeyAdapter {
	ServerFrameApp adaptee;

	Frame1_txtArea_keyAdapter(ServerFrameApp adaptee) {
		this.adaptee = adaptee;
	}

	public void keyPressed(KeyEvent e) {
		adaptee.txtArea_keyF1(e);
	}
}