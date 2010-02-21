import java.awt.*;
import java.awt.event.*;
import javax.swing.*;



public class ClientFrameApp extends JFrame {
	//��ر�������
	JPanel contentPane; //�������
	JScrollPane scrollText = new JScrollPane(); //���������
	JTextArea txtArea = new JTextArea(); //�ı�����
	
	
	JLabel lbMobile = new JLabel(); // �ı���ʾ��       �ֻ���
	JTextField txtMobile = new JTextField(); //�ı���
	
	
	JLabel lbSend = new JLabel(); // �ı���ʾ��			����
	JTextField txtConet = new JTextField(); //�ı���
	
	
	JButton btnLink = new JButton(); //���Ӱ�ť
	JButton btnSend = new JButton(); //���Ͱ�ť
	JButton btnAbbreviate = new JButton(); //���Ͱ�ť
	JButton btnExit = new JButton(); //�˳���ť
	
	JButton btnStartSMproxy = new JButton(); //���Ͱ�ť
	JButton btnEndSMproxy = new JButton(); //�˳���ť
	
	JLabel lbHitMsg= new JLabel(); //��ʾ��Ϣ
	
	//�����շ���
	SMProxySend myproxy=null;

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
		this.setTitle("SMproxy���ŷ���");
		
		// ������Ϣ���ı���ͱ�ǩ.
		lbMobile.setText("�ֻ���");
		lbMobile.setBounds(new Rectangle(8, 5, 50, 20));
		//�����ļ���
		txtMobile.setText("13599204724");
		txtMobile.setBounds(new Rectangle(65, 5, 200, 20));
		
		//������Ϣ��������
		btnSend.setBounds(new Rectangle(280,5,80, 20));
		btnSend.setText("����");
		btnSend.addActionListener(new Frame1_btnSend_actionAdapter(this));
		//�˳��¼�����
		btnExit.setBounds(new Rectangle(380, 5, 80, 20));
		btnExit.setText("�˳�");
		btnExit.addActionListener(new Frame1_btnExit_actionAdapter(this));
		
		
		//ƴ��������
		btnAbbreviate.setBounds(new Rectangle(280,350,80, 20));
		btnAbbreviate.setText("ƴ��");
		btnAbbreviate.addActionListener(new Frame1_btnSend_actionAdapter(this));
		
		// ������Ϣ���ı���ͱ�ǩ.
		lbSend.setText("��������");
		lbSend.setBounds(new Rectangle(8, 30, 50,20));
		//�����ļ���
		txtConet.setText("Linux�¶��Ų��ԣ�");
		txtConet.setBounds(new Rectangle(65, 30, 200,20));
		//�س��¼�����
		txtConet.addKeyListener(new Frame1_txtConet_keyAdapter(this));
		//������,�ı���������İ�
		scrollText.setBounds(new Rectangle(8, 55, 450,275));
		txtArea.setText("");
		scrollText.getViewport().add(txtArea, null);
		txtArea.addKeyListener(new Frame1_txtArea_keyAdapter(this));
		//������Ϣ��������
		btnStartSMproxy.setBounds(new Rectangle(280,30,80, 20));
		btnStartSMproxy.setText("�������ŷ���");
		btnStartSMproxy.addActionListener(new Frame1_btnStartSMproxy_actionAdapter(this));
		//�˳��¼�����
		btnEndSMproxy.setBounds(new Rectangle(380, 30, 80, 20));
		btnEndSMproxy.setText("�رն��ŷ���");
		btnEndSMproxy.addActionListener(new Frame1_btnEndSMproxy_actionAdapter(this));
		// ��ʾ��Ϣ
		lbHitMsg.setText("�ֻ��ţ����ݱ��");
		lbHitMsg.setForeground(Color.red);
		lbHitMsg.setBounds(new Rectangle(8, 335, 450, 40));
		contentPane.add(lbMobile, null);
		contentPane.add(txtMobile, null);
		contentPane.add(btnSend, null);
		contentPane.add(btnAbbreviate, null);
		contentPane.add(btnExit, null);
		contentPane.add(lbSend, null);
		contentPane.add(txtConet, null);
		contentPane.add(btnStartSMproxy, null);
		contentPane.add(btnEndSMproxy, null);
		contentPane.add(scrollText, null);
		contentPane.add(lbHitMsg, null);
	}
	
	public void SendSMproxy(String mobiles,String content)
	{
		myproxy.SendMessage(mobiles, content);
		
	}
	/**
	 * ƴ������
	 */
	void btnAbbreviate_actionPerformed(ActionEvent e) {
		String mobiles=txtMobile.getText().toString();
		String content=txtConet.getText().toString();
		AddMsgTextArea("���Ͷ��ţ��ֻ���:"+mobiles+"\r\n ����:"+content);
		SendSMproxy(mobiles,content);
	}
	
	/**
	 * ���ͻ���������
	 */
	void btnSend_actionPerformed(ActionEvent e) {
		String mobiles=txtMobile.getText().toString();
		String content=txtConet.getText().toString();
		AddMsgTextArea("���Ͷ��ţ��ֻ���:"+mobiles+"\r\n ����:"+content);
		SendSMproxy(mobiles,content);
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
		//txtConet.setText("");		
	}

	/**
	 * �˳���Ϣ����
	 */
	void btnExit_actionPerformed(ActionEvent e) {
		try {
			myproxy.Close();
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
	
	/**
	 * ���������¼�
	 */
	void btnStartSMproxy_actionPerformed(ActionEvent e) {
		if (myproxy.myProxy == null) {
			myproxy = new SMProxySend(txtArea);
			myproxy.ProBaseConf();
			AddMsgTextArea("�������ŷ���");
		}
	}
	
	/**
	 * ���ŶϿ��¼�
	 */
	void btnEndSMproxy_actionPerformed(ActionEvent e) {
		myproxy.Close();
		AddMsgTextArea("�رն��ŷ���");
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


//ƴ���¼�
class Frame1_btnAbbreviate_actionAdapter implements java.awt.event.ActionListener {
	ClientFrameApp adaptee;

	Frame1_btnAbbreviate_actionAdapter(ClientFrameApp adaptee) {
		this.adaptee = adaptee;
	}

	public void actionPerformed(ActionEvent e) {
		adaptee.btnAbbreviate_actionPerformed(e);
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

//�����¼�
class Frame1_btnStartSMproxy_actionAdapter implements java.awt.event.ActionListener {
	ClientFrameApp adaptee;

	Frame1_btnStartSMproxy_actionAdapter(ClientFrameApp adaptee) {
		this.adaptee = adaptee;
	}

	public void actionPerformed(ActionEvent e) {
		adaptee.btnStartSMproxy_actionPerformed(e);
	}
}

//�˳��¼�
class Frame1_btnEndSMproxy_actionAdapter implements java.awt.event.ActionListener {
	ClientFrameApp adaptee;

	Frame1_btnEndSMproxy_actionAdapter(ClientFrameApp adaptee) {
		this.adaptee = adaptee;
	}

	public void actionPerformed(ActionEvent e) {
		adaptee.btnEndSMproxy_actionPerformed(e);
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


