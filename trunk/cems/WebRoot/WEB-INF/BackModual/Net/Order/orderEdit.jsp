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
<script type="text/javascript" src="<%=path%>/js/comm.js"></script>
<html>
	<body>

		<center>
			<form method='POST' name='form1'
				action='/archives/user.do?action=update' id="form1">
				<table width="90%" height="190" border="1">
					<tr>
						<td colspan="3">
							<strong>���ϼļ�</strong>
						</td>
					</tr>
					<tr>
						<td>
							<s:actionerror theme="ems" />
						</td>
						<td>
							<s:actionmessage theme="ems" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" onclick="javascript:ClientList('<%=path%>')" value="��ϵ��"/>
						</td>
						<td>
							<s:textfield id="pname" name="search.pname" value="%{order.NAME}"></s:textfield>
							<font color="red">*</font>
						</td>
						<td>
							<div id="pnameTip" style="width: 250px"></div>
						</td>
					</tr>
					<tr id="clientTr" style="display:none">
						<td colspan="3"><div id="clientList"></div></td>
					</tr>
					<tr>
						<td>
							�̶��绰:
						</td>
						<td>
							����:
							<s:textfield id="pareacode" name="search.pareacode"
								value="%{order.AREACODE}"></s:textfield>
							<font color="red">*</font> �绰����:
							<s:textfield id="ptel" name="search.ptel" value="%{order.TEL}"></s:textfield>
							<font color="red">*</font>
						</td>
						<td>
							<div id="ptelTip" style="width: 250px"></div>
						</td>
					</tr>

					<tr>
						<td>
							�ֻ�:
						</td>
						<td>
							<s:textfield id="pmobile" name="search.pmobile"
								value="%{order.MOBILE}"></s:textfield>
							<font color="red">*</font>
						</td>
						<td>
							<div id="pmobileTip" style="width: 250px"></div>
						</td>
					</tr>

					<tr>
						<td>
							��λ��ַ:
						</td>
						<td>
							<s:textfield id="punit" name="search.punit" value="%{order.UNIT}"></s:textfield>
							<font color="red">*</font>
						</td>
						<td>
							<div id="punitTip" style="width: 250px"></div>
						</td>
					</tr>

					<tr>
						<td rowspan="2">
							<input type="button" onclick="javascript:AddressList('<%=path%>')" value="ȡ����ַ"/>
						</td>
						<td>
							<s:hidden value="%{order.ADDRESSID}" name="search.paddressid"
								id="paddressid"></s:hidden>
							ʡ��:
							<s:textfield id="lprovince" name="search.lprovince"
								value="%{order.PROVINCENAME}"></s:textfield>
							<s:hidden value="%{order.PROVINCE}" name="search.pprovince"
								id="pprovince"></s:hidden>
							���У�
							<s:textfield id="lcity" name="search.lcity"
								value="%{order.CITYNAME}"></s:textfield>
							<s:hidden value="%{order.CITY}" name="search.pcity" id="pcity"></s:hidden>
							�ء�����
							<s:textfield id="lcounty" name="search.lcounty"
								value="%{order.COUNTYNAME}"></s:textfield>
							<s:hidden value="%{order.COUNTY}" name="search.pcounty"
								id="pcounty"></s:hidden>
						</td>
						<td rowspan="2">
							<div id="paddressTip" style="width: 250px"></div>
						</td>
					</tr>
					
					<tr>
						<td>
							��ϸ��ַ:
							<s:textfield id="paddress" name="search.paddress"
								value="%{order.ADDRESS}"></s:textfield>
							<font color="red">*</font>
						</td>
					</tr>
					
					<tr id="trId" style="display:none">
						<td colspan="3"><div id="addressList"></div></td>
					</tr>

					<tr>
						<td>
							�ʼ�����:
						</td>
						<td>
							<select name="search.pmailtype" id="pmailtype">
								<option value="-1">
									��ѡ��
								</option>
								<option value="0"
									<s:if test="%{order.MAILTYPE==0}">selected</s:if>>
									��Ʒ��
								</option>
								<option value="1"
									<s:if test="%{order.MAILTYPE==1}">selected</s:if>>
									�ļ���
								</option>
							</select>
							<font color="red">*</font>
						</td>
						<td>
							<div id="pmailtypeTip" style="width: 250px"></div>
						</td>
					</tr>

					<tr>
						<td>
							ԤԼʱ��:
						</td>
						<td>
							<s:textfield id="pbookingtime" name="search.pbookingtime"
								value="%{order.BOOKINGTIME}" readonly="true"></s:textfield>
							<font color="red">*</font>
						</td>
						<td>
							<div id="pbookingtimeTip" style="width: 250px"></div>
						</td>
					</tr>

					<tr>
						<td>
							�ļ�����:
						</td>
						<td>
							<s:textfield id="porderingnum" name="search.porderingnum"
								value="%{order.ORDERINGNUM}"></s:textfield>
							<font color="red">*</font>
						</td>
						<td>
							<div id="porderingnumTip" style="width: 250px"></div>
						</td>
					</tr>

					<tr>
						<td>
							��Ʒ����:
						</td>
						<td>
							<s:textfield id="porderingweight" name="search.porderingweight"
								value="%{order.ORDERINGWEIGHT}"></s:textfield>
							(ǧ��)
							<font color="red">*</font>
						</td>
						<td>
							<div id="porderingweightTip" style="width: 250px"></div>
						</td>
					</tr>

					<tr>
						<td>
							�ͻ�Ҫ��:
						</td>
						<td>
							<s:textfield id="pclientremark" name="search.pclientremark"
								value="%{order.CLIENTREMARK}"></s:textfield>
							<font color="red">*</font>
						</td>
						<td>
							<div id="pclientremarkTip" style="width: 250px"></div>
						</td>
					</tr>

					<tr>
						<td>
							�ռ��˵�ַ:
						</td>
						<td>
							ʡ��:
							<select id="precprovince" name="search.precprovince"
								onchange="changeCombo('preccity','precprovince','cityvalue')">
							</select>
							���У�
							<select id="preccity" name="search.preccity">
							</select>
						</td>
						<td>
							<div id="precaddressTip" style="width: 250px"></div>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<s:hidden value="%{order.ID}" name="search.pid" id="pid"></s:hidden>
							<input type="button" id="btnupdate" name="btnupdate"
								onclick="javascript:save('<s:property value="%{action}"/>');"
								value="�� ��" />
							&nbsp; &nbsp; &nbsp;
							<input type="button" id="btnupdateauding" name="btnupdateauding"
								onclick="javascript:save('send');" value="���沢�ļ�" />
							&nbsp; &nbsp; &nbsp;
							<input type="reset" id="btnreset" name="btnreset" value="����" />
						</td>
					</tr>
				</table>
			</form>
		</center>
		<!-- �������ڿؼ�����֤ -->
		<script defer="defer" src="<%=path%>/js/datepicker/WdatePicker.js"
			type="text/javascript"></script>
		<script language="javascript" src="<%=path%>/js/DateTimeMask.js"
			type="text/javascript"></script>
		<script language="javascript" src="<%=path%>/js/formValidatorRegex.js"
			type="text/javascript"></script>
		<script type="text/javascript">
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
  //s:select id="pclientbalance"  name="search.pclientbalance" list="clientbalanceList" headerKey="-1" headerValue="---��ѡ��---" listKey="ID" listValue="NAME" key="ID">s:select
    //��֤
    $(document).ready(function(){
		$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){alert('ȷ�ϱ���');return true;}});
		$("#pname").formValidator({onfocus:"���20���ַ�",oncorrect:"��"}).inputValidator({min:1,max:20,onerror:"�����Ƿ�,��ȷ��"});
		$("#pareacode").formValidator({tipid:"ptelTip",onfocus:"��������3λ��4λ����",oncorrect:"��"}).regexValidator({regexp:"^\\d{3,4}$",onerror:"�������Ų���ȷ"});
		$("#ptel").formValidator({onfocus:"�绰�����С��ͨ",oncorrect:"��"}).regexValidator({regexp:"tel",datatype:"enum",onerror:"�绰�����ʽ����ȷ"});
		$("#pmobile").formValidator({onfocus:"�ֻ���",oncorrect:"��"}).regexValidator({regexp:"mobile",datatype:"enum",onerror:"�ֻ������ʽ����ȷ"});
		$("#paddress").formValidator({onfocus:"ȡ����ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ȡ����ַ����Ϊ��,��ȷ��"});
		$("#pmailtype").formValidator({onfocus:"�ʼ�����",oncorrect:"��"}).inputValidator({min:1,onerror:"�ʼ����಻��Ϊ��,��ȷ��"});
