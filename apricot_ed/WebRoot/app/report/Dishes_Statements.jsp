var fld=[
      {label:"����ʱ��",name:"order_time"},
      {label:"�������",name:"order_no",allowBlank:false},
      {label:"��Ʒ����",name:"food_name",allowBlank:false},
      {label:"�˲�����",name:"food_count",allowBlank:false},
      {label:"�˲�ԭ������",name:"food_return_type",allowBlank:false,xtype:"combo",code:"FOOD_RETURN_TYPE"},
      {label:"�˲�ԭ��",name:"food_return_reseon",allowBlank:false}
   ];

var toolBars=["�˲˱���","&nbsp;","-",
       	                  createField({name:"order_time",width:100,xtype:"datetime",format:"Y-m-d",emptyText:"������ʼ ʱ��"}),
       	                  "&nbsp;","-",
       	                  createField({name:"order_time1",width:100,xtype:"datetime",format:"Y-m-d",emptyText:"��������ʱ��"}),     
       	                  "&nbsp;","-",
       	                  createField({name:"orderQuery",xtype:"button",pressed:true,iconCls:"gridBarItemQuery",label:"GO",width:60,handler:goClick})     	                  
       	                  ];
       	                  
  var grid=createPageGrid({
      id           : "app_rp_dishes_statements",
      title        : "�˲˱���",
      toolBarFields:toolBars,
      items        : fld,
      groupField   : "food_return_type",
      urls          : "/report/dishes_statements.do",
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
 load("app_rp_dishes_statements",dt);
  // 	grid.getStore().baseParams=dt;
 //  	grid.getStore().load();
}





  return [grid];