package com.qzgf.NetStore.service;

import java.util.List;

import com.qzgf.NetStore.pub.Page;

public interface IReviewService {


	public Page reviewList(int page,String t);
	
	//δ�ظ�
	@SuppressWarnings("unchecked")
	public List reviewReplyList();
	
	//δ���
	@SuppressWarnings("unchecked")
	public List reviewAuditList(String value);
	
	//����Ƿ��Ѿ�ͨ��
	public void reviewAudited(String rId,String tag);
	
	
	//�ظ��С�������
	@SuppressWarnings("unchecked")
	public List replyingList(String rId);
	
	//����ظ�
	public void update(String rId,String replyContent);
	
	public void Delete(String ID);
}
