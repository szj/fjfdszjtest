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
<form  method='POST' name='form1' action='/archives/user.do?action=update'  id="form1">
  <table width="90%" height="190" border="0">
  <tr>
   <td> 
       <strong>���ϼļ�</strong>
   </td>
  </tr>
  <tr>
	<td >
		<s:actionerror theme="ems" />
		<s:actionmessage theme="ems" />
	</td>
  </tr>
  <tr> 
     <td align="left">
     <font color="red">����</font>
     </td>
   </tr>
   <tr> 
   <td>��ϵ��:
   <s:property value="%{order.NAME}"/>
   &nbsp;�ֻ�:
   <s:property value="%{order.MOBILE}"/> 
   &nbsp;�̶��绰:
   <s:property value="%{order.TEL}"/> 
   ��λ����:
   <s:property value="%{order.UNIT}"/> 
   </td>
   </tr>   
   <tr> 
   <td>ȡ����ַ:
   <s:property value="%{order.PROVINCENAME}"/>
   &nbsp;<s:property value="%{order.CITYNAME}"/>
   &nbsp;<s:property value="%{order.COUNTYNAME}"/>
   </td>
   </tr>
   <tr> 
   <td align="left">
      ��ϸ��ַ:<s:property value="%{order.ADDRESS}"/>   
   </td>   
   </tr>
   <tr>
   <td>�ʼ�����:
   <s:property value="%{order.MAILTYPENAME}"/> 
   </td>
   </tr>
   <tr> 
     <td align="left">
     <font color="red">ѡ��</font>
     </td>
   </tr>
   <tr>
   <td>
	    ����Ҫ��:
	   <s:textfield  id="pclientremark"  name="search.pclientremark" value="%{order.CLIENTREMARK}"  cssStyle="width:80%"></s:textfield>
	   <div id="pclientremarkTip"  ></div>
   </td>
   </tr>
   
   <tr> 
   <td>ԤԼʱ��:
   <s:property value="%{order.BOOKINGTIME}"/>  
   </td>
   </tr>
   
   <tr>
   <td>�ļ�����:
   <s:property value="%{order.ORDERINGNUM}"/>
   &nbsp;��Ʒ����:
   <s:property value="%{order.ORDERINGWEIGHT}"/>(ǧ��)
   </td>
   </tr>  
    
   <tr> 
   <td align="left">
   Ŀ�ĵ�:
   <s:property value="%{order.RECPROVINCENAME}"/>(ʡ)
   &nbsp;<s:property value="%{order.RECCITYNAME}"/>(��)
   </td>
   </tr>

   <tr>
   <td  align="center">
      <s:hidden value="%{order.ID}" name="search.pid" id="pid"></s:hidden>
      <s:if test="%{order.ORDERINGVALUE.substring(7,8)==1}">
			<input type="button" id="btnupdate" name="btnupdate"  onclick="javascript:save('<s:property value="%{action}"/>');"  value="�� ��"  />
	  </s:if>
	  <s:if test="%{order.ORDERINGVALUE.substring(8,9)==1}">
 	        &nbsp; &nbsp; &nbsp;<input type="button" id="btnupdateauding" name="btnupdateauding"  onclick="javascript:save('send');"  value="���沢�ļ�"  />
 	  </s:if>
      &nbsp; &nbsp; &nbsp;<input type="reset"  id="btnreset"  name="btnreset" value="����"  /></td>
   </tr>
 </table>
</form>
</center>
		<div id="f_bg">
			<div id="f_tabs">
				<ul>
					<li id="tab1" class="f_tabClass1">
						<a href="javascript:;" onclick="loadDefaultListex('<%=path%>/net/order.do?action=listdetail','',1,11);">ȫ��</a>
					</li>
					<li id="tab2" class="f_tabClass2">
						<a href="javascript:;" onclick="loadDefaultListex('<%=path%>/net/order.do?action=listdetail&search.porderingstate=','�ȴ��ļ�',2,11);">�ȴ��ļ�</a>
					</li>
					<li id="tab3" class="f_tabClass2">
						<a href="javascript:;" onclick="loadDefaultListex('<%=path%>/net/order.do?action=listdetail&search.porderingstate=','�ȴ��ռ�',3,11);">�ȴ��ռ�</a>
					</li>
					<li id="tab4" class="f_tabClass2">
						<a href="javascript:;" onclick="loadDefaultListex('<%=path%>/net/order.do?action=listdetail&search.porderingstate=','�ȴ�����',4,11);">�ȴ�����</a>
					</li>
					<li id="tab5" class="f_tabClass2">
						<a href="javascript:;" onclick="loadDefaultListex('<%=path%>/net/order.do?action=listdetail&search.porderingstate=','�ͻ�����',5,11);">�ͻ�����</a>
					</li>
					<li id="tab6" class="f_tabClass2">
						<a href="javascript:;" onclick="loadDefaultListex('<%=path%>/net/order.do?action=listdetail&search.porderingstate=','�ͻ�����',6,11);">�ͻ�����</a>
					</li>
					<li id="tab7" class="f_tabClass2">
						<a href="javascript:;" onclick="loadDefaultListex('<%=path%>/net/order.do?action=listdetail&search.porderingstate=','����Χ',7,11);">����Χ</a>
					</li>
					<li id="tab8" class="f_tabClass2">
						<a href="javascript:;" onclick="loadDefaultListex('<%=path%>/net/order.do?action=listdetail&search.porderingstate=','�޷���ϵ�ͻ�',8,11);">�޷���ϵ�ͻ�</a>
					</li>
					<li id="tab9" class="f_tabClass2">
						<a href="javascript:;" onclick="loadDefaultListex('<%=path%>/net/order.do?action=listdetail&search.porderingstate=','�ͻ�ȡ��',9,11);">�ͻ�ȡ��</a>
					</li>
					<li id="tab10" class="f_tabClass2">
						<a href="javascript:;" onclick="loadDefaultListex('<%=path%>/net/order.do?action=listdetail&search.porderingstate=','�ͻ�Ҫ����ʱ',10,11);">�ͻ�Ҫ����ʱ</a>
					</li>
					<li id="tab11" class="f_tabClass2">
						<a href="javascript:;" onclick="loadDefaultListex('<%=path%>/net/order.do?action=listdetail&search.porderingstate=','���ճɹ�',11,11);">���ճɹ�</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="f_main">
			<div id="defaultlist"></div>
		</div>
<script language="javascript" type="text/javascript">	
		    //����Ĭ��ҳ��    
	$(document).ready(function(){
		    //Ĭ�ϼ���ҳ��
		    loadDefaultListex('<%=path%>/net/order.do?action=listdetail','',1,11);
		    //��֤
		    $.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){alert('ȷ�ϱ���');return true;}});
		    $("#pclientremark").formValidator({onfocus:"�ͻ�Ҫ��",oncorrect:"��"}).inputValidator({min:1,onerror:"�ͻ�Ҫ����Ϊ��,��ȷ��"});
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
</script>		    		
	</body>
</html>