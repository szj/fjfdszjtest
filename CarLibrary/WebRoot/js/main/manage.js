Ext.BLANK_IMAGE_URL = '/ext/resources/images/default/s.gif';
var main, menu, header,bottom,onlineWindow,loginWin,messageWindow,photoPreview;
Ext.QuickTips.init();
Ext.form.Field.prototype.msgTarget='side';

OnlineMessageManager.me={id:"",
		name:""};
function togglecheck(btn, pressed){
  grid.addListener('beforeload',function(store,obj) {
    store.baseParams.aaa = '1';
   });
        grid.reconfigure({store:'store',colModel:'cm'});

        
    }

Global = {
	topicCategoryLoader : new Ext.tree.TreeLoader( {
		url : "topicCategory.ejf?cmd=getCategory&pageSize=-1&treeData=true",
		icon:"images/menuPanel/tag_blue4.gif",
		listeners : {
			'beforeload' : function(treeLoader, node) {
				treeLoader.baseParams.id = (node.id.indexOf('root')<0 ? node.id : "");
			}
		}
	}),
	albumCategoryLoader : new Ext.tree.TreeLoader( {
		url : "albumCategory.ejf?cmd=getCategory&pageSize=-1&treeData=true",
		icon:"images/menuPanel/tag_blue4.gif",
		listeners : {
			'beforeload' : function(treeLoader, node) {
				treeLoader.baseParams.id = (node.id.indexOf('root')<0 ? node.id : "");
			}
		}
	})
};

onlineWindow=new OnlineUserWindow({
	// tbar:[{text:"ˢ��1",handler:function(){alert(this.text);},scope:this},"-","����"],
	// items:[, ]
});
/************��ʱ��֪���������ʹ��
LoginWindow=Ext.extend(Ext.Window,{
 	title : '��½ϵͳ',		
	width : 265,			
	height : 140,
	collapsible : true,
	closable:false,
	defaults : {			
		border : false
	},
	buttonAlign : 'center',	
	createFormPanel :function() {
		return new Ext.form.FormPanel({
			bodyStyle : 'padding-top:6px',
			defaultType : 'textfield',
			labelAlign : 'right',
			labelWidth : 55,
			labelPad : 0,
			frame : true,
			defaults : {
				allowBlank : false,
				width : 158,
				selectOnFocus:true
			},
			items : [{
					cls : 'user',
					name : 'userName',
					fieldLabel : '�ʺ�',
					blankText : '�ʺŲ���Ϊ��'
				}, {
					cls : 'key',
					name : 'password',
					fieldLabel : '����',
					blankText : '���벻��Ϊ��',
					inputType : 'password'
				}]
		});
	},					
	login:function() {
			this.fp.form.submit({
					waitTitle:"���Ժ�",
					waitMsg : '���ڵ�¼......',
					url : 'portal.ejf?cmd=login&ext=true',
					success : function(form, action) {
						// window.location.href = 'manage.ejf';
						Ext.get("desktop").unmask();
						this.hide();
						OnlineMessageManager.me=action.result.data;
						if(OnlineMessageManager.stopRecive)OnlineMessageManager.start(OnlineMessageManager);
						bottom.currentUser.el.innerHTML="<b><font color=blue>"+OnlineMessageManager.me.name+"</font></b>";						
					},
					failure : function(form, action) {
						
						if (action.failureType == Ext.form.Action.SERVER_INVALID)
							Ext.MessageBox.alert('����', action.result.errors.msg);
						form.findField("password").setRawValue("");
						form.findField("userName").focus(true);
					},
					scope:this
				});
		},
	initComponent : function(){
		this.keys={
			key: Ext.EventObject.ENTER,
		    fn: this.login,
		    scope: this};
        LoginWindow.superclass.initComponent.call(this);       
        this.fp=this.createFormPanel();
        this.add(this.fp);
        this.addButton('��½',this.login,this);
        this.addButton('ע��', function(){var win=new RegisterWindow();win.show();},this);
        this.addButton('�˳�',function(){Ext.Msg.confirm("��ʾ","ȷ��Ҫ�˳�ϵͳ��",function(btn){if(btn=="yes")window.location.href="portal.ejf";})},this);
	 } 	
 }); 
*********/
RegisterWindow=Ext.extend(Ext.Window,{
 	title : '���û�ע��',		
	width : 265,			
	height : 260,
	modal:true,
	defaults : {			
		border : false
	},
	buttonAlign : 'center',	
	createFormPanel :function() {
		return new Ext.form.FormPanel({
			bodyStyle : 'padding-top:6px',
			defaultType : 'textfield',
			labelAlign : 'right',
			labelWidth : 55,
			labelPad : 0,
			frame : true,
			defaults : {
				allowBlank : false,
				width : 158,
				selectOnFocus:true
			},
			items : [{
					name : 'name',
					fieldLabel : '�ʺ�',
					blankText : '�ʺŲ���Ϊ��'
					},
					{
						name : 'password',
						fieldLabel : '����',
						blankText : '���벻��Ϊ��',
						inputType : 'password'
					},
					{
						name : 'password1',
						fieldLabel : 'ȷ������',
						blankText : '���벻��Ϊ��',
						inputType : 'password'
					},
					{
						name : 'email',
						fieldLabel : '�����ʼ�',
						blankText : '���벻��Ϊ��'
					},
					{
						xtype:"textarea",
						name : 'intro',
						fieldLabel : '���',
						blankText : '���벻��Ϊ��'
					}]
		});
	},					
	save:function() {
		var p1=this.fp.form.findField("password").getValue();
		var p2=this.fp.form.findField("password1").getValue();
		if(p1!=p2){this.fp.form.findField("password").markInvalid("��������������벻ͬ!");this.fp.form.findField("password").focus(true);return;}
			this.fp.form.submit({
					waitTitle:"���Ժ�",
					waitMsg : '���ڱ���......',
					url : 'portal.ejf?cmd=saveRegister&ext=true',
					success : function(form, action) {		
						var name=this.fp.form.findField("name").getValue();			
						this.close();					
						if(loginWin){
							loginWin.fp.form.findField("userName").setValue(name);
							loginWin.fp.form.findField("password").focus();
						}	
					},
					failure : function(form, action) {
						// if (action.failureType ==
						// Ext.form.Action.SERVER_INVALID)
						// Ext.MessageBox.alert('����', action.result.errors.msg);
						form.findField("name").focus(true);
					},
					scope:this
				});
		},
	initComponent : function(){
		this.keys={
			key: Ext.EventObject.ENTER,
		    fn: this.save,
		    scope: this};
        RegisterWindow.superclass.initComponent.call(this);       
        this.fp=this.createFormPanel();
        this.add(this.fp);
        this.addButton('����',this.save,this);
        this.addButton('ȡ��', function(){this.close();},this);
	 } 	
 }); 
 
