<%@page contentType="text/html; charset=gbk"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//����ȫ�ֱ���
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%--
	 * EMS�ʼ�����
 	 * @author zhengmh 
--%><style type="text/css">
<!--
body {
	background-image: url(../../../../../images/mailformat/ems.jpg);
	background-repeat: no-repeat;
}
#Layer1 {
	position:absolute;
	width:84px;
	height:21px;
	z-index:1;
	left: 133px;
	top: 93px;
}
#Layer2 {
	position:absolute;
	width:26px;
	height:22px;
	z-index:1;
	left: 268px;
	top: 92px;
}
#Layer3 {
	position:absolute;
	width:20px;
	height:22px;
	z-index:2;
	left: 304px;
	top: 92px;
}
#Layer4 {
	position:absolute;
	width:21px;
	height:21px;
	z-index:1;
	left: 333px;
	top: 93px;
}
#Layer5 {
	position:absolute;
	width:21px;
	height:21px;
	z-index:2;
	left: 366px;
	top: 93px;
}
#Layer6 {
	position:absolute;
	width:84px;
	height:25px;
	z-index:2;
	left: 133px;
	top: 119px;
}
#Layer7 {
	position:absolute;
	width:109px;
	height:23px;
	z-index:3;
	left: 297px;
	top: 120px;
}
#Layer8 {
	position:absolute;
	width:217px;
	height:24px;
	z-index:4;
	left: 187px;
	top: 147px;
}
#Layer9 {
	position:absolute;
	width:330px;
	height:44px;
	z-index:5;
	left: 79px;
	top: 194px;
}
#Layer10 {
	position:absolute;
	width:82px;
	height:16px;
	z-index:6;
	left: 132px;
	top: 241px;
}
#Layer11 {
	position:absolute;
	width:93px;
	height:17px;
	z-index:7;
	left: 316px;
	top: 241px;
}
#Layer12 {
	position:absolute;
	width:205px;
	height:47px;
	z-index:8;
	left: 77px;
	top: 309px;
}
#Layer13 {
	position:absolute;
	width:129px;
	height:50px;
	z-index:9;
	left: 286px;
	top: 307px;
}
#Layer14 {
	position:absolute;
	width:250px;
	height:27px;
	z-index:10;
	left: 166px;
	top: 385px;
}
#Layer15 {
	position:absolute;
	width:103px;
	height:22px;
	z-index:11;
	left: 489px;
	top: 120px;
}
#Layer16 {
	position:absolute;
	width:122px;
	height:21px;
	z-index:12;
	left: 658px;
	top: 120px;
}
#Layer17 {
	position:absolute;
	width:243px;
	height:25px;
	z-index:13;
	left: 538px;
	top: 145px;
}
#Layer18 {
	position:absolute;
	width:350px;
	height:44px;
	z-index:14;
	left: 433px;
	top: 194px;
}
#Layer19 {
	position:absolute;
	width:81px;
	height:16px;
	z-index:15;
	left: 480px;
	top: 241px;
}
#Layer20 {
	position:absolute;
	width:108px;
	height:17px;
	z-index:16;
	left: 672px;
	top: 241px;
}
#Layer21 {
	position:absolute;
	width:73px;
	height:18px;
	z-index:17;
	left: 454px;
	top: 263px;
}
#Layer22 {
	position:absolute;
	width:22px;
	height:20px;
	z-index:18;
	left: 620px;
	top: 263px;
}
#Layer23 {
	position:absolute;
	width:29px;
	height:19px;
	z-index:19;
	left: 662px;
	top: 264px;
}
#Layer24 {
	position:absolute;
	width:27px;
	height:18px;
	z-index:20;
	left: 704px;
	top: 264px;
}
#Layer25 {
	position:absolute;
	width:26px;
	height:17px;
	z-index:21;
	left: 744px;
	top: 264px;
}
#Layer26 {
	position:absolute;
	width:109px;
	height:15px;
	z-index:22;
	left: 453px;
	top: 287px;
}
#Layer27 {
	position:absolute;
	width:152px;
	height:15px;
	z-index:23;
	left: 632px;
	top: 289px;
}
#Layer28 {
	position:absolute;
	width:111px;
	height:20px;
	z-index:24;
	left: 492px;
	top: 307px;
}
#Layer29 {
	position:absolute;
	width:96px;
	height:20px;
	z-index:25;
	left: 689px;
	top: 308px;
}
#Layer30 {
	position:absolute;
	width:240px;
	height:23px;
	z-index:26;
	left: 545px;
	top: 334px;
}
#Layer31 {
	position:absolute;
	width:39px;
	height:17px;
	z-index:27;
	left: 474px;
	top: 362px;
}
#Layer32 {
	position:absolute;
	width:30px;
	height:17px;
	z-index:28;
	left: 535px;
	top: 363px;
}
#Layer33 {
	position:absolute;
	width:29px;
	height:16px;
	z-index:29;
	left: 586px;
	top: 363px;
}
#Layer34 {
	position:absolute;
	width:32px;
	height:17px;
	z-index:30;
	left: 630px;
	top: 362px;
}
#Layer35 {
	position:absolute;
	width:294px;
	height:27px;
	z-index:31;
	left: 483px;
	top: 384px;
}
#Layer36 {
	position:absolute;
	width:800px;
	height:30px;
	z-index:32;
	left: 185px;
	top: 480px;
}
#Layer37 {
	position:absolute;
	width:52px;
	height:24px;
	z-index:33;
	left: 430px;
	top: 120px;
}
#Layer38 {
	position:absolute;
	width:251px;
	height:19px;
	z-index:34;
	left: 495px;
	top: 90px;
}
#sendprovinceDiv {
	position:absolute;
	width:80px;
	height:17px;
	z-index:35;
	left: 144px;
	top: 174px;
}
#sendcityDiv {
	position:absolute;
	width:80px;
	height:17px;
	z-index:36;
	left: 236px;
	top: 175px;
}
#sendcountyDiv {
	position:absolute;
	width:80px;
	height:17px;
	z-index:37;
	left: 326px;
	top: 175px;
}
#recprovinceDiv {
	position:absolute;
	width:80px;
	height:17px;
	z-index:38;
	left: 507px;
	top: 174px;
}
#reccityDiv {
	position:absolute;
	width:80px;
	height:17px;
	z-index:39;
	left: 605px;
	top: 175px;
}
#reccountyDiv {
	position:absolute;
	width:80px;
	height:17px;
	z-index:40;
	left: 702px;
	top: 174px;
}
#Layer39 {
	position:absolute;
	width:332px;
	height:25px;
	z-index:41;
	left: 78px;
	top: 261px;
}
#Layer40 {
	position:absolute;
	width:105px;
	height:40px;
	z-index:42;
	left: 426px;
	top: 478px;
}
#Layer41 {
	position:absolute;
	width:105px;
	height:40px;
	z-index:43;
	left: 557px;
	top: 479px;
}
#Layer42 {
	position:absolute;
	width:55px;
	height:33px;
	z-index:44;
	left: 78px;
	top: 175px;
}
#Layer43 {
	position:absolute;
	width:52px;
	height:29px;
	z-index:45;
	left: 78px;
	top: 120px;
}
-->
</style>



