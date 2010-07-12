var wFields=[
  {label:"����ID",name:"sf_id",hidden:true,hide:true},
  {label:"��������",name:"sf_name",query:true},
  {label:"�����ַ",  name:"sf_addr"}
];
var staffFields=[
  {label:"Ա��ID",name:"staff_id",hidden:true,hide:true},
  {label:"Ա������",name:"staff_code"},
  {label:"Ա������",  name:"staff_type",xtype:"combo",code:"STAFF_TYPE"},
  {label:"Ա������",  name:"staff_name"}

];
var mFields=[
  {label:"Ա��ID",name:"staff_id",id:"staff_id"},
  {label:"��ʼ���(��)",name:"staff_cash",id:"staff_cash",readOnly:true},
   {label:"��һ��������(��)",name:"priv_cash",id:"priv_cash",readOnly:true},
   {label:"�Ż�ȯ���(��)",name:"youhui_total",id:"youhui_total",readOnly:true},
   {label:"�ֽ���(��)",name:"fact_pay_total",id:"fact_pay_total",readOnly:true},
   {label:"ˢ�����(��)",name:"fact_pay_card",id:"fact_pay_card",readOnly:true},
   {label:"���˽��(��)",name:"book_cash",id:"book_cash",readOnly:true},
   {label:"�ϰ�ʱ��",name:"u_time",readOnly:true},
	{label:"����",name:"r_date",readOnly:true}
];


function passwordReset(){
   var fld=[
  
   {label:"���ս��(��)",id:"curMoney",width:60,name:"cur_Money",readOnly:true,
	   listeners:{
		   	"render":function(){
		   	var a=Ext.getCmp("curMoney");
		   		doGet("/staff/curr_money.do","",function(dt){
		   		a.setValue(dt["totalmoney"]);
		   		});
		   	}
	   }
   },
   {label:"ʵ�ʽ��(��)",width:60,id:"factcash",name:"fact_cash",allowBlank:false,emptyText:"������ʵ�ʽ��(��)",
   		listeners:{
   			"blur":function(){
   				var a=Ext.getCmp("factcash");
   				var b=Ext.getCmp("curMoney");
   				var t=Ext.getCmp("takecash");
   				var c=b.getValue()-a.getValue();
   				t.setValue(c);
   			}
   		}
   },
    {label:"�������(��)",id:"takecash",width:60,name:"take_cash",readOnly:true},
     {label:"����˵��",id:"diffmemo",width:60,name:"diff_memo",xtype:"textarea"}
       
   ];
   var w=createFormWindow({
       id        : "staff_password_reset",
       label     : "�˲�Ӫҵ���",
       items     : fld,
       action    : "/staff/curr_over.do",
       height    : 280,
       cols      : 1,
       width     : 330
   });
   
   w.show();
}

function login(){

doGet("/staff/before_over.do",null,function(dt){
/**
		if(dt["flag"]=="YES"){
		$alt("���Ӱ�ǰ���Ⱥ˲�Ӫҵ��")
		}else{
*/
var fpt = getCmp("fact_pay_total").getValue();
var sc = getCmp("staff_cash").getValue();
var pc = getCmp("priv_cash").getValue();
var si = getCmp("staff_id").getValue();
var total = Number(fpt)+Number(sc)+Number(pc);
 var simple = new Ext.FormPanel({
    	        id:'win1',
				labelWidth: 75, 			
				baseCls: 'x-plain',
				defaults: {width: 150},
				defaultType: 'textfield',
				items: [{
						fieldLabel: '�ʻ�',
						name: 'loginname',
						//anchor:'95%',
						allowBlank:false,
						blankText:'�ʻ�����Ϊ��'
					},{
						fieldLabel: '����',
						//anchor:'95%',
						name: 'password',
						allowBlank:false,
						blankText:'���벻��Ϊ��',
						inputType:"password"
					},{fieldLabel:"Ա��ID",name:"staff_id",value:si},
					{
	            	id:"mon",
	                fieldLabel: '���ս��',
	                readOnly:true,
	                value:total,
	                name: 'dayMoney',
	                regex:/^\d$/,
	                regexText:"����������"
	                },
	                {
	            	id:"balance",
	                fieldLabel: '�������',
	                allowBlank:false,
	                name: 'balance',
	                value:'0',
	                regex:/^\d$/,
	                regexText:"����������",
	                listeners:{"blur":function(){
	                		var fc = Ext.getCmp("factCash");
	                		fc.setValue(Number(total-getValue("balance")));
	                	}}
	                },
	                {
	            	id:"factCash",
	                fieldLabel: 'ʵ�ɽ��',
	                readOnly:true,
	                value:total,
	                name: 'factCash'
	                },
	                {
	            	id:"money",
	                fieldLabel: '��ʼ���',
	                allowBlank:false,
	                name: 'money'
	                },
	                {
	            	id:"diffmemo",
	            	xtype:"textarea",
	                fieldLabel: '��ע',
	                name:"diff_memo"
	                }
				],

				buttons: [{
					text: '��½',
					handler:function(){
					 doPost("/login1.do",getFormValues("win1"),function(rt){
					 window.location.href=currentPageBaseHREF+"/app/main.jsp";
					 },false);
					}
				},{
					text: '�ر�',
					handler:function(){ getCmp("win").destroy();}
				}]
			});    

	 win = new Ext.Window({
						id:'win',
						title:'�����½',
						layout:'fit',					
						width:300,
						height:350,
						plain:true,
                        bodyStyle:'padding:5px;',
						maximizable:false,
						closeAction:'close',
						closable:false,
						collapsible:true,
						plain: true,
             		    modal:true ,
						buttonAlign:'center',
						items:simple
					});
					win.show();
//	}
		
});					
}

