/**
 * ˵���������ؼ��Ǽ̳�SMproxy��Ȼ��ſ��Խ��ն��š�
 *       ����onDeliver�¼���
 * ʱ�䣺2008-12-16
 */

package net.trust.utils.sms;

import com.huawei.insa2.util.Args;
import com.huawei.smproxy.SMProxy;
import com.huawei.insa2.comm.cmpp.message.*;
import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;

public class SMProxyRec extends SMProxy {
	private static Log log = LogFactory.getLog(SMProxyRec.class);
    private SMProxySendFacadeImplTimeTask demo; 

    public SMProxyRec(SMProxySendFacadeImplTimeTask demo,Args args) 
    { 
        super(args); 
        this.demo = null; 
        this.demo = demo; 
    } 

    public CMPPMessage onDeliver(CMPPDeliverMessage msg) 
    { 
    	log.debug("����SMProxyRec���ն���");
        demo.ProcessRecvDeliverMsg(msg); 
        return super.onDeliver(msg); 
    } 

    public void OnTerminate() 
    { 
        demo.Terminate(); 
    }
}
