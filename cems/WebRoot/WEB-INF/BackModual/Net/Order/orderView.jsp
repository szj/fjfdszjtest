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
 <table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" height="78%" id="table14">
									<tr>
										<td background="<%=basePath%>/images/frontlogin05.jpg" width="740" height="45" STYLE="background-repeat: no-repeat;">��</td>
									</tr>
									<tr>
										<td background="<%=basePath%>/images/frontlogin06.jpg" STYLE="background-repeat:  repeat-y;">
										<div align="center">
											<table  border="0" cellpadding="0" style="border-collapse: collapse" width="80%" height="100%" id="table15">
												<tr >
													<td width="98" height="37">
													<strong>
													<span style="font-size: 9pt">
													�����ļ�</span></strong></td>
													<td height="37">��</td>
												</tr>
												<tr align="left">
													<td width="98" height="16">
													<s:actionerror theme="ems" />
													&nbsp;<s:actionmessage theme="ems" />
													</td>
													<td height="16"></td>
												</tr>
												<tr align="left" style="FONT-SIZE: 9pt">
													<td width="98">��ϵ�ˣ�</td>
													<td><s:property value="%{order.NAME}"/></td>
												</tr>
												<tr align="left" style="FONT-SIZE: 9pt">
													<td width="98">�̶��绰��</td>
													<td><s:property value="%{order.TEL}" /></td>
												</tr>
												<tr align="left" style="FONT-SIZE: 9pt">
													<td width="98">
													�ֻ���</td>
													<td><s:property  value="%{order.MOBILE}"/></td>
												</tr>
												<tr align="left" style="FONT-SIZE: 9pt">
													<td width="98">
													ȡ����ַ��</td>
													<td>
													ʡ��:<s:property value="%{order.PROVINCENAME}"/>
													���У�<s:property value="%{order.CITYNAME}"/>
													�ء�����<s:property value="%{order.COUNTYNAME}"/>
													</td>
												</tr>
												<tr align="left" style="FONT-SIZE: 9pt">
													<td width="98">
													��ϸ��ַ��</td>
													<td>
													<s:property value="%{order.ADDRESS}"/>
													</td>
												</tr>
												<tr align="left" style="FONT-SIZE: 9pt">
													<td width="98">
													�ʼ����ࣺ</td>
													<td>
													<s:property value="%{order.MAILTYPENAME}"/>
													</td>
												</tr>
												<tr align="left" style="FONT-SIZE: 9pt">
													<td width="98">
													ԤԼʱ�䣺</td>
													<td>
													<s:property  value="%{order.BOOKINGTIME}"/>
													</td>
												</tr>
												<tr align="left" style="FONT-SIZE: 9pt">
													<td width="98">
													�ļ�������</td>
													<td>
													<s:property value="%{order.ORDERINGNUM}"/>
													</td>
												</tr>
												<tr align="left" style="FONT-SIZE: 9pt">
													<td width="98">
													��Ʒ������</td>
													<td>
													 <s:property value="%{order.ORDERINGWEIGHT}"/>(ǧ��)
													</td>
												</tr>
												<tr align="left" style="FONT-SIZE: 9pt">
													<td width="98">
													�ͻ�Ҫ��</td>
													<td>
													 <s:property value="%{order.CLIENTREMARK}"/>
													</td>
												</tr>
												<tr align="left" style="FONT-SIZE: 9pt">
													<td width="98">
													�ռ��˵�ַ��</td>
													<td>
													ʡ��:<s:property value="%{order.RECPROVINCENAME}"/>
													 ���У�<s:property value="%{order.RECCITYNAME}"/>
													</td>
												</tr>
											</table>
										</div>
										</td>
									</tr>
									<tr>
										<td background="<%=basePath%>/images/frontlogin07.jpg" width="740" height="15" STYLE="background-repeat: no-repeat;">��</td>
									</tr>
								</table>

 <table width="100%" border="0" cellpadding="4" cellspacing="0"  class="tablesorter">
 <tr>
    <td colspan="5"> 
       <strong>������־</strong>
    </td>
  </tr> 
  <thead>
	<tr class="trClass">
		<td>
			<strong>������</strong>
		</td>
		<td>
			<strong>������</strong>
		</td>
		<td>
			<strong>��������</strong>
		</td>
		<td>
			<strong>������</strong>
		</td>
		<td>
			<strong>����ʱ��</strong>
		</td>
	</tr>
	</thead>
	<tbody>
	<s:iterator id="g" value="%{pageList.objectList}">
		<tr>
			<td>
				<s:property value="#g.ID" />
			</td>
			<td>
				<s:property value="#g.ORDERID" />
			</td>
			<td>
				<s:property value="#g.PROCONTENT" />
			</td>
			<td>
				<s:property value="#g.PRONAME" />
			</td>
			<td>
				<s:property value="#g.CREATE_DATE" />
			</td>
		</tr>
	</s:iterator>
	</tbody>
	<tr class="bgColor3">
		<td colspan="6">
			��ҳ:                                                     
			<qzgf:pages value="%{pageList.pages}"/>
		</td>
	</tr>
   <tr>
   <td  colspan="6" align="center">
      <input type="button" onclick="javascript:history.go(-1)" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'"/>
   </td>  
   </tr>
</table>
</center>
</body>
</html>