<form method="post" name="form1" action="<%=path%>/net/print.do">
<div id="Layer6"><!--�ļ�������-->
<s:textfield name="search.psendname" id="psendname" value="%{print.SENDNAME}" cssStyle="width:84px"  />
  </div>
	  <div id="Layer7"><!--�����˵绰-->
<s:textfield name="search.psendtel" id="psendtel" value="%{print.SENDTEL}"  cssStyle="width:109px"/>
	  </div>
	  <div id="Layer8"><!--�����˵�λ����-->
<s:textfield name="search.psendunit"  id="psendunit" value="%{print.SENDUNIT}"  cssStyle="width:217px" />	      </div>
	  <div id="Layer9"><!--�����˵�ַ-->
	  <s:textarea name="search.psendaddress"  id="psendaddress" value="%{print.SENDADDRESS}" cssStyle="width:330px;height:44px"/>
      </div>
	  <div id="Layer10"><!--�����˴���-->
<s:textfield name="search.psendcode" id="psendcode" value="%{print.SENDCODE}"   cssStyle="width:82px"/>
  </div>
	  <div id="Layer11"><!--��������������-->
<s:textfield name="search.psendpost" id="psendpost" value="%{print.SENDPOST}"  cssStyle="width:93px"/>
  </div>
  
  <div id="Layer39"><!--�ʼ�����-->
		<input type="radio" name="search.psendmailtype" id="psendmailtype0" value="0" <s:if test="%{print.SENDMAILTYPE==0}">checked</s:if> /><label for="psendmailtype0">�ź�</label>
		<input type="radio" name="search.psendmailtype" id="psendmailtype1" value="1" <s:if test="%{print.SENDMAILTYPE==1}">checked</s:if> /><label for="psendmailtype1">�ļ�����</label>
		<input type="radio" name="search.psendmailtype" id="psendmailtype2" value="2" <s:if test="%{print.SENDMAILTYPE==2}">checked</s:if> /><label for="psendmailtype2">��Ʒ</label>
		  <!--    
  	   <s:radio name="search.psendmailtype" id="psendmailtype"  value="%{print.SENDMAILTYPE}" list="#{0:'�ź�',1:'�ļ�����',2:'��Ʒ'}"></s:radio>
  	  	  -->  	
  </div>
  
 <div id="Layer12"><!--�ڼ�Ʒ��-->
