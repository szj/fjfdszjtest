var printConfigFields=[
   {label:"��ӡ��ID",name:"printer_id",hide:"all"},
   {label:"��Ʒ����",name:"food_type",hide:"grid",code:"FOOD_TYPE",xtype:"combo"},
   {label:"��ӡ������",xtype:"combo",name:"printer_type",hide:"grid",code:"PRINTER_TYPE"},
   {label:"��ӡ��ģʽ",xtype:"combo",name:"print_mode",hide:"grid",code:"PRINTER_MODE"},
   {label:"��Ʒ����",name:"food_type_text",hide:"form"},
   {label:"��ӡ������",name:"printer_label"},
   {label:"��ӡ������",name:"printer_type_text",hide:"form"},
   {label:"��ӡ������",name:"printer_name"},
   {label:"��ӡ��IP",name:"printer_ip"},
   {label:"��ӡ���˿�",name:"printer_port"}
];


var printSetFields=[
   {label:"��ӡʱ����(����)",name:"timesteep"},
   {label:"�ͻ�����ӡ������",name:"CashierDeskStream.printerType",xtype:"combo",code:"PRINTER_TYPE"},
   {label:"�ͻ�����ӡ������",name:"CashierDeskStream.printerLabel"},
   {label:"�ͻ�����ӡ������",name:"CashierDeskStream.printerName"},
   {label:"�ͻ�����ӡ��IP",name:"CashierDeskStream.printerHost"},
   {label:"�ͻ�����ӡ���˿�",name:"CashierDeskStream.printerPort"}
];

var pcf={
   title:"��Ʒ��ӡ������",
      items:createTableForm({
      id:"print_config_set_tf",
      items:printConfigFields,
      tableURL:"app/system/printers.do",
      table:"print_config"
   }),
   border:false,
   layout:"border"
}

var form=createFormPanel({
   id:"print_config_set_tf_global",
   title:"ȫ�ִ�ӡ������",
   cols:1,
   labelWidth:120,
   items:printSetFields
});

form.on("show",function(f){
   
   doGet("/print/global/getParameters.print",{},function(d){
      setFormValues("print_config_set_tf_global",d.data);
   });
});

form.addButton({text:"ȷ��",handler:function(d){
    var o=Ext.apply(getFormData("print_config_set_tf_global"),getFormValues("print_config_set_tf_global"));
    doGet("/print/global/setParameters.print",o,function(d){
        alert("����ȫ�ִ�ӡ�����ɹ���");
    });
}});

form.addButton({text:"Ӧ��",handler:function(d){
    var o=Ext.apply(getFormData("print_config_set_tf_global"),getFormValues("print_config_set_tf_global"));
    
    doGet("/print/global/applyParameters.print",o,function(d){
        alert("����ȫ�ִ�ӡ�����ɹ���");
    });
}});


return [{xtype:"tabpanel",activeTab:0,region:"center",bodyStyle:"padding:2px",items:[pcf,form]}];