ChangePasswordWindow=Ext.extend(Ext.Window,{
 	title : '�޸�����',		
	width : 280,		
	iconCls:"icon-password",
	height : 165,	
	defaults : {			
		border : false
	},
	buttonAlign : 'center',	
	createFormPanel :function() {
		return new Ext.form.FormPanel({
			bodyStyle : 'padding-top:6px',
			defaultType : 'textfield',
			labelAlign : 'right',
			labelWidth : 70,
			labelPad : 0,
			frame : true,
			defaults : {
				allowBlank : false,
				width : 158,
				selectOnFocus:true
			},
			items : [{
					cls : 'key',
					name : 'oldPassword',
					fieldLabel : '������',
					blankText : '���벻��Ϊ��',
					inputType : 'password'
				}, {
					cls : 'key',
					name : 'password',
					fieldLabel : '������',
					blankText : '���벻��Ϊ��',
					inputType : 'password'
				}, {
					cls : 'key',
					name : 'password1',
					fieldLabel : 'ȷ������',
					blankText : '���벻��Ϊ��',
					inputType : 'password'
				}]
		});
	},					
	save:function() {
			var p1=this.fp.form.findField("password").getValue();
			var p2=this.fp.form.findField("password1").getValue();

			if(p1!=p2){
				this.fp.form.findField("password").markInvalid("��������������벻ͬ!");
				this.fp.form.findField("password").focus(true);
				return;
			}	
			var url = '/system/manage/modifyPassword.shtml?oldPassword='+this.fp.form.findField("oldPassword").getValue()+'&password='+p1;
			try{
				var oXMLDom	= new ActiveXObject("Msxml.DOMDocument");
				oXMLDom.async = false ;
				oXMLDom.load(url); 
				var root;
				if (oXMLDom.parseError.errorCode != 0) {
					var myErr = oXMLDom.parseError;
					return;
				} else {
					root = oXMLDom.documentElement;
				}
				if (null != root){
					var rowSet = root.selectNodes("//Result");
					if (1 == rowSet.item(0).selectSingleNode("errCode").text){
						Ext.Msg.alert("��ʾ","�����޸ĳɹ��������µ�¼ϵͳ!",function(){
							this.close();
							logout();
						},this);
					}else{
						Ext.Msg.alert("��ʾ", rowSet.item(0).selectSingleNode("errMsg").text,function(){
							form.findField("oldPassword").focus(true);
						},this);
					}
				}
			}catch(e){ 
				alert(e);
			}

		},
	initComponent : function(){
		this.keys={
			key: Ext.EventObject.ENTER,
		    fn: this.save,
		    scope: this};
        ChangePasswordWindow.superclass.initComponent.call(this);       
        this.fp=this.createFormPanel();
        this.add(this.fp);
        this.addButton('����',this.save,this);
        this.addButton('ȡ��', function(){this.close();},this);
        this.on("close",function(){Ext.get("desktop").unmask();})
	 } 	
 }); 
