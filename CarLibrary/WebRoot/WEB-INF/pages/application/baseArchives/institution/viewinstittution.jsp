<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>

<!--
 * �������
 * @author zhengmh
 -->
 
<table class='simple' style='width:90%' align='center'>
	<thead>
		<tr>
			<th colspan="4">������Ϣ</th>
		</tr>
	</thead>
	<tbody>
		<tr>
		    <td align='right'>��˾���:</td>
			<td colspan="3">
				<ww:property value="search.company_code"/>
			</td>
		</tr>
		<tr>
			<td align='right' width="17%">��˾����:</td>
			<td width="33%">
				<ww:property  value="search.company_name"/>
			</td>
			<td align='right' width="17%">��˾���:</td>
			<td width="33%">
				<ww:property  value="search.company_easy_name"/>
			</td>
		</tr>
		<tr>
			<td align='right'>ע������:</td>
			<td>
				<ww:property  value="search.reg_date"/>
			</td>
			<td align='right'>�ϼ���˾:</td>
			<td>
				<ww:property value="search.upCompany"/>
			</td>
		</tr>
		<tr>
			<td align='right'>��ϵ��:</td>
			<td>
				<ww:property  value="search.link_man" />
			</td>
			<td align='right'>��ϵ�绰:</td>
			<td>
				<ww:property  value="search.link_phone" />
			</td>
		</tr>
		<tr>
			<td align='right'>��˾����:</td>
			<td>
				<ww:property value="search.companyProperty"/>
			</td>
			<td align='right'>��˾��ҵ:</td>
			<td>
				<ww:property value="search.CALLING2"/>
		    </td>
		</tr>
		<tr>
			<td align='right'>������:</td>
			 <td colspan="3">
			 	<ww:property value="search.proxyLevel"/>
		    </td>
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