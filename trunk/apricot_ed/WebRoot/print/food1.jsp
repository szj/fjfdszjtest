
var mFields=[
  
  {label:"�������",name:"order_no",readOnly:true},
   {label:"��������",name:"order_type",readOnly:true,code:"ORDER_TYPE"},
  {label:"����״̬",name:"order_status",width:60,code:"order_status"},
   {label:"��λ����",name:"balcony_name",readOnly:true},
   {label:"����",name:"food_name",readOnly:true},
	{label:"����",name:"food_count",readOnly:true},
	 //{label:"��λ",name:"book_cash",readOnly:true},
	{label:"�ϲ˱�ʶ",name:"food_action",code:"FOOD_ACTION",readOnly:true},
	 {label:"�߲˴���",name:"hurry_times",readOnly:true},
	 {label:"��ƷID",name:"order_list_id",readOnly:true},
   {label:"��ӡ��־",name:"is_print",readOnly:true,code:"IS_PRINT"}
 
];

function foodPrint(){
var selectedRows = grid.getSelectionModel().getSelections();  
//if(selectedRows.length==0){
//	alert("tf ");
//}
var str="";
for(var i=0;i< selectedRows.length;i++){
	str+=selectedRows[i].data.order_list_id+",";
}
str=str.substring(0,str.length-1);
//alert(str);
 
 
 
 
	var state=Ext.getCmp("orderstatus").getValue(); 
	var type=Ext.getCmp("ORDERTYPE").getValue(); 
	var orderno=Ext.getCmp("orderno").getValue(); 
	var balconyname=Ext.getCmp("balconyname").getValue(); 
	var FOODACTION=Ext.getCmp("foodaction").getValue(); 
	var hurry=Ext.getCmp("hurrytimes").getValue(); 
	var isprint=Ext.getCmp("isprint").getValue();
	//var firstID=getData("food_print",["order_list_id"]).order_list_id;
   //  grid.getSelectionModel().selectLastRow() ;
   //  var lastID=getData("food_print",["order_list_id"]).order_list_id;
       var WinPrint = window.open('../print/foodprint.jsp?str='+str+'&isprint='+isprint+'&type='+type+'&FOODACTION='+FOODACTION+'&hurry='+hurry+'&balconyname='+balconyname+'&orderno='+orderno+'&state='+state+'','','toolbar=no, status=no,menubar=no, scrollbars=yes,resizable=no');
}
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
    
   load("food_print",dt);
  
}
var toolBars=[ {text:"��ӡ",iconCls:"gridmultiadd",handler:foodPrint},"-",
   "��ѯ����","&nbsp;","-",
       	                  createField({name:"order_no",id:"orderno",emptyText:"�������",width:90}),
       	                  "-",
       	                  createField({name:"balcony_name",id:"balconyname",emptyText:"��λ����",width:90}),
       	                  "-",
       	                   createField({name:"order_type",xtype:"combo",id:"ORDERTYPE",code:"ORDER_TYPE",emptyText:"��������",width:90}),
       	                  "-",
       	                   createField({name:"order_status",xtype:"combo",id:"orderstatus",code:"order_status",emptyText:"����״̬",width:90}),
       	                  "-",
       	                  createField({name:"food_action",id:"foodaction",xtype:"combo",code:"FOOD_ACTION",emptyText:"��ѡ���ϲ˱�ʶ",width:120}),
       	                   "-",
       	                   createField({name:"hurry_times",id:"hurrytimes",xtype:"combo",code:"IS_HURRY",emptyText:"��ѡ��߲˱�ʶ",width:120}),
       	                   "-",
       	                   createField({name:"is_print",id:"isprint",xtype:"combo",width:90,code:"IS_PRINT",emptyText:"��ѡ���ӡ��ʶ"}),
       	                  createField({name:"orderQuery",xtype:"button",pressed:true,iconCls:"gridBarItemQuery",label:"GO",width:60,handler:goClick})
       	                  
       	                  ];

var grid=createPageGrid({
     id            : "food_print",
     label         : "�˵���ӡ�б�",
     region        : "center",
     items         : mFields,
     checkbox:true,
    //sm:true,
     filter        : false,
   //  page          : true,
     urls          : "/print/foodpage.do",
     toolBarFields :toolBars
 
 });

 return [grid];