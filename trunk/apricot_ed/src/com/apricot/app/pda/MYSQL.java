package com.apricot.app.pda;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class MYSQL {

	private Connection conn; 
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;

    private static	String DB_Addr = "localhost";  //�������ݿ�ĵ�ַ
	private static String DB_Name = "deoa";    //���ݿ������
	  
	private static String DB_User = "root"; //���ݿ�ʹ�������֣�Ĭ�ϵ�root
	private static String DB_Password = "123@123"; //���ݿ������ 

    //private static	String DB_Addr = "192.168.1.102";  //�������ݿ�ĵ�ַ
   // private static String DB_Name = "deoa";    //���ݿ������
		  
	//private static String DB_User = "zhaoweizi"; //���ݿ�ʹ�������֣�Ĭ�ϵ�root
	//private static String DB_Password = "13807084531"; //���ݿ������ 
		
		
		
	private static String DB_CharSet = "GB2312"; //���뷽ʽ
	private static String DB_Conn_String = "jdbc:mysql://"+DB_Addr+"/"+DB_Name+"?user="+DB_User+"&password="+DB_Password+"&useUnicode=true&characterEncoding="+DB_CharSet; 
	  

	public static Connection getDBC() {
		
		try 
		{ 
	
			String ClassForName ="com.mysql.jdbc.Driver";
			Class.forName(ClassForName).newInstance();
			System.out.println(DB_Conn_String);

		         Connection conn=DriverManager.getConnection(DB_Conn_String); 
		         return conn; 
		} 
		catch(Exception e) 
		{ 
		         e.printStackTrace(); 
		         return null; 
		} 


	}
	
	public static void close(Connection conn,PreparedStatement stmt,ResultSet rs){
		try{
		if(rs!=null){
			rs.close();
			rs = null;
		}
		if(stmt!=null){
			stmt.close();
			stmt = null;
			
		}
		if(conn!=null){
			conn.close();
			conn=null;
		}
		}catch(SQLException e){
			e.printStackTrace();
		}	
	}
	
	
}

