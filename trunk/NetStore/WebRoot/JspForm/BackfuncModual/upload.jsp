<%@ page language="java" contentType="text/html; charset=gbk"%> 

<%@ page pageEncoding="gbk"%> 

<%@ page import="com.jspsmart.upload.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 

<html> 

<head> 

<meta http-equiv="Content-Type" content="text/html; charset=gbk"> 

<title>�ϴ����� </title> 

</head> 

<body> 

<% 

SmartUpload su=new SmartUpload(); 

//��ʼ�� 

su.initialize(pageContext); 

//�ϴ� 

//su.setAllowedFilesList("jpg,gif,bmp"); 

su.upload(); 

// ���ñ�����Ϣ 

String dir="upload"; 


//��ȡ�ϴ��ļ��б��� 

Files files=su.getFiles(); 

for(int i=0;i <files.getCount();i++) 
{ 

File file=files.getFile(i); 

//�ж��ϴ����ǲ����ļ� 

if(!file.isMissing()) 
{ 

//����ȡ��ͼƬ���Ϊ�ļ���Ϊnew����׺����ԭ���ļ��л�� 
String str=file.getFileExt(); 
out.println(str); 
file.saveAs(dir+"/new."+str,su.SAVE_VIRTUAL); 
//file.saveAs(dir+"/new."+str); 

       ServletContext   servletContext   =   pageContext.getServletContext();   
       String   realPath   =   servletContext.getRealPath("/");
          
       out.print(realPath);
//��ȡͼƬ�Ŀͻ���·���� 

String name1=file.getFilePathName(); 

out.print("�ͻ���ԭʼ·����: "); 

out.print(name1); 

out.print(" <br>"); 

out.print("�������ϵ����·����: "); 

//����������ϵ����·���� 

String name2=realPath+"/upload"+"/new."+str; 

out.print(name2); 

out.print(" <br>"); 

%> 

<!-- ���ϴ����ͼƬ���� --> 

<img src=" <%=name2 %>" width="200"> 

<% 

} 

} 

%> 

<!-- ��ȡ�������ķ��ļ�����ֵ --> 

<%=su.getRequest().getParameter("title") %> 

<br> 

<%=su.getRequest().getParameter("content") %> 

<br> 

<br> 

</body> 

</html> 
