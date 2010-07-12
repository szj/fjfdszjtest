var staffFields=[
  {label:"Ա��ID",name:"staff_id",hidden:true,hide:true},
  {label:"Ա������",name:"staff_code"},
  {label:"Ա������",  name:"staff_type",xtype:"combo",code:"STAFF_TYPE"},
  {label:"Ա������",  name:"staff_name"}

];
var deptFields=[
  {label:"����ID",name:"dept_id",hidden:true,hide:true},
  {label:"��������",  name:"dept_name"}

];
var inStorageFields=[
      {label:"�����¼ID",name:"buy_id",hide:"all"},
      {label:"��ע",name:"store_memo",xtype:"textarea"}
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
      {label:"�ɹ���",name:"record_staff_id",hide:"all"},
      {label:"�ɹ���",name:"staff_name",xtype:"trigger",table:"staff_info",columns:staffFields,map:{staff_id:"record_staff_id"}},
      {label:"���ز���",name:"record_dept_id",hide:"all"},
      {label:"���ز���",name:"dept_name",xtype:"trigger",table:"dept_info",columns:deptFields,map:{dept_id:"record_dept_id"}},
      {label:"Ԥ�ƽ��",name:"total_money"},
      {label:"״̬",name:"buy_state",hide:"all"},
      {label:"����",name:"record_desc"}
      
   ];
