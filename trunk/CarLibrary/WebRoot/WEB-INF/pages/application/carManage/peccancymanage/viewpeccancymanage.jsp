<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>
<%--
	 * Υ�¹���
 	 * @author fangzl 
--%>
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					�����Υ����Ϣ
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right' width="17%">
					Υ������:
				</td>
				<td >
					<ww:property value="search.peccancy_type_desc"/>
				</td>
				<td align='right' width="17%">
					Υ�³������:
				</td>
				<td width="33%">
					<ww:property value="search.car_no_code"/>
				</td>
			</tr>
			<tr>
				
				<td align='right'>
					Υ������:
				</td>
				<td>
					<ww:property value="search.peccancy_date"/>
				</td>
				<td align='right'>
					Υ�µص�:
				</td>
				<td>
					<ww:property value="search.peccancy_address"/>
				</td>
			</tr>
            <tr>
				<td align='right'>
					Υ������:
				</td>
				<td colspan="3">
					<ww:property value="search.peccancy_context"/>
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