BaseGridList=Ext.extend(Ext.Panel,{	
	layout:"fit",	
	loadData:false,
	pageSize:10,
	closable: true,
  	autoScroll:true,
  	gridViewConfig:{},
   	dateRender:function(format) {
    	format=format||"Y-m-d h:i";
    	return Ext.util.Format.dateRenderer(format);
    },
    userRender:function(v){
    	return v?v.name:"δ֪ԭ��";
    },
    emailRender:function(v){
    	return v?v.email:"δ֪ԭ��";
    },
	initComponent : function(){		
	BaseGridList.superclass.initComponent.call(this);
    this.store=new Ext.data.JsonStore({
		id:"id",
       	url:this.url,
       	root:"result",
  		totalProperty:"rowCount",
  		remoteSort:true,  		
  		fields:this.storeMapping});  		
      	this.store.paramNames.sort="orderBy";
	 	this.store.paramNames.dir="orderType";	  
      	this.cm.defaultSortable=true;  
      	var viewConfig=Ext.apply({forceFit:true},this.gridViewConfig);  
	    this.grid=new Ext.grid.GridPanel({
	        store: this.store,
	        cm: this.cm,
	        trackMouseOver:false,    
	        loadMask: true,
	        viewConfig:viewConfig,
	        bbar: new Ext.PagingToolbar({
	            pageSize: this.pageSize,
	            store: this.store,
	            displayInfo: true,
	            displayMsg: 'Displaying records {0} - {1} of {2}',
	            emptyMsg: "No record to display"
	        })
	   		});   		   		 
	this.add(this.grid);
	if(this.loadData)this.store.load();
	}     
});
 
MyCustomerList=Ext.extend(BaseGridList,{
	id:"myCustomerList",
	title:"���Ƽ����û�",
	
	url:"?cmd=myCustomerList",	
   	storeMapping:["id","im","user",{name:"userName",mapping:"user.name"},"tel","applyTime","paymentTime","sums","confirmTime","expireTime","remark","status","gift","delivery","paymentType","linkMan"], 
    userRender:function(v){
    	return v?v.name:"δ֪ԭ��";
    },
    emailRender:function(v){
    	return v?v.email:"δ֪ԭ��";
    },
	initComponent : function(){	
	this.cm=new Ext.grid.ColumnModel([    
    		{header: "������", sortable:true,width:100, dataIndex:"user",renderer:this.userRender},
    		{header: "״̬", sortable:true,width: 60, dataIndex:"status"},
    		{header: "im", sortable:true,width: 100, dataIndex:"im"},
    		{header: "email", sortable:true,width: 100, dataIndex:"user",renderer:this.emailRender},
    		{header: "��������", sortable:true,width:100, dataIndex:"applyTime",renderer:this.dateRender()},
			{header: "֧������", sortable:true,width: 100, dataIndex:"paymentTime",renderer:this.dateRender()},
			{header: "���", sortable:true,width: 50, dataIndex:"sums"},
			{header: "ȷ������", sortable:true,width:100, dataIndex:"confirmTime",renderer:this.dateRender()},
			{header: "��ע", sortable:true, dataIndex:"remark"}
        ]);		
	MyCustomerList.superclass.initComponent.call(this);
	}     
});

