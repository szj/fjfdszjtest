//�����б���
var orderFields=[
      {label:"������",name:"order_no",hide:"form",width:140},
      {label:"������",name:"order_id",hide:"all"},
      {label:"��λ���",name:"set_no",width:80},
      {label:"��λ����",name:"balcony_name",width:80},
      {label:"����Ա",name:"service_staff_id",hide:"all"},
//      {label:"����Ա",name:"staff_name"},
      {label:"��������",name:"order_type",hide:"form",xtype:"combo",code:"ORDER_TYPE"},
      {label:"Ԥ������",name:"prearrange_man_count"},
      {label:"��������",name:"man_count"},
      {label:"����ʱ��",name:"order_time",xtype:"datetime",width:160},
      {label:"����״̬",name:"order_status",hide:"form",xtype:"combo",code:"ORDER_STATUS"},
//      {label:"�ۿ�",name:"order_discount",hide:"grid"},
//      {label:"�ۿ�ԭ��",name:"order_discount_reseon",hide:"grid"},
//      {label:"�Ƿ��Ѿ��÷�Ʊ",name:"has_invoice",xtype:"combo",code:"IS_OR_NOT",hide:"all"},
      {label:"��������",name:"prearrange_name"},
      {label:"��ϵ�绰",name:"prearrange_phone"},
      {label:"VIP����",name:"vip_card_no"},
      {label:"�߲˴���",name:"hurry_times",value:"0",hide:"form"},
      {label:"�����˵�ַ",name:"prearrange_addr"}
   ];

var orderList=createPageGrid({
       	   title: "�����б�",
       	   id:"app_business_order_union_3",
       	   urls:"/order/order_getonorder.do",
           region:"center",
           firstLoad:false,
           filter:false,
       	   items:orderFields,
       	   checkbox:true,
       	   toolBarFields:[
       	      "��ѯ����","&nbsp;","-","&nbsp;",
       	      {xtype:"trigger",width:300,triggerClass:"x-form-search-trigger",
       	       emptyText:"�����λ��Ų�ѯ(����,����)...",
       	       onTriggerClick:function(e){
       	          load("app_business_order_union_3",{set_no:this.getValue()});
       	       }
       	       
       	       },
       	       "&nbsp",
       	       {xtype:"tbbutton",pressed:true,text:"�ϲ�����",iconCls:"gridBarItemUnion",
       	        handler:function(e){
       	             var dt=getDataArray("app_business_order_union_3",["order_id"]);
       	             if(dt.length>1){
       	                $alt("����ѡ��2�Ŷ����ϲ�.");
       	             }
       	             doPost("/order/order_union.do",dt,function(e){reload("app_business_order_union_3")});
       	          }
       	       }
       	   ]
   });


return [orderList];