<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	���͹���
 -->
<ww:action name="'select'" id="select"></ww:action>

	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					������Ϣ
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right' width="17%">
					����ʱ��:
				</td>
				<td width="33%">
					<ww:property value="search.put_on_date"/>
				</td>
				<td align='right' width="17%">
					���ͳ������:
				</td>
				<td width="33%">
					<ww:property value="search.carNoId"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					����վ:
				</td>
				<td>
					<ww:property value="search.gasStation"/>
			    </td>				
				<td align='right'>
					��������:
				</td>
				<td>
					<ww:property value="search.putOnType"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					�ϴμ������:
				</td>
				<td>
					<ww:property value="search.last_put_on_mileage"/> ��λ������
				</td>
				<td align='right'>
					����ʱ������:
				</td>
				<td>
					<ww:property value="search.put_on_mileage"/> ��λ������
				</td>
			</tr>	
			<tr>
				<td align='right'>
					��ʻ���:
				</td>
				<td>
					<ww:property value="search.run_mileage"/> ��λ������
				</td>
				<td align='right'>
					����������:
				</td>
				<td>
				    <ww:property value="search.oil_total"/> ��λ����
				</td>
			</tr>
		   <tr>
				<td align='right'>
					�ϴμ����� :
				</td>
				<td>
				   <ww:property value="search.last_put_on_oil"/> ��λ����
				</td>
				<td align='right'>
					�ϴδ�����:
				</td>
				<td>
				  <ww:property value="search.last_put_on_exoil"/> ��λ����
				</td>
			</tr>
			
			<tr>
				<td align='right'>
					��ǰ������:
				</td>
				<td>
				  <ww:property value="search.put_on_oil"/> ��λ����
				</td>
				<td align='right'>
					��ǰ������:
				</td>
				<td>
				  <ww:property value="search.put_on_exoil"/> ��λ����
				</td>
			</tr>
			
			<tr>
			
				<td align='right'>
					����:
				</td>
				<td>
					<ww:property value="search.price"/> ��λ��Ԫ
				</td>
				<td align='right'>
					���:
				</td>
				<td>
					<ww:property value="search.charge"/> ��λ��Ԫ
				</td>	
			</tr>		
			<tr>
				<td align='right'>
					�ٹ����ͺ�:
				</td>
				<td>
				<ww:property value="search.consume_100"/>
				</td>
				<td align='right'>
					������:
				</td>
				<td>
					<ww:property value="search.put_on_num"/>��λ����
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
					<ww:property value="search.cityName"/>
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
