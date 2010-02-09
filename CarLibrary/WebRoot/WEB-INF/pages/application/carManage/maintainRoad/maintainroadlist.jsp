<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
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
    <script language="javascript">
		function showSearch(){			  
			cityIdData = [
				<tt:setProperty name="#select.dynamicSql" value="'select city_id,city_name from td_city where city_id in (select city_id from tf_staff_city  where  staff_id=' + #session['UserInfo'].staffId+')'"/>
				<ww:iterator value="#select.selectList" status="cityIdList">["<ww:property value="city_id"/>", "<ww:property value="city_name"/>"]<ww:if test="#cityIdList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var cityId = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: cityIdData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.cityId',
				fieldLabel: '��������',
				name: 'test',
				width:100
			})							
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        url:'/carmanage/maintainroad/maintainRoad.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/carmanage/maintainroad/maintainRoad.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: '�շ���Ŀ����',
			            name: 'search.chargeItemName',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '�շѱ�׼',
			            name: 'search.chargeStandard',
			            width:100  
			        },{
			            fieldLabel: '�շѷ�Χ',
			            name: 'search.chargeBound',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '��׼����',
			            name: 'search.authorizeOrgan',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: '�������',
			            name: 'search.carNoCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },cityId,{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: ' ��������',
			            name: 'search.begBookingDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endBookingDate',
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
			        title: '������·�Ѳ�ѯ',
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
		    <tt:authority value="TJYLFXX">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('�����·����Ϣ','addMaintainRoad','/carmanage/maintainroad/maintainRoad.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		})
		
		function fun_delete(maintainRoadId){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
					return;
				}else{
				   var url = '/carmanage/maintainroad/maintainRoad.shtml?actionType=delete&search.maintainRoadId='+maintainRoadId;
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
						alert("ɾ����·����Ϣ�������ɹ���");
						parent.document.ifrm_MaintainRoadExpenses.window.location.reload();
					}else{
						alert("ɾ����·����Ϣ������ʧ�ܣ�");
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
	<tt:grid id="maintainroad" value="maintainRoadList" pagination="true" xls="true">
		<tt:row >
			<tt:col name="��������" width="80">
				<ww:if test="null != maintain_road_id">
					<a href="javascript:parent.addTab('��·����Ϣ', 'viewMaintainRoad', '/carmanage/maintainroad/maintainRoad.shtml?actionType=view&search.maintainRoadId=<ww:property value="maintain_road_id"/>','NO')">
						<ww:property value="booking_date"/> 
					</a>
				</ww:if>
			</tt:col>
			<tt:col name="�շ���Ŀ����" property="charge_item_name" width="100"/>			
			<tt:col name="�շѱ�׼" property="charge_standard" width="100"/>
			<tt:col name="��������" property="cityId" width="80"/>	
			<tt:col name="�շѷ�Χ" property="charge_bound" width="100"/>		
			<tt:col name="�������" property="carNoId" width="100"/>
			<tt:col name="��׼����" property="authorize_organ" width="100"/>
			<tt:col name="����" align="center" width="100">
				<ww:if test="null != maintain_road_id">
					<tt:authority value="XGYLFXX">
						<a href="javascript:parent.addTab('�޸���·����Ϣ', 'editMaintainRoad', '/carmanage/maintainroad/maintainRoad.shtml?actionType=edit&search.maintainRoadId=<ww:property value="maintain_road_id"/>','NO')">�޸�</a>
					</tt:authority>
					<tt:authority value="SCYLFXX">
						<a href="javascript:fun_delete(<ww:property value="maintain_road_id"/>)">ɾ��</a>
					</tt:authority>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid> 
</body>