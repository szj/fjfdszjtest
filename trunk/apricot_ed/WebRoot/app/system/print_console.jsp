 var orderFields=[
{label:"������",name:"order_no",hide:"form",width:120},
{label:"������",name:"order_id",hide:"all"},
{label:"��λ���",name:"set_no",hide:"all"},
{label:"��λ����",name:"balcony_name",width:80},
{label:"��������",name:"order_type_text"},
{label:"��������",name:"man_count",width:60},
{label:"�µ�ʱ��",name:"order_time",xtype:"datetime",width:110} ]; 
var foodFields=[
{label:"��ƷID",name:"food_id",hide:"all"},
{label:"��Ʒ����",name:"food_name"}, {label:"��Ʒ����",name:"food_price"},
{label:"��Ʒ����", name:"food_type_text",xtype:"combo",code:"FOOD_TYPE"},
{label:"��˶���", name:"food_action_text",xtype:"combo",code:"FOOD_TYPE"} ];

var orderList=createPageGrid({
       	   title: "�����б�",
       	   id:"app_business_print_order",
       	   urls:"/order/order_getprintorder.do",
           region:"center",
           firstLoad:true,
           filter:false,
           page:true,
       	   items:orderFields,
       	   rowclick:function(){
       	   	   var o=getData("app_business_print_order",["order_id"]);
       	   	   load("app_business_print_order_detail",o);
       	   }

   });
   
var orderDetail=createPageGrid({
	       title: "������ϸ",
       	   id:"app_business_print_order_detail",
       	   urls:"/order/order_getprintorderdetail.do",
           region:"east",
           firstLoad:false,
           filter:false,
             split:true,
       	   items:foodFields,
       	   width:400,
       	   page:false
       	   
       	   
	
}); 

var buttons=new Ext.Panel({buttonAlign:"center",border:false,region:"south",height:0});

buttons.addButton({text:"�����Զ�ˢ��"});  

return [orderList,orderDetail];


