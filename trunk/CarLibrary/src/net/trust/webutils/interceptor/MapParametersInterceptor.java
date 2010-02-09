package net.trust.webutils.interceptor;

import java.util.Iterator;
import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionInvocation;
import com.opensymphony.xwork.interceptor.AroundInterceptor;
import com.opensymphony.xwork.interceptor.NoParameters;
import com.opensymphony.xwork.util.InstantiatingNullHandler;
import com.opensymphony.xwork.util.OgnlValueStack;
import com.opensymphony.xwork.util.XWorkConverter;
import com.opensymphony.xwork.util.XWorkMethodAccessor;

/**
 * webwork������
 * ��;�����ҳ������ֵͨ��HashMap�ķ�ʽ������ʱ����
 * 
 **/
public class MapParametersInterceptor extends AroundInterceptor {

    protected void after(ActionInvocation dispatcher, String result) throws Exception {
    }

    protected void before(ActionInvocation invocation) throws Exception {
        if (!(invocation.getAction() instanceof NoParameters)) {
            final Map parameters = ActionContext.getContext().getParameters();

            ActionContext invocationContext = invocation.getInvocationContext();

            try {
                invocationContext.put(InstantiatingNullHandler.CREATE_NULL_OBJECTS, Boolean.TRUE);
                invocationContext.put(XWorkMethodAccessor.DENY_METHOD_EXECUTION, Boolean.TRUE);
                invocationContext.put(XWorkConverter.REPORT_CONVERSION_ERRORS, Boolean.TRUE);

                if (parameters != null) {
                    final OgnlValueStack stack = ActionContext.getContext().getValueStack();

                    for (Iterator iterator = parameters.entrySet().iterator();
                         iterator.hasNext();) {
                        Map.Entry entry = (Map.Entry) iterator.next();
                        String name = entry.getKey().toString();
                        if (acceptableName(name)) {
                        	
                            Object value = entry.getValue();
                          
                            if(value!=null){
                            	Object[] tmp = (Object[])value;
                            	if(tmp.length==1){
                            		value=tmp[0];
                            	}
                            	stack.setValue(name, value);
                            }
                            
                            
                        }
                    }
                }
            } finally {
                invocationContext.put(InstantiatingNullHandler.CREATE_NULL_OBJECTS, Boolean.FALSE);
                invocationContext.put(XWorkMethodAccessor.DENY_METHOD_EXECUTION, Boolean.FALSE);
                invocationContext.put(XWorkConverter.REPORT_CONVERSION_ERRORS, Boolean.FALSE);
            }
        }
    }

    protected boolean acceptableName(String name) {
        if (name.indexOf('=') != -1 || name.indexOf(',') != -1 || name.indexOf('#') != -1) {
            return false;
        } else {
            return true;
        }
    }
}
