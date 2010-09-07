package server;
import java.net.*;
import java.io.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class SocketServer extends JFrame implements Runnable {
  JPanel contentPane;
  JScrollPane jScrollPane1 = new JScrollPane();
  JTextArea jTextArea1 = new JTextArea();
  JLabel jLabel1 = new JLabel();
  JTextField jTextField1 = new JTextField();
  JButton jButton1 = new JButton();
  JButton jButton2 = new JButton();

  Socket socket;
  ServerSocket serversocket;
  BufferedReader bufferedReader;//�͑�����Ϣ���_�^
  PrintWriter printWriter;//����������Ϣ���_�^

  private class GetInfo implements Runnable{
     //���xһ���Ȳ��������Ϣ
     public void run()
     {
     String str;
     try{
      str=bufferedReader.readLine();//��bufferedreader�x��һ��
      while(str!="exit!")
  {
     jTextArea1.append("�͑�����Ϣ��"+str+"\n");
     str=bufferedReader.readLine();//�^�m�x��͑�����Ϣ
  }
   bufferedReader.close();//�P�]���_�^
   printWriter.close();//
   socket.close();//�P�]socket
   serversocket.close();//�P�]serversocket
    }catch(Exception e){jTextArea1.append(e.toString()+"\n");}
     }
    }


  //Construct the frame
  public SocketServer() {
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }
  //Component initialization
  private void jbInit() throws Exception  {
    contentPane = (JPanel) this.getContentPane();
    contentPane.setLayout(null);
    this.setSize(new Dimension(400, 300));
    this.setTitle("������");
    jScrollPane1.setBounds(new Rectangle(10, 3, 379, 118));
    jLabel1.setText("�l����Ϣ");
    jLabel1.setBounds(new Rectangle(9, 143, 51, 21));
    jTextArea1.setText("");
    jTextField1.setText("");
    jTextField1.setBounds(new Rectangle(65, 139, 320, 34));
    jTextField1.addKeyListener(new SocketServer_jTextField1_keyAdapter(this));
    jButton1.setBounds(new Rectangle(8, 185, 118, 33));
    jButton1.setEnabled(false);
    jButton1.setText("�l��");
    jButton1.addActionListener(new SocketServer_jButton1_actionAdapter(this));
    jButton2.setBounds(new Rectangle(151, 187, 118, 32));
    jButton2.setText("�˳�");
    jButton2.addActionListener(new SocketServer_jButton2_actionAdapter(this));
    contentPane.add(jScrollPane1, null);
    contentPane.add(jLabel1, null);
    contentPane.add(jTextField1, null);
    contentPane.add(jButton1, null);
    contentPane.add(jButton2, null);
    jScrollPane1.getViewport().add(jTextArea1, null);
 //Thread t=new Thread(frame);

  }
  //Overridden so we can exit when window is closed
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
      System.exit(0);
    }
  }
  public void run() {
    /**@todo Implement this java.lang.Runnable method*/
   // throw new java.lang.UnsupportedOperationException("Method run() not yet implemented.");
   try
    {

     //�����˿�̖��1000�ķ������Ķ˿�
     serversocket=new ServerSocket(4331);
     socket=serversocket.accept();//���տ͑���
     bufferedReader=new BufferedReader(new InputStreamReader(socket.getInputStream()));// �������_�^
     printWriter=new PrintWriter(socket.getOutputStream());
     if(socket!=null)
     {
      jTextArea1.append("�͑����B�ӣ�\n");
      jButton1.setEnabled(true);
     }
     GetInfo getinfo=new GetInfo();
     Thread t=new Thread(getinfo);//�������տ͑�����Ϣ�ľ���
     t.start();
    }catch(Exception e){jTextArea1.append(e.toString()+"\n");}
 }

  void jButton1_actionPerformed(ActionEvent e) {
    printWriter.println(jTextField1.getText());
       //�x��jtextfield1�е��ı�
       printWriter.flush();
       //��jTextField1�е��ı���Ϣ�@ʾ��jTextArea1��
       jTextArea1.append("����������Ϣ��"+jTextField1.getText()+"\n");
       jTextField1.setText("");

  }

  void jButton2_actionPerformed(ActionEvent e) {
//�˳�
    try{
     jTextArea1.append("�������˳���\n");
     printWriter.println("exit!");
     printWriter.flush();
    }catch(Exception err){jTextArea1.append(err.toString()+"\n");}
finally{System.exit(0);}

  }

  void jTextField1_keyPressed(KeyEvent e) {
    if(e.getKeyChar()==KeyEvent.VK_ENTER)
        {
        try{
        jTextArea1.append("�������˳���\n");
        printWriter.println("exit!");
        printWriter.flush();
        }catch(Exception err){jTextArea1.append(e.toString()+"\n");}

    finally{System.exit(0);}
        }

  }
}

class SocketServer_jButton1_actionAdapter implements java.awt.event.ActionListener {
  SocketServer adaptee;

  SocketServer_jButton1_actionAdapter(SocketServer adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jButton1_actionPerformed(e);
  }
}

class SocketServer_jButton2_actionAdapter implements java.awt.event.ActionListener {
  SocketServer adaptee;

  SocketServer_jButton2_actionAdapter(SocketServer adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jButton2_actionPerformed(e);
  }
}

class SocketServer_jTextField1_keyAdapter extends java.awt.event.KeyAdapter {
  SocketServer adaptee;

  SocketServer_jTextField1_keyAdapter(SocketServer adaptee) {
    this.adaptee = adaptee;
  }
  public void keyPressed(KeyEvent e) {
    adaptee.jTextField1_keyPressed(e);
  }
}