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
   <table width="90%" height="190" border="1">
   <tr>
   <td> 
       <strong>�û����</strong>
   </td>
   </tr>
    <tr>
	<td width="20%">
		<s:actionerror theme="ems" />
		<s:actionmessage theme="ems" />
	</td>
  </tr>
   <tr>
      <td>�û�����
      		<s:property value="%{user.CODE}" />
      </td>
   </tr>

  <tr> 
   <td>����:
   <s:property value="%{user.NAME}"/>
   </td>
   </tr>
   
   <tr> 
   <td>�̶��绰:
   <s:property value="%{user.TEL}"/>
   </td>
   </tr>
   
   
   
   <tr> 
   <td>�ֻ�:
   <s:property value="%{user.MOBILE}"/>
   </td>
   </tr>

   <tr> 
   <td align="left">
		<font color="red">ѡ��</font>
   </td>
   </tr>
   <tr> 
   <td>��������:
   &nbsp;<s:property value="%{user.EMAIL}"/>
   </td>
   </tr>
   
   
   <tr>
   <td  align="left"><font color="red">�����Ա����</font></td>
   </tr>
  
   <tr> 
   <td>��λ����:
   	<s:textfield name="search.punit" id="punit" value="%{user.UNIT}" ></s:textfield>
   <div id="punitTip" style="display: inline "></div></td>
   </tr>
 
   <tr> 
   <td>��ַ:
                         ʡ��:
                       <select id="pprovince" name="search.pprovince" onchange="changeCombo('pcity','pprovince','cityvalue')">
						</select>
                        ���У�<select id="pcity" name="search.pcity"   onchange="changeCombo('pcounty','pcity','countyvalue')">
						</select>
					  �ء�����<select id="pcounty" name="search.pcounty" >
						</select>
   <div id="paddressTip" style="display: inline "></div></td>
   </tr>
   <tr> 
   <td>
      ��ϸ��ַ:
    <s:textfield id="paddress"  name="search.paddress" value="%{user.ADDRESS}"></s:textfield>
   </td>
   </tr>
   <tr> 
   <td>�ͻ�����:
   <select name="search.pclienttype" id="pclienttype">
 		<option value="">��ѡ��ͻ�����</option>
   		<s:iterator id="list"  value="%{clienttypeList}">
			<option value="<s:property value="#list.ID" />"  <s:if test="%{#list.ID==user.CLIENTTYPE}">selected</s:if> >
					<s:property value="#list.NAME" />
			</option>
		</s:iterator>
   </select>
   <div id="pclienttypeTip" style="display: inline "></div></td>
   </tr>  
 
   <tr> 
   <td>�ͻ�����:
   <s:textfield id="pclientcode"  name="search.pclientcode" value="%{user.CLIENTCODE}"></s:textfield>
   <div id="pclientcodeTip" style="display: inline "></div></td>
   </tr>   
 
   <tr> 
   <td>���㷽ʽ:
      <select name="search.pclientbalance" id="pclientbalance">
        <option value="">��ѡ����㷽ʽ</option>
   		<s:iterator id="list"  value="%{clientbalanceList}">
			<option value="<s:property value="#list.ID" />"  <s:if test="%{#list.ID==user.CLIENTBALANCE}">selected</s:if> >
					<s:property value="#list.NAME" />
			</option>
		</s:iterator>
	 </select>
   <div id="pclientbalanceTip" style="display: inline "></div></td>
   </tr>  
   
   <tr>
   <td align="center">
      <s:hidden value="%{user.ID}" name="search.pid" id="pid"></s:hidden>
      <input type="button" id="btnupdate" name="btnupdate"  onclick="javascript:save('update');"  value="�� ��"  />
      <s:if test="%{user.BILL_TYPE==0}">
      &nbsp; &nbsp; &nbsp;<input type="button" id="btnupdateauding" name="btnupdateauding"  onclick="javascript:save('saveauding');"  value="���沢���"  />
	  </s:if>
      &nbsp; &nbsp; &nbsp;<input type="reset"  id="btnreset"  name="btnreset" value="����"  />
      <input type="button" onclick="javascript:history.go(-1)" value="����"/>
      </td>
   </tr>
 </table>
</form>
</center>
 <script type="text/javascript">
    //��֤
    $(document).ready(function(){
		$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){alert('ȷ�ϱ���');return true;}});
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
		           $("#pclientbalance").val("1234");
			    }else{
			       $("#pclientcode").attr({"disabled":false});
		           $("#pclientbalance").attr({"disabled":false});
			    }
			    return true;
			}
		});
		
		//$("#pclientcode").formValidator({onfocus:"�ͻ�����",oncorrect:"��"}).regexValidator({regexp:"^\\S+$",onerror:"�ͻ����벻��Ϊ��,��ȷ��"});
		//$("#pclientbalance").formValidator({onfocus:"���㷽ʽ",oncorrect:"��"}).regexValidator({regexp:"^\\S+$",onerror:"���㷽ʽ����Ϊ��,��ȷ��"});
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