package com.qzgf.NetStore.pub;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author Redyc
 * @version1.0
 */
public class Page  {
	//UtilDB du=new UtilDB();
	
	//Ĭ��ÿҳ��¼��
	public static final int DEFAULT_PAGESIZE=20;
	//��ǰҳ��
	private int currentPage=0;
	//ÿҳ��¼��
	private int pageSize=DEFAULT_PAGESIZE;
	//��ҳ��
	private int totalPages;
	//�ܼ�¼��
	private int totalRecords;
	//�Ƿ�����һҳ
	private boolean hasNext;
	//�Ƿ�����һҳ
	private boolean hasPrevious;
	//��һҳҳ��
	private int prevNum;
	//��һҳҳ��
	private int nextNum;
	//��¼
	private ResultSet  rowset;
	//��¼��װ
	@SuppressWarnings("unchecked")
	private List resultList;
	
	@SuppressWarnings("unchecked")
	public List getResultList() {
		return resultList;
	}

	@SuppressWarnings("unchecked")
	public void setResultList(List resultList) {
		this.resultList = resultList;
	}

	public Page() {
	}
	
	public Page(int pageNo,int pageSize){
		setCurrentPage(pageNo);
		setPageSize(pageSize);
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public boolean isHasNext() {
		return hasNext;
	}
	public boolean isHasPrevious() {
		return hasPrevious;
	}
	public int getNextNum() {
		return nextNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public int getPrevNum() {
		return prevNum;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}
	public void setHasPrevious(boolean hasPrevious) {
		this.hasPrevious = hasPrevious;
	}
	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}
	
	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public void initOtherData() {
		setTotalPages((int)((totalRecords-1)/pageSize)+1);
		setHasNext(totalPages>currentPage?true:false);
		setHasPrevious(currentPage>1?true:false);
		setNextNum(hasNext?currentPage+1:totalPages);
		setPrevNum(hasPrevious?currentPage-1:1);
	}
	
	
	
	
	

	
	//������ˮ�š����ú���
	public 	String  lshNO(String tag,int len,String tableStr,String dateField,String initField) //len����ʾ��ˮ���ܳ��ȣ�init���ѵ��ĳ�ʼ��ֵ
	{
		UtilDB utilDb=null;
		try {
			utilDb = new UtilDB();
		} catch (wlglException e2) { 
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		//ȡ�ó�ʼ��ֵ
		String init="";
		String InitDate="";
		String sql="select  *  from  "+tableStr+"";
		 ResultSet rs = null;
		try {
			//rs=du.stmt.executeQuery(sql);
			rs=utilDb.executeQuery(sql);
			
			
			
			if(rs.next())
			{
				init=Integer.toString(rs.getInt(initField));//��ó�ʼ��ֵ
				InitDate=rs.getString(dateField);//ȡ�����ݿ��е�����
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//ȡ�ó�ʼ��ֵ
		
		try {
			utilDb.closeCon();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
       String lshStr="";
       //ȡ�õ�ǰ����
         Calendar rightNow = Calendar.getInstance();
	     SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
	     String sToday = fmt.format(rightNow.getTime()); 
		//ȡ�õ�ǰ����
	     
	    //д�����ݿ��õ�
		SimpleDateFormat FormatS = new SimpleDateFormat("yyyy-MM-dd");	
		String Today=FormatS.format(rightNow.getTime());
		
		//2008-08-08
		InitDate=InitDate.substring(0, 4)+InitDate.substring(5, 7)+InitDate.substring(8, 10);
		if(!sToday.equals(InitDate))//��������ڱ����ݿ������ڲ�ͬ
		{
		    init="1";
		}
	
		
		
		//д�����ݿ��õ�
	    String	zStr="";
		for (int i=0;i<len-init.length()-8;i++)
		{
			zStr=zStr+"0";	
		}
		lshStr=tag+sToday.substring(2)+zStr+init;//��pt080808+00+11
		
		
		//���¡������ֵ
		int nowInit= Integer.parseInt(init)+1;
		String updateStr="update "+tableStr+" set "+dateField+"='"+Today+"',"+initField+"="+nowInit;
		try {
			utilDb = new UtilDB();
		} catch (wlglException e2) { 
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		boolean flag=utilDb.executeUpdate(updateStr);
	    if(flag){
			try {
				utilDb.closeCon();
			} catch (wlglException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }else{
	    	System.out.println("��ˮ�Ÿ���ʧ��:");
	    	try {
				utilDb.closeCon();
			} catch (wlglException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
		return lshStr;
	}

	//����������
	public 	String  OrdLsh() //len����ʾ��ˮ���ܳ��ȣ�init���ѵ��ĳ�ʼ��ֵ
	{
		
		UtilDB utilDb=null;
		try {
			utilDb = new UtilDB();
		} catch (wlglException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		
		//ȡ�ó�ʼ��ֵ
		int len=16;
		String tableStr="t_lsh";
		String dateField="orderDate";
		String initField="orderInitValue";
		String init="";
		String InitDate="";
		String sql="select  *  from  "+tableStr+"";
		 ResultSet rs = null;
		try {
			rs=utilDb.executeQuery(sql);
			if(rs.next())
			{
				init=Integer.toString(rs.getInt(initField));//��ó�ʼ��ֵ
				InitDate=rs.getString(dateField);//ȡ�����ݿ��е�����
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			utilDb.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       String lshStr="";
       //ȡ�õ�ǰ����
         Calendar rightNow = Calendar.getInstance();
         //ȡ�ý�������
         rightNow.setTime(new Date());   
         String year=String.valueOf(rightNow.get(Calendar.YEAR));   
	     SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
	     String sToday = fmt.format(rightNow.getTime()); //20080808
		//ȡ�õ�ǰ����
	     
	    //д�����ݿ��õ�
		SimpleDateFormat FormatS = new SimpleDateFormat("yyyy-MM-dd");	
		String Today=FormatS.format(rightNow.getTime());
		fmt=new SimpleDateFormat("MMdd");
		String monthDay=fmt.format(rightNow.getTime());
		//2008-08-08---->20080808
		InitDate=InitDate.substring(0, 4)+InitDate.substring(5, 7)+InitDate.substring(8, 10);
		if(!sToday.equals(InitDate))//��������ڱ����ݿ������ڲ�ͬ
		{
		    init="1";
		}
	
		//д�����ݿ��õ�
	    String	zStr="";
		for (int i=0;i<len-init.length()-13;i++)
		{
			zStr=zStr+"0";	
		}
		//lshStr=tag+sToday.substring(2)+zStr+init;//��pt080808+00+11
		
		lshStr=year+"01161"+monthDay+zStr+init;
		//���¡������ֵ
		int nowInit= Integer.parseInt(init)+1;
		String updateStr="update "+tableStr+" set "+dateField+"='"+Today+"',"+initField+"="+nowInit;
	    try {
			utilDb = new UtilDB();
		} catch (wlglException e2) { 
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		boolean flag=utilDb.executeUpdate(updateStr);
		if(flag){
			try {
				utilDb.closeCon();
			} catch (wlglException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			System.out.println("������ˮ�Ÿ��³���");
			try {
				utilDb.closeCon();
			} catch (wlglException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return lshStr;
	}
	
	
	
	public void setRowset(ResultSet rowset) {
		this.rowset = rowset;
	}

	public ResultSet getRowset() {
		return rowset;
	}
	
	
	
	
	
	
}
