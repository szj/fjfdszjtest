/**
 * ����������
 * 
 * @param d
 * @return
 */

function createOrderFoodPanel(d) {
	
	var foodlist_fields = [
		{
			label :"��ƷID",
			name :"food_id",
			hide :"all"
		}, {
			label :"��Ʒ����",
			name :"food_name"
		}, {
			label :"��Ʒ����",
			name :"food_price",
			xtype :"number",
			width :60
		},  {
			label :"��Ʒ����",
			name :"food_num",
			xtype :"number",
			width :60
		}, {
			label :"��ζ��ע",
			name :"food_memo",
			readOnly:true
		} ];

	// ��Ʒ��ϸ�б�
	var foodlist1 = cEditGrid( {
		title :"��Ʒ�б�",
		items :foodlist_fields,
		region :"center",
		id :"food_list_list",
		width :300,
		filter :false,
		split :true,
		collapsible:true,
		region:"center",
		tbarDisable :true,
		check :true,
		rowselect:function(sm,rowIndex,record){
	          var arr=record.data.food_memo;
	          
	          getCmp("order_detail_food_memo").getForm().reset();
	          setFormValues("order_detail_food_memo",{food_memo:arr});
	}
	});

	// DataView Store
	var dataViewStore = new Ext.data.JsonStore( {
		url :toURL('/business/food/images.do'),
		root :'images',
		fields : [
			'food_id', 'food_name', "food_price", 'attr_desc' ],
		autoLoad :true
	});

	var url = toURL("/shop/food/image/get.do") + "?food_id=";
	// DataViewģ��
	var tpl = new Ext.XTemplate(
			'<tpl for=".">',
			'<div class="thumb-wrap">',
			'<div class="thumb"><img src="' + url + '{food_id}" title="{food_name}"></div>',
			'<span class="x-editable">{food_name}({attr_desc})</span></div>', '</tpl>',
			'<div class="x-clear"></div>');

	var FoodRecord = Ext.data.Record.create( [
		{
			name :'food_id',
			mapping :'food_id'
		}, {
			name :'food_name',
			mapping :'food_name'
		}, {
			name :'food_num',
			mapping :'food_num'
		}, {
			name :'food_price',
			mapping :'food_price'
		}, {
			name :'selected',
			mapping :'selected'
		} ]);
	// ��Ʒͼ���
	function dataViewClick(ev, i, el, e) {
		var o = ev;
		var dd = o.getSelectedRecords();
		if (dd.length > 0)
			dd = Ext.apply( {}, dd[0].data);
		else
			return;
		dd["food_num"] = "1";
		dd["selected"] = true;
		var store = getCmp("food_list_list").getStore();
		// store.add(new Ext.data.Record( {
		// data :dd
		// }));
		
		//foodBar.activate(foodlist1.getId());
		var d=new Array();
		doGet("/order/order_addfoodCheck.do?food_id="+dd["food_id"],d,function(date){
			if(date["flag"]=="YES"){
				if(confirm(date["Message"]+",�Ƿ������ˣ���"))
				{
					store.add(new FoodRecord(dd));
				}
			}
			else
			{
				store.add(new FoodRecord(dd));
			}
		}
		)

	}

	// ��ƷͼƬ
	var foodimages = new Ext.Panel({
		title :"��Ʒͼ��",
		layout :"fit",
		region :"east",
		width :350,
		split :true,
		collapsible:true,
		items : [ new Ext.DataView( {
			id :"food_image_list",
			split :true,
			store :dataViewStore,
			tpl :tpl,
			style :"overflow:auto",
			multiSelect :true,
			itemSelector :'div.thumb-wrap',
			overClass :'x-view-over',
			layout :"fit",
			listeners : {
				"click" : {
					fn :dataViewClick,
					scope :this
				}
			}
		}) ]
	});
	
	var foodTypeBar = [{xtype :"tbfill"}];

	function createFoodType(d){
		return function(){
			foodimages.setTitle("��Ʒͼ��["+d[1]+"]");
			dataViewStore.removeAll();
			dataViewStore.load({params:{food_type:d[0]}});
		};
	}
	
	doSyncRequest("FOOD_TYPE.to",{},function(d){
        
        for(var i=0;i<d.length;i++){
         if(d[i][1]=="" || d[i][1]=="&nbsp;") continue;
         foodTypeBar.push("&nbsp;");
       	 foodTypeBar.push({
       		 text : d[i][1],
       		 pressed:true,
       		 handler:createFoodType(d[i])
       	 });
        }
        
       
     });
	
	

	
	foodTypeBar.push("&nbsp;");
	foodTypeBar.push("&nbsp;");
	var foodmemo=createFormPanel({
			region:"south",
			id:"order_detail_food_memo",
			title:"��Ʒ��ע",
			items:[{label:"��ζ��ע",keyField:"label",id:"order_detail_food_memo_food_memo",xtype:"checkboxgroup",code:"FOOD_MEMO",listeners:{
				change:function(box,arr){

			}
			}}],
			cols:1,
			height:160,
			buttons:[{text:"ȷ��",handler:function(){
		var arr=getCmp("order_detail_food_memo_food_memo").getValue();
		
		var lbs=new Array();
		for(var i=0;i<arr.length;i++){
		   lbs.push(arr[i].initialConfig.boxLabel);
		}
		
		updateGridSelectedData("food_list_list",{food_memo:lbs.join(",")});
	}},{text:"����",handler:function(){
		var g=getCmp("food_list_list");
		var res=g.getSelectionModel().getSelections();
		if(!res) return;
		if(window.confirm("�Ƿ�ѡ�еĲ˽������ˣ�")==false) return;
		for(var i=0;i<res.length;i++){
			var record=res[i];
			record.set("food_price","0");
			record.commit();
		}
		
	}}]
	});
	// ����
	return {
		region :"center",
		layout :"fit",
		bodyStyle :"padding:1px",

		items : {
			layout :"border",
			items : [
				{region:"center",border:false,layout:"border",items:[foodlist1,foodmemo]}, foodimages ],
			border :false,
			bodyBorder :false
		},
		tbar :foodTypeBar,
		hideBorders :true,
		getData : function(){
			var  rd={order_id:d};
			var  al=new Array();
			
			var a=getCmp("food_list_list").getStore().query("selected","true");
			
			for(var i=0;i<a.length;i++){
				al.push(a.item(i).data);
			}
			rd["order_list"]=al;
			return rd;
		}
	};

}
