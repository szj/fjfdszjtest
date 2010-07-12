var fld=[
   {label:"������",name:"order_no",allowBlank:false},
   {label:"����ʱ��",name:"order_time",allowBlank:false},
   {label:"����״̬",name:"order_status_text"},
   {label:"������Ա",name:"staff_name"},
   {label:"�����Ʒ",name:"food_name"},
   {label:"����ԭ��",name:"food_return_reseon"},
   {label:"����",name:"food_count"}
];

var toolBars=["�����ѯ����","&nbsp;","-",
               createField({name:"order_time",width:100,xtype:"datetime",format:"Y-m-d",emptyText:"������ʼ����"}),
               "&nbsp;",
               createField({name:"order_time1",width:100,xtype:"datetime",format:"Y-m-d",emptyText:"������ֹ����"}),
               "&nbsp;",
       	       createField({name:"orderQuery",xtype:"button",pressed:true,iconCls:"gridBarItemQuery",label:"GO",width:60,handler:goClick})
    	     ]

var grid=cGroupGridJson({
    id           : "report_loss_detail",
    title        : "���𱨱�",
    items        : fld,
    url          : "/report/report_loss.do",
    region       : "center",
    toolBarFields: toolBars
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
    
   load("report_loss_detail",dt);
} 

return[grid];