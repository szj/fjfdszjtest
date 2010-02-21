
//����������õİ��ļ�
import com.commerceware.cmpp.*;//�����ṩ�������

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

//ʱ�䣺20081205���޸Ķ��Ų�������
public class Cmpp2Api
{
    //���Ͷ�����ز���˵��
    String strIcpId;		//�û���
    String strSvcType;   
    //��������  0x00000022l ���Ϸ��ķ�������
    byte fee_type;
    //01�Ʒ��û�����ѡ�02�����Ʒ���Ϣ�ѡ�03�ԡ��Ʒ��û����롱��������ȡ��Ϣ��
    //04���ԡ��Ʒ��û����롱����Ϣ�ѷⶥ 05���ԡ��Ʒ��û����롱���շ�����SPʵ��
    byte info_fee;
    //info fee 4 integer �ʷѴ���
    //�Է�Ϊ��λ��ֵ��Χ0-999999
    byte proto_id;//Э���
    byte msg_mode; //�����ύ���������Ϣģʽ�������
   // msg_mode����Ϣģʽ:0-����Ҫ״̬���棬 1-��Ҫ״̬���棬2-����������Ϣ
    byte priority;
    //priority 1 integer ���ȼ���
    //ֵ��Χ0-9�����ȼ�9���
    byte validate[];
    //validity period 17 or 1 c-octet string ��Ϣ�����Ч��
    byte schedule[];
    //schedule 17 or 1 c-octet string ��Ϣ��ʱ����ʱ��
    byte fee_utype;
    //�Ʒ��û����ͣ�0��Ŀ���ն˼Ʒѣ�1��Դ�ն˼Ʒѣ�2��sp�Ʒѡ�3����ָ���ļƷ��û��շ�
    String strFeeUser;
    //fee user var.
    //max 21 c-dec string �Ʒ��û�������Ʒ��û�����Ϊ3���򱾲������뱻���ã�����Ʒ��û�����Ϊ����ֵ���˲�����Ч
    String strSrcAddr;
    //���ն����û��ֻ���ʾ�������
    byte du_count;
    byte data_coding;   //����
    String strServerIP;  //������ip
    int iServerPort;    //�������˿ڡ�
    String strIcpAuth;  //����
    byte iLoginType;
    //�û���¼����  smias ϵͳ֧�����ֵ�¼���ͣ�   0--������   1--������  2--�շ���
    byte iVersion;
    //˫��Э�̵İ汾��(��λ4bit��ʾ���汾��,��λ4bit��ʾ�ΰ汾��) i/f version 1 integer �ӿڰ汾
    //��ֵ�ļ��㷽��Ϊ�� ���汾��*16+���汾��  ���磺�汾1.2��ֵΪ0x12
    int iTimestamp;
    //��ֵΪ��1970-01-01 gmtʱ�䵽sp�˴�login��ʱ�������ŵ�����
    Returndata rData;
    static String propFileName = "MsgProp.txt";//�����ļ�·��

    /**
     * ��propFileName�ļ���ȡ������Ϣ
     */
    public void ProConfig()
    {
        strIcpId = "";
        strSvcType = "";
        fee_type = 2;
        info_fee = 8;
        proto_id = 1;
        msg_mode = 0;
        priority = 9;
        validate = new byte[10];
        schedule = new byte[2];
        fee_utype = 2;
        strFeeUser = "";
        strSrcAddr = "";
        du_count = 1;
        data_coding = 15;
        strServerIP = "211.138.155.249";
        iServerPort = 7890;
        strIcpAuth = "fjy4z";
        iLoginType = 2;
        iVersion = 18;
        iTimestamp = 0x3b47fcbd;
        rData = null;
        rData = new Returndata();
        Properties properties = new Properties();//���ĵ����ԡ�
        try
        {
        	properties.load(getClass().getResourceAsStream(propFileName));
            strIcpId= properties.getProperty("ICPID", "913461");
            strSvcType = properties.getProperty("SVCTYPE", "04545");
            fee_type = Byte.parseByte(properties.getProperty("FEETYPE", "2"));
            info_fee = Byte.parseByte(properties.getProperty("INFOFEE", "8"));
            proto_id = Byte.parseByte(properties.getProperty("PROTOID", "1"));
            msg_mode = Byte.parseByte(properties.getProperty("MSGMODE", "0"));
            priority = Byte.parseByte(properties.getProperty("PRIORITY", "9"));
            validate[0] = Byte.parseByte(properties.getProperty("VALIDATE", "0"));
            schedule[0] = Byte.parseByte(properties.getProperty("SCHEDULE", "0"));
            fee_utype = Byte.parseByte(properties.getProperty("FEEUTYPE", "2"));
            strFeeUser = properties.getProperty("FEEUSER", "0591185");
            strSrcAddr = properties.getProperty("SRCADDR", "0591185");
            du_count = Byte.parseByte(properties.getProperty("DUCOUNT", "1"));
            data_coding = Byte.parseByte(properties.getProperty("DATACODING", "15"));
            strServerIP = properties.getProperty("SERVERIP", "211.138.155.249");
            iServerPort = Integer.parseInt(properties.getProperty("SERVERPORT", "7890"));
            strIcpAuth = properties.getProperty("ICPAUTH", "fjy4z");
            iLoginType = Byte.parseByte(properties.getProperty("LOGINTYPE", "2"));
            iVersion = 18;
            iTimestamp = Integer.parseInt(properties.getProperty("TIMESTAMP", "994573501"));
        }
        catch(IOException ioexception)
        {
            System.out.println("\u5F02\u5E38\uFF1A\u8BFB\u53D6\u5177\u4F53\u914D\u7F6E\u6587\u4EF6\u5C5E\u6027\u5931\u8D25\uFF01");
        } 	
    }
    /**
     * ���췽��
     */  
    public Cmpp2Api()
    {
    	ProConfig();
    }
    /**
     * ���Ͷ���
     * ����˵��:
     * @param content:���ŷ�������
     * @param arraylist�ֻ���������(��Ⱥ��)
     * @return ����ֵ���ͣ���װ�˷���ֵ��ֵ�������Ϣ��
     */
    public Returndata SendMessage(String content, ArrayList arraylist)
    {
        String s1 = content;
        int i = 0;
        rData.initData();//��ʼ������������Ϣ
        CMPP cmpp = new CMPP();
//      byte abyte0[] = new byte[150];
//      byte abyte2[] = new byte[40];
//      byte abyte3[] = new byte[10];
        int k = 0;
        cmppe_submit cmppe_submit1 = new cmppe_submit();                        //�ύ
//      cmppe_submit_result cmppe_submit_result1 = new cmppe_submit_result();   //��ѯ
//      cmppe_cancel cmppe_cancel1 = new cmppe_cancel();     					//ȡ��
        
        //�ڴ洢�û���
        byte abyte4[] = new byte[10];
        for(int l = 0; l < strIcpId.length(); l++)
            abyte4[l] = toHex(strIcpId.charAt(l));                              //���û���ת��Ϊhex�洢��
        abyte4[strIcpId.length()] = 0;
        
        //�������
        byte abyte5[] = new byte[6];											//svcType���뱣��
        for(int i1 = 0; i1 < strSvcType.length(); i1++)
            abyte5[i1] = toHex(strSvcType.charAt(i1));
        abyte5[strSvcType.length()] = 0;
        
        //���Ž����
        byte abyte6[] = new byte[20];											
        for(int j1 = 0; j1 < strFeeUser.length(); j1++)
            abyte6[j1] = toHex(strFeeUser.charAt(j1));
        abyte6[strFeeUser.length()] = 0;
        //Դ��ַ
        byte abyte7[] = new byte[12];
        for(int k1 = 0; k1 < strSrcAddr.length(); k1++)
            abyte7[k1] = toHex(strSrcAddr.charAt(k1));							//srcaddrԴַ��
        abyte7[strSrcAddr.length()] = 0;
        
        //�ֻ����룬�洢�ڶ�ά����
        int l1 = arraylist.size();
        //String s2 = "";
        byte abyte8[][] = new byte[l1 + 1][20];
        for(int i2 = 0; i2 < l1; i2++)
        {
            String s3 = (String)arraylist.get(i2);
            int j2 = Integer.parseInt(s3.substring(0, 3));
            //��ȡ�ֻ��ŵ�ǰ��λ,��������11λ��ͬʱǰ3λ��135~139֮��
            if(s3.length() == 11 && j2 >= 135 && j2 <= 139)
            {
                for(int k2 = 0; k2 < s3.length(); k2++)
                    abyte8[i2][k2] = toHex(s3.charAt(k2));//���ֻ���ÿһλת��Ϊ16�ơ�

                abyte8[i2][s3.length()] = 0;//ͬʱ��0Ϊ�ַ�����Ľ�β��
                k++;
            }
        }

        du_count = (byte)k;//�ֻ�����Ŀ
        byte byte0 = 70;//��������ַ���
        //���ֻ��������ݽ��д���
        while(s1.length() > 0) 
        {
            i++;
            byte abyte1[];
            try
            {
            	//��������˵��content�洢��ǰ�÷��͵���Ϣ����s1�Ǵ���70λ���ַ���
            	content = s1;
                if(content.length() > byte0)
                {
                	content = content.substring(0, byte0);
                    s1 = s1.substring(byte0);
                } else
                {
                    s1 = "";
                }
                abyte1 = content.getBytes("GB2312");
                content = new String(abyte1);
            }
            catch(Exception exception)
            {
                System.out.println("strMsg\u8F6C\u6362\u683C\u5F0F\u5931\u8D25\uFF01" + content);
                rData.setReturnData(-1, "strMsg\u8F6C\u6362\u683C\u5F0F\u5931\u8D25\uFF01" + content);
                return rData;
            }
            int l2 = abyte1.length;
//            cmppe_result cmppe_result1 = new cmppe_result();
//            cmppe_deliver_result cmppe_deliver_result1 = new cmppe_deliver_result();
            try
            {
            	//�������ӣ����Ͷ���
                conn_desc conn_desc1 = new conn_desc();
                cmpp.cmpp_connect_to_ismg(strServerIP, iServerPort, conn_desc1);
                System.out.println("Connected ISMG");
                
                //���Դ���
                //cmpp.cmpp_login(conn_desc1, "444504", "888888", 2, 18, 20081203);
                //���¼����ʴ�(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())
//              Calendar time=Calendar.getInstance();
//              int second=time.get(Calendar.SECOND);
//              int minute=time.get(Calendar.MINUTE);
//              int hour=time.get(Calendar.HOUR_OF_DAY);
//              int day =time.get(Calendar.DAY_OF_MONTH);
//              int month=time.get(Calendar.MONTH)+1;
                
                //System.out.println((new SimpleDateFormat("MMddHHmmss")).format(new Date()));
                //System.out.println(Integer.getInteger((new SimpleDateFormat("MMddHHmmss")).format(new Date())));
                //iTimestamp=Integer.getInteger((new SimpleDateFormat("MMddHHmmss")).format(new Date()));
                String temp=(new SimpleDateFormat("MMddHHmmss")).format(new Date()).toString();
                iTimestamp=Integer.valueOf(temp);
                //iTimestamp=((new Date()).getTimezoneOffset());
                //iTimestamp=((new Date()).getDate());
                
                
                cmpp.cmpp_login(conn_desc1, strIcpId, strIcpAuth, iLoginType, iVersion, iTimestamp);//��������
                readPa(conn_desc1);																	//Ӧ����Ϣ
                //���÷��ͻ�����Ϣ
                cmppe_submit1.set_icpid(abyte4);
                cmppe_submit1.set_svctype(abyte5);
                cmppe_submit1.set_feetype(fee_type);
                cmppe_submit1.set_infofee(info_fee);
                cmppe_submit1.set_protoid(proto_id);
                cmppe_submit1.set_msgmode(msg_mode);
                cmppe_submit1.set_priority(priority);
                cmppe_submit1.set_validate(validate);
                cmppe_submit1.set_schedule(schedule);
                cmppe_submit1.set_feeutype(fee_utype);
                cmppe_submit1.set_feeuser(abyte6);
                cmppe_submit1.set_srcaddr(abyte7);
                cmppe_submit1.set_dstaddr(abyte8);
                cmppe_submit1.set_ducount(du_count);
                cmppe_submit1.set_msg(data_coding, l2, abyte1);
                
                
                //�ύ������Ϣ
                int j = cmpp.cmpp_submit(conn_desc1, cmppe_submit1);
                System.out.println("\u53D1\u9001\u77ED\u4FE1 SM Seq = " + j);
                readPa(conn_desc1);									//��ȡ��Ϣ
                // msg_mode����Ϣģʽ:0-����Ҫ״̬���棬 1-��Ҫ״̬���棬2-����������Ϣ
                if(msg_mode == 1)
                    readPa(conn_desc1);
                
                
                
                //�Ͽ�������Ϣ
                cmpp.cmpp_logout(conn_desc1);
                readPa(conn_desc1);
                
                //cmpp.cmpp_disconnect_from_ismg(conn_desc1);
               
            }
            catch(Exception exception1)
            {
                System.out.println(exception1.getMessage());
                rData.setReturnData(-2, exception1.getMessage());
                exception1.printStackTrace();
                System.out.println("have a exception");
                try
                {
                    System.in.read();
                }
                catch(Exception exception2) { }
                return rData;
            }
        }
        if(rData.iReturnCode == 0)
            rData.iReturnCode = i;
        return rData;
    }
   
    //�������ݿ�
    public Returndata SendMsg(String content,ArrayList mobileList)
    {
    	rData = SendMessage(content, mobileList); //���Ͷ��š�
    	
        return rData;
    }
    //�������ݿ�
    public Returndata RecMsg(String content,ArrayList mobileList)
    {
    	rData = SendMessage(content, mobileList); //���Ͷ��š�
    	
        return rData;
    }
    /**
     * ��ͨ���ŷ��ʹ���
     * @param s
     * @param s1
     * @param i
     * @param s2
     * @param j
     * @param k
     * @param s3
     * @param l
     * @return
     */
    public Returndata SendYwMsg(String content, String mobilearrary, int i, String s2, int j, int k, String s3, 
            int l)
    {
    	
        ArrayList arraylist = new ArrayList();			//�洢�ֻ�����
        CutStrings cutstrings = new CutStrings();       //�ָ�������
        cutstrings.initData(mobilearrary, ",");					 //����˵���Էָ���","���ַ���s1���зָ���
        String as[] = cutstrings.getMembers();           //�õ��ָ��������
        int i1 = cutstrings.getCountToken();
        int k1 = 0;
        for(int l1 = 0; l1 < i1; l1++)
        {
            String s4 = as[l1];
            int i2 = Integer.parseInt(s4.substring(0, 3));
            if(s4.length() == 11 && i2 >= 135 && i2 <= 139)
            {
                arraylist.add(as[l1]);
                k1++;
            }
        }

        rData = SendMessage(content, arraylist);
        //�����ݿ���в���
//        if(rData.iReturnCode > 0)
//        {
//            int j1 = k1 * rData.iReturnCode;
//            Dboperation dboperation = new Dboperation();
//            String s5 = "insert into dxfsb(DXXLH,DXNR,JSDXHM,FSMK,FSR,FSSJ,SFYQHF,ZDZFHF,ZDZFJSHM,DXFSSL,FSFS) values(YWPHONEMSGBH.nextval,'" + s + "','" + s1 + "'," + Integer.toString(i) + ",'" + s2 + "',sysdate," + Integer.toString(j) + "," + Integer.toString(k) + ",'" + s3 + "'," + j1 + "," + l + ")";
//            rData = dboperation.executeUpdate(s5);
//        }
        return rData;
    }


