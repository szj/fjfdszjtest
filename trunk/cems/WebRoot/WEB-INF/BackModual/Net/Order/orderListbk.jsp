<%@page contentType="text/html; charset=gbk"%>
<%@taglib uri="/WEB-INF/util.tld" prefix="qzgf"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//����ȫ�ֱ���
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<script type="text/javascript" src="<%=path%>/js/comm.js"></script>
		<link href="<%=path%>/css/mapFortune.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/css1.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=path%>/js/pageList.js"></script>
	</head>
	<body>
<center>
<s:form method='POST' name='form1'  id="form1" enctype="multipart/form-data" tooltipConfig="#{'jsTooltipEnabled':'true'}">
   <table width="95%" height="190" cellspacing=0 cellpadding="0" border="0" class="tableex">
   <tr class="trex">
   <td class="tdex"> 
       <strong>���ϼļ�</strong>
   </td>
   </tr>
   <tr class="trex">
    <td class="tdex">
		<s:actionerror theme="ems" />
		<s:actionmessage theme="ems" />
   </td>
   </tr>
   <tr class="trex"> 
     <td align="left" class="tdex">
     <font color="red">����</font>
     </td>
   </tr>

   <tr class="trex" align="left">
   <td class="tdex">
   <input type="button" onclick="javascript:ClientList('<%=path%>')" value="��ϵ��" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
   <s:textfield id="pname"  name="search.pname" value="%{order.NAME}" size="4"></s:textfield>
   &nbsp;�ֻ�:
   <s:textfield id="pmobile"  name="search.pmobile" value="%{order.MOBILE}" size="9"></s:textfield>
   &nbsp;�̶��绰:
   <s:textfield id="ptel"  name="search.ptel" value="%{order.TEL}" size="9"  title="(��:059512345678)" ></s:textfield>
   &nbsp;��λ��ַ:
   <s:textfield id="punit"  name="search.punit" value="%{order.UNIT}" size="15"  ></s:textfield>
     <div id="pnameTip" style="display: inline "></div>
      &nbsp;<div id="pmobileTip" style="display: inline "></div>
      &nbsp;<div id="ptelTip" style="display: inline "></div>
      &nbsp;<div id="punitTip" style="display: inline "></div>
   </td>
   </tr>  
<tr id="clientTr" style="display:none">
						<td colspan="3" style="border-width : 0px;" ><div id="clientList"></div></td>
