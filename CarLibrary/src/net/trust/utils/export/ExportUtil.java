package net.trust.utils.export;

/**
 *@author chenf
 *@date 2005��11��16��
 *@docRoot
 *    ��������
 * */


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import net.trust.utils.StatementIface;

import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class ExportUtil {
	private Log log = LogFactory.getLog(ExportUtil.class);
	//StatementIfaceһ������ִ��sql�Ķ���
	private StatementIface statementmanager = null;
	
	
	public ExportUtil(StatementIface statementmanager) {
		this.statementmanager = statementmanager;
	}

	/**
	 * @author chenf
	 * @date 2005-11-18
	 * @docRoot
	 *  ����sql�Ͷ�Ӧ�������������͡������ֶΡ�����������Ӧ���ļ�
	 * @param out �ͻ��˽����������
	 * @param sql 
	 * @param para sql����Ҫ�Ĳ��������û�в�����Ϊnull
	 * @param type �������� ���뵼���ļ�����չ����������excelΪxls,xmlΪxml��
	 * @param sheetName �ļ�����
	 * @param fields �������sql����ѯ�������ֶ����ĳЩ�ֶζ�Ӧ
	 * @param colName ��Ӧ����������
	 */
	public void export(PrintWriter out, String sql, Object[] para, String type, String sheetName, String[] fields, String[] colName) {
		//���ִ��sql��ʵ����
		
			//(StatementIface) CustomBeanFactory
			//	.getBean("statementManager");
		try {
			//�����Ҫ�����ļ�¼��
			ResultSet rs = statementmanager.executeSql(sql, para);
			//���ݵ���������ʵ����������
			ExportIface exportExc = ExportFactory.getInstance(type);
			//��������
			exportExc.export(out, rs, sheetName, fields, colName);

		} catch (Exception ex) {
			if(log.isErrorEnabled()){
				log.error(ex);
			}
		} finally {
			//�ͷ�
			statementmanager.clear();
		}
	}

	/**
	 * @author chenf
	 * @date 2005-11-18
	 * @docRoot
	 *  ���������ļ���������Ϣ������Ϣ������һ��xml�ļ����ʽ�磺
	 *	<?xml version="1.0" encoding="gb2312" ?>
	 *	<exports>
	 *		<export id="exportMenu" sqlId= "getMenus" filename="menu">
	 *			<description>�˵�������Ϣ</description>
	 *			<column name="menu_id">�˵�ID</column>
	 *			<column name="menu_name">�˵�����</column>
	 *			<column name="img_src">ͼƬ��ַ</column>
	 *		</export>
	 *	</exports>
	 *  ������������Ϣ��������ExportInfo������󱣴���List��
	 *  @param conifgfile �����ļ�·��
	 *  @return java.util.HashMap
	 */
	public HashMap exportConfig (String configfile){
		HashMap configList = new HashMap();
		try{
			InputStream in = (net.trust.utils.export.ExportUtil.class).getResourceAsStream(configfile);
			//�������dom4j��xml������
			SAXReader saxReader = new SAXReader();
		    Document document = saxReader.read(in);
		    //�������ļ���ȡ��������Ҫ�����Ľڵ���Ϣ
		    Iterator it = document.selectNodes("//exports/export").iterator();

		    while(it.hasNext()){
		    	Element element =(Element)it.next();
		    	//������Ϣ��Ӧ����
		    	ExportInfo ei = new ExportInfo();
		    	ei.setSqlId(element.attribute("sqlId").getValue());
		    	ei.setFileName(element.attribute("filename").getValue());

		    	List cols = element.selectNodes("column");
		    	String[] fields = null;
		    	String[] columns = null;
		    	if(cols.size()>0){
		    		fields = new String[cols.size()];
		    		columns = new String[cols.size()];
		    	}
		    	
		    	for(int i=0;i<cols.size();i++){
		    		Element elCol = (Element)cols.get(i);
		    		fields[i]=elCol.attribute("name").getValue();
		    		columns[i]=elCol.getText();
		    	}
		    	ei.setFields(fields);
		    	ei.setColumns(columns);
		    	ei.setDescription(element.selectSingleNode("description").getText());
		    	//����ID��ExportInfo����
		    	configList.put(element.attribute("id").getValue(),ei);
		    }
		    
		}catch(Exception ex){
			ex.printStackTrace();
			if(log.isErrorEnabled())
				log.error(ex);
		}
		return configList;
		
	}

	public StatementIface getStatementmanager() {
		return statementmanager;
	}

	public void setStatementmanager(StatementIface statementmanager) {
		this.statementmanager = statementmanager;
	}
}