ArticleList=Ext.extend(BaseGridList,{
	id:"articleList",
	title:"�����б�",	
	url:"topic.ejf?cmd=list",	
	gridViewConfig: {
            forceFit:true,
            enableRowBody:true,
            showPreview:true,
            getRowClass : function(record, rowIndex, p, store){
                if(this.showPreview){
                    p.body = '<p>ժҪ1��'+record.data.intro+'</p><br/>';
                    return 'x-grid3-row-expanded';
                }
                return 'x-grid3-row-collapsed';
            }
        },
    storeMapping:["id","elite","title","intro","readTimes","category","inputTime","comments","content","vip",{name:"op",mapping:"id"}],
    userRender:function(v){
    	return v?v.name:"δ֪ԭ��";
    },
    topicRender:function(value, p, record){    
    	return String.format('<b><a href="javascript:main.openUrl(\'portal.ejf?cmd=topicShow&id={0}&my=true\',\'viewArticle\',\'��������\')">{1}</a></b><br/>',record.id,value)
    },
    categoryRender:function(value,p,record)
	{
		if(!value)return "";
		else return value.name;
	},
	commentsRender:function(value, p, record){   
    	return value?value.length:0;
    }, 
    booleanRender:function(value, p, record){    
    	return value?"��":"��";
    }, 
    emailRender:function(v){
    	return v?v.email:"δ֪ԭ��";csdfsdfs
    },
	initComponent : function(){	
	this.cm=new Ext.grid.ColumnModel([	  		
  		{        
           header: "����",
           dataIndex: 'title',
           width:300,
           renderer:this.topicRender
        },
        {        
	           header: "VIP",
	           dataIndex: 'vip',
	           width:70,
	           renderer:this.booleanRender
	        },
	       {        
	           header: "�Ƽ�",
	           dataIndex: 'elite',
	           width:70,
	           renderer:this.booleanRender
	        },
	        {
           header: "������Ŀ",
           dataIndex: 'category',
           width: 100,
           renderer:this.categoryRender
        }
        ,{
           header: "�����",
           dataIndex: 'readTimes',
           width: 60,
           align: 'center'
        },{
           header: "������",
           dataIndex: 'comments',
           width: 60 ,
           renderer:this.commentsRender         
        },{          
           header: "����ʱ��",
           dataIndex: 'inputTime',
           width: 120,renderer:this.dateRender()
        }]);		
	ArticleList.superclass.initComponent.call(this);
	}     
});
PhotoList=Ext.extend(BaseGridList,{
	id:"photoList",
	title:"��Ƭ�б�",	
	url:"album.ejf?cmd=list",	
	gridViewConfig: {
            forceFit:true,
            enableRowBody:true,
            showPreview:true,
            getRowClass : function(record, rowIndex, p, store){
                if(this.showPreview){
                    p.body = '<div class="photo"><img src="'+record.data.path+'"></div><div class="sumary">ժҪ��'+record.data.intro+'</div>';
                    return 'x-grid3-row-expanded';
                }
                return 'x-grid3-row-collapsed';
            }
        },
    storeMapping:["id","title","intro","path","category","readTimes","inputTime","comments","content",{name:"op",mapping:"id"}],
    userRender:function(v){
    	return v?v.name:"δ֪ԭ��";
    },
    titleRender:function(value, p, record){    
    	return String.format('<b><a href="javascript:previewPhoto(\'{0}\')">{1}</a></b><br/>',record.data.path,value);
    },
    categoryRender:function(value,p,record)
	{
		if(!value)return "";
		else return value.name;
	},
	commentsRender:function(value, p, record){   
    	return value?value.length:0;
    }, 
    booleanRender:function(value, p, record){    
    	return value?"��":"��";
    }, 
    emailRender:function(v){
    	return v?v.email:"δ֪ԭ��";
    },
	initComponent : function(){	
	this.cm=new Ext.grid.ColumnModel([{        
           header: "����",
           dataIndex: 'title',
           width: 300,
           renderer:this.titleRender
        },
        {        
           header: "Category",
           dataIndex: 'category',
           width:100,
           renderer:this.categoryRender
        },
        {
           header: "�����",
           dataIndex: 'readTimes',
           width: 70,
           align: 'center'
        },{
           header: "������",
           dataIndex: 'comments',
           width: 70   ,
           renderer:this.commentsRender            
        },{          
           header: "����ʱ��",
           dataIndex: 'inputTime',
           width: 120,renderer:this.dateRender()
        }]); 		
	PhotoList.superclass.initComponent.call(this);
	}     
});

