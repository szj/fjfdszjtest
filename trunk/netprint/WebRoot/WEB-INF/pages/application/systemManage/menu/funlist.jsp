<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
	<script language="javascript">
		/*
			�������������ݴ�������ͽ��в�ͬ�Ĳ�����
			edit �޸Ķ���
			dele ɾ������
			insert ��Ӷ���
		*/
		function fun_opera(vAction){
			var id="${param['menuInfo.superId']}";
			if(vAction == 'edit'){
				parent.OptFrm.location="/system/manage/menu.shtml?actionType=edit&menuInfo.menuId="+id;
			}else if(vAction == 'insert'){
				parent.OptFrm.location="/system/manage/menu.shtml?actionType=new&menuInfo.superId="+id;
			}else if(vAction == 'dele'){
				parent.OptFrm.location="/system/manage/menu.shtml?actionType=delete&menuInfo.superId="+id;
			}
		}
	</script>
	<table width="100%">
		<tr><td align="left">
		<%-- ����Ǹ��˵����ܱ��޸Ļ�ɾ�� --%>
		<c:if test="${param['menuInfo.superId']!='Root' && param['menuInfo.superId']!=null}">	
			<input type="button" value="�޸�" onclick="fun_opera('edit')">		
			<input type="button" value="ɾ��" onclick="fun_opera('del')">
			
		</c:if>
		<input type="button" value="���" onclick="fun_opera('insert')">
		</td></tr>
	</table>
	<%--������ʾ���--%>
	<tt:grid id="menu" value="menus" pagination="false" xls="false">
		<tt:row>
			<tt:col name="�˵���־*" property="menuId" width="100"/>
			<tt:col name="�˵�����*" property="menuName" width="100"/>
			<tt:col name="���˵�ID*" property="superId" width="100"/>
			<tt:col name="����*" width="100">
				<ww:if test="menuId != null">
					<ww:if test="isMenu.equals(\"1\")">
						�˵�
					</ww:if>
					<ww:elseif test="isMenu.equals(\"0\")">
						����
					</ww:elseif>
				</ww:if>
			</tt:col>
			<tt:col name="ͼ���ַ*" property="imgSrc"/>
			<tt:col name="��ע" property="title" width="100"/>
			<tt:col name="����" width="100">
				<ww:if test="menuId != null">
					<A href="/system/manage/menu.shtml?actionType=edit&menuInfo.menuId=<ww:property value="menuId"/>" target="OptFrm">�༭</A> 
					<A href="/system/manage/delmenu.shtml?actionType=delete&menuInfo.menuId=<ww:property value="menuId"/>" target="OptFrm">ɾ��</A>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid>
	