function clcPrice()
{
	var ddd = getData(app_sg_buy_order2);
	var n=Ext.getCmp("buy_num");
	var p=Ext.getCmp("buy_price");
	var a=Ext.getCmp("all_price");
	var b=Ext.getCmp("buyed_price");
	var tm=Ext.getCmp("total_money");
	var t = ((n.getValue()*p.getValue())).toFixed(2);
	a.setValue(t);

	if((Number(t)+Number(b.getValue())) > Number(tm.getValue()))
	{
		alert("���"+(Number(t)+Number(b.getValue())).toFixed(2)+"����Ԥ�ƽ��");
		n.focus(true, true);
	}
}
var buyOrderDetailFields=[
      {label:"�����¼ID",name:"buy_id",hide:"all"},
      {label:"ԭ����ID",name:"mat_id",hide:"all"},
      {label:"ԭ��������",name:"mat_name",xtype:"trigger",table:"material_info",columns:matFields},
      {label:"������λ",name:"mat_measure_unit_text",hide:"grid",readOnly:true},
//      {label:"Ԥ�Ʋɹ�����",name:"pre_buy_num",hide:"all",id:"pre_buy_num",listeners:{"blur":clcPrice},allowBlank:false,xtype:"number"},
      {label:"ʵ�ʲɹ�����",name:"buy_num",id:"buy_num",allowBlank:false,xtype:"number",listeners:{"blur":clcPrice}},
//      {label:"Ԥ�Ʋɹ�����(Ԫ)",name:"pre_buy_price",hide:"all",id:"pre_buy_price",listeners:{"blur":clcPrice},allowBlank:false,xtype:"number"},
      {label:"ʵ�ʲɹ�����(Ԫ)",name:"buy_price",id:"buy_price",allowBlank:false,xtype:"number",listeners:{"blur":clcPrice}},
	  {label:"�ܼ�(Ԫ)",name:"all_price",id:"all_price",xtype:"number",readOnly:true},
	  {label:"����(Ԫ)",name:"buyed_price",id:"buyed_price",readOnly:true},
	  {label:"Ԥ��(Ԫ)",name:"total_money",id:"total_money",readOnly:true},
      {label:"��ϸID",name:"detail_id",hide:"all"}
   ];
   
 function getBuyOrderTbar(){
     return [
        {text:"�½��ɹ���",iconCls:"gridItemAdd",
         handler:function(){
            cTabEditWindow({
               label : "�½��ɹ���",
               width : 400,
               height: 300,
               id    : "app_sg_buy_order1",
               items : buyOrderListFields,
               action: "/buy/order/create.do",
               data  : {buy_state:"1"}
               
            });}},"-",
        {text:"�޸Ĳɹ���",iconCls:"gridItemEdit",
         handler:function(){
            cTabEditWindow({
               label : "�޸Ĳɹ���",
               width : 400,
               height: 300,
               id    : "app_sg_buy_order1",
               items : buyOrderListFields,
               action: "/buy_order_info.modify.go",
               load  : true,
               check : function(){return existProp("app_sg_buy_order1","buy_id");}
               
            });
         }},"-",
         {text:"�ɹ������",iconCls:"gridItemEdit",
         handler:function(){
              var d=getData("app_sg_buy_order1",["buy_id"]);
              cTabEditWindow({
                 label      : "���",
                 id         : "app_sg_buy_order1",
                 action     : "/buy/order/instorage.do",
                 data       : d,
                 check      : function c(){if(!existProp("app_sg_buy_order1","buy_id")){$alt("��ѡ��һ���ɹ������");return false;}return true;},
                 items      : inStorageFields,
                 width      : 300,
                 height     : 200,
                 close      : function(){load("app_sg_buy_order2",{});}
              });
              
         }},"-",
         /**
        {text:"�������",iconCls:"orderCheck",
         handler:function(){
              var d=getData("app_sg_buy_order1");
              if(!d.buy_id){
                  $alt("��ѡ��һ���ɹ����������룡");
                  return;
              }
              
              d["buy_state"]="5";
              
              doPost("/buy/order/apply5.do",d,function(){
                 load("app_sg_buy_order1",d);
                 load("app_sg_buy_order2",{});
              });
         
         }},"-",*/
         {text:"ȡ���ɹ���",iconCls:"gridItemDel",
          handler:function(){
              var d=getData("app_sg_buy_order1",["buy_id"]);
              if(!d.buy_id){
                  $alt("��ѡ��һ���ɹ�������ȡ����");
                  return;
              }
              
              d["buy_state"]="0";
              
              doPost("/buy_order_info.modify.go",d,function(){
                 load("app_sg_buy_order1",d);
                 load("app_sg_buy_order2",{});
              });
              
          }},"-",
          {text:"ˢ��",iconCls:"gridBarItemQuery",handler:cLoadEvent("app_sg_buy_order1")}    
     ];
 }  
 
 function getBuyOrderDetailTbar(){
 	 
     var c=function(){
        if(existProp("app_sg_buy_order1","buy_id")) return true;
        $alt("��ѡ��һ���ɹ���������ϸ����");
        return false;
     }
     return [
        {text:"����ԭ����",iconCls:"gridItemAdd",
         handler:function(){
         	var sm = getCmp("app_sg_buy_order2").getSelectionModel();
         	sm.selectAll();
         	var d = getData("app_sg_buy_order1");
         	var dd = getSelectedRows("app_sg_buy_order2");
         	var ddd = getData("app_sg_buy_order2",["buy_id","buyed_price","total_money"]);
         	var allPrice = 0.00;
         	for(var i = 0;i < dd.length;i ++)
         	{
         		var temp=dd[i];
         		allPrice = Number(allPrice) + Number(temp.all_price);
         	}
         	ddd.buyed_price=allPrice.toFixed(2);
         	ddd.total_money = d.total_money;
         	ddd.buy_id = d.buy_id;
            cTabEditWindow({
               label : "����ԭ����",
               labelWidth : 120,
               width : 400,
               height: 300,
               id    : "app_sg_buy_order2",
               items : buyOrderDetailFields,
               action: "/buy_order_list.insert.go",
               data  : ddd,
               check : c
            });}},"-",
         {text:"ɾ��ԭ����",iconCls:"gridItemDel",
          handler:function(){
              var d=getData("app_sg_buy_order2",["detail_id","buy_id"]);
              if(!d.detail_id){
                  $alt("��ѡ��һ���ɹ�����ϸ����ȡ����");
                  return;
              }
                        
              doPost("/buy_order_list.delete.go",d,cLoadEvent("app_sg_buy_order2",d));
              
          }}    
     ];
 } 
   

var orderList=createPageGrid({
     id         : "app_sg_buy_order1",
     title      : "�ɹ����б�",
     region     : "west",
     items      : buyOrderListFields,
     urls       : "/buy/order/nocheck.do",
     filter     : false,
     split      : true,
     height     : 400,
     width      : 400,
     tbar       : getBuyOrderTbar(),
     rowclick   : function(){
                     var d=getData("app_sg_buy_order1",["buy_id"]);
                     load("app_sg_buy_order2",d);
                  }
 });
 
var detailList=createPageGrid({
     id         : "app_sg_buy_order2",
     title      : "�ɹ�����ϸ",
     region     : "center",
     items      : buyOrderDetailFields,
     urls       : "/buy/order/detail.do",
     firstLoad  : true,
     store      : true,
     singleSelect:false,
     filter     : false,
     split      : true,
     height     : 400,
     width      : 400,
     tbar       : getBuyOrderDetailTbar()
 });
 

 
 
 return [orderList,detailList]; 
   