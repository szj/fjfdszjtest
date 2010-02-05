package com.qzgf.context;
/**
 * ��Context�����ʵ������Ϊ��ǰ�̵߳ı������ڵ�ǰ�߳������������ģ����Ի�ȡ��Context����
 * */
public class ContextHolder {
	//����һ���̼߳�����
    @SuppressWarnings("unchecked")
	private static ThreadLocal contextHolder = new ThreadLocal();

    @SuppressWarnings("unchecked")
	public static void setContext(Context context) {
        contextHolder.set(context);
    }

    public static Context getContext() {
        return (Context) contextHolder.get();
    }
}