CodeListPanel=Ext.extend(Ext.Panel,{
	id:"codeListPanel",
	title:"ʵ��Դ��",
	layout:"fit",	
	loadData:false,	
	closable: true,
	border:false,
	layoutConfig:{columns:2},
  	autoScroll:true,
  	openUrl:function(url){
  		if(url)
  		window.open(url);
  		
  	},
	initComponent : function(){
	var codes=[{title:"���������",
				html:"��Viewport����һ����ʾ����ܣ�����Ӧ�ÿ���ֱ��ʹ�øÿ����Ϊ������ֱ�Ӵ!",
				intro:"http://www.vifir.com/entry/view/917504.html",
				demo:"http://www.vifir.com/resources/records/codes/framework1/framework1.html",
				download:"http://www.vifir.com/portal.ejf?cmd=downloadVipFile&name=codes/framework1.zip"
				},
			   {title:"DWRStore",
			   intro:"http://www.vifir.com/entry/view/917505.html",
			   demo:"http://www.vifir.com/resources/records/codes/dwrstore/dwrstore.html",
			   download:"http://www.vifir.com/portal.ejf?cmd=downloadVipFile&name=codes/dwrstore.zip",
			   html:"ֱ�ӿ��������������Զ�̽ű����õı�����ݣ��ʺ����EasyJWeb�е�Զ�̽ű��������桢DWR��ܵ�ʹ��!"},
			   {title:"�Զ����ɻ���ExtJS�ı����ɾ�Ĳ�",
			   intro:"http://www.vifir.com/entry/view/917507.html",
			   demo:"http://www.blogjava.net/williamraym/archive/2008/03/20/187451.html",
			   download:"http://www.vifir.com/portal.ejf?cmd=downloadVipFile&name=codes/extjs-crud-template.zip",
			    html:"����Ҫ����Ҳ����ҪдJS��ֻ��Ҫһ��Entity(ʵ��ģ��)��Ȼ��һ������͸㶨��ɾ�Ĳ�Ӧ��!"},
			   {title:" �����ϷŴ���DWRTreeLoader",
			   intro:"http://www.vifir.com/entry/view/917506.html",
			   demo:"http://www.vifir.com/resources/records/codes/ddtree/ddtree.html",
			   download:"http://www.vifir.com/portal.ejf?cmd=downloadVipFile&name=codes/ddtree.zip",
			    html:"��ʾ���ʵ�����������ϷŲ������Ϸź���δ����!"},
			    
			   {title:"ExtJS��Զ�̽�����ʾ",
			    html:""},  	
			    
			   {title:"����EJS+ExtJS�ļ򵥹���",
			    demo:"http://www.vifir.com/resources/records/codes/ejs/ejse.html",
			   intro:"http://www.vifir.com/entry/view/1212416.html",
			   download:"http://www.vifir.com/portal.ejf?cmd=downloadVipFile&name=codes/ejse.zip",
			    html:"EasyJWeb1.1+Spring2.5+JPA(Hibernate3.2)+ExtJS2.0��Ӧ�ó���Ǽ�"},
			    
			   {title:"����SSH+ExtJS�ļ򵥹���1",
			   	demo:"http://www.vifir.com/resources/records/codes/ssh2/ssh1.html",
			    intro:"http://www.vifir.com/entry/view/1179671.html",
			    download:"http://www.vifir.com/portal.ejf?cmd=downloadVipFile&name=codes/ssh1.zip",
			    html:"Struts1.2+Spring2+Hibernate3.2+ExtJS2.0��Ӧ�ó���򵥹���"},
			    
			   {title:"����SSH+ExtJS�ļ򵥹���2",
			   demo:"http://www.vifir.com/resources/records/codes/ssh2/ssh2.html",
			   intro:"http://www.vifir.com/entry/view/1310720.html",
			   download:"http://www.vifir.com/portal.ejf?cmd=downloadVipFile&name=codes/ssh2.zip",
			    html:"Struts2.0+Spring2.5+Hibernate3.2+ExtJS2.0��Ӧ�ó���Ǽ�"},
			    {title:"Wlr���û�Blog�ۺ�ʵ��1",
			   intro:"http://www.vifir.com/entry/view/8.html",
			   demo:"http://wlr1.easyjf.com",
			   download:"http://www.vifir.com/download.html",
			    html:"��ExtJS�����ĵ��û�Blogϵͳ����һ���Ƚ��ۺϵ�ʵ�����Ƚ��ʺ���һ�������߲ο�����̨ʹ��Javaƽ̨����������ΪEJS��"},
			    {title:"Wlr���û�Blog�ۺ�ʵ��2",
			     intro:"http://www.vifir.com/entry/view/1245184.html",
			   demo:"http://wlr2.easyjf.com",
			   download:"ftp://ftp1.easyjf.com/easyjweb/demo/blog2.zip",
			    html:"Wlr���û�Blogϵͳ������һ���汾��ֱ��ͨ��дjava����������ExtJS��Ӧ�ã���������ΪEJS��"},
			    {title:"Wlr���û�Blog�ۺ�ʵ��3",
			    intro:"http://www.vifir.com/entry/view/1245184.html",
			    demo:"http://www.vifir.com/resources/records/codes/wlrblog-net/wlrblog-net.html",
			    download:"http://www.vifir.com/download/extblog-net.zip",
			    html:"��̨ʹ��.Netƽ̨��Wlr���û�Blogϵͳ��"},
			    {title:"Wlr���û�Blog�ۺ�ʵ��4",
			    html:"����Phpƽ̨��Wlr���û�Blogϵͳ��"} ];	
	for(var i=0;i<codes.length;i++)codes[i]=Ext.apply(codes[i],{border:true,height:115,tbar:[{text:"����",cls:"x-btn-text-icon",icon:"images/xiangqing.gif",handler:this.openUrl.createCallback(codes[i].intro),disabled:!codes[i].intro},{text:"��ʾ",cls:"x-btn-text-icon",icon:"images/yanshi.gif",handler:this.openUrl.createCallback(codes[i].demo),disabled:!codes[i].demo},{text:"����",cls:"x-btn-text-icon",icon:"images/download.gif",handler:this.openUrl.createCallback(codes[i].download),disabled:!codes[i].download}]});
	var items1=[],items2=[],items3=[];
	for(var i=0;i<4;i++)items1[items1.length]=codes[i];
	for(var i=4;i<8;i++)items2[items2.length]=codes[i];
	for(var i=8;i<12;i++)items3[items3.length]=codes[i];
	CodeListPanel.superclass.initComponent.call(this);
	var p=new Ext.Panel({border:false,layout:"column",defaults:{border:false},items:[{columnWidth:.33,autoScroll:true,layout:"form",layoutConfig:{columns:5},items:items1},{columnWidth:.33,layout:"form",autoScroll:true,layoutConfig:{columns:5},items:items2},{columnWidth:.34,layout:"form",autoScroll:true,layoutConfig:{columns:5},items:items3}]});
	this.add(p);
	}     
});

