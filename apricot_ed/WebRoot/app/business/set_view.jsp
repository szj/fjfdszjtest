var setFields=[
  {label:"��λ��",name:"set_no",hide:"all",readOnly:true},
  {label:"¥��",name:"dining_floor",readOnly:true},
  {label:"����λ��",name:"belong_to_text",readOnly:true},
  {label:"��λ����",name:"balcony_name",readOnly:true},
  {label:"��λ״̬",name:"man_num",readOnly:true},
  {label:"�����������",name:"mincost_type",xtype:"combo",readOnly:true,code:"MINCOST_TYPE"},
  {label:"������ѽ��",name:"mincost_money",readOnly:true}
];
var staffFields=[
  {label:"Ա��ID",name:"staff_id",hidden:true,hide:true},
  {label:"Ա������",name:"staff_code"},
  {label:"Ա������",  name:"staff_type",xtype:"combo",code:"STAFF_TYPE"},
  {label:"Ա������",  name:"staff_name"}
];
//���Ա
 var prme=[
 {label:"����Ա",name:"staff_name",readOnly:true,xtype:"trigger",table:"staff_info",columns:staffFields}
 ];  
var orderFileds=[
  {label:"��λ��",name:"set_no",readOnly:true},
  {label:"¥��",name:"dining_floor",readOnly:true},
  {label:"��λ����",name:"balcony_name",readOnly:true},
  {label:"����λ��",name:"belong_to_text",readOnly:true},
  {label:"������",name:"order_no",readOnly:true},
  {label:"������",name:"order_id",hide:"all"},
  {label:"��������",name:"prearrange_name",readOnly:true},
  {label:"��ϵ�绰",name:"prearrange_phone"},
  {label:"Ԥ������",name:"prearrange_man_count"},
  {label:"��������",name:"man_count"},
  {label:"�Ƽ���",name:"introducer"},
  {label:"����ʱ��",name:"order_time",readOnly:true},
  {label:"VIP����",name:"vip_card_no",readOnly:true},
  {label:"����",name:"cum_point",readOnly:true}
];
var orderDetailFields=[
  {label:"��Ʒ����",name:"food_name",sortable:true},
  {label:"����",name:"food_count",width:50,sortable:true},
  {label:"��Ʒ��־",name:"food_action",width:60,sortable:true,code:"FOOD_ACTION"},
  {label:"�Ƿ��ϲ�",name:"serving_flag",width:60,sortable:true,code:"SERVING_FLAG"},
  {label:"��ǰ�۸�",name:"food_price",width:60,sortable:true},
  {label:"��ζ��ע",name:"food_memo",sortable:true},
  {label:"Ա������",name:"modify_staff_name",sortable:true}
];

var staffFields=[
  {label:"Ա��ID",name:"staff_id",hidden:true,hide:true},
  {label:"Ա������",name:"staff_code"},
  {label:"Ա������",  name:"staff_type",xtype:"combo",code:"STAFF_TYPE"},
  {label:"Ա������",  name:"staff_name"}
];
var orderPayFields=[
  {label:"�շ���",name:"fee_item",width:200},
  {label:"�շ�ֵ",name:"fee_value"}
];
//���Ա��
function createMer(urls){
	 var w=createFormWindow({cols:1,id:"app_business_order_pre_mer",
     label:"���Ա��",action:urls,items:prme,
     width:500,height:200
     });
  w.show();
  w.on("beforedestroy",function(){reload("app_business_set_view_order_detail");});
}
function createStore(bt){
var store = new Ext.data.JsonStore({
    url: toURL('/business/set.images.do')+"?belong_to="+bt,
    root: 'images',
    fields: ['name', 'url',"set_no","set_st","order_no","order_id","belong_to",'mincost_type','mincost_money','balcony_name','staff_id','staff_name'],
    autoLoad:true
});
return store;
}
var tpl = new Ext.XTemplate(
		'<tpl for=".">',
            '<div class="thumb-wrap" id="{name}" no="{set_no}" set_st="{set_st}">',
		    '<div class="thumb"><img src="{url}" title="{name}"></div>',
		    '<span class="x-editable">{name}</span></div>',
        '</tpl>',
        '<div class="x-clear"></div>'
	);

function dataViewClick(dv,i,el,e){
   var d={set_no:el.no};
   getCmp("app_business_set_view_order").getForm().reset();
   removeAll("app_business_set_view_order_detail");
   if(!(el.set_st=="set.busy")){ 
      return;
   } 
   
   doGet("/set/set_order_busy.do",d,function(data){
                                       load("app_business_set_view_order_detail",data);
                                       getCmp("app_business_set_view_order").getForm().setValues(data);
                                       
                                    });
}

