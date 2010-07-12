var setFields=[
  {label:"��λ��",name:"set_no",hide:"all",readOnly:true},
  {label:"¥��",name:"dining_floor",readOnly:true},
  {label:"����λ��",name:"belong_to_text",readOnly:true},
  {label:"��λ����",name:"balcony_name",readOnly:true},
  {label:"��λ״̬",name:"man_num",readOnly:true},
  {label:"�����������",name:"mincost_type",readOnly:true,code:"MINCOST_TYPE"},
  {label:"������ѽ��",name:"mincost_money",readOnly:true}
];
var staffFields=[
  {label:"Ա��ID",name:"staff_id",hidden:true,hide:true},
  {label:"Ա������",name:"staff_code"},
  {label:"Ա������",  name:"staff_type",xtype:"combo",code:"STAFF_TYPE"},
  {label:"Ա������",  name:"staff_name"}
];

var foodFields=[
  {label:"��ƷID",name:"food_id",hide:"all"},
  {label:"��Ʒ����",name:"food_name"},
  {label:"��Ʒ����",name:"food_price"},
  {label:"��Ʒ����",  name:"food_type",xtype:"combo",code:"FOOD_TYPE"}

];
//�����б���
var orderFields=[
      {label:"������",name:"order_no",hide:"form",width:150},
      {label:"������",name:"order_id",hide:"all"},
      {label:"��λ���",name:"set_no",hide:"all"},
      {label:"��λ����",name:"balcony_name"},
      {label:"��������",name:"order_type",hide:"form",xtype:"combo",code:"ORDER_TYPE"},
      {label:"��������",name:"man_count"},
      {label:"�����������",name:"mincost_type",hide:"form",xtype:"combo",code:"MINCOST_TYPE"},
      {label:"������ѽ��",name:"mincost_money"},
      {label:"����ʱ��",name:"operate_order_time",xtype:"datetime",width:160},
      {label:"Ԥ��ʱ��",name:"prearrange_order_time",xtype:"datetime",width:160},
      {label:"�µ�ʱ��",name:"order_time",xtype:"datetime",width:160},
      {label:"ȡ��ʱ��",name:"can_order_time",xtype:"datetime",width:160},
      {label:"����״̬",name:"order_status",hide:"form",xtype:"combo",code:"ORDER_STATUS"},
      {label:"Ԥ��������",name:"prearrange_name"},
      {label:"Ԥ���˵绰����",name:"prearrange_phone"},
      {label:"Ԥ������",name:"prearrange_man_count"},
      {label:"Ԥ��VIP����",name:"vip_card_no"},
      {label:"�߲˴���",name:"hurry_times",value:"0",hide:"form"},
      {label:"Ԥ����¼��",name:"record_staff_id"},
      {label:"�����˵�ַ",name:"prearrange_addr"} 
   ];
//�����༭��
var orderFields1=[
      {label:"������",name:"order_no"},
      {label:"��λ���",name:"set_no"},
      {label:"����Ա",name:"service_staff_id",hide:"all"},
      {label:"����Ա",name:"staff_name"},
      {label:"��������",name:"man_count"},
      {label:"����ʱ��",name:"order_time",xtype:"datetime"},
      {label:"����״̬",name:"order_status",hide:"form",xtype:"combo",code:"ORDER_STATUS"},
      {label:"�ۿ�",name:"order_discount",hide:"grid"},
      {label:"�ۿ�ԭ��",name:"order_discount_reseon",hide:"grid"},
      {label:"�Ƿ��Ѿ��÷�Ʊ",name:"has_invoice",xtype:"combo",code:"STATUS",allowBlank:false},
      {label:"��������",name:"order_type",xtype:"combo",code:"ORDER_TYPE"},
      {label:"Ԥ��������",name:"prearrange_name"},
      {label:"Ԥ���˵绰����",name:"prearrange_phone"},
      {label:"Ԥ������",name:"prearrange_man_count"},
      {label:"Ԥ��VIP����",name:"vip_card_no"},
      {label:"�߲˴���",name:"hurry_times",value:"0",hide:"form"},
      {label:"�����˵�ַ",name:"prearrange_addr"}
   ];
   
