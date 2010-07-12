var sfSelectColumn=[
  {name:"sf_name",label:"��������",query:true},
  {label:"�����ַ",name:"sf_addr",width:200},
  {name:"sf_id",label:"�����ʶ",hidden:true}
];

var deptFields=[
 	{label:"����ID",name:"dept_id",hide:true,hidden:true},
	{label:"��������",name:"dept_name"},
	{label:"�ϼ�����",name:"parent_id",hide:true,hidden:true},
	{label:"�ϼ�����",name:"parent_name"}
];

var fm=[
  {name:"food_id",label:"��Ʒ",hidden:true,hide:true},
  {name:"mat_id",label:"Դ����",hidden:true,hide:true},
  {name:"food_name",label:"��Ʒ����",readOnly:true},
  {name:"food_price",label:"��Ʒ����(Ԫ)",hide:true},
  {name:"mat_name",label:"Դ��������",xtype:"trigger",table:"material_info",columns:[{name:"mat_name",label:"Դ��������"},{name:"mat_id",label:"Դ���ϱ�ʶ",hidden:true},{name:"mat_measure_unit",label:"������λ",code:"MEASURE_UNIT"}],map:{mat_measure_unit:"mat_measure_unit"}},
  {name:"mat_price",label:"Դ���ϵ���",hide:true},
  {name:"mat_total",label:"��������"},
  {name:"mat_measure_unit_text",label:"������λ",code:"MEASURE_UNIT"}
];


/**
 * ���ò�Ʒ��ͼƬ�ű�����
 */
function foodImageSet(){
   var d=getData("app_shop_food_basic_table",["food_id","food_name"]);
   
   if(!d.food_id){
     $alt("��ѡ��һ����Ʒ����ͼƬ���ã�");
     return;
   }
   
   var fls=[ 
   {text:"�Ե�ǰָ����Ʒ��ͼƬ�����ϴ���\r��ע���һ�㣺ÿһ���ϴ����Ὣ��һ���ϴ���ͼƬ���ǡ�",
    xtype:"label",style:"font-size:9pt"},
   {text:"(ͼƬ���ͣ�gif��ͼƬ��С��64*64(����))",xtype:"label",style:"font-size:9pt;font-color:red"},
   {text:" ",xtype:"label"},
   createField({label:"��Ʒ����",name:"food_name",xtype:"text",readOnly:true}),
   createField({label:"��ƷͼƬ",name:"food_image",xtype:"upload"}),
   {xtype:"textfield",hidden:true,name:"food_id",hideLabel:true}
   ];

    var msg = function(title, msg){
        Ext.Msg.show({
            title: title, 
            msg: msg,
            minWidth: 200,
            modal: true,
            icon: Ext.Msg.INFO,
            buttons: Ext.Msg.OK
        });
    };

   var its=new Ext.FormPanel({
       items   : fls,
       style   : "padding:5px",
       frame   : true,
       fileUpload : true,
       region   : "center",
       layout  :"form",
       labelWidth:60,
      
       defaults: {
            anchor: '95%',
            allowBlank: false,
            msgTarget: 'side'
       },
       buttons:[
       {text:"����",
        handler: function(){
                if(its.getForm().isValid()){
                   its.getForm().submit({
	                    url: toURL('/shop/food/image/add.do'),
	                    
	                    waitMsg: '�����ϴ���ƷͼƬ...',
	                    success: function(fp, o){
	                        msg('�ɹ�', '��ƷͼƬ�ϴ��ɹ���');
	                        viewImage(d);
	                    }
	                });
                }
         }
       },
       {text:"�ر�",handler:function(){getCmp("shopfoodbasic_image_w").destroy();}}
       ]
   });
   
   its.on("afterlayout",function(o){its.getForm().setValues(d)});

   var win=new Ext.Window({
      title   :  "���ò�ƷͼƬ",
      items   : its,
      width   : 400,
      id      : "shopfoodbasic_image_w",
      height  : 220,
      modal   : true,
      bodyStyle : "background-color:white",
      layout  : "border"
   });
   
   win.show();
}


function viewImage(d){
   var f=getCmp("app_shop_food_basic_form");
   var img=f.findById("food_image_id");
   
   /**
   if(img.autoEl && img.autoEl.src){
      img.autoEl.src=toURL("/shop/food/image/get.do")+"?food_id="+d.food_id;
   }**/
   img.getEl().dom.style.width=64;
   img.getEl().dom.style.height=64;
   img.getEl().dom.src=toURL("/shop/food/image/get.do")+"?food_id="+d.food_id;
   
}



