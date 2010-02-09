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
				����ά��������Ϣ
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
			<td>
				<ww:property value="search.maintain_mileage"/> ��λ������
			</td>
			<td align='right'>
				��������:
			</td>
			<td>
				<ww:property value="search.city_name"/>
			</td>
		</tr>
		<tr>
			<td align='right'>ά��ԭ��:</td>
			<td colspan="3">
				<ww:property value="search.maintain_excuse"/>
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
	</tbody>
</table>
<br>
<table class='simple' style='width: 80%' align='center'>
	<thead>
		<tr>
			<th colspan='4'>
				����ά�޵Ǽ���Ϣ
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td align='right' width="17%">ά�����ʱ��:</td>
			<td width="33%">
				<ww:property value="search.maintain_end_date"/>
			</td>
			<td align='right' width="17%">���:</td>
			<td width="33%">
				<ww:property value="search.charge"/> ��λ��Ԫ
			</td>
		</tr>
		<tr>
			<td align='right'>ά�޽��:</td>
			<td colspan="3">
				<ww:property value="search.maintain_result"/>
			</td>
		</tr>
	</tbody>
</table>
<br>
<table id='detailTable' class='simple' style='width: 98%' align='center'>
	<thead>
		<tr>
			<th colspan='8'>
				ά����ϸ
			</th>
		</tr>
		<tr>
			<th width='40'>�к�</th>
			<th width='200'>ά����Ŀ</th>
			<th width='55'>������λ</th>
			<th width='50'>����</th>
			<th width='50'>����</th>
			<th width='50'>���</th>
			<th>��ע</th>
		</tr>
	</thead>
	<ww:iterator value="search.detailList" status="detailList">
		<tr>
			<td align='center'><ww:property value="#detailList.count"/></td>
			<td align='center'><ww:property value="maintain_item"/></td>
			<td align='center'><ww:property value="unit"/></td>
			<td align='center'><ww:property value="num"/></td>
			<td align='center'><ww:property value="price"/></td>
			<td align='center'><ww:property value="charge"/></td>
			<td align='center'><ww:property value="memo"/></td>
		</tr>
	</ww:iterator>
</table>
