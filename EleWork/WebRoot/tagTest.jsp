<br><%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK" %>
<%@ include file="/common/taglibs.jsp"%>
��ѡ��
<div>
<tt:InputDBMultiCheckListBox name="test" sql="select city_id id,city_name text from td_city"/>
</div>
<br>
������
<div>
<tt:ComboBox name="search.proxyLevel" value="search.proxyLevel" cssClass="check" shade="true" requiredColor="#ffffff" verify="empty" required="true"
				 		sql="select para_value id, para_value_desc text from td_system_para  t where t.para_type = 'MANAGE_ORGAN_ARCHIVES' and para_name = 'PROXY_LEVEL'"/>
</div>
<br>
���ڿ�
<div>
<tt:DateFiled name="search.executeDate" value="search.execute_date"/>
</div>
<br>
��ѡ��
<div>
<tt:CheckBox name="test" filedValue="test" text="test"/>
</div>
<br>
��ѡ��
<div>
<tt:Radio name="test1" filedValue="test1" text="test1"/>
</div>
<br>
�ı���
<div>
<tt:TextField name="textField" value="text" cssClass="check" shade="true" requiredColor="#ffffff" verify="int+" required="true"/>
</div>
�ı���
<div>
<tt:TextArea name="textArea" value="text" rows="4" width="200"/>
</div>
ʱ���
<div>
<tt:TimeField name="timeField1" minValue="7:00am" maxValue="8:00pm" increment="60"/>
</div>
Html�༭��
<div>
<tt:HtmlEditor name="htmlEditor" value="aaaaaaaaabbbbbbbbbcccccc"/>
<input type="button" value="aa" onclick="alert(document.all.htmlEditor.value);">
</div>



	
	<div style='background:black;width:200px;height:200px;'>
		<div style='background:red;width:50px;height:50px;float:left;'></div>
		<div style='background:green;width:50px;height:50px;float:left;'></div>
	</div>
	
	
	<div>
		<div id="simpleFormDiv"></div>
		<script>
			Ext.QuickTips.init();
			Ext.form.Field.prototype.msgTarget = 'side';    
			var simpleForm = new Ext.FormPanel({  
				renderTo:'simpleFormDiv',  
				labelAlign: 'left',    
				title: '������',    
				buttonAlign:'right',    
				bodyStyle:'padding:5px',    
				width: 600,    
				frame:true,    
				labelWidth:80,    
				items: [{        
					layout:'column',        
					border:false,        
					labelSeparator:'��',        
					items:[{            
						columnWidth:.5,            
						layout: 'form',            
						border:false,            
						items: [{                
							xtype:'textfield',                
							fieldLabel: '����',                
							name: 'name',                
							anchor:'90%',
							blankText:'����������', 
							allowBlank:false     
						}]        
					},{            
						columnWidth:.25,            
						layout: 'form',            
						border:false,            
						items: [{                       
							style:'margin-top:5px',                
							xtype:'radio',                
							fieldLabel: '�Ա�',                
							boxLabel:'��',                
							name: 'sex',                
							checked:true,                
							inputValue:'��',                
							anchor:'95%'            
						}]        
					},{            
						columnWidth:.25,            
						layout: 'form',            
						labelWidth:0,            
						labelSeparator:'',            
						hideLabels:true,            
						border:false,            
						items: [{                       
							style:'margin-top:5px',                
							xtype:'radio',                
							fieldLabel: '',                
							boxLabel:'Ů',                
							name: 'sex',                
							inputValue:'Ů',                
							anchor:'95%'            
						}]        
					},{            
						columnWidth:.5,            
						layout: 'form',            
						border:false,            
						items: [{                
							xtype:'datefield',                
							fieldLabel: '��������',                
							name: 'birthday',                
							anchor:'90%'            
						}]      
					},{            
						columnWidth:.5,            
						layout: 'form',            
						border:false,            
						items: [{                
							xtype:'combo',                                                             
							store: new Ext.data.SimpleStore({                                              
								fields: ["retrunValue", "displayText"],                                              
								data: [[1,'Сѧ'],[2,'����'],[3,'����'],[4,'��ר'],[5,'��ר'],[6,'��ѧ']]                                            
							}),                                            
							valueField :"retrunValue",                                            
							displayField: "displayText",                                            
							mode: 'local',                                            
							forceSelection: true,                                            
							blankText:'��ѡ��ѧ��',                                            
							emptyText:'ѡ��ѧ��',                                            
							hiddenName:'education',                                            
							editable: false,                                                             
							triggerAction: 'all',                                                             
							allowBlank:false,                
							fieldLabel: 'ѧ��',                
							name: 'education',                
							anchor:'90%'            
						}]      
					},{            
						columnWidth:.35,            
						layout: 'form',            
						border:false,            
						items: [{                
							xtype:'checkbox',                
							fieldLabel: 'Ȩ����',                
							boxLabel:'ϵͳ����Ա',                
							name: 'popedom',                
							inputValue:'1',                
							anchor:'95%'            
						}]      
					},{            
						columnWidth:.2,            
						layout: 'form',            
						labelWidth:0,            
						labelSeparator:'',            
						hideLabels:true,            
						border:false,            
						items: [{                
							xtype:'checkbox',                
							fieldLabel: '',                
							boxLabel:'����Ա',                
							name: 'pepedom',                
							inputValue:'2',                
							anchor:'95%'            
						}]        
					},{            
						columnWidth:.2,            
						layout: 'form',            
						labelWidth:0,            
						labelSeparator:'',            
						hideLabels:true,            
						border:false,            
						items: [{                
							xtype:'checkbox',                
							fieldLabel: '',                
							boxLabel:'��ͨ�û�',                
							name: 'pepedom',                
							inputValue:'3',                
							anchor:'95%'            
						}]        
					},{            
						columnWidth:.25,            
						layout: 'form',            
						labelWidth:0,            
						labelSeparator:'',            
						hideLabels:true,            
						border:false,            
						items: [{                
							xtype:'checkbox',                
							fieldLabel: '',                
							boxLabel:'�ÿ�',                
							name: 'pepedom',                
							inputValue:'4',                
							anchor:'95%'            
						}]        
					},{            
						columnWidth:.5,            
						layout: 'form',            
						border:false,            
						items: [{                
							xtype:'textfield',                
							fieldLabel: '�����ʼ�',                
							name: 'email',                
							vtype:'email',                
							allowBlank:false,                
							anchor:'90%'            
						}]        
					},{            
						columnWidth:.5,            
						layout: 'form',            
						border:false,            
						items: [{                
							xtype:'textfield',                
							fieldLabel: '������ҳ',                
							name: 'url',                
							vtype:'url',                
							anchor:'90%'            
						}]       
					}]    
				},{        
					xtype:'tabpanel',        
					plain:true,        
					activeTab: 0,        
					height:235,        
					defaults:{bodyStyle:'padding:10px'},        
					items:[{            
						title:'��¼��Ϣ',            
						layout:'form',            
						defaults: {width: 230},            
						defaultType: 'textfield',             
						items: [{                
							fieldLabel: '��¼��',                
							name: 'loginID',                
							allowBlank:false,                
							vtype:'alphanum',                
							allowBlank:false            
						},{                       
							inputType:'password',                
							fieldLabel: '����',                
							name: 'password',                
							allowBlank:false            
						}]        
					},{            
						title:'����ʱ����ĸ',            
						layout:'form',            
						defaults: {width: 230},           
						defaultType: 'textfield',             
						items: [{                       
							xtype:'numberfield',                
							fieldLabel: '����',                
							name: 'number'            
						},{                       
							xtype:'timefield',                
							fieldLabel: 'ʱ��',                
							name: 'time'            
						},{                
							fieldLabel: '����ĸ',                
							name: 'char',                
							vtype:'alpha'            
						}]        
					},{            
						title:'�ı�����',            
						layout:'fit',            
						items: {                
							xtype:'textarea',                
							id:'area',                
							fieldLabel:''            
							}        
					}]    
				}],
				buttons: [{        
					text: '����',        
					handler:function(){               
						if(simpleForm.form.isValid()){                       
							this.disabled=true;                       
							simpleForm.form.doAction('submit',{                                                     
								url:'test.asp',                                                     
								method:'post',                                                     
								params:'',                                                      
								success:function(form,action){                                                             
									Ext.Msg.alert('����',action.result.data);                                                             
									this.disabled=false;                                                     
								},                                                      
								failure:function(){                                                             
									Ext.Msg.alert('����','����ʧ�ܣ�');                                                             
									this.disabled=false;                                                     
								}                       
							});               
						}        
					}                
				},{        
					text: 'ȡ��',        
					handler:function(){
						simpleForm.form.reset();
					}    
				}]
			}); 
		</script>
	</div>