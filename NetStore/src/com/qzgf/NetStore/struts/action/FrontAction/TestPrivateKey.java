package com.qzgf.NetStore.struts.action.FrontAction;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

public class TestPrivateKey {

	public void testKye(){
		String MerId="808080092399170";//�̻���
        String OrdId="2008991700000000";//����,��ǰֱ̨�ӹ���
        String TransAmt="000000001234";//���׽��,��һ��Ҫ����̨ȥ������֤һ�鲢��ǰ̨�Ƚ�
        String CuryId="156";
        String TransDate="20081022";//�����ݿ�����������Ľ�������
        String TransType="0001";
        String OrderStatus="1001";//���ѽ��׳ɹ�����  
        
        chinapay.PrivateKey key=new chinapay.PrivateKey();
        chinapay.SecureLink t;
        boolean flag;
        flag=key.buildKey(MerId, 0, "/MerPrk.key");
        if(flag==false){
        	System.out.println("build key error!");
        }
        else{
        	System.out.println("���سɹ�");
        }
        // t=new chinapay.SecureLink(key);
        //����ǩ������
       // String CheckValue=t.signOrder(MerId, OrdId, TransAmt, CuryId, TransDate, TransType);
        //boolean flag1=t.verifyTransResponse(MerId, OrdId, TransAmt, CuryId, TransDate, TransType, TransCode, CheckValue);
	}
	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
	/*	  String pathStr=rqt.getRealPath("/key");
		  
		  
		  
		  String smallName=pathStr+"\\MerPrK.key"; 
		  
			String path = new String(smallName);
			
			
			//boolean flag = (new File(path)).delete();
			//System.out.println(flag);
			
			
		
		File f=new File(path);
		if(f.exists()){
			System.out.println("�ļ�����");
		}
		else{
			System.out.println("�ļ�������");
		}
		*/
		
		
		TestPrivateKey key=new TestPrivateKey();
		key.testKye();
	}

}
