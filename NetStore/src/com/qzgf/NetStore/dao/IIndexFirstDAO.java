package com.qzgf.NetStore.dao;

import java.util.List;



import com.qzgf.NetStore.pub.Page;
import com.qzgf.NetStore.pub.wlglException;

public interface IIndexFirstDAO {
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
	
	//��ʾ����
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
	
	////////ĳ����Ʒ����������Ʒ
	@SuppressWarnings("unchecked")
	public  Page someProductShow(String npage,String catalogId);
	
	@SuppressWarnings("unchecked")
	public   List  topProduct(); 
	
	
    //���ࡡ��Ʒ����
    public   Page  NewsProduct(int nPage);
	

    //���ࡡ�Ƽ�����
    public   Page  ReleaseProduct(int nPage);
	
	//���ࡡ
    
    @SuppressWarnings("unchecked")
	public   List bulletinList();
    
    
    //��Ʒ����
    public   Page  prdNews(int nPage);
    
    
    //������ϸ��Ϣ
    @SuppressWarnings("unchecked")
	 public   List newsDetailList(String newsId);
    
	//��������
    @SuppressWarnings("unchecked")
	public   List  friendLinkist(); 
	
	
    //�a��һ����
    @SuppressWarnings("unchecked")
	public List getPrdCata(String parentId);
    
  
    
	
}
