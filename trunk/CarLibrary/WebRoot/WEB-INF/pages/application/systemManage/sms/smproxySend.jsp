<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>
<!-- 
    2008-12-22
	���ط�ʽ���Ͷ���
 -->
<form methd='POST' name='form1' action='/system/sms/smproxysend.shtml' class="formcheck" onsubmit="return checkSubmit();">
<script>
	var fm2 = new Ext.form.BasicForm('form1'); 
</script>	
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					���ط�ʽ���ŷ���
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right'>�ֻ��ţ�</td>
				<td colspan="3">
				    <tt:TextField name="search.mobiles" value="" width="350"></tt:TextField>(����ֻ�����";"�Ÿ���)
				</td>
			</tr>
			<tr>
				<td align='right'>��������:</td>
				<td colspan="3">
					<tt:TextArea name="search.smsContext" value="search.smsContext" width="400" height="50" required='true' msg='����д�������ݣ�'/>
				</td>
			</tr>
		</tbody>
	</table>
	<input type="hidden" name="actionType" value="<ww:property value="action"/>"/>
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
	&nbsp;&nbsp;&nbsp;&nbsp;ע�������ҪȺ��������ֻ�����";"�Ÿ���<br>
	&nbsp;&nbsp;&nbsp;&nbsp;���磺��Ҫ���͵��ֻ�����Ϊ(13512345678,13612345678)<br>
	&nbsp;&nbsp;&nbsp;&nbsp;���ֻ����ı�������: 13512345678;13612345678 <br>
</div>
<script language="javascript">
	Ext.get('form1').un("submit", fm2.onSubmit, fm2);
	var saveButton =new Ext.Button({
        text: '�� ��',
        handler: function(){
        	if (fm2.isValid()) {
        		if ($('search.mobiles').value == ''){
        			Ext.Msg.show({
	 					title:'��Ϣ',
						msg: '�ֻ��Ų���Ϊ�գ�',
						modal : true,
						buttons: Ext.Msg.OK
	 				});
	        		return ;
	        	}
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