</tr>
   <tr class="trex" align="left">
   <td class="tdex">
   <input type="button" onclick="javascript:AddressList('<%=path%>')" value="ȡ����ַ" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
   <s:hidden value="%{order.ADDRESSID}" name="search.paddressid" id="paddressid"></s:hidden>
        <s:hidden value="%{order.PROVINCE}" name="search.pprovince" id="pprovince"></s:hidden>
        <s:hidden value="%{order.CITY}" name="search.pcity" id="pcity" ></s:hidden>
        <s:hidden value="%{order.COUNTY}" name="search.pcounty" id="pcounty" ></s:hidden>
    <s:textfield id="lprovince"  name="search.lprovince" value="%{order.PROVINCENAME}" readonly="true" size="9"></s:textfield>
     <s:textfield id="lcity"  name="search.lcity" value="%{order.CITYNAME}" readonly="true" size="9"></s:textfield> 
     <s:textfield id="lcounty"  name="search.lcounty" value="%{order.COUNTYNAME}" readonly="true" size="9"></s:textfield>
   <s:textfield id="paddress"  name="search.paddress" value="%{order.ADDRESS}" readonly="true" size="40"></s:textfield>
   <div id="paddressTip"></div>   
   </td>
   </tr>
   <tr id="trId" style="display:none">
						<td colspan="3" style="border-width : 0px;" ><div id="addressList"></div></td>
					</tr>
   <tr class="trex">
   <td class="tdex">�ʼ�����:
   <select name="search.pmailtype" id="pmailtype">
 		<option value="-1">��ѡ��</option>
 		<option value="0" <s:if test="%{order.MAILTYPE==0}">selected</s:if>>��Ʒ��</option>
 		<option value="1" <s:if test="%{order.MAILTYPE==1}">selected</s:if>>�ļ���</option>
   </select>
   <div id="pmailtypeTip"></div>
   </td>
   </tr>
   
   <tr class="trex"> 
     <td align="left" class="tdex">
     <font color="red">ѡ��</font>
     </td>
   </tr>
   <tr class="trex">
	    <td class="tdex">
	    ����Ҫ��:
	   <s:textfield  id="pclientremark"  name="search.pclientremark" value="%{order.CLIENTREMARK}"  cssStyle="width:80%"></s:textfield>
	   <div id="pclientremarkTip"  ></div>
	    </td>
   </tr>
   <tr class="trex"> 
   <td class="tdex">ԤԼʱ��:
   <s:textfield id="pbookingtime"  name="search.pbookingtime" value="%{order.BOOKINGTIME}" readonly="true"></s:textfield>(ע:��ѡ��Ϊ������������)
   <div id="pbookingtimeTip"  ></div>
   </td>
   </tr>   
   <tr class="trex"> 
   <td class="tdex">�ļ�����:
   <s:textfield id="porderingnum"  name="search.porderingnum" value="%{order.ORDERINGNUM}"></s:textfield>
   &nbsp;��Ʒ����:
   <s:textfield id="porderingweight"  name="search.porderingweight" value="%{order.ORDERINGWEIGHT}"></s:textfield>(ǧ��)(ע:�����ʼ�������)
     <div id="porderingnumTip" style="display: inline " ></div>
     &nbsp; <div id="porderingweightTip" style="display: inline " ></div> 
   </td>
   </tr>
   <tr class="trex"> 
   <td align="left" class="tdex">
     Ŀ�ĵ�&nbsp;&nbsp;&nbsp;:                    
                       <select id="precprovince" name="search.precprovince" onchange="changeCombo('preccity','precprovince','cityvalue')">
						</select>ʡ
                       <select id="preccity" name="search.preccity">
						</select>��
  <div id="precaddressTip"  ></div>						
   </td>
   </tr>
   
      
   <tr class="trex">
   <td style="text-align:center;" class="tdex">
      <s:if test="%{action=='insert'}">
      <s:hidden value="1" name="checkdate" id="checkdate"></s:hidden>
      </s:if>
      <s:else>
      <s:hidden value="0" name="checkdate" id="checkdate"></s:hidden>
      </s:else>
      <s:hidden value="%{order.ID}" name="search.pid" id="pid"></s:hidden>
      <s:if test="%{order.ORDERINGVALUE.substring(7,8)==1}">
			<input type="button" id="btnupdate" name="btnupdate"  onclick="javascript:save('<s:property value="%{action}"/>');"  value="�� ��"  alt="���涩��" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'"  />
	  </s:if>
	  <s:if test="%{order.ORDERINGVALUE.substring(8,9)==1}">
 	        &nbsp; &nbsp; &nbsp;<input type="button" id="btnupdateauding" name="btnupdateauding"  onclick="javascript:save('clientsaveadd');"  value="����ļ�" alt="���涩����֪ͨEMS����ȡ��" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'"  />
 	  </s:if>
      &nbsp; &nbsp; &nbsp;<input type="reset"  id="btnreset"  name="btnreset" value="����"  class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'"  /></td>
   </tr>
 </table>
</s:form>
</center>	
		<div id="f_bg">
			<div id="f_tabs">
				<ul>
					<li id="tab1" class="f_tabClass1">
						<a href="javascript:;" onclick="loadDefaultList('<%=path%>/net/order.do?action=listdetail&search.porderingstate=�ȴ��ļ�',1,3);">�ȴ��ļ�</a>
					</li>
					<li id="tab2" class="f_tabClass2">
						<a href="javascript:;" onclick="loadDefaultList('<%=path%>/net/order.do?action=listdetail&search.porderingstate=���ճɹ�',2,3);">���ճɹ�</a>
					</li>
					<li id="tab3" class="f_tabClass2">
						<a href="javascript:;" onclick="loadDefaultList('<%=path%>/net/order.do?action=listdetail',3,3);">ȫ��</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="f_main">
			<div id="defaultlist"></div>
		</div>
