var buyOrderListFields=[
     {label:"����",name:"pay_time",width:160},
     {label:"���ս��",name:"pay_total",width:160,allowBlank:false}
   ];

var buyOrderDetailFields=[
       {label:"�ϼ�",name:"sum",allowBlank:false}
   ];

var toolBars=["��ѯ��˼�¼","&nbsp;","-",
       	                  createField({name:"order_time",width:100,xtype:"datetime",format:"Y-m-d",emptyText:"��ʼ����"}),
       	                  "&nbsp;","-",
       	                  createField({name:"order_time1",width:100,xtype:"datetime",format:"Y-m-d",emptyText:"��ֹ����"}),     
       	                  "&nbsp;","-",
       	                  createField({name:"orderQuery",xtype:"button",pressed:true,iconCls:"gridBarItemQuery",label:"GO",width:60,handler:goClick}),
       	                  "&nbsp;","-",
       	                  createField({name:"exportExcel",xtype:"button",pressed:true,text:"����Excel",width:60,handler:ExportExcel})
       	                  ];     	                     

var orderList=createPageGrid({
     id         : "app_rp_ranking_order",
     title      : "ÿ���ܽ��",
     toolBarFields:toolBars,
     region     : "west",
     items      : buyOrderListFields,
     urls       : "/report/currday_turnover.do",
     filter     : false,
     split      : true,
     height     : 400,
     width      : 600
 });
 
var detailList=createPageGrid({
     id         : "app_rp_ranking_order1",
     title      : "��ѯ�ܺϼ�",
     region     : "center",
     items      : buyOrderDetailFields,
     urls       : "/report/currday_turnovers.do",
     filter     : false,
     split      : true,
     height     : 400,
     width      : 400
 });

function ExportExcel()
{
	var dt={};
   for(var i=0;i< toolBars.length;i++){
     var o=toolBars[i];
        if(typeof o == "object"){
   	       if(o.getName && o.getValue){
   	          dt[o.getName()]=o.getValue();	          
   	       }
   	   }
   	 }
	doGet("/report/currday_turnover_export.do",dt,function(d){
	    alert(d["flag"]);
	})
}

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
 load("app_rp_ranking_order",dt);
 load("app_rp_ranking_order1",dt);
  // 	grid.getStore().baseParams=dt;
 //  	grid.getStore().load();
}
 
 
 return [orderList,detailList]; 
   