<s:textarea name="search.psendgoodsname" id="psendgoodsname" value="%{print.SENDGOODSNAME}"  cssStyle="width:205px;height:47px"/>
  </div>
	  <div id="Layer13"><!--��Ʒ����-->
<s:textfield name="search.psendcount" id="psendcount" value="%{print.SENDCOUNT}" cssStyle="width:129px"/>	
	</div>
	  <p>&nbsp;</p>
  <div id="Layer36"><!--����-->
	  <input type="button" id="btnsave" name="btnsave"  onclick="javascript:save('<s:property value="%{action}"/>');"  value="�� ��"  alt="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
 	
 	  <s:if test="%{action.equals('insert')}">
      <input type="button" id="btnsaveclient" name="btnsaveclient"  onclick="javascript:save('insertclient');"  value="����(�ͻ�)"  alt="����(�ͻ�)" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
      </s:if>
  	  
	  <input type="button" id="btnaddress" name="btnaddress"  onclick="javascript:showAddress();"  value="��ַʶ��"  alt="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'"/>

	  <input type="reset"  id="btnreset"  name="btnreset" value="����"  class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
	   
	  <input name="btnreturn" type="button" id="btnreturn" onclick="javascript:history.go(-1)" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'"/>
  </div>
   <div id="Layer37"><!--�ռ�����Ϣ-->
	  <input type="button" id="btnrecmsg" name="btnrecmsg"  onclick="javascript:Reciframe();"  value="�ռ�������"  alt="�ռ�������" class="outStyle2" onmouseover="this.className='overStyle2'"  onmouseout="this.className='outStyle2'" />
  </div>
	  <div id="Layer42"><!--��ϵ�˵�ַ-->
        <input type="button" id="btnaddress2" name="btnaddress2"  onclick="javascript:Addressiframe();"  value="��ַ"  alt="��ַ" class="outStyle2" onmouseover="this.className='overStyle2'"  onmouseout="this.className='outStyle2'" />
  </div>
	  <div id="Layer43"><!--��ϵ����Ϣ-->
	   <input type="button" id="btnclientmsg" name="btnclientmsg"  onclick="javascript:ClientMsgiframe();"  value="�ļ�������"  alt="�ļ�������" class="outStyle2" onmouseover="this.className='overStyle2'"  onmouseout="this.className='outStyle2'" />
  </div>
	  <!-- 
	  <div id="Layer40"><!--�ļ�����Ϣ
	   <input type="button" id="btnsendmsg" name="btnsendmsg"  onclick="javascript:Addressiframe();"  value="�ļ�����Ϣ"  alt="����" />
  </div>
  <div id="Layer41"><!--�ռ�����
	  <input type="button" id="btnrecmsg" name="btnrecmsg"  onclick="javascript:Addressiframe();"  value="�ռ�����Ϣ"  alt="����" />
  </div>
  -->	  
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <div id="Layer14"><!--������ǩ��-->
<s:textfield name="search.psendsign" id="psendsign" value="%{print.SENDSIGN}"   cssStyle="width:250px"/>
  </div>
	  <div id="Layer15"><!--�ռ�������-->
<s:textfield name="search.precname" id="precname" value="%{print.RECNAME}" cssStyle="width:103px"/>	
  </div>
	  <div id="Layer16"><!--�ռ��˵绰-->
<s:textfield name="search.prectel" id="prectel" value="%{print.RECTEL}"  cssStyle="width:122px" />
  </div>
	  <div id="Layer17"><!--�ռ��˵�λ����-->
<s:textfield name="search.precunit" id="precunit" value="%{print.RECUNIT}"  cssStyle="width:243px"/>	
  </div>
	  <div id="Layer18"><!--�ռ��˵�ַ-->
	  <s:textarea name="search.precaddress" id="precaddress" value="%{print.RECADDRESS}"  cssStyle="width:350px;height:44px" />
  </div>
	  <div id="Layer19"><!--�ռ��˴���-->
	  <s:textfield name="search.preccode" id="preccode" value="%{print.RECCODE}" cssStyle="width:81px" />
  </div>
	  <div id="Layer20"><!--�ռ�����������-->
