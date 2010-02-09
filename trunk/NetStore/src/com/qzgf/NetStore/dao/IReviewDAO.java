package com.qzgf.NetStore.dao;

import java.util.List;

import com.qzgf.NetStore.pub.Page;

public interface IReviewDAO {
	@SuppressWarnings("unchecked")
	public Page reviewList(int page,String t);
	
	//��ѯδ�ظ�
	@SuppressWarnings("unchecked")
	public List reviewReplyList();
	
	//��ѯ�Ƿ�����
	@SuppressWarnings("unchecked")
	public List reviewAuditList(String value);
	
	//�����Ƿ�ͨ��
	public void reviewAudited(String rId,String tag);
	
	//����ظ��У�������
	@SuppressWarnings("unchecked")
	public List replyingList(String rId);
	
	//ɾ����
	public void Delete(String ID);
	
	//���»ظ�
	public void update(String rId,String replyContent);
	
	
	
	
	
}
