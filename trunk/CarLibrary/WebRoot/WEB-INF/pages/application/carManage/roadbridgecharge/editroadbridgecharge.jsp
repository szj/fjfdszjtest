<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	��·���ŷ��ù���
 -->
<ww:action name="'select'" id="select"></ww:action>

<form methd='POST' name='form1' action='/carmanage/roadbridgecharge/roadBridgeCharge.shtml' class="formcheck" onsubmit="return checkSubmit();">
<script>
	var fm2 = new Ext.form.BasicForm('form1'); 
</script>	
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					��·���ŷ�����Ϣ
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right' width="17%">�������:</td>
				<td width="33%" colspan="3">
					<tt:ComboBox name="search.carNoId" value="search.car_no_id" shade="true" requiredColor="#ffffff" verify="empty" required="true" editable="true"
						sql="'select distinct car_no_id id, car_no_code text 
							   from tf_car_info 
							  where state = 1
							    and city_id in (select city_id 
							    				  from tf_staff_city  
							    				 where staff_id=' + #session['UserInfo'].staffId+')'"/>
				</td>
			</tr>
			<tr>
				<td align='right' width="17%">�շ�����:</td>
				<td width="33%">
					<tt:ComboBox name="search.chargeType" value="search.charge_type" shade="true" requiredColor="#ffffff" verify="empty" required="true"
						sql="select PARA_VALUE id, PARA_VALUE_DESC text       
							   from td_system_para tt 
					          where tt.para_type='ROAD_BRIDGE_CHARGE' 
					            and tt.para_name = 'CHARGE_TYPE'"/>
				</td>
				<td align='right' width="17%">�շ�ʱ��:</td>
				<td width="33%">
					<tt:DateFiled name="search.chargeDate" value="search.charge_date" verify='string' required='true' shade='true' requiredColor='#ffffff'/>
				</td>
			</tr>
			<tr>
				<td align='right' width="17%">�շѱ�׼:</td>
				<td>
					<tt:TextField name="search.chargeStandard" value="search.charge_standard" width="200" verify='string' required='true' shade='true' requiredColor='#ffffff'/>
				</td>
				<td align='right' width="17%">�շѵ�:</td>
				<td>
					<tt:TextField name="search.chargeAddress" value="search.charge_address" width="200" verify='string' required='true' shade='true' requiredColor='#ffffff'/>
				</td>
			</tr>
			<tr>
				<td align='right' width="17%">����:</td>
				<td colspan="3">
					<tt:TextField name="search.charge" value="search.charge" width="200" verify='double+' required='true' shade='true' requiredColor='#ffffff'/> ��λ��Ԫ
				</td>
			</tr>
			<tr>	
			    <td align='right'>��ע��</td>
				<td colspan="3">
					<tt:TextArea name="search.memo" value="search.memo" width="400" height="50"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					��������:
				</td>
				<td colspan="3">
					<tt:ComboBox name="search.cityId" value="search.city_id" shade="true" requiredColor="#ffffff" verify="empty" required="true"
							sql="'select city_id id, city_name text from td_city where city_id in (select city_id from tf_staff_city  where  staff_id=' + #session['UserInfo'].staffId+')'" />
				</td>
			</tr>	
		</tbody>
	</table>
	<input type='hidden' name='search.roadBridgeChargeId' value='<ww:property value="search.road_bridge_charge_id"/>'/>
	<input type='hidden' name='actionType' value='<ww:property value="action"/>' />
</form>
<table style='width: 80%' align='center'>
	<tr>
		<td id="buttonTD1" align='right' width='48%'></td>
		<td>
			&nbsp;
		</td>
		<td id="buttonTD2" align='left' width='48%'></td>
	</tr>
</table>
<br>
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