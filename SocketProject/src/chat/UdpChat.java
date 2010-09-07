package chat;

import java.io.*;
import java.net.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;


public class UdpChat extends JFrame {
	JPanel contentPane;
	JScrollPane jScrollPane1 = new JScrollPane();
	JTextArea jTextArea1 = new JTextArea();
	JLabel jLabel1 = new JLabel();
	JTextField jTextField1 = new JTextField();
	JLabel jLabel2 = new JLabel();
	JTextField jTextField2 = new JTextField();
	JLabel jLabel3 = new JLabel();
	JTextField jTextField3 = new JTextField();
	JButton jButton1 = new JButton();
	JButton jButton2 = new JButton();

	boolean wait = false;
	DatagramSocket receiveSocket, sendSocket;
	DatagramPacket receivePacket, sendPacket;

	int port=0;
	
	
	private class GetInfo implements Runnable {
		//���xһ���Ȳ��������Ϣ
		public void run() {
			String str;
			try {
				receiveMessage();
			} catch (Exception e) {
				jTextArea1.append(e.toString() + "\n");
			}
		}
	}

	
	public void receiveMessage() {
		try {
			String hostname;// ���x�͑��C׃��
			byte buf[] = new byte[500];
			// �����˿�̖��5000��DatagramSocket����
			receiveSocket = new DatagramSocket(5000);
			// ����datagrampacket����
			while (true) {
				receivePacket = new DatagramPacket(buf, buf.length);
				receiveSocket.receive(receivePacket);// ���Ք�����
				hostname = receivePacket.getAddress().toString();// �@�����C��
				int port = receivePacket.getPort();// �@�ö˿�̖
				jTextArea1.append("��������:" + hostname + "�˿�:" + port + "����Ϣ��");
				String str = new String(receivePacket.getData(), 0,
						receivePacket.getLength());
				jTextArea1.append(str + "\n");// �@ʾ�յ��Ĕ���
			}
		} catch (SocketException e) {
			jTextArea1.append(e + "\n");
		} catch (IOException e) {
			jTextArea1.append(e + "\n");
		}
	}

	public void sendMassage() {
		//�l�͔�����
		try {
			String str = jTextField3.getText();
			String ip = jTextField1.getText();//�@��Ŀ�ĵص�IP��ַ
			//int port = Integer.parseInt(jTextField2.getText());//�@�ö˿�̖
			port = Integer.parseInt(jTextField2.getText());//�@�ö˿�̖
			if (port >= 1 && port <= 65535) {
				jTextArea1.append("������:" + InetAddress.getByName(ip)+"�˿�"+ port + "����Ϣ��" + str + "\n");
				byte[] buf = new byte[500];
				//str.getBytes(0,str.length(),buf,0);
				//str.getBytes(0, str.length(), buf, 0);
				buf=str.getBytes();
				sendPacket = new DatagramPacket(buf, str.length(), InetAddress
						.getByName(ip), port);
				
//				sendPacket = new DatagramPacket(buf, str.length(), InetAddress.getLocalHost(), port);				
				sendSocket = new DatagramSocket();
				sendSocket.send(sendPacket);//�l�͔�����
				jTextField1.setText("");
				jTextField2.setText("");
				jTextField3.setText("");
			}
		} catch (IOException e) {
			jTextArea1.append(e + "\n");
		}
	}

