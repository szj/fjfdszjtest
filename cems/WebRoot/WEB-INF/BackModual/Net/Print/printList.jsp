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
	    <div align="right">
	    <a href="/setup.exe" ><img style='vertical-align: middle' width=16 height=16 src='<%=path%>/images/down.gif' border=0 hspace=3>��ӡ�ؼ�����</a>&nbsp;&nbsp;&nbsp;&nbsp;

		</div>
		<div id="f_bg">
			<div id="f_tabs">
				<ul>
					<li id="tab3" class="f_tabClass2">
						<a href="javascript:;" onclick="loadDefaultList('<%=path%>/net/print.do?action=listdetail',1,1);">ȫ��</a>
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
		    loadDefaultList('<%=path%>/net/print.do?action=listdetail',1,1);
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
	 
</script>		    		
	</body>
</html>