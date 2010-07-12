function cEditGrid(cfg){
	var cols=cfg.items;
	//�����ȡ���еķ���
    function getFields(arr){
       var cols=new Array();
       
       for(var i=0;i<arr.length;i++){
       	   var o=arr[i];
           cols.push(o.name);
           if(o.code) cols.push(o.name+"_text");
       }
       cols.push("selected");
       return cols;
    }
    
    //����������ģʽ
    function getRowData(arr){
       var cols=new Array();
       
       for(var i=0;i<arr.length;i++){
       	   var o=arr[i];
           cols.push({name:o.name,type:"string"});
           if(o.code) cols.push({name:(o.name+"_text"),type:"string"});
       }
       cols.push({name:"selected",type:"bool"});
       return cols;
    }
    
    var SaveEvent=function(){
    	var c=Ext.apply({},cfg);
    	var g=getCmp(c.id);
    	doPost(c.saveAction,g.store.data,function(e){reload(c.id);});
    }
    
    //�����ȡtoolBar����
    function getToolBar(){
       var arr=new Array();
       
       //������
       arr.push({
       	  text     : "������",
       	  tooltip  : '���һ���µļ�¼',
       	  iconCls  : 'gridItemAdd',
          handler  : function(){
       	   	            if(cfg.addHandler && !cfg.addHandler()){
       	   	                 	 return;
       	   	            }
          	            var dt={};
                        for(var i=0;i<cols.length;i++){
                        	var o=cols[i];
                        	dt[o.name]="";
                        	if(o.code) dt[o.name+"_text"]="";
                        }
                        dt["row_select_option"]=true;
                        if(getCmp(cfg.id).getStore().lastOptions){
                          Ext.apply(dt,getCmp(cfg.id).getStore().lastOptions.params);
                        }
                        grid.stopEditing();
                        store.insert(0, new RowData(dt));
                        grid.startEditing(0, 0);
                     }
       });
       arr.push("-");
       //���水ť
       arr.push({
       	   text         : "��������",
       	   tooltip      : "�����ݱ��浽��̨���ݿ�,û��ѡ�е��ں�̨��ɾ����",
       	   iconCls      : "gridBarItemSave",
       	   handler      : function(){
       	   	                 if(cfg.saveHandler && !cfg.saveHandler()){
       	   	                 	 return;
       	   	                 }
       	   	                 
                             Ext.MessageBox.confirm('ȷ���ύ��', '�����ݱ��浽��̨���ݿ�,û��ѡ�е��ں�̨��ɾ����<br>���Ƿ�ȷ��Ҫ�ύ����', SaveEvent);
       	                  }
       	
       });
       return arr;
    }
    
    var checkColumn= new Ext.grid.CheckColumn({
        header: "ѡ��?",
        dataIndex: 'selected',
        width: 55
     });
    
    //�����ȡ��ģʽ����
    function getColumnModels(arr){
        var cms=new Array();
        for(var i=0;i<arr.length;i++){
        	var o=arr[i];
        	var c={
        		header     : o.label,
        		dataIndex  : (o.code)?(o.name+"_text"):o.name,
        		dataName   : o.name,
        		width      : o.width,
        		hidden     : false,
        		autoSize   : true
        	};
        	if(o.hidden==true || o.hide=="grid" || o.hide=="all" || o.code){
        		c.hidden=true;
        	}	
        	if(!o.xtype){
        		cms.push(c);
        		continue;
        	}
        	
        	c["editor"]=new Ext.form.TextField();
            
        	if(o.code){
        	     var c1={
        	     	header     : o.label,
        	     	dataIndex  : (o.code)?(o.name+"_text"):o.name,
        	     	dataName   : o.name,
        	     	width      : o.width,
        	     	hidden     : false,
        	     	renderer   : null
        	     };
        	     
  	     
        	     if(o.xtype=="combo"){
        	     	var store=new Ext.data.SimpleStore({fields:["value","label"],autoLoad:true,url:toURL(o.code+".to")});
        	     	c1.editor=new Ext.form.ComboBox({
                         typeAhead      : true,
                         triggerAction  : 'all',
                         displayField   : "label",
                         valueField     : "value",
                         style          : "margin:-1px 0",
                         //transform      : 'light',
                         lazyRender     : true,
                         listClass      : 'x-combo-list-small',
                         hiddenName     : o.name,
                         name           : o.name,
                         store          : store
                         
        	     	});
        	     	store.load();
        	     	c1.renderer=Ext.grid.ComboBoxRenderer(c1.editor);
        	     	
        	     }
        	     cms.push(c1);
        	}

        	if(o.xtype=="number"){
        		c.editor=new Ext.form.NumberField({
        			 handler   : function(){alert("sss");}
        		});
        	}
        	
        	if(o.xtype=="datetime"){
        		c.editor=new Ext.form.DateTimeField({
        			 value  : new Date()
        		});
        	}
        	
       	
        	cms.push(c);
        	c=null;o=null;
        }
        
        if(cfg.check==true) cms.push(checkColumn);
        
       
        return new Ext.grid.ColumnModel(cms);
    }
    //���������ݶ���
    var RowData=Ext.data.Record.create(getRowData(cfg.items));
    //������
    var storeD= new Ext.data.JsonStore( {
        root           : 'rowSet',
        totalProperty  : 'totalCount',
        idProperty     : cfg.id,
        url:toURL(cfg.url),
        fields         : getFields(cfg.items)
   });
	
	
    //����һ��������
    var grid=new Ext.grid.EditorGridPanel({
    	 store            : storeD,
    	 cm               : getColumnModels(cfg.items),
    	 width            : cfg.width,
    	 height           : cfg.height,
    	 //autoExpandColumn : 'common',
    	 region           : cfg.region,
    	 title            : cfg.title,
         sm:new Ext.grid.RowSelectionModel({    
             singleSelect:(cfg.singleSelect==true),
             listeners:{rowselect:(cfg.rowselect)?cfg.rowselect:function(){}}
     }),  
    	 //frame            : true,
    	 loadMask         : true,
    	 clicksToEdit     : 1,
    	 tbar             : (cfg.tbar || cfg.tbarDisable==true)?cfg.tbar:getToolBar(),
    	 id               : cfg.id,
    	 plugins          : (cfg.check==true)?checkColumn:null,
    	 buttons		  : cfg.buttons,
    	 listeners:{rowclick:(cfg.rowclick)?cfg.rowclick:function(){}}
    });
    
    
    //��ʼ�����
    if(!(cfg.firstLoad==false) && !isNull(cfg.url)) storeD.load();
    
    //�������¼�
    
    return grid;
}

