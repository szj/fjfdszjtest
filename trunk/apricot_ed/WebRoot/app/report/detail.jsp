var fld=[
      {label:"��λ���",name:"set_no"},
       {label:"Ա������",name:"staff_id",hide:"all"},
       {label:"Ա������",name:"staff_name"},
      {label:"������",name:"order_no",allowBlank:false},
     // {label:"��������",name:"man_count",allowBlank:false},
      {label:"����ʱ��",name:"order_time",allowBlank:false},
      {label:"����״̬",name:"order_status_text"},
      //{label:"��������",name:"order_type_text"},
      {label:"��������",name:"prearrange_name"},
      {label:"��ϵ�绰",name:"prearrange_phone"},
     // {label:"Ԥ������",name:"prearrange_man_count"},
     // {label:"Ԥ��VIP����",name:"vip_card_no"},
      {label:"�շ�ʱ��",name:"operate_order_time"},
      {label:"�Ż�ǰ���(��)",name:"total"},
      {label:"�Żݺ���(��)",name:"pay_total"},
      {label:"�Ż�ȯ���(��)",name:"youhui_total"},
      {label:"�ֽ��շ�(��)",name:"fact_pay_total"},
       {label:"ˢ���շ�(��)",name:"fact_pay_card"}
     // {label:"�����˵�ַ",name:"prearrange_addr"}
   ];
    var toolBars=[ 
   "��ѯ����","&nbsp;","-",
       	                  createField({name:"cur_date",xtype:"datetime",width:90,id:"time2",format:'Y-m-d',emptyText:"����ʱ��"}),
       	                  "-",
       	                  createField({name:"cur_name",width:90,id:"staff_id",emptyText:"Ա������"}),
       	                  createField({name:"orderQuery",xtype:"button",pressed:true,iconCls:"gridBarItemQuery",label:"GO",width:60,handler:goClick})
       	                  
       	                  ];
   
  var grid=cGroupGridJson({
      id           : "app_page_detail",
      title        : "ӪҵԱ������ϸ��ѯ",
      items        : fld,
      groupField   : "order_status_text",
      url          : "/staff/super_detailpage.do",
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
    
   load("app_page_detail",dt);
  // 	grid.getStore().baseParams=dt;
 //  	grid.getStore().load();
}
  return [grid];