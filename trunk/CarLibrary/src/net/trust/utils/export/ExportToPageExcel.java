package net.trust.utils.export;

import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import net.trust.utils.PubFunction;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class ExportToPageExcel implements ExportIface{
	private Log log = LogFactory.getLog(ExportToPageExcel.class);
	
	public boolean export(PrintWriter out, ResultSet rs, String sheetName, String[] fields, String[] colName){
		if (out == null)
			return false;
		if (rs == null) {
			return false;
		}
		
		try {
			int i = 0;
			out.println("<meta http-equiv='Content-Type' content='text/html; charset=GBK'>");
			out.println("<table border='1' cellpadding='1' cellspacing='0'>");
			//ҳͷ
//			out.println("	<thead>");
//			out.println("		<tr>");
//			out.println("		<td COLSPAN="+colName.length+" align=center>"+colName[i]+"</td>");
//			out.println("		</tr>");
//			out.println("	</thead>");
			//��ͷ
			out.println("	<thead>");
			out.println("		<tr>");
			for (i = 0; i<colName.length; i++){
				out.println("		<td>"+colName[i]+"</td>");
			}
			out.println("		</tr>");
			out.println("	</thead>");
			out.println("	<tbody>");
			//������Ϣ
			while (rs.next()){
				out.println("	<tr>");
				
				//�����ݺ�(��һλ,Ĭ���ǳ�����),����15λ,�Զ�ת��Ϊ��ѧ��������ʾ��.���ݶ�ʧ����.
				out.println("	<td>"+PubFunction.getNulltoStr(rs.getString(fields[0]))+"&nbsp;</td>");
				//�����һ������
				for (i=1; i<fields.length; i++){
						out.println("	<td>"+PubFunction.getNulltoStr(rs.getString(fields[i]))+"</td>");
				}
				
				out.println("	</tr>");
			}
			out.println("	</tbody>");
			//ҳβ
//			out.println("	<tfoot  align='center'>");
//			out.println("		<tr>");
//			out.println("			<td COLSPAN="+colName.length+" align=center>"+colName[0]+"</td>");
//			out.println("		</tr>");
//			out.println("	</tfoot>");
			
			out.println("</table>");
			
		} catch (SQLException e) {
			if (log.isErrorEnabled())
				log.error(e);
			return false;
		}
		return true;
	}
}
