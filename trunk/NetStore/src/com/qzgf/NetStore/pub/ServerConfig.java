package com.qzgf.NetStore.pub;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import org.dom4j.Document;
import org.dom4j.io.SAXReader;
import org.dom4j.tree.DefaultElement;
import com.cownew.ctk.common.ExceptionUtils;
import com.cownew.ctk.constant.StringConst;
import com.cownew.ctk.io.ResourceUtils;

public class ServerConfig {
	private int sessionTimeOut;

	private String[] beanFiles;

	private static ServerConfig instance = null;

	private ServerConfig() {
		super();
	};

	public static ServerConfig getInstance() {
		if (instance == null) {
			instance = new ServerConfig();
			try {
				instance.initConfig();
			} catch (Exception e) {
				ExceptionUtils.toRuntimeException(e);
			}
		}

		return instance;
	}

	protected void initConfig() throws Exception {
		InputStream beansXFStream = null;
		try {
			beansXFStream = getClass().getResourceAsStream(
					"/com/qzgf/NetStore/pub/ServerConfig.xml");
			SAXReader reader = new SAXReader();
			reader.setValidation(false);
			Document doc = reader.read(new InputStreamReader(beansXFStream,
					StringConst.UTF8));
			loadBasic(doc);
			loadBeanFilesDef(doc);

		} finally {
			ResourceUtils.close(beansXFStream);
		}
	}

	// ���ػ���ѡ��
	private void loadBasic(Document doc) {
		String timoutStr = doc.selectSingleNode("//Config/SessionTimeOut")
				.getText().trim();
		sessionTimeOut = Integer.parseInt(timoutStr);
	}

	/**
	 * ����remoting�����ļ�
	 * @param doc 
	 */
	@SuppressWarnings("unchecked")
	private void loadBeanFilesDef(Document doc) {
		List beanList = doc.selectNodes("//Config/BeanFiles/File");
		beanFiles = new String[beanList.size()];
		for (int i = 0, n = beanList.size(); i < n; i++) {
			DefaultElement beanElement = (DefaultElement) beanList.get(i);
			beanFiles[i] = beanElement.getText().trim();
		}
	}
	/**
	 * �õ��Ự��ʱʱ��(����)
	 * 
	 * @return
	 */
	public int getSessionTimeOut() {
		return sessionTimeOut;
	}

	/**
	 * Remoting�����ļ�
	 * 
	 * @return
	 */
	public String[] getBeanFiles() {
		return beanFiles;
	}
}
