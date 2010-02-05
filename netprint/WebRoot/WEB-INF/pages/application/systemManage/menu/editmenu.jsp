<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>

<form name="form1" action="/system/manage/menu.shtml" method="POST">

<table class="simple"  align="center" style="width:70%"> 
	<thead>
		<tr>
			<th colspan="2" align="center" >�� �� �� Ϣ</th>
		</tr>
	</thead>
	<tbody>
			<ww:if test="actionType=='update'">
				<ww:textfield label="'�˵�ID'" required="'true'" cssClass="InputTxt" maxlength="'50'" name="'menuInfo.menuId'"  readonly="true"/>
			</ww:if>
			<ww:else>
				<ww:textfield label="'�˵�ID'" required="'true'" cssClass="InputTxt" maxlength="'50'" name="'menuInfo.menuId'"/>
			</ww:else>
			<ww:textfield label="'�˵�����'" required="'true'"  cssClass="'InputTxt'" maxlength="'50'"  name="'menuInfo.menuName'"/>
			<ww:textfield label="'�ϼ��ڵ�'" cssClass="InputTxt" maxlength="'50'"  name="'menuInfo.superId'"/>
			<ww:textfield label="'��ʾ��Ϣ'" cssClass="InputTxt" maxlength="'100'" name="'menuInfo.title'" />
			
		<tr>
			<td align="right" width="20%">�˵�˳��</td>
			<TD width="80%">
				<INPUT type="text" class="InputTxt" maxlength="8" size="6"  name="menuInfo.menuOrder" value="<ww:property value="menuInfo.menuOrder"/>" reg="int+0" check>
			</TD>
		</tr>
			<ww:textfield label="'ͼ���ַ'" cssClass="InputTxt" maxlength="'200'" size="'40'" name="'menuInfo.imgSrc'"/>
			<ww:textfield label="'�����¼�'" cssClass="'InputTxt'" maxlength="'500'" size="'40'" name="'menuInfo.activeEvent'"/>
			<ww:textfield label="'�¼�����'" cssClass="'InputTxt'" maxlength="'500'" size="'40'" name="'menuInfo.method'"/>
			<ww:textfield label="'URL'" cssClass="InputTxt" maxlength="'500'" size="'40'" name="'menuInfo.url'"/>
		<tr>
			<td align="right">ѡ��
			</td>
			<td>
				<INPUT type="checkbox" name="menuInfo.isMenu" value="1" <ww:if test="\"1\".equals(menuInfo.isMenu)">checked</ww:if>>�ڲ˵�������ʾ&nbsp;
				<INPUT type="checkbox" name="menuInfo.isRoot" value="1"  <ww:if test="! menuInfo.superId eq 'Root'"> disabled</ww:if> <ww:if test="\"1\".equals(menuInfo.isRoot)">checked</ww:if>>���˵�&nbsp;
				<INPUT type="checkbox" name="menuInfo.haveSub" value="1" <ww:if test="\"1\".equals(menuInfo.haveSub)">checked</ww:if>>ӵ���ӽڵ�&nbsp;
				<INPUT type="checkbox" name="menuInfo.isSeperator" value="1" <ww:if test="\"1\".equals(menuInfo.isSeperator)">checked</ww:if>>�ָ���&nbsp;
			</td>
		</tr>
	</tbody>
</table>
<input type="hidden" name="actionType" value="<ww:property value="actionType"/>"/>
<table style='width:80%' align='center'>
	<tr>
		<td id="buttonTD1" align='right' width='48%'></td>
		<td>&nbsp;</td>
		<td id="buttonTD2" align='left' width='48%'></td>
	</tr>
</table>
</form>
<script language="javascript">
	new Ext.Button({
        text: '�� ��',
        handler: function(){
        		document.form1.submit();
        }
    }).render(document.all.buttonTD1);
    new Ext.Button({
        text: '�� ��',
        handler: function(){
        	document.form1.reset();
        }
    }).render(document.all.buttonTD2);
</script>