var outOrderFields=[
      {label:"����Ա",name:"service_staff_id",hide:"all"},
      {label:"�Ͳ�Ա",name:"staff_name",allowBlank:false,readOnly:true,xtype:"trigger",table:"staff_info",columns:staffFields,map:{staff_id:"service_staff_id"}},
      {label:"���ݷ�",name:"man_count",allowBlank:false},
      {label:"�Ͳ�ʱ��",name:"order_time",xtype:"datetime",allowBlank:false},
      {label:"����״̬",name:"order_status",hide:"form"},
      {label:"�Ƿ�Ҫ��Ʊ",name:"has_invoice",xtype:"combo",code:"IS_OR_NOT",value:'0',allowBlank:false},
      {label:"����������",name:"prearrange_name",allowBlank:false},
      {label:"�����˵绰",name:"prearrange_phone",allowBlank:false},
      {label:"VIP����",name:"vip_card_no"},
      {label:"��������",name:"order_type",hide:"form"},
      {label:"����״̬",name:"order_status",hide:"form"},
      {label:"�Ͳ͵�ַ",name:"prearrange_addr",allowBlank:false}
   ];   
//������ϸ�б���   
var orderDetailFields=[
      {label:"������ʶ",name:"order_id",hide:"all"},
      {label:"��ƷID",name:"food_id",hide:"all"},
      {label:"��Ʒ����",name:"food_name",sortable:true},
      {label:"��ǰ�۸�",name:"food_price",width:60,sortable:true},
      {label:"����",name:"food_count",width:60},
      {label:"Ա������",name:"modify_staff_name",sortable:true},
      {label:"��Ʒ����",name:"food_action",code:"FOOD_ACTION",sortable:true},
      {label:"�ϲ˱�ʶ",name:"serving_flag",code:"SERVING_FLAG",sortable:true},
      {label:"����Ҫ��",name:"food_memo"},
      {label:"�˲�ԭ��",name:"food_return_reseon"},
      {label:"�˲�ԭ������",name:"food_return_type"},
      {label:"�ۿ�",name:"food_discount"},
      {label:"�ۿ�ԭ��",name:"food_discount_reseon"},
      {label:"������ϸID",name:"order_list_id",hide:"all"},
      //{label:"����һ���޸���",name:"modify_staff_id"},
      
      {label:"�ɲ�ƷID",name:"old_food_id",hide:"all"}
   ];
   
//�ͻ�Ԥ�������༭��
var preOrderFields=[
      {label:"������",name:"order_no",hide:"form",width:150},
      {label:"������",name:"order_id",hide:"all"},
     ��{label:"Ԥ��������",name:"prearrange_name"},
      {label:"��ϵ�绰",name:"prearrange_phone"},
     ��{label:"Ԥ������",name:"prearrange_man_count"},
     ��{label:"VIP����",name:"vip_card_no"},
     ��{label:"�����˵�ַ",name:"prearrange_addr",hide:"all"},
      {label:"����������",name:"staff_id",hide:"all"},
     ��{label:"����Ա",name:"staff_name",allowBlank:false,readOnly:true,xtype:"trigger",table:"staff_info",columns:staffFields},
      {label:"��������",name:"order_type",xtype:"combo",code:"PREARRANGE_ORDER_TYPE"}, 
      {label:"����ʱ��",name:"operate_order_time",width:160,readOnly:true,value:new Date().dateFormat("Y-m-d H:i:s")},
      {label:"Ԥ��ʱ��",name:"prearrange_order_time",readOnly:true,xtype:"datetime",width:160 },  
      {label:"Ԥ����λ",name:"set_no",hide:"form"},
      {label:"Ԥ����λ",name:"balcony_name",xtype:"trigger",tableURL:"/shop/free_set2.do",getData:function() {return {P_time:getFormValues("app_business_order_pre_order_win_form",["prearrange_order_time"]).prearrange_order_time};}
      ,columns:setFields},
      {label:"�����������",name:"mincost_type",width:80,xtype:"combo",code:"MINCOST_TYPE",readOnly:true},
    	{label:"������ѽ��",name:"mincost_money",width:80,readOnly:true},
      {label:"����״̬",name:"order_status",hide:"form",xtype:"combo",code:"ORDER_STATUS"},
//      {label:"��������",name:"man_count"},
      {label:"�߲˴���",name:"hurry_times",value:"0",hide:"form"},
      {label:"����Ԥ��ʱ����Զ��ͷ�(��)",name:"overdue_time",width:100,xtype:"number",emptyText:10}
      
   ];
