<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>

<form methd='POST' name='form1' action='/basearchives/institution/institution.shtml' class="formcheck"  onsubmit="return checkSubmit();">
<script>
	var fm2 = new Ext.form.BasicForm('form1'); 
</script>	
	<table class='simple' style='width:90%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>������Ϣ</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			    <td align='right'>��˾���:</td>
				<td colspan="3">
					<tt:TextField name="search.companyCode" value="search.company_code" width="200" verify='string' required='true'/>
				</td>
			</tr>
			<tr>
				<td align='right' width="17%">��˾����:</td>
				<td width="33%">
					<tt:TextField name="search.companyName" value="search.company_name" width="200" verify='string' required='true'/>
				</td>
				<td align='right' width="17%">��˾���:</td>
				<td width="33%">
					<tt:TextField name="search.companyEasyName" value="search.company_easy_name" width="200" />
				</td>
			</tr>
			<tr>
				<td align='right'>ע������:</td>
				<td>
					<tt:DateFiled name="search.regDate" value="search.reg_date" verify='date' required='true'/>
				</td>
				<td align='right'>�ϼ���˾:</td>
				<td>
					<tt:ComboBox name="search.upCompany" value="search.up_company" verify="empty" required="true"
						sql="select para_value id, para_value_desc text from td_system_para  t where t.para_type = 'MANAGE_ORGAN_ARCHIVES' and t.para_name = 'UP_COMPANY'"/>
				</td>
			</tr>
			<tr>
				<td align='right'>��ϵ��:</td>
				<td>
					<tt:TextField name="search.linkMan" value="search.link_man" verify="string" required="true" shade="true" requiredColor="#ffffff"/>
				</td>
				<td align='right'>��ϵ�绰:</td>
				<td>
					<tt:TextField name="search.linkPhone" value="search.link_phone" verify="string" required="true" shade="true" requiredColor="#ffffff"/>
				</td>
			</tr>
			<tr>
				<td align='right'>��˾����:</td>
				<td>
					<tt:ComboBox name="search.companyProperty" value="search.company_property" verify="empty" required="false"
						sql="select para_value id, para_value_desc text from td_system_para  t where t.para_type = 'MANAGE_ORGAN_ARCHIVES' and para_name = 'COMPANY_PROPERTY'"/>
				</td>
				<td align='right'>��˾��ҵ</td>
				<td>
					<tt:ComboBox name="search.calling" value="search.CALLING" verify="empty" required="true"
						sql="select para_value id, para_value_desc text from td_system_para  t where t.para_type = 'MANAGE_ORGAN_ARCHIVES' and para_name = 'CALLING'"/>
			    </td>
			</tr>
			<tr>
				<td align='right'>������:</td>
				 <td colspan="3">
				 	<tt:ComboBox name="search.proxyLevel" value="search.proxy_level" verify="empty" required="true"
				 		sql="select para_value id, para_value_desc text from td_system_para  t where t.para_type = 'MANAGE_ORGAN_ARCHIVES' and para_name = 'PROXY_LEVEL'"/>
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
	<input type='hidden' name='search.companyId' value='<ww:property value="search.company_id"/>'/>
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