return createTableForm({
   id:"app_shop_material_info",
   tableTitle:"Դ�����б�",
   formTitle:"Դ���ϻ�����Ϣ",
   horizontal:true,
   table:"material_info",
   width:400,
   formCols:1,
   items:[
       {label:"ԭ����ID",name:"mat_id",hidden:true,hide:true},
    	 {label:"ԭ��������",name:"mat_name"},
    	 
    	 {label:"ԭ��������",name:"mat_type",code:"MAT_TYPE",xtype:"combo",allowBlank:false},
    	 {label:"ԭ���ϼ�����λ",name:"mat_measure_unit",code:"MEASURE_UNIT",xtype:"combo",allowBlank:false},
    	 {label:"Դ���ϼ۸�",name:"mat_price",xtype:"number",allowBlank:false},
    	 {label:"ԭ����˵��",name:"mat_memo",xtype:"textarea",hidden:true}
    ]
});