MettingListPanel=Ext.extend(Ext.Panel,{
	id:"mettingListPanel",
	title:"���߿���",
	layout:"fit",	
	loadData:false,
	closable: true,
	border:false,
	layoutConfig:{columns:2},
  	autoScroll:true,
  	save:function(){
  		var id=this.fp.form.findField("id").getValue();		
		this.fp.form.submit({
				waitMsg:"���ڱ��档����",
	            url:"chatRoom.ejf?cmd="+(id?"update":"save"),
	            method:'POST',
	            success:function(){
	           	this.closeWin();
	           	this.refresh();          	
	            },
	            scope:this
		});	
  	},  	
  	closeWin:function(){
  		if(this.win)this.win.hide();
  	},
  	edit:function(r){
  		this.createWin();
  		this.fp.form.loadRecord(r);
  	},
  	refresh:function(){
  		if(this.panel.items){
  			this.remove(0);
  			this.panel=new Ext.Panel({autoScroll:true});
			this.add(this.panel);
			this.doLayout();
  		}
  		this.store.reload();
  	},
  	createWin:function(){
  		if(!this.win){
  			this.win=new Ext.Window({title:"�����¿���",iconCls:"icon-application",width:500,height:440,closeAction:"hide"});
  			this.fp=new Ext.form.FormPanel({frame:true,defaultType:"textfield",
  			labelWidth:100,		
        	labelAlign:'right',
        	defaults:{width:330},
  			items:[
  				{xtype:"hidden",name:"id"},
	  			{fieldLabel:"��������",name:"title"},
	  			{fieldLabel:"����",name:"teacher"},
	  			{fieldLabel:"�����������",name:"maxUser"},
	  			{fieldLabel:"��ʼʱ��",xtype:"datefield",name:"beginTime",format:"Y-m-d G:i:s"},
	  			{fieldLabel:"����ʱ��",xtype:"datefield",name:"endTime",format:"Y-m-d G:i:s"},
	  			{fieldLabel:"ˢ��ʱ��",name:"intervals"},
	  			{fieldLabel:"����Ȩ��",name:"vrtype"},
	  			{fieldLabel:"��������",xtype:"textarea",name:"intro",height:100},
	  			{fieldLabel:"���ù���",xtype:"textarea",name:"announce"}
  			],
  			buttons:[{text:"����",handler:this.save,scope:this},{text:"ȡ��",handler:this.closeWin,scope:this}]});
  		
  		this.win.add(this.fp);
  		}
  		this.fp.form.reset();
  		this.win.show();
  	},
	initComponent : function(){	
	this.tbar=[{text:"�����¿���",cls:"x-btn-text-icon",icon:"images/application.gif",handler:this.createWin,scope:this},{text:"ˢ��",cls:"x-btn-text-icon",icon:"images/core/refresh.gif",handler:this.refresh,scope:this}];
	this.bbar=[""];
	MettingListPanel.superclass.initComponent.call(this);
	this.store=new Ext.data.JsonStore({
    url: 'chatRoom.ejf?cmd=list',
    root: 'result',
    fields: ['id', 'title',"intro","announce","teacher","beginTime","endTime","talkMode","intervals","vrtype","owner","status","currentUsers","maxUser","inputTime","statusInfo"]
	});
	this.store.on("load",function(store,records){		
		for(var i=0;i<records.length;i++){
		this.panel.add({height:100,
			title:records[i].data.title,
			html:records[i].data.intro,
			tbar:["<img src='images/fettle.gif'/>","״̬:","<font color=blue>"+records[i].data.statusInfo,"-",
			      "<img src='images/core/start.gif'/>","����ʱ��:","<font color=blue>"+records[i].data.inputTime.format("Y-m-d H:i:s"),"-","<img src='images/applicationpop.gif'/>","������:<font color=blue>"+records[i].data.owner+"</blue>",
			      "->",{text:"�������",cls:"x-btn-text-icon",icon:"images/metting.gif",handler:MettingManager.joinMeeting.createDelegate(MettingManager,[records[i].data.id])},{text:"�޸�",cls:"x-btn-text-icon",icon:"images/core/edit.gif",handler:this.edit.createDelegate(this,[records[i]]),scope:this},{text:"ɾ��",cls:"x-btn-text-icon",icon:"images/core/delete.gif",handler:MettingManager.removeMetting.createCallback(records[i].data.id)},{text:"����",cls:"x-btn-text-icon",icon:"images/ho.gif",handler:MettingManager.startMetting.createCallback(records[i].data.id)},{text:"ֹͣ",cls:"x-btn-text-icon",icon:"images/logout.gif",handler:MettingManager.stopMetting.createCallback(records[i].data.id)},"   "]
			});	
		}
		this.panel.doLayout();
	},this);
	this.store.load();
	this.panel=new Ext.Panel({autoScroll:true});
	this.add(this.panel);
	/*var tpl = new Ext.XTemplate(
    '<tpl for=".">',
        '<div class="thumb-wrap" id="{id}"><h3>{title}   ״̬��{statusInfo}</h3>',
        '<div class="thumb">����:{announce}</div>',
        '<span class="x-editable">��飺{intro}</span><a href="#" onclick="MettingManager.joinMeeting({id})">�������>></a>    <a href="#" onclick="MettingManager.startMetting({id})">��������</a></div><hr/>',
    '</tpl>',
    '<div class="x-clear"></div>'
	);
	this.add(new Ext.DataView({
        store: this.store,
        tpl: tpl,
        autoHeight:true,
        multiSelect: true,
        overClass:'x-view-over',
        itemSelector:'div.thumb-wrap',
        emptyText: '��ǰû���κο��ÿ���!'
    }));*/
	},
	onRender : function(ct, position){
	 	MettingListPanel.superclass.onRender.call(this, ct, position);
	 	//this.el.on("click",function(){MettingManager.winMgr.hideAll();});
	 }     
});



