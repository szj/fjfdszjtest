<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>

	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					�������·����Ϣ
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right'>
					��������:
				</td>
				<td colspan="3">
					<ww:property value="search.booking_date"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					�������:
				</td>
				<td colspan="3">
					<ww:property value="search.carNoId"/>
				</td>
			</tr>
			<tr>
				<td align='right' width="17%">
					�շ���Ŀ����:
				</td>
				<td width="33%">
					<ww:property value="search.charge_item_name"/>
				</td>
				<td align='right' width="17%">
					�շѱ�׼:
				</td>
				<td width="33%">
					<ww:property value="search.charge_standard"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					�շѷ�Χ:
				</td>
				<td>
					<ww:property value="search.charge_bound"/>
				</td>
				<td align='right'>
					��׼����:
				</td>
				<td>
					<ww:property value="search.authorize_organ"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					��������:
				</td>
				<td colspan="3">
					<ww:property value="search.cityId"/>
				</td>
			</tr>
			<tr>
				<td align='right'>������:</td>
				<td>
					<ww:property value="search.create_man_name "/>
				</td>
				<td align='right'>����ʱ��:</td>
				<td>
					<ww:property value="search.create_date"/>
			    </td>
			</tr>
			<tr>
				<td align='right'>�༭��:</td>
				<td>
					<ww:property value="search.editor_man_name"/>
				</td>
				<td align='right'>�༭ʱ��:</td>
				<td>
					<ww:property value="search.editor_date"/>
			    </td>
			</tr>
			<tr>
				<td align='right'>ִ����:</td>
				<td>
					<ww:property value="search.execute_man_name"/>
				</td>
				<td align='right'>ִ��ʱ��:</td>
				<td>
					<ww:property value="search.execute_date"/>
			    </td>
			</tr>
		</tbody>
	</table>
