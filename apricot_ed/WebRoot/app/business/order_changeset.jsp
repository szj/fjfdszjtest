//�����б���
var orderFields=[
      {label:"������",name:"order_no",hide:"form",width:200},
      {label:"������",name:"order_id",hide:"all"},
      {label:"��λ���",name:"set_no"},
      {label:"����Ա",name:"service_staff_id",hide:"all"},
      {label:"����Ա",name:"staff_name"},
      {label:"��������",name:"order_type",hide:"form",xtype:"combo",code:"ORDER_TYPE"},
      {label:"��������",name:"man_count"},
      {label:"����ʱ��",name:"order_time",xtype:"datetime",width:160},
      {label:"����״̬",name:"order_status",hide:"form",xtype:"combo",code:"ORDER_STATUS"},
      {label:"�ۿ�",name:"order_discount",hide:"grid"},
      {label:"�ۿ�ԭ��",name:"order_discount_reseon",hide:"grid"},
      {label:"�Ƿ��Ѿ��÷�Ʊ",name:"has_invoice",xtype:"combo",code:"IS_OR_NOT",hide:"all"},
      {label:"Ԥ��������",name:"prearrange_name"},
      {label:"Ԥ���˵绰����",name:"prearrange_phone"},
      {label:"Ԥ������",name:"prearrange_man_count"},
      {label:"Ԥ��VIP����",name:"vip_card_no"},
      {label:"�߲˴���",name:"hurry_times",value:"0",hide:"form"},
      {label:"�����˵�ַ",name:"prearrange_addr"}
   ];
 
var orderList=createPageGrid({
       	   title: "�����б�",
       	   id:"app_business_order_changeset",
       	   urls:"/order/order_getonorder.do",
           region:"center",
           firstLoad:false,
           filter:false,
       	   items:orderFields,
       	   toolBarFields:[
       	      "��ѯ����","&nbsp;","-","&nbsp;",
       	      {xtype:"trigger",width:300,triggerClass:"x-form-search-trigger",
       	       emptyText:"������λ�Ų�ѯ...",
       	       onTriggerClick:function(e){
       	          load("app_business_order_changeset",{set_no:this.getValue()});
       	       }
       	       
       	       },
       	       "&nbsp",
       	       {type:"button",pressed:true,text:"���뻻̨",iconCls:"gridBarItemPay",
       	        handler:function(e){
       	             var dt=getData("app_business_order_changeset",["order_id"]);
       	             if(!dt.order_id){
       	               $alt("��ѡ��һ����������ת̨!");
       	               return;
       	             }
       	             changeSetEvent(this,function(){reload("app_business_order_changeset");},dt);
       	          }
       	       }]
   });
   
 function changeSetEvent(o,f,order){
    var grid=createPageGrid({
       id:"app_business_order_changeset_grid",
       region:"center",
       urls:"/shop/set_freelist.do",
       filter:false,
       items:[
    	 {label:"��λ���",name:"set_no",hide:true},
    	 {label:"¥��",name:"dining_floor",allowBlank:false,sortable:true},
    	 {label:"�������",name:"balcony_code",allowBlank:false},
    	 {label:"����λ��",name:"belong_to",xtype:"combo",code:"BELONG_TO"},
    	 {label:"��������",name:"balcony_name"},
    	 {label:"��λ�����������",name:"set_max"},
    	 {label:"Ԥ����ʽ",name:"pre_order_style",xtype:"combo",code:"PRE_ORDER_STYLE"},
    	 {label:"��λ״̬",name:"set_status",code:"STATUS",xtype:"combo"}
       ],
       toolBarFields:["��ѯ����","&nbsp;","-","&nbsp;",
         {xtype:"trigger",name:"keyword",width:300,triggerClass:"x-form-search-trigger",
          emptyText:"��������λ�Ų�ѯ��ǰ���е���λ(ͨ�����ŷֿ�)...",
          onTriggerClick:function(e){
             load("app_business_order_changeset_grid",{set_no:this.getValue()});
          }
         }
       ]
    });
    
    grid.addButton(createField({
       name:"changeSetBtn",
       text:"����",
       type:"button",
       width:60,
       handler:function(e){
          var dt=getData("app_business_order_changeset_grid",["set_no"]);
          Ext.apply(dt,order);
          doPost("/order/order_changeset.do",dt);
          getCmp("changeSetWindow").destroy();
       }
    }));
    
    grid.addButton(createField({
       text:"�ر�",
       width:60,
       handler:function(){getCmp("changeSetWindow").destroy();}
    }))
    
    var v=new Ext.Window({
            id:"changeSetWindow",
            title    : "ѡ����λ",
            closable : true,
            width    : 400,
            height   : 300,
            layout   : 'border',
            hideBorders:true,
            bodyStyle: "padding:5px",
            modal    : true,
            items    : [grid]
    });
    
    v.show(o);
    v.on("beforedestroy",f);
 } 
 

return [orderList];