<%@ page language="java" errorPage="/error.jsp" pageEncoding="GB2312" contentType="text/html;charset=gb2312" %>
<%-- �����ǩ --%>
<%@ include file="/common/taglibs.jsp"%>

<%-- ���ܲ����ɹ���ʾ --%>
<script language="javascript">	
	<%--ˢ�¿��--%>
	<ww:iterator value="actionScripts">
		//parent.FunListFrm.window.location.reload();
		<ww:property />
	</ww:iterator>
</script>
<br>
<center>
<table width="300" class="message" cellSpacing=0 cellPadding=0 border=0>
		<thead>
		  <tr>
			<th colspan="2" align="left" height="24"> ::<b>��ʾ��Ϣ</b></th>
		  </tr>
		</thead>
		<TBODY>
			<TR>
				<TD width="20" align="right" class="bodyleft"><img src="/themes/default/images/mnuAbout.gif"></TD>
				<TD width="300" height="100" align="left" class="bodyright">
					<ww:if test="actionMessages==null">
						�����ɹ�!
					</ww:if>
					<ww:else>
						<ww:iterator value="actionMessages">
							<ww:property />
						</ww:iterator>
					</ww:else>
				</TD>
			</TR>
			<TR >
				<TD align="center" colspan="2" class="buttons">
					<ww:if test="buttons==null || buttons.size()==0">
						<a href="javascript:history.back()">������һҳ</a>
					</ww:if>
					<ww:iterator value="buttons">
						<a href="<ww:property value='url'/>"><ww:property value="name"/></a>
					</ww:iterator>
				</TD>
			</TR>
		</TBODY>
</table>
</center>
