var buyOrderListFields=[
      {label:"�̵����κ�",name:"check_no"},
      {label:"�̵���",name:"staff_id"},
      {label:"�̵�ʱ��",name:"check_time"},
      {label:"����ID",name:"sf_id",hide:"all"},
      {label:"�̵�����",name:"check_desc"}
   ];

var buyOrderDetailFields=[
      {label:"�����¼ID",name:"buy_id",hide:"all"},
      {label:"ԭ����ID",name:"mat_id",hide:"all"},
      {label:"ԭ��������",name:"mat_name"},
      {label:"Ԥ�Ʋɹ�����",name:"pre_buy_num"},
      {label:"ʵ�ʲɹ�����",name:"buy_num"},
      {label:"Ԥ�Ʋɹ�����",name:"pre_buy_price"},
      {label:"ʵ�ʲɹ�����",name:"buy_price"},
      {label:"��ϸID",name:"detail_id",hide:"all"}
   ];

var inStorageFields=[
      {label:"�����¼ID",name:"buy_id",hide:"all"},
      {label:"��ע",name:"store_memo",xtype:"textarea"}
   ];
   
   
 function getBuyOrderTbar(){
     return [
        {text:"�����̵�",iconCls:"gridItemEdit",
         handler:function(){
              var d=getData("app_sg_stocking_order11",["buy_id"]);
              cTabEditWindow({
                 label      : "���",
                 id         : "app_sg_stocking_order11",
                 action     : "/buy/order/instorage.do",
                 data       : d,
                 check      : function c(){if(!existProp("app_sg_stocking_order11","buy_id")){$alt("��ѡ��һ���ɹ������");return false;}return true;},
                 items      : inStorageFields,
                 width      : 300,
                 height     : 200
              });
              
         }},"-",
         {text:"ˢ��",iconCls:"gridBarItemQuery",handler:cLoadEvent("app_sg_stocking_order11")}    
     ];
 }  

var orderList=createPageGrid({
     id         : "app_sg_stocking_order11",
     title      : "�̵��б�",
     region     : "west",
     items      : buyOrderListFields,
     urls       : "/buy/order/waitstorage.do",
     filter     : false,
     split      : true,
     height     : 400,
     width      : 600,
     tbar       : getBuyOrderTbar(),
     rowclick   : function(){
                     var d=getData("app_sg_stocking_order11",["buy_id"]);
                     load("app_sg_stocking_order12",d);
                  }
 });
 
var detailList=createPageGrid({
     id         : "app_sg_stocking_order12",
     title      : "�̵���ϸ",
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
   