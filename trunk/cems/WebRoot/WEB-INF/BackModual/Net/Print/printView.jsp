<%@page contentType="text/html; charset=gbk"%>
<%@taglib uri="/WEB-INF/util.tld" prefix="qzgf"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
  //����ȫ�ֱ���
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%--
	 * EMS�ʼ���Ϣ����������༭
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
#Layer38 {
	position:absolute;
	width:251px;
	height:19px;
	z-index:34;
	left: 494px;
	top: 91px;
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
#Layer36 {
	position:absolute;
	width:120px;
	height:22px;
	z-index:41;
	left: 96px;
	top: 3px;
}
#Layer37 {
	position:absolute;
	width:416px;
	height:24px;
	z-index:42;
	left: 385px;
	top: 1px;
}
#Layer39 {
	position:absolute;
	width:143px;
	height:23px;
	z-index:42;
	left: 223px;
	top: 2px;
}
#Layer40 {
	position:absolute;
	width:234px;
	height:28px;
	z-index:43;
	left: 347px;
	top: 492px;
}
#Layer41 {
	position:absolute;
	width:332px;
	height:25px;
	z-index:41;
	left: 78px;
	top: 261px;
}

-->
</style>
	  <div id="Layer40"><!--����-->
	   <input type="button" onclick="javascript:history.go(-1)" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
	  </div>
	  
	  <div id="Layer6"><!--�ļ�������-->
	  <s:property value="%{search.SENDNAME}"/>
	  </div>
	  <div id="Layer7"><!--�����˵绰-->
	  <s:property value="%{search.SENDTEL}"/>
	  </div>
	  <div id="Layer8"><!--�����˵�λ����-->
	  <s:property value="%{search.SENDUNIT}"/>
	  </div>
	  <div id="Layer9"><!--�����˵�ַ-->
	  <s:property value="%{search.SENDADDRESS}"/>
	  </div>
	  <div id="Layer10"><!--�����˴���-->
	  <s:property value="%{search.SENDCODE}"/>
      </div>
	  <div id="Layer11"><!--��������������-->
	  <s:property value="%{search.SENDPOST}"/>
	  </div>
	  
	  <div id="Layer41"><!--�ʼ�����-->
		<input type="radio" name="search.psendmailtype" id="psendmailtype0" value="0" <s:if test="%{search.SENDMAILTYPE==0}">checked</s:if> /><label for="psendmailtype0">�ź�</label>
		<input type="radio" name="search.psendmailtype" id="psendmailtype1" value="1" <s:if test="%{search.SENDMAILTYPE==1}">checked</s:if> /><label for="psendmailtype1">�ļ�����</label>
		<input type="radio" name="search.psendmailtype" id="psendmailtype2" value="2" <s:if test="%{search.SENDMAILTYPE==2}">checked</s:if> /><label for="psendmailtype2">��Ʒ</label>	
 	   </div>
  
	  <div id="Layer12"><!--�ڼ�Ʒ��-->
	  <s:property value="%{search.SENDGOODSNAME}"/>
	  </div>
	  <div id="Layer13"><!--��Ʒ����-->
	  <s:property value="%{search.SENDCOUNT}"/>
	  </div>
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
	  <p>&nbsp;</p>
	  <div id="Layer14"><!--������ǩ��-->
	  <s:property value="%{search.SENDSIGN}"/>
	  </div>
	  <div id="Layer15"><!--�ռ�������-->
	  <s:property value="%{search.RECNAME}"/>
	  </div>
	  <div id="Layer16"><!--�ռ��˵绰-->
	  <s:property value="%{search.RECTEL}"/>
	  </div>
	  <div id="Layer17"><!--�ռ��˵�λ����-->
	  <s:property value="%{search.RECUNIT}"/>
	  </div>
	  <div id="Layer18"><!--�ռ��˵�ַ-->
	  <s:property value="%{search.RECADDRESS}"/>
	  </div>
	  <div id="Layer19"><!--�ռ��˴���-->
	  <s:property value="%{search.RECCODE}"/>
	  </div>
	  <div id="Layer20"><!--�ռ�����������-->
	  <s:property value="%{search.RECPOST}"/>
	  </div>
	  <div id="Layer30"><!--�ռ���ǩ��-->
	  <s:property value="%{search.RECSIGN}"/>
	  </div>
	  <div id="Layer31"><!--�ռ����ռ���-->
	  <s:property value="%{search.RECDATEYEAR}"/>
	  </div>
	  <div id="Layer32"><!--�ռ����ռ���-->
	  <s:property value="%{search.RECDATEMONTH}"/>
	  </div>
	  <div id="Layer33"><!--�ռ����ռ���-->
	  <s:property value="%{search.RECDATEDAY}"/>
	  </div>
	  <div id="Layer34"><!--�ռ����ռ�ʱ-->
	  <s:property value="%{search.RECDATEHOUR}"/>
	  </div>
	  <p>&nbsp;</p>
	  <div id="Layer35"><!--��ע-->
	  <s:property value="%{search.REMARK}"/>
	  </div>
	  <div id="Layer38"><!--�ʼ���-->
	  <s:property value="%{search.MAILNO}"/>
	  </div>

	  <div id="Layer36"><!--�Ʒ���-->
	 	<s:property value="%{search.MAIL_FEEAREA}"/>
	  </div>
      <div id="Layer37"><!--ʡ�ʷⷢ��-->
	    <s:property value="%{search.MAIL_SENDOFFICE}"/>
	  </div>
	   <div id="Layer39"><!--E�ʱ���ʶ-->
	      <s:property value="%{search.EMAIL_FEE}"/>
      </div>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>