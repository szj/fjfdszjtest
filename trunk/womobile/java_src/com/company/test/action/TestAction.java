package com.company.test.action;

import javacommon.base.BaseStruts2Action;

import org.jbpm.api.ProcessEngine;


/**
 *  lsr
 * �Զ�ע����������
 */
@SuppressWarnings("serial")
public class TestAction extends BaseStruts2Action
{
	protected static final String QUERY_JSP = "/test/joinJbpm/testJbpm.jsp";
    private ProcessEngine processEngine;

    public ProcessEngine getProcessEngine()
    {
        return processEngine;
    }

    /**
     * �����Ƿ����ϳɹ� ���������
     */
    public String testJbpm()
    {
        System.out.println("��������: "+processEngine);
        return QUERY_JSP;
    }
    
    public void setProcessEngine(ProcessEngine processEngine)
    {
        this.processEngine = processEngine;
    }
}

