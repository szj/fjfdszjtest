MainPanel = function() 
{
	this.urls=[];
	//this.homePage="/homepage.shtml";	//������ҳ
	this.homePage="/system/login.shtml?actionType=firstPageManage";
	this.currentUrl=this.homePage;	
	this.openTab = function(panel, id) {
		var o = (typeof panel == "string" ? panel : id || panel.id);
		var tab = this.getComponent(o);		
		if (tab) {
			this.setActiveTab(tab);
		} else if(typeof panel!="string"){
			panel.id = o;
			var p = this.add(panel);
			this.setActiveTab(p);
		}
	};
	this.back=function(){
		
	};
	this.forward=function(){
		
	};
	this.closeTab = function(panel, id) {
		var o = (typeof panel == "string" ? panel : id || panel.id);
		var tab = this.getComponent(o);
		if (tab) {
			// if(tab.lazyClose)tab.hide();
			// else
			this.remove(tab);
		}
	};
	this.closeAll=function(excep)
	{	
		this.cascade(function(p){
			if(p.closable && p!=excep)this.closeTab(p);
		},this);
	};
	this.openUrl=function(url,panlId,title){
		var cmd=Ext.getCmp(panlId);
		var loader={url:url,scripts:true};
		if(cmd==null)cmd=new Ext.Panel({id:panlId,title:title,autoLoad:loader,autoScroll:true,closable:true});
		else cmd.body.load(loader);
		this.openTab(cmd);
	}
	this.loadUrl=function(url,panelId,title)
	{	
		var cmd=Ext.getCmp("homePage");
		if(this.urls.indexOf(url)<0){
		this.urls.push(url);
		}
		this.currentUrl=url;
		cmd.body.load({url:url,scripts:true});
		this.openTab(cmd);
	};
	this.refresh=function()	{
		if(this.currentUrl){
			this.loadUrl(this.currentUrl);
		}
	}
	this.menu=new Ext.menu.Menu({items:[{text:"�ر�����Tab",handler:this.closeAll,scope:this},{text:"�ر�����Tab",handler:function(){this.closeAll(this.getActiveTab());},scope:this}]});
	MainPanel.superclass.constructor.call(this, {
		id : 'main',
		region : 'center',
		margins : '0 5 5 0',
		resizeTabs : true,
		minTabWidth : 65,
		tabWidth : 120,
		enableTabScroll : true,
		activeTab : 0,
		items : [{
			id : 'homePage',
			title : '������',
			closable : false,
			autoLoad : {
				url : '/system/login.shtml?actionType=firstPageManage'
			},
			autoScroll : true,
			tbar : [{text:'��ҳ',
						cls:"x-btn-text-icon",
						icon:"images/home.gif",
						handler:function(){
							main.loadUrl(this.homePage);
						},
						scope:this
					},{text:'ǰ��',
						cls:"x-btn-text-icon",
						icon:"images/forward.gif",
						handler:this.forward,
						scope:this
					},{text:'����',
						cls:"x-btn-text-icon",
						icon:"images/back.gif",
						handler:this.back,
						scope:this
					},{text:'ˢ��',
						cls:"x-btn-text-icon",
						icon:"images/core/refresh.gif",
						handler:this.refresh,
						scope:this
					},{text:'����������ϵ',
						cls:"x-btn-text-icon",
						icon:"images/contact.gif",
						handler:function(){
							//window.open("http://www.qzgfgs.com/")
							//alert('Ȫ���йڷ���Ϣ�Ƽ����޹�˾');
							Ext.MessageBox.alert('��ʾ','Ȫ���йڷ���Ϣ�Ƽ����޹�˾');
						}
					}]
		}]
	});
	this.on("contextmenu",function(tabPanel,tab,e)
		{
			this.menu.showAt(e.getPoint());
		},this
	);
};
Ext.extend(MainPanel, Ext.TabPanel);