//�Ӳ˱༭����   
var addFoodFields=[
      {label:"������ʶ",name:"order_id",hide:"all"},
      {label:"��ƷID",name:"food_id",hide:"all"},
      {label:"��Ʒ����",name:"food_name",readOnly:true,xtype:"trigger",table:"food_info",columns:foodFields},
      {label:"����",name:"food_count"},
      {label:"������ϸID",name:"order_list_id",hide:"all"},
      {label:"��ǰ�۸�",name:"food_price",width:60},
      {label:"��Ʒ��ϸ��ʶ",name:"order_list_id",hide:"all"},
      {label:"����Ҫ��",name:"food_memo"},
      {label:"��Ʒ��ϸ���",name:"food_seq"}
   ];
   
/**
 * �����¼�
 */   
function createOrder(urls,data,itms){
  var w=createFormWindow({cols:1,id:"app_business_order_pre_order",
     label:"�ͻ�Ԥ��",action:urls,items:(itms)?itms:preOrderFields,
     width:500,height:500
     });
  w.show();
  getCmp("app_business_order_pre_order_win_form").getForm().setValues(data);
  w.on("beforedestroy",function(){reload("app_business_preorder_write_3");});
}

function createOrderList(urls,flds,data,tit){
  var w=createFormWindow({cols:1,id:"app_business_order_pre_order",label:tit,action:urls,items:flds});
  w.show();
  getCmp("app_business_order_pre_order_win_form").getForm().setValues(data);
  w.on("beforedestroy",function(){reload("app_business_preorder_write_2222");});
}

//�Ӳ˲���
var addFoodEvent=function(){
   createOrderList("/order/order_addfood.do",addFoodFields,getData("app_business_preorder_write_3",["order_id"]),"�ͻ��Ӳ�");
}

//ȡ������
var cancelFoodEvent=function(){
   doPost("/order/order_cancelfood.do",getData("app_business_preorder_write_2222",["order_list_id"]),function(dt){
       reload("app_business_preorder_write_2222");
   });
}

//�˲˲���
var returnFoodEvent=function(){
   var flds=[
      {label:"�˲�ԭ������",name:"food_return_type",xtype:"combo",code:"FOOD_RETURN_TYPE"},
      {label:"�˲�ԭ��",name:"food_return_reseon",xtype:"textarea"},
      {label:"������ϸID",name:"order_list_id",hide:"form"}
   ];
   
   createOrderList("/order/order_returnfood.do",flds,getData("app_business_preorder_write_2222"),"�˲�")
}
//�ϲ˲���
var servFoodEvent=function(){
   doPost("/order/order_servfood.do",getDataArray("app_business_preorder_write_2222",["order_list_id"]),function(dt){
       reload("app_business_preorder_write_2222");
   });
}
   
//Ԥ������   
var preOrderEvent=function(){
    var dt={order_status:"2",order_type:"2"};
    createOrder("/order/order.do",dt);
};
//�����µ�����
var orderEvent=function(){
    var dt={order_status:"0",order_type:"0"};
    createOrder("/order/order.do",dt);
};

//�绰Ԥ��
var telOrderEvent=function(){
    var dt={order_status:"2",order_type:"2"};
    createOrder("/order/order.do",dt);
};

