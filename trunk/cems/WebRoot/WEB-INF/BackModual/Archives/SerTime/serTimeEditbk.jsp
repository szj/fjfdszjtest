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
<form  method='POST' name='form1' action='/archives/serTime.do'  id="form1">
   <table width="90%" height="190" border="1">
   <tr>
   <td> 
       <strong>����ʱ��</strong>
   </td>
   </tr>
    <tr>
	<td>
		<s:actionerror theme="ems" />
		<s:actionmessage theme="ems" />
	</td>
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
   <td>����ʼʱ��:
   <s:textfield id="pserverstime"  name="search.pserverstime" value="%{serTime.SERVERSTIME}" readonly="true"></s:textfield>
    <div id="pserverstimeTip" style="display: inline "></div></td>
   </tr> 
    
   <tr> 
   <td>������ֹʱ��:
   <s:textfield id="pserveretime"  name="search.pserveretime" value="%{serTime.SERVERETIME}" readonly="true"></s:textfield>
   <div id="pserveretimeTip" style="display: inline "></div></td>
   </tr>    

   <tr>
   <td align="center">
      <s:hidden value="%{serTime.ID}" name="search.pid" id="pid"></s:hidden>
      <s:hidden value="%{action}" name="action" id="action"></s:hidden>
      <s:submit value="�� ��"></s:submit>
      &nbsp; &nbsp; &nbsp;<input type="reset"  id="btnreset"  name="btnreset" value="����"  />
      <input type="button" onclick="javascript:history.go(-1)" value="����"/>
      </td>
   </tr>
 </table>
</form>
</center>
<!-- �������ڿؼ�����֤ -->
<script defer="defer" src="<%=path%>/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<script language="javascript" src="<%=path%>/js/DateTimeMask.js" type="text/javascript"></script>
 <script type="text/javascript">
  //s:select id="pclientbalance"  name="search.pclientbalance" list="clientbalanceList" headerKey="-1" headerValue="---��ѡ��---" listKey="ID" listValue="NAME" key="ID">s:select
    //��֤
    $(document).ready(function(){
		$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){alert('ȷ�ϱ���');return true;}});
		$("#pserverstime").focus(function(){WdatePicker({skin:'whyGreen',dateFmt:'HH:mm:ss',oncleared:function(){$(this).blur();},onpicked:function(){$(this).blur();}})}).formValidator({onshow:"������ķ���ʼʱ��",onfocus:"�������ԤԼʱ��",oncorrect:"��"}).inputValidator({min:"00:00:00",max:"23:59:59",type:"time",onerror:"���ڱ�����\"1900-01-01\"��\"3000-01-01\"֮��"});//.defaultPassed();
		$("#pserveretime").focus(function(){WdatePicker({skin:'whyGreen',dateFmt:'HH:mm:ss',oncleared:function(){$(this).blur();},onpicked:function(){$(this).blur();}})}).formValidator({onshow:"������ķ������ʱ��",onfocus:"�������ԤԼʱ��",oncorrect:"��"}).inputValidator({min:"00:00:00",max:"23:59:59",type:"time",onerror:"���ڱ�����\"1900-01-01\"��\"3000-01-01\"֮��"});//.defaultPassed();
		$("#pprovince").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
		$("#pcity").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
		$("#pcounty").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
	});
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
document.getElementById('pprovince').value="350000";
<s:if test="%{action=='update'}">
document.getElementById('pprovince').value=<s:property value="%{serTime.PROVINCE}"/>;
</s:if>
changeCombo('pcity','pprovince','cityvalue');
<s:if test="%{action=='update'}">
document.getElementById('pcity').value=<s:property value="%{serTime.CITY}"/>;
</s:if>
changeCombo('pcounty','pcity','countyvalue');
<s:if test="%{action=='update'}">
document.getElementById('pcounty').value=<s:property value="%{serTime.COUNTY}"/>;
</s:if>
	</script>
</body>
</html>