<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK"
	contentType="text/html;charset=GBK"%>

<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>

<form method='POST' name='form1'
	action='/basearchives/uldExcel/uploadExcel.shtml?' class="formcheck"
	onsubmit="return checkSubmit();">
	<script>
	var fm2 = new Ext.form.BasicForm('form1'); 
</script>
	<table class='simple' style='width: 80%'>
		<thead>
			<tr>
				<th colspan='4'> 
					�޸� 
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right' width="17%">
				 ��Ӫ��
				</td>
				<td width="33%">
						<tt:TextField name="search.Operators" value="search.Operators" cssClass="check"
						verify='string'  required='true' shade='true'  requiredColor='#ff0000'   />
				</td>
				<td align='right' width="17%">
					����: 
				</td>
				<td width="33%">
				<ww:property  value="search.number" />
				<input type="hidden" name="search.number" value="<ww:property value="search.number"/>"/>
				</td>
			</tr>
			
			<tr>
				<td align='right' width="17%">
				�û���:
				</td>
				<td width="33%">
					<tt:TextField name="search.userName" value="search.userName"
						cssClass="check" verify='string' required='true' shade='true'
						requiredColor='#ffffff' />
				</td>
				<td align='right' width="17%">
					������:  
				</td>
				<td width="33%">
				<tt:TextField name="search.address" value="search.address" cssClass="check"
						verify='string' required='true' shade='true'  requiredColor='#ff0000'   />
				</td>
			</tr>
			<tr>
				<td align='right' width="17%">
			      ����ɷ�ʱ��:
				</td>
				<td width="33%">
			          <ww:property value="search.JFtime" ></ww:property>
			          </td>
				<td align='right' width="17%">
					�ܽ��:
				</td>
				<td width="33%">
					 <tt:TextField name="search.money" value="search.money" onkeypress="KeyPress(this)"
						cssClass="check" verify='string' requiredColor='#ffffff' />
				</td>
			</tr>
			<tr>
				<td align='right' width="17%">
				�ɷ�����:
				</td>
				<td  >
				<tt:TextField name="search.payNet" value="search.payNet"
						cssClass="check" verify='string' required='true' shade='true'
						requiredColor='#ffffff' />
				</td>
						
			    <td align='right' width="17%">
					��������: 
				</td>
				<td width="33%">
					 <tt:TextField name="search.updateNet" value="search.updateNet" 
						cssClass="check" verify='string' requiredColor='#ffffff' />
				</td>	
						
			</tr>
				<tr>
				<td align='right' width="17%">
				Ʒ��:
				</td>
				<td  >
				<tt:TextField name="search.Brand" value="search.Brand"
						cssClass="check" verify='string' required='true' shade='true'
						requiredColor='#ffffff' />
				</td>
						
			    <td align='right' width="17%">
					&nbsp;
				</td>
				<td width="33%">
						&nbsp;
				</td>	
						
			</tr>
			
		</tbody>
	</table>

	<input type='hidden' name='actionType'
		value='<ww:property value="action"/>' />
</form>
<table style='width: 80%' >
	<tr>
		<td id="buttonTD1" align='right' width='48%'></td>
		<td>
			&nbsp;
		</td>
		<td id="buttonTD2" align='left' width='48%'><br></td>
	</tr>
</table>

<script language="javascript">
        Ext.get('form1').un("submit", fm2.onSubmit, fm2);
		new Ext.Button({
	        text: '�� ��',
	        handler: function(){
	            if(Ext.get('search.money').dom.value==''){
                    Ext.MessageBox.alert('��ʾ', '����Ϊ��!');
                }
                else{
	        	    document.form1.submit();
	        	}

	        }
	    }).render(document.all.buttonTD1);
	    new Ext.Button({
	        text: '�� ��',
	        handler: function(){
	        	document.form1.reset();
	        }
	    }).render(document.all.buttonTD2);
	    
	    
	    
function KeyPress(objTR)
{
   var txtval = objTR.value;
   var key = event.keyCode;
   if((key <48 || key >57)&&key !=46)
   {
         event.keyCode = 0;
   }
   else
   {
         if(key == 46)
         {
               if(txtval.indexOf(".") != -1 || txtval.length == 0)
                     event.keyCode = 0;
         }
   }
} 
	    
	    
	    

</script>