var fld=[
      {label:"�������",name:"order_no",width:80},
      {label:"Ԥ��ʱ��",name:"prearrange_order_time",allowBlank:false},
      {label:"��������",name:"prearrange_name",allowBlank:false,width:80},
      {label:"��ϵ�绰",name:"prearrange_phone",allowBlank:false},
      {label:"Ԥ����¼��",name:"precord_staff_id",allowBlank:false,width:80},
      {label:"ȡ����¼��",name:"order_name",allowBlank:false},
      {label:"ȡ��ԭ��",name:"order_reseon",allowBlank:false,width:80}
   ];

var toolBars=["Ԥ��ȡ������","&nbsp;","-",
       	                  createField({name:"order_time",width:100,xtype:"datetime",format:"Y-m-d",emptyText:"������ʼ����"}),
       	                  "&nbsp;","-",
       	                  createField({name:"order_time1",width:100,xtype:"datetime",format:"Y-m-d",emptyText:"������ֹ����"}),     
       	                  "&nbsp;","-",
       	                  createField({name:"orderQuery",xtype:"button",pressed:true,iconCls:"gridBarItemQuery",label:"GO",width:60,handler:goClick})
       	                  
       	                  ];
       	                  
  var grid=createPageGrid({
      id           : "app_rp_cancel_ststements",
      title        : "Ԥ��ȡ������",
      toolBarFields:toolBars,
      items        : fld,
      groupField   : "order_reseon",
      urls          : "/report/cancel_ststements.do",
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
 load("app_rp_cancel_ststements",dt);
  // 	grid.getStore().baseParams=dt;
 //  	grid.getStore().load();
}





  return [grid];