<%@ page language="java" pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ page import="com.jspsmart.upload.SmartUpload"%> 
<%@  page  import="java.text.SimpleDateFormat"  %> 
<%@  page  import="java.util.*"  %> 
<html>
 <head>
  <title>�ļ��ϴ�</title>
<jsp:useBean id="mySmartUpload" scope="page"
   class="com.jspsmart.upload.SmartUpload" />
<script type="text/javascript">    
function go()    
  { 
   parent.FileNameStr(document.getElementById("ip1").value);
   document.getElementById("ip1").outerHTML = document.getElementById("ip1").outerHTML; 
   document.getElementById("fileName").outerHTML = document.getElementById("fileName").outerHTML;
  }
 </script> 
   </head>
  <body onload="go()">
 <form method="post" action="" enctype="multipart/form-data"> 
   
<% 
    //�½�һ��SmartUpload����
    SmartUpload su = new SmartUpload(); 
   
    //�ϴ���ʼ�� 

    su.initialize(pageContext); 
   
    // �趨�ϴ����� 

    //1.����ÿ���ϴ��ļ�����󳤶ȡ� 

    su.setMaxFileSize(10000000); 
   
    //2.�������ϴ����ݵĳ��ȡ� 

    su.setTotalMaxFileSize(20000000); 
   
    //3.�趨�����ϴ����ļ���ͨ����չ�����ƣ�,������doc,txt�ļ��� 

    su.setAllowedFilesList("jpg,JPG,jpeg,JPEG,gif,GIF,bmp,BMP");  
        
    boolean sign = true; 
        
    //4.�趨��ֹ�ϴ����ļ���ͨ����չ�����ƣ�,��ֹ�ϴ�����exe,bat,jsp,htm,html��չ�����ļ���û����չ�����ļ��� 
    String fileStr="";
    try { 
       su.setDeniedFilesList("exe,bat,jsp,htm,html,SWF,RMVB,RM,AVI"); 
   
        //�ϴ��ļ� 

        su.upload(); 
        //���ϴ��ļ����浽ָ��Ŀ¼ 
     

        
        com.jspsmart.upload.File myFile = su.getFiles().getFile(0);
        
        Calendar rightNow = Calendar.getInstance();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddhhmmss");
		String cc = fmt.format(rightNow.getTime());
		
		String fName ="";
        //fName=myFile.getFileName();
        fName=cc+"."+myFile.getFileExt();
        ///fileName=myFile.getFileExt();
        
        // su.save("/images/smallPic/",su.SAVE_VIRTUAL);
        
        // myFile.saveAs("./paperdatabase/" + fileName, mySmartUpload.SAVE_VIRTUAL);
         myFile.saveAs("/upload/smallPic/" + fName,mySmartUpload.SAVE_VIRTUAL);
      
       
      
         //myFile.saveAs("var\\images\\smallPic\\" + fileName, mySmartUpload.SAVE_PHYSICAL);
         //myFile.saveAs("c:\\images\\smallPic\\" + fileName, mySmartUpload.SAVE_PHYSICAL);
        
        //su.save("c:\\"+ fileName); 
        fileStr=fName;
        %>
        <input type="text" id="ip1" name="ip1" value="<%=fileStr%>"/>
        <input type="text" id="fileName" name="fileName"/>
        
        <%
  
    } catch (Exception e) { 
        e.printStackTrace(); 
        sign = false; 
    } 
    if(sign==true) 
    { 
       
        out.println("<script>parent.callback('��Ϣ��ʾ:�ļ����ϳɹ���.')</script>"); 
        
    }else 
    { 
        out.println("<script>parent.callback('��Ϣ��ʾ:�ļ��ϴ�ʧ��,������ļ��Ƿ������ϴ�.')</script>"); 
    } 
%> 
</form>
</body>
</html>