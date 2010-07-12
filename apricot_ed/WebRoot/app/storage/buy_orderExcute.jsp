var buyOrderListFields11=[
      {label:"�ɹ�����",name:"buy_no",width:180,readOnly:true},
      {label:"�ɹ�����",name:"buy_date",xtype:"date",format:"Ymd",readOnly:true},
      {label:"�����¼ID",name:"buy_id",hide:"all"},
      {label:"�ɹ�Ա",name:"staff_name",hide:"form"},
      {label:"�ܽ��",name:"total_money",readOnly:true},
      {label:"����",name:"buy_state",hide:"grid",xtype:"combo",allowBlank:false,data:[["5","δͨ��,���������˻�"],["4","ͨ�����ɹ�������д���"]]},
      {label:"�������",name:"record_desc",xtype:"textarea"}
   ];

var staffFields=[
  {label:"Ա��ID",name:"staff_id",hidden:true,hide:true},
  {label:"Ա������",name:"staff_code"},
  {label:"Ա������",  name:"staff_type",xtype:"combo",code:"STAFF_TYPE"},
  {label:"Ա������",  name:"staff_name"}

];

var matFields=[
      {label:"ԭ����ID",name:"mat_id",hide:"all"},
      {label:"ԭ��������",name:"mat_name"},
      {label:"ԭ����˵��",name:"mat_memo"},
      {label:"ԭ��������",name:"mat_type",code:"MAT_TYPE"},
      {label:"ԭ���ϼ�����λ",name:"mat_measure_unit",code:"MAT_MEASURE_UNIT"},
      {label:"ԭ���ϼ۸�",name:"mat_price"}
   ];
var buyOrderListFields=[
      {label:"�ɹ�����",name:"buy_no",hide:"form"},
      {label:"�ɹ�����",name:"buy_date",xtype:"date",format:"Ymd"},
      {label:"�����¼ID",name:"buy_id",hide:"all"},
      {label:"�����",name:"record_staff_id",hide:"all"},
      {label:"�����",name:"staff_name",xtype:"trigger",table:"staff_info",columns:staffFields,map:{staff_id:"record_staff_id"}},
      {label:"Ԥ�ƽ��",name:"total_money"},
      {label:"���ز���",name:"dept_name",readOnly:true},
      {label:"״̬",name:"buy_state",hide:"all"},
      {label:"�������",name:"record_desc"}
      
   ];
function clcPrice()
{
	var ddd = getData(app_sg_buy_order222);
	var n=Ext.getCmp("buy_num");
	var p=Ext.getCmp("buy_price");
	var a=Ext.getCmp("all_price");
	var b=Ext.getCmp("buyed_price");
	var tm=Ext.getCmp("total_money");
	var t = ((n.getValue()*p.getValue())).toFixed(2);
	b.setValue(t);
}
var buyOrderDetailFields=[
      {label:"�����¼ID",name:"buy_id",hide:"all"},
      {label:"ԭ����ID",name:"mat_id",hide:"all"},
      {label:"ԭ��������",name:"mat_name",readOnly:true},
      {label:"������λ",name:"mat_measure_unit_text",readOnly:true},
      {label:"Ԥ�Ʋɹ�����",name:"pre_buy_num",id:"pre_buy_num",readOnly:true,allowBlank:false,xtype:"number"},
      {label:"ʵ�ʲɹ�����",name:"buy_num",id:"buy_num",allowBlank:false,listeners:{"blur":clcPrice},xtype:"number"},
      {label:"Ԥ�Ʋɹ�����(Ԫ)",name:"pre_buy_price",id:"pre_buy_price",readOnly:true,allowBlank:false,xtype:"number"},
      {label:"ʵ�ʲɹ�����(Ԫ)",name:"buy_price",id:"buy_price",allowBlank:false,listeners:{"blur":clcPrice},xtype:"number"},
	  {label:"Ԥ��С��(Ԫ)",name:"all_price",id:"all_price",xtype:"number",readOnly:true},
	  {label:"ʵ��(Ԫ)",name:"buyed_price",id:"buyed_price",readOnly:true},
      {label:"��ϸID",name:"detail_id",hide:"all"}
   ];
   
 function getBuyOrderTbar(){
     return [
        {text:"�������",iconCls:"gridItemEdit",
         handler:function(){
         	var d=getData("app_sg_buy_order111",["buy_id"]);
            if(!d.buy_id){
                $alt("��ѡ��һ���ɹ����������룡");
                return;
            }
         	cTabEditWindow({
               label : "�ɹ������",
               width : 400,
               height: 300,
               id    : "app_sg_buy_order111",
               items : buyOrderListFields11,
               action: "/buy/order/apply5.do",
               load  : true,
               close : function(){load("app_sg_buy_order222",{});},
               data  : {buy_state:"",record_desc:""},
               check : function(){return existProp("app_sg_buy_order111","buy_id");}
               
            });
         }},"-",
          {text:"ˢ��",iconCls:"gridBarItemQuery",handler:cLoadEvent("app_sg_buy_order111")}    
     ];
 }  
 
 function getBuyOrderDetailTbar(){
 	 
     var c=function(){
        if(existProp("app_sg_buy_order111","buy_id")) return true;
        $alt("��ѡ��һ���ɹ���������ϸ����");
        return false;
     }
     return [
        {text:"ʵ�ʲɹ���",iconCls:"gridItemAdd",
         handler:function(){
         	var dd = getSelectedData("app_sg_buy_order222");
            cTabEditWindow({
               label : "ʵ�ʲɹ���",
               labelWidth : 120,
               width : 400,
               height: 300,
               id    : "app_sg_buy_order222",
               items : buyOrderDetailFields,
               action: "/buy/order/orderExcute.do",
               data  : dd,
               check : c
            });}}
     ];
 } 
   

var orderList=createPageGrid({
     id         : "app_sg_buy_order111",
     title      : "�ɹ����б�",
     region     : "west",
     items      : buyOrderListFields,
     urls       : "/buy/order/excute.do",
     filter     : false,
     split      : true,
     height     : 400,
     width      : 400,
     tbar       : getBuyOrderTbar(),
     rowclick   : function(){
                     var d=getData("app_sg_buy_order111",["buy_id"]);
                     load("app_sg_buy_order222",d);
                  }
 });
 
var detailList=createPageGrid({
     id         : "app_sg_buy_order222",
     title      : "�ɹ�����ϸ",
     region     : "center",
     items      : buyOrderDetailFields,
     urls       : "/buy/order/detail.do",
     firstLoad  : true,
     store      : true,
     singleSelect:true,
     filter     : false,
     split      : true,
     height     : 400,
     width      : 400,
     tbar       : getBuyOrderDetailTbar()
 });
 

 
 
 return [orderList,detailList]; 
   