<!-- �������ڿؼ�����֤ -->
<script defer="defer" src="<%=path%>/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<script language="javascript" src="<%=path%>/js/DateTimeMask.js" type="text/javascript"></script>		
<script language="javascript" type="text/javascript">	
		    //����Ĭ��ҳ��    
		    $(document).ready(function(){
		    //Ĭ�ϼ���ҳ��
		    loadDefaultList('<%=path%>/net/order.do?action=listdetail&search.porderingstate=�ȴ��ļ�',1,3);
		    //��֤	
		$.formValidator.initConfig({formid:"form1",onerror:function(msg){jAlert(msg,'��ʾ')},onsuccess:function(){
			if($('#checkdate').val()==1)
			{
				alert('ȷ�ϱ���');
				return true;
			}else
			{
				alert('������ѡ��ԤԼʱ��');
				return false;
			}
		}});
		
		$("#pname").formValidator({onfocus:"���20�ַ�",oncorrect:"��"}).inputValidator({min:1,max:20,onerror:"�����Ƿ�"});
		$("#ptel").formValidator({onfocus:"�绰�����С��ͨ,��059512345678",oncorrect:"��"}).regexValidator({regexp:"^\\d{10,12}$",onerror:"�绰�����ʽ����ȷ"});
		$("#pmobile").formValidator({onfocus:"11λ�ֻ���",oncorrect:"��"}).regexValidator({regexp:"mobile",datatype:"enum",onerror:"�ֻ��Ų���ȷ"});
		$("#paddress").formValidator({onfocus:"ȡ����ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ȡ����ַ����Ϊ��"});
		$("#pmailtype").formValidator({onfocus:"�ʼ�����",oncorrect:"��"}).inputValidator({min:1,onerror:"�ʼ����಻��Ϊ��"});

		
		$("#pbookingtime").focus(function(){WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d',maxDate:'%y-%M-\#{%d+1}',oncleared:function(){$('#checkdate').val('1');$(this).blur();},onpicked:function(){
					$(this).blur();
					$.ajax(
					{	
						mode : "abort",
						type : "get", 
						url : "<%=path%>/archives/serTime.do", 
						data : "action=serTimeVerify&search.pbookingtime=" + $("#pbookingtime").val()+"&search.pprovince="+$("#pprovince").val()+"&search.pcity="+$("#pcity").val()+"&search.pcounty="+$("#pcounty").val(),
						dataType : "xml",
						success : function(data){
						    root = data.documentElement;
						    var rowSet = root.selectNodes("//result");
				            if( rowSet.item(0).selectSingleNode("value").text == "0" )
							{
								$('#pbookingtimeTip').show();
								$('#pbookingtimeTip').html("У��ʧ��");
				                return false;
							}
				            else
							{
							    $('#pbookingtimeTip').hide();
				                $('#checkdate').val('1');
				                return true;
							}
						},
						complete : function(){
							$("#btnupdate").attr({"disabled":false});
							$("#btnupdateauding").attr({"disabled":false});
						}, 
						beforeSend : function(xhr){
							$("#btnupdate").attr({"disabled":true});
							$("#btnupdateauding").attr({"disabled":true});
							$('#checkdate').val('0');
							$('#pbookingtimeTip').show();
							$('#pbookingtimeTip').html("����У��");
						}, 
						error : function(){
						     $('#pbookingtimeTip').show();
						     $('#pbookingtimeTip').html("������æ");
						     alert("������æ");
						}
					});	
		}})}).formValidator({onshow:"������",onfocus:"������",oncorrect:"��"});
	   	
	
		$("#porderingnum").formValidator({onfocus:"�ļ�����",oncorrect:"��"}).regexValidator({regexp:"intege1",datatype:"enum",onerror:"�ļ�������ʽ����ȷ"});
		$("#porderingweight").formValidator({onfocus:"��Ʒ����",oncorrect:"��"}).regexValidator({regexp:"decmal4ex",datatype:"enum",onerror:"��Ʒ������ʽ����ȷ"});
		$("#pclientremark").formValidator({onfocus:"�ͻ�Ҫ��",oncorrect:"��"});
		$("#precprovince").formValidator({tipid:"precaddressTip",onfocus:"�ռ�ͨ�ŵ�ַ",oncorrect:"��"});
		$("#preccity").formValidator({tipid:"precaddressTip",onfocus:"�ռ�ͨ�ŵ�ַ",oncorrect:"��"});

		//Ĭ�ϹرնԻ���
		$('#dialog').dialog('close');
	});
	
	//��������
	function save(action){
	    if($.formValidator.pageIsValid()){
			var url ='<%=path%>/net/order.do?action='+action;
			document.forms[0].action=url;
			document.forms[0].submit();
		}else
		{
		  return false;
		}
	}
	
	//����iframe���(ȡ����ַ)
	function Addressiframe(){
        if ($("#addressdialog").length == 0){
	    	$("body").append(' <div id="addressdialog" title="ȡ����ַ��Ϣ�б�"> '+
	    	'<iframe src="<%=path%>/archives/address.do?action=frame"  id = "addressframe" width="700" height="300"></iframe>'+
	    	'</div>	');  
	    	
	    	$("#addressdialog").dialog({
				bgiframe: true,
				autoOpen: false,
				width: 700,
				height: 300,
				modal: true,
				buttons: {
					'ȷ��': function() {
					   if(addressframe.document.all.frmid.value!=""){
						   //��������
						   $("#paddressid").val(addressframe.document.all.frmid.value);
						   $("#pprovince").val(addressframe.document.all.frmprovince.value);
						   //alert($("#pprovince").val());
						   $("#lprovince").val(addressframe.document.all.frmprovincename.value);
						   $("#pcity").val(addressframe.document.all.frmcity.value);
						   $("#lcity").val(addressframe.document.all.frmcityname.value);
						   $("#pcounty").val(addressframe.document.all.frmcounty.value);
						   $("#lcounty").val(addressframe.document.all.frmcountyname.value);
						   $("#paddress").val(addressframe.document.all.frmaddress.value);
					   }else
					   {
					       jAlert('��ѡ��һ����¼','��ʾ');
					   }
					   $(this).dialog('close');
					},
					'ȡ��': function() {
						$(this).dialog('close');
					}
				},
				close: function() {
					//allFields.val('').removeClass('ui-state-error');
				}
		   });
    	} 
    	//��ʾ
		 $('#addressdialog').dialog('open');
	}
	
	
	
	//����iframe���(ȡ����ϵ��)
	function Clientiframe(){
        if ($("#clientMsgdialog").length == 0){
	    	$("body").append(' <div id="clientMsgdialog" title="ȡ������Ϣ�б�"> '+
	    	'<iframe src="<%=path%>/archives/clientMsg.do?action=frame"  id = "clientMsgframe" width="700" height="300"></iframe>'+
	    	'</div>	');  
	    	
	    	$("#clientMsgdialog").dialog({
				bgiframe: true,
				autoOpen: false,
				width: 700,
				height: 300,
				modal: true,
				buttons: {
					'ȷ��': function() {
					   if(clientMsgframe.document.all.frmid.value!=""){
						   //��������
						   //$("#pname").val(clientMsgframe.document.all.frmid.value);
						   $("#pname").val(clientMsgframe.document.all.frmname.value);
						   $("#pmobile").val(clientMsgframe.document.all.frmmobile.value);
						   $("#punit").val(clientMsgframe.document.all.frmunit.value);
						   //$("#pareacode").val(clientMsgframe.document.all.frmareacode.value);
						   $("#ptel").val(clientMsgframe.document.all.frmtel.value);
					   }else
					   {
					       jAlert('��ѡ��һ����¼','��ʾ');
					   }
					   $(this).dialog('close');
					},
					'ȡ��': function() {
						$(this).dialog('close');
					}
				},
				close: function() {
					//allFields.val('').removeClass('ui-state-error');
				}
		   });
    	} 
    	//��ʾ
		 $('#clientMsgdialog').dialog('open');
	}


