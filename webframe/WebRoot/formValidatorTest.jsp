<%@page contentType="text/html; charset=GBK"%>
<%@taglib uri="/WEB-INF/util.tld" prefix="qzgf"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<%@include file="./top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title><qzgf:webinfo type="guidename" /> - <s:text
				name="test.title" /> <qzgf:webinfo type="poweredby" />
		</title>
		<qzgf:webinfo type="meta" />

		<link href="<%=path%>/css/css1.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="<%=path%>/js/jquery-latest.js"></script>
		<script type="text/javascript"
			src="<%=path%>/js/jquery.tablesorter.js"></script>
		<link href="<%=path%>/css/table/style.css" rel="stylesheet"
			type="text/css" />
		<link type="text/css" href="<%=path%>/css/jquery-ui-1.7.custom.css" rel="stylesheet" />	
		<script type="text/javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery-ui-1.7.custom.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery.form.js"></script>
		<!-- ������֤js,����֤��ʽ�� -->
		<link type="text/css" href="<%=path%>/css/validator.css" rel="stylesheet" />	
		<script type="text/javascript" src="<%=path%>/js/formValidator.js"></script>
		<script type="text/javascript" src="<%=path%>/js/formValidatorRegex.js"></script>
    </head>
<body>
<form method='POST' name='form1' action='#' >
	<table >
		
		

				<tr> 
			      <td align="right">����:</td>
			      <td><input type="text" id="zs" style="width:120px" /></td>
			      <td><div id="zsTip" style="width:300px"></div></td>
			    </tr>
			    <tr> 
			      <td align="right">������:</td>
			      <td><input type="text" id="zzs" style="width:120px" /></td>
			      <td><div id="zzsTip" style="width:300px"></div></td>
			    </tr>
			        <tr> 
				      <td align="right">������������ + 0��:</td>
				      <td><input type="text" id="zs1" style="width:120px" /></td>
				      <td><div id="zs1Tip" style="width:300px"></div></td>
				    </tr>
				    
				    <tr> 
				      <td align="right">���֤(������ʽ��):</td>
				      <td><input name="sfz" type="text" id="sfz" /></td>
				      <td><div id="sfzTip" style="width:300px"></div></td>
				    </tr>
				    <tr> 
				      <td align="right">���֤(�ⲿ����):</td>
				      <td><input type="text" id="sfz1" style="width:120px" /></td>
				      <td><div id="sfz1Tip" style="width:300px"></div></td>
				    </tr>
				   <tr> 
				      <td align="right">����У��:</td>
				      <td><input name="text" type="text" id="ewjy" style="width:120px" /></td>
				      <td><div id="ewjyTip" style="width:270px"></div></td>
				    </tr>
	</table>


</form>
      <script type="text/javascript">
   //Jquery������֤
$(document).ready(function() {
    //������֤
    $.formValidator.initConfig({formid:"form1",onerror:function(){alert("У��û��ͨ������������뿴������ʾ")}});
    //����������֤      
	$("#zs").formValidator({onshow:"����������",oncorrect:"лл��ĺ��������������ȷ"}).regexValidator({regexp:"int",datatype:"enum",onerror:"������ʽ����ȷ"});
	$("#zzs").formValidator({onshow:"������������",oncorrect:"лл��ĺ����������������ȷ"}).regexValidator({regexp:"intp",datatype:"enum",onerror:"��������ʽ����ȷ"});
	$("#zs1").formValidator({onshow:"������������+0",oncorrect:"лл��ĺ�������ĸ�������ȷ"}).regexValidator({regexp:"intp0",datatype:"enum",onerror:"������������+0"});
    //�ⲿ�������ã��ǹ��õĺ�����
	$("#sfz").formValidator({onshow:"������15��18λ�����֤",onfocus:"����15��18λ�����֤",oncorrect:"������ȷ"}).regexValidator({regexp:"idcard",datatype:"enum",onerror:"����������֤��ʽ����ȷ"});;
    $("#sfz1").formValidator({onshow:"������15��18λ�����֤",onfocus:"����15��18λ�����֤",oncorrect:"������ȷ"}).functionValidator({fun:isCardID});
    //�ַ����ȵ���֤������ҳ��ĸ��Ի�������֤.
	$("#ewjy").formValidator().inputValidator({min:1,onerror:"��������Ҫһ���ַ�,��ȷ��"}).functionValidator({
	    fun:function(val,elem){
	        if(val=="è��"){
			    return true;
		    }else{
			    return "����У��ʧ��,�����У��ͨ����������\"è��\""
		    }
		}
	});  
	} );  
     </script>
     </body>
     </html>
