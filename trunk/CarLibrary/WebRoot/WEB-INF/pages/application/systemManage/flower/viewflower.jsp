<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>
<%--
   * ���̶���
--%>
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					�鿴���̶���
				</th>
			</tr>
		</thead>
		<tbody>
		    <tr>
				<td align='right'>���̱��:</td>				
				<td>
				  <ww:property value="search.flowerdefine_code"/>
				</td>
				<td align='right'>��������:</td>
				<td>
				  <ww:property value="search.flowerdefine_name"/>					
				</td>				
			</tr>
            <tr>
            	<td align='right'>�汾:</td>
				<td>					
					<ww:property value="search.flowerdefine_versions"/>	*���ð汾����ߵ�
				</td>	
				<td align='right'>��������:</td>
				<td>
				    <ww:property value="search.city_id"/>
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
				<th colspan='10'>���̽��������Ϣ</th>
			</tr>
		</thead>
		<tbody id="maintaintbody">
			<tr>				
				<td align='center'>��������</td>
				<td align='center'>�����Ƿ�����</td>
				<td align='center'>�Ƿ�ͬһ����</td>
				<td align='center'>�Ƿ����</td>			
				<td align='center'>������Ա</td>			
			</tr>
			<ww:iterator value="flowerNodeList" status="flowerNode">               		
	        	<tr>   
	        		<td  valign="top" align='center'>
						<ww:property value="flowernode_name"/>
					</td>
					<td  valign="top" align='center'>				
						<ww:property value="is_flowmust_name"/>
					</td>
					<td  valign="top" align='center'>
						<ww:property value="is_samedep_name"/>					 
					</td>
					<td  valign="top" align='center'>					
						<ww:property value="is_flowers_name"/>
					</td>	
					<td  valign="top" align='center'>					
						<ww:property value="approve_codearrayname"/>
					</td>
	       		</tr>   
       		</ww:iterator>   
		</tbody>
	</table>
