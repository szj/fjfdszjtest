<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>
<%--
	 * �ռ�����Ϣ����������༭ 
 	 * @author zhengmh 
--%>
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					�ļ�����Ϣ
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right' width="17%">
					�ļ����û�����:
				</td>
				<td width="33%">
				    <ww:property value="search.code"/>
				</td>
				<td align='right' width="17%">
					�ļ�������:
				</td>
				<td width="33%">
					<ww:property value="search.name"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					�ļ��˵�λ:
				</td>
				<td colspan=3>
				    <ww:property value="search.unit"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					�ļ�����������:
				</td>
				<td>
					<ww:property value="search.nation"/>
				</td>
				<td align='right'>
					�ļ�������ʡ��:
				</td>
				<td>
				    <ww:property value="search.provincename"/>
				</td>					
			</tr>
			<tr>
				<td align='right'>
					�ļ�����������:
				</td>
				<td>
				    <ww:property value="search.cityname"/>
				</td>
				<td align='right'>
					�ļ�����������:
				</td>
				<td>
				   <ww:property value="search.countyname"/>
				</td>							
			</tr>
            <tr>
				<td align='right'>��������ϸ��ַ:</td>
				<td colspan="3">
				    <ww:property value="search.address"/>
				</td>
			</tr>
			<tr>
				<td align='right'>��������ϵ�绰:</td>
				<td>
				    <ww:property value="search.tel"/>
				</td>
				<td align='right'>�ʱ�:</td>
				<td>
					<ww:property value="search.post"/>
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
