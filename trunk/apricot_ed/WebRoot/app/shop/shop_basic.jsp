return createTableFormNoButton({
   id:"app_shop_shop_basic",
   tableTitle:"�����б�",
   formTitle:"���������Ϣ",
   horizontal:true,
   tableURL: "shop/storefront_info_page.do",
   deleteURL:"/shop/storefront_info_delete.do",
   table:"storefront_info",
   formCols:1,
   items:[
    	 {label:"�����ʶ",name:"sf_id",hide:"all"},
    	 {label:"��������",name:"sf_name",allowBlank:false,sortable:true},
    	 {label:"�����ַ",name:"sf_addr",width:200,allowBlank:false},
    	 {label:"�곤",name:"sf_manager_name"},
    	 {label:"������ϵ�绰",name:"sf_phone"},
    	 {label:"�곤��ϵ�绰",name:"sf_manager_phone"},
    	 {label:"�����־",name:"sf_status",hide:"all"},
    	 {label:"������IP��ַ",name:"service_ip"},
    	 {label:"���Žӿ�",name:"sms_status",xtype:"combo",code:"SMS_STATUS"}
    ]
});

