var fld=[
      {label:"��λ���",name:"set_no",width:50},
      {label:"������",name:"order_no",allowBlank:false},
      {label:"��������",name:"man_count",allowBlank:false,width:50},
      {label:"����ʱ��",name:"order_time",allowBlank:false},
      {label:"����״̬",name:"order_status_text",width:50},
      {label:"��������",name:"order_type_text",width:50},
      {label:"Ԥ��������",name:"prearrange_name"},
      {label:"Ԥ���˵绰����",name:"prearrange_phone"},
      {label:"Ԥ������",name:"prearrange_man_count",width:50},
      {label:"Ԥ��VIP����",name:"vip_card_no"},
      {label:"�߲˴���",name:"hurry_times",width:50},
      {label:"�����˵�ַ",name:"prearrange_addr"}
   ];
   
   
  var grid=cGroupGridJson({
      id           : "app_rp_currday_order",
      title        : "���ն�������",
      items        : fld,
      groupField   : "order_status_text",
      url          : "/report/curr_day_order.do",
      region       : "center"
  }); 
  
  
  return [grid];