//����
var outOrderEvent=function(){
    var dt={order_status:"0",order_type:"4"};
  var w=createFormWindow({cols:1,id:"app_business_order_pre_order",
     label:"������",action:"/order/order.do",items:outOrderFields,
     width:500,height:400
     });
  w.show();
  getCmp("app_business_order_pre_order_win_form").getForm().setValues(dt);
  w.on("beforedestroy",function(){reload("app_business_preorder_write_3");});
};

//��������
var orderOpenEvent=function(d){

   var sdt=getData("app_business_preorder_write_3");
   if(!(sdt["order_status"]=="2")){
     $alt("��ѡ��һ��Ԥ���������п���.");
     return;
   }
   
   var grid=createPageGrid({
      id       : "preorder_open_grid",
      title    : "��λ�б�",
      items    : [{label:"��λ��",name:"set_no",hide:"all"},
                  {label:"��λ���",name:"balcony_code"},
                  {label:"Ԥ������",name:"man_num",width:60},
                  {label:"��ǰ�����λ��",name:"set_max",width:80},
                  {label:"¥��",name:"dining_floor",code:"DINING_FLOOR",width:60},
                  {label:"��λ����",name:"balcony_name"}],
      region   : "center",
      urls     : "/shop/free_set3.do?set_no="+sdt["set_no"],
      filter   : false
   });
   
   var win=new Ext.Window({
      title     : "�ͻ�����",
      items     : [grid],
      height    : 300,
      width     : 400,
      layout    : "border",
      bodyBorder: false,
      border    : false
   
   });
   
   win.addButton({text:"ȷ��",handler:function(){
      var postData=Ext.apply(d,grid.getSelectionModel().getSelected().data);
      
      doPost("/order/customer_open.do",postData,function(e){
         reload("app_business_preorder_write_3"); 
         win.destroy();
      })
   }});
   
   win.addButton({text:"�ر�",handler:function(){
      win.destroy();
   }});
   
   win.show();
   
};

var orderOpenEvent1=function(d){

   var sdt=getData("app_business_preorder_write_3");
   
   if(!(sdt["order_status"]=="2")){
     $alt("��ѡ��һ��Ԥ���������п���.");
     return;
   }
��  var preOrderField12=[
      {label:"������",name:"order_no",width:150,hide:"form",value:sdt["order_no"]},
      {label:"������",name:"order_id",hide:"all",value:sdt["order_id"]},
      {label:"����Ա",name:"staff_id",allowBlank:false,hide:"form"},
     ��{label:"����Ա",name:"staff_name",allowBlank:false,readOnly:true,xtype:"trigger",table:"staff_info",columns:staffFields},
      {label:"Ԥ��������",name:"prearrange_name",value:sdt["prearrange_name"]},
      {label:"��ϵ�绰",name:"prearrange_phone",value:sdt["prearrange_phone"]},
     ��{label:"Ԥ������",name:"prearrange_man_count",value:sdt["prearrange_man_count"]},
     ��{label:"VIP����",name:"vip_card_no",value:sdt["vip_card_no"]},
     ��{label:"�����˵�ַ",name:"prearrange_addr",hide:"all",value:sdt["prearrange_addr"],value:sdt["prearrange_name"]},
 //    ��{label:"Ԥ����¼��",name:"record_staff_id",value:sdt["record_staff_id"]},
 	  {label:"��������",name:"order_type",code:"PREARRANGE_ORDER_TYPE",value:sdt["order_type"],hide:"form"}, 
      {label:"��������",name:"order_type_text",code:"PREARRANGE_ORDER_TYPE",value:sdt["order_type"]}, 
      {label:"����ʱ��",name:"operate_order_time",width:160,readOnly:true,value:sdt["operate_order_time"]},
      {label:"Ԥ��ʱ��",name:"prearrange_order_time",width:160 ,value:sdt["prearrange_order_time"]},
      {label:"�µ�ʱ��",name:"order_time",allowBlank:false,xtype:"datetime",width:160,readOnly:true},
      {label:"Ԥ����λ",name:"set_no",value:sdt["set_no"],hide:"form"},
      {label:"Ԥ����λ",name:"balcony_name",id:"b_n",value:sdt["balcony_name"]},
      {label:"�����������",name:"mincost_type",width:80,xtype:"combo",code:"MINCOST_TYPE",readOnly:true},
    	{label:"������ѽ��",name:"mincost_money",width:80,readOnly:true},
      {label:"����״̬",name:"order_status",hide:"form",code:"ORDER_STATUS",value:sdt["prearrange_name"]},
      {label:"��������",name:"man_count",value:sdt["man_count"]},
      {label:"�߲˴���",name:"hurry_times",value:"0",hide:"form",value:sdt["hurry_times"]}
  
   ];
  var w=createFormWindow({cols:1,id:"app_business_order_pre_order11",
     label:"�ͻ�����",action:"/order/customer_open.do",items:preOrderField12,
     width:500,height:500,data:sdt

     });
  w.show();
  getCmp("app_business_order_pre_order11_win_form").getForm().setValues({order_status:"0"});
  w.on("beforedestroy",function(){reload("app_business_preorder_write_3");});
   
};

