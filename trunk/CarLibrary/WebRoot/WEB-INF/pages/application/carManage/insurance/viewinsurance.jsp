<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>
<%--
	 * ���չ���
 	 * @author zhengmh 
--%>
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					����±�����Ϣ
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right'>��������:</td>
				<td colspan="3">
					<ww:property value="search.booking_date"/>
				</td>
			</tr>
			<tr>
				<td align='right' width="17%">
					��������:
				</td>
				<td width="33%">
					<ww:property value="search.insurant"/>
				</td>
				<td align='right' width="17%">
					���ճ������:
				</td>
				<td width="33%">
					<ww:property value="search.carNoId"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					���ս��:
				</td>
				<td>
					<ww:property value="search.insurance_charge"/>
				</td>
				<td align='right'>
					���տ�ʼ����:
				</td>
				<td>
					<ww:property value="search.begin_date"/>
				</td>
			</tr>
            <tr>
				<td align='right'>
					���շ�:
				</td>
				<td>
					<ww:property value="search.insurance_fee"/>
				</td>
				<td align='right'>
					���ս�������:
				</td>
				<td>
					<ww:property value="search.end_date"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					���չ�˾:
				</td>
				<td colspan="3">
					<ww:property value="search.insuranceAgent"/>
				</td>				
			</tr>
			<tr>
				<td align='right'>
					��;:
				</td>
				<td colspan="3">
					<ww:property value="search.purpose"/>
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