<<<<<<< .mine
		/*$("#pbookingtime").focus(function(){WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d',maxDate:'%y-%M-\#{%d+1}',oncleared:function(){$(this).blur();},onpicked:function(){$(this).blur();}})}).formValidator({onshow:"�������ԤԼʱ��",onfocus:"�������ԤԼʱ��",oncorrect:"��"}).inputValidator({min:"2008-01-01 00:00:00",max:"2010-01-01 23:59:59",type:"datetime",onerror:"���ڱ�����\"1900-01-01\"��\"3000-01-01\"֮��"})//;//.defaultPassed();
=======
		$("#pbookingtime").focus(function(){WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d',maxDate:'%y-%M-\#{%d+1}',oncleared:function(){$(this).blur();},onpicked:function(){$(this).blur();}})}).formValidator({onshow:"�������ԤԼʱ��",onfocus:"�������ԤԼʱ��",oncorrect:"��"})//.inputValidator({min:"2008-01-01 00:00:00",max:"2010-01-01 23:59:59",type:"datetime",onerror:"���ڱ�����\"1900-01-01\"��\"3000-01-01\"֮��"})//;//.defaultPassed();
>>>>>>> .r439
		.functionValidator({
		    fun:function(val,elem){
		        if($("#pbookingtime").val()!="")
		        {
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
								$.formValidator.setTipState(elem,"onError","ԤԼʱ�䲻�ڷ���ʱ�䷶Χ��!");
				                return false;
							}
				            else
							{
				                $.formValidator.setTipState(elem,"onError","��");
				                return true;
							}
						},
						complete : function(){
							$("#btnupdate").attr({"disabled":false});
							$("#btnupdateauding").attr({"disabled":false});
						}, 
						beforeSend : function(xhr){
							//�ٷ�����û�з�������֮ǰ���Ȼص��ύ��ť
							$("#btnupdate").attr({"disabled":true});
							$("#btnupdateauding").attr({"disabled":true});
							$.formValidator.setTipState(elem,"onLoad","���ڶ�ԤԼʱ����кϷ���У�飬���Ժ�...");
						}, 
						error : function(){
						    $.formValidator.setTipState(elem,"onError","������û�з������ݣ����ܷ�����æ��������");
						    alert("������û�з������ݣ����ܷ�����æ��������");
						}
					});
				}else
				{
					return true;
				}	
			}
		});
		*/
		$("#porderingnum").formValidator({onfocus:"�ļ�����",oncorrect:"��"}).regexValidator({regexp:"num",datatype:"enum",onerror:"�ļ�������ʽ����ȷ"});
		$("#porderingweight").formValidator({onfocus:"��Ʒ����",oncorrect:"��"}).regexValidator({regexp:"decmal4",datatype:"enum",onerror:"��Ʒ������ʽ����ȷ"});
		$("#pclientremark").formValidator({onfocus:"�ͻ�Ҫ��",oncorrect:"��"}).inputValidator({min:1,onerror:"�ͻ�Ҫ����Ϊ��,��ȷ��"});
		$("#precprovince").formValidator({tipid:"precaddressTip",onfocus:"�ռ�ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
		$("#preccity").formValidator({tipid:"precaddressTip",onfocus:"�ռ�ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});

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
					       alert('��ѡ��һ����¼');
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
						   $("#pareacode").val(clientMsgframe.document.all.frmareacode.value);
						   $("#ptel").val(clientMsgframe.document.all.frmtel.value);
					   }else
					   {
					       alert('��ѡ��һ����¼');
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
       for(var i=0;i<bi.length;i++){     
                document.getElementById(chCombo).length=i+1; 
	   			document.getElementById(chCombo).options[i].value = bi[i].selectSingleNode("THE_CODE").text;//����ֵ
	   			document.getElementById(chCombo).options[i].text =  bi[i].selectSingleNode("THE_NAME").text;//��ʾֵ
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
<s:if test="%{action=='update'}">
document.getElementById('precprovince').value=<s:property value="%{order.RECPROVINCE}"/>;
</s:if>
changeCombo('preccity','precprovince','cityvalue');
<s:if test="%{action=='update'}">
document.getElementById('preccity').value=<s:property value="%{order.RECCITY}"/>;
</s:if>
	</script>
	</body>
</html>