package com.qzgf.NetStore.service.impl;


import java.util.List;


import com.qzgf.NetStore.dao.IReviewDAO;
import com.qzgf.NetStore.pub.Page;
import com.qzgf.NetStore.service.IReviewService;

public class ReviewService implements IReviewService {

	private IReviewDAO reviewDAO;
	
	@SuppressWarnings("unchecked")
	@Override
	public Page reviewList(int page,String t) {
		return this.reviewDAO.reviewList(page,t);
	}
    
	//δ�ظ�
	@SuppressWarnings("unchecked")
	public List reviewReplyList()
	{
		return this.reviewDAO.reviewReplyList();
	}

	//δ���
	@SuppressWarnings("unchecked")
	public List reviewAuditList(String value){
		return this.reviewDAO.reviewAuditList(value);
		
	}
	
	//����Ƿ��Ѿ�ͨ��
	public void reviewAudited(String rId,String tag)
	{
	    this.reviewDAO.reviewAudited(rId, tag);
	}
	
	
	
	//�ظ��С���������
	@SuppressWarnings("unchecked")
	public List replyingList(String rId)
	{
		return this.reviewDAO.replyingList(rId);
	}
	
	//���ֻظ�
	public void update(String rId,String replyContent)
	{
		this.reviewDAO.update(rId, replyContent);
	}
	
	
	public void Delete(String ID)
	{
		
		this.reviewDAO.Delete(ID);
	}
	
	
	public IReviewDAO getReviewDAO() {
		return reviewDAO;
	}

	public void setReviewDAO(IReviewDAO reviewDAO) {
		this.reviewDAO = reviewDAO;
	}

}
