<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>
<%--
	 * �ռ�����Ϣ����������༭ 
 	 * @author zhengmh 
--%>

<form methd='POST' name='form1' action='/netprint/clientmsg/recclientmsg.shtml'>
<script>
	var fm2 = new Ext.form.BasicForm('form1'); 
</script>
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					�ռ�����Ϣ
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right' width="17%">
					�ռ��˳���:
				</td>
				<td width="33%">
					<tt:TextField name="search.pcode" value="search.code" width="200" cssClass="check" verify='string'  shade='true' requiredColor='#ffffff'/>
				</td>
				<td align='right' width="17%">
					�ռ�������:
				</td>
				<td width="33%">
				    <tt:TextField name="search.pname" value="search.name" width="200" cssClass="check" verify='string'  shade='true' requiredColor='#ffffff'/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					�ռ��˵�λ:
				</td>
				<td colspan=3>
					<tt:TextArea name="search.punit" value="search.unit" width="400" height="50"  msg='����д��λ��Ϣ��'/>
				</td>
			</tr>
            <tr>
				<td align='right'>
					�ռ�����ϸ��ַ:
				</td>
				<td colspan="3">
					<tt:TextArea name="search.paddress" value="search.address" width="400" height="50" required='true' msg='����д��ϸ��ַ��'/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					�ռ�����ϵ�绰:
				</td>
				<td>
					<tt:TextField name="search.ptel" value="search.tel" width="200" verify='string' required='true'/>
				</td>
				<td align='right'>
					�ռ����ʱ�:
				</td>
				<td>
					<tt:TextField name="search.ppost" value="search.post" width="200" verify='string'/>
				</td>
			</tr>
		</tbody>
	</table>
	<input type='hidden' name='search.pid' value='<ww:property value="search.id"/>' />
	<input type='hidden' name='actionType' value='<ww:property value="action"/>' />
	<input type='hidden' name='search.pbill_sort' value='0'/>
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
<script type="text/javascript" src="/js/TreeField.js"></script>
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