<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<%--
	 * �ɳ��Ǽ�
 	 * @author FANGZL 
--%>
<ww:action name="'select'" id="select"></ww:action>
<head>
<style type="text/css">
    .x-panel-body p {
        margin:10px;
    }
    #container {
        padding:10px;
    }
    </style>
    <script type="text/javascript" src="/js/TreeField.js"></script>
    <script language="javascript">
    
    		function fun_Agent(expediteapplyId,parm,usestate){
		    if (!confirm('��ȷ����!')){
				return;
			}else{
			   	var url = '/carmanage/expedite/applyer.shtml?actionType=agent&search.expediteapplyId='+expediteapplyId+'&search.agentFlag='+parm+'&search.useState='+usestate;
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
						var rowSet = root.selectNodes("//delete");
						if (0 < rowSet.item(0).selectSingleNode("value").text){
							alert("��ϣ������ɹ���");
							parent.document.ifrm_Applyering.window.location.reload();
						}else if(rowSet.item(0).selectSingleNode("value").text==-1){
							alert("����״̬�Ѿ�����ˣ���ˢ�£�");
							parent.document.ifrm_Applyering.window.location.reload();					
						}
						else{
							alert("��û�иõ��ݵ����Ȩ�ޣ�");
						}
					}
				}catch(e){ 
					alert(e);
				}
			}
		}
		  //�ɳ�����Ϊ���ڣ���;
 		expTypeDate = [["0", "����"],["1","��;"]];
		var expType = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: expTypeDate
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.expediteapplyType',
				fieldLabel: '�ɳ�����',
				name: 'test',
				width:100
			})	 
			
        //����ʹ��״̬��
 		useStateData = [
				<tt:setProperty name="#select.dynamicSql" 
				value="\"select '0' id,'��ͨ��' name 
				     union select '1' id,'ͨ��' name 
				     union select '2' id,'�ɳ��Ǽ�' name 
				     union select '3' id,'����' name 
				     union 
				     select a.flowernode_rowno+4 id,a.flowernode_name name 
				     from td_flowernode a 
				     where a.flowerdefine_id =
				     (select b.flowerdefine_id from td_flowerdefine b where b.flowerdefine_code='Exp_apply' order by flowerdefine_version limit 1)\""/>
				<ww:iterator value="#select.selectList" status="useStateList">["<ww:property value="id"/>", "<ww:property value="name"/>"]<ww:if test="#useStateList.count != #select.selectList.size()">,</ww:if></ww:iterator>
				
		];  
		var useState = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: useStateData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.useState',
				fieldLabel: '����״̬',
				name: 'test',
				width:100
			})	 
		function showSearch(){
			
			//ʹ�õ�λ
			var belongCompanyTree = new Ext.form.TreeField({
					minListHeight:200,
					dataUrl : '/basearchives/deptInfo/ajaxDeptInfo.shtml',
		            hiddenName : 'search.deptId',
		            valueField : 'id',
		            fieldLabel: 'ʹ�õ�λ',
		            treeRootConfig : {
		            	id:'',   
				        text : '��ѡ��',   
				        draggable:false  
		            },
		            value:''
			});
							
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			    	labelAlign: 'right', 
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        url:'/carmanage/expedite/applyer.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/carmanage/expedite/applyer.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [belongCompanyTree,useState,expType,{
			            fieldLabel: '���ݺ�',
			            name: 'search.expediteapplyId',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '�ó���',
			            name: 'search.useMan',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: 'Ԥ���ó�ʱ��',
			            name: 'search.begintendingDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endintendingDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        }],
			        buttons: [{
			            text: '��ѯ',
			            handler: function(){
			            	schForm.form.submit(); 
			            }
			        }]
			    });
			
			    var window = new Ext.Window({
			        title: '�ɳ���ѯ',
			        width: 300,
			        height:300,
			        minWidth: 300,
			        minHeight: 200,
			        layout: 'fit',
			        plain:true,
			        bodyStyle:'padding:5px;',
			        buttonAlign:'center',
			        items: schForm
			    });
			
			    window.show();
			});
		}
		
			Ext.onReady(function(){
				new Ext.Button({
			        text: '�� ѯ',
			        handler: showSearch
			    }).render(document.all.searchPanel);
			    
			    <tt:authority value="Applyering_Add">	    
			    new Ext.Button({
			        text: '�� ��',
			        handler: function(){
			        	parent.addTab('����ɳ�����','addApplyer','/carmanage/expedite/applyer.shtml?actionType=new','NO');
			        }
			    }).render(document.all.addPanel);	 
                </tt:authority>
			})
		/*�����������*/

					
		function fun_delete(expediteapplyId){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
			   	var url = '/carmanage/expedite/applyer.shtml?actionType=delete&search.expediteapplyId ='+expediteapplyId ;
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
						var rowSet = root.selectNodes("//delete");
						if (0 < rowSet.item(0).selectSingleNode("value").text){
							alert("ɾ���ɳ�������Ϣ�������ɹ���");
							parent.document.ifrm_Applyering.window.location.reload();
						}else{
							alert("ɾ���ɳ�������Ϣ������ʧ�ܣ�");
						}
					}
				}catch(e){ 
					alert(e);
				}
			}	
		}

	</script>
