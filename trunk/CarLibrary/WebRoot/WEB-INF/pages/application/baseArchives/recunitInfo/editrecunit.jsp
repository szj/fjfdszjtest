<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%--
 * ������λ��Ϣ����
 * @author zhengmh 
--%> 
<%@ include file="/common/taglibs.jsp"%>
<ww:action name="'select'" id="select"></ww:action>
<form methd='POST' name='form1' action='/basearchives/recunit/recunit.shtml' class="formcheck"  onsubmit="return checkSubmit();">
<script>
	var fm2 = new Ext.form.BasicForm('form1'); 
</script>	
	<table class='simple' style='width:80%' align='center'>
		<thead>
			<tr>
				<th colspan='8'>���������λ��Ϣ</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			    <td align='right'>������λ���:</td>
				<td>
					<tt:TextField name="search.coopUnitCode" value="search.coop_unit_code" width="200" verify='string' required='true' />
				</td>
				<td align='right'>������λ���:</td>
			    <td>
			    	<tt:ComboBox name="search.coopUnitType" value="search.coop_unit_type" verify="empty" required="true"
						sql="select PARA_VALUE id, PARA_VALUE_DESC text from td_system_para where para_type = 'COOP_UNIT_INFO' and para_name = 'COOP_UNIT_TYPE'"/>
				</td>	
			</tr>
			<tr>
				<td align='right'>������λ����:</td>
				<td>
					<tt:TextField name="search.coopUnitName" value="search.coop_unit_name" width="200" verify='string' required='true' />
				</td>
				<td align='right'>������λ���:</td>
				<td>
					<tt:TextField name="search.unitEasyName" value="search.unit_easy_name" width="200"/>
				</td>
			</tr>
			<tr>
				<td align='right'>�绰:</td>
				<td>
					<tt:TextField name="search.phone" value="search.phone" width="200" verify='string' required='true' />
				</td>
				<td align='right'>����:</td>
				<td>
					<tt:TextField name="search.fax" value="search.fax" width="200"/>
				</td>
				
			</tr>
			<tr>
				<td align='right'>��ϵ��:</td>
				<td>
					<tt:TextField name="search.linkMan" value="search.link_man" width="200" verify='string' required='true' />
				</td>
			    <td align='right'>��ϵ�˵绰:</td>
				<td>
					<tt:TextField name="search.linkManPhone" value="search.link_man_phone" width="200" verify='string' required='true' />
				</td>
			</tr>		
			<tr>	
			    <td align='right'>��ע��</td>
				<td colspan="3">
					<tt:TextArea name="search.memo" value="search.memo" width="400" height="50"/>
				</td>
			</tr>
			<tr>				
				<td align='right'>��������:</td>
				<td>
					<tt:ComboBox name="search.cityId" value="search.city_id" verify="empty" required="true"
							sql="'select city_id id, city_name text from td_city where city_id in (select city_id from tf_staff_city  where  staff_id=' + #session['UserInfo'].staffId+')'" />
				</td>
			</tr>	
			
		</tbody>
	</table>
		<input type='hidden' name='search.coopUnitId' value='<ww:property value="search.coop_unit_id"/>'/>
	<input type='hidden' name='actionType' value='<ww:property value="action"/>'/>
</form>
<table style='width:80%' align='center'>
	<tr>
		<td id="buttonTD1" align='right' width='48%'></td>
		<td>&nbsp;</td>
		<td id="buttonTD2" align='left' width='48%'></td>
	</tr>
</table>

<script language="javascript">
	Ext.get('form1').un("submit", fm2.onSubmit, fm2);
	var saveButton =new Ext.Button({
        text: '�� ��',
        handler: function(){
        	if (fm2.isValid()) {
	        	Ext.Msg.show({
				 	title:'��ȷ��һ��',
				 	modal : false,
				 	msg: '��ȷ��������ȷ��?',
				 	buttons: Ext.Msg.OKCANCEL,
				 	fn: function(btn, text){
						if (btn == 'ok'){
					 		document.form1.submit();
					 	} 
				 	},
				 	animEl: 'buttonTD1'
			 	});
        	} else {
        		Ext.Msg.show({
 					title:'��Ϣ',
					msg: '����д���������ύ!',
					modal : true,
					buttons: Ext.Msg.OK
 				});
        	}
        }
    }).render(document.all.buttonTD1);
    
    new Ext.Button({
        text: '�� ��',
        handler: function(){
        	document.form1.reset();
        }
    }).render(document.all.buttonTD2);

</script>