var orderOpenEvent3=function(d){

   var sdt=getData("app_business_preorder_write_3");
   
   if(!(sdt["order_status"]=="2" || sdt["order_status"]=="0")){
     $alt("��ѡ��һ��Ԥ�����������޸�.");
     return;
   }
��  var preOrderField12=[
      {label:"������",name:"order_no",width:150,hide:"form",value:sdt["order_no"]},
      {label:"������",name:"order_id",hide:"all",value:sdt["order_id"]},
      {label:"����Ա",name:"staff_id",allowBlank:false,hide:"form"},
     ��{label:"����Ա",name:"staff_name",allowBlank:false,readOnly:true,xtype:"trigger",table:"staff_info",columns:staffFields},
      {label:"Ԥ��������",name:"prearrange_name",value:sdt["prearrange_name"]},
      {label:"��ϵ�绰",name:"prearrange_phone",value:sdt["prearrange_phone"]},
     ��{label:"Ԥ������",name:"prearrange_man_count",value:sdt["prearrange_man_count"]},
     ��{label:"VIP����",name:"vip_card_no",value:sdt["vip_card_no"]},
     ��{label:"�����˵�ַ",name:"prearrange_addr",hide:"all",value:sdt["prearrange_addr"],value:sdt["prearrange_name"]},
 //    ��{label:"Ԥ����¼��",name:"record_staff_id",value:sdt["record_staff_id"]},
      {label:"��������",name:"order_type",code:"PREARRANGE_ORDER_TYPE",value:sdt["order_type"]}, 
      {label:"����ʱ��",name:"operate_order_time",width:160,readOnly:true,value:sdt["operate_order_time"]},
      {label:"Ԥ��ʱ��",name:"prearrange_order_time",width:160 ,value:sdt["prearrange_order_time"],readOnly:!equals(sdt,"order_status","2")},
      {label:"�µ�ʱ��",name:"order_time",allowBlank:false,xtype:"datetime",width:160,readOnly:true},
      {label:"Ԥ����λ",name:"set_no",value:sdt["set_no"],hide:"form"},
      {label:"Ԥ����λ",name:"balcony_name",xtype:"trigger",tableURL:"/shop/free_set2.do",getData:function() {return {P_time:getFormValues("app_business_order_pre_order1111_win_form",["prearrange_order_time"]).prearrange_order_time};},columns:setFields},
      {label:"�����������",name:"mincost_type",width:80,xtype:"combo",code:"MINCOST_TYPE",readOnly:true},
    	{label:"������ѽ��",name:"mincost_money",width:80,readOnly:true},
      {label:"����״̬",name:"order_status",hide:"form",code:"ORDER_STATUS",value:sdt["prearrange_name"]},
      {label:"��������",name:"man_count",value:sdt["man_count"]},
      {label:"�߲˴���",name:"hurry_times",value:"0",hide:"form",value:sdt["hurry_times"]}
  
   ];
  var w=createFormWindow({cols:1,id:"app_business_order_pre_order1111",
     label:"�����޸�",action:"/order/customer_edit.do",items:preOrderField12,
     width:500,height:500,data:sdt

     });
  w.show();
  getCmp("app_business_order_pre_order1111_win_form").getForm().setValues({order_status:"0"});
  w.on("beforedestroy",function(){reload("app_business_preorder_write_3");});
};

