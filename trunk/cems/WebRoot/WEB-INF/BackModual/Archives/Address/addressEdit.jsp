<%@page contentType="text/html; charset=gbk"%>
<%@taglib uri="/WEB-INF/util.tld" prefix="qzgf"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
  //����ȫ�ֱ���
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<body>
<center>
<form  method='POST' name='form1' action='/archives/address.do'  id="form1">
  <table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" height="78%" id="table14">
									<tr>
										<td background="<%=basePath%>/images/frontlogin05.jpg" width="740" height="45" STYLE="background-repeat: no-repeat;">��</td>
									</tr>
									
									<tr>
										<td background="<%=basePath%>/images/frontlogin06.jpg" STYLE="background-repeat:  repeat-y;">
										<div align="center">
											<table  border="0" cellpadding="0" style="border-collapse: collapse" width="80%" height="100%" id="table15">
												<tr >
													<td width="98" height="37">
													<strong>
													<span style="font-size: 9pt">
													ȡ����ַ</span></strong></td>
													<td height="37">��</td>
												</tr>
												<tr align="left">
													<td width="98" height="16">
													<s:actionerror theme="ems" />
													&nbsp;<s:actionmessage theme="ems" />
													</td>
													<td height="16"></td>
												</tr>
												<TR align="left">
													    <TD rowSpan=2 width="95"><font size="2">��ַ:</font></TD>
													    <TD width="524"><font size="2">ʡ��: </font>
														<select id="pprovince" name="search.pprovince" onchange="changeCombo('pcity','pprovince','cityvalue')"></select>
														<font size="2"> ���У�</font>
														<select id="pcity" name="search.pcity" onchange="changeCombo('pcounty','pcity','countyvalue')"></select>
														<font size="2"> �ء�����</font>
														<select id="pcounty" name="search.pcounty"></select>
														<font size="2"> </font> </TD>
													    </TR>
												<TR align="left">
													    <TD width="524"><font size="2">��ϸ��ַ: </font> 
													    <s:textfield id="paddress"  name="search.paddress"  size="40" value="%{address.ADDRESS}" > </s:textfield>
														<font size="2"><FONT color=red>*</FONT> </font>
													<div id="paddressTip" style="display: inline "></div>	
													</TD>
												</TR>
												
												<tr align="left">
													<td width="98" align="left">
													<span style="FONT-SIZE: 9pt">
													�Ƿ�Ĭ�ϵ�ַ</span><span style="font-size: 9pt">��</span></td>
													<td align="left">
													<span style="font-size: 9pt">
														<select name="search.pischeck" id="pischeck">
												 		<option value="">��ѡ��</option>
												 		<option value="0" <s:if test="%{address.ISCHECK==0}">selected</s:if>>��</option>
												 		<option value="1" <s:if test="%{address.ISCHECK==1}">selected</s:if>>��</option>					 		
														</select>
												</span> <div id="pischeckTip" style="display: inline "></div></td>
												</tr>
												<tr>
													<td width="98">��</td>
													<td>��</td>
												</tr>
												<tr>
													<td width="98">
													<s:hidden value="%{address.ID}" name="search.pid" id="pid"></s:hidden>
      												<s:hidden value="%{action}" name="action" id="action"></s:hidden>
													��</td>
													<td align="left">
													<input type="button" onclick="javascript:save()" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
													<input type="button" onclick="javascript:reset()" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
												    <input type="button" onclick="javascript:history.go(-1)" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
													</td>
												</tr>
											</table>
										</div>
										</td>
									</tr>
									<tr>
										<td background="<%=basePath%>/images/frontlogin07.jpg" width="740" height="15" STYLE="background-repeat: no-repeat;">��</td>
									</tr>
	</table>
