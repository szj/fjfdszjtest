var reshuffleFields=[
	{label:"������",name:"staff_name",readOnly:true},
	{label:"״̬",name:"r_statu_text",readOnly:true},
	{label:"��ʼ���",name:"staff_cash",readOnly:true},
	{label:"�Ӱ���",name:"priv_staff_name",readOnly:true},
	{label:"���ӽ��",name:"take_cash",readOnly:true},
	{label:"����ʱ��",name:"d_time",readOnly:true}
];

var toolBars=["�����¼","&nbsp;","-",
	createField({name:"reshuffle_time",width:100,xtype:"datetime",format:"Y-m-d",emptyText:"��ʼʱ��"}),
	"&nbsp;","-",
	createField({name:"reshuffle_time1",width:100,xtype:"datetime",format:"Y-m-d",emptyText:"����ʱ��"}),     
	"&nbsp;","-",
	createField({name:"orderQuery",xtype:"button",pressed:true,iconCls:"gridBarItemQuery",label:"GO",width:60,handler:goClick})     	                  
];

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
 load("app_rp_reshuffle",dt);
  // 	grid.getStore().baseParams=dt;
 //  	grid.getStore().load();
}

var grid=createPageGrid({
    id           : "app_rp_reshuffle",
    title        : "�����¼",
    page		 : true,
    filter		 : false,
    toolBarFields:toolBars,
    items        : reshuffleFields,
    urls         : "/staff/reshuffle_report.do",
    region       : "center"
}); 

return [grid];