/**
 * �ͻ����
 */
 function orderFood(da){
      var ods=new Array();
      var tit=new Array();
    
      for(var i=0;i< da.length;i++){
          var o=da[i].data;
          ods.push(o.order_id);
          //alert(urlEncode(o));
          tit.push("�������:");
          tit.push(o.order_no);
          tit.push("(��λ��:");
          tit.push(o.belong_to);
          tit.push(")");
          tit.push(";");
      }
      
      tit.pop();
      

      var items=createOrderFoodPanel(ods);
      
      var win=new Ext.Window({
          title   : "�ͻ����["+tit.join("")+"]",
          items   : items,
          width   : 700,
          height  : 500,

          layout  : "fit",
          frame   : true,
          border  :false,
          bodyBorder:false,
          modal   : true
      });
      
      win.addButton({text:"ȷ��",handler:function(){
      											doGet("/order/order_a.do",null,function(dt){
      											    var oo=items.getData();
                                                     doPostByXML("/order/customer_food.do",oo,function(e){
                                                         if(e.success=="true"){
                                                            $alt("�ͻ�������");
                                                            load("app_business_set_view_order_detail",da[0].data);
                                                            
                                                            createMer("/order/order_b.do?m="+dt["max"]+"&id="+oo.order_id.join(",")+"");
                                                            win.close(); 
                                                         }
                                                     });
                                                   });
                                                   }
      });
      win.addButton({text:"�ر�",handler:function(){win.close();}});
      win.show();
 }

 /**
  * �ͻ��߲�
  */
  function customerReminderFood(d){
	var foodlist_fields = [
			{
			label :"�˵���ϸID",
			name :"order_list_id",
			hide :"all"
		},
		{
			label :"��ƷID",
			name :"food_id",
			hide :"all"
		}, {
			label :"��Ʒ����",
			name :"food_name"
		}, {
			label :"��Ʒ����",
			name :"food_price",
			width :60
		}, {
			label :"�Ƿ��ϲ�",
			name :"serving_flag",
			width :60
		}, {
			label :"��Ʒ����",
			name :"food_num",
			width :60
		} ];
	
	

	// ��Ʒ��ϸ�б�
	var foodlist = cEditGrid( {
		title :"��Ʒ�б�",
		items :foodlist_fields,
		region :"center",
		id :"food_list_list",
		width :300,
		filter :false,
		region:"center",
		tbarDisable :true,
		check :true,
		rowselect:function(){},
		url   : "/order/food_list.do?order_id="+d.order_id,
		firstLoad:true
	});
	var win=new Ext.Window({
	   items    : [foodlist],
	   layout   : "border",
	   title    : "�ͻ��߲�:[������:"+d.order_no+"(��λ��:"+d.belong_to+")]",
	   width    : 400,
	   height   : 360,
	   modal    : true,
	   bodyBorder:false,
	   border   : false
	});
	
	
	win.addButton({
	   text     : "ȷ��",
	   handler  : function(){
	       var rd={};
	       rd["food_list"]=new Array();
	       
	       var a=getCmp("food_list_list").getStore().query("selected","true");
			
		   for(var i=0;i< a.length;i++){
				rd.food_list.push(a.item(i).data.order_list_id);
		   }
		   rd["order_list_id"]=rd.food_list.join(",");
		   
		   doPostByXML("/order/order_reminderfood.do",rd,function(e){
		       if(e.success=="true"){
		          $alt("�ͻ��߲˳ɹ�.");
		          load("app_business_set_view_order_detail",d);
		          win.destroy();
		       }
		   
		   });
	   
	   }
	});
	
	win.addButton({
	   text     : "�ر�",
	   handler  : function(){win.destroy();}
	});
	win.show();
  }
  
 /**
  * ���´�ӡ����
  */
  function customerReprintFood(d){
	var foodlist_fields = [
			{
			label :"�˵���ϸID",
			name :"order_list_id",
			hide :"all"
		},
		{
			label :"��ƷID",
			name :"food_id",
			hide :"all"
		}, {
			label :"��Ʒ����",
			name :"food_name"
		}, {
			label :"��Ʒ����",
			name :"food_price",
			width :60
		}, {
			label :"�Ƿ��ϲ�",
			name :"serving_flag",
			width :60
		}, {
			label :"��Ʒ����",
			name :"food_num",
			width :60
		} ];
	
	

	// ��Ʒ��ϸ�б�
	var foodlist = cEditGrid( {
		title :"��Ʒ�б�",
		items :foodlist_fields,
		region :"center",
		id :"food_list_list",
		width :300,
		filter :false,
		region:"center",
		tbarDisable :true,
		check :true,
		rowselect:function(){},
		url   : "/order/food_list.do?order_id="+d.order_id,
		firstLoad:true
	});
	var win=new Ext.Window({
	   items    : [foodlist],
	   layout   : "border",
	   title    : "���´�ӡ:[������:"+d.order_no+"(��λ��:"+d.belong_to+")]",
	   width    : 400,
	   height   : 360,
	   modal    : true,
	   bodyBorder:false,
	   border   : false
	});
	
	
	win.addButton({
	   text     : "ȷ��",
	   handler  : function(){
	       var rd={};
	       rd["food_list"]=new Array();
	       
	       var a=getCmp("food_list_list").getStore().query("selected","true");
			
		   for(var i=0;i< a.length;i++){
				rd.food_list.push(a.item(i).data.order_list_id);
		   }
		   rd["order_list_id"]=rd.food_list.join(",");
		   
		   doPostByXML("/order/order_reprintfood.do",rd,function(e){
		       if(e.success=="true"){
		          $alt("���´�ӡ��ʶ���óɹ���");
		          win.destroy();
		       }
		   
		   });
	   
	   }
	});
	
	win.addButton({
	   text     : "�ر�",
	   handler  : function(){win.destroy();}
	});
	win.show();
  }
  /**
  * ���´�ӡ�ͻ�����
  */
  function customerReprintCustomerFood(d){
		   doPost("/order/order_reprintcustomerfood.do",d,function(e){
		       if(e.success=="true"){
		          $alt("���´�ӡ�ͻ�����ʶ���óɹ���");
		       }
		   
		   });

  }
 /**
  * �ͻ��˲�
  */
  function customerCancelFood(d){
	var foodlist_fields = [
			{
			label :"�˵���ϸID",
			name :"order_list_id",
			hide :"all"
		},
		{
			label :"��ƷID",
			name :"food_id",
			hide :"all"
		}, {
			label :"��Ʒ����",
			name :"food_name"
		}, {
			label :"��Ʒ����",
			name :"food_price",
			width :60
		}, {
			label :"�Ƿ��ϲ�",
			name :"serving_flag",
			width :60
		}, {
			label :"��Ʒ����",
			name :"food_num",
			width :60
		} ];
	
	var foodForm=createFormPanel({
	    title   : "�˲�ԭ��",
	    items   : [{label:"�˲�����",name:"food_return_type",xtype:"combo",code:"FOOD_RETURN_TYPE"},{label:"�˲�ԭ��",name:"food_return_reseon"}],
	    region  : "north",
	    height  : 70,
	    id      : "customer_cancel_reson",
	    split   : false
	});	
	

	// ��Ʒ��ϸ�б�
	var foodlist = cEditGrid( {
		title :"��Ʒ�б�",
		items :foodlist_fields,
		region :"center",
		id :"food_list_list",
		width :300,
		filter :false,
		region:"center",
		tbarDisable :true,
		check :true,
		rowselect:function(){},
		url   : "/order/food_list.do?order_id="+d.order_id,
		firstLoad:true
	});
	var win=new Ext.Window({
	   items    : [foodForm,foodlist],
	   layout   : "border",
	   title    : "�ͻ��˲�:[������:"+d.order_no+"(��λ��:"+d.belong_to+")]",
	   width    : 400,
	   height   : 360,
	   modal    : true,
	   bodyBorder:false,
	   border   : false
	});
	
	
	win.addButton({
	   text     : "ȷ��",
	   handler  : function(){
	       var rd=Ext.apply(foodForm.getForm().getValues(),{});
	       rd["food_list"]=new Array();
	       
	       var a=getCmp("food_list_list").getStore().query("selected","true");
			
		   for(var i=0;i< a.length;i++){
				rd.food_list.push(a.item(i).data);
		   }
		   
		   doPostByXML("/order/customer_cancel_food.do",rd,function(e){
		       if(e.success=="true"){
		          $alt("�ͻ��˲˳ɹ�.");
		          load("app_business_set_view_order_detail",d);
		          win.destroy();
		       }
		   
		   });
	   
	   }
	});
	
	win.addButton({
	   text     : "�ر�",
	   handler  : function(){win.destroy();}
	});
	win.show();
  }
  
  /**
  * ����
  */
  function customerDisFood(d){
	var foodlist_fields = [
			{
			label :"�˵���ϸID",
			name :"order_list_id",
			hide :"all"
		},
		{
			label :"��ƷID",
			name :"food_id",
			hide :"all"
		}, {
			label :"��Ʒ����",
			name :"food_name"
		}, {
			label :"��Ʒ����",
			name :"food_price",
			width :60
		}, {
			label :"�Ƿ��ϲ�",
			name :"serving_flag_text",
			width :60
		}, {
			label :"��Ʒ����",
			name :"food_num",
			width :60
		} ];
	
	var foodForm=createFormPanel({
	    title   : "����ԭ��",
	    items   : [
	    	{label:"��Ȩ���ʺ�",name:"loginname",allowBlank:false,blankText:'�ʻ�����Ϊ��'},
	    	{label:"����",name:"password",allowBlank:false,blankText:"���벻��Ϊ��",inputType:"password"},
	    	{label:"ԭ��",name:"food_return_reseon",width:100}
	    ],
	    region  : "north",
	    height  : 90,
	    id      : "customer_cancel_reson",
	    split   : false
	});	

	// ��Ʒ��ϸ�б�
	var foodlist = cEditGrid( {
		title :"��Ʒ�б�",
		items :foodlist_fields,
		region :"center",
		id :"food_list_list",
		width :300,
		filter :false,
		region:"center",
		tbarDisable :true,
		check :true,
		url   : "/order/food_allList.do?order_id="+d.order_id,
		firstLoad:true
	});
	
	var win=new Ext.Window({
	   items    : [foodForm,foodlist],
	   layout   : "border",
	   title    : "����:[������:"+d.order_no+"(��λ��:"+d.belong_to+")]",
	   width    : 400,
	   height   : 360,
	   modal    : true,
	   bodyBorder:false,
	   border   : false
	});
	
	
	win.addButton({
	   text     : "ȷ��",
	   handler  : function(){
	       var rd=Ext.apply(foodForm.getForm().getValues(),{});
	       rd["food_list"]=new Array();
	       
	       var a=getCmp("food_list_list").getStore().query("selected","true");
			
		   for(var i=0;i< a.length;i++){
				rd.food_list.push(a.item(i).data);
		   }
		   
		   doPostByXML("/order/customer_dis_food.do",rd,function(e){
		       if(e.success=="true"){
		          $alt("����ɹ�.");
		          load("app_business_set_view_order_detail",d);
		          win.destroy();
		       }
		   
		   });
	   
	   }
	});
	
	win.addButton({
	   text     : "�ر�",
	   handler  : function(){win.destroy();}
	});
	win.show();
  }
 
 
 /**
  * �ͻ��˲�
  */
  function customerUploadFood(d){
	var foodlist_fields = [
			{
			label :"�˵���ϸID",
			name :"order_list_id",
			hide :"all"
		},
		{
			label :"��ƷID",
			name :"food_id",
			hide :"all"
		}, {
			label :"��Ʒ����",
			name :"food_name"
		}, {
			label :"��Ʒ����",
			name :"food_price",
			width :60
		}, {
			label :"��Ʒ����",
			name :"food_num",
			width :70
		} ];
	
	// ��Ʒ��ϸ�б�
	var foodlist = cEditGrid( {
		title :"��Ʒ�б�",
		items :foodlist_fields,
		region :"center",
		id :"food_list_list",
		width :300,
		filter :false,
		region:"center",
		tbarDisable :true,
		check :true,
		rowselect:function(){},
		url   : "/order/food_list.do?order_id="+d.order_id,
		firstLoad:true
	});
	
	var win=new Ext.Window({
	   items    : [foodlist],
	   layout   : "border",
	   title    : "�����ϲ�:[������:"+d.order_no+"(��λ��:"+d.belong_to+")]",
	   width    : 400,
	   height   : 360,
	   modal    : true,
	   bodyBorder:false,
	   border   : false
	});
	
	
	win.addButton({
	   text     : "ȷ��",
	   handler  : function(){
	       var rd={food_list:new Array()};
	       
	       var a=getCmp("food_list_list").getStore().query("selected","true");
			
		   for(var i=0;i< a.length;i++){
				rd.food_list.push(a.item(i).data);
		   }
		   
		   doPostByXML("/order/customer_upload_food.do",rd,function(e){
		       if(e.success=="true"){
		          $alt("�����ϲ˳ɹ�.");
		          load("app_business_set_view_order_detail",d);
		       }
		   
		   });
	   
	   }
	});
	
	win.addButton({
	   text     : "�ر�",
	   handler  : function(){win.destroy();}
	});
	win.show();
  }
 
 /**
  * �ͻ�Ԥ��
  */
  
 function customerOrder(d,dv){
   doSyncRequest("/order/customer_order.do",{set_no:d.set_no},function(e){
       if(e.success=="true"){
           $alt("�ͻ��µ��ɹ�.");
           dv.reload();
       }else $alt("�ͻ��µ�ʧ��.");
       
   });
   

   
 } 
 
 var customerOrder1=function(d,dv){
     var ds=dv.getSelectedRecords();
     var arr=new Array();
     for(var i=0;i< ds.length;i++){
       arr.push(ds[i].data.set_no);
     }
     d["set_no"]=arr.join(",");
 	 if(d.mincost_type==1)
 	 {
 	 	d.mincost_type="�˾�";
 	 }
 	 else if(d.mincost_type==2)
 	 {
 	 	d.mincost_type="�ܽ��";
 	 }
 	 else
 	 {
 	 	d.mincost_type="��";
 	 }
��  var customerOrderField12=[
      
  ��	  {label:"��������",name:"prearrange_name",id:"prearrange_name_op"},
       {label:"��ϵ�绰",name:"prearrange_phone",id:"prearrange_phone_op",listeners:{"blur":function(){
      	doGet("/vip/vip_member_selectPhone.do?custPhone="+getValue("prearrange_phone_op"),null,function(date){
      	var vipNO=Ext.getCmp("vip_card_no_op");
      	var cumPoint=Ext.getCmp("cum_point_op");
      	var userName=Ext.getCmp("prearrange_name_op");
      	if(date["vip_no"] == NaN)
      	{
      	}
      	else
      	{
      		vipNO.setValue(date["vip_no"]);
      		cumPoint.setValue(date["cum_point"]);
      		userName.setValue(date["cust_name"]);
      	}
      	})
      }}},
       {label:"VIP����",name:"vip_card_no",id:"vip_card_no_op",listeners:{"blur":function(){
       	doGet("/vip/vip_member_selectVipCard.do?custVipNo="+getValue("vip_card_no_op"),null,function(date){
       	var phone=Ext.getCmp("prearrange_phone_op");
      	var cumPoint=Ext.getCmp("cum_point_op");
      	var userName=Ext.getCmp("prearrange_name_op");
      	if(date["cust_phone"] == NaN)
      	{
      	}
      	else
      	{
      		phone.setValue(date["cust_phone"]);
      		cumPoint.setValue(date["cum_point"]);
      		userName.setValue(date["cust_name"]);
      	}
       	})
       }}},
       {label:"����",name:"cum_point",id:"cum_point_op",readOnly:true},
  ��     {label:"�����˵�ַ",name:"prearrange_addr",hide:"all"},
      {label:"������",name:"staff_id",hide:"all"},
     ��     {label:"������",name:"staff_name",readOnly:true,xtype:"trigger",table:"staff_info",columns:staffFields},
      {label:"�Ƽ���",name:"introducer"},
      {label:"�µ�ʱ��",name:"operate_order_time",width:160,readOnly:true,value:new Date().dateFormat("Y-m-d H:i:s")},
      {label:"�µ���λ",name:"set_no",value:d.set_no,hide:"form"},
      {label:"��λ����",name:"balcony_name",value:d.balcony_name,readOnly:true},
      {label:"����״̬",name:"order_status",hide:"form",xtype:"combo",code:"ORDER_STATUS"},
      {label:"��������",name:"man_count",allowBlank:false},
      {label:"�߲˴���",name:"hurry_times",value:"0",hide:"form"},
      {label:"�����������",name:"mincost_type_text",xtype:"combo",value:d.mincost_type,code:"MINCOST_TYPE",readOnly:true},
      {label:"������ѽ��",name:"mincost_money",value:d.mincost_money,readOnly:true},
      {label:"���������ϲ�",name:"print_starttime",value:0}
   ];

  var w=createFormWindow({cols:2,id:"app_business_order_customer_order11",
     label:"�ͻ��µ�",action:"/order/customer_order.do",items:customerOrderField12,
     width:720,height:320,data:d

     });
  w.show();
  w.on("beforedestroy",function(){dv.reload();});
   
};

 var customerEdit1=function(d,dv){
	 var ddd = getCmp("app_business_set_view_order").getForm().getValues();
��  var customerOrderField13=[
      {label:"������",name:"order_id",hide:"all",value:ddd.order_id},
      {label:"������",name:"order_no",value:ddd.order_id},
      {label:"�ͻ�����",name:"prearrange_name",id:"prearrange_name_ed",value:ddd.prearrange_name,readOnly:true},
      {label:"��ϵ�绰",name:"prearrange_phone",value:ddd.prearrange_phone,id:"prearrange_phone",allowBlank:false,listeners:{"blur":function(){
      	doGet("/vip/vip_member_selectPhone.do?custPhone="+getValue("prearrange_phone"),null,function(date){
      	var vipNO=Ext.getCmp("vip_card_no_ed");
      	var cumPoint=Ext.getCmp("cum_point_ed");
      	var userName=Ext.getCmp("prearrange_name_ed");
      	if(date["vip_no"] == NaN)
      	{
      	}
      	else
      	{
      		vipNO.setValue(date["vip_no"]);
      		cumPoint.setValue(date["cum_point"]);
      		userName.setValue(date["cust_name"]);
      	}
      	})
      }}},
       {label:"VIP����",name:"vip_card_no",value:ddd.vip_card_no,id:"vip_card_no_ed",listeners:{"blur":function(){
       	doGet("/vip/vip_member_selectVipCard.do?custVipNo="+getValue("vip_card_no_ed"),null,function(date){
       	var phone=Ext.getCmp("prearrange_phone");
      	var cumPoint=Ext.getCmp("cum_point_ed");
      	var userName=Ext.getCmp("prearrange_name_ed");
      	if(date["cust_phone"] == NaN)
      	{
      	}
      	else
      	{
      		phone.setValue(date["cust_phone"]);
      		cumPoint.setValue(date["cum_point"]);
      		userName.setValue(date["cust_name"]);
      	}
       	})
       }}},
       {label:"����",name:"cum_point",value:ddd.cum_point,id:"cum_point_ed",readOnly:true},
     ��{label:"�����˵�ַ",name:"prearrange_addr",hide:"all"},
      {label:"����������",name:"staff_id",hide:"all"},
     ��{label:"����������",name:"staff_name",readOnly:true,xtype:"trigger",table:"staff_info",columns:staffFields},
      {label:"�Ƽ���",name:"introducer",value:ddd.introducer},
      {label:"�µ�ʱ��",name:"operate_order_time",width:160,readOnly:true,value:ddd.order_time},
      {label:"�µ���λ",name:"set_no",value:d.set_no,hide:"form"},
      {label:"����״̬",name:"order_status",hide:"form",xtype:"combo",code:"ORDER_STATUS"},
      {label:"��������",name:"man_count",value:ddd.man_count,allowBlank:false},
      {label:"�߲˴���",name:"hurry_times",value:"0",hide:"form"},
      {label:"Ԥ����λ",name:"balcony_name",value:ddd.balcony_name,xtype:"trigger",tableURL:"/shop/free_set2.do",getData:function() {return {P_time:new Date().dateFormat("Y-m-d H:i:s")};},columns:setFields},
      {label:"�����������",name:"mincost_type",value:d.mincost_type,xtype:"combo",code:"MINCOST_TYPE",readOnly:true},
      {label:"������ѽ��",name:"mincost_money",value:d.mincost_money,readOnly:true}
  
   ];

  var w=createFormWindow({cols:2,id:"app_business_order_customer_order1111",
     label:"�޸Ķ���",action:"/order/customer_edit.do",items:customerOrderField13,
     width:720,height:320,data:d

     });
  w.show();
  w.on("beforedestroy",function(){dv.reload();});
   
};

 /**
  * �ͻ�Ԥ��������
  */
 

 function customerOpenPreOrder(d,dv){
    var gridCols=[
       {label:"������",name:"order_no",width:150},
       {label:"��λ��",name:"set_no",hide:"all"},
       {label:"��λ��",name:"order_id",hide:"all"},
       {label:"Ԥ��ʱ��",name:"prearrange_order_time"},
       {label:"����״̬",name:"order_status_text"},
       {label:"��������",name:"prearrange_name"},
       {label:"��ϵ�绰",name:"prearrange_phone"},
       {label:"VIP����",name:"vip_card_no"}
       
    ]; 
    
    var toolBar=["��ѯ����","&nbsp;","-"];
    
    toolBar.push("VIP��")
    toolBar.push(createField({name:"vip_card_no",emptyText:"����VIP���Ų�ѯ",width:100}));
    toolBar.push("&nbsp;"); 
    toolBar.push("����")
    toolBar.push(createField({name:"prearrange_name",emptyText:"����Ԥ����������ѯ",width:80}));  
    toolBar.push("&nbsp;"); 
    toolBar.push("�绰")
    toolBar.push(createField({name:"prearrange_phone",emptyText:"����Ԥ������ϵ�绰��ѯ",width:80})); 
    toolBar.push("&nbsp;"); 
    toolBar.push(createField({name:"orderQuery",xtype:"button",pressed:true,iconCls:"gridBarItemQuery",label:"GO",width:60,handler:goClick})) ;
    
    function goClick(){
       var dt={};
    
       for(var i=0;i< toolBar.length;i++){
       	   var o=toolBar[i];
      
       	   if(typeof o == "object"){
       	       if(o.getName && o.getValue){
       	          
       	          dt[o.getName()]=o.getValue();
       	       }
       	   }
       	}
        
        load("preorder_open_grid",dt);
    } ;
    var grid=createPageGrid({
      id       : "preorder_open_grid",
      title    : "Ԥ�����б�",
      items    : gridCols,
      region   : "center",
      urls     : "/order/get_preorder.do?set_no="+d.set_no,
      filter   : false,
      tbar     : toolBar
   });
   
    
   var win=new Ext.Window({
      title     : "�ͻ�����",
      items     : [grid],
      height    : 400,
      width     : 600,
      layout    : "border",
      bodyBorder: false,
      border    : false,
      buttons   : [{text:"ȷ��",handler:openOrder},{text:"�ر�",handler:function(){win.destroy();}}]
   });
   
  function openOrder(){
      var d=getSelectedData("preorder_open_grid");
      if(!d || !d.order_id){
          $alt("��ѡ��һ��Ԥ������������");
          return;
      }
      doSyncRequest("/order/customer_open.do",d,function(e){
       if(e.success=="true"){
           $alt("�ͻ������ɹ�.");
           dv.reload();
           win.destroy();
       }else $alt("�ͻ�����ʧ��.");
       
   });
   }
   
   win.show();
 } 