//�ͻ��˵�
var orderCancelEvent=function(){
   var sdt=getData("app_business_preorder_write_3");
   if(!(sdt["order_status"]=="2")){
     $alt("��ѡ��һ��Ԥ�����������˵�.");
     return;
   }
    
   var dt={order_id:sdt["order_id"],order_status:"3"};
   doPost("/order_info.modify.go",dt,function(o){
      reload("app_business_preorder_write_3");
   });
   
};  

var orderCancelEvent1=function(d){

   var sdt=getData("app_business_preorder_write_3");
   if(!(sdt["order_status"]=="2")){
     $alt("��ѡ��һ��Ԥ�����������˵�.");
     return;
   }
   sdt["order_status"] ="3";
   sdt["can_order_time"] =new Date().dateFormat("Y-m-d H:i:s");
��  var canOrderField12=[
      {label:"������",name:"order_no",width:150,hide:"form",value:sdt["order_no"]},
      {label:"������",name:"order_id",hide:"all",value:sdt["order_id"]},
      {label:"����Ա",name:"staff_id",allowBlank:false,hide:"form"},
     ��{label:"����Ա",name:"staff_name",readOnly:true,xtype:"trigger",table:"staff_info",columns:staffFields},
//      {label:"ȡ��ʱ��",name:"can_order_time",width:160,readOnly:true,hide:true},
      {label:"ȡ��ԭ��",name:"order_reseon1",width:160,xtype:"combo",readOnly:true,code:"ORDER_RESEON"},
      {label:"ȡ��ԭ��",name:"order_reseon2",width:160,xtype:"textarea"},
      {label:"����״̬",name:"order_status",width:160,readOnly:true,hide:true}
  
   ];
  var w=createFormWindow({cols:1,id:"app_business_order_can_order11",
     label:"�ͻ��˵�",action:"/order/order_info_modify.do",items:canOrderField12,
     width:500,height:200,data:sdt

     });
  w.show();
 
  w.on("beforedestroy",function(){reload("app_business_preorder_write_3");});
   
};

//�˵���ӡ
var foodPrintEvent=function(){
};

//��ˮ����ӡ
var drinkPrintEvent=function(){};

//��������ӡ
var outPrintEvent=function(){};
//�ͻ�����
var orderPayEvent=function(){
    var dt=getData("app_business_preorder_write_3");
    var dts = [getData("app_business_preorder_write_3",["order_no"]).order_no,getData("app_business_preorder_write_3",["mincost_money"]).mincost_money,getData("app_business_preorder_write_3",["mincost_type"]).mincost_type,getData("app_business_preorder_write_3",["man_count"]).man_count];
    var w=cCalculatePanel(dts,cLoadEvent("app_business_preorder_write_3"));
    w.show(this);
};



/** �����¼����� **/ 

//������Ϣ��ʾ
var orderForm= createFormPanel({
   id:"app_business_preorder_write_1111",
   title:"������Ϣ",
   region:"north",
   editable:true,
   height:300,
   cols : 1,
   items:orderFields1
});

function isDisabled(dt,flagAction,servingFlag){
    var b=true;
    if(flagAction && flagAction!=null) b =b && dt["food_action"]==flagAction;
    if(servingFlag) b =b && dt["serving_flag"]==servingFlag;
    return b
}

function isDisabled11(dt,flagAction,servingFlag,dt3){
    var b=true;
    if(dt3["order_status"] == 2 || dt3["order_status"] == 1)
    {
    	b=false;
    }
    else
    {
	    if(flagAction && flagAction!=null) b =b && dt["food_action"]==flagAction;
	    if(servingFlag) b =b && dt["serving_flag"]==servingFlag;
	  }
    return b
}

