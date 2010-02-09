<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<ww:action name="'select'" id="select"></ww:action>
<form methd='POST' name='form1' action='/basearchives/employeeInfo/employee.shtml' class="formcheck"  onsubmit="return checkSubmit();">
<script>
	var fm2 = new Ext.form.BasicForm('form1'); 
</script>
	<table class='simple' style='width:80%' align='center'>
		<thead>
			<tr>
				<th colspan='8'>��Ա����Ϣ</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			    <td align='right'>Ա�����:</td>
				<td>
					<tt:TextField name="search.staffCode" value="search.staff_code" width="200" verify='string' required='true'/>
				</td>
				<td align='right'>ϵͳ�û�:</td>
				<td>
					<input name="search.operatorId" type="hidden" value="<ww:property value="search.operator_id"/>">
					<input name="search.operatorName" type="text" value="<ww:property value="search.operator_name"/>" onfocus="showSearchPlan()">
				</td>
			</tr>
			<tr>
				<td align='right' width="17%">Ա������:</td>			
				<td width="33%">
					<tt:TextField name="search.staffName" value="search.staff_name" width="200" verify='string' required='true'/>
				</td>
				<td align='right' width="17%">�Ա�:</td>
				<td width="33%">
					<tt:ComboBox name="search.sex" value="search.sex" verify="empty" required="true"
						sql="select para_value id, para_value_desc text from td_system_para  t where t.para_type = 'BASE_PARA' and para_name = 'SEX'"/>
			    </td>
			</tr>
			<tr>
				<td align='right'>֤������:</td>
				<td>
					<tt:ComboBox name="search.certificateType" value="search.certificate_type" verify="empty" required="true"
						sql="select para_value id, para_value_desc text from td_system_para  t where t.para_type = 'BASE_PARA' and para_name = 'CERTIFICATE_TYPE'"/>
			    </td>
			    <td align='right'>Ա������:</td>
				<td>
					<tt:ComboBox name="search.staffType" value="search.staff_type" verify="empty" required="true"
						sql="select para_value id, para_value_desc text from td_system_para  t where t.para_type = 'STAFF_INFO' and para_name = 'STAFF_TYPE'"/>
				</td>
			</tr>
			<tr>
				<td align='right'>֤�����:</td>
				<td>
					<tt:TextField name="search.certificateNo" value="search.certificate_no" width="200" verify='string' required='true'/>
				</td>
				<td align='right'>��ϵ�绰:</td>
				<td>
					<tt:TextField name="search.linkPhone" value="search.link_phone" width="200" verify='string' required='true'/>
				</td>
			</tr>
			<tr>
				<td align='right'>������˾:</td>
				<td>
					<div id="belongCompanyDIV"></div>
					<input type="hidden" name="search.belongCompany" value="">
			    </td>
				<td align='right'>������ϵ�绰:</td>
				<td>
					<tt:TextField name="search.linkOther" value="search.link_other" width="200"/>
				</td>   
			</tr>
			<tr>
				<td align='right'>��������:</td>
			    <td>
					<div id="belongDeptDIV"></div>
					<input type="hidden" name="search.belongDept" value="">
			    </td>	
			    <td align='right'>���ն��ź���</td>
			    <td>
			    	<tt:TextField name="search.smsPhone" value="search.sms_phone" width="200" verify='mobile' required='true'/>
			    </td>
			</tr>
			<tr>
				<td align='right'>���ƺ�:</td>
				<td>
					<tt:ComboBox name="search.carNo" value="search.car_no" editable="true"
						sql="\"select distinct car_no_id id, car_no_code text 
							   from tf_car_info 
							  where state = 1
							    and car_no_id not in (select car_no 
							  							from tf_staff_info 
							  						   where staff_info_id <> '\" + search.staff_info_id + \"')
							  	and city_id in (select city_id 
							  					  from tf_staff_city  
							  					 where staff_id=\" + #session['UserInfo'].staffId + \")\""/>
				</td>
				<td align='right'>IC�����:</td>
			    <td>
			    	<tt:TextField name="search.Ic_Code" value="search.Ic_Code" width="200" verify='string' />
			    </td>
			</tr>
			<tr>
				<td align='right'>��ְʱ��:</td>
				<td>
					<tt:DateFiled name="search.accessionDate" value="search.accession_date" verify='date' required='true'/>
				</td>
			    <td align='right'>��ְʱ��:</td>
			    <td>
			    	<tt:DateFiled name="search.dimissionDate" value="search.dimission_date" verify='date'/>
			    </td>
			</tr>
			<tr>
				<td align='right'>ͨ�ŵ�ַ:</td>
				<td colspan="3">
					<tt:TextField name="search.address" value="search.address" width="400" verify='string' required='true'/>
				</td>
			</tr>
			<tr>
				<td align='right'>��ע��</td>
				<td  colspan="3">
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
		<input type='hidden' name='search.staffInfoId' value='<ww:property value="search.staff_info_id"/>'/>
	<input type='hidden' name='actionType' value='<ww:property value="action"/>'/>
</form>
<table style='width:80%' align='center'>
	<tr>
		<td id="buttonTD1" align='right' width='48%'></td>
		<td>&nbsp;</td>
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
	//���������Ͳ˵�
	Ext.onReady(function(){
		Ext.QuickTips.init();
		
		//������˾
		var belongCompanyTree = new Ext.form.TreeField({
				minListHeight:200,
				dataUrl : '/basearchives/institution/ajaxInstitution.shtml',
	            hiddenName : 'search.belongCompany',
	            valueField : 'id',
	            allowBlank:false,
	            blankText : '��ѡ��Ա��������˾��',
	            treeRootConfig : {
	            	id:'',   
			        text : '��ѡ��',   
			        draggable:false  
	            },
	            displayValue:'<ww:property value="search.belongCompany"/>',
	            value:'<ww:property value="search.belong_to_company"/>'
		});
		belongCompanyTree.render('belongCompanyDIV');	//�����ָ���Ķ�����
		belongCompanyTree.tree.on('click', function(node){	//
			$(belongDeptDIV).innerHTML = '';
			crateDeptTree(node[belongCompanyTree.valueField]);
		});
		
		function crateDeptTree(param){
			var belongDeptTree = new Ext.form.TreeField({
					minListHeight:200,
					dataUrl : '/basearchives/deptInfo/ajaxDeptInfo.shtml?belongCompany='+param,
		            hiddenName : 'search.belongDept',
		            valueField : 'id',
		            allowBlank:false,
	            	blankText : '��ѡ�����������ţ�',
		            treeRootConfig : {
		            	id:'',   
				        text : '��ѡ��',   
				        draggable:false  
		            },
		            displayValue:'<ww:property value="search.belongDept"/>',
		            value:'<ww:property value="search.belong_to_dept"/>'
			});
			belongDeptTree.render('belongDeptDIV');	//�����ָ���Ķ�����
		}
		
		crateDeptTree();
	});
	
	//����Ա��Ϣ��,��ѡ
	var searchPlan = new Ext.Window();
		function showSearchPlan(){
		searchPlan.hidden = true;
		if (searchPlan.hidden){
			searchPlan = new Ext.Window({
		        title: '��ѯԱ����Ϣ',
		        width: 800,
		       	height:400,
		        layout: 'fit',
		        plain:true,
		        bodyStyle:'padding:5px;',
		        buttonAlign:'center',
		        items:[{
	                region:'center',
	                layout:'column',
	                baseCls:'x-plain',
	                autoScroll:true,
	                items:[{
			        	columnWidth:.33,
	                    baseCls:'x-plain',
	                    bodyStyle:'padding:5px 0 5px 5px',
	                    layout: 'form',
	                    labelWidth:60,
			        	items:[{
			        		xtype: 'textfield',
				            fieldLabel: 'Ա�����',
				            name: 'staffNo',
				            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        	}]
			        },{
			        	columnWidth:.33,
	                    baseCls:'x-plain',
	                    bodyStyle:'padding:5px 0 5px 5px',
	                    layout: 'form',
	                    labelWidth:60,
			        	items:[{
			        		xtype: 'textfield',
				            fieldLabel: 'Ա������',
				            name: 'staffName',
				            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        	}]
			        },{
			        	columnWidth:.33,
	                    baseCls:'x-plain',
	                    bodyStyle:'margin:0px 0px 0px 0px',
			        	buttons: [{
				            text: '��ѯ',
				            width:50,
				            handler: function(){
				            	document.all.EmployeeIframe.src="/system/manage/manager.shtml?search.action=extSignSearch"+
				            																				"&userInfo.staffNo="+document.all.staffNo.value+
				            																				"&userInfo.staffName="+document.all.staffName.value;
				            }
				        },{
				            text: 'ȷ��',
				            width:50,
				            handler: function(){
				            	if (document.all.EmployeeIframe.src ==''){
				            		Ext.MessageBox.alert('��ʾ', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���Ȳ�ѯ!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;', null);
				            		return;
				            	}

				            	if(document.all("search.operatorId").value.indexOf(document.EmployeeIframe.staffId.value)==0)
				            	{	
									//���ԭ����
									document.all("search.operatorId").value=" ";
									document.all("search.operatorName").value=" ";
				            	}else
				            	{
						            document.all("search.operatorId").value = document.EmployeeIframe.staffId.value;
					            	document.all("search.operatorName").value = document.EmployeeIframe.staffName.value;			            	
				            	}
				            	searchPlan.close();
				            }
				        }]
			        },{
			        	columnWidth:1,
	                    baseCls:'x-plain',
	                    bodyStyle:'padding:5px',
	                    items:[{
	                    	width:"100%",
	                    	height:"100%",
	                        html: "<iframe id='EmployeeIframe' name='EmployeeIframe' src=''width='100%' height='285' frameborder=0/>"
	                    }]
			        }]
			        }]
		    });
	    }
		searchPlan.show();
	}
	
</script>