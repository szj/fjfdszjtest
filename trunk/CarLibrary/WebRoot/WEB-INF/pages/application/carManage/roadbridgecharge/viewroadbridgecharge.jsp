<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	��·���ŷ��ù���
 -->
<ww:action name="'select'" id="select"></ww:action>

	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					��·���ŷ�����Ϣ
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right' width="17%">�������:</td>
				<td width="33%" colspan="3">
					<ww:property value="search.car_no_code"/>
				</td>
			</tr>
			<tr>
				<td align='right' width="17%">�շ�����:</td>
				<td width="33%">
					<ww:property value="search.charge_type_desc"/>
				</td>
				<td align='right' width="17%">�շ�ʱ��:</td>
				<td width="33%">
					<ww:property value="search.charge_date"/>
				</td>
			</tr>
			<tr>
				<td align='right' width="17%">�շѱ�׼:</td>
				<td>
					<ww:property value="search.charge_standard"/>
				</td>
				<td align='right' width="17%">�շѵ�:</td>
				<td>
					<ww:property value="search.charge_address"/>
				</td>
			</tr>
			<tr>
				<td align='right' width="17%">����:</td>
				<td colspan="3">
					<ww:property value="search.charge"/> ��λ��Ԫ
				</td>
			</tr>
			<tr>	
			    <td align='right'>��ע��</td>
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
