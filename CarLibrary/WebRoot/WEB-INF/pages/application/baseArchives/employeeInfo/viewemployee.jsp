<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<ww:action name="'select'" id="select"></ww:action>
	<table class='simple' style='width:80%' align='center'>
		<thead>
			<tr>
				<th colspan='8'>Ա����Ϣ</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			    <td align='right'>Ա�����:</td>
				<td >
					<ww:property value="search.staff_code"/>
				</td>
				<td align='right'>ϵͳ�û�:</td>
				<td >
					<ww:property value="search.operator_name"/>
				</td>
			</tr>
			<tr>
				<td align='right' width="17%">Ա������:</td>			
				<td width="33%">
					<ww:property value="search.staff_name"/>
				</td>
				<td align='right' width="17%">�Ա�:</td>
				<td width="33%">
					<ww:property value="search.sex2"/>
			    </td>
			</tr>
			<tr>
				<td align='right'>֤������:</td>
				<td>
					<ww:property value="search.certificateType"/>
			    </td>
			    <td align='right'>Ա������:</td>
				<td>
					<ww:property value="search.staffType"/>
				</td>
			</tr>
			<tr>
				<td align='right'>֤�����:</td>
				<td>
					<ww:property value="search.certificate_no"/>
				</td>
				<td align='right'>��ϵ�绰:</td>
				<td>
					<ww:property value="search.link_phone"/>
				</td>
			</tr>
			<tr>
				<td align='right'>������˾:</td>
				<td>
					<ww:property value="search.belongCompany"/>
			    </td>
				<td align='right'>������ϵ�绰:</td>
				<td>
					<ww:property value="search.link_other"/>
				</td>   
			</tr>
			<tr>
				<td align='right'>��������:</td>
			    <td>
					<ww:property value="search.belongDept"/>
			    </td>	
			    <td align='right'>���ն��ź���</td>
			    <td>
			    	<ww:property value="search.sms_phone"/>
			    </td>
			</tr>
			<tr>
				<td align='right'>���ƺ�:</td>
				<td>
					<ww:property value="search.carNo"/>			    	
			    </td>
			    <td align='right'>IC�����:</td>
				<td>
					<ww:property value="search.Ic_Code"/>			    	
			    </td>
			</tr>
			<tr>
				<td align='right'>��ְʱ��:</td>
				<td>
					<ww:property value="search.accession_date"/>
				</td>
			    <td align='right'>��ְʱ��:</td>
			    <td>
			    	<ww:property value="search.dimission_date"/>
			    </td>
			</tr>
			<tr>
				<td align='right'>ͨ�ŵ�ַ:</td>
				<td colspan="3">
					<ww:property value="search.address"/>
				</td>
			</tr>
			<tr>
				<td align='right'>��ע��</td>
				<td  colspan="3">
					<ww:property value="search.memo"/>
				</td>
			</tr>	
			<tr>				
				<td align='right'>��������:</td>
				<td>
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
