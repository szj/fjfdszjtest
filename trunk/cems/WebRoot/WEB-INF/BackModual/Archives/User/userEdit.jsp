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
<form  method='POST' name='form1' action='/archives/user.do?action=update'  id="form1">
  <table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" height="78%" id="table14">
									<tr>
										<td background="<%=basePath%>/images/frontlogin05.jpg" width="740" height="45" STYLE="background-repeat: no-repeat;" >��</td>
									</tr>
									<tr>
										<td background="<%=basePath%>/images/frontlogin06.jpg" STYLE="background-repeat:  repeat-y;">
										<div align="center">
											<table  border="0" cellpadding="0" style="border-collapse: collapse" width="80%" height="100%" id="table15">
												<tr >
													<td width="98" height="37">
													<strong>
													<span style="font-size: 9pt">
													�û����</span></strong></td>
													<td height="37">��</td>
												</tr>
												<tr align="left">
													<td width="98" height="16">
													<s:actionerror theme="ems" />
													&nbsp;<s:actionmessage theme="ems" />
													</td>
													<td height="16"></td>
												</tr>
												<tr align="left">
													<td width="98">
													<span style="FONT-SIZE: 9pt">
													�û�����</span></td>
													<td><span style="font-size: 9pt"><s:property value="%{user.CODE}" /></span>��</td>
												</tr>
												<tr align="left">
													<td width="98">
													<span style="FONT-SIZE: 9pt">
													������</span></td>
													<td><span style="font-size: 9pt"><s:property value="%{user.NAME}"/></span></td>
												</tr>
												<tr align="left">
													<td width="98">
													<span style="FONT-SIZE: 9pt">
													�̶��绰��</span></td>
													<td><span style="font-size: 9pt"><s:property value="%{user.TEL}"/></span></td>
												</tr>
												<tr align="left">
													<td width="98" align="left">
													<span style="FONT-SIZE: 9pt">
													�ֻ�</span><span style="font-size: 9pt">��</span></td>
													<td align="left">
													<span style="font-size: 9pt">
													<s:property value="%{user.MOBILE}" /></span></td>
												</tr>
												<tr align="left">
													<td width="98">��</td>
													<td>��</td>
												</tr>
												<tr align="left">
													<td width="98">
													<font color="red">
													<span style="FONT-SIZE: 9pt">
													ѡ��</span></font></td>
													<td>��</td>
												</tr>
												
												<tr align="left">
													<td width="98">
													<span style="FONT-SIZE: 9pt">
													�������䣺</span></td>
													<td>
													<span style="font-size: 9pt">
													<s:property value="%{user.EMAIL}"/></span>
													</td>
												</tr>
												
												<tr align="left">
													<td width="98">
													<font color="red">
													<span style="FONT-SIZE: 9pt">
													�����Ա����</span></font></td>
													<td>��</td>
												</tr>
												
												<tr align="left">
													<td width="98">
													<span style="FONT-SIZE: 9pt">
													��λ���ƣ�</span></td>
													<td>
													<span style="font-size: 9pt">
														<s:textfield name="search.punit" id="punit" value="%{user.UNIT}" ></s:textfield></span>
														<div id="punitTip" style="display: inline "></div>
													</td>
												</tr>
												
											  <TR align="left" style="font-size: 9pt">
											    <TD rowSpan=2 width="95"><font size="2">��ַ:</font></TD>
											    <TD width="700">ʡ��:
												<select id="pprovince" name="search.pprovince" onchange="changeCombo('pcity','pprovince','cityvalue')"></select>
												 ����:
												<select id="pcity" name="search.pcity" onchange="changeCombo('pcounty','pcity','countyvalue')"></select>
												�ء���:
												<select id="pcounty" name="search.pcounty"></select>
												</TD>
											    </TR>
											  <TR align="left">
											    <TD width="700"><font size="2">��ϸ��ַ: </font> 
											    <s:textfield id="paddress"  name="search.paddress" value="%{user.ADDRESS}"  size="50"> </s:textfield>
												<font size="2"><FONT color=red>*</FONT> </font>
											<div id="paddressTip" style="display: inline "></div>	
											</TD>
												
												</TR>
																							
												<tr align="left">
													<td width="98">
													<span style="FONT-SIZE: 9pt">
													�ͻ����ͣ�</span></td>
													<td>
													<span style="font-size: 9pt">
													<select name="search.pclienttype" id="pclienttype">
												 		<option value="">��ѡ��ͻ�����</option>
												   		<s:iterator id="list"  value="%{clienttypeList}">
															<option value="<s:property value="#list.ID" />"  <s:if test="%{#list.ID==user.CLIENTTYPE}">selected</s:if> >
																	<s:property value="#list.NAME" />
															</option>
														</s:iterator>
												   </select>
					  								 </span>
					  								 <div id="pclienttypeTip" style="display: inline "></div>
													</td>
												</tr>
												
												
												
												<tr align="left">
													<td width="98">
													<span style="FONT-SIZE: 9pt">
													�ͻ����룺</span></td>
													<td>
													<span style="font-size: 9pt">
													 <s:textfield id="pclientcode"  name="search.pclientcode" value="%{user.CLIENTCODE}"></s:textfield></span>
													 <div id="pclientcodeTip" style="display: inline "></div>
													</td>
												</tr>
												
												<tr align="left">
													<td width="98">
													<span style="FONT-SIZE: 9pt">
													���㷽ʽ��</span></td>
													<td>
													<span style="font-size: 9pt">
													<select name="search.pclientbalance" id="pclientbalance">
												        <option value=" ">��ѡ����㷽ʽ</option>
												   		<s:iterator id="list"  value="%{clientbalanceList}">
															<option value="<s:property value="#list.ID" />"  <s:if test="%{#list.ID==user.CLIENTBALANCE}">selected</s:if> >
																	<s:property value="#list.NAME" />
															</option>
														</s:iterator>
													 </select>
													 </span>
													 <div id="pclientbalanceTip" style="display: inline "></div>
													</td>
												</tr>
												
												<tr>
													<td width="98">��</td>
													<td>��</td>
												</tr>
												<tr>
													<td width="98"> <s:hidden value="%{user.ID}" name="search.pid" id="pid"></s:hidden>��</td>
													<td align="left">
													<input type="button" onclick="javascript:save('update')" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
													<s:if test="%{user.BILL_TYPE==0}">
													<input type="button" onclick="javascript:save('saveauding')" value="�������" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
													</s:if>
													<input type="button" onclick="javascript:reset()" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
												    <input type="button" onclick="javascript:history.go(-1)" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
													</td>
												</tr>
											</table>
										</div>
										</td>
									</tr>
									<tr>
										<td background="<%=basePath%>/images/frontlogin07.jpg" width="740" height="15" STYLE="background-repeat: no-repeat;" >��</td>
									</tr>
								</table>
