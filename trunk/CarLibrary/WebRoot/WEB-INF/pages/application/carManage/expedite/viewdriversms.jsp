<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	˾���г���¼��Ϣ
 -->
<ww:action name="'select'" id="select"></ww:action>

	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					˾���г���¼
				</th>
			</tr>
		</thead>
		<tbody>
		    <tr>
		    	<td align='right'>���ƺţ�</td>
				<td colspan="3" >
					<ww:property value="search.car_mark"/>
				</td>
		    </tr>
			<tr>
				<td align='right' width="17%">
					˾��:
				</td>
				<td width="33%">
				    <ww:property value="search.driver_staffname"/>
				</td>
				<td align='right' width="17%">
					˾���ֻ�:
				</td>
				<td width="33%">
				    <ww:property value="search.driver_mobile"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					���:
				</td>
				<td>
				    <ww:property value="search.first_locus"/>
				</td>
				<td align='right'>
					���ʱ��:
				</td>
				<td>
				    <ww:property value="search.first_date"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					�յ�:
				</td>
				<td>
				    <ww:property value="search.transfer_locur"/>
				</td>
				<td align='right'>
					�յ�ʱ��:
				</td>
				<td>
				    <ww:property value="search.transfer_date"/>
				</td>
			</tr>
            <tr>
				<td align='right'>
					˾����ʼ���:
				</td>
				<td>
				    <ww:property value="search.first_mileage"/>
				</td>
				<td align='right'>
					˾���س����:
				</td>
				<td>
				    <ww:property value="search.transfer_mileage"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					˾����ʻ���:
				</td>
				<td>
				    <ww:property value="search.run_mileage"/>
				</td>
				<td align='right'>
					������:
				</td>
				<td>
				    <ww:property value="search.use_oil_num"/>
				</td>				
			</tr>
			<tr>
				<td align='right'>
					���ͽ��:
				</td>
				<td>
					<ww:property value="search.use_oil_charge"/>
				</td>
				<td align='right'>
					·�ŷ�:
				</td>
				<td>
				    <ww:property value="search.road_charge"/>
				</td>				
			</tr>	
			<tr>
				<td align='right'>
					ס�޷�:
				</td>
				<td>
				    <ww:property value="search.reside_charge"/>
				</td>
				<td align='right'>
					ͣ����:
				</td>
				<td>
					<ww:property value="search.stopcar_charge"/>
				</td>				
			</tr>	
			<tr>
				<td align='right'>
					ϴ����:
				</td>
				<td>
					<ww:property value="search.washcar_charge"/>
				</td>	
				<td align='right'>
					��������:
				</td>
				<td >
					<ww:property value="search.city_name"/>
				</td>	
			</tr>
			<tr>
			    <td align='right'>��ע��</td>
				<td colspan="3">
					<ww:property value="search.sms_memo"/>
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
