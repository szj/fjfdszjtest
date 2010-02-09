package net.trust.webutils.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import net.trust.utils.IbatisUtils;
import net.trust.utils.PubFunction;
import net.trust.utils.StatementManager;
import net.trust.utils.export.ExportInfo;
import net.trust.utils.export.ExportUtil;
import net.trust.utils.pagination.PaginationImplt;


public class Export extends HttpServlet {

	private Log log = LogFactory.getLog(Export.class);
	private HashMap list = null;
	private static ApplicationContext ctx = null;
	public Export() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		list = null;
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request,response);
	}
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("GBK");
		
		StatementManager statementManager = (StatementManager)ctx.getBean("statementManager");
		
		IbatisUtils iu = new IbatisUtils(statementManager.getSqlMapClient());
		//��ȡ��ѯ����
		HashMap  para = (HashMap)request.getSession().getAttribute("Qparameter");
		
		//��ȡExportFlag
		String exFlag = PubFunction.getNulltoStr(request.getParameter("ExportFlag"));
		if(exFlag == null){
			if(log.isErrorEnabled()){
				log.error("�޷���õ���Flag!");
			}
			return ;
		}
		
		ExportInfo exportInfo = (ExportInfo) list.get(exFlag);
		if(exportInfo == null){
			if(log.isErrorEnabled()){
				log.error("�޷�����Դ�ļ����õ�����Ϣ!");
			}
			return;
		}

		String type= request.getParameter("type");
		
		
		//��ȡ��ҳ��Ϣ
		PaginationImplt p =(PaginationImplt)request.getSession().getAttribute("Qpagination");
		if(para != null && p != null){
			para.put("START","0");
			if (p.getTotalRecord() > 65000){
				para.put("END", "65000");
			}else{
				para.put("END", ""+p.getTotalRecord());
			}
		}
		
		//��ȡ��Ӧ��sql���
		String sql = iu.getSql(exportInfo.getSqlId(),para) ;
		//�������sql����Ҫ�Ĳ���
		Object[] objPara = iu.getSqlParam();
		//��������
		response.reset(); 
		response.setCharacterEncoding("GBK");
		if ("xml".equals(type)){
			response.setContentType("text/xml; charset=GBK");
		}else if ("xls".equals(type)){
			response.setContentType("text/msexcel; charset=GBK");
		}
        response.setHeader("Content-disposition", "attachment;filename=" + exportInfo.getFileName() + "." + type);
        
        
		ExportUtil eu = new ExportUtil(statementManager);
		
		try{
			eu.export(response.getWriter(),sql,objPara,type,exportInfo.getFileName(),exportInfo.getFields(),exportInfo.getColumns());
		}catch(Exception ex){
			if(log.isErrorEnabled())
				log.error(ex);
		}

	}
	
	public void init(ServletConfig config) throws ServletException {
		// 
		String configfile = config.getInitParameter("config");
		if(configfile == null || configfile.trim().length()==0){
			if(log.isDebugEnabled()){
				log.debug("��ֵ��export��Ϣʧ��!");
			}
			return;
		}
		if(log.isDebugEnabled()){
			log.debug("��ֵ��export�ļ�"+configfile);
		}
		
		ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(config.getServletContext());
		ExportUtil exportUtil = new ExportUtil(null);
		list=exportUtil.exportConfig(configfile);
	}

}
