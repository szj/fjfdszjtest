<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>
<%--
	 * �س�����
 	 * @author fangzl 
--%>
<ww:set name="expediteInfo" value="search.expediteInfo"/>
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>�ɳ���Ϣ</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right' width="17%">�������ݺ�:</td>
				<td colspan="3"><ww:property value="#expediteInfo.expedite_car_id"/></td>
			</tr>
			<tr>
				<td align='right' width="17%">�ɳ���:</td>
				<td width="33%"><ww:property value="#expediteInfo.expedite_man_name"/></td>
				<td align='right' width="17%">�������:</td>
				<td width="33%"><ww:property value="#expediteInfo.car_no_code"/></td>	
			</tr>
			<tr>
				<td align='right' width="17%">�ó���:</td>
				<td width="33%"><ww:property value="#expediteInfo.use_car_man_name"/></td>
				<td align='right' width="17%">�ó�����:</td>
				<td width="33%"><ww:property value="#expediteInfo.dept_name"/></td>	
			</tr>
			<tr>
				<td align='right' width="17%">��ʻԱ:</td>
				<td width="33%"><ww:property value="#expediteInfo.driver_name"/></td>
				<td align='right' width="17%">�ɳ�����:</td>
				<td width="33%"><ww:property value="#expediteInfo.expedite_date"/></td>	
			</tr>
			<tr>
				<td align='right' width="17%">��ʼ���:</td>
				<td width="33%"><ww:property value="#expediteInfo.init_mileage"/>  ��λ������</td>
				<td align='right' width="17%">Ԥ�ƻس�ʱ��:</td>
				<td width="33%"><ww:property value="#expediteInfo.intending_date"/></td>	
			</tr>
			<tr>
				<td align='right' width="17%" >�ó�����:</td>
				<td colspan="3"><ww:property value="#expediteInfo.use_excuse"/></td>
			</tr>
		</tbody>
	</table>
	<br>
	<table class='simple' style='width: 98%' align='center'
		id="maintaindetailinfo">
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
	<br>
	
	<table class='simple' style='width: 98%' align='center'
		id="maintaindetailinfo">
		<thead>
			<tr>
				<th colspan='8'>�س���;վ����Ϣ</th>
			</tr>
		</thead>
		<tbody id="maintaintbody">
			<tr>				
				<td align='center'>���</td>
				<td align='center'>����ʱ��</td>
				<td align='center'>������</td>
				<td align='center'>Ŀ�ĵ�</td>
				<td align='center'>Ŀ��ʱ��</td>
				<td align='center'>ֹ������</td>
				<td align='center'>ʵ����ʻ������</td>	
				<td align='center'>ʵ���ó�ʱ��</td>		
			</tr>
			<ww:iterator value="gobackRoldList" status="roldInfo">               		
        	<tr>   
        		<td  valign="top" align='center'>
					<ww:property value="first_locus"/>
				</td>
				<td  valign="top" align='center'>				
					<ww:property value="first_date"/>
				</td>
				<td  valign="top" align='center'>				
					<ww:property value="first_mileage"/>
				</td>
				<td  valign="top" align='center'>
					<ww:property value="transfer_locur"/>					 
				</td>
				<td  valign="top" align='center'>					
					<ww:property value="transfer_date"/>
				</td>
				<td  valign="top" align='center'>				
					<ww:property value="transfer_mileage"/>
				</td>
				<td  valign="top" align='center'>
					<ww:property value="run_mileage"/>
				</td>	
				<td  valign="top" align='center'>
					<ww:property value="run_time"/>
				</td>
				<!-- 		
				<td  valign="top" align='center'>
					<ww:property value="road_charge"/>				
				</td>
				<td  valign="top" align='center'>
					<ww:property value="use_oil_num"/>
				</td>
				<td  valign="top" align='center'>
					<ww:property value="use_oil_charge"/>
				</td>
				 -->			 
       		</tr>   
       		</ww:iterator>  
       	</tbody>
     </table>