var fld=[
      {label:"��λ���",name:"set_no"},
      {label:"������",name:"order_no",allowBlank:false},
      {label:"��������",name:"man_count",allowBlank:false},
      {label:"����ʱ��",name:"order_time",allowBlank:false},
      {label:"���˽��(��)",name:"total",allowBlank:false},
      {label:"��ϵ��",name:"book_man"},
      {label:"��ϵ�绰",name:"book_phone"},
      {label:"��������",name:"order_type_text"},
      {label:"Ԥ�ƽ���ʱ��",name:"book_date"},
      {label:"����ԭ��",name:"book_desc",width:80},
      {label:"Ա������",name:"cashier",hide:"all"},
       {label:"��ȨԱ������",name:"book_name"},
      {label:"��������(��)",name:"days"}
   ];
   /***
 * ������ѯ��������
 */
var toolBars=["�����ѯ����","&nbsp;","-",
       	                  createField({name:"order_time",width:100,xtype:"datetime",format:"Y-m-d",emptyText:"������ʼ����"}),
       	                  "&nbsp;",
       	                  createField({name:"order_time1",width:100,xtype:"datetime",format:"Y-m-d",emptyText:"������ֹ����"}),
       	                   "-",
       	                  createField({name:"book_date",xtype:"datetime",width:100,emptyText:"Ԥ�ƽ�����ʼʱ��",format:"Y-m-d"}),
       	                  "&nbsp;",
       	                  createField({name:"book_date1",xtype:"datetime",width:100,emptyText:"Ԥ�ƽ��˽�ֹʱ��",format:"Y-m-d"}),
       	                  "-",
       	                  createField({name:"order_type",xtype:"combo",code:"ORDER_TYPE",width:80,emptyText:"��������"}),
       	                  "-",
       	                  createField({name:"days",code:"ORDER_TYPE",width:80,emptyText:"��������"}),
       	                  "&nbsp;",
       	                  createField({name:"orderQuery",xtype:"button",pressed:true,iconCls:"gridBarItemQuery",label:"GO",width:60,handler:goClick})
       	                  
       	                  ];
   
   
  var grid=createPageGrid({
      id           : "app_rp_currday_order",
      title        : "���˱���",
      items        : fld,
      toolBarFields:toolBars,
      groupField   : "order_status_text",
      urls          : "/report/curr_day_order1.do",
      region       : "center",
       contextMenu:function(ev,o){
       	      if(!o.contentMenu && o.contentMenu!=null){ o.contentMenu.destroy();o.contentMenu=null;}
       	      
       	      var dt=getSelectedData("app_rp_currday_order");
       	      
       	      var mm=new Ext.menu.Menu({id:"app_rp_currday_order_cxt_menu",shadow:false});
       	      mm.add({text:"�ͻ�����",icon:"",handler:orderPayEvent});
       	      
       	      mm.showAt(ev.getPoint());
       	      o.contentMenu=mm;
       	   }
      
  }); 
  //�ͻ�����
var orderPayEvent=function(){
    var dt=getData("app_rp_currday_order",["order_no"]).order_no;
    var dts = [getData("app_rp_currday_order",["order_no"]).order_no,getData("app_rp_currday_order",

["mincost_money"]).mincost_money,getData("app_rp_currday_order",["mincost_type"]).mincost_type,getData

("app_rp_currday_order",["man_count"]).man_count];
    var w=cCalculatePanel(dts,cLoadEvent("app_rp_currday_order"));
    w.show(this);
};

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
    
   load("app_rp_currday_order",dt);
  // 	grid.getStore().baseParams=dt;
 //  	grid.getStore().load();
}
  
  
  return [grid];