<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>
<ww:action name="'select'" id="select"></ww:action>
<%--
	 * �ɳ�����
 	 * @author fangzl 
 	 <script type="text/javascript" src="/themes/default/js/calendar.js"></script>
--%>

<form methd='POST' name='form1' action='/carmanage/expedite/applyer.shtml'>
<script>
	var fm2 = new Ext.form.BasicForm('form1'); 
</script>
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>�ɳ�������Ϣ</th>
			</tr>
		</thead>
		<tbody>
			<tr>	
				<td align='right' width="17%">�ɳ�����:</td>
				<td width="33%">
				 <tt:ComboBox name="search.expediteapplyType" value="search.expediteapply_type"  verify="empty" required="true" editable="true" 
				  sql="select 0 id ,'����' text union select 1 id ,'��;' text"/>
				</td>						
				<td align='right'>Ԥ���ó�ʱ��:</td>
				<td>
					<input class='text_input check' verify='datetime' required='true' requiredColor='#ffffff' shade='true' name="search.intendingDate" type="text" value="<ww:property value="search.intending_date"/>" onfocus="calendar();"  size="18">					
				</td>
			</tr>		
			<tr>
				<td align='right' width="17%" >ʹ�õ�λ:</td>
				<td width="33%">
					<div id="deptDIV"></div>
					<input type="hidden" name="search.deptId" value="">
				</td>		
				<td align='right'>�˴�ص�:</td>
				<td>
				   <tt:TextField name="search.destinationLocal" value="search.destination_local" width="150" cssClass="check" verify='string' required='true' shade='true' requiredColor='#ffffff'/>
				</td>		
			</tr>
			<tr>
		    	<td align='right' width="17%">�ó���:</td>
				<td>		     				  
					<tt:TextField name="search.useMan" value="search.use_man" width="150" cssClass="check" verify='string' required='true' shade='true' requiredColor='#ffffff'/>
				</td>
				<td align='right'>�ó�����ϵ�˷�ʽ:</td>				
				<td>
					<tt:TextField name="search.useMobile" value="search.use_mobile" width="150" cssClass="check" verify='int+' required='true' shade='true' requiredColor='#ffffff'/>
				</td>			
			</tr>
            <tr>   
				<td align='right'>�ó�����:</td>
				<td colspan="3">
					<tt:TextArea name="search.useExcuse" value="search.use_excuse" width="400" height="50" verify='string' required='true' msg='����д�ó�����'/>
				</td>
			</tr>
            <tr>
				<td align='right'>��������:</td>
				<td colspan="3">
					<tt:ComboBox name="search.cityId" value="search.city_id" cssClass="check" shade="true" requiredColor="#ffffff" verify="empty" required="true"
							sql="'select city_id id, city_name text from td_city where city_id in (select city_id from tf_staff_city  where  staff_id=' + #session['UserInfo'].staffId+')'" />
				</td>				
			</tr>			
		</tbody>
	</table>
	<input type='hidden' name='search.expediteapplyId' value='<ww:property value="search.expediteapply_id"/>' />
	<input type='hidden' name='actionType' value='<ww:property value="action"/>' />
	<input type='hidden' name='search.cmdFlag'/>
</form>
<table style='width: 80%' align='center'>
	<tr>
		<td id="buttonTD1" align='right' width='33%'></td>
		<td>
			&nbsp;
		</td>
		<td id="buttonTD2" align='center' width='33%'></td>
		<td>
			&nbsp;
		</td>
		<td id="buttonTD3" align='left' width='33%'></td>
	</tr>
</table>
	<div style="color:red">
		&nbsp;&nbsp;&nbsp;&nbsp;ע�������棺��ʱ�������뵥��û���ύ���������沢�ύ���������뵥���ύ����"��
	</div>
<script type="text/javascript" src="/js/TreeField.js"></script>
<script language="javascript">
	Ext.get('form1').un("submit", fm2.onSubmit, fm2);
	var saveButton =new Ext.Button({
        text: '�� ��',
        handler: function(){
        	if (fm2.isValid() && document.form1.checkSubmit()) {
	        	Ext.Msg.show({
				 	title:'��ȷ��һ��',
				 	modal : false,
				 	msg: '��ȷ��������ȷ��?',
				 	buttons: Ext.Msg.OKCANCEL,
				 	fn: function(btn, text){
						if (btn == 'ok'){
						    //�ύ����,����
						    document.all("search.cmdFlag").value=0;
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
    
 	var savesubmitButton =new Ext.Button({
        text: '���沢�ύ',
        handler: function(){
        	if (fm2.isValid() && document.form1.checkSubmit()) {
	        	Ext.Msg.show({
				 	title:'��ȷ��һ��',
				 	modal : false,
				 	msg: '��ȷ��������ȷ��?',
				 	buttons: Ext.Msg.OKCANCEL,
				 	fn: function(btn, text){
						if (btn == 'ok'){
						    //�ύ���ͣ����沢�ύ
						    document.all("search.cmdFlag").value=1;
					 		document.form1.submit();
					 	} 
				 	},
				 	animEl: 'buttonTD2'
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
    }).render(document.all.buttonTD2);   
			
    new Ext.Button({
        text: '�� ��',
        handler: function(){
        	document.form1.reset();
        }
    }).render(document.all.buttonTD3);
    

	//���������Ͳ˵�
	Ext.onReady(function(){
		Ext.QuickTips.init();
		
		//����
		var belongCompanyTree = new Ext.form.TreeField({
				minListHeight:200,
				dataUrl : '/basearchives/deptInfo/ajaxDeptInfo.shtml',
	            hiddenName : 'search.deptId',
	            valueField : 'id',
	            allowBlank:false,
	            blankText : '��ѡ���ó����ţ�',
	            treeRootConfig : {
	            	id:'',   
			        text : '��ѡ��',   
			        draggable:false  
	            },
	            displayValue:'<ww:property value="search.dept_name"/>',
	            value:'<ww:property value="search.dept_id"/>'
		});
		belongCompanyTree.render('deptDIV');	//�����ָ���Ķ�����
	});
</script>