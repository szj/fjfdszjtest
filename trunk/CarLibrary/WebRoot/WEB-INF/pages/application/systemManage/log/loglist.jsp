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
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'operateLog.cityId',
				fieldLabel: '��������',
				name: 'test',
				width:100
			})							
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        url:'/system/log/log.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/system/log/log.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: '��Ա',
			            name: 'operateLog.staffId',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: 'ҵ���������',
			            name: 'operateLog.serviceName',
			            width:100  
			        },{
			            xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '����ʱ��',
			            name: 'operateLog.optTime',
			            width:100  
			        },cityId],
			        buttons: [{
			            text: '��ѯ',
			            handler: function(){
			            	schForm.form.submit(); 
			            }
			        }]
			    });
			
			    var window = new Ext.Window({
			        title: '��־��ѯ',
			        width: 300,
			        height:230,
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
		})
		
		
	</script>
</head>
<body>
	<div id="searchPanel" style="margin:0px;width:100px;float:left;"></div>	
	<tt:grid id="log" value="logList" pagination="true" xls="false">
		<tt:row >
			<tt:col name="��ԱID" property="STAFF_ID" width="100"/>
			<tt:col name="ҵ���������" property="SERVICE_NAME" width="100"/>
			<tt:col name="����ʱ��" property="OPT_TIME" width="120"/>			
			<tt:col name="�������" width="100">
				<ww:if test="OPT_RESULT.equals(\"1\")">�����ɹ�</ww:if>
				<ww:elseif test="OPT_RESULT.equals(\"0\")">����ʧ��</ww:elseif>
				<ww:else>�����ɹ�</ww:else>
			</tt:col>
			<tt:col name="��¼�ն˺�" property="OPT_TERM" width="100"/>
			<tt:col name="��������" property="cityId" width="100"></tt:col>		
		</tt:row>
	</tt:grid>
</body>