<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<!--
	������Ϣ���� 
 -->
<table class='simple' style='width:80%' align='center'>
	<thead>
		<tr>
			<th colspan='4'>������Ϣ</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td align='right' width="17%">���Ʊ��(���ƺ�):</td>
			<td width="33%" colspan="3"><ww:property value="search.car_no_code"/></td>
		</tr>
		<tr>
			<td align='right'>������˾:</td>
			<td><ww:property value="search.belongCompany"/></td>	
			<td align='right' width="17%">�ն�����:</td>
			<td width="33%"><ww:property value="search.terminalType"/></td>
		</tr>
		<tr>
			<td align='right'>���ص绰:</td>
			<td><ww:property value="search.car_phone"/></td>
			<td align='right'>������ɫ:</td>
			<td><ww:property value="search.color2"/></td>	
		</tr>
		<tr>
			<td align='right'>��ʻ��̳�ʼ:</td>
			<td><ww:property value="search.run_mileage_init"/> ��λ����</td>
			<td align='right'>��ǰ��ʻ�����:</td>
			<td><ww:property value="search.curr_run_mileage"/> ��λ����</td>
		</tr>
		<tr>
			<td align='right'>��װʱ��:</td>
			<td><ww:property value="search.install_date"/></td>
			<td align='right'>��������:</td>
			<td><ww:property value="search.buy_date"/></td>	
		</tr>
		<tr>				
			<td align='right'>��������:</td>
			<td>
				<ww:property value="search.cityId"/>
			</td>
			<td align='right'>����������:</td>
			<td>
				<ww:property value="search.oil_total"/> ��λ����
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
<div style="color:red">
	&nbsp;&nbsp;&nbsp;&nbsp;ע������ʻ��̳�ʼ��Ϊ������Ϣ�Ǽ�ʱ�ĳ������ֵ��
</div>
	
<br>
<table id="equipmentTab" class='simple' style='width:80%' align='center'>
	<thead>
		<tr>
			<th colspan="4">�豸��Ϣ</th>
		</tr>
	</thead>
	<tbody id="equipmentBody">
		<tr>
			<td align='center' width="20%">�豸���</td>
			<td align='center' width="20%">�豸����</td>
			<td align='center'>��ע</td>
			<td align='center' width="8%">
				<a href="javascript:fun_add()">[���]</a>
			</td>
		</tr>
		<ww:iterator value="carFixingList">
			<tr>
				<td align='center' width="20%">
					<ww:property value="fixing_code"/>
				</td>
				<td align='center' width="20%"><ww:property value="fixing_name"/></td>
				<td align='center'><ww:property value="memo"/></td>
				<td align='center' width="8%">
					<A style='cursor:hand' onclick='del_row();'>ɾ��</a>
				</td>
			</tr>
		</ww:iterator>
	</tbody>
	<tfoot id="equipmentFoot">
	</tfoot>
</table>