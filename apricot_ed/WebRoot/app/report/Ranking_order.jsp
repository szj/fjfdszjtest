var fld=[
      {label:"��Ʒ����",name:"food_name",allowBlank:false},
      {label:"��˴���",name:"isum",allowBlank:false,width:80}
   ];

var toolBars=["��ѯ��˼�¼","&nbsp;","-",
       	                  createField({name:"order_time",width:100,xtype:"datetime",format:"Y-m-d",emptyText:"��ʼ����"}),
       	                  "&nbsp;","-",
       	                  createField({name:"order_time1",width:100,xtype:"datetime",format:"Y-m-d",emptyText:"��ֹ����"}),     
       	                  "&nbsp;","-",
       	                  createField({name:"orderQuery",xtype:"button",pressed:true,iconCls:"gridBarItemQuery",label:"GO",width:60,handler:goClick})
       	                  ];     	                  
  var grid=createPageGrid({
      id           : "app_rp_ranking_order",
      title        : "������а�",
      toolBarFields:toolBars,
      items        : fld,
      urls          : "/report/ranking_order.do",
      region       : "center"
  });
  
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
  // 	grid.getStore().baseParams=dt;
 //  	grid.getStore().load();
}
  
  
    
  return [grid];