/**
 * �ͻ�����
 */
function customerPay(d,dv){
   var dts = [d.order_no,d.mincost_money,d.mincost_type,d.man_count,d.cum_point];
   var w=cCalculatePanel(dts,function(){dv.reload();});
   w.show(dv);
} 

/**
 * �����ϲ�
 */
 function unionOrder(dv){
    var d=dv.getSelectedRecords();

    if(!d.length || d.length<2){
       $alt("��ѡ�������������ϵĶ��������кϲ�.");
       return;
    }
    
    var arr=new Array();
    for(var i=0;i< d.length;i++){
       var dd=d[i].data;
       if(dd.set_st!="set.busy"){
          $alt(dd.name+"û�����ò�,���ܽ��ж����ϲ�.");
          return;
       }
       
       arr.push({order_id:dd.order_id});
    }
    
    doPost("/order/order_union.do",arr,function(){dv.reload();});
 }
 
  function splitOrder(dv){
    var d=dv.getSelectedRecords();

    if(!d.length || d.length<2){
       $alt("��ѡ������һ���������в��.");
       return;
    }
    
    var arr=new Array();
    for(var i=0;i<d.length;i++){
       var dd=d[i].data;
       if(dd.set_st!="set.busy"){
          $alt(dd.name+"û�����ò�,���ܽ��ж������.");
          return;
       }
       
       arr.push({order_id:dd.order_id});
    }
    
    doPost("/order/order_split.do",arr,function(){dv.reload();});
 }


 function DataViewContextMenu(ev,i,el,e){
 	var o=ev;
    var d=o.getSelectedRecords();
    var da=d;
    if(da.length>0) d=copyProps({},da[0].data);
    else return;
    //

    if(!o.contentMenu && o.contentMenu!=null){ o.contentMenu.destroy();o.contentMenu=null;}
       	      
     	      
    var mm=new Ext.menu.Menu({id:o.id+"_ctx_menu",shadow:false});
       	      
    mm.add({text:"�ͻ��µ�",handler:function(){customerOrder1(d,ev);},icon:"",disabled:"set.free"!=d.set_st});
    mm.add({text:"�ͻ�����",handler:function(){customerOpenPreOrder(d,ev);},icon:"",disabled:"set.pre"!=d.set_st});
    mm.add("-");
    mm.add({text:"�����޸�",handler:function(){customerEdit1(d,ev);},icon:"",disabled:"set.busy"!=d.set_st});
    mm.add({text:"�����ϲ�",handler:function(){unionOrder(ev);},icon:"",disabled:"set.busy"!=d.set_st});
    mm.add({text:"�������",handler:function(){splitOrder(ev);},icon:"",disabled:"set.busy"!=d.set_st});
    mm.add("-");
    mm.add({text:"�ͻ����",handler:function(){orderFood(da);},icon:"",disabled:"set.busy"!=d.set_st});
    mm.add({text:"�ͻ��˲�",handler:function(){customerCancelFood(d);},icon:"",disabled:"set.busy"!=d.set_st});
    mm.add({text:"�ͻ��߲�",handler:function(){customerReminderFood(d);},icon:"",disabled:"set.busy"!=d.set_st});
     mm.add({text:"��Ʒ�ش�",handler:function(){customerReprintFood(d);},icon:"",disabled:"set.busy"!=d.set_st});
    mm.add({text:"�����ϲ�",handler:function(){customerUploadFood(d);},icon:"",disabled:"set.busy"!=d.set_st});
    mm.add({text:"�ش�ͻ���",handler:function(){customerReprintCustomerFood(d);},icon:"",disabled:"set.busy"!=d.set_st});
    mm.add({text:"����",handler:function(){customerDisFood(d);},icon:"",disabled:"set.busy"!=d.set_st});
    mm.add("-");
    mm.add({text:"�ͻ�����",handler:function(){customerPay(d,ev);},icon:"",disabled:"set.busy"!=d.set_st});
    mm.showAt(e.getPoint());
    o.contentMenu=mm;
 }
 
 


 var dating={
	   title: "����",
	   style:"background-color:red",
	   layout      : "fit",
	  
       items:new Ext.DataView({

            id          : "app_business_set_view_dating",
            store       : createStore("01"),
            tpl         : tpl,
            split       : true,
            style       : "overflow:auto",
            multiSelect : true,
            width       : 500,
            itemSelector: 'div.thumb-wrap',
            overClass   : 'x-view-over',
            layout      : "fit",
            listeners   : {
            	"click":{fn:dataViewClick,scope:this},
            	"contextmenu" :{fn:DataViewContextMenu,scope:this}
            	}
        })};
 
  

 var baoxiang={
	   title: "����",
	   style:"background-color:red",
	   layout      : "fit",
       items:new Ext.DataView({

            id          : "app_business_set_view_baoxiang",
            store       : createStore("02"),
            tpl         : tpl,
            split       : true,
            style       : "overflow:auto",
            multiSelect : true,
            width       : 500,
            itemSelector: 'div.thumb-wrap',
            overClass   : 'x-view-over',
            layout      : "fit",
            listeners   : {
            "click":{fn:dataViewClick,scope:this},
            "contextmenu" :{fn:DataViewContextMenu,scope:this}
            }
        })}; 

