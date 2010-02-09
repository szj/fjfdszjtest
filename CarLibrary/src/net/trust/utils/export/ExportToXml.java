package net.trust.utils.export;
/**
 * ����xml��ʽ����
 * @author chenf
 * */
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ExportToXml implements ExportIface {
	private Log log = LogFactory.getLog(ExportToXml.class);

	/**
	 * ����xml����
	 * Ϊ�˷��㽫����ֱ�����xml��ʽ���룬Ҳ���ǵ�����ڴ�����ʱ��Ӧ�õ�������Դ�������
	 * xml��ʽ���ļ���������Ƿ����ڴ��ϵ�ѹ����
	 * @author chenf
	 * 
	 * @param out
	 *            �����
	 * @param rs
	 *            ��Ҫ����������
	 * @param sheetName
	 *            �ļ�����
	 * @param fields
	 *            Ҫ�������ֶ���
	 * @param colname
	 *            չʾ������
	 * @return boolean trueΪ�����ɹ���false����ʧ��
	 */
	public boolean export(PrintWriter out, ResultSet rs, String sheetName,
			String[] fields, String[] colName) {
		if (out == null)
			return false;
		if (rs == null) {
			return false;
		}
		try {
			StringBuffer row = null;
			out.println("<?xml version=\"1.0\" encoding=\"GBK\" ?><table>");
		    //---�����ڴ����һЩ���ֶε�ע��
			
			// ������������
			while (rs.next()) {
				row = new StringBuffer();
				row.append("<row>");
				for (int i = 0; i < fields.length; i++) {
					row.append("<"+fields[i]+" name=\""+colName[i]+"\">").append(rs.getString(fields[i])).append("</"+fields[i]+">");
				}
				row.append("</row>");
				out.println(row.toString());
			}
			out.println("</table>");
		} catch (Exception ex) {
			if (log.isErrorEnabled()) {
				log.error(ex);
			}
		}
		return true;
	}

}
