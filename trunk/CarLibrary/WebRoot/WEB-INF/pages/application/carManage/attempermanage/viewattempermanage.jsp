<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	���͹���
 -->
<ww:action name="'select'" id="select"></ww:action>

<form methd='POST' name='form1' action='/carmanage/attemperManage/attemper.shtml' class="formcheck" onsubmit="return checkSubmit();">
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					���ȼ�¼��Ϣ
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right' width="17%">�������:</td>
				<td width="33%">
					<ww:property value="search.car_no_code"/>
				</td>
				<td align='right' width="17%">˾��:</td>
				<td width="33%">
					<ww:property value="search.motor_id_name"/>
				</td>
			</tr>
			<tr>
				<td align='right'>���ȵص�:</td>
				<td colspan="3">
					<ww:property value="search.attemper_locus"/>
				</td>
			</tr>
			<tr>
				<td align='right'>�ó�����:</td>
				<td>
					<ww:property value="search.dept_id_name"/>
				</td>
				<td align='right'>�ó���:</td>
				<td>
					<ww:property value="search.use_car_man_name"/>
				</td>
			</tr>
			<tr>
				<td align='right'>����ԭ��:</td>
				<td colspan="3">
					<ww:property value="search.attemper_cause"/>
				</td>
			</tr>
			<tr>
				<td align='right'>��ע:</td>
				<td colspan="3">
					<ww:property value="search.memo"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					��������:
				</td>
				<td colspan="3">
					<ww:property value="search.city_name"/>
				</td>
			</tr>	
		</tbody>
	</table>
	<input type='hidden' name='search.attemperManageId' value='<ww:property value="search.attemper_manage_id"/>'/>
	<input type='hidden' name='actionType' value='<ww:property value="action"/>' />
</form>

