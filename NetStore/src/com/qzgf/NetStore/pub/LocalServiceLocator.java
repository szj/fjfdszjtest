package com.qzgf.NetStore.pub;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LocalServiceLocator {

	private static LocalServiceLocator instance;

	private LocalServiceLocator() {
		super();
	};

	private static BeanFactory appContext = null;

	public static LocalServiceLocator getInstance() {
		if (instance == null) {
			instance = new LocalServiceLocator();

		}

		return instance;
	}

	@SuppressWarnings("unchecked")
	public Object getService(Class serviceIntfClass) {
		System.out.println("��ȡ�����ļ�������,����getService---------------");
		String serviceId = serviceIntfClass.getName();
		System.out.println("=======serviceId:" + serviceId);
		Object bean = appContext.getBean(serviceId);
        System.out.println("ServiceId:["+serviceId+"].bean:"+bean);
	
        System.out.println("�˳�:"+bean+"����־,Ȩ��,�������");
		return bean;
	}

	static {
		try {
			System.out.println("��ʼ��ȡ������Ϣ");
			appContext = new ClassPathXmlApplicationContext(ServerConfig
					.getInstance().getBeanFiles());
			System.out.println("��ȡ������Ϣ���");
		} catch (Exception e) {
			System.out.println("ClassPathXmlApplicationContext�������Ϣ��"
					+ e.getMessage());
		}
	}

}
