<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	���͹���
 -->
<ww:action name="'select'" id="select"></ww:action>

<form methd='POST' name='form1' action='/carmanage/putonsteam/putonsteam.shtml' class="formcheck" onsubmit="return checkSubmit();">
<script>
	var fm2 = new Ext.form.BasicForm('form1'); 
</script>	
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					������Ϣ
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right' width="17%">
					����ʱ��:
				</td>
				<td width="33%">
					<tt:DateFiled name="search.putOnDate" value="search.put_on_date" verify='string' required='true' shade='true' requiredColor='#ffffff'/>
				</td>
				<td align='right' width="17%">
					���ͳ������:
				</td>
				<td width="33%">
					<tt:ComboBox name="search.carNoId" value="search.car_no_id" shade="true" requiredColor="#ffffff" verify="empty" required="true" editable="true"
						onchange="getOilTotal(Ext.get('search.carNoId').dom.value)"
						sql="'select distinct car_no_id id, car_no_code text 
							   from tf_car_info 
							  where state = 1
							    and city_id in (select city_id 
							    				  from tf_staff_city  
							    				 where staff_id=' + #session['UserInfo'].staffId+')'"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					����վ:
				</td>
				<td>
					<tt:ComboBox name="search.gasStation" value="search.gas_station" shade="true" requiredColor="#ffffff" verify="empty" required="true" editable="true"
						sql="'select coop_unit_id id, coop_unit_name text
							    from tf_rec_unit_info tt 
							   where coop_unit_type = 1
							     and city_id in (select city_id 
							     				   from tf_staff_city  
							     				  where staff_id= ' + #session['UserInfo'].staffId+')'"/>
			    </td>				
				<td align='right'>
					��������:
				</td>
				<td>
					<tt:ComboBox name="search.putOnType" value="search.put_on_type" shade="true" requiredColor="#ffffff" verify="empty" required="true"
						sql="select PARA_VALUE id, PARA_VALUE_DESC text       
							   from td_system_para tt 
					          where tt.para_type='BASE_PARA'
					            and tt.para_name = 'PUT_ON_STEAM_TYPE'"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					�ϴμ������:
				</td>
				<td>
					<tt:TextField name="search.lastPutOnMileage" value="search.last_put_on_mileage" verify='double+' required='true' shade='true' requiredColor='#ffffff' onblur="acc_Mileage();acc_consume();"/> ��λ������
				</td>
				<td align='right'>
					����ʱ������:
				</td>
				<td>
					<tt:TextField name="search.putOnMileage" value="search.put_on_mileage" verify='double+' required='true' shade='true' requiredColor='#ffffff' onblur="acc_Mileage();acc_consume();"/> ��λ������
				</td>
			</tr>	
			<tr>
				<td align='right' style="color:red">
					��ʻ���:
				</td>
				<td>
					<tt:TextField name="search.runMileage" value="search.run_mileage" verify='double' required='true' shade='true' requiredColor='#ffffff' readonly="true"/> ��λ������
				</td>
				<td align='right' style="color:red">
					����������:
				</td>
				<td>
					<tt:TextField name="search.OilTotal" value="search.oil_total" verify='double+' required='true' readonly="true"  onblur="acc_lastputexoil();acc_putonexoil();" />
				</td>
			</tr>
			
			<tr>
				<td align='right'>
					�ϴμ����� :
				</td>
				<td>
					<tt:TextField name="search.lastPutonoil" value="search.last_put_on_oil" verify='double' required='true' shade='true' requiredColor='#ffffff' onblur="acc_lastputexoil();acc_putonnum();acc_consume();" /> ��λ����
				</td>
				<td align='right' style="color:red">
					�ϴδ�����:
				</td>
				<td>
					<tt:TextField name="search.lastPutonexoil" value="search.last_put_on_exoil" verify='double+' required='true' readonly="true"/>��λ����
				</td>
			</tr>
			
			<tr>
				<td align='right'>
					��ǰ������:
				</td>
				<td>
					<tt:TextField name="search.putOnoil" value="search.put_on_oil" verify='double' required='true' shade='true' requiredColor='#ffffff' onblur="acc_putonexoil();acc_putonnum();acc_consume();" /> ��λ����
				</td>
				<td align='right' style="color:red">
					��ǰ������ :
				</td>
				<td>
					<tt:TextField name="search.putOnExoil" value="search.put_on_exoil" verify='double+' required='true' readonly="true"/>��λ����
				</td>
			</tr>

			<tr>
				<td align='right'>
					����:
				</td>
				<td>
					<tt:TextField name="search.price" value="search.price" verify='double+' required='true' onblur="acc_charge()"/> ��λ��Ԫ
				</td>
				<td align='right' style="color:red">
					���:
				</td>
				<td>
					<tt:TextField name="search.charge" value="search.charge" verify='double+' required='true' readonly="true"/> ��λ��Ԫ
				</td>	
			</tr>		
			<tr>
				<td align='right' style="color:red">
					�ٹ����ͺ�:
				</td>
				<td>
					<tt:TextField name="search.consume_100" value="search.consume_100" verify='double' required='true' readonly="true"/>
				</td>
				
				<td align='right' style="color:red">
					������:
				</td>
				<td>
					<tt:TextField name="search.putOnNum" value="search.put_on_num" verify='double+' required='true' readonly="true"/>��λ����
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
	<input type='hidden' name='search.putonsteamId' value='<ww:property value="search.put_on_steam_id"/>'/>
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
<div style="color:red">
	&nbsp;&nbsp;&nbsp;&nbsp;ע����ʻ����� = ����ʱ������ - �ϴμ���ʱ��·��<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ٹ������ �� �������� &Chi; 100 / ��ʻ�����<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��� �� ���� &Chi; ����������<br>
