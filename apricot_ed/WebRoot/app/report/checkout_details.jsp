var fld=[
      {label:"��λ���",name:"set_no"},
      {label:"������",name:"order_no",allowBlank:false},
     // {label:"��������",name:"man_count",allowBlank:false},
      {label:"����ʱ��",name:"order_time",allowBlank:false},
      {label:"����״̬",name:"order_status_text"},
      //{label:"��������",name:"order_type_text"},
      {label:"��������",name:"prearrange_name"},
      {label:"��ϵ�绰",name:"prearrange_phone"},
     // {label:"Ԥ������",name:"prearrange_man_count"},
      {label:"VIP����",name:"vip_card_no"},
      {label:"����ʱ��",name:"operate_order_time"},
      {label:"�Ż�ǰ���(��)",name:"total"},
      {label:"�Żݺ���(��)",name:"pay_total"},
      {label:"�ֽ��շ�(��)",name:"fact_pay_total"},
//      {label:"ʵ�ս��(��)",name:"fact_pay_total"},
//       {label:"������(��)",name:"return_total"},
       {label:"ˢ���շ�(��)",name:"fact_pay_card"},
       {label:"ʵ�ʽ��ɽ��(��)",name:"factmon"}
     // {label:"�����˵�ַ",name:"prearrange_addr"}
   ];
    var toolBars=[ 
   "��ѯ����","&nbsp;","-",
       	                  createField({name:"cur_date",xtype:"datetime",width:90,id:"time",format:'Y-m-d',emptyText:"����ʱ��"}),
       	                  "&nbsp;",
       	                  createField({name:"orderQuery",xtype:"button",pressed:true,iconCls:"gridBarItemQuery",label:"GO",width:60,handler:goClick})
       	                  
       	                  ];
   
  var grid=cGroupGridJson({
      id           : "app_rp_currday_detail",
      title        : "ӪҵԱ������ϸ��ѯ",
      items        : fld,
      groupField   : "order_status_text",
      url          : "/staff/detail.do",
      region       : "center",
      toolBarFields:toolBars
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
    
   load("app_rp_currday_detail",dt);
  // 	grid.getStore().baseParams=dt;
 //  	grid.getStore().load();
}
  return [grid];