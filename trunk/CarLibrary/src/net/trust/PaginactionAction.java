package net.trust;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import net.trust.utils.pagination.PaginationImplt;

import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;

/**
 * ��ҳ��action�࣬���ģ����Ҫ��ҳ�Ĺ��ܼ̳и���
 * */
public class PaginactionAction extends ActionSupport{
	protected StringBuffer reload = new StringBuffer();//����Ҫˢ�µĴ���
	protected String back;//�ɹ�ҳ����չʾ�ķ������ӵ�URL
	protected List button = new java.util.ArrayList();//�ɹ�ҳ��չʾ�İ�ť
	
	protected String startNum ="0"; //��¼��ʼ��
	protected String endNum="15";    //��¼�����
	protected int queryFlag = 0;    //��f־��0����ò�ѯ�������µ�,1���ǵ������ҳ����ת��ѯ
	protected String turnPage = null; // ��ҳ,first,previous,next,last
	protected PaginationImplt  pagination = null;
	protected int pageRecord=15;
	
	protected String exportFlag = null;
	
	protected List actionScripts = new ArrayList(); //��¼��ʼ��
	
	private final Log log = LogFactory.getLog(PaginactionAction.class);
	public String execute() throws Exception {
		return SUCCESS;
	}
	protected Object getParameter(){
		pagination = (PaginationImplt)ActionContext.getContext().getSession().get("Qpagination");
		pagination.turnPage(turnPage);
		turnPage=String.valueOf(pagination.getCurrentPage());
		startNum = String.valueOf(pagination.getPageStart() - 1);
//		endNum =  String.valueOf( pagination.getPageEnd());
		endNum = "15";
		
		if( ActionContext.getContext().getSession().get("Qparameter") instanceof java.util.Map){
			if(log.isDebugEnabled()){
				log.debug("parameter is Map");
			}
			((java.util.HashMap)ActionContext.getContext().getSession().get("Qparameter")).put("START",startNum);
			((java.util.HashMap)ActionContext.getContext().getSession().get("Qparameter")).put("END",endNum);
		}
		if(log.isDebugEnabled()){
			log.debug(ActionContext.getContext().getSession().get("Qparameter"));
		}
		return ActionContext.getContext().getSession().get("Qparameter");
	}
	protected void setParameter(Object para){
		ActionContext.getContext().getSession().put("Qparameter",para);
	}
	/**
	 * �����ܼ�¼��������ʼ��pagination���󱣴��ڻỰ��
	 * */
	protected void setCount(int c){
		pagination= new PaginationImplt();
		pagination.setTotalRecord(c);
		pagination.setPageRecord(pageRecord);
		startNum = String.valueOf(pagination.getPageStart());
//		endNum = String.valueOf( pagination.getPageEnd());
		endNum = "15";
		
		if( ActionContext.getContext().getSession().get("Qparameter") instanceof java.util.Map){
			if(log.isDebugEnabled()){
				log.debug("parameter is Map");
			}
			((java.util.HashMap)ActionContext.getContext().getSession().get("Qparameter")).put("START",startNum);
			((java.util.HashMap)ActionContext.getContext().getSession().get("Qparameter")).put("END",endNum);
		}
		ActionContext.getContext().getSession().put("Qpagination",pagination);
	}
	
	/**
	 * ����request�еĲ���������ַ���
	 * @param param
	 * @return
	 */
	private String paramToString(HashMap param){
		String paramStr = "";
		Iterator paramIt = param.keySet().iterator();
		while (paramIt.hasNext()){
			String paramName = (String)paramIt.next();
			String v[] = (String[])param.get(paramName);
			if (null != v[0])
				paramStr += "&" + paramName + "=" + v[0];
			else
				paramStr += "&" + paramName + "=";
			
		}
		return paramStr;
	}
	
	public PaginationImplt getPagination() {
		return pagination;
	}
	public int getQueryFlag() {
		return queryFlag;
	}

	public void setQueryFlag(int queryFlag) {
		this.queryFlag = queryFlag;
	}

	public String getTurnPage() {
		return turnPage;
	}

	public void setTurnPage(String turnPage) {
		this.turnPage = turnPage;
	}
	public void setPageRecord(int pageRecord) {
		this.pageRecord = pageRecord;
	}
	public StringBuffer getReload() {
		return reload;
	}
	public void setReload(StringBuffer reload) {
		this.reload = reload;
	}

	public String getBack() {
		return back;
	}
	public void setBack(String back) {
		this.back = back;
	}
	public List getButton() {
		return button;
	}
	public void setButton(List button) {
		this.button = button;
	}
	
	public List getActionScripts() {
		return actionScripts;
	}
	public String getExportFlag() {
		return exportFlag;
	}
	public void setExportFlag(String exportFlag) {
		this.exportFlag = exportFlag;
	}
	public void setActionScripts(List actionScripts) {
		this.actionScripts = actionScripts;
	}
	
	public void addActionScript(String script){
		actionScripts.add(script);
	}
}
