<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<%--
 * ������λ��Ϣ����
 * @author zhengmh 
--%>

<table class='simple' style='width:90%' align='center'>
	<thead>
		<tr>
			<th colspan="4">������λ��Ϣ</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td align='right' width="17%">������λ���:</td>
			<td width="33%"><ww:property value="search.coop_unit_code"/></td>
			<td align='right' width="17%">������λ���:</td>
			<td width="33%"><ww:property value="search.coopUnitType"/></td>
		</tr>
		<tr>
			<td align='right'>������λ����:</td>
			<td><ww:property value="search.coop_unit_name"/></td>
			<td align='right'>������λ���:</td>
			<td><ww:property value="search.unit_easy_name"/></td>
		</tr>
		<tr>
			<td align='right'>�绰:</td>
			<td><ww:property value="search.phone"/></td>
			<td align='right'>����:</td>
			<td><ww:property value="search.fax"/></td>
		</tr>
		<tr>
			<td align='right'>��ϵ��:</td>
			<td><ww:property value="search.link_man"/></td>
			<td align='right'>��ϵ�˵绰:</td>
			<td><ww:property value="search.link_man_phone"/></td>
		</tr>
		<tr>	
		    <td align='right'>��ע��</td>
			<td colspan="3">
				<ww:property  value="search.memo"/>
			</td>
		</tr>
		<tr>				
			<td align='right'>��������:</td>
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