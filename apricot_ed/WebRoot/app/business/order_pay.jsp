//�����б���
var orderFields=[
      {label:"������",name:"order_no",hide:"form",width:140},
      {label:"������",name:"order_id",hide:"all"},
      {label:"��λ���",name:"set_no"},
      {label:"��λ����",name:"balcony_name",width:80},
      {label:"Ԥ����¼��",name:"record_staff_id",hide:"all"},
      {label:"Ԥ����¼��",name:"staff_name"},
      {label:"��������",name:"order_type",hide:"form",xtype:"combo",code:"ORDER_TYPE"},
      {label:"Ԥ������",name:"prearrange_man_count"},
      {label:"��������",name:"man_count"},
      {label:"�����������",name:"mincost_type",xtype:"combo",code:"MINCOST_TYPE"},
      {label:"�����������",name:"mincost_type"},
      {label:"������ѽ��",name:"mincost_money"},
      {label:"����ʱ��",name:"order_time",xtype:"datetime",width:160},
      {label:"����״̬",name:"order_status",hide:"form",xtype:"combo",code:"ORDER_STATUS"},
//      {label:"�ۿ�",name:"order_discount",hide:"grid"},
//      {label:"�ۿ�ԭ��",name:"order_discount_reseon",hide:"grid"},
//      {label:"�Ƿ��Ѿ��÷�Ʊ",name:"has_invoice",xtype:"combo",code:"IS_OR_NOT",hide:"all"},
      {label:"��������",name:"prearrange_name"},
      {label:"��ϵ�绰",name:"prearrange_phone"},
      {label:"VIP����",name:"vip_card_no"},
      {label:"�ܻ���",name:"cum_point"},
      {label:"�߲˴���",name:"hurry_times",value:"0",hide:"form"},
      {label:"�����˵�ַ",name:"prearrange_addr"}
   ];
 
var orderList=createPageGrid({
       	   title: "�����б�",
       	   id:"app_business_order_pay",
       	   urls:"/order/order_getonorder.do",
           region:"center",
           firstLoad:false,
           filter:false,
       	   items:orderFields,
       	   toolBarFields:[
       	      "��ѯ����","&nbsp;","-","&nbsp;",
       	      {xtype:"trigger",width:300,triggerClass:"x-form-search-trigger",
       	       emptyText:"���뿨�Ż�绰��ѯ",
       	       onTriggerClick:function(e){
       	          load("app_business_order_pay",{keyword:this.getValue()});
       	       }
       	       
       	       },
//       	       "&nbsp",
//       	       {type:"button",pressed:true,text:"����Ⱥ����",iconCls:"gridBarItemPay",
//       	        handler:function(e){
       	             
//       	             var dt=getData("app_business_order_pay",["order_no"]);
//       	             if(!dt.order_no){
//      	                $alt("ѡ��һ�������Ž��н���!");
//       	                return;
//       	             }
//       	             if(dt.order_status=="0"){
//                     var w=cCalculatePanel(dt.order_no,cLoadEvent("app_business_order_pay"));
//                     w.show(this);
//                     }else bookPay(dt.order_no);
//       	          }
//       	       },
       	       "&nbsp",
       	       {type:"button",pressed:true,text:"��������",iconCls:"gridBarItemPay",
       	        handler:function(e){
       	             var dt=getData("app_business_order_pay",["order_no","order_status"]);
       	             if(!dt.order_no){
       	                $alt("ѡ��һ�������Ž��н���!");
       	                return;
       	             }
       	             if(dt.order_status=="0"){
					    var dd=getData("app_business_order_pay");
					    var dts = [getData("app_business_order_pay",["order_no"]).order_no,getData("app_business_order_pay",["mincost_money"]).mincost_money,getData("app_business_order_pay",["mincost_type"]).mincost_type,getData("app_business_order_pay",["man_count"]).man_count,getData("app_business_order_pay",["cum_point"]).cum_point,getData("app_business_order_pay",["order_type"]).order_type];
					    var w=cCalculatePanel(dts,cLoadEvent("app_business_order_pay"));
					    w.show(this);
                     }
       	          }
       	       }
       	   ]
   });
 

function bookPay(orderno){
    var orderFields1=[
        {label:"������",name:"pay_id",hide:"form"},
        {label:"������",name:"order_no",readOnly:true},
        {label:"�ͻ�����",name:"book_man",readOnly:true},
        {label:"��ϵ�绰",name:"book_phone",readOnly:true},
        {label:"Ӧ�ս��",name:"pay_total",readOnly:true},
        {label:"ʵ�ս��",name:"fact_pay_total"},
        {label:"����11",name:"return_total",readOnly:true}
    ];
    
   	  var basic=new Ext.FormPanel({
        labelAlign  : 'left',
        frame       : true,
        title       : "�ͻ�����",
        style   : 'padding:2px',
        region      : "center",
        defaultType : 'textfield',
        defaults    : {xtype:'textfield',anchor:'95%'},
        items       : orderFields1  	
	  	});
	 
	 
	 
	 doGet("/order/getBookBillInfo.do",{order_no:orderno},function(d){
	    basic.form.setValues(d);
	 })
	 

     var pay=false;
	  	
	 var w=new Ext.Window({
	     items : [basic],
	     width : 640,
	     height: 480,
	     layout:"border",
	     bodyBorder:false,
	     border:false,
	     
	     plugins: new function(){
          this.init = function(win){
             win.on('deactivate', function(){
                    var i=1;
                    this.manager.each(function(){i++});
                    this.setZIndex(this.manager.zseed + (i*10));
                })
           }
       }
	 });
	 
	 w.addButton({text:"���",handler:function(){
	     pay=false;
	     var o=basic.form.getValues();
	     
	     var fp=parseInt(o.fact_pay_total);
	     
	     if(!fp||fp==NaN){
	        $alt("����ʵ�ս���������������������͵ġ�")
	        return;
	     }
	     
	     o["return_total"]=parseInt(o.fact_pay_total)-parseInt(o.pay_total);
	     
	     if(o.return_total<0){
	        $alt("��������ȷ�����룡");
	        return ;
	     }
	     
	     pay=true;
	 }});
	 w.addButton({text:"����",handler:function(){
	     if(!pay){
	        $alt("�����������������������ȷ�ϣ�");
	        return;
	     }
	     doPost("/order/pay_book_order.do",basic.form.getValues());
	 }});
	 w.addButton({text:"�ر�",handler:function(){window.destroy();}});
	 w.show();
    
}


return [orderList];