	//Construct the frame
	public UdpChat() {
		enableEvents(AWTEvent.WINDOW_EVENT_MASK);
		try {
			jbInit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//Component initialization
	private void jbInit() throws Exception {
		contentPane = (JPanel) this.getContentPane();
		contentPane.setBackground(new Color(180, 187, 255));
		contentPane.setFont(new java.awt.Font("Dialog", 0, 12));
		contentPane.setMaximumSize(new Dimension(2147483647, 2147483647));
		contentPane.setLayout(null);
		this.setSize(new Dimension(400, 300));
		this.setTitle("UDP�������");
		jScrollPane1.setBounds(new Rectangle(10, 8, 378, 133));
		jTextArea1.setText("");
		jLabel1.setFont(new java.awt.Font("Dialog", 0, 12));
		jLabel1.setRequestFocusEnabled(true);
		jLabel1.setVerifyInputWhenFocusTarget(true);
		jLabel1.setText("IP��ַ");
		jLabel1.setBounds(new Rectangle(9, 150, 36, 21));
		jTextField1.setText("");
		jTextField1.setBounds(new Rectangle(47, 150, 137, 29));
		jLabel2.setFont(new java.awt.Font("Dialog", 0, 12));
		jLabel2.setText("�˿ں�");
		jLabel2.setBounds(new Rectangle(214, 150, 48, 24));
		jTextField2.setText("");
		jTextField2.setBounds(new Rectangle(270, 150, 106, 28));
		jLabel3.setFont(new java.awt.Font("Dialog", 0, 12));
		jLabel3.setRequestFocusEnabled(true);
		jLabel3.setText("������Ϣ");
		jLabel3.setBounds(new Rectangle(4, 195, 53, 20));
		jTextField3.setText("");
		jTextField3.setBounds(new Rectangle(62, 193, 327, 33));
		jTextField3.addKeyListener(new UdpChat_jTextField3_keyAdapter(this));
		jButton1.setBounds(new Rectangle(6, 248, 98, 29));
		jButton1.setFont(new java.awt.Font("Dialog", 0, 12));
		jButton1.setText("����");
		jButton1.addActionListener(new UdpChat_jButton1_actionAdapter(this));
		jButton2.setBounds(new Rectangle(216, 251, 107, 31));
		jButton2.setFont(new java.awt.Font("Dialog", 0, 12));
		jButton2.setToolTipText("");
		jButton2.setText("�˳�");
		jButton2.addActionListener(new UdpChat_jButton2_actionAdapter(this));
		contentPane.add(jScrollPane1, null);
		contentPane.add(jLabel1, null);
		contentPane.add(jTextField1, null);
		contentPane.add(jLabel2, null);
		contentPane.add(jTextField2, null);
		contentPane.add(jLabel3, null);
		contentPane.add(jTextField3, null);
		contentPane.add(jButton1, null);
		contentPane.add(jButton2, null);
		jScrollPane1.getViewport().add(jTextArea1, null);
		
		GetInfo getinfo = new GetInfo();
		Thread t=new Thread(getinfo);
		t.start();
		//receiveMessage();
	}

	//Overridden so we can exit when window is closed
	protected void processWindowEvent(WindowEvent e) {
		super.processWindowEvent(e);
		if (e.getID() == WindowEvent.WINDOW_CLOSING) {
			System.exit(0);
		}
	}

	void jButton1_actionPerformed(ActionEvent e) {
		sendMassage();
		//wait = true;
		//receiveMessage();
	}

	void jButton2_actionPerformed(ActionEvent e) {
		wait = false;
		System.exit(0);
	}

	void jTextField3_keyPressed(KeyEvent e) {
		if (e.getKeyChar() == KeyEvent.VK_ENTER) {
			sendMassage();
		}
	}
}

class UdpChat_jButton1_actionAdapter implements java.awt.event.ActionListener {
	UdpChat adaptee;

	UdpChat_jButton1_actionAdapter(UdpChat adaptee) {
		this.adaptee = adaptee;
	}

	public void actionPerformed(ActionEvent e) {
		adaptee.jButton1_actionPerformed(e);
	}
}

class UdpChat_jButton2_actionAdapter implements java.awt.event.ActionListener {
	UdpChat adaptee;

	UdpChat_jButton2_actionAdapter(UdpChat adaptee) {
		this.adaptee = adaptee;
	}

	public void actionPerformed(ActionEvent e) {
		adaptee.jButton2_actionPerformed(e);
	}
}

class UdpChat_jTextField3_keyAdapter extends java.awt.event.KeyAdapter {
	UdpChat adaptee;

	UdpChat_jTextField3_keyAdapter(UdpChat adaptee) {
		this.adaptee = adaptee;
	}

	public void keyPressed(KeyEvent e) {
		adaptee.jTextField3_keyPressed(e);
	}
}