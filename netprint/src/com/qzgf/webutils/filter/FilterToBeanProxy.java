package com.qzgf.webutils.filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.beans.factory.BeanFactoryUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class FilterToBeanProxy implements Filter {
	
    private Filter delegate;
    private FilterConfig filterConfig;
    private boolean initialized = false;
    private boolean servletContainerManaged = false;
    /**
     * 
     * */
	public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        
        //������web.xml�������Ƿ���ʱ��ʱ��Ŀ������࣬�ȷ�������ʱ��ʵ��������
        String strategy = filterConfig.getInitParameter("init");
        if ((strategy != null) && strategy.toLowerCase().equals("lazy")) {
            return;
        }
        doInit();
	}
	/**
	 * ��ֵ��������ͨ����web.xml�Ĳ���������ʵ����������web.xml����Ҫ������
	 * targetBean ��spring�����������е�bean����,�� testFilter
	 * lifecycle ��������
	 * targetClass Ŀ������com.jaffa.web.filter.TestFilter
	 * */
	@SuppressWarnings("unchecked")
	public void doInit() throws ServletException{
		initialized = true;
        String targetBean = filterConfig.getInitParameter("targetBean");
        if ("".equals(targetBean)) {
            targetBean = null;
        }

        String lifecycle = filterConfig.getInitParameter("lifecycle");

        if ("servlet-container-managed".equals(lifecycle)) {
            servletContainerManaged = true;
        }

        ApplicationContext ctx = this.getContext(filterConfig);

        String beanName = null;
        //�ж�spring�����������Ƿ����targetBeanʵ��
        if ((targetBean != null) && ctx.containsBean(targetBean)) {
            beanName = targetBean;
        } else if (targetBean != null) {
            throw new ServletException("targetBean '" + targetBean
                + "' not found in context");
        } else {
            String targetClassString = filterConfig.getInitParameter(
                    "targetClass");

            if ((targetClassString == null) || "".equals(targetClassString)) {
                throw new ServletException(
                    "targetClass or targetBean must be specified");
            }

            Class targetClass;

            try {
                targetClass = Thread.currentThread().getContextClassLoader()
                                    .loadClass(targetClassString);
            } catch (ClassNotFoundException ex) {
                throw new ServletException("Class of type " + targetClassString
                    + " not found in classloader");
            }

            Map beans = BeanFactoryUtils.beansOfTypeIncludingAncestors(ctx,
                    targetClass, true, true);

            if (beans.size() == 0) {
                throw new ServletException(
                    "Bean context must contain at least one bean of type "
                    + targetClassString);
            }

            beanName = (String) beans.keySet().iterator().next();
        }

        Object object = ctx.getBean(beanName);

        if (!(object instanceof Filter)) {
            throw new ServletException("Bean '" + beanName
                + "' does not implement javax.servlet.Filter");
        }
        
        delegate = (Filter) object;

        if (servletContainerManaged) {
            delegate.init(filterConfig);
        }

	}
	/**
	 * ��ȡspring����������
	 * */
    protected ApplicationContext getContext(FilterConfig filterConfig) {
        return WebApplicationContextUtils.getRequiredWebApplicationContext(filterConfig
            .getServletContext());
    }
    
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain doChain) throws IOException, ServletException {
		if(!initialized){
			doInit();
		}
		delegate.doFilter(request,response,doChain);
	}

	public void destroy() {
        if ((delegate != null) && servletContainerManaged) {
            delegate.destroy();
        }
	}

		
}