var setView=new Ext.TabPanel({
	    id   : "app_business_set_view_view_1",
        title:"������λ����ͼ",
        region:"center",
        resizeTabs:true,
        activeTab:0,
        
        layoutOnTabChange:true,
        width : 500,
        items:[dating,baoxiang]
   });

var orderForm=createFormPanel({
       
       id        : "app_business_set_view_order",
       cols      : 1,
       region    : "north",
       height    : 240,
       labelWidth : 60,
       width     : 200,
       items     : orderFileds
   });
   
var orderDetailForm=createPageGrid({
       title      : "������ϸ",
       id         : "app_business_set_view_order_detail",
       urls       : "/order/order_list.do",
       firstLoad  : false,
       region     : "center",
       height     : 200,
       tools:[{id:"minimize"},{id:"maximize"}],
       width      : 200,
       filter     : false,
       items      : orderDetailFields
   });
/**
var orderPayForm=createPageGrid({
       title     : "�շ���ϸ",
       id        : "app_bs_order_pay",
       urls      : "/order/order_list.do",
       firstLoad : false,
       region    : "south",
       height    : 200,
       width     : 200,
       filter    : false,
       split     : true,
       items     : orderPayFields,
       minSize   : 200
   }); 
**/
var detailView={ 
   region        : "east",
   split         : true,
   bodyBorder    : false,
    collapsible:true,
    title:"������Ϣ",
   width         : 480,
   layout        : "border",
   items         : [orderForm,orderDetailForm]
};


return [setView,detailView];