<s:textfield name="search.precpost" id="precpost" value="%{print.RECPOST}" cssStyle="width:108px" />	
  </div>
	  <div id="Layer30"><!--�ռ���ǩ��-->
<s:textfield name="search.precsign" id="precsign" value="%{print.RECSIGN}"  cssStyle="width:240px"/>
  </div>
	  <div id="Layer31"><!--�ռ����ռ���-->
<s:textfield name="search.precdateyear" id="precdateyear" value="%{print.RECDATEYEAR}" cssStyle="width:39px"/>
  </div>
	  <div id="Layer32"><!--�ռ����ռ���-->
<s:textfield name="search.precdatemonth" id="precdatemonth" value="%{print.RECDATEMONTH}" cssStyle="width:30px" />
  </div>
	  <div id="Layer33"><!--�ռ����ռ���-->
<s:textfield name="search.precdateday" id="precdateday" value="%{print.RECDATEDAY}" cssStyle="width:29px"/>
  </div>
	  <div id="Layer34"><!--�ռ����ռ�ʱ-->
<s:textfield name="search.precdatehour" id="precdatehour" value="%{print.RECDATEHOUR}"   cssStyle="width:32px"/>
  </div>
	  <p>&nbsp;</p>
	  <div id="Layer35"><!--��ע-->
<s:textfield name="search.premark" id="premark" value="%{print.REMARK}"  cssStyle="width:294px"/>
  </div>
  
<div id="Layer38"><!--�ʼ���-->
<s:textfield name="search.pmailno" id="pmailno" value="%{print.MAILNO}"  cssStyle="width:251px"/>
</div>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	<input type='hidden' name='search.pid' value='<s:property value="%{print.ID}"/>' />
</form>

