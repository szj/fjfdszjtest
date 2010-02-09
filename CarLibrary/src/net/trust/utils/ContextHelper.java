package net.trust.utils;

import org.springframework.context.support.ClassPathXmlApplicationContext;
/**
 * Spring Bean����������ȡ������
 * @author chenqf
 * @date 20080618
 */
public final class ContextHelper {
	private static ClassPathXmlApplicationContext _ctx;

	static {
        _ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
    }

    private ContextHelper() {
    }

    public static ClassPathXmlApplicationContext getContext() {
        return _ctx;
    }
}