</form>
</center>
 <script type="text/javascript">
    //��֤
    $(document).ready(function(){
		$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
		$("#pprovince").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
		$("#pcity").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
		$("#pcounty").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
		$("#paddress").formValidator({onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
	    //�ͻ�����, �ͻ�����-���㷽ʽ�Ĺ�ϵ
		$("#pclienttype").formValidator({onfocus:"�ͻ�����",oncorrect:"��"}).inputValidator({min:1,onerror:"�ͻ����Ͳ���Ϊ��,��ȷ��"}).functionValidator({
		    fun:function(val,elem){
		        if(val=="1001"){
		           $("#pclientcode").attr({"disabled":true});
		           $("#pclientbalance").attr({"disabled":true});
		           $("#pclientcode").val(" ");
		           $("#pclientbalance").val(" ");
			    }else{
			       $("#pclientcode").attr({"disabled":false});
		           $("#pclientbalance").attr({"disabled":false});
		           $("#pclientbalance").formValidator({onfocus:"���㷽ʽ",oncorrect:"��"}).inputValidator({min:1,onerror:"���㷽ʽ����Ϊ��"});
			    }
			    return true;
			}
		});
		
		//$("#pclientcode").formValidator({onfocus:"�ͻ�����",oncorrect:"��"}).regexValidator({regexp:"^\\S+$",onerror:"�ͻ����벻��Ϊ��,��ȷ��"});
		
	});
	//��������
	function save(action){
	    if($.formValidator.pageIsValid("1")){
			var url ='<%=path%>/archives/user.do?action='+action;
			document.forms[0].action=url;
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
//2009-12-01
//ʡ,��,������
//����˵��:chCombo�仯�ؼ���id
//		  srcCombo����仯�Ŀؼ�id
//		  action�¼�����
function changeCombo(chCombo,srcCombo,action)
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
//��ʼ����Ϣ
changeCombo('pprovince','','provincevalue');
//document.getElementById('pprovince').options[12].selected;
//Ĭ�ϸ���ʡ
var tmp=<s:property value="%{user.PROVINCE}"/>;
if(tmp=="")
{
 tmp=350000;
}
document.getElementById('pprovince').value=tmp;
changeCombo('pcity','pprovince','cityvalue');
document.getElementById('pcity').value= <s:property value="%{user.CITY}"/>;
changeCombo('pcounty','pcity','countyvalue');
document.getElementById('pcounty').value=<s:property value="%{user.COUNTY}"/>;
	</script>
</body>
</html>