UserCategoryManage=function()
{
this.storeMapping=["id","name","intro",{name:"op",mapping:"id"}	];
this.operationRender=function(obj){
	return !obj||obj=="-1"?"":"<a href='javascript:removeTopicCategory("+obj+")'>ɾ��</a>";
	};
this.store=new Ext.data.DWRStore({		
  		id:"id",
  		fn:userCategoryService.getUserCategoryBy,  		
  		root:"result",
  		totalProperty:"rowCount",
  		remoteSort:true,  		
    	fields:this.storeMapping
  		});
this.cm=new Ext.grid.ColumnModel([
		new Ext.grid.RowNumberer({header:"���",width:40,sortable:true}),
		{header: "��������",width:120,dataIndex:"name",editor: new Ext.form.TextField({				   
	               allowBlank: false
	           })},
		{header: "���",dataIndex:"intro",editor:new Ext.form.TextField()}
		]);	
this.store.paramNames.sort="orderBy";// �ı������������
this.store.paramNames.dir="orderType";// �ı��������Ͳ�������
this.cm.defaultSortable=true;
this.grid=new Ext.grid.EditorGridPanel({
			id:"userCategoryGrid",	
 			store:this.store,
  			cm:this.cm, 
        	loadMask: true,
        	clicksToEdit:1,
        	autoExpandColumn:2,
        	frame:true,
 			region:"center",
 			tbar: [
				{                 
                   text:"��������",
				   cls:"x-btn-text-icon",
				   icon:"images/core/add.gif",
                   handler:this.addCategory,
                   scope:this                 
				}, {                 
                   text:"ɾ������",
				   cls:"x-btn-text-icon",
				   icon:"images/core/delete.gif",
                   handler:this.removeCategory,
                   scope:this      
				},
				{                 
                   text:"ˢ��",
				   cls:"x-btn-text-icon",
				   icon:"images/core/refresh.gif",
                   handler:this.refresh,
                   scope:this      
				},' ',new Ext.Toolbar.Fill(),"��ѯ"
            ]
		});
this.grid.on("afteredit",this.afterEdit,this);
this.tree=new  Ext.tree.TreePanel({title:"��������",
 			region:"west",
 			width:150, 	
 			rootVisible:false,
 			lines:false,		
 			root:new Ext.tree.TreeNode({
 				id:"root",
   				expanded:true
   				})
 			});
this.tree.root.appendChild(new Ext.tree.TreeNode({id:"article",text:"���·���",iconCls:"icon-article"}));
this.tree.root.appendChild(new Ext.tree.TreeNode({id:"photo",text:"��Ƭ����",iconCls:"icon-img"}));
this.tree.root.appendChild(new Ext.tree.TreeNode({id:"movie",text:"��Ƶ����",iconCls:"icon-video"}));
this.tree.on("click",function(node,eventObject){
	if(node!=this.tree.root){
	this.store.removeAll();
	this.store.baseParams={types:node.id};
	this.store.load();
	}
},this);
UserCategoryManage.superclass.constructor.call(this, {
		id:"userCategoryPanel",
		title:"������Ϣ����",
		closable: true,
  		autoScroll:true,
  		layout:"border",
 		items:[this.tree, this.grid]           
   	 });
this.store.load({params:{types:"article"}});
}; 
Ext.extend(UserCategoryManage, Ext.Panel,{
	refresh:function(){
		this.store.removeAll();
		this.store.reload();
	},
	addCategory:function(){
	    var create=Ext.data.Record.create(this.storeMapping);
	  	var obj=new create({id:'-1',name:'',intro:''});
		this.grid.stopEditing();
		this.store.insert(this.store.getCount(),obj);	
		this.grid.startEditing(this.store.getCount()-1, 0);
   	},
    removeCategory:function(){
    	var cell=this.grid.getSelectionModel().getSelectedCell();
    	if(!cell){
    		Ext.Msg.alert("��ʾ","����ѡ��Ҫ��������!");
    		return false;
    	}
    	var record=this.grid.getStore().getAt(cell[0]);
    	var id=record.get("id");
    	var tree=this.tree;
    	var store=this.store;
	   	var m=Ext.MessageBox.confirm("Confirm","�Ƿ����Ҫɾ�����ݣ�",function(ret){	   		
			if(ret=="yes"){				
				userCategoryService.delUserCategory(id,function(ret){					
					store.remove(store.getById(id));
				});				
			}
		}
		);
   	},
   	afterEdit:function(obj){   		
	   	var r=obj.record;
		var id=r.get("id");
		var name=r.get("name");
		var c=this.record2obj(r);
		var tree=this.tree;
		var node=tree.getSelectionModel().getSelectedNode();
		c.types=node?node.id:"article";	
		if(id=="-1" && name!=""){					
			userCategoryService.addUserCategory(c,function(ret){
				if(ret)r.set("id",ret);
				obj.grid.store.reload();				
			});
		}
		else if(name!="")
		{	
			userCategoryService.updateUserCategory(r.get("id"),c,function(ret){					
			});
		}
   	},
   	record2obj:function(r)
	{
		return {name:r.get("name"),
		intro:r.get("intro")
		};
	}
});