//����iframe���(ȡ����ַ)
		function ClientList(path){
			$("#clientTr").show();
			 $("#clientList").show() ;
		  	$('#clientList').html("<center>ҳ��������...</center>"); 
		  	var urls1 = getActionMappingURL("/archives/clientMsg",path);
		  	$.get(urls1,{action:'frame',date:new Date()},showResult);
		  	function showResult(res){
			  $('#clientList').html(res); 
		  	}
		}
		
		//����iframe���(ȡ����ַ)
	function AddressList(path){
		$("#trId").show();
		 $("#addressList").show() ;
		 
	  	$('#addressList').html("<center>ҳ��������...</center>"); 
	  var urls1 = getActionMappingURL("/archives/address",path);
	  $.get(urls1,{action:'frame',date:new Date()},showResult);
	  function showResult(res){
		  $('#addressList').html(res); 
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
//��ʼ����Ϣ(ȡ����ַ)
changeCombo('precprovince','','provincevalue');
//document.getElementById('pprovince').options[12].selected;
//Ĭ�ϸ���ʡ
//var tmp=<s:property value="%{order.RECPROVINCE}"/>;
document.getElementById('precprovince').value=350000;
<s:if test="%{order.RECPROVINCE==''}">
</s:if>
<s:else>
document.getElementById('precprovince').value=<s:property value="%{order.RECPROVINCE}"/>;
</s:else>
changeCombo('preccity','precprovince','cityvalue');
<s:if test="%{order.RECCITY==''}">
</s:if>		
<s:else>
document.getElementById('preccity').value=<s:property value="%{order.RECCITY}"/>;
</s:else>    
</script>		    		
	</body>
</html>