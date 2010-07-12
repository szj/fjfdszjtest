/*
 * Apricot JS Library 1.1
 * Copyright(c) 2006-2008, Apricot JS, LLC.
 * xu.dahu@hotmail.com
 */

/**
 * ��һ���ļ�������Ҫ����ʹ��������ü���������������
 */
function cCalculatePanelFast(orderNo,cb){
    var topFields=[
      {label:"������",name:"order_no",value:orderNo[0]!=null?orderNo[0]:orderNo,readOnly:true},
      {label:"VIP����",name:"vip_card_no"},
//      {label:"�Ż�ȯ����",name:"cp_num"},
      {label:"�����������",name:"mincost_type",value:orderNo[2]!=null?orderNo[2]:"",xtype:"combo",readOnly:true,code:"MINCOST_TYPE"},
      {label:"������ѽ��",name:"mincost_money",value:orderNo[1]!=null?orderNo[1]:"",xtype:"number",readOnly:true},
      {label:"��������",name:"man_count",value:orderNo[3]!=null?orderNo[3]:"",xtype:"number",readOnly:true},
      {label:"�ܽ��",name:"total",xtype:"number",readOnly:true},
      
      {label:"ʹ�û���",id:"point_check",name:"point_check",xtype:"checkbox",handler:changeState},
      {label:"�ܻ���",name:"cum_point",xtype:"number",value:orderNo[4]!=null?orderNo[4]:"",readOnly:true},
      {label:"��������",id:"fact_pay_point",name:"fact_pay_point",xtype:"number",readOnly:true},
      {label:"�������",name:"fact_point",xtype:"number",readOnly:true},
      {label:"���ֶһ����",name:"point_money",xtype:"number",readOnly:true},
      
      {label:"�Ż�ȯ���",name:"youhui_total",value:"0",xtype:"number"},
      
      {label:"Ӧ�ս��",name:"pay_total",xtype:"number",readOnly:true},
  	  {label:"�ֽ�֧��",name:"fact_pay_total",xtype:"number",format:"#0.00"},
  	  {label:"ˢ��֧��",name:"fact_pay_card",xtype:"number",format:"#0.00"},
  	  
      {label:"������",name:"return_total",xtype:"number",readOnly:true},
      {label:"��������",name:"dis_point",xtype:"number",readOnly:true}
//      {label:"�Ż�ȯ���",name:"cp_num"},
      
      
    ];
    function changeState()
	{
		if(Ext.getCmp("point_check").getValue() == true)
		{
			Ext.getCmp("fact_pay_point").getEl().dom.readOnly = false;
		}
		else
		{
			Ext.getCmp("fact_pay_point").setValue(0);
			Ext.getCmp("fact_pay_point").getEl().dom.readOnly = true;
		}
	}
    var ruleFields=[
      {label:"����ID",name:"price_id",hide:"all"},
      {label:"��������",name:"rule_name"},
      {label:"���÷�Χ",name:"rule_scope"},
      {label:"����ֵ",name:"rule_value"}
    ];
    var favConpou=[
      {label:"�Ż�ȯ���",name:"cp_num",hide:"all"},
      {label:"�Ż�ȯ����",name:"cp_name"},
      {label:"�Żݽ��",name:"cp_cash"},
      {label:"�ۿ۱���",name:"cp_disct"},
      {label:"����(ÿ��)Ԫ",name:"cond_value"},
      {label:"����(��)",name:"send_num"},
      {label:"��ʼʱ��",name:"start_time",hide:"all"},
      {label:"��ֹʱ��",name:"end_time"}
    ];
    var foodFields=[
       {label:"��Ʒ����",name:"food_name"},
       {label:"��Ʒ����",name:"food_count"},
       {label:"��Ʒ����",name:"food_price"},
       {label:"��λ����",name:"balcony_name"}
    ];
      var toolBars=[  "����(ÿ��)Ԫ","&nbsp;",
      				  createField({name:"pay_money",code:"COND_VALUE",id:"pay_money1",xtype:"combo",width:70}),
      				  createField({name:"orderQuery",xtype:"button",pressed:true,iconCls:"gridBarItemQuery",label:"GO",width:60,handler:goClick}) ];
     function goClick(){
   var dt={};

   for(var k=0;k<toolBars.length;k++){
   	   var o=toolBars[k];
  
   	   if(typeof o == "object"){
   	       if(o.getName && o.getValue){
   	       
   	          dt[o.getName()]=o.getValue();
   	          
   	       }
   	   }
   	}
    
   load("calculate_panel_fast_f1",dt);
  // 	grid.getStore().baseParams=dt;
 //  	grid.getStore().load();
}
    function calculate(){
    	var d=new Array();
    	d.push(getFormValues("calculate_panel_fast_a")); 
    	//d.push(getFormValues("win1"));
//    	alert(getDataArrayStr("calculate_panel_fast_b1",["price_id"]));
    	var opP=getDataArrayStr("calculate_panel_fast_b1",["price_id"]);
    	d.push(opP);
    	if(opP.length>1){
    		$alt("��ѡ�Ż�ֻ��ѡ��һ�����ܣ���ȡ��һ��");
    		return;
    	}
    	
    	d=d.concat(getAllData("calculate_panel_fast_c1",["price_id"]));
//   		alert(d)
    	doGet("/calculate_calc.do",d,function(dt){
    		if(dt==88888888){
    		$alt("�Ż�ȯ�����ڻ���ʹ�ù��ģ���");
    		}else{	
	    	        dt["return_total"]=((Number(dt.fact_pay_total)+Number(dt.fact_pay_card)+Number(dt.youhui_total))-Number(dt.pay_total)).toFixed(2);
	    	    
		    	    dt["fact_point"]=Number(dt.cum_point)+Number(dt.dis_point)-Number(dt.fact_pay_point);
		    	    getCmp("calculate_panel_fast_a").getForm().setValues(dt);
		    	    if(dt.mincost_type == 1)
		    	    {
		    	    	if(dt.total < (dt.man_count*dt.mincost_money))
		    	    	{
		    	    		$alt("�˾����ѽ��δ�ﵽ������ѱ�׼��");
		    	    	}
		    	    }
		    	    else if(dt.mincost_type == 2)
		    	    {
		    	    	if(dt.total < dt.mincost_money)
		    	    	{
		    	    		$alt("�����ܽ��δ�ﵽ������ѱ�׼��");
		    	    	}
		    	    }
			       if(dt.cum_point < dt.fact_pay_point)
			       {
			       	 $alt("���ѻ��������ܴ����ܻ�������");
			       }
		    	   if(dt.isCan=="0"){
		    	  	 $alt("���򻥳⣬����ȷ��");
		    	   }
        	}	  
    	});
    	
    };
    
    function payoff(){
    	doGet("/fav/coupon_info.check.do",getFormValues("calculate_panel_fast_a"),function(dt){
    		if(dt["flag"]=="YES"){
    			$alt("�Ż�ȯ�����ڻ���ʹ�ù���!!");
    		}else{
				    	var d=getFormValues("calculate_panel_fast_a");
				    	if(d.return_total<0){
				    		$alt("�ͻ�����û����ȫ���ˣ���ȷ�ϣ�");
				    		return;
				    	}
				    	
				    	if(!d.total || !d.return_total){
				    		$alt("��û����ѣ����ܽ��ˣ�");
				    		return;
				    	}
				    	
				    	if(d.mincost_money != "0.00")
				 	    {
				  	    if(d.mincost_type == 1)
				  	    {
				  	    	if(d.total < (d.man_count*d.mincost_money))
				  	    	{
				  	    		$alt("�����ܽ��δ�ﵽ������ѱ�׼��");
				  	    		return;
				  	    	}
				  	    }
				  	    else
				  	    {
				  	    	if(d.total < d.mincost_money)
				  	    	{
				  	    		$alt("�����ܽ��δ�ﵽ������ѱ�׼��");
				  	    		return;
				  	    	}
				  	    }
				  	    if(dt.cum_point < dt.fact_pay_point)
				       	{
				       	 	$alt("���ѻ��������ܴ����ܻ�������");
				       	 	return;
				       	}
				  	  }
				    	
				    	doPost("/calculate_payoff.do",d,function(){
				    	    removeHandler("calculate_panel_fast_a_but1");
				    	    removeHandler("calculate_panel_fast_a_but2");
				    	    removeHandler("calculate_panel_fast_a_but3");
				    	});
    		}
    	});
    	
    	

    }
    
    
      function favCon(){
 		   var simple = new Ext.FormPanel({
    	        id:'win1',
				labelWidth: 85, 			
				baseCls: 'x-plain',
				defaults: {width: 150},
				defaultType: 'textfield',
				items: [{
						fieldLabel: '�Ż�ȯ���',
						name: 'cp_num',
						//anchor:'95%',
						allowBlank:false,
						blankText:'ʵ��ȯ��Ų���Ϊ��'
					}
				],

				buttons: [{
					text: 'ʹ��',
					//handler:calculate
					handler:function(){
					 	//doGet("/calculate_calc.do",getFormValues("win1"),function(dt){});
											var d=new Array();
					    	d.push(getFormValues("calculate_panel_fast_a")); 
					    	d.push(getFormValues("win1"));
					//    	alert(getDataArrayStr("calculate_panel_fast_b1",["price_id"]));
					    	d.push(getDataArrayStr("calculate_panel_fast_b1",["price_id"]));
					//    	alert(d);
					    	d=d.concat(getAllData("calculate_panel_fast_c1",["price_id"]));
					//   		alert(d)
					    	doGet("/calculate_calc.do",d,function(dt){
					    		if(dt==88888888){
					    		$alt("�Ż�ȯ����ʹ�ù��ģ���");
					    		}else
					    		{
						    	    dt["return_total"]=(dt.fact_pay_total-dt.pay_total).toString().replace(/^(\d+\.\d{2})\d*$/,"$1");
						    	    dt["fact_point"]=Number(dt.cum_point)+Number(dt.dis_point)-Number(dt.fact_pay_point);
						    	    getCmp("calculate_panel_fast_a").getForm().setValues(dt);
						    	    if(dt.mincost_money != "0.00")
						    	    {
							    	    if(dt.mincost_type == 1)
							    	    {
							    	    	if(dt.total < (dt.man_count*dt.mincost_money))
							    	    	{
							    	    		$alt("�����ܽ��δ�ﵽ������ѱ�׼��");
							    	    	}
							    	    }
							    	    else
							    	    {
							    	    	if(dt.total < dt.mincost_money)
							    	    	{
							    	    		$alt("�����ܽ��δ�ﵽ������ѱ�׼��");
							    	    	}
							    	    }
							       }
							       if(dt.cum_point < dt.fact_pay_point)
							       {
							       	 $alt("���ѻ��������ܴ����ܻ�������");
							       }
						    	   if(dt.isCan=="0"){
						    	  	 $alt("���򻥳⣬����ȷ��");
						    	   }
						    	  
					    	  }
					    	});
					}
				},{
					text: '�ر�',
					handler:function(){ getCmp("win").destroy();}
				}]
			});    
			       
				   win = new Ext.Window({
						id:'win',
						title:'�Ż�ȯʹ��',
						layout:'fit',					
						width:300,
						height:150,
						plain:true,
                        bodyStyle:'padding:5px;',
						maximizable:false,
						closeAction:'close',
						closable:false,
						collapsible:true,
						plain: true,
             		    modal:true ,
						buttonAlign:'center',
						items:simple
					});
					win.show();

    }
    
    function printOrder(){
		doGet("/print/printOrder.do",getFormValues("calculate_panel_fast_a"),function(dt){
			if(dt["flag"] == 0)
			{
				alert("��ӡ�ɹ�");
			}
			else
			{
				alert("��ӡʧ�ܣ�������");
			}
			
		})
    }
    
    function bookFee(){
    doGet("/keepaccount_calc.do",null,function(dt){
    if(dt["kai_accounts"]==0)
    {
      //?????
          var simple = new Ext.FormPanel({
    	        id:'win1',
				labelWidth: 75, 			
				baseCls: 'x-plain',
				defaults: {width: 150},
				defaultType: 'textfield',
				items: [{
						fieldLabel: '�ʻ�',
						name: 'name',
						//anchor:'95%',
						allowBlank:false,
						blankText:'�ʻ�����Ϊ��'
					},{
					    inputType:'password',
						fieldLabel: '����',
						//anchor:'95%',
						name: 'pws',
						allowBlank:false,
						blankText:'���벻��Ϊ��'
					}
				],

				buttons: [{
					text: '��Ȩ',
					handler:function(){
					 var d={};
					  d=Ext.apply(d,getFormValues("win1"));
					 doPost("/checklogin.do",getFormValues("win1"),function(rt){
					 getCmp("win").destroy();
    	      		 
					        try{
					          d=Ext.apply(d,getFormValues("calculate_panel_fast_p1"));
					        }catch(e){
					        	toPanel.activate("calculate_panel_fast_p1");
					        	$alt("����д������Ϣ,Ȼ���ټ���");
					        }
					        d=Ext.apply(d,getFormValues("calculate_panel_fast_a"));
					        if(d.book_man=="" || !d.book_man){
					     	   $alt("����д������Ϣ,Ȼ���ټ���.");
					     	   return;
					        }
					    	doPost("/calculate_bookbill.do",d,function(){
					 	    removeHandler("calculate_panel_fast_a_but1");
					 	    removeHandler("calculate_panel_fast_a_but2");
					 	    removeHandler("calculate_panel_fast_a_but3");
					 	   });
    	    		},false);
					}
				},{
					text: '�ر�',
					handler:function(){ getCmp("win").destroy();}
				}]
			});    
			       
				   win = new Ext.Window({
						id:'win',
						title:'���˵�½',
						layout:'fit',					
						width:300,
						height:150,
						plain:true,
                        bodyStyle:'padding:5px;',
						maximizable:false,//??????
						closeAction:'close',
						closable:false,//??????
						collapsible:true,//?????
						plain: true,
             		    modal:true ,
						buttonAlign:'center',
						items:simple//????????????????????
					});
					win.show();//???????
    	
    	
    }
    else
    { 
		 var d={};
        try{
          d=Ext.apply(d,getFormValues("calculate_panel_fast_p1"));
        }catch(e){
        	toPanel.activate("calculate_panel_fast_p1");
        	$alt("����д������Ϣ,Ȼ���ټ���.");
        }
        d=Ext.apply(d,getFormValues("calculate_panel_fast_a"));
        if(d.book_man=="" || !d.book_man){
     	   $alt("����д������Ϣ,Ȼ���ټ���.");
     	   return;
        }
    	doPost("/calculate_bookbill.do",d,function(){
 	    removeHandler("calculate_panel_fast_a_but1");
 	    removeHandler("calculate_panel_fast_a_but2");
 	    removeHandler("calculate_panel_fast_a_but3");
 	   });
    }
    });
    	
    	
       
     }

    
    var buttons=[
      {text:"���",handler:calculate,id:"calculate_panel_fast_a_but1"},
      {text:"�շ�",handler:payoff,id:"calculate_panel_fast_a_but2"},
      {text:"����",handler:bookFee,id:"calculate_panel_fast_a_but3"},
      {text:"���",handler:function(){calcPanel.getForm().getEl().dom.reset();},id:"calculate_panel_clean"},
      {text:"��ӡ",handler:printOrder,id:"calculate_panel_fast_a_but4"}
    ];
    
    var vipMember=[
    	{label:"����",name:"vip_card_no",width:80},
    	{label:"����",name:"cust_name",width:80},
    	{label:"��ϵ�绰",name:"cust_phone",width:80},
    	{label:"����",name:"cum_point",width:80}
    ];
    
    var orderSelectColumn=[
	  {label:"������",name:"order_no",hide:"form",width:80},
      {label:"������",name:"order_id",hide:"all"},
      {label:"��λ���",name:"set_no",width:60},
      {label:"��λ����",name:"balcony_name",width:60},
      {label:"��������",name:"order_type",hide:"form",xtype:"combo",code:"ORDER_TYPE",width:60},
      {label:"����״̬",name:"order_status",hide:"form",xtype:"combo",code:"ORDER_STATUS"},
      {label:"Ԥ������",name:"prearrange_man_count"},
      {label:"��������",name:"man_count"},
      {label:"�����������",name:"mincost_type",xtype:"combo",code:"MINCOST_TYPE"},
      {label:"�����������",name:"mincost_type"},
      {label:"������ѽ��",name:"mincost_money"},
      {label:"����ʱ��",name:"order_time",xtype:"datetime",width:160},
      {label:"��������",name:"prearrange_name"},
      {label:"��ϵ�绰",name:"prearrange_phone"},
      {label:"VIP����",name:"vip_card_no"},
      {label:"�ܻ���",name:"cum_point"},
      {label:"�߲˴���",name:"hurry_times",value:"0",hide:"form"},
      {label:"�����˵�ַ",name:"prearrange_addr"}
	];
	
    function changeOrderNo(d){
    	load("calculate_panel_fast_b1",d);
    	load("calculate_panel_fast_c1",d);
    	load("calculate_panel_fast_d1",d);
    	load("calculate_panel_fast_e1",d);
    	load("calculate_panel_fast_f1",d);
    }
    function changeVipCard(d)
    {
    	var ddd=getCmp("calculate_panel_fast_a");
		var orderNo = order_no=ddd.getForm().getValues("order_no").order_no;
		d.order_no=orderNo;
		doGet("/order/customer_vipNo_modify.do",d,function(dt){
		})
    	load("calculate_panel_fast_b1",{order_no:orderNo});
    }
    
	var baiscFiled=[
		{
			label:"������",name:"order_no",xtype:"trigger",afterRowClick:changeOrderNo,tableURL:"/order/fast_pay_search.do",columns:orderSelectColumn
        },{
            label:"VIP����",name:"vip_card_no",xtype:"trigger",afterRowClick:changeVipCard,tableURL:"/vip/vip_member_select.do",columns:vipMember,disabled:false
        },{
        	label:"�����������",name:"mincost_type",value:orderNo[2]!=null?orderNo[2]:"",xtype:"combo",readOnly:true,code:"MINCOST_TYPE"
        },{
            label:"������ѽ��",name:"mincost_money",value:orderNo[1]!=null?orderNo[1]:"",readOnly:true
        },{
            label:"��������",name:"man_count",value:orderNo[3]!=null?orderNo[3]:"",readOnly:true
        },{
            label:"�ܽ��",name:"total",readOnly:true
        },{
			label:"��������",name:"order_type", xtype:"textfield",readOnly:true
        },{
			label:"�������",name:"order_id", xtype:"textfield",hideMode:"display",hidden:true,hideLabel:true,readOnly:true
        }
    ]
    var pointFiled=[
    	{
            label:"ʹ�û���",id:"point_check",name:"point_check",xtype:"checkbox",handler:changeState
        },{
            label:"�ܻ���",name:"cum_point",value:orderNo[4]!=null?orderNo[4]:"",readOnly:true
        },{
            label:"��������",id:"fact_pay_point",name:"fact_pay_point",readOnly:true
        },{
            label:"�������",name:"fact_point",readOnly:true
        },{
            label:"���ֶһ����",name:"point_money",readOnly:true
        },{
            label:"�Ż�ȯ���",name:"youhui_total",value:"0"
        }
    ]
    var resultFileds=[
    	{
            label:"Ӧ�ս��",name:"pay_total",readOnly:true
        },{
            label:"�ֽ�֧��",name:"fact_pay_total",format:"#0.00"
        },{
            label:"ˢ��֧��",name:"fact_pay_card",format:"#0.00"
        },{
            label:"������",name:"return_total",readOnly:true
        },{
            label:"��������",name:"dis_point",readOnly:true
        },{
            label:"��ӡ����",name:"print_count",value:1
        }
    ]
    for(var i=0;i<baiscFiled.length;i++){
	   baiscFiled[i]=createField(baiscFiled[i],"calculate_panel_fast_a");
	}
	for(var i=0;i<pointFiled.length;i++){
	   pointFiled[i]=createField(pointFiled[i],"calculate_panel_fast_a");
	}
	for(var i=0;i<resultFileds.length;i++){
	   resultFileds[i]=createField(resultFileds[i],"calculate_panel_fast_a");
	}

    
	var calcPanel=new Ext.FormPanel({
		labelAlign: 'top',
		frame:true,
		id            : "calculate_panel_fast_a",
    	title         : "������Ϣ",
    	width         : 700,
    	height        : 220,
    	labelWidth : 80,
    	split         : true,
    	region        : "north",
    	labelAlign:"left",
    	layout:'column',
    	items         : [{
    		
            xtype:'fieldset',
            title: '������Ϣ',
            collapsible: true,
            height:200,
            defaults: {width: 120},
            defaultType: 'textfield',
            columnWidth:.333,
            layout: 'form',
            items :baiscFiled
        },{
            xtype:'fieldset',
            title: '������Ϣ',
            collapsible: true,
            height:200,
            defaults: {width: 120},
            defaultType: 'textfield',
            columnWidth:.333,
            layout: 'form',
            items :pointFiled
        },{
            xtype:'fieldset',
            title: '������Ϣ',
            collapsible: true,
            height:200,
            defaults: {width: 120},
            defaultType: 'textfield',
            columnWidth:.333,
            layout: 'form',
            items :resultFileds
        }]
		
	});
    
    
    var bookPanel=createFormPanel({
    	id            : "calculate_panel_fast_p1",
    	title         : "������Ϣ",
    	cols          : 1,
    	height        : 180,
    	split         : true,
    	items         : [{label:"��ϵ��",name:"book_man",allowBlank:false},
    	                 {label:"��ϵ�绰",name:"book_phone"},
    	                 {label:"����ԭ��",name:"book_desc",code:"ACCOUT_REA",xtype:"combo"},
    	                 {label:"Ԥ�ƽ���ʱ��",name:"book_date",xtype:"datetime"},
    	                 {label:"��ע",name:"book_remarks",xtype:"textarea"}],
    	labelWidth    : 80,
    	region        : "north"
    });
    
    var optionPanel=cGroupGrid({
    	id            : "calculate_panel_fast_b1",
    	title         : "��ѡ�ۿ�",
    	items         : ruleFields,
    	collapsible   : true,
    	selectFirst   : true,
    	url           : "/calculate_rules.do?price_type=2",
    	split         : true,
    	afterLoad     : calculate,
    	rowclick      : calculate,
//    	groupField    : "rule_name",
    	region        : "center"
    });
    

    
    
//    {bodyBorder:false,frame:false,layout:"border",style:"padding:2px",items:[toPanel,tabPanel]}

    var mustOptionPanel=cGroupGrid({
    	id            : "calculate_panel_fast_c1",
    	title         : "��ѡ�ۿ�",
    	items         : ruleFields,
    	region        : "south",
    	url           : "/calculate_rules.do?price_type=1",
    	split         : true,
    	groupField    : "rule_name",
    	selectFirst	  : false,
    	afterLoad     : calculate,
    	collapsible   : true
    });
    
    var noSumitFoodPanel=createPageGrid({
    	id            : "calculate_panel_fast_d1",
    	title         : "δ�ϵĲ�",
    	items         : foodFields,
    	urls           : "/calculate_details.do?serving_flag=0",
    	region        : "center",
    	filter        : false
    });
    var sumitFoodPanel=createPageGrid({
    	id            : "calculate_panel_fast_e1",
    	title         : "���ϵĲ�",
    	items         : foodFields,
    	urls           : "/calculate_details.do?serving_flag=1",
    	region        : "center",
    	filter        : false
    });
     var favCouponPanel=createPageGrid({
    	id            : "calculate_panel_fast_f1",
    	title         : "�Ż�ȯ����",
    	items         : favConpou,
    	urls           : "/fav/coupon_info.pages1.do",
    	region        : "center",
    	//toolBarFields :toolBars,
    	filter        : false
    });
    
    var tabPanel=new Ext.TabPanel({
    	items         : [optionPanel,mustOptionPanel,noSumitFoodPanel,sumitFoodPanel],
    	region        : "center",
    	height        : 320,
    	activeTab     : 0
    });
    
    var toPanel=new Ext.TabPanel({
    	items         : [calcPanel,bookPanel],
    	activeTab     : 0,
    	height        : 260,
    	split         : true,
     	region        : "north",
     	bodyBorder    : false
    });
    
    
    
    var win=new Ext.Panel({
    	 title        : "�ͻ�����",
    	 items        : [{bodyBorder:false,frame:false,layout:"border",style:"padding:2px",items:[toPanel,tabPanel]}],
    	 id           : "calculate_panel_fast_w1",
    	 layout       : "fit",
    	 hideBorders  : true,
    	 bodyBorder   : false,
    	 split         : true,
    	 buttons      : buttons,
    	 region       : "center"
    });
    return win;
}