function previewPhoto(url){
	photoPreview.el.dom.firstChild.src=url;
	photoPreview.el.center();
	photoPreview.el.show(true);
}
function changePassword(){
	var changePasswordWin=new ChangePasswordWindow();
	Ext.get("desktop").mask();
	changePasswordWin.show();	
}
/********��ʱ��֪���������ʹ��
function login()
{
	OnlineMessageManager.stop();
	if(!loginWin)loginWin=new LoginWindow();
	Ext.get("desktop").mask("����û�е�¼�����ȵ�¼!");	
	loginWin.show();
}
**********/
function logout(){
	Ext.Msg.confirm("������ʾ","�Ƿ����Ҫע����ǰ�û�?",function(btn){
		if(btn=="yes"){
			location = '/logout.jsp';
		}	
	});
}


function addTab(strTitle, strNodeId, strHref){
	main.add(new Ext.Panel({
                    id:strNodeId,
                    title:strTitle,
                    autoScroll:true,
                    closable:true,
                    html:"<div style='height:100%;height:100%'>"
                        +"<iframe id='ifrm_"+strNodeId+"' name='ifrm_"+strNodeId+"' src='"+strHref+"' " 
                        +"width='100%' height='100%' frameborder=0/>"
                        +"</div>"
                }))
}
