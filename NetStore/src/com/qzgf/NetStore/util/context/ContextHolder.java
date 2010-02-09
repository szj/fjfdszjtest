package com.qzgf.NetStore.util.context;
/**
 * ��Context�����ʵ������Ϊ��ǰ�̵߳ı������ڵ�ǰ�߳������������ģ����Ի�ȡ��Context����
 * */
public class ContextHolder {
	//����һ���̼߳�����
    private static ThreadLocal contextHolder = new ThreadLocal();

    public static void setContext(Context context) {
        contextHolder.set(context);
    }

    public static Context getContext() {
        return (Context) contextHolder.get();
    }
}
