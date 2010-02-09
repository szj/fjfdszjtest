<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>
<!--
	������Ϣ���� 
 -->
<form methd='POST' name='form1' action='/basearchives/car/carInfo.shtml' class="formcheck"  onsubmit="return checkSubmit();">
<script>
	var fm2 = new Ext.form.BasicForm('form1'); 
</script>
	<table class='simple' style='width:80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>������Ϣ</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right' width="17%">���Ʊ��(���ƺ�):</td>
				<td width="33%">
				    <!-- 
					<c:if test="${param.actionType == 'new'}">
						<tt:TextField name="search.carNoCode" value="search.car_no_code" width="200" cssClass="check" verify='string' required='true' shade='true' requiredColor='#ffffff' onblur="chk_exist()"/>
					</c:if>
					<c:if test="${param.actionType != 'new'}">
						<tt:TextField name="search.carNoCode" value="search.car_no_code" width="200" cssClass="check" verify='string' required='true' shade='true' requiredColor='#ffffff' readonly="true"/>
					</c:if>
					 -->
					 <tt:TextField name="search.carNoCode" value="search.car_no_code" width="200" cssClass="check" verify='string' required='true' shade='true' requiredColor='#ffffff' onblur="chk_exist()"/>
					<span id="carNoCodeMsg" style="color:red"></span>
				</td>
				<td align='right' width="17%">�ն�����:</td>
				<td width="33%">
					<tt:ComboBox name="search.terminalType" value="search.terminal_type" width="150" cssClass="check" shade="true" requiredColor="#ffffff" verify="empty" required="true"
						sql="select para_value id, para_value_desc text from td_system_para  t where t.para_type = 'CAR_INFO' and para_name = 'TERMINAL_TYPE'"/>
				</td>
			</tr>
			<tr>
				<td align='right'>���ص绰:</td>
				<td>
					<tt:TextField name="search.carPhone" value="search.car_phone" width="200" cssClass="check" verify='string' required='true' shade='true' requiredColor='#ffffff'/>
				</td>
				<td align='right'>������ɫ:</td>
				<td>
					<tt:ComboBox name="search.color" value="search.color" width="150" cssClass="check" shade="true" requiredColor="#ffffff" verify="empty" required="true"
						sql="select para_value id, para_value_desc text from td_system_para  t where t.para_type = 'CAR_INFO' and para_name = 'COLCOR'"/>
			    </td>	
			</tr>
			<tr>
				<td align='right'>��ʻ��̳�ʼ:</td>
				<td>
					<tt:TextField name="search.runMileageInit" value="search.run_mileage_init" width="150" cssClass="check" verify='string' required='true' shade='true' requiredColor='#ffffff'/> ��λ����
				</td>
			</tr>
			<tr>
				<td align='right'>������˾:</td>
				<td>
					<div id="belongCompanyDIV"></div>
					<input type="hidden" name="search.belongCompany" value="">
			    </td>
				<td align='right'>��������:</td>
			    <td>
					<div id="belongDeptDIV"></div>
					<input type="hidden" name="search.belongDept" value="">
			    </td>
			</tr>			
			<tr>
				<td align='right'>��װʱ��:</td>
				<td>
					<tt:DateFiled name="search.installDate" value="search.install_date" width="185" cssClass="check" verify='string' required='true' shade='true' requiredColor='#ffffff'/>
				</td>
				<td align='right'>��������:</td>
				<td>
					<tt:DateFiled name="search.buyDate" value="search.buy_date" width="185" cssClass="check" verify='string' required='true' shade='true' requiredColor='#ffffff'/>
				</td>
			</tr>			
			<tr>				
				<td align='right'>��������:</td>
				<td>
					<tt:ComboBox name="search.cityId" value="search.city_id" cssClass="check" shade="true" requiredColor="#ffffff" verify="empty" required="true"
							sql="'select city_id id, city_name text from td_city where city_id in (select city_id from tf_staff_city  where  staff_id=' + #session['UserInfo'].staffId+')'" />
				</td>
				<td align='right'>����������:</td>
				<td>
					<tt:TextField name="search.oilTotal" value="search.oil_total" width="150" cssClass="check" verify='string' required='true' shade='true' requiredColor='#ffffff'/> ��λ����
				</td>
			</tr>	
		</tbody>
	</table>
	<div style="color:red">
		&nbsp;&nbsp;&nbsp;&nbsp;ע������ʻ��̳�ʼ��Ϊ������Ϣ�Ǽ�ʱ�ĳ������ֵ��
	</div>
	
	<br>
	<table id="equipmentTab" class='simple' style='width:80%' align='center'>
		<thead>
			<tr>
				<th colspan="4">�豸��Ϣ</th>
			</tr>
		</thead>
		<tbody id="equipmentBody">
			<tr>
				<td align='center' width="20%">�豸���</td>
				<td align='center' width="20%">�豸����</td>
				<td align='center'>��ע</td>
				<td align='center' width="8%">
					<a href="javascript:fun_add()">[���]</a>
				</td>
			</tr>
			<ww:if test="null != carFixingList && carFixingList.size()>0">
				<input type="hidden" name="search.fixingNum" value="<ww:property value="carFixingList.size()"/>">
				<ww:iterator value="carFixingList">
					<tr>
						<td align='center' width="20%">
							<input type="hidden" name="search.fixingId" value="<ww:property value="fixing_id"/>"/>
							<ww:property value="fixing_code"/>
						</td>
						<td align='center' width="20%"><ww:property value="fixing_name"/></td>
						<td align='center'><ww:property value="memo"/></td>
						<td align='center' width="8%">
							<A style='cursor:hand' onclick='del_row();'>ɾ��</a>
						</td>
					</tr>
				</ww:iterator>
			</ww:if>
			<ww:else>
				<input type="hidden" name="search.fixingNum" value="0">
			</ww:else>
			
		</tbody>
		<tfoot id="equipmentFoot">
		</tfoot>
	</table>
	<input type='hidden' name='search.carNoId' value='<ww:property value="search.car_no_id"/>'/>
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
        		<c:if test="${param.actionType == 'new'}">
	        	if (!chk_exist()){
	        		alert("�Բ��𣬸ó�������Ѵ��ڣ����������룡");
	        		return;
	        	}
	        	</c:if>
	        	
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
    
    function chk_exist(){
    	var value = $('search.carNoCode').value;
    	if (value == ''){
    		$(carNoCodeMsg).innerHTML = '�����복����ţ�';
    		return;
    	}
    	var url = '/basearchives/car/carInfo.shtml?actionType=isExist&search.carNoCode='+value;
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
				var rowSet = root.selectNodes("//isExist");
				if (0 < rowSet.item(0).selectSingleNode("value").text){
					$(carNoCodeMsg).innerHTML = "�Բ��𣬸ó�������Ѵ��ڣ����������룡";
					return false;
				}else{
					$(carNoCodeMsg).innerHTML = '';
					return true;
				}
			}
		}catch(e){ 
			alert(e);
		}
    }

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


	var searchPlan = new Ext.Window();
	
	function fun_add(){
		var fixingIds = '';
		if (null != document.all('search.fixingId')){
			var obj = document.all('search.fixingId');
			if (obj.length > 1){
				for (var i=0; i<obj.length; i++){
					if (fixingIds == ''){
						fixingIds = "'"+obj[i].value+"'";
					}else{
						fixingIds += ',' + "'"+obj[i].value+"'";
					}
				}
			}else{
				fixingIds = "'"+obj.value+"'";
			}
		}
		
		searchPlan.hidden = true;
		if (searchPlan.hidden){
			searchPlan = new Ext.Window({
		        title: '��ѯ�豸��Ϣ',
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
				            fieldLabel: '�豸����',
				            name: 'fixingCode',
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
				            fieldLabel: '�豸����',
				            name: 'fixingName',
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
				            	document.all.EquipmentIframe.src="/basearchives/equipment/equipment.shtml?search.action=extSearch"+
				            																				"&search.fixingIds="+fixingIds+
				            																				"&search.fixingCode="+document.all.fixingCode.value+
				            																				"&search.fixingName="+document.all.fixingName.value;
				            }
				        },{
				            text: 'ȷ��',
				            width:50,
				            handler: function(){
				            	if (document.all.EquipmentIframe.src == ''){
				            		Ext.MessageBox.alert('��ʾ', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���Ȳ�ѯ!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;', null);
				            		return;
				            	}
				            	
				            	var obj = document.EquipmentIframe.fixingId;
				            	if (obj.length > 1){
				            		var objValue = '';
				            		var fixingId = '';
				            		var fixingCode = '';
				            		var fixingName = '';
				            		var memo = '';
				            		
				            		for (var i=0; i<obj.length; i++){
				            			if (obj[i].checked){
				            				objValue = obj[i].value;
				            				fixingId = objValue.substring(0, objValue.indexOf('^'));
				            				objValue = objValue.substring(objValue.indexOf('^') + 1, objValue.length);
				            				fixingCode = objValue.substring(0, objValue.indexOf('^'));
				            				objValue = objValue.substring(objValue.indexOf('^') + 1, objValue.length);
				            				fixingName = objValue.substring(0, objValue.indexOf('^'));
				            				memo = objValue.substring(objValue.indexOf('^') + 1, objValue.length);
				            				fun_addrow(fixingId, fixingCode, fixingName, memo);
				            			}
				            		}
				            	}else{
				            		if (obj.checked){
					            		var objValue = obj.value;
			            				var fixingId = objValue.substring(0, objValue.indexOf('^'));
			            				objValue = objValue.substring(objValue.indexOf('^') + 1, objValue.length);
			            				var fixingCode = objValue.substring(0, objValue.indexOf('^'));
			            				objValue = objValue.substring(objValue.indexOf('^') + 1, objValue.length);
			            				var fixingName = objValue.substring(0, objValue.indexOf('^'));
			            				var memo = objValue.substring(objValue.indexOf('^') + 1, objValue.length);
			            				fun_addrow(fixingId, fixingCode, fixingName, memo);
		            				}
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
	                        html: "<iframe id='EquipmentIframe' name='EquipmentIframe' src=''width='100%' height='285' frameborder=0/>"
	                    }]
			        }]
		        }]
		    });
	    }
		searchPlan.show();
	}
	
	function fun_addrow(fixingId, fixingCode, fixingName, memo){
		var num = Math.floor(document.form1('search.fixingNum').value);
		num = num + 1;
		document.form1('search.fixingNum').value = num;
		
		var oBody = $(equipmentBody);
		document.all("equipmentTab").insertBefore(oBody,document.all("equipmentFoot"));
		var myTR =oBody.insertRow();
		var myTD1 = myTR.insertCell();
		myTD1.innerHTML = "<div align='center'><input type='hidden' name='search.fixingId' value='"+fixingId+"'/>"+fixingCode+"</div>";
		var myTD2 = myTR.insertCell();
		myTD2.innerHTML = "<div align='center'>"+fixingName+"</div>";
		
		var myTD3 = myTR.insertCell();
		myTD3.innerHTML = "<div align='center'>"+memo+"</div>";
		
		var myTD4 = myTR.insertCell();
		myTD4.innerHTML = "<div align='center'><A style='cursor:hand' onclick='del_row();'>ɾ��</a></div>";
	}
	
	// ɾ����
	function del_row(){
		if (!confirm('��ȷ���Ƿ�ɾ����ɾ��������ݽ��޷��ָ�!')){
			return;
		}
		
		var num = Math.floor(document.form1('search.fixingNum').value);
		num = num-1;
		document.form1('search.fixingNum').value = num;
		
	   	event.cancelBubble=true;
	   	var the_obj = event.srcElement;
	   	var the_td	= get_Element(the_obj,"td");
	   	var the_tr	= the_td.parentElement;
	   	cur_row = the_tr.rowIndex;
	   	document.all.equipmentTab.deleteRow(cur_row);
	}
	
	// ���ϸ���������
	function get_Element(the_ele,the_tag){
	   the_tag = the_tag.toLowerCase();
	   if(the_ele.tagName.toLowerCase()==the_tag)return the_ele;
	   while(the_ele=the_ele.offsetParent){
	     if(the_ele.tagName.toLowerCase()==the_tag)return the_ele;
	   }
	   return(null);
	}
</script>