Ext.grid.ComboBoxRenderer = function(combo) {
  return function(value) {
    var idx = combo.store.find(combo.valueField, value);
    var rec = combo.store.getAt(idx);
    if(!rec) return "";
    return rec.get(combo.displayField);
  };
}

Ext.grid.CheckColumn = function(config){
    Ext.apply(this, config);
    if(!this.id){
        this.id = Ext.id();
    }
    this.renderer = this.renderer.createDelegate(this);
};

Ext.grid.CheckColumn.prototype ={
    init : function(grid){
        this.grid = grid;
        this.grid.on('render', function(){
            var view = this.grid.getView();
            view.mainBody.on('mousedown', this.onMouseDown, this);
        }, this);
    },

    onMouseDown : function(e, t){
        if(t.className && t.className.indexOf('x-grid3-cc-'+this.id) != -1){
            e.stopEvent();
            var index = this.grid.getView().findRowIndex(t);
            var record = this.grid.store.getAt(index);
            record.set(this.dataIndex, !record.data[this.dataIndex]);
        }
    },

    renderer : function(v, p, record){
        p.css += ' x-grid3-check-col-td'; 
        return '<div class="x-grid3-check-col'+(v?'-on':'')+' x-grid3-cc-'+this.id+'">&#160;</div>';
    }
};