</head>
<body>
    <div id="searchPanel" style="margin:0px;width:100px;float:left;"></div>
	<div  id="addPanel" style="margin:0px;width:100px;"></div>
	<tt:grid id="applyer" value="applyerList" pagination="true">
		<tt:row >
			<tt:col  name="���ݺ�" width="150">
				<ww:if test="null != expediteapply_id">
					<a href="javascript:parent.addTab('�ɳ�������Ϣ', 'viewApply', '/carmanage/expedite/applyer.shtml?actionType=view&search.expediteapplyId=<ww:property value="expediteapply_id"/>','NO')">
						<ww:property value="expediteapply_id"/>
					</a>
				</ww:if>
			</tt:col>			 		
			<tt:col name="�ɳ�����" property="expediteapply_type_name" width="80"/>			
			<tt:col name="ʹ�õ�λ" property="dept_name" width="100"/>		
			<tt:col name="�˴�ص�" property="destination_local" width="100" />
			<tt:col name="�ó�����" property="use_excuse" width="75" visible="true"/>			
			<tt:col name="Ԥ���ó�ʱ��" property="intending_date" width="120"/>			
			<tt:col name="�ó���" property="use_man" width="80"/>
			<tt:col name="�ó�����ϵ��ʽ" property="use_mobile" width="90"/>
			<tt:col name="��������" property="city_name" width="90"  visible="true" />
			<tt:col name="����״̬" property="use_state_name" width="120"/>
			<tt:col name="����" align="center" width="100">
				<ww:if test="null != expediteapply_id">
					<ww:if test="use_state == 3">
					    <tt:authority value="Applyering_Update">
						<a href="javascript:parent.addTab('�޸��ɳ�����', 'editApply', '/carmanage/expedite/applyer.shtml?actionType=edit&search.expediteapplyId=<ww:property value="expediteapply_id"/>','NO')">�޸�</a>
						</tt:authority>
						
						<tt:authority value="Applyering_Delete">
						<a href="javascript:fun_delete(<ww:property value="expediteapply_id"/>)">ɾ��</a>
						</tt:authority>
					</ww:if>
					<ww:elseif test="use_state==2">
					    <tt:authority value="Applyering_ExpRecord">
						<a href="javascript:parent.addTab('�ɳ��Ǽ�', 'editExpedite', '/carmanage/expedite/expedite.shtml?actionType=new&search.expediteapplyId=<ww:property value="expediteapply_id"/>','NO')">�ɳ��Ǽ�</a>
						</tt:authority>
					</ww:elseif>
					<ww:elseif test="use_state==0 or use_state==1">
					</ww:elseif>
					<ww:else>
						<a href="javascript:fun_Agent(<ww:property value="expediteapply_id"/>,1,<ww:property value="use_state"/>)">ͬ��</a>
						<a href="javascript:fun_Agent(<ww:property value="expediteapply_id"/>,2,<ww:property value="use_state"/>)">��ͬ��</a>
					</ww:else>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid> 
</body>