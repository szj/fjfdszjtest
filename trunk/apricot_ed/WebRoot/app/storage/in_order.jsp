var buyOrderListFields=[
      {label:"�ɹ�����",name:"buy_no",width:180},
      {label:"�ɹ�����",name:"buy_date",xtype:"date",format:"Ymd"},
      {label:"�����¼ID",name:"buy_id",hide:"all"},
      {label:"�ɹ�Ա",name:"staff_name"},
      {label:"�����",name:"r_name"},
      {label:"�ܽ��",name:"total_money"},
      {label:"���ز���",name:"dept_name",readOnly:true},
      {label:"״̬",name:"buy_state",hide:"grid",xtype:"combo",allowBlank:false,data:[["1","δͨ��"],["4","ͨ��"]]},
      {label:"�������",name:"record_desc",xtype:"textarea"}
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
        {text:"�ɹ������",iconCls:"gridItemEdit",
         handler:function(){
              var d=getData("app_sg_in_order11",["buy_id"]);
              cTabEditWindow({
                 label      : "���",
                 id         : "app_sg_in_order11",
                 action     : "/buy/order/instorage.do",
                 data       : d,
                 check      : function c(){if(!existProp("app_sg_in_order11","buy_id")){$alt("��ѡ��һ���ɹ������");return false;}return true;},
                 items      : inStorageFields,
                 width      : 300,
                 height     : 200,
                 close      : function(){load("app_sg_in_order12",{});}
              });
              
         }},"-",
         {text:"�˻ظ��ɹ�",iconCls:"gridItemDel",
          handler:function(){
              var d=getData("app_sg_in_order11",["buy_id"]);
              if(!d.buy_id){
                  $alt("��ѡ��һ���ɹ������д�ز�����");
                  return;
              }
              
              d["buy_state"]="6";
              
              doPost("/buy_order_info.modify.go",d,function(){load("app_sg_in_order11");load("app_sg_in_order12",{});});
              
          }},"-",
          {text:"ˢ��",iconCls:"gridBarItemQuery",handler:cLoadEvent("app_sg_in_order11")}    
     ];
 }  

var orderList=createPageGrid({
     id         : "app_sg_in_order11",
     title      : "�����ɹ����б�",
     region     : "west",
     items      : buyOrderListFields,
     urls       : "/buy/order/waitstorage.do",
     filter     : false,
     split      : true,
     height     : 400,
     width      : 600,
     tbar       : getBuyOrderTbar(),
     rowclick   : function(){
                     var d=getData("app_sg_in_order11",["buy_id"]);
                     load("app_sg_in_order12",d);
                  }
 });
 
var detailList=createPageGrid({
     id         : "app_sg_in_order12",
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
   