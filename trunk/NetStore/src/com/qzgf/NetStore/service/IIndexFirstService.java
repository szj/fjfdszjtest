package com.qzgf.NetStore.service;

import java.util.List;

import com.qzgf.NetStore.pub.Page;
import com.qzgf.NetStore.pub.wlglException;

public interface IIndexFirstService {
	//��Ʒר��
	@SuppressWarnings("unchecked")
	public List newsGoods() throws wlglException;
	
	
	//�Ƽ�ר��
	@SuppressWarnings("unchecked")
	public List releseGoods() throws wlglException;
	
	//�ؼ�ר��
	@SuppressWarnings("unchecked")
	public List specialPriceGoods() throws wlglException;
	
	
	//��ʾ��ͼƬ
	@SuppressWarnings("unchecked")
	public List onlyGoods(String productId) throws wlglException;
	
	
	//��ʾ�ظ�
	@SuppressWarnings("unchecked")
	public List showReview(String productId) throws wlglException;
	
	//��ʾ��������
	public Page showAllReview(int nPage,String productId);
	
	public void insertReview(String reviewId,String productId,String userName,String ip,
			   String contentH,String ReviewGrade,String isAudit,String titleName, String isReply);
	
	
	////////////////////�ؼ۴���
	public Page specialPrice(int nPage);
	
	//��ҳ��Ʒ����
	@SuppressWarnings("unchecked")
	public  List pdtCatalog();
	
	
	public  Page someProductShow(String npage,String catalogId);
	
	@SuppressWarnings("unchecked")
	public  List topProduct();


	//������Ʒ
	public   Page  NewsProduct(int nPage);
	
	//�����Ƽ�����
	public   Page  ReleaseProduct(int nPage);
	
	//��ҳ����
	@SuppressWarnings("unchecked")
	public   List bulletinList();
	
	
	//��Ʒ����
	public   Page  prdNews(int nPage);
	
	
	@SuppressWarnings("unchecked")
	public   List newsDetailList(String newsId);
	
	//��������
	@SuppressWarnings("unchecked")
	public   List  friendLinkist();
	
	
	//=============��
	public String getRoleMoudleTree();
	
	//ȫ����
	@SuppressWarnings("unchecked")
	public List getPrdCata(String parentId);
	
	
	
}
