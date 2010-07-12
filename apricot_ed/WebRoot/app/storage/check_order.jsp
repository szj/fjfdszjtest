var buyOrderListFields=[
      {label:"�ɹ�����",name:"buy_no",width:180,readOnly:true},
      {label:"�ɹ�����",name:"buy_date",xtype:"date",format:"Ymd"},
      {label:"�����¼ID",name:"buy_id",hide:"all"},
      {label:"�ɹ�Ա",name:"staff_name",hide:"form"},
//      {label:"�ܽ��",name:"total_money"},
      {label:"���ز���",name:"dept_name",readOnly:true},
//      {label:"��˲���",name:"buy_state",hide:"grid",xtype:"combo",allowBlank:false,data:[["1","δͨ��,�˻�"],["6","ͨ����ִ�вɹ�"]]},
      {label:"����",name:"record_desc",xtype:"textarea"}
   ];

var buyOrderDetailFields=[
      {label:"�����¼ID",name:"buy_id",hide:"all"},
      {label:"ԭ����ID",name:"mat_id",hide:"all"},
      {label:"ԭ��������",name:"mat_name"},
//      {label:"Ԥ�Ʋɹ�����",name:"pre_buy_num"},
      {label:"ʵ�ʲɹ�����",name:"buy_num"},
//      {label:"Ԥ�Ʋɹ�����",name:"pre_buy_price"},
      {label:"ʵ�ʲɹ�����",name:"buy_price"},
      {label:"��ϸID",name:"detail_id",hide:"all"}
   ];
   
   
 function getBuyOrderTbar(){
     return [
        {text:"�ɹ������",iconCls:"gridItemEdit",
         handler:function(){
            cTabEditWindow({
               label : "�ɹ������",
               width : 400,
               height: 300,
               id    : "app_sg_check_order1",
               items : buyOrderListFields,
               action: "/buy/order/apply5.do",
               load  : true,
               close : function(){load("app_sg_check_order2",{});},
               data  : {buy_state:"",record_desc:""},
               check : function(){return existProp("app_sg_check_order1","buy_id");}
               
            });
         }},"-",
          {text:"ˢ��",iconCls:"gridBarItemQuery",handler:cLoadEvent("app_sg_check_order1")}    
     ];
 }  

var orderList=createPageGrid({
     id         : "app_sg_check_order1",
     title      : "δ��˲ɹ����б�",
     region     : "west",
     items      : buyOrderListFields,
     urls       : "/buy/order/waitcheck.do",
     filter     : false,
     split      : true,
     height     : 400,
     width      : 600,
//     tbar       : getBuyOrderTbar(),
     rowclick   : function(){
                     var d=getData("app_sg_check_order1",["buy_id"]);
                     load("app_sg_check_order2",d);
                  }
 });
 
var detailList=createPageGrid({
     id         : "app_sg_check_order2",
     title      : "�ɹ�����ϸ",
     region     : "center",
     items      : buyOrderDetailFields,
     urls       : "/buy/order/detail.do",
     firstLoad  : false,
     filter     : false,
     split      : true,
     height     : 400,
     width      : 400
 });
 
 return [orderList,detailList]; 
   