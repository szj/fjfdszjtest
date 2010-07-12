return createTableForm({
   id:"app_shop_shop_printer",
   tableTitle:"��ӡ���б�",
   formTitle:"��ӡ����Ϣ",
   horizontal:true,
   tableURL: "/storefront_printer.pages.go",
   deleteURL:"/storefront_printer.delete.go",
   table:"storefront_printer",
   formCols:1,
   items:[
    	 {label:"��ӡ����ʶ",name:"printer_id",hide:"all"},
    	 {label:"����",name:"printer_part",allowBlank:false,xtype:"combo",code:"PART_PRINT"},
    	 {label:"��ӡ������",name:"printer_name",allowBlank:false,sortable:true},
    	 {label:"��ӡ����ַ",name:"server_address",width:200},
    	 {label:"�Ƿ�����",name:"usesd_state",allowBlank:false,xtype:"combo",code:"USED_STATE"},
    	 {label:"��ע",name:"memo"}
    ]
});