</form>
</center>
 <script type="text/javascript">
  //s:select id="pclientbalance"  name="search.pclientbalance" list="clientbalanceList" headerKey="-1" headerValue="---��ѡ��---" listKey="ID" listValue="NAME" key="ID">s:select
  	//��������
	function save(){
	    if($.formValidator.pageIsValid()){
			document.forms[0].submit();
		}else
		{
		  return false;
		}
	}
	
	 //��������
	function reset(){
			document.forms[0].reset();
			return true;
	}
 
    //��֤
    $(document).ready(function(){
		$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
		$("#paddress").formValidator({onfocus:"ȡ����ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ȡ����ַ����Ϊ��"});
		$("#pprovince").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
		$("#pcity").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��"});
		$("#pcounty").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��"});
		$("#pischeck").formValidator({onfocus:"�Ƿ�Ĭ�ϵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"�Ƿ�Ĭ�ϵ�ַ����Ϊ��"});
	});
	
//2009-12-01
//ʡ,��,������
//����˵��:chCombo�仯�ؼ���id
//		  srcCombo����仯�Ŀؼ�id
//		  action�¼�����
function changeComboex(chCombo,srcCombo,action)
{
	var cdsales=new ActiveXObject("Microsoft.XMLDOM"); //����XmlDom����
    cdsales.async=false; //ʹ���첽����
    var parmid='';
    if(srcCombo!='')
    {
      parmid=document.getElementById(srcCombo).value
    }
    cdsales.load("<%=path%>/archives/area.do?action="+action+"&search.pid="+parmid);
     var bi;
     if(cdsales.documentElement!=null)
         bi=cdsales.documentElement.selectNodes("NODE");
    if(bi!=null&&bi.length>0)
    {
       //Ĭ����
       document.getElementById(chCombo).options.length = bi.length+1;   
       document.getElementById(chCombo).options[0].value ="0";//����ֵ
	   document.getElementById(chCombo).options[0].text = "��ѡ��";//��ʾֵ
       for(var i=1;i<bi.length+1;i++){     
	   			document.getElementById(chCombo).options[i].value = bi[i-1].selectSingleNode("THE_CODE").text;//����ֵ
	   			document.getElementById(chCombo).options[i].text =  bi[i-1].selectSingleNode("THE_NAME").text;//��ʾֵ
       }
    }else{
       document.getElementById(chCombo).options.length = 1;   
       document.getElementById(chCombo).options[0].value ="0";//����ֵ
	   document.getElementById(chCombo).options[0].text = "��ѡ��";//��ʾֵ
    }
}

//2010-03-10
//ʡ,��,������,jqueryʵ��
//����˵��:chCombo�仯�ؼ���id
//		  srcCombo����仯�Ŀؼ�id
//		  action�¼�����
function changeCombo(chCombo,srcCombo,action)
{
	    var parmid='';
	    if(srcCombo!='')
	    {
	      parmid=document.getElementById(srcCombo).value
	    }
	    
		 $.ajax({
			 mode : "abort",
			 type : "get", 
			 async: false,
		     url:"<%=path%>/archives/area.do",
		     data : "action="+action+"&search.pid="+parmid,
		     dataType:"xml",
		     success:function(xml)
		     {
		          document.getElementById(chCombo).length=0;
		          document.getElementById(chCombo).options[0]=new Option('��ѡ��','0');    
		          $(xml).find("ROOT>NODE").each(
			            function(i){
				            var id=$(this).find("THE_CODE").text();
				            var name=$(this).find("THE_NAME").text(); 
				            document.getElementById(chCombo).options[i+1]=new Option(name,id);    
		            	}
		         )
		     }
	     });
}
//��ʼ����Ϣ
changeCombo('pprovince','','provincevalue');
//document.getElementById('pprovince').options[12].selected;
//Ĭ�ϸ���ʡ
document.getElementById('pprovince').value="350000";
<s:if test="%{action=='update'}">
document.getElementById('pprovince').value=<s:property value="%{address.PROVINCE}"/>;
</s:if>
changeCombo('pcity','pprovince','cityvalue');
<s:if test="%{action=='update'}">
document.getElementById('pcity').value=<s:property value="%{address.CITY}"/>;
</s:if>
changeCombo('pcounty','pcity','countyvalue');
<s:if test="%{action=='update'}">
document.getElementById('pcounty').value=<s:property value="%{address.COUNTY}"/>;
</s:if>
	</script>
</body>
</html>