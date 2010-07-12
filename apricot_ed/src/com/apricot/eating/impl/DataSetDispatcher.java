/**
 * 
 */
package com.apricot.eating.impl;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.apricot.eating.DefaultContext;
import com.apricot.eating.NestedException;
import com.apricot.eating.engine.Controller;
import com.apricot.eating.engine.DyncParameterMap;
import com.apricot.eating.engine.PlugIn;
import com.apricot.eating.engine.PlugInConfig;
import com.apricot.eating.engine.RequestConfig;
import com.apricot.eating.engine.ResponseBASE64File;
import com.apricot.eating.engine.ResponseData;
import com.apricot.eating.engine.multipart.MultipartStream;
import com.apricot.eating.engine.req.XMLRequestReader;
import com.apricot.eating.io.StreamWriter;
import com.apricot.eating.log.Log;
import com.apricot.eating.xml.XMLParser;

/**
 * @author Administrator
 */
public class DataSetDispatcher {
	public static final String PLUGIN_KEY = "com.apricot.eating.DefaultServlet.PLUGIN_KEY";
	public static final String STATIC_DEFINE_KEY = "com.apricot.eating.DefaultServlet.STATIC_DEFINE_KEY";
	private ServletContext context;
	private HttpServletRequest req;
	private HttpServletResponse resp;
	private DyncParameterMap dyncMap;
	private RequestConfig request;

	/**
	 * 
	 */
	public DataSetDispatcher() {
		// TODO Auto-generated constructor stub
	}

	private void extract() {
		String contextType = (req.getContentType() == null) ? "" : req
				.getContentType();
		if (contextType.toLowerCase().startsWith("text/xml")) {// ͨ��XML�ļ���ʽ��������

			try {
				//System.out.println(req.getParameter("_dc"));
				/**
				XMLParser xml = XMLParser.parser(req.getInputStream());
				NodeList list = xml.getRootElement().getChildNodes();
				for (int i = 0; i < list.getLength(); i++) {
					Node n = list.item(i);
					if (n.getNodeType() != Node.ELEMENT_NODE)
						continue;// ���ǽڵ�Ԫ��
					dyncMap.add(n.getNodeName(), xml.getNodeCDATA(n));
				}**/
				dyncMap.putAll(new XMLRequestReader(req.getInputStream()).read());
			} catch (Exception e) {
				Log.error("�����ͻ����������ݳ���", e, this);
			}

			return;
		}
		

		// ͨ������������
		if (contextType.toLowerCase().startsWith("multipart/form-data")) {
			MultipartStream stream = new MultipartStream();

			try {
				stream.upload(req.getInputStream());
				dyncMap.putAll(stream.getParameterMap());
			} catch (Exception e) {
				Log.error("�����ͻ����������ݳ���", e, this);

			}
		}

		dyncMap.putAll(req.getParameterMap());
	}

	protected HashMap getJsonDataStruct(String code, String message) {
		HashMap map = new HashMap();
		HashMap data = new HashMap();
		map.put("success", "true");
		map.put("data", data);
		data.put("errorCode", code);
		data.put("errorMessage", (message == null) ? "" : message);
		return map;
	}

	/**
	 * ��ȡ����·����
	 * 
	 * @param req
	 * @return
	 */
	private String getRequestPath(HttpServletRequest req) {
		return req.getRequestURI().replaceFirst(req.getContextPath(), "");
	}

	protected RequestConfig getRequestConfig(ServletContext context,
			HttpServletRequest req, DyncParameterMap dyncMap) {
		HashMap map = (HashMap) context
				.getAttribute(DataSetDispatcher.STATIC_DEFINE_KEY);
		String path = getRequestPath(req);
		Log.debug(path, this);
		return (RequestConfig) map.get(path);
	}

	private void initPlugIn() {
		for (Iterator objs = request.plugins(); objs.hasNext();) {
			PlugInConfig p = (PlugInConfig) objs.next();
	
			if (!p.isInit())
				continue;
			try {
				PlugIn plugin = (PlugIn) Class.forName(p.getClassName())
						.newInstance();
				if (plugin != null)
					plugin.init(context, req, resp, dyncMap);
			} catch (Exception e) {
			}
		}
	}

	private void invokePlugIn(Object o) {
		if (o == null)
			return;
		for (Iterator objs = request.plugins(); objs.hasNext();) {
			PlugInConfig p = (PlugInConfig) objs.next();
			if (!p.isInvoke())
				continue;
			try {
				PlugIn plugin = (PlugIn) Class.forName(p.getClassName())
						.newInstance();
				if (plugin != null)
					plugin.invoke(context, req, resp, o);
			} catch (Exception e) {
			}
		}
	}

	public void service(ServletContext a, HttpServletRequest b,
			HttpServletResponse c) throws ServletException, IOException {
		Object obj = null;
		// ���ò�������г�ʼ������
		this.context = a;
		this.req = b;
		this.resp = c;

		this.dyncMap = new DyncParameterMap();
		this.request = getRequestConfig(a, b, dyncMap);
		List list = this.request.getPlugIns();
		
//		System.out.println(a+"--"+(this.request).getClassName()+"--"+list.size());

		// ���ÿ���������������ݴ���
		try {
			if (request == null) {
				throw new NestedException("SYS-0001", new String[] { request
						.getPath() });
			}
			// Process default plug in
			// System.out.println( plugs);
			// Process config plug in
			initPlugIn();
			// ��ȡ���ݣ��������������а����˲����������ݣ�������������ݸ��ǲ��
			extract();
			// ��ȡ��̬����
			dyncMap.setGlobalStaticDataMap((HashMap) context
					.getAttribute(DefaultContext.STATIC_DATA_KEY));

			obj = new Controller(request).service(dyncMap);
			// ִ�в��
			invokePlugIn(obj);
			// �������
			if (obj == null)
				obj = getJsonDataStruct("00", null);
			else if (obj instanceof String) {
				obj = getJsonDataStruct("01", (String) obj);
			} else if (obj instanceof ResponseData) {
				ResponseData rd = (ResponseData) obj;
				obj = getJsonDataStruct(rd.getErrorCode(), rd.getErrorMessage());
			}
			// ִ�в��execute����

		} catch (NestedException e) {

			obj = getJsonDataStruct(e.getCode(), e.getMessage());
			Log.error("DefaultServlet.service error", e, this);
		}
		// ����XML�ļ�����������������ɵĽ���γ�XML�����ļ�
		StreamWriter writer = null;
		try {
			if (!(obj instanceof ResponseBASE64File)) {// �����ļ�
				
				resp.setContentType("text/html;charset="
						+ DefaultContext.getContext().getSystemCharset());
				writer = new StreamWriter(resp.getOutputStream(),
						DefaultContext.getContext().getSystemCharset());
				writer.write(obj);
				return;
			} else {//64λ�����ļ�
				ResponseBASE64File rf = (ResponseBASE64File) obj;
				resp.setContentType(rf.getContentType());

				OutputStream out = null;
				byte[] buff = rf.getContent(a.getRealPath(rf.pathName));
				//new FileOutputStream("e:/1.gif").write(buff);
				if (!(buff == null)) {
					try {
						out = resp.getOutputStream();
						out.write(buff);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				buff = null;

				try {
					if (out != null)
						out.close();
				} catch (Exception e) {
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			Log.error("StreamWriter.write error", e, this);
		} finally {
			try {
				if (writer != null)
					writer.close();
			} catch (Exception e) {
			}
		}
	}
}
