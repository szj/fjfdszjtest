package likeqq;
/*С�� QQ:3312883*/
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.net.*;
import java.io.*;

//class Customer extends Object implements java.io.Serializable
//{
//     String custName;
//     String custPassword;
//}
public class CustomerApplet extends JApplet 
{
	//���� ��� ��ǩ ��ť....
	JPanel panelObject;
	JLabel labelCustName; 
	JLabel labelCustPassword;
	JTextField textCustName;  
	JPasswordField textCustPassword;
    JButton buttonLogin;
	GridBagLayout gl;
	GridBagConstraints gbc;

	public void init()//�������
	{
		//��ʼ�� ���� ����
		gl = new GridBagLayout();//��ʼ�����Ӳ��� gl
		gbc = new GridBagConstraints();//��ʼ������Լ��
		panelObject = (JPanel)getContentPane();//���������
		panelObject.setLayout(gl);//�������������һ�����Ӳ��� gl
            
            //��ʼ�� �ؼ�
		labelCustName = new JLabel("Customer Login Name");
		labelCustPassword = new JLabel("Password");
		textCustName = new JTextField(15);
            textCustPassword = new JPasswordField(15);
            buttonLogin=new JButton("Login");
		
		//��ӿؼ��������
		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx = 1;
		gbc.gridy = 5;
		gl.setConstraints(labelCustName,gbc);
		panelObject.add(labelCustName);
	
		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx = 4;
		gbc.gridy = 5;
		gl.setConstraints(textCustName,gbc);
		panelObject.add(textCustName);

		gbc.anchor = GridBagConstraints.NORTHWEST;	
		gbc.gridx = 1;
		gbc.gridy = 9;
		gl.setConstraints(labelCustPassword,gbc);
		panelObject.add(labelCustPassword);

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx = 4;
		gbc.gridy = 9;
		gl.setConstraints(textCustPassword,gbc);
		panelObject.add(textCustPassword);

            gbc.anchor=GridBagConstraints.NORTHWEST;
            gbc.gridx=2;
            gbc.gridy=13;
            gl.setConstraints(buttonLogin,gbc);//���Ӳ���gl����Լ�� ��buttonLogin����Լ��
            panelObject.add(buttonLogin);
            
            LoginAction loginrequest=new LoginAction();//��ʼ��һ����½��ť������ Ϊloginrequest
            buttonLogin.addActionListener(loginrequest);//����½��ť(buttonLogin)����"��½��ť������" �������¼�����
	}
    class LoginAction implements ActionListener//��½��ť������
    {
       public void actionPerformed(ActionEvent evt)//�������¼������￪ʼ
       {
            Object obj=evt.getSource();//ȡ���¼�����
            if(obj==buttonLogin)//�ж��¼�����
            {
            	
               Customer data=new Customer();//��ʼ��һ��Customer��
	   	       data.custName = textCustName.getText();//ȡJTextField������Ҳ�����û��� ��ֵ��data.custName��
		       data.custPassword =new String(textCustPassword.getPassword());//����ͬ�� �����ȡ������ ��ֵ��data.custPassword
		   try//�����쳣
		   {
			Socket toServer;//����һ���׽����������ӷ�����
  			toServer = new Socket("127.0.0.1",1001);//��ʼ��toServer ��ʼ���ӷ�����
			ObjectOutputStream streamToServer=new ObjectOutputStream (toServer.getOutputStream());//��ʼ��һ�����������ȡ��������IP Ȼ���	IP����һ�� �ų�ʼ���������streamToServer ������������ ���������������				
			streamToServer.writeObject((Customer)data);//�������ݵ�������(SP  "(Customer)data"��Ҳ�Ǹ�����ת�� ��dataת����Customer����)
			
                  //������ξ��Ǽ����� 
                  BufferedReader fromServer=new BufferedReader(new InputStreamReader(toServer.getInputStream()));//��俴����ô����ʵ�ܼ� ���ǰѷ��������ص����� �ŵ�fromServer��
                  String status=fromServer.readLine();//Ȼ�����fromServer������� ��һ���ַ�����status
                  getAppletContext().showStatus(status);//�ڰ�status��ʾ�� Applet��
	            	streamToServer.close();//�ر������
                  fromServer.close();//�ر�BufferedReader //��������� �����������ֹ�� 
                  
		 
               }
		   catch(InvalidClassException e)
		   {
			showStatus("The Customer class is invalid" + e);
		   }
		   catch(NotSerializableException e)
		   {
			showStatus("The object is not serializable" + e);
		   }
		   catch(IOException e)
		   {
			//showStatus("Cannot write to the server" + e);
			showStatus("���ӷ�����ʧ�ܣ�");
		   }	
	      }
       }
    }
}
