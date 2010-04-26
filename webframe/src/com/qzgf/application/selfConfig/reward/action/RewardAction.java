package com.qzgf.application.selfConfig.reward.action;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork2.ActionContext;
import com.qzgf.Def;
import com.qzgf.application.BaseAction;
import com.qzgf.application.selfConfig.reward.domain.RewardFacade;
import com.qzgf.context.PageList;
import com.qzgf.context.Pages;
import com.qzgf.utils.ListParseToJson;

/**
 * ���ͽҰ�
 * @author lsr
 *
 */
@SuppressWarnings("serial")
public class RewardAction extends BaseAction {
	Log log = LogFactory.getLog(RewardAction.class);

	private HashMap reward = new HashMap();//����
	private HashMap solve = new HashMap();//�Ұ�
	private List rewardList;				//�����б�
	private List solveList;				//�����б�
	
	private String json;  					//Ajaxר�÷���ֵ
	private RewardFacade rewardFacade;		
	private PageList pageList;
	private String xml;		//ҳ�淵��
	
	private String ptitlehide;//�û��ύ����ʾ
	
	// ��ȡ�û���������Ϣ2009-11-24
	private HashMap userInfo;
	
	 //��ں���
	public String execute() {
		try {
			// ��session�ж�ȡ�û���Ϣ
			
			userInfo=(HashMap)(ActionContext.getContext().getSession().get(Def.LOGIN_SESSION_NAME));
			//��������¼ʱ
			if(userInfo==null)
			{
				HashMap tmp=new HashMap();
				tmp.put("USERID","0");
				userInfo=tmp;
			}
			return this.executeMethod(this.getAction());
		} catch (Exception e) {
			log.error(e);
			return "index";
		}
	}
	//ǰ̨����
    //�����б�(����)
	public String index() {
		Pages pages = new Pages();
		pages.setPage(this.getPage());//Ĭ�ϵ�һҳ
		pages.setPerPageNum(10); //����ÿҳ��С
		pages.setFileName("reward.do?action=index");
		this.setPageList(this.rewardFacade.findRewardPage(search, pages));
		return "index";
	}
    //�Ұ���ʾ(��ػش�)
	public String solvehide() {
		//ͨ������ģ����ѯ������Ϣ
		ptitlehide=search.get("ptitle").toString();
		Pages pages = new Pages();
		pages.setPage(this.getPage());//Ĭ�ϵ�һҳ
		pages.setPerPageNum(10); //����ÿҳ��С
		pages.setFileName("reward.do?action=solvehide&search.ptitle="+ptitlehide);
		this.setPageList(this.rewardFacade.findRewardSolvePage(search, pages));		
		return "solvehide";
	}
	
	//��������,д�����ݿ�2009-10-14
	public String insertreward() {
		search.put("puserid", userInfo.get("USERID").toString());
		int i=this.rewardFacade.insertReward(search);
		search.clear();
		return index();
	}	
	
    //�Ұ�ش�(),ͨ��������ݲ�ѯ�������������Ϣ
	public String solvequestion() {
		this.setSolve((HashMap)this.rewardFacade.findRewardSolve(search).get(0));
		return "solvequestion";
	}
	
    //�Ұ�ش�(),���͵������Ϣ,�����Ұ��,�����͵ľ�������
	public String rewarddetail() {
		//����,ȡ�����͵������Ϣ
		List ls=this.rewardFacade.findReward(search);
		if(ls.size()>0){
		    HashMap hs=(HashMap)ls.get(0);
			this.setReward(hs);
			String mid=hs.get("ID").toString();
			search.clear();
			//��صĽҰ���Ϣ
			search.put("prewardid", mid);
			Pages pages = new Pages();
			pages.setPage(this.getPage());//Ĭ�ϵ�һҳ
			pages.setPerPageNum(10); //����ÿҳ��С
			pages.setFileName("reward.do?action=rewarddetail&search.pid="+mid);//ָ����Ŀ����ϸ��Ϣ
			this.setPageList(this.rewardFacade.findSolvePage(search, pages));
		}
		return "rewarddetail";
	}
	
