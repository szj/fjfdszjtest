<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>
<%--
	 * 收件人信息管理增加与编辑 
 	 * @author zhengmh 
--%>
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					收件人信息
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right' width="17%">
					收件人城市:
				</td>
				<td width="33%">
				    <ww:property value="search.code"/>
				</td>
				<td align='right' width="17%">
					收件人姓名:
				</td>
				<td width="33%">
					<ww:property value="search.name"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					收件人单位:
				</td>
				<td colspan=3>
				    <ww:property value="search.unit"/>
				</td>
			</tr>
			
            <tr>
				<td align='right'>收件人详细地址:</td>
				<td colspan="3">
				    <ww:property value="search.address"/>
				</td>
			</tr>
			<tr>
				<td align='right'>收件人联系电话:</td>
				<td>
				    <ww:property value="search.tel"/>
				</td>
				<td align='right'>收件人邮编:</td>
				<td>
					<ww:property value="search.post"/>
				</td>
			</tr>
			<tr>
				<td align='right'>创建人:</td>
				<td>
					<ww:property value="search.create_man_name "/>
				</td>
				<td align='right'>创建时间:</td>
				<td>
					<ww:property value="search.create_date"/>
			    </td>
			</tr>
			<tr>
				<td align='right'>编辑人:</td>
				<td>
					<ww:property value="search.editor_man_name"/>
				</td>
				<td align='right'>编辑时间:</td>
				<td>
					<ww:property value="search.editor_date"/>
			    </td>
			</tr>
			<tr>
				<td align='right'>执行人:</td>
				<td>
					<ww:property value="search.execute_man_name"/>
				</td>
				<td align='right'>执行时间:</td>
				<td>
					<ww:property value="search.execute_date"/>
			    </td>
			</tr>
		</tbody>
	</table>