</div>

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
    
	function acc_Mileage(){
		var putOnMileage = $('search.putOnMileage').value == '' ? 0 : $('search.putOnMileage').value;
		var lastPutOnMileage = $('search.lastPutOnMileage').value == '' ?0 : $('search.lastPutOnMileage').value;
		$('search.runMileage').value = Subtr(putOnMileage,lastPutOnMileage);
	}
	
	function acc_consume(){
		var putOnNum = $('search.putOnNum').value == '' ? 0 : $('search.putOnNum').value;
		var runMileage = $('search.runMileage').value == '' ? 0 : $('search.runMileage').value;
		$('search.consume_100').value =putOnNum*100/runMileage;
	}
	
	function acc_charge(){
		var putOnNum = $('search.putOnNum').value == '' ? 0 : $('search.putOnNum').value;
		var price = $('search.price').value == '' ? 0 : $('search.price').value;
		$('search.charge').value = (putOnNum)*(price);
	}
	//�����Զ�����
	function getOilTotal(value){

		var url = '/basearchives/car/ajaxPutOilTotal.shtml?search.car_no_id='+value;
		try{
			var oXMLDom	= new ActiveXObject("Msxml.DOMDocument");
			oXMLDom.async = false ;
			oXMLDom.load(url); 

			var root;
			if (oXMLDom.parseError.errorCode != 0) {
				var myErr = oXMLDom.parseError;
				return;
			} else {
				root = oXMLDom.documentElement;
			}
			if (null != root){
               	
				var rowSet = root.selectNodes("//CarOilTatol");
				if (rowSet.length > 0){

					document.all("search.OilTotal").value = rowSet.item(0).selectSingleNode("value").text != 'null' ? rowSet.item(0).selectSingleNode("value").text : '';
				}else{
					alert('��ȡ�����������������������ԣ�');
				}
			}
		}catch(e){ 
			alert(e);
		}
	}
	
	function acc_lastputexoil(){
	    var oilTotal= $('search.OilTotal').value == '' ? 0 : $('search.OilTotal').value;
		var lastputoil = $('search.lastPutonoil').value == '' ? 0 : $('search.lastPutonoil').value;
		$('search.lastPutonexoil').value = Subtr(oilTotal,lastputoil);
	}
	
	function acc_putonexoil(){
	    var oilTotal= $('search.OilTotal').value == '' ? 0 : $('search.OilTotal').value
		var putonoil = $('search.putOnoil').value == '' ? 0 : $('search.putOnoil').value;
		$('search.putOnexoil').value =Subtr(oilTotal,putonoil);
	}
	
    function acc_putonnum()
	{
		var lastputoil = $('search.lastPutonoil').value == '' ? 0 : $('search.lastPutonoil').value;
		var putonoil = $('search.putOnoil').value == '' ? 0 : $('search.putOnoil').value;
		$('search.putOnNum').value =Subtr((2).mul(putonoil),lastputoil);
	}
</script>