    //�Ұ�ش�()
	public String insertsolvequestion() {
		//��������
		search.put("puserid", userInfo.get("USERID").toString());
		int i=this.rewardFacade.insertSolve(search);
		search.clear();
		return index();
	}
    //�Ұ�ش�(json�ظ�����ʾ����),��Ϊ��ҳ�޷�����,���ó��淽ʽ����
	public String ajaxsolvejson() {
		//��������
		List ls=this.rewardFacade.findRewardSolve(search);
		//if(ls.size()>0)
			json=ListParseToJson.parseToJson(ls);
		return "json";
	}
	
	
	//��̨ struts.ui.theme=simple
    //1.�����б�(�õ��б�)
	public String list() {
		Pages pages = new Pages();
		pages.setPage(this.getPage());//Ĭ�ϵ�һҳ
		pages.setPerPageNum(10); //����ÿҳ��С
		pages.setFileName("reward.do?action=list");
		this.setPageList(this.rewardFacade.findRewardPage(search, pages));
		return "list";
	}
	//2.�༭ʱȡ��̨������Ϣ���õ����м�¼��
	public String edit() {
		//����,ȡ�����͵������Ϣ
		List ls=this.rewardFacade.findReward(search);
		if(ls.size()>0){
		    HashMap hs=(HashMap)ls.get(0);
			this.setReward(hs);
			String mid=hs.get("ID").toString();
			search.clear();
			//��صĽҰ���Ϣ
			search.put("prewardid", mid);	
			Pages pages = new Pages();
			pages.setPage(this.getPage());//Ĭ�ϵ�һҳ
			pages.setPerPageNum(10); //����ÿҳ��С
			pages.setFileName("reward.do?action=rewarddetail");
			this.setPageList(this.rewardFacade.findSolvePage(search, pages));
		}
		this.setAction("update");
    	return "edit";
	}

	//���ݸ��µĴ����õ����м�¼��
	public String update() {
		int i=this.rewardFacade.updateRewardById(search);
		if(i==1)
		{
			this.addActionMessage(this.getText("���³ɹ�!"));
		}else
		{
			this.addActionError(this.getText("����ʧ��!"));
		}
		//ת���б�ҳ��
		search.clear();
		return list();
	}
	
	
	//ɾ��������Ϣͬʱɾ���Ұ���Ϣ
	public String delete() {
		//����
		int i=this.rewardFacade.deleteRewardById(search);
		//�ӱ�
		HashMap hs=new HashMap();
		hs.put("prewardid", search.get("pid").toString());
		i=i+this.rewardFacade.deleteSolveById(hs);
		java.lang.StringBuffer sb = new StringBuffer();
		sb.append("<delete>");
		sb.append("<value>").append(i).append("</value>");
		sb.append("</delete>");
		xml = sb.toString();
		return "xml";
	}
	
	@SuppressWarnings("unchecked")
	public HashMap getSearch() {
		return search;
	}

	@SuppressWarnings("unchecked")
	public void setSearch(HashMap search) {
		this.search = search;
	}

	public PageList getPageList() {
		return pageList;
	}

	public void setPageList(PageList pageList) {
		this.pageList = pageList;
	}

	/**
	 * @return the rewardFacade
	 */
	public RewardFacade getRewardFacade() {
		return rewardFacade;
	}

	/**
	 * @param rewardFacade the rewardFacade to set
	 */
	public void setRewardFacade(RewardFacade rewardFacade) {
		this.rewardFacade = rewardFacade;
	}
	/**
	 * @return the reward
	 */
	public HashMap getReward() {
		return reward;
	}
	/**
	 * @param reward the reward to set
	 */
	public void setReward(HashMap reward) {
		this.reward = reward;
	}
	/**
	 * @return the solve
	 */
	public HashMap getSolve() {
		return solve;
	}
	/**
	 * @param solve the solve to set
	 */
	public void setSolve(HashMap solve) {
		this.solve = solve;
	}
	/**
	 * @return the rewardList
	 */
	public List getRewardList() {
		return rewardList;
	}
	/**
	 * @param rewardList the rewardList to set
	 */
	public void setRewardList(List rewardList) {
		this.rewardList = rewardList;
	}
	/**
	 * @return the solveList
	 */
	public List getSolveList() {
		return solveList;
	}
	/**
	 * @param solveList the solveList to set
	 */
	public void setSolveList(List solveList) {
		this.solveList = solveList;
	}

	/**
	 * @return the json
	 */
	public String getJson() {
		return json;
	}
	/**
	 * @param json the json to set
	 */
	public void setJson(String json) {
		this.json = json;
	}
	/**
	 * @return the xml
	 */
	public String getXml() {
		return xml;
	}
	/**
	 * @param xml the xml to set
	 */
	public void setXml(String xml) {
		this.xml = xml;
	}
	/**
	 * @return the ptitlehide
	 */
	public String getPtitlehide() {
		return ptitlehide;
	}
	/**
	 * @param ptitlehide the ptitlehide to set
	 */
	public void setPtitlehide(String ptitlehide) {
		this.ptitlehide = ptitlehide;
	}
}