/*************************/

var l= createTableForm({
   id:"app_shop_food_basic",
   tableTitle:"��Ʒ�б�",
   formTitle:"��Ʒ������Ϣ",
   horizontal:true,
   height:650,
   table:"food_info",
   tableURL:"/shop/food_pages.do",
   addURL:"/shop/food_add.do",
   modifyURL:"/shop/food_modify.do",
   deleteURL:"/shop/food_delete.do",
   formCols:1,
   items:[
         {label:"����",name:"sf_id",hidden:true,hide:true},
    	 {label:"��������",name:"sf_name",xtype:"trigger",table:"storefront_info",columns:sfSelectColumn},
    	 {label:"��ƷID",name:"food_id",hide:true,hidden:true},
    	 {label:"��Ʒ����",name:"food_name",allowBlank:false,sortable:true},
    	 {label:"��Ʒ����(Ԫ)",name:"food_price",allowBlank:false},
    	 {label:"��Ʒ����",name:"food_type",code:"FOOD_TYPE",xtype:"combo"},
    	 {label:"������λ",name:"food_price_unit",code:"MEASURE_UNIT",xtype:"combo"},
    	 {label:"�˲�",name:"can_return",code:"IS_OR_NOT",xtype:"combo"},
    	 {label:"���϶���",name:"intelnetorder_food",code:"INTELNETORDER_FOOD",xtype:"combo"},
    	 {label:"��ζ�̶�",name:"spicy_level",code:"SPICY_LEVEL",xtype:"combo"},
    	 {label:"��Ʒ״̬",name:"food_status_text",hide:true},
    	 {label:"��������",name:"dept_id",hide:"all"},
    	 {label:"��������",name:"dept_name",xtype:"trigger",table:"dept_info",columns:deptFields},
    	 {label:"���Ź�ϵ",hide:"grid",id:"relat_type",name:"relat_type",xtype:"checkboxgroup",items:
    	 [
    	 		{boxLabel: '��ӡ', name: 'relat_type1',inputValue:'1'},
                {boxLabel: '�ϲ�', name: 'relat_type2',inputValue:'2'},
                {boxLabel: '����', name: 'relat_type3',inputValue:'4'}

    	 ]},
    	 {label:"��ƷͼƬ",height:64,width:64,xtype:"image",id:"food_image_id",autoEl:{tag:"img",src:toURL("/shop/food/image/get.do")},hide:"grid"}
    	
    ],
    onRowClick:function(gd){
       var pm=Ext.apply({},getSelectedData("app_shop_food_basic_table"));
       foodMaterial.getStore().baseParams=pm;
       var v = pm["relat_type"];
	   var temp;
       if( (v & 1) == 1){
       		temp = getCmp("relat_type").items.get(0);
       		 temp.setValue(true); 
       }
       if( (v & 2) == 2){
       		 temp = getCmp("relat_type").items.get(1);
       		 temp.setValue(true);
       		 
       }
       if( (v & 4) == 4){
       		  temp = getCmp("relat_type").items.get(2);
       		 temp.setValue(true);
       		 
       }

       pm["start"]=0;
       pm["limit"]=5;
       foodMaterial.getStore().load({params:pm});
       viewImage(pm);
    },
    toolBar:[
      {text:"���ͼƬ",iconCls:"foodimage",handler:foodImageSet}
    ]
});


var foodMaterial=createPageGrid({
       	   title: "��ƷԴ����ӳ���",
       	   id:"app_shop_food_basic_material",
       	   urls:"/shop/food_material_pages.do",
           split:true,
           page:true,
           height:150,
           width:600,
           region:"south", 
       	   items:fm,
       	   createFunction:function(){
                var pm=Ext.apply({},foodMaterial.getStore().baseParams);
                pm["start"]=0;
                pm["limit"]=5;
                var w=createFormWindow({label:"��ƷԴ����",items:fm,id:"app_shop_food_basic_material_map",action:"food_material_info.insert.go"});
                w.show(this);
                getCmp("app_shop_food_basic_material_map_win_form").getForm().setValues(foodMaterial.getStore().baseParams);
                w.on("beforedestroy",function(){foodMaterial.getStore().load(pm);});
       	   	},
       	   deleteFunction:function(){
                Ext.Ajax.request(getAjaxRequest("/shop/food_material_delete.do",getSelectedData("app_shop_food_basic_material"),
                   function(f,a){
                    attrList.getStore().load();
                }));
       	   }
   });

l.push(foodMaterial);

return l;