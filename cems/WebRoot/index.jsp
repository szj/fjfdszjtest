<%@page contentType="text/html; charset=gbk"%>
<%@taglib uri="/WEB-INF/util.tld" prefix="qzgf"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="fck"%>
<%
	//����ȫ�ֱ���
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
 <style type="text/css"> 
  a:link {color: #000000; text-decoration:none} 
  a:visited {color:#000000; text-decoration: none} 
  a:active {color:#000000; text-decoration: none} 
  a:hover {color:#ff0000; text-decoration:underline} 
 </style> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>

		<title>����ʡ183�ٵݹٷ���վ</title>
		<script type="text/javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/tab_css.js"></script>
	</head>
<script type="text/javascript">
 	//��������
	function login(){
	     if(checkmsg()==true){
			var url ='/frontlogin.do';
			document.forms[0].action=url;
			document.forms[0].method="POST";
			document.forms[0].submit();
		}
	}
	
	function checkEms(){
		document.forms[0].submit();
	}
	
	//��֤
    function checkmsg(){
    	result=false;
    	var pcode=document.getElementById("pcode").value;
    	var ppasswd=document.getElementById("ppasswd").value;
    	var pverifycode=document.getElementById("pverifycode").value;
    	if(!(pcode.length>=6&&pcode.length<=40))
    	{
    		alert('�û���������6��40���ַ�֮��');
    		return result;
    	}
    	if(!(ppasswd.length>=6&&ppasswd.length<=20))
    	{
    		alert('���������6��20���ַ�֮��');
    		return result;
    	}
    	if(!(pverifycode.length==4))
    	{
    		alert('��֤�����4���ַ�');
    		return result;
    	}
		return true;
    }
	
	//�������뵽�ֻ�,����==�ֻ�.��������
	function fun_forget(){
			var str=prompt("�������������:","123@163.com");
			if (str)
			{
			    alert("��������:"+str+"�Ѿ��ύ��������,�����ֻ�����õ����ú������!");
			}
			else
			{
			    alert("������ȡ��");
			}
	}
	
	//ע��ҳ��
	function regedit(){
	        window.location.href="/regedit.jsp";
	}
	
	function makeRequest(url,ownertypenum){
				
				var urls="http://211.156.193.130/tools/postageresult.jsp";
				var addressfrom=$("#addressfrom").val();
				var addressto=$("#addressto").val();
				var weight=$("#weight").val();
				if(addressfrom==""){
					alert("�ļ���ʡ������ѡ��������!");
					return false;
				}
				if(addressto==""){
					alert("�ռ���ʡ������ѡ��������!");
					return false;
				}
				if(weight==""){
					alert("��ѯ������ֵ����Ϊ��!");
					return false;
				}
				if(weight>40){
					alert("�����ؿ�ר���ʼ�,�����������ܳ���40����,��������ּ�����!");
					return false;
				}
		  	    var pars="date="+new Date()+"&reqCode=Postage&addressfrom="+encodeURIComponent(addressfrom)+"&addressto="+encodeURIComponent(addressto)+"&weight="+weight ;
		  	    //alert(pars);
		        $.get(urls,pars,showResult1);
		      	function showResult1(res){
		      		//alert(res);û������ʷ�ѶϢ
		      		$("#gofee").val(res);
		      	}
			}
	</script>
	

	<script type="text/javascript">	
	 document.body.style.backgroundImage="url(images/bg.jpg)";
    </script>
	
	<body>
<div align="center">
	<table border="4" cellpadding="0" style="border-collapse: collapse" width="969" id="table3" height="648" bordercolor="#FFFFFF" cellspacing="0">
		<tr>
			<td valign="top">
			<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" id="table4">
				<tr>
					<td>
					<img border="0" src="images/top1.jpg" width="518" height="76"><img border="0" src="images/top2.jpg" width="443" height="76"></td>
					<td>��</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" style="border-collapse: collapse" width="961" id="table5" background="images/nav.jpg" height="40">
				<tr>
					<td width="145" align="center"><b>
					<font color="#FFFFFF" style="font-size: 9pt">
					<a href="/news.do?action=fir">��ҳ</a> </font></b></td>
					<td align="center">
									<b> <font color="#FFFFFF" style="font-size: 9pt"><a
											href="/news.do?action=FrontNews&search.artype=1">��ҵƷ��</a> </font> </b>
								</td>
								<td align="center">
									<b> <font color="#FFFFFF" style="font-size: 9pt"><a
											href="/news.do?action=FrontNews&search.artype=2">��ҵ�Ļ�</a> </font> </b>
								</td>
								<td align="center">
									<b> <font color="#FFFFFF" style="font-size: 9pt"> <a
											href="/news.do?action=FrontNews&search.artype=3">���Ŷ�̬</a> </font> </b>
								</td>
					<td width="167" align="center"><b>
					<font color="#FFFFFF" style="font-size: 9pt">��Ʒ����</font></b></td>
					<td width="157" align="center"><b>
					<font color="#FFFFFF" style="font-size: 9pt">ר��Ӫ��</font></b></td>
				</tr>
			</table>
			<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" id="table6">
				<tr>
					<td width="193" valign="top">
					<table border="0" cellpadding="0" style="border-collapse: collapse" width="252" id="table7" background="images/lft1.jpg" height="242">
						<tr>
							<td valign="top">
						
							<table border="0" cellpadding="0" style="border-collapse: collapse" width="252" id="table17" height="92">
								<tr>
									<td valign="top">
									<table border="0" cellpadding="0" style="border-collapse: collapse;" width="251" id="table18" height="237">
										<tr>
											<td height="20" align="left" >
											<img border="0" src="images/gonggaolan.jpg" width="71" height="13"></td>
										</tr>
										<tr>
											<td height="200" >
           
              
              <font color="#6BBDCF" style="font-size: 9pt">
<marquee direction=up scrollAmount=1 height=188 onMouseOut=this.start(); onMouseOver=this.stop(); width=227 border="8" style="padding:0; ">
 <s:if test="topSixNews!=null">
 <s:iterator id="tsix" value="%{topSixNews.objectList}">	
<br>�� <a href="/news.do?action=newsDetail&search.newsID=<s:property value="#tsix.NEWSID"/>" >
													    <s:property value="#tsix.TITLE"/></a>(<s:property value="#tsix.RELEASETIME"/>)
</s:iterator>
</s:if>
</marquee> 

</font>
</td>
										</tr>
									</table>
									</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
					<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" id="table8">
						<tr>
							<td><table cellpadding="0"  cellspacing="0" width="252"><tr><td><a href="/news.do?action=FrontNews&search.artype=3"><img border="0" src="images/top111.jpg"  height="45"></a></td>
							 <td><a href="/news.do?action=FrontNews&search.artype=4"><img border="0" src="images/top222.jpg"  height="45"></a></td>
							 <td><a href="/news.do?action=FrontNews&search.artype=5"><img border="0" src="images/top333.jpg"  height="45"></a></td>
							 </tr></table></td>
						</tr>
					</table>
					<table border="0" cellpadding="0" style="border-collapse: collapse" width="252" id="table9" background="images/left33.jpg" height="210">
						<tr>
							<td>
							<table border="0" cellpadding="0" style="border-collapse: collapse;" width="251" id="table19" height="201">
								<tr>
									<td valign="top">
									
										<table id="table28" style="width: 238px; border-collapse: collapse" cellPadding="0" border="0">
											
											
											<tr>
												<td>
											<s:if test="topEightNews!=null">
											<s:iterator id="teight" value="%{topEightNews.objectList}">	
												<table height="23" cellSpacing="0" cellPadding="0" width="100%" align="center" background="images/listbg.jpg" border="0" id="table29">
													<tr>
														<td align="middle" width="22" command="ImageManager">
														<font color="#FFFFFF">
														<span style="font-size: 9pt">
														<img alt="" src="images/jiantou1.gif" border="0" width="5" height="9"></span></font></td>
														<td align="left" >
														<font color="#FFFFFF">
														<span style="font-size: 9pt; text-decoration: none">
														<a href="/news.do?action=newsDetail&search.newsID=<s:property value="#teight.NEWSID"/>" >
													    <s:property value="#teight.TITLE"/></a>��</span></font></td>
													</tr>
												</table>
													</s:iterator>
													</s:if>
												</td>
											</tr>
										
											
											
											
											
											
										</table>
									
									</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
					</td>
					<td valign="top">
					<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" id="table11">
						<tr>
							<td>
							<img border="0" src="images/pic.jpg" width="709" height="242"></td>
						</tr>
					</table>
					
					
					
				<table border="0" cellpadding="0"
										style="border-collapse: collapse" width="100%" id="table12">
										<tr>
											<td background="images/navA.jpg" id="td1"
													onclick="loadOnLineQuery();"  width="101" height="45"
												align="center">
												<font color="#FFFFFF"> <span
													style="font-weight: 700; font-size: 3pt"><br> </span>
													<span style="font-size: 9pt; font-weight: 700">�����ļ�</span>
												</font>
											</td>
											<td background="images/navB.jpg" id="td2"
											 onclick="loadPrint();" width="101" height="45"
												align="center">
												<font color="#FFFFFF"> <span
													style="font-weight: 700; font-size: 3pt"><br> </span>
													<span style="font-size: 9pt; font-weight: 700">������</span>
												</font>
											</td>
											<td background="images/navB.jpg" id="td3"
											   onclick="loadEmsQuery();" width="101" height="45"
												align="center">
												<font color="#FFFFFF"> <span
													style="font-weight: 700; font-size: 3pt"><br> </span>
													<span style="font-size: 9pt; font-weight: 700">
														EMS�ʼ���ѯ</span> </font>
											</td>
											<td background="images/navB.jpg" id="td4"
												 onclick="loadBoundQuery();" width="101" height="45"
												align="center">
												<font color="#FFFFFF"> <span
													style="font-weight: 700; font-size: 3pt"><br> </span>
													<span style="font-size: 9pt; font-weight: 700">
														���շ�Χ��ѯ</span> </font>
											</td>
											<td background="images/navB.jpg" id="td5"
												  onclick="loadTimeQuery();" width="101" height="45"
												align="center">
												<font color="#FFFFFF"> <span
													style="font-weight: 700; font-size: 3pt"><br> </span>
													<span style="font-size: 9pt; font-weight: 700">ʱ�޲�ѯ</span>
												</font>
											</td>
											<td background="images/navB.jpg" id="td6"
												onclick="loadMoneyQuery();" width="101" height="45"
												align="center">
												<font color="#FFFFFF"> <span
													style="font-weight: 700; font-size: 3pt"><br> </span>
													<span style="font-size: 9pt; font-weight: 700">
														�ļ��ʷѲ�ѯ</span> </font>
											</td>
											<td background="images/navB.jpg" id="td7"
												 onclick="loadAddressQuery();" width="101" height="45"
												align="center">
												<font color="#FFFFFF"> <span
													style="font-weight: 700; font-size: 3pt"><br> </span>
													<span style="font-size: 9pt; font-weight: 700">������Ų�ѯ</span>
												</font>
											</td>
											<td>
											</td>
										</tr>
									</table>
								

										<table border="0" cellpadding="0"
											style="border-collapse: collapse" width="100%" id="table13"
											height="210" bgcolor="#E5E5E5">
											<tr>
												<td valign="middle">
													<s:form action="query" method="get" target="_top" namespace="/">
													
													
													<div id="tab1"  align="center">
														<table>
															<tr>
																<td>
																<s:form action="frontlogin" target="_top" namespace="/">
																<table border="0" cellpadding="0"
																	style="border-collapse: collapse" width="248"
																	id="table16" height="115">
																	<tr>
																		<td width="68" height="29">
																			<font 
																				style="font-size: 9pt; font-weight: 700">&nbsp;
																				�û���:</font>
																		</td>
																		<td align="left" width="180" height="29" colspan="2">
																			<input type="text" name="search.pcode" id="pcode"
																				size="23"
																				style="border: 1px solid #808080; background-color: #A6D7E1">
																		</td>
																	</tr>
																	<tr>
																		<td width="68" height="29" >
																			<font 
																				style="font-size: 9pt; font-weight: 700">&nbsp;
																				�� ��:</font>
																		</td>
																		<td width="180" height="29" colspan="2" align="left">
																			<input type="password" name="search.ppasswd"
																				id="ppasswd" size="24"
																				style="border: 1px solid #808080; background-color: #A6D7E1">
																		</td>
																	</tr>
																	<tr>
																		<td width="68" height="29" >
																			<font 
																				style="font-size: 9pt; font-weight: 700">&nbsp;
																				��֤��:</font>
																		</td>
																		<td width="79" height="29">
																			<input type="text" name="search.pverifycode"
																				id="pverifycode" size="8"
																				style="border: 1px solid #808080; background-color: #A6D7E1">
																		</td>
																		<td width="91" height="29">
																			<img border=0 width="60" height="18" src="/authimg"
																				id="imgcode" style="cursor: pointer;" border="0"
																				onClick="document.getElementById('imgcode').src='/authimg?action='+Math.random();"
																				title="�����壿����һ��" alt="�����壿����һ��" />
																	</tr>
																	<tr>
																		<td width="68" height="29">
																		</td>
																		<td width="180" height="29" colspan="2">
																			<span style="font-size: 9pt"> <input
																					type="button" onclick="javascript:login();"
																					value="�� ½" name="B1"
																					style="width: 44; height: 22; font-size: 12px; color: #6D6D6D; border-style: outset; border-width: 0px; background-image: url('images/denglu.gif'); background-position: left top">
																				<input type="button"
																					onclick="javascript:fun_forget();" value="��������"
																					name="B5"
																					style="width: 63; height: 22; font-size: 12px; color: #6D6D6D; border-style: outset; border-width: 0px; background-image: url('images/qingchu.gif'); background-position: left top">
																				<input type="button" onclick="javascript:regedit();"
																					value="ע ��" name="B4"
																					style="width: 44; height: 22; font-size: 12px; color: #6D6D6D; border-style: outset; border-width: 0px; background-image: url('images/denglu.gif'); background-position: left top">
																			</span>
																		</td>
																	</tr>
																</table>
															</s:form>
																</td>
															</tr>
														</table>
													</div>
													
													
													
													
													<div id="tab2" style="display: none">
														<table>
															<tr>
																<td>
																	2222
																</td>
															</tr>
														</table>
													</div>
													
													
													<div align="center" id="tab3" style="display: none">
														<table border="0" cellpadding="0"
															style="border-collapse: collapse" width="620"
															id="table37">
															<tr>
																<td height="20" width="80">
																</td>
																<td height="20" width="540" colspan="2">
																</td>
															</tr>
															<tr>
																<td height="67" width="80">
																	<font color="#5B6E75" style="font-size: 9pt">
																		���뵥�ţ�</font>
																</td>
																<td height="67" width="540" colspan="2" align="left">
																	<input type="text" name="mailNum" id="mailNum"
																		style="border: 1px solid #A8A8A8; background-color: #E0EFF6" />
																</td>
															</tr>
															
															<tr>
																<td width="80" height="34">
																</td>
																<td width="540" height="34" colspan="2">
																	<s:hidden name="emsCheckCode" id="emsCheckCode"></s:hidden>
																	<span style="font-size: 9pt"> <input
																			type="button" value="�� ѯ" name="B6"
																			onclick="javascript:checkEms();"
																			style="width: 44; height: 22; font-size: 12px; color: #6D6D6D; border-style: outset; border-width: 0px; background-image: url('images/denglu.gif'); background-position: left top">&nbsp;
</span>

																	</td>
															</tr>
															<tr>
																<td colspan="3">
																	<font color="#CE7000"> <span
																		style="font-size: 9pt"> ��ܰ��ʾ��EMS������Ϊ���ṩ����ݡ����Ի���
																	</span> </font>
																	<b> <font color="#005BAC" style="font-size: 9pt">
																			�ʼ�����</font> </b><font color="#CE7000"><span
																		style="font-size: 9pt"> �� </span> </font><b> <font
																		color="#005BAC" style="font-size: 9pt"> ����׷��</font> </b><font
																		color="#CE7000"><span style="font-size: 9pt">
																			��ѯ������񣬸Ͽ������롣</span> </font>
																</td>
															</tr>
														</table>
													</div>
														
													<div id="tab4" style="display: none">
														<table>
															<tr>
																<td>
																	4444
																</td>
															</tr>
														</table>
													</div>
													
														
													<div id="tab5" style="display: none">
														<table>
															<tr>
																<td>
																	55555
																</td>
															</tr>
														</table>
													</div>
													<div id="tab6" style="display: none">
														<table width="514" border="0" cellpadding="0"
															cellspacing="0">
															<tr>
																<td width="41%" height="10" align="left" valign="bottom"
																	nowrap="nowrap" class="txt-form-n-tt">
																	�ĳ�����ʡ��
																</td>
																<td width="39%" height="10" align="left" valign="bottom">
																	<span class="txt-form-n-tt">�Ʒ����������</span>
																</td>
																<td width="20%" rowspan="4" align="center">
																	<span class="unnamed2"> <input
																			onclick="makeRequest('http://www.ems.com.cn/tools/postageresult.jsp',1)"
																			type="button" value="��  ��" name="clickfee" /> </span>
																</td>
															</tr>
															<tr>
																<td width="41%" height="24" align="left" nowrap="nowrap"
																	class="txt-main">
																	<select name="addressfrom" id="addressfrom" isneed="Y"
																		fieldname="�ļ���ʡ��">
																		<option value="" selected="selected">
																			==�ļ���ʡ��==
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="�㶫">
																			�㶫
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="�ӱ�">
																			�ӱ�
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="������">
																			������
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="���ɹ�">
																			���ɹ�
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="�ຣ">
																			�ຣ
																		</option>
																		<option value="ɽ��">
																			ɽ��
																		</option>
																		<option value="ɽ��">
																			ɽ��
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="�Ϻ�">
																			�Ϻ�
																		</option>
																		<option value="�Ĵ�">
																			�Ĵ�
																		</option>
																		<option value="���">
																			���
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="�½�">
																			�½�
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="�㽭">
																			�㽭
																		</option>
																		<option value="����">
																			����
																		</option>
																	</select>
																</td>
																<td width="39%" height="24" align="left">
																	<span class="unnamed2"> <input name="weight"
																			id="weight" type="text" maxlength="7" size="18"
																			fieldname="�������" isneed="Y" checktype="number"
																			class="input1" /> </span>
																</td>
															</tr>
															<tr>
																<td width="41%" height="20" align="left" valign="bottom"
																	nowrap="nowrap">
																	<span class="txt-form-n-tt">�Ĵ�����ʡ��</span>
																</td>
																<td width="39%" align="left" valign="bottom">
																	<span class="txt-form-n-tt">������ (Ԫ)��</span>
																</td>
															</tr>
															<tr valign="bottom">
																<td width="41%" height="20" align="left"
																	class="unnamed2">
																	<select name="addressto" id="addressto" isneed="Y"
																		fieldname="�ռ���ʡ��">
																		<option value="" selected="selected">
																			==�ռ���ʡ��==
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="�㶫">
																			�㶫
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="�ӱ�">
																			�ӱ�
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="������">
																			������
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="����">
																			����
																		</option>

																		<option value="���ɹ�">
																			���ɹ�
																		</option>

																		<option value="����">
																			����
																		</option>

																		<option value="�ຣ">
																			�ຣ
																		</option>

																		<option value="ɽ��">
																			ɽ��
																		</option>


																		<option value="ɽ��">
																			ɽ��
																		</option>

																		<option value="����">
																			����
																		</option>

																		<option value="�Ϻ�">
																			�Ϻ�
																		</option>

																		<option value="�Ĵ�">
																			�Ĵ�
																		</option>

																		<option value="���">
																			���
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="�½�">
																			�½�
																		</option>
																		<option value="����">
																			����
																		</option>
																		<option value="�㽭">
																			�㽭
																		</option>
																		<option value="����">
																			����
																		</option>
																	</select>
																</td>
																<td width="39%" align="left" class="unnamed2">
																	<input readonly size="18" value="0" id="gofee"
																		name="gofee" class="input1" />
																</td>
															</tr>
															<tr valign="bottom">
																<td height="20" align="left" class="unnamed2">
																	&nbsp;&nbsp;
																	<!--<div id=process style="width: 300; height: 10"></div>-->
																</td>
																<td height="20" align="left" class="unnamed2">
																	&nbsp;
																	<span id="msg" class="txt-form-n-tt"></span>
																</td>
																<td align="left" class="unnamed2">
																	&nbsp;
																</td>
															</tr>

														</table>
													</div>
													
														
													<div id="tab7" style="display: none">
														<table>
															<tr>
																<td>7777 
																<br></td>
															</tr>
														</table>
													</div>
													
													
													
													
													
														</s:form>
												</td>
											</tr>
										</table>
									
								

								</td>
							</tr>
						</table>
				
			
			
			
			
			
			
			
			
			
			<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" id="table10" background="images/di.jpg" height="27">
				<tr>
					<td valign="middle"><span style="font-size: 4pt"><br>
					</span><span style="font-size: 9pt">&nbsp;<font color="#FFFFFF">All 
					rights reserved. 2009&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					����֧�� by </font><font color="#02687F">Ȫ���йڷ���Ϣ�Ƽ����޹�˾</font></span></td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</div>
</body>

</html>