<script language="javascript" type="text/javascript">

    $(document).ready(function(){
		$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
		$("#precdateyear").formValidator({onfocus:"��",oncorrect:"��"}).regexValidator({regexp:"^\\d{4}$",onerror:"��������"});
		$("#precdatemonth").formValidator({onfocus:"��",oncorrect:"��"}).regexValidator({regexp:"^(0?[1-9]|1[0-2])$",onerror:"��������"});
		$("#precdateday").formValidator({onfocus:"��",oncorrect:"��"}).regexValidator({regexp:"^((0?[1-9])|((1|2)[0-9])|30|31)$",onerror:"��������"});
		$("#precdatehour").formValidator({onfocus:"Сʱ",oncorrect:"��"}).regexValidator({regexp:"^((0?[1-9])|(1[0-9])|(2[0-3]))$",onerror:"������Сʱ"});
		$("#psendcount").formValidator({onfocus:"����",oncorrect:"��"}).regexValidator({regexp:"intege1",datatype:"enum",onerror:"����������"});

		$("#precaddress").formValidator({onfocus:"�ռ��˵�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"�����ռ��˵�ַ"});;
	});

	//��������
	function save(action){
	   if($.formValidator.pageIsValid()){
			var url ='<%=path%>/net/print.do?action='+action;
			document.forms[0].action=url;
			document.forms[0].submit();
		}else
		{
		  return false;
		}
	}
	
	//�ռ�����Ϣ
	function Reciframe(){
        if ($("#recdialog").length == 0){
	    	$("body").append(' <div id="recdialog" title="�ռ�����Ϣ�б�"> '+
	    	'<iframe src="<%=path%>/archives/recMsg.do?action=frame"  id = "recframe" width="100%"   height="100%"></iframe>'+
	    	'</div>	');  
	    	
	    	$("#recdialog").dialog({
				bgiframe: true,
				autoOpen: false,
				width: 700,
				height: 300,
				modal: true,
				buttons: {
					'ȷ��': function() {
					   if(recframe.document.all.frmid.value!=""){
						   //��������
						   $("#precname").val(recframe.document.all.frmname.value);
						   $("#prectel").val(recframe.document.all.frmtel.value);
						   $("#precunit").val(recframe.document.all.frmunit.value);
						   $("#preccode").val("");
						   $("#precpost").val(recframe.document.all.frmpost.value);
						   $("#precaddress").val(recframe.document.all.frmaddress.value);
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
		 $('#recdialog').dialog('open');
	}
	
	
	//ȡ����ϵ��
	function ClientMsgiframe(){
        if ($("#clientMsgdialog").length == 0){
	    	$("body").append(' <div id="clientMsgdialog" title="ȡ����ϵ��"> '+
	    	'<iframe src="<%=path%>/archives/clientMsg.do?action=frameex"  id = "clientMsgframe" width="100%"   height="100%"></iframe>'+
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
						   $("#psendname").val(clientMsgframe.document.all.frmname.value);
						   $("#psendsign").val(clientMsgframe.document.all.frmname.value);
						   $("#psendtel").val(clientMsgframe.document.all.frmmobile.value);
						   $("#psendunit").val(clientMsgframe.document.all.frmunit.value);
						   $("#psendcode").val("");
						   $("#psendpost").val("");
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
	
	
	//ȡ����ַ
	function Addressiframe(){
        if ($("#addressdialog").length == 0){
	    	$("body").append(' <div id="addressdialog" title="ȡ����ַ"> '+
	    	'<iframe src="<%=path%>/archives/address.do?action=frameex"  id = "addressframe" width="100%"   height="100%"></iframe>'+
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
						   $("#psendaddress").val(addressframe.document.all.frmprovincename.value+addressframe.document.all.frmciytname.value+addressframe.document.all.frmcountyname.value+addressframe.document.all.frmaddress.value);
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

	//��ַʶ����
	function showAddress(){
        if ($("#showMsgdialog").length == 0){
	    	$("body").append(' <div id="showMsgdialog"  title="��ַ��Ϣʶ��"> '+
	    	'<span style="font-size: 9pt">��Ҫʶ��ĵ�ַ��Ϣ:<br><textarea name="addresscontent" cols="" rows="" id="addresscontent" style="width:80%;height:100px">���� ��152000000000��059512345678��ɽ��ʡ ������ �ø��� ��ƽ���ֹ�����԰4��¥4��Ԫ4¥���� ��123000 </textarea></span>'+
	    	'</div>	');  
	    	
	    	$("#showMsgdialog").dialog({
				bgiframe: true,
				autoOpen: false,
				width: 700,
				height: 300,
				modal: true,
				buttons: {
					'�ļ���': function() {
										if (document.all.addresscontent.value == ''){
						            		jAlert('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����д��ʶ�������!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;','��ʾ');
						            		return;
						            	}
										    var content=document.all.addresscontent.value;
											var myArray=content.split("��",6);
											if(myArray.length==5){
												//�ļ��˵���Ϣ
								            	document.all("search.psendname").value = myArray[0];
								            	$("#psendsign").val(myArray[0]);
								            	document.all("search.psendtel").value = myArray[1]+" "+myArray[2];
								            	document.all("search.psendunit").value ="";
								            	document.all("search.psendaddress").value = myArray[3];
								            	document.all("search.psendcode").value = "";
								            	document.all("search.psendpost").value = myArray[4];  	
						            		}else
						            		{
						            			jAlert('��֧�ָø�ʽ!<br>��ȷ��ʽ:�������ֻ����绰����ַ���ʱ�,<br>����:�ִ��� ��15235021186 �� 0595XXXX��ɽ��ʡ ������ �ø��� ��ƽ���ֹ�����԰4��¥4��Ԫ4¥���� ��034000<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;','��ʾ');
						            		}
					   						$(this).dialog('close');
					},
					'�ռ���': function() {
										if (document.all.addresscontent.value == ''){
						            		jAlert('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����д��ʶ�������!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;', '��ʾ');
						            		return;
						            	}
										    var content=document.all.addresscontent.value;
											var myArray=content.split("��",6);
											if(myArray.length==5){
												//�ռ��˵���Ϣ
								            	document.all("search.precname").value = myArray[0];
								            	document.all("search.prectel").value = myArray[1]+" "+myArray[2];
								            	document.all("search.precunit").value ="";
								            	document.all("search.precaddress").value = myArray[3];
								            	document.all("search.preccode").value = "";
								            	document.all("search.precpost").value = myArray[4];  	
						            		}else
						            		{
						            			jAlert('��֧�ָø�ʽ!<br>��ȷ��ʽ:�������ֻ����绰����ַ���ʱ�,<br>����:�ִ��� ��15235021186 �� 0595XXXX��ɽ��ʡ ������ �ø��� ��ƽ���ֹ�����԰4��¥4��Ԫ4¥���� ��034000<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;','��ʾ');
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
		 $('#showMsgdialog').dialog('open');
	}
</script>