<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>
<%--
	 * EMS�ʼ���Ϣ����������༭
 	 * @author zhengmh 
	 background-repeat: no-repeat;
--%>
<style media=print> 
.Noprint{display:none;} 
.PageNext{page-break-after: always;} 
</style> 
<style type="text/css">
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
	left: 138px;
	top: 120px;
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
	left: 477px;
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
	width:295px;
	height:26px;
	z-index:31;
	left: 485px;
	top: 386px;
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
	height:20px;
	z-index:41;
	left: 96px;
	top: 5px;
}
#Layer37 {
	position:absolute;
	width:125px;
	height:23px;
	z-index:42;
	left: 147px;
	top: -2px;
}
.STYLE1 {font-family: Georgia, "Times New Roman", Times, serif}
-->
</style>
<center class="Noprint" > 
<p> 
<OBJECT id=WebBrowser classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height=0 width=0> 
</OBJECT> 
<input type=button value=��ӡ onclick=document.all.WebBrowser.ExecWB(6,1)> 
<input type=button value=ֱ�Ӵ�ӡ onclick=document.all.WebBrowser.ExecWB(6,6)> 
<input type=button value=ҳ������ onclick=document.all.WebBrowser.ExecWB(8,1)> 
</p> 
<p> <input type=button value=��ӡԤ�� onclick=document.all.WebBrowser.ExecWB(7,1)> 
<br/> 
</p> 
<hr align="center" width="90%" size="1" noshade> 
</center> 
<div id="content">
<ww:iterator value="emsmailList" status="emsmail">  
	<div id="Layer6" style="top:(<ww:property value='#emsmail.count'/>*480+120)px;"><!--�ļ�������-->
	  <ww:property value="sendname"/>
    </div>
	  <div id="Layer7"><!--�����˵绰-->
	  <ww:property value="sendtel"/>
	  </div>
	  <div id="Layer8"><!--�����˵�λ����-->
	  <ww:property value="sendunit"/>
	  </div>
	  <div id="Layer9"><!--�����˵�ַ-->
	  <ww:property value="sendaddress"/>
	  </div>
	  <div id="Layer10"><!--�����˴���-->
	  <ww:property value="sendcode"/>
      </div>
	  <div id="Layer11"><!--��������������-->
	  <ww:property value="sendpost"/>
	  </div>
	  <div id="Layer12"><!--�ڼ�Ʒ��-->
	  <ww:property value="sendgoodsname"/>
	  </div>
	  <div id="Layer13"><!--��Ʒ����-->
	  <ww:property value="sendcount"/>
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
	  <ww:property value="sendsign"/>
	  </div>
	  <div id="Layer15"><!--�ռ�������-->
	  <ww:property value="recname"/>
	  </div>
	  <div id="Layer16"><!--�ռ��˵绰-->
	  <ww:property value="rectel"/>
	  </div>
	  <div id="Layer17"><!--�ռ��˵�λ����-->
	  <ww:property value="recunit"/>
	  </div>
	  <div id="Layer18"><!--�ռ��˵�ַ-->
	  <ww:property value="recaddress"/>
	  </div>
	  <div id="Layer19"><!--�ռ��˴���-->
	  <ww:property value="reccode"/>
	  </div>
	  <div id="Layer20"><!--�ռ�����������-->
	  <ww:property value="recpost"/>
	  </div>
	  <div id="Layer30"><!--�ռ���ǩ��-->
	  <ww:property value="recsign"/>
	  </div>
	  <div id="Layer31"><!--�ռ����ռ���-->
	  <ww:property value="recdateyear"/>
    </div>
	  <div id="Layer32"><!--�ռ����ռ���-->
	  <ww:property value="recdatemonth"/>
	  </div>
	  <div id="Layer33"><!--�ռ����ռ���-->
	  <ww:property value="recdateday"/>
	  </div>
	  <div id="Layer34"><!--�ռ����ռ�ʱ-->
	  <ww:property value="recdatehour"/>
	  </div>
	  <p>&nbsp;</p>
    <div id="Layer35"><!--��ע-->
	  <ww:property value="remark"/>
	</div>
	  <div id="Layer38"><!--�ʼ���-->
	  <ww:property value="mailno"/>
	  </div>

	  <div id="Layer36"><!--�Ʒ���-->
	 <ww:property value="mail_feearea"/>
     <div id="Layer37"><!--ʡ�ʷⷢ��-->
	 <ww:property value="mail_sendoffice"/>
	 </div>
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
	  <div class="PageNext"></div> 
</ww:iterator>    
</div>
<script language="javascript">
function doPrint()
{
	//printtag.style.display='none';
	//printtag2.style.display='none';
	var infocontent = document.all.content.innerHTML;
	var Part= infocontent;
	document.body.innerHTML = Part;
	window.print();
}
</script> 