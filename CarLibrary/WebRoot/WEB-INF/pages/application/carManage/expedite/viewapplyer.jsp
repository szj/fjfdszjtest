<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>
<%--
	 * �ɳ�������Ϣ
--%>
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					�鿴�ɳ�������Ϣ
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>	
				<td align='right' width="17%">�ɳ�����:</td>
				<td width="33%">
					<ww:property value="search.expediteapply_type_name"/>	
				</td>						
				<td align='right'>Ԥ���ó�ʱ��:</td>
				<td>	
				    <ww:property value="search.intending_date"/>				
				</td>
			</tr>		
			<tr>
				<td align='right' width="17%" >ʹ�õ�λ:</td>
				<td width="33%">
				  <ww:property value="search.dept_name"/>
				</td>		
				<td align='right'>�˴�ص�:</td>
				<td>
				   <ww:property value="search.destination_local"/>
				</td>		
			</tr>
			<tr>
		    	<td align='right' width="17%">�ó���:</td>
				<td>
				    <ww:property value="search.use_man"/>		     				  
				</td>
				<td align='right'>�ó�����ϵ�˷�ʽ:</td>				
				<td>
				    <ww:property value="search.use_mobile"/>
				</td>			
			</tr>
            <tr>   
				<td align='right'>�ó�����:</td>
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
	<table class='simple' style='width: 80%' align='center' id="maintaindetailinfo">
		<thead>
			<tr>
				<th colspan='4'>�������̼�¼</th>
			</tr>
		</thead>
		<tbody id="maintaintbody">
			<tr>				
				<td align='center'>������������</td>
				<td align='center'>������Ա</td>
				<td align='center'>����ʱ��</td>
				<td align='center'>��������</td>			
			</tr>
			<ww:iterator value="flowerTaskList" status="flowerTask">               		
	        	<tr>   
	        		<td  valign="top" align='center'>
						<ww:property value="flowernode_name"/>
					</td>
					<td  valign="top" align='center'>				
						<ww:property value="approve_name"/>
					</td>
					<td  valign="top" align='center'>
						<ww:property value="approve_date"/>					 
					</td>
					<td  valign="top" align='center'>					
						<ww:property value="approve_remark"/>
					</td>			 
	       		</tr>   
       		</ww:iterator>   
		</tbody>
	</table>