function isDisabled22(dt,flagAction,servingFlag,dt3){
    var b=true;
    if(dt3["order_status"] == 1 || dt3["order_status"] == 3 || dt3["order_status"] == 4)
    {
    	b=false;
    }
    else
    {
	    if(flagAction && flagAction!=null) b =b && dt["food_action"]==flagAction;
	    if(servingFlag) b =b && dt["serving_flag"]==servingFlag;
	  }
    return b
}

//������ϸ�б�
var orderDetailList=createPageGrid({
       	   title: "������ϸ",
       	   id:"app_business_preorder_write_2222",
       	   urls:"/order/order_list.do",
           split:true,
           //page:true,
           height:500,
           width:500,
           filter:false,
           region:"center",
           checkbox:true,
           singleSelect:false, 
       	   items:orderDetailFields,
       	   
       	   bbar:["���˵�ҵ���߼��ǣ��˲ˣ�Ȼ����.�ۿ۰��հٷֱ���д(����:�����۾���д85)",{style:"padding:5px"}]
   });




/***
 * ������ѯ��������
 */
var toolBars=["��ѯ����","&nbsp;","-",
						  createField({name:"query_type",xtype:"combo",code:"QUERY_TYPE",width:80}),
       	                  createField({name:"query_text",width:100}),
       	                  "&nbsp;",
       	                  "��ʼʱ��","&nbsp;","-",
       	                  createField({name:"starttime",xtype:"date",width:85}),
       	                  "&nbsp;",
       	                  "����ʱ��","&nbsp;","-",
       	                  createField({name:"endtime",xtype:"date",width:85}),
       	                  "&nbsp;",
       	                  createField({name:"order_type",xtype:"combo",code:"ORDER_TYPE",width:80}),
       	                  "&nbsp;",
       	                  createField({name:"order_status",xtype:"combo",code:"ORDER_STATUS",width:80}),
       	                  "&nbsp;",
       	                  createField({name:"orderQuery",xtype:"button",pressed:true,iconCls:"gridBarItemQuery",label:"GO",width:60,handler:goClick})
       	                  
       	                  ];
   

function goClick(){
   var dt={};

   for(var i=0;i< toolBars.length;i++){
   	   var o=toolBars[i];
  
   	   if(typeof o == "object"){
   	       if(o.getName && o.getValue){
   	       
   	          dt[o.getName()]=o.getValue();
   	          
   	       }
   	   }
   	}

   	if(dt["query_type"] == "0"){
   		dt["balcony_name"] = dt["query_text"];

   	}
   	if(dt["query_type"] == "1"){
   		dt["prearrange_name"] = dt["query_text"];

   	}
   	if(dt["query_type"] == "2"){
   		dt["prearrange_phone"] = dt["query_text"];

   	}
   	if(dt["query_type"] == "3"){
   		dt["can_order_time"] = dt["query_text"];

   	}
   	if(dt["query_type"] == "4"){
   		dt["order_time"] = dt["query_text"];

   	}
   	
    
   load("app_business_preorder_write_32",dt);
  // 	orderList.getStore().baseParams=dt;
 //  	orderList.getStore().load();
}



var orderList=createPageGrid({
       	   title: "�����б�(Ԥ����δ����״̬�Ķ���)",
       	   id:"app_business_preorder_write_32",
       	   urls:"/order/order_pages.do",
           split:true,
           page:true,
           height:200,
           width:500,
           filter:false,
           
           region:"west", 
       	   items:orderFields,
       	   
       	   toolBarFields:toolBars,
       	   rowclick:function(){
       	      var dt={};
       	      getCmp("app_business_preorder_write_1111").getForm().setValues(getSelectedData("app_business_preorder_write_32"));
       	      
       	      dt["order_id"]=getSelectedData("app_business_preorder_write_32")["order_id"];
       	      
       	      getCmp("app_business_preorder_write_2222").getStore().baseParams=dt;
       	      
       	      reload("app_business_preorder_write_2222");
       	      
       	   }
   });



return [orderList,{region:"center",bodyBorder:false,width:400,layout:"border",items:[orderForm,orderDetailList]}];