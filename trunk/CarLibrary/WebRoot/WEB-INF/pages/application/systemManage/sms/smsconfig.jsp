<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>
<!-- 
    2008-12-22
	���ط�ʽ���Ͷ���
 -->
<form methd='POST' name='form1' action='/system/sms/smsconfig.shtml' class="formcheck" onsubmit="return checkSubmit();">
<script>
	var fm2 = new Ext.form.BasicForm('form1'); 
</script>	
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					ϵͳ���ŷ�������
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width="33%" align='left'>IC���������ſ�������(ÿ��30���Ӳ�ѯһ��)��</td>
				<td >
				<tt:CheckBox name="search.iccardswitch" filedValue="true" value="search.iccardswitch"></tt:CheckBox>
				</td>
			</tr>
			<tr bgcolor="green">
      		</tr>
			<tr>
				<td width="33%"  align='left'>�ǹ���ʱ�䣬ͣ����ʱ���ſ������ã�</td>
				<td>
					<tt:CheckBox name="search.outbandswitch" filedValue="true" value="search.outbandswitch"></tt:CheckBox>
				</td>
			</tr>
			<tr>
				<td align='left' colspan="4" >
				�ǹ���ʱ�䣬ͣ����ʱ�����ڹ���ʱ��(��һ������)������<tt:TextField name="search.beforehours" value="search.beforehours" required="true" msg="����д"/>ʱ֮ǰ��
				��<tt:TextField name="search.afterhours" value="search.afterhours" required="true" msg="����д"/>ʱ֮����,ÿ��30���Ӳ�ѯһ��
				</td>
			</tr>
			<tr>
				<td width="33%"  align='left'> ��վ�������ſ������ã�</td>
				<td>
					<tt:CheckBox name="search.backswitch" filedValue="true" value="search.backswitch"></tt:CheckBox>
				</td>
			</tr>			
			<tr>
				<td align='left' colspan="4" >
				��վ��������,�ɳ�Ԥ����<tt:TextField name="search.expforehours" value="search.expforehours" required="true" msg="����д"/>����֮����Ч,֮������.
				</td>
			</tr>
			<!-- 
			<tr>
				<td width="33%" align='left'>�������ſ�������</td>
				<td >
				<tt:CheckBox name="search.flowerswitch" filedValue="true" value="search.flowerswitch"></tt:CheckBox>
				</td>
			</tr>	
			 -->		
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

<script language="javascript">
	Ext.get('form1').un("submit", fm2.onSubmit, fm2);
	var saveButton =new Ext.Button({
        text: '�� ��',
        handler: function(){
        	if (fm2.isValid()) {
				document.form1.submit();
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