function noLogin(){

doGet("/staff/before_over.do",null,function(dt){
var fpt = getCmp("fact_pay_total").getValue();
var sc = getCmp("staff_cash").getValue();
var pc = getCmp("priv_cash").getValue();
var si = getCmp("staff_id").getValue();
var total = Number(fpt)+Number(sc)+Number(pc);
 var simple = new Ext.FormPanel({
    	        id:'win1',
				labelWidth: 75, 			
				baseCls: 'x-plain',
				defaults: {width: 150},
				defaultType: 'textfield',
				items: [
					{fieldLabel:"Ա��ID",name:"staff_id",value:si},
					{
	            	id:"mon",
	                fieldLabel: '���ս��',
	                readOnly:true,
	                value:total,
	                name: 'dayMoney',
	                regex:/^\d$/,
	                regexText:"����������"
	                },
	                {
	            	id:"balance",
	                fieldLabel: '�������',
	                allowBlank:false,
	                name: 'balance',
	                value:'0',
	                regex:/^\d$/,
	                regexText:"����������",
	                listeners:{"blur":function(){
	                		var fc = Ext.getCmp("factCash");
	                		fc.setValue(Number(total-getValue("balance")));
	                	}}
	                },
	                {
	            	id:"factCash",
	                fieldLabel: 'ʵ�ɽ��',
	                readOnly:true,
	                value:total,
	                name: 'factCash'
	                },
	                {
	            	id:"money",
	                fieldLabel: '��ʼ���',
	                allowBlank:false,
	                name: 'money'
	                },
	                {
	            	id:"diffmemo",
	            	xtype:"textarea",
	                fieldLabel: '��ע',
	                name:"diff_memo"
	                }
				],

				buttons: [{
					text: '�Ͻ�',
					handler:function(){
					 doPost("/login2.do",getFormValues("win1"),function(rt){
					 window.location.href=currentPageBaseHREF+"/logout.jsp";
//					 window.location.href=currentPageBaseHREF+"/app/main.jsp";
					 },false);
					}
				},{
					text: '�ر�',
					handler:function(){ getCmp("win").destroy();}
				}]
			});    

	 win = new Ext.Window({
						id:'win',
						title:'�����½',
						layout:'fit',					
						width:300,
						height:350,
						plain:true,
                        bodyStyle:'padding:5px;',
						maximizable:false,
						closeAction:'close',
						closable:false,
						collapsible:true,
						plain: true,
             		    modal:true ,
						buttonAlign:'center',
						items:simple
					});
					win.show();
//	}
		
});					
}

return createTableForm2({
   id:"app_system_staff2",
   tableTitle:"Ա������",
   horizontal:true,
   tableURL:"/staff_Reshuffle/page.do",
   table:"staff_business_info",
   formCols:2,
   items:mFields,
   horizontal:false,
   toolBar :[
//   			 {text:"�˲�Ӫҵ���",iconCls:"password",handler:passwordReset},"-",
   			 {text:"����",iconCls:"password",handler:login},"-",
   			 {text:"�Ͻ�",iconCls:"password",handler:noLogin},"-"
   			]
});