     /**
      * �޸�����
      * 
      */
    public int ModifyPass(String s)
        throws IOException
    {
        int i = 0;
        Properties properties = new Properties();
        try
        {
        	properties.load(getClass().getResourceAsStream(propFileName));
            properties.setProperty("ICPAUTH", s);
        }
        catch(FileNotFoundException filenotfoundexception)
        {
            i = -1;
            System.out.println("\u5F02\u5E38\uFF1AModifyPass\u5931\u8D25\uFF01");
        }
        return i;
    }
    
    /**
     * ���ն�����Ϣ
     */
    public void ReceMsg() {
		// �������ӣ����Ͷ���
		CMPP cmpp = new CMPP();
		conn_desc conn_desc1 = new conn_desc();
		try {
			cmpp.cmpp_connect_to_ismg(strServerIP, iServerPort, conn_desc1);
			
            //���¼����ʴ�
            String temp=(new SimpleDateFormat("MMddHHmmss")).format(new Date()).toString();
            iTimestamp=Integer.valueOf(temp);
            cmpp.cmpp_login(conn_desc1, strIcpId, strIcpAuth, iLoginType, iVersion, iTimestamp);//��������
            readPa(conn_desc1);	

			while (true) {
				Object obj = null;
				try {
					cmppe_result cmppe_result1 = cmpp.readResPack(conn_desc1);// ��ȡ����Ϣ��
					switch (cmppe_result1.pack_id) {
					case 5: // '\005'
						System.out.println("------------deliver---------: STAT = 0");
						cmppe_deliver_result cmppe_deliver_result1 = (cmppe_deliver_result) cmppe_result1;
						if (cmppe_deliver_result1.status_rpt == 1)
							System.out.println("Rpt status = "
									+ cmppe_deliver_result1.status_from_rpt);
						cmpp.cmpp_send_deliver_resp(conn_desc1,
								cmppe_deliver_result1.seq,
								((cmppe_result) (cmppe_deliver_result1)).stat);
						break;
					default:
						System.out.println("---------Error packet-----------");
						break;
					}
				} catch (UnknownPackException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (DeliverFailException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (OutOfBoundsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Connected ISMG");
	}
 
    /**
	 * ��ȡ��Ϣ,Ӧ����Ϣ
	 * 
	 * @param conn_desc1
	 *            ����õ�������
	 */
    public void readPa(conn_desc conn_desc1)
    {
        CMPP cmpp = new CMPP();//cmpp2api�ӿڡ�
        Object obj = null;
        try
        {
            cmppe_result cmppe_result1 = cmpp.readResPack(conn_desc1);//��ȡ����Ϣ��
            switch(cmppe_result1.pack_id)
            {
            case -2147483648: 
                System.out.println("get nack pack");
                break;
            //��¼Ӧ��
            case -2147483647: 
                cmppe_login_result cmppe_login_result1 = (cmppe_login_result)cmppe_result1;
                System.out.println("------------login resp----------: STAT = " + ((cmppe_result) (cmppe_login_result1)).stat);
                break;

            case -2147483646: 
                System.out.println("------------logout resp----------: STAT = " + cmppe_result1.stat);
                break;
                //�ύӦ��
            case -2147483644: 
                cmppe_submit_result cmppe_submit_result1 = (cmppe_submit_result)cmppe_result1;
                System.out.println("------------submit resp----------: STAT = " + ((cmppe_result) (cmppe_submit_result1)).stat + " SEQ = " + cmppe_submit_result1.seq);
                break;
                //�ַ�Ӧ��
            case 5: // '\005'
                System.out.println("------------deliver---------: STAT = 0");
                cmppe_deliver_result cmppe_deliver_result1 = (cmppe_deliver_result)cmppe_result1;
                if(cmppe_deliver_result1.status_rpt == 1)
                    System.out.println("Rpt status = " + cmppe_deliver_result1.status_from_rpt);
                cmpp.cmpp_send_deliver_resp(conn_desc1, cmppe_deliver_result1.seq, ((cmppe_result) (cmppe_deliver_result1)).stat);
                break;
                //ȡ��Ӧ��
            case -2147483641: 
                System.out.println("---------cancel-----------: STAT = " + cmppe_result1.stat);
                break;
                //����Ӧ��
            case -2147483640: 
                System.out.println("---------active resp-----------: STAT " + cmppe_result1.stat);
                break;

            default:
                System.out.println("---------Error packet-----------");
                break;
            }
        }
        catch(Exception exception)
        {
            System.out.println(exception.getMessage());
            exception.printStackTrace();
            System.out.println("have a exception");
        }
    }

    /**
     * �ַ�ת��Ϊ��ASCII�룺�����ַ���Ӧ��ASCII��
     * @param c
     * @return
     */
    public static byte toHex(char c)
    {
        switch(c)
        {
        case 49: // '1'
            return 49;

        case 50: // '2'
            return 50;

        case 51: // '3'
            return 51;

        case 52: // '4'
            return 52;

        case 53: // '5'
            return 53;

        case 54: // '6'
            return 54;

        case 55: // '7'
            return 55;

        case 56: // '8'
            return 56;

        case 57: // '9'
            return 57;

        case 48: // '0'
            return 48;
        }
        return 0;
    }
    
    //���Է���
    public static void main(String[] args){
    	Cmpp2Api api=new Cmpp2Api();
    	ArrayList arraylist = new ArrayList();
    	arraylist.add("13599204724");
    	api.SendMessage("HelloWorld!", arraylist);
    	
//    	while(true)
//    	{
//    		api.ReceMsg();
//    		String sm="";
//    	}
    }
}
