<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	���񵥾���Ϣ
 -->
<ww:action name="'select'" id="select"></ww:action>

	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					���񵥾���Ϣ
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right' width="17%">���ݺ�:</td>
				<td width="33%">
					<ww:property value="search.finance_id"/>
				</td>
				<td align='right' width="17%">��������:</td>
				<td width="33%">
					<ww:property value="search.booking_date"/>
				</td>
			</tr>
			<tr>
				<td align='right'>Դ������:</td>
				<td>
					<ww:property value="search.source_order_type_name"/>
				</td>
				<td align='right'>Դ����:</td>
				<td>
					<ww:if test="\"1\".equals(search.source_order_type)">
						<a href="javascript:parent.addTab('���񵥾���Ϣ-���ͷ���', 'viewSourceOrder_PutOnSteamManage', '/carmanage/putonsteam/putonsteam.shtml?actionType=view&search.putonsteamId=<ww:property value="search.source_order_code"/>','NO')">
							<ww:property value="search.source_order_code"/>
						</a>
					</ww:if>
					<ww:if test="\"2\".equals(search.source_order_type)">
						<a href="javascript:parent.addTab('���񵥾���Ϣ-ά�޷���', 'viewSourceOrder_MaintainBooking', '/carmanage/servicingmanage/servicingBooking.shtml?actionType=view&search.maintainId=<ww:property value="search.source_order_code"/>','NO')">
							<ww:property value="search.source_order_code"/>
						</a>
					</ww:if>
					<ww:if test="\"3\".equals(search.source_order_type)">
						<a href="javascript:parent.addTab('���񵥾���Ϣ-��������', 'viewSourceOrder_MaintainManage', '/carmanage/maintainmanage/maintainManage.shtml?actionType=view&search.nurseId=<ww:property value="search.source_order_code"/>','NO')">
							<ww:property value="search.source_order_code"/>
						</a>
					</ww:if>
					<ww:if test="\"4\".equals(search.source_order_type)">
						<a href="javascript:parent.addTab('���񵥾���Ϣ-��·���ŷ���', 'viewSourceOrder_RoadBridgeCharge', '/carmanage/roadbridgecharge/roadBridgeCharge.shtml?actionType=view&search.nurseId=<ww:property value="source_order_code"/>','NO')">
							<ww:property value="search.source_order_code"/>
						</a>
					</ww:if>
				</td>
			</tr>
			<tr>
				<td align='right'>�������:</td>
				<td>
					<ww:property value="search.car_no_code"/>
				</td>
				<td align='right'>���:</td>
				<td>
					<ww:property value="search.charge"/>
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