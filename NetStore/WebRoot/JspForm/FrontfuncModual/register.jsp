<%@ page language="java" pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html:html lang="true">
<head>
	<html:base />
	<title>�û�ע��</title>
	<link href="<%=request.getContextPath()%>/css/header01.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/css/index.css" type="text/css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/css/catalog.css" type="text/css" rel="stylesheet"/>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/jslib/jquery.js"></script>

	<script type="text/javascript">
    	$(document).ready(function(){
    		//�����ʽ
    		$(".stripe tr").mouseover(function(){
    			$(this).addClass("over");
    		}).mouseout(function(){
    			$(this).removeClass("over");
    		});
    		$(".stripe tr:even").addClass("alt");
    		
    		$("#userpwd").blur(function(){
    			if($('#userpwd').val().length<6||$('#userpwd').val().length>12){
    				$("#info2").html("<font color=red>"+"������������λ��С�ڵ���ʮ��λ"+"</font>");
    			}else{
    				$("#info2").html("<font color=red>"+"�������"+"</font>");
    			}
    		});
    		$("#confirmpwd").blur(function(){
    			if($('#userpwd').val()!=$('#confirmpwd').val()||($('#confirmpwd').val().length<6||$('#confirmpwd').val().length>12)){
    				$("#info3").html("<font color=red>"+"������������"+"</font>");
    			}
    			else{
    				$("#info3").html("<font color=red>"+"�������"+"</font>");
    			}
    		});
    	});
    	function checkUserId(){
    		var userid=encodeURI(encodeURI(document.getElementById("userid").value));
	    		$.ajax({
	 			type: "POST",
	 			url: "<%=request.getContextPath()%>/JspForm/FrontfuncModual/user.do",
	 			data:   "status=checkUserId&userid="+userid,
	 			success: function(msg){ 
	 				$("span#info1").html("<font color=red>"+msg+"</font>");
	 			} 
			}); 
		}
		function checkCCode(){
			var checkcode=document.getElementById("checkcode").value;
    		$.ajax({
	 			type: "POST",
	 			url: "<%=request.getContextPath()%>/JspForm/FrontfuncModual/user.do",
	 			data:   "status=checkCCode&checkcode="+checkcode,
	 			success: function(msg){ 
	 				$("span#info4").html("<font color=red>"+msg+"</font>");
	 			} 
			});
    	}
    	
    	function verifyEmailAddress(strEmail){
          var myReg = /^[_a-zA-Z0-9_-_._-]+@([_a-zA-Z0-9_-]+\.)+[a-zA-Z]{2,3}$/;
          return myReg.test(strEmail);
        }
    	function checkEmail(thisForm){
    	   var email=document.getElementById("email");
    	   if(!verifyEmailAddress(email.value)){
		      alert("������ʼ���ʽ����ȷ!");
		      email.focus();
		      return false;
	       }
	       else{
	          thisForm.action='<%=request.getContextPath()%>/JspForm/FrontfuncModual/cart.do?status=modifyProductNum'+"&goFlag=${goFlag}";
              thisForm.submit();
              return true;
	       }
    	}
    	function op(){
    	    $.ajax({
	 			type: "POST",
	 			url: "<%=request.getContextPath()%>/JspForm/BackfuncModual/treaty.do",
	 			data:   "status=queryTreatyToReg&",
	 			success: function(msg){ 
	 				$("textarea").html(msg);
	 				$("#tr1").toggle(); 
	 			} 
			});
    	}
    	
    </script>
</head>

<body>

	<center>
	<jsp:include flush="true" page="top.jsp" /> 
		<form 
			action="<%=request.getContextPath()%>/JspForm/FrontfuncModual/user.do"
			method="post" />
			
		<h3>
			�û�ע��
		</h3> 
			<table width="98%" align="center" cellspacing="1" cellpadding="2" bgcolor="#e1e1e1" border="0">
				<tr>
					<td width="35%" align="right" bgcolor="#ffffff">
						�û�ID:
					</td>
					<td width="65%" align="left" bgcolor="#ffffff">
						<font color="red">*</font>
						<input type="text" id="userid" name="userid" value="${userId}" maxlength="20"
							onblur="checkUserId()" />
						<span id="info1" style=""></span>
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ffffff">
						�û�����:
					</td>
					<td align="left" bgcolor="#ffffff">
						<font color="red">*</font>
						<input type="password" name="userpwd" id="userpwd" />
						<span id="info2" style=""></span>
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ffffff">
						ȷ������:
					</td>
					<td align="left" bgcolor="#ffffff">
						<font color="red">*</font>
						<input type="password" name="confirmpwd" id="confirmpwd" />
						<span id="info3" style=""></span>
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#ffffff">
						Email:
					</td>
					<td bgcolor="#ffffff" align="left">
						<font color="red">*</font>
						<input type="text" name="email" id="email" value="${email}" />
					</td>
				</tr> 
				<tr>
					<td align="right" bgcolor="#ffffff">
						��֤��:
					</td>
					<td bgcolor="#ffffff" align="left">
						<font color="red">*</font>
						<input type="text" id="checkcode" name="checkcode"
							onblur="checkCCode()" />
						<img src="<%=request.getContextPath()%>/include/image.jsp" />
						<span id="info4" style=""></span>
					</td>
				</tr>
				<tr>
					<td bgcolor="#ffffff">
						&nbsp;
					</td>
					<td bgcolor="#ffffff" align="left">
						�����Ķ���ͬ��
						<a href="javascript:op();">�������̳ǹ���Э�顷</a>
					</td>
				</tr>
				<tr id="tr1" style="display:none"> 
					<td bgcolor="#ffffff">
						&nbsp;
					</td>
					<td bgcolor="#ffffff">
					    <textarea style="BORDER-RIGHT: #333 1px solid; BORDER-TOP: #333 1px solid; BORDER-LEFT: #333 1px solid; WIDTH: 450px; COLOR: #606060; LINE-HEIGHT: 18px; BORDER-BOTTOM: #333 1px solid; HEIGHT: 500px"
								name="textarea" rows="29" readonly="readonly">
					    </textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" bgcolor="#ffffff">
						<input type="hidden" name="status" value="register" />
						<input type="submit" value="ע��" onclick="return checkEmail(this)" />
						<input type="reset" value="����" />
					</td>
				</tr> 
			</table>
		</form>
		<jsp:include flush="true" page="bottom.jsp" />
	</center>
</body>
</html:html>

<script type="text/javascript">
   	<logic:present name="xgResult">
   	    alert("${xgResult}");
   	</logic:present>
</script>

