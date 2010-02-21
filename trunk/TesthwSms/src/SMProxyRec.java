

import com.huawei.insa2.util.Args;
import com.huawei.smproxy.SMProxy;
import com.huawei.insa2.comm.cmpp.message.*;

public class SMProxyRec extends SMProxy {
	//private static Log log = LogFactory.getLog(SMProxyRec.class);
    private SMProxySend demo; 

    public SMProxyRec(SMProxySend proxySend,Args args) 
    { 
        super(args); 
        this.demo = null; 
        this.demo = proxySend; 
    } 

    public CMPPMessage onDeliver(CMPPDeliverMessage msg) 
    { 
    	System.out.println("�ҵĿͻ�������SMProxyRec���ն���\r\n");
        demo.ProcessRecvDeliverMsg(msg); 
        return super.onDeliver(msg); 
    }

    public void OnTerminate() 
    { 
        demo.Terminate(); 
    }
}
