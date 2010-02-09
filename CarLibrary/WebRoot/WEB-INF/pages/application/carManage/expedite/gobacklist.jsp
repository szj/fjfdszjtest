<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%--
	 * �س��Ǽ�
 	 * @author FANGZL 
--%>
<%@ include file="/common/taglibs.jsp"%>
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
		function showSearch(){
			
			//����
			var belongCompanyTree = new Ext.form.TreeField({
					minListHeight:200,
					dataUrl : '/basearchives/deptInfo/ajaxDeptInfo.shtml',
		            hiddenName : 'search.deptId',
		            valueField : 'id',
		            fieldLabel: '�ó�����',
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
			        url:'/carmanage/expedite/goback.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/carmanage/expedite/goback.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [belongCompanyTree,{
			            fieldLabel: '�������',
			            name: 'search.carNoCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '�ɳ���',
			            name: 'search.expediteMan',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '�ó���',
			            name: 'search.useCarMan',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '��ʻԱ',
			            name: 'search.driver',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: ' ��������',
			            name: 'search.begExpediteDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endExpediteDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: ' �س�����',
			            name: 'search.begGobackDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endGobackDate',
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
			        height:350,
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
		<c:if test="${param.action != 'report'}">
			Ext.onReady(function(){
				new Ext.Button({
			        text: '�� ѯ',
			        handler: showSearch
			    }).render(document.all.searchPanel);
			    
			})
		</c:if>
		
		function fun_delete(gobackCarId){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
			   	var url = '/carmanage/expedite/goback.shtml?actionType=delete&search.gobackCarId='+gobackCarId;
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
							alert("ɾ���س���Ϣ�������ɹ���");
							parent.document.ifrm_GoBackCarBooking.window.location.reload();
						}else{
							alert("ɾ���س���Ϣ������ʧ�ܣ�");
						}
					}
				}catch(e){ 
					alert(e);
				}
			}
		}
		
		/*ʱ��2009-04-13,���ŷ���*/
		function sms_feedback(goback_car_id,userman,usermobile,drivername,driver,cityid,billtype,drivernameex){
		    if (!confirm('��ȷ���� �ó���:'+userman+' ��ϵ��ʽ:'+usermobile+' ���͸����ͻ�����������?')){
				return;
			}else{
			    if(billtype==0)
			     	var url = '/carmanage/expedite/goback.shtml?actionType=feedback&search.gobackCarId='+goback_car_id+'&search.useCarManName='+userman+'&search.useCarManmobile='+usermobile+'&search.drivername='+drivername+'&search.driver='+driver+'&search.cityid='+cityid;
			    else if(billtype=1)
			     	var url = '/carmanage/expedite/goback.shtml?actionType=feedback&search.gobackCarId='+goback_car_id+'&search.useCarManName='+userman+'&search.useCarManmobile='+usermobile+'&search.drivername='+drivernameex+'&search.driver='+driver+'&search.cityid='+cityid;
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
							alert("���Ͷ���,�����ɹ���");
							parent.document.ifrm_GoBackCarBooking.window.location.reload();
						}else{
							alert("���Ͷ���,����ʧ�ܣ�");
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
	<div id="addPanel" style="margin:0px;width:100px;"></div>
	<tt:grid id="expedite" value="expediteList" pagination="true" xls="true">
		<tt:row >
			<tt:col name="�������ݺ�" width="135">
				<ww:if test="null != expedite_car_id">
					<a href="javascript:parent.addTab('�س���Ϣ', 'viewGoBack', '/carmanage/expedite/goback.shtml?actionType=view&search.expediteCarId=<ww:property value="expedite_car_id"/>','NO')">
						<ww:property value="expedite_car_id"/>
					</a>
				</ww:if>
			</tt:col>						 		
			<tt:col name="�ɳ�����" property="expedite_date" width="120"/>	
			<tt:col name="�������" property="car_no_code" width="80"/>
			<tt:col name="��ʼ���(����)" property="init_mileage" width="80"/>
			<tt:col name="��ֹ���(����)" property="end_mileage" width="80"/>
			<tt:col name="�ó�ʱ��(Сʱ)" property="usr_time_len" width="80"/>		
			<tt:col name="�س�����" property="goback_date" width="120"/>	
			<tt:col name="�ͻ�����" align="center" width="100">
			    <ww:if test="''.equals(feedback) and 0==feedback_state">
			        <a href="javascript:sms_feedback('<ww:property value="goback_car_id"/>','<ww:property value="use_car_man_name"/>','<ww:property value="use_car_man_mobile"/>','<ww:property value="driver_name"/>','<ww:property value="driver"/>','<ww:property value="city_id"/>','<ww:property value="bill_type"/>','<ww:property value="driver_nameex"/>')">����</a>
			    </ww:if>
			    <ww:if test="''.equals(feedback) and 1==feedback_state">
			         ������| <a href="javascript:sms_feedback('<ww:property value="goback_car_id"/>','<ww:property value="use_car_man_name"/>','<ww:property value="use_car_man_mobile"/>','<ww:property value="driver_name"/>','<ww:property value="driver"/>','<ww:property value="city_id"/>','<ww:property value="bill_type"/>','<ww:property value="driver_nameex"/>')">�ط�</a>
			    </ww:if>
			    <ww:else>
			      <ww:property value="feedback" />
				</ww:else>
			</tt:col>
			<c:if test="${param.action != 'report'}">
				<tt:col name="����" align="center" width="100">			
					<ww:if test="null != expedite_car_id">
					  	<ww:if test="null == goback_car_id">
					  		<tt:authority value="DJHCXX">
					    		<a href="javascript:parent.addTab('�Ǽǻس���Ϣ', 'editGoBack', '/carmanage/expedite/goback.shtml?actionType=new&search.expediteCarId=<ww:property value="expedite_car_id"/>&carNoCode=<ww:property value="car_no_code"/>','NO')">�Ǽ�</a>
					    	</tt:authority>
					  	</ww:if>
					  	<ww:else>
					  		<tt:authority value="XGHCXX">
					  			<a href="javascript:parent.addTab('�޸Ļس���Ϣ', 'editGoBack', '/carmanage/expedite/goback.shtml?actionType=edit&search.gobackCarId=<ww:property value="goback_car_id"/>&carNoCode=<ww:property value="car_no_code"/>&search.expediteCarId=<ww:property value="expedite_car_id"/>','NO')">�޸�</a>
					  		</tt:authority>
						</ww:else>
					</ww:if>
				</tt:col>
			</c:if>
		</tt:row>
	</tt:grid> 
</body>