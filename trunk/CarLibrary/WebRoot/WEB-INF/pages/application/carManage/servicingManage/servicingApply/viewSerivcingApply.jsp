<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	����ά������
 -->
<ww:action name="'select'" id="select"></ww:action>

	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					����ά������
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right'>ά��ʱ��:</td>
				<td>
					<ww:property value="search.maintain_date"/>
				</td>
				<td align='right' width="17%">ά�޳������:</td>
				<td width="33%">
					<ww:property value="search.car_no_code"/>
				</td>
			</tr>
			<tr>
				<td align='right' width="17%">������:</td>
				<td width="33%">
					<ww:property value="search.proposer_name"/>
				</td>
				<td align='right' width="17%">ά�޳�:</td>
				<td width="33%">
					<ww:property value="search.coop_unit_name"/>
				</td>
			</tr>
			<tr>
				<td align='right'>ά�޹�����:</td>
				<td colspan="3">
					<ww:property value="search.maintain_mileage"/> ��λ������
				</td>
			</tr>
			<tr>
				<td align='right'>ά��ԭ��:</td>
				<td colspan="3">
					<ww:property value="search.maintain_excuse"/>
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
