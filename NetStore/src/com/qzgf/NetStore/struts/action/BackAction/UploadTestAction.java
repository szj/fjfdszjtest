/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.qzgf.NetStore.struts.action.BackAction;


import java.io.FileNotFoundException;
//import java.io.FileOutputStream;
import java.io.IOException;
//import java.io.InputStream;
//import java.io.OutputStream;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;*/
//import org.apache.struts.upload.FormFile;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
//import com.qzgf.NetStore.struts.form.BackForm.UploadForm;

/** 
 * MyEclipse Struts
 * Creation date: 08-21-2008
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 * @struts.action-forward name="upSuccess" path="/JspForm/BackfuncModual/AdminIndex.jsp"
 */
@SuppressWarnings("serial")
public class UploadTestAction extends HttpServlet {
	
	 @SuppressWarnings("unused")
	private ServletConfig config;

	 final public void init(ServletConfig config) throws ServletException {
	  this.config = config;
	 }
	 
	 
	 protected void doGet(HttpServletRequest request,
			   HttpServletResponse response) throws ServletException, IOException {
		 
		 
		 SmartUpload mySmartUpload = new SmartUpload();
			
	
			mySmartUpload.initialize(config, request, response);
			try {
				mySmartUpload.upload();
				mySmartUpload.save("/images/smallPic");
			} catch (SmartUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		   request.setAttribute("errmsg", "文件已成功上传！");
		   
		   response.sendRedirect("../JspForm/BackfuncModual/save.jsp");  
		 
	 }
	 
	 protected void doPost(HttpServletRequest request,
			   HttpServletResponse response) throws ServletException, IOException {
			  // TODO Auto-generated method stub
			  doGet(request, response);
			 } 
	 
	 
	 
	 
	 

		/*	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, IOException, SmartUploadException {
  
		
		SmartUpload mySmartUpload = new SmartUpload();
		
		 try {
			mySmartUpload.initialize(config, request, response);
			mySmartUpload.upload();
			mySmartUpload.save("/images/smallPic");
			
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		   request.setAttribute("errmsg", "文件已成功上传！");
		   return mapping.findForward("upSuccess");	*/
		
		
		
		/*UploadForm uploadForm = (UploadForm)form;
	
		FormFile inputfile=uploadForm.getWjm();
	    if(inputfile==null){
		    return mapping.findForward("upSuccess");
	   }
   
	    String sWJM="080912";
	    
	   InputStream is=inputfile.getInputStream();
	   String path=request.getRealPath("/images/smallPic");
	   OutputStream os= new FileOutputStream(path+"/"+sWJM);

	   int bytes=0;
	   byte[] buffer = new byte[8192];
	   while((bytes=is.read(buffer,0,8192))!=-1){
	    os.write(buffer,0,bytes);
	   }
	   os.close();
	   is.close();
	   inputfile.destroy();
	   */
	   
	   //String yhbh=request.getSession(true).getAttribute("YHBH").toString();
	   //再将该已上传文件逐行拆分存入数据库
	     // String Flg=sjcjPubService.insert(sWJM,"0",path,yhbh);
	 


		
		
		////////////////////////////////////////////////
		/*String sWJM="333";
		UploadForm ptdForm = (UploadForm)form;
		
		FormFile inputfile=ptdForm.getWjm();
		
	    if(inputfile==null){
		    return mapping.findForward("failure");
	   }
   
	    
         * 建立一个上传文件的输出流如果是linux系统请把"\" 换成 "/"
       
	    
	   InputStream is=inputfile.getInputStream();
	   String path=request.getRealPath("/files/data");
	   OutputStream os= new FileOutputStream(path+"/"+sWJM);

	   int bytes=0;
	   byte[] buffer = new byte[8192];
	   while((bytes=is.read(buffer,0,8192))!=-1){
	    os.write(buffer,0,bytes);
	   }
	   os.close();
	   is.close();
	   inputfile.destroy();	
	return mapping.findForward("upSuccess");*/
		
	//}		
	
		
}