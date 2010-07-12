var sfSelectColumn=[
  {name:"sf_name",label:"��������",query:true},
  {label:"�����ַ",name:"sf_addr",width:200},
  {name:"sf_id",label:"�����ʶ",hidden:true}
];

var data={
   dining_floor  : "1",
   set_status    : "1" 
};

var setfields=[
       {label:"����",name:"sf_id",hidden:true,hide:true},
    	 {label:"��������",name:"sf_name",xtype:"trigger",table:"storefront_info",columns:sfSelectColumn},
    	 {label:"��λ���",name:"set_no",width:80,hide:"all"},
    	 {label:"¥��",name:"dining_floor",code:"FlOOR",xtype:"combo",width:80,allowBlank:false,sortable:true},
    	 {label:"��λ���",name:"balcony_code",width:80,allowBlank:false},
    	 {label:"����λ��",name:"belong_to",width:80,xtype:"combo",code:"BELONG_TO",allowBlank:false},
    	 {label:"��λ����",name:"balcony_name",handler:function(){alert('');}},
    	 {label:"��λ��������",name:"set_max",width:80},
    	 {label:"�����������",name:"mincost_type",width:80,xtype:"combo",code:"MINCOST_TYPE",allowBlank:false},
    	 {label:"������ѽ��",name:"mincost_money",width:80},
    	 {label:"����Ԥ��",name:"pre_order_style",width:80,xtype:"combo",code:"PRE_ORDER_STYLE"},
    	 {label:"��λ״̬",name:"set_status",width:80,code:"STATUS",xtype:"combo"}
    ];
    
var setfields_m=[
       {label:"����",name:"sf_id",hidden:true,hide:true},
    	 {label:"��������",name:"sf_name",hidden:true,xtype:"trigger",table:"storefront_info",columns:sfSelectColumn},
    	 {label:"��λ���",name:"set_no",width:80,hide:"all"},
    	 {label:"¥��",name:"dining_floor",value:"1",code:"FlOOR",xtype:"combo",width:80,allowBlank:false,sortable:true},
    	 {label:"��ʼ���",xtype:"number",name:"balcony_code_start",width:80,allowBlank:false},
    	 {label:"�������",xtype:"number",name:"balcony_code_end",width:80,allowBlank:false},
    	 {label:"����λ��",name:"belong_to",width:80,xtype:"combo",code:"BELONG_TO"},
    	 {label:"��λ����",name:"balcony_name",handler:function(){alert('');}},
    	 {label:"��λ��������",name:"set_max",width:80},
    	 {label:"�����������",name:"mincost_type",width:80,xtype:"combo",code:"MINCOST_TYPE",allowBlank:false},
    	 {label:"������ѽ��",name:"mincost_money",width:80},
    	 {label:"����Ԥ��",name:"pre_order_style",width:80,xtype:"combo",code:"PRE_ORDER_STYLE"},
    	 {label:"��λ״̬",name:"set_status",width:80,code:"STATUS",xtype:"combo",hide:"all"}
    ];

if(getSessionData){
   data=Ext.apply(data,getSessionData());
}

function multiAdd(){
   
   var win=createFormWindow({
      items       : setfields_m,
      label       : "���������λ",
      id          : "app_shop_shop_set_m",
      data        : data,
      cols        : 1,
      close       : cLoadEvent("app_shop_shop_set_table"),
      action      : "/shop/dinner_set_multiadd.do"
   });
   win.show();
}

return createTableForm({
   id:"app_shop_shop_set",
   tableTitle:"��λ�б�",
   formTitle:"��λ������Ϣ",
   horizontal:false,
   table:"dining_set_info",
   data:data,
   tableURL:"/shop/dinner_set_pages.do",
   formCols:2,
   items:setfields,
   checkValid:function(o){
       if(!o.mincost_money || o.mincost_money=="" || o.mincost_money==0){
           
           return true;
       }
       else
       {
       	if(!o.mincost_type || o.mincost_type=="")
       	{
       		$alt("��ѡ�������������");
       		return false;
       	}
       	else
       	{
       		return true;
       	}
       }
   },
   toolBar:[
      {text:"��������",iconCls:"gridmultiadd",handler:multiAdd}
    ]
});