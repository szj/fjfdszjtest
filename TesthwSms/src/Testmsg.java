
import com.huawei.smproxy.*;
import com.huawei.insa2.comm.cmpp.message.*;
import com.huawei.insa2.util.*;

public class Testmsg
{
        
        private static Args args = null;
        
        
        public Testmsg()
        {
                tt t = new tt();
                t.start();
        }
        
        public void ProcessRecvDeliverMsg(CMPPDeliverMessage msg) {
        
                if (msg == null) {
                        System.out.println("DeliverMessage is null.");
                        return;
                }
        
                if (msg.getRegisteredDeliver() == 1) {
                        System.out.println("It is a report.");
                        System.out.println("ID:");
                        printByte(msg.getStatusMsgId());
                        System.out.println("CommId: " + msg.getCommandId());
                        System.out.println("DestTerminal: " + msg.getDestnationId().trim());
                        System.out.println("SrcTerminal: " + msg.getSrcterminalId().trim());
                        System.out.println("Stat: " + msg.getStat());
                }else {
                        System.out.println("It is a deliver.");          
                        System.out.println("ID:");
                        printByte(msg.getMsgId());
                        System.out.println("CommId: " + msg.getCommandId());
                        System.out.println("DestTerminal: " + msg.getDestnationId().trim());
                        System.out.println("SrcTerminal: " + msg.getSrcterminalId().trim());
                        try{
                                System.out.println("Content: " + parse(msg.getMsgContent(),msg.getMsgFmt()));
                        }catch(Exception e) {
                                e.printStackTrace();
                        }
                }
        }
        
        private static void printByte(byte[] b) {
                if (b == null) return;
                for (int i = 0; i < b.length; i++) {
                        //System.out.print((int)b);
                        System.out.print(".");
                }
                System.out.println();
        }
        
        private static String parse(byte[] content, int msgFormat) {
                try {
                        switch (msgFormat) {
                        case 0:// ascii
                                return new String((new String(content, "ASCII"))
                                .getBytes("GBK"), "GBK");
                        case 8:
                                return new String((new String(content, "iso-10646-ucs-2"))
                                .getBytes("GBK"), "GBK");
                        case 15:
                                return new String((new String(content, "GBK"))
                                .getBytes("GBK"), "GBK");
                        case 3:
                        case 4:
                        default:
                        return null;
                        }
                } catch (Exception ex) {
                        ex.printStackTrace();
                        return null;
                }
        }
        /**
        * ������ڡ�
        */
        public static void main(String[] a) throws Exception 
        {
        try {
        	Testmsg demo = new Testmsg();
        
        //����MySMProxy���������ISMG�ĵ�¼
        args = new Cfg("config/app.xml",false).getArgs("ismg");      
        //args.set("source-addr",loginName.getText().trim());
        //args.set("shared-secret",loginPass.getText().trim());
        SMProxy myProxy = new SMProxy(demo,args);
        
        
        String[] tel = new String[1];
        tel[0] = "13600000001";
        //���Ͷ���
        CMPPSubmitRepMessage submitRepMsg = myProxy.send(
                1,//int pk_Total,
                1,//int pk_Number,
                1,//int registered_Delivery,
                1,//int msg_Level,
                "mmm",//String service_Id,
                0,//int fee_UserType,
                "13600000000",//String fee_Terminal_Id,
                0,//int tp_Pid,
                0,//int tp_Udhi,
                15,//int msg_Fmt,
                "888888",//String msg_Src,SP_ID
                "01",//String fee_Type,
                "0000",//String fee_Code,
                null,//Date valid_Time,
                null,//Date at_Time,
                "1234567890",//String src_Terminal_Id,
                tel,// dest_Terminal_Id,
                "�����Ķ��Ų���,�ظ���".getBytes(),//byte[]msg_Content,
                "" //String reserve
        );
        // �������Ӵ�����Ӧ��ϢsubmitRepMsg�Ĵ���
        System.out.println("ID:");
        printByte(submitRepMsg.getMsgId());
        System.out.println("Result: " + submitRepMsg.getResult());
        
        //��ѯSMProxy��ISMG��TCP����״̬
        //String stateDesc = myProxy.getConnState();
        
        //�˳�
        // myProxy.close();
        
        }
        catch(Exception e)
        {
                e.printStackTrace();
        }        
        }
        
        class tt extends Thread 
        {
                public void run() {
                        while (true)
                        {
                                try
                                {
                                Thread.sleep(8000000);
                                }
                                catch (Exception e)
                                {
                                }
                        }
                }
        };
} 

 
