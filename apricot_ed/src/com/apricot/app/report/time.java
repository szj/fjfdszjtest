package com.apricot.app.report;
import java.util.Calendar;
import java.util.Date;
import java.text.*;
public class time {

	/**
	 * @param args
	 */
	//����Ϊ���
	    public String timenumber(){
		Date d = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddkkmmss");
		String str=null;
		str=sdf.format(d);
		return str;
	}
	    //�����full����
	    public String time(){
			Date d = new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
			String str=null;
			str=sdf.format(d);
			return str;
		}
	    //�����simple����
	    public static String simpletime(){
			Date d = new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String str=null;
			str=sdf.format(d);
			return str;
		}
	  //���������  
	    public String printtoday(String Time) 
	     { 
	         Calendar cal = Calendar.getInstance(); 
	         Date date = new Date(); 
	         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
	         //String today=String.valueOf(cal.get(1));
	         try 
	         { 
	             date = sdf.parse(Time); 
	             cal.setTime(date); 
	             //cal.add(cal.DATE, 1);
	             
	         } 
	         catch (Exception e) 
	         { 
	             // TODO Auto-generated catch block 
	             e.printStackTrace(); 
	         } 
	         return sdf.format(cal.getTime());
	        // return today;
	     }
	    
	    //���������
	    public String printNextTime(String Time) 
	     { 
	         Calendar cal = Calendar.getInstance(); 
	         Date date = new Date(); 
	         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
	         try 
	         { 
	             date = sdf.parse(Time); 
	             cal.setTime(date); 
	             cal.add(cal.DATE, 1);
	             
	         } 
	         catch (Exception e) 
	         { 
	             // TODO Auto-generated catch block 
	             e.printStackTrace(); 
	         } 
	         return sdf.format(cal.getTime());
	     } 
	    //����������
	    public String printhoutian(String Time,int day) 
	     { 
	         Calendar cal = Calendar.getInstance(); 
	         Date date = new Date(); 
	         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
	         try 
	         { 
	             date = sdf.parse(Time); 
	             cal.setTime(date); 
	             cal.add(cal.DATE, day);
	         } 
	         catch (Exception e) 
	         { 
	             // TODO Auto-generated catch block 
	             e.printStackTrace(); 
	         } 
	         return sdf.format(cal.getTime());
	     }
	    
	    
	   
	     
	  
	    
	  public static void main(String[] args)
	  {
		  time time=new time();
		  System.out.println(time.printNextTime(time.simpletime()));
		  
	  }
	    
	    
	}




