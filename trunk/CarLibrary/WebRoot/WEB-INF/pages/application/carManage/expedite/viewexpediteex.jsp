<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>
<%--
	 * �ɳ�����
 	 * @author fangzl 
--%>
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					�鿴�ɳ���Ϣ
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right'>�ɳ�����:</td>
				<td colspan="3">
					<ww:property value="search.expedite_date"/>
				</td>
			</tr>
			<tr>
				<td align='right' width="17%">
					�ɳ���:
				</td>
				<td width="33%">
					<ww:property value="search.expedite_man_name"/>
				</td>
				<td align='right' width="17%">
					�ó���:
				</td>
				<td width="33%">
					<ww:property value="search.use_car_man_name"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					�ó�����:
				</td>
				<td>
					<ww:property value="search.dept_name"/>
				</td>
				<td align='right'>
					�������:
				</td>
				<td>
					<ww:property value="search.car_no_code"/>
				</td>
			</tr>
            <tr>
				<td align='right'>
					��ʻԱ:
				</td>
				<td>
					<ww:property value="search.driver_nameex"/>
				</td>
				<td align='right'>
					��ʻԱ��ϵ�绰:
				</td>
				<td>
					<ww:property value="search.driver_mobile"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					Ԥ���ó�ʱ��:
				</td>
				<td>
					<ww:property value="search.intending_dateex"/>
				</td>
				<td align='right'>
					��ʼ���:
				</td>
				<td>
					<ww:property value="search.init_mileage"/>  ��λ������
				</td>
			</tr>
			<tr>
				<td align='right'>
					Ԥ�ƻس�ʱ��:
				</td>
				<td colspan="3">
					<ww:property value="search.intending_date"/>
				</td>				
			</tr>
			<tr>
				<td align='right'>
					�ó�����:
				</td>
				<td colspan="3">
					<ww:property value="search.use_excuse"/>
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
	<br>
	<table class='simple' style='width: 98%' align='center' id="maintaindetailinfo">
		<thead>
			<tr>
				<th colspan='10'>��;վ����Ϣ�Ǽ�</th>
			</tr>
		</thead>
		<tbody id="maintaintbody">
			<tr>				
				<td align='center'>������</td>
				<td align='center'>����ʱ��</td>
				<td align='center'>��תվ</td>
				<td align='center'>��תվʱ��</td>			
			</tr>
			<ww:iterator value="roldInfoList" status="roldInfo">               		
	        	<tr>   
	        		<td  valign="top" align='center'>
						<ww:property value="first_locus"/>
					</td>
					<td  valign="top" align='center'>				
						<ww:property value="first_date"/>
					</td>
					<td  valign="top" align='center'>
						<ww:property value="transfer_locur"/>					 
					</td>
					<td  valign="top" align='center'>					
						<ww:property value="transfer_date"/>
					</td>			 
	       		</tr>   
       		</ww:iterator>   
		</tbody>
	</table>
