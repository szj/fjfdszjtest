<%@ page language="java"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
String path = request.getContextPath();
%>
<html>
<head>
<title>��վ�̳�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="<%=path %>/css/ext.css" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=path %>/include/ext/resources/css/ext-all.css" />
<!-- ͼ����ʽ CSS ��Ϣ -->
    <!-- GC -->
 	<!-- LIBS -->
 	<script type="text/javascript" src="<%=path %>/include/ext/adapter/ext/ext-base.js"></script>
 	<!-- ENDLIBS -->
 	
    <script type="text/javascript" src="<%=path %>/include/ext/ext-all.js"></script>
    
	<!-- ������ʾ��Ϣ֧�� -->
	<script type="text/javascript" src="<%=path %>/include/ext/source/locale/ext-lang-zh_CN.js"></script>
   <script type="text/javascript" src="<%=path %>/include/ext/miframe.js"></script>
   <script type="text/javascript" src="<%=path %>/include/ext/ThemeChanger.js"></script>
   
  <script type='text/javascript' src='<%=path %>/dwr/interface/UserService.js'></script>
  <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>



<script type="text/javascript">
<!--

Ext.BLANK_IMAGE_URL = '<%=path %>/include/ext/resources/images/default/s.gif';

Ext.example = function(){
	
    //----��������
    var msgCt;

    function createBox(t, s){
        return ['<div class="msg">',
                '<div class="x-box-tl"><div class="x-box-tr"><div class="x-box-tc"></div></div></div>',
                '<div class="x-box-ml"><div class="x-box-mr"><div class="x-box-mc"><h3>', t, '</h3>', s, '</div></div></div>',
                '<div class="x-box-bl"><div class="x-box-br"><div class="x-box-bc"></div></div></div>',
                '</div>'].join('');
    }
    return {
        msg : function(title, format){
            if(!msgCt){
                msgCt = Ext.DomHelper.insertFirst(document.body, {id:'msg-div'}, true);
            }
            msgCt.alignTo(document, 't-t');
            var s = String.format.apply(String, Array.prototype.slice.call(arguments, 1));
            var m = Ext.DomHelper.append(msgCt, {html:createBox(title, s)}, true);
            m.slideIn('t').pause(1).ghost("t", {remove:true});
        }
    };
}();




//-----------EXT


Ext.onReady(function(){
  
   Ext.QuickTips.init();


   Ext.state.Manager.setProvider(new Ext.state.CookieProvider({
        path: "/",
        expires: new Date(new Date().getTime()+(1000*60*60*24*30)) //30 days
    }));

   Ext.form.Field.prototype.msgTarget = 'side';

   
   var form = new Ext.form.FormPanel({
        baseCls: 'x-plain',
        labelWidth: 80,
        defaultType: 'textfield',

        items: [
        {
            fieldLabel: 'ԭ����',
            id: 'oldpass',
            name: 'oldpass',
            inputType: 'password',
            allowBlank:false,
            maxLength: 16,
            width: 200,
            blankText:'��������ԭ���룡'
            
        },
        {
            fieldLabel: '������',
            id: 'newpass1',
            name: 'newpass1',
            width: 200,
            inputType: 'password',
            maxLength: 16,
            allowBlank:false,
            blankText:'�����������룡'
        },
        {
            fieldLabel: '����ȷ������',
            id: 'newpass2',
            name: 'newpass2',
            inputType: 'password',
            width: 200,  
            maxLength: 16,
            allowBlank:false,
            blankText:'���ٴ�ȷ�����������룡'
        }
        ]
    });


        var win = new Ext.Window({
        
        title: '�޸��û���¼����',
        width: 380,
        height:180,
        minWidth: 300,
        minHeight: 150,
        layout: 'fit',
        iconCls: 'changepasswd',
        plain:true,
        modal : true,
        bodyStyle:'padding:5px;',
        buttonAlign:'center',
        items: form,
        animEl: 'changepwd',

        buttons: [{
                    text:'����',
                    handler: function(){
         
                        
                        if(!form.getForm().isValid()) {
                           
                           Ext.Msg.alert("������!","�޷��������ݣ��б�����δ����!");
                           return;
                        }
                            
                        var oldpass=Ext.get('oldpass').dom.value;
                        var newpass1=Ext.get('newpass1').dom.value;
                        var newpass2=Ext.get('newpass2').dom.value;
                        
                        if(newpass1!=newpass2) {
                           
                           Ext.Msg.alert("������!","��������������Ĳ�һ��!");
                           return;
                        } 
                        
                     
                        Ext.Msg.wait("��Ⱥ�", "������", "����������..."); 
                        UserService.changePwd('<%=request.getSession().getAttribute("adminId")%>', oldpass, newpass1, function(data) {
            		       if(data) {
		                      Ext.get('oldpass').dom.value="";
		                      Ext.get('newpass1').dom.value="";
		                      Ext.get('newpass2').dom.value="";
		                      Ext.Msg.alert("�ɹ�","��ϲ���޸ĸ��˵�¼����ɹ�!");		                
		                
    				       } else {
							  Ext.Msg.alert("������!","�Բ����޸ĸ��˵�¼����ʧ��!");
				           }
				           win.hide();
            	        });
                        
                     }
                },
                {
                    text: 'ȡ��',
                    handler: function(){
                        win.hide();
                     }
                }]
            	
    });

    
    
    
    //------------------�˵�-------------------------------------------------------------
    
    var myThemeChanger = new Ext.ux.ThemeChanger({
        renderTo:'skin', // or use as a component in your layout
        preThemes: '<%=path %>/include/ext/resources/css/ext-all.css',
        //postThemes: ['css/app/corp.css','css/extux/Portal.css'],
        extThemes:  [
            ['Ĭ��', 'css/ext/xtheme-none.css'], // some non existent or blank file.
            ['��ɫ', '<%=path %>/include/ext/resources/css/xtheme-gray.css'],
            ['��ɫ', '<%=path %>/include/ext/resources/css/xtheme-olive.css'],
            ['��ɫ', '<%=path %>/include/ext/resources/css/xtheme-purple.css'],
            ['����ɫ', '<%=path %>/include/ext/resources/css/xtheme-slate.css'],
            ['��ɫ', '<%=path %>/include/ext/resources/css/xtheme-black.css']
        ],
        defaultTheme: 0,
        cssId: 'myThemeId',
        width: 120
    });
    

    var task = {
       run: function(){
          doRefresh();
       },
       interval: 30000
    }
    
    var taskMsg = {
       run: function(){
          MsgService.getNewMessageCount('JGBH'
                         ,'YHBH',function(data) {
             if(data>0)
                 Ext.fly('msgcount').update("<font color='red'><b>" + data + "</b></font>");
             else
                 Ext.fly('msgcount').update(data);
          });
       },
       interval: 5000
    }
            
  	
  	new Ext.form.ComboBox({
        typeAhead: true,
        triggerAction: 'all',
        transform:'RefreshInterval',
        width:120,
        editable: false,
        mode: 'local',
        listeners:{
          blur: function(){
             task.interval=this.getValue()*1000;
          }
        }
    });
    
     var tb = new Ext.Toolbar('toolbar-div');
     
     tb.add(
        new Ext.Toolbar.SplitButton({
	    text: 'ϵͳ',
	    cls: 'x-btn-text-icon blist',
	    iconCls: 'system',
	    width: 300,
	    menu : {
	    items: [
	      {id:'changepwd', text: '��������...', iconCls: 'changepasswd', handler: ChangePassword},
	       '-',
	      {text: '�˳�', iconCls: 'exit', handler: Logout}
	    ]}}),
	    '-',
	    <logic:present name="menu0list">
		<logic:iterate id="menu0" name="menu0list">
	    {
            text:'<bean:write name="menu0" property="MLMC"/>',
            iconCls: '<bean:write name="menu0" property="MLTB"/>',
            tooltip: {title:'<bean:write name="menu0" property="MLMC"/>',text:'<bean:write name="menu0" property="MLMS"/>'},
            handler: function (){
                 Ext.getCmp('leftFrame').expand();
  		         Ext.getCmp('leftFrame').setSrc('leftTree.do?mlbh=<bean:write name="menu0" property="MLBH"/>&mlmc=<bean:write name="menu0" property="MLMC"/>',true);
  	        }
        },
        '-',
	    </logic:iterate>
		</logic:present>
        '->',
	    new Ext.Toolbar.MenuButton({
	    text: '����',
	    cls: 'x-btn-text-icon blist',
	    iconCls: 'help',
	    menu : {items: [
	      {text: '����...', iconCls: 'about', handler: AboutClick}
	    ]}})
	    
	  );
	  

	////////////////////////////////////////////////////////////////////////////////////////
    ////  �û���Ϣ added by hongyanchuan
    ////////////////////////////////////////////////////////////////////////////////////////
    
    // ����һ����Ϣ����
    var Message = Ext.data.Record.create([
           {name: 'bh', type: 'string'}, //���
           {name: 'bt', type: 'string'},  //����
		   {name: 'nr', type: 'string'},  //����
		   {name: 'zt', type: 'string'},  //״̬
           {name: 'rq', type: 'string'}   //����
    ]);
    
    //������Ϣstore
    
     var msgStore = new Ext.data.Store({

        proxy: new Ext.data.HttpProxy({url:'<%=path %>/userMsg.do?action=getData'}),
        
        reader: new Ext.data.XmlReader(
          {
          	totalProperty: 'msgCount',
          	record: 'msg'
          }
           , 
          Message
        )
    	
        //sortInfo:{field:'bh', direction:'ASC'}// ������Ϣ
     });
    
     msgStore.load({params:{start:0, limit:10}});
     
     var ztRender=function(value){
     	if(value=='2'){
     		return "<span style='color:green;font-weight:bold'>�Ѷ�</span>";
     	}
     	return "<span style='color:red;font-weight:bold'>δ��</span>";
     };
     
     //��Ϣgrid��ͷ    
     var msgCM= new Ext.grid.ColumnModel([
     	{
     	   id:'bt',
           header: "����",
           dataIndex: 'bt',
           width: 100
     	},
     	{
     	   id:'zt',
           header: "״̬",
           dataIndex: 'zt',
           width: 40,
           renderer:ztRender
     	},
     	{
     	   id:'rq',
           header: "����",
           dataIndex: 'rq',
           width: 100
     	}
     ]);
     
     //��ϢGrid    
     var msgGrid = new Ext.grid.GridPanel({
        //width:700,
        //height:500,
        title:'�û���Ϣ',
        store: msgStore,
        cm: msgCM,
        trackMouseOver:false,
        border:false,
        header:false,
        //sm: new Ext.grid.RowSelectionModel({selectRow:Ext.emptyFn}),
        loadMask: {msg:'����������Ϣ...'},
        viewConfig: {
            forceFit:true,
            enableRowBody:true,
            showPreview:true,
            getRowClass : function(record, rowIndex, p, store){
                if(this.showPreview){
                    p.body = '<p>'+record.data.nr+'</p>';
                    return 'x-grid3-row-expanded';
                }
                return 'x-grid3-row-collapsed';
            }
        },
        bbar: new Ext.PagingToolbar({
            pageSize: 25,
            store: msgStore,
            displayInfo: false
            //displayMsg: '{0} - {1} of {2}',
            //emptyMsg: "û����Ϣ"
        }),
        tbar:[
        	{
        		text:"ˢ��",
        		iconCls:"refresh",
        		handler:function(){
        					msgStore.load();
        				}
        	},
        	{
        		text:"ɾ��",
        		iconCls:"remove",
        		handler:function(){
        					 var record = msgGrid.getSelectionModel().getSelected();// ����ֵΪ Record ����
                
				             if(!record){
								Ext.Msg.alert("��ʾ","����ѡ��Ҫɾ������!");
								return;
							 }else{
							 	Ext.MessageBox.confirm("ȷ��ɾ��","���Ҫɾ������Ϣ��",
							 		function(btn){
							 			if(btn=='yes'){
											MsgService.deleteMsg(record.data.bh,function(value){
												if(value==true){
													msgStore.load();
												}
											});						 			
							 			}
							 		}
							 	);
							 }  
        				}
        	}
        ]
    });

	msgGrid.addListener(
		'rowdblclick',
		function(grid,rowIndex,event){
			
			var record = msgGrid.getSelectionModel().getSelected();
			var bh= record.data.bh;
			var zt= record.data.zt;
			
			MsgService.getMsg(bh,function(msg){     		
	     		Ext.MessageBox.show(
	     			{
		     		title:msg.VXxbt,
		     		msg:msg.VXxnr,
		     		width:400,
		     		heigth:300,
		     		buttons:Ext.MessageBox.OK,
		     		fn:function(btn){
		     				if(zt!='2'){  //�����Ϣ״̬�����Ѷ�
				     			MsgService.setMsgReaded(bh,function(){
				     				msgStore.load();
				     			});
				     		} 
		     			}
	     			}
	     		);
	     		    		
     		});
		}
	);

    
    ////////////////////////////////////////////////////////////////////////////////////////
    ////  �û���Ϣ added by hongyanchuan ����
    ////////////////////////////////////////////////////////////////////////////////////////


	  var viewport = new Ext.Viewport({
            layout:'border',
            items:[
            {
                region:'north',
                border:false,
                contentEl:'north-div',
                height:105,
                minSize: 100,
                maxSize: 200,
                collapsible: true,
                split:true,
                useSplitTips: true,
                collapseMode: 'mini',
                layout:'border',
                items:[
                new Ext.BoxComponent({
                    region:'center',
                    el:'north-center',
                    height:79
                }),
                new Ext.BoxComponent({
                    region:'south',
                    el:'north-south',
                    height:26,
                    tbar:tb
                })]
                
            },{
                region:'west',
                id:'west-panel',
                title:'�˵�',
                iconCls: 'menu',
                split:true,
                width: 200,
                minSize: 160,
                maxSize: 400,
                collapsible: true,
                useSplitTips: true,
                useShim: true,
                layout:'accordion',
                layoutConfig:{
                    animate:true
                },
                items: [{
                    title:'����',
                    autoScroll:true,
                    border:false,
                    iconCls:'nav',
                    xtype: 'iframepanel',
                    id:'leftFrame',
                    defaultSrc : 'login.do?status=LeftTree',                        
                    frameBorder : 0,
                    width : '100%',
                    height : '100%',
                    loadMask:{msg:'��������˵�...'}
                },{
                    title:'����',
                    border:false,
                    autoScroll:true,
                    iconCls:'settings',
                    contentEl:'settings-div'
                }]
            },{
                region:'center',
                collapsible:true,
                contentEl:'center-div',
                xtype:"panel",
                title:"�������",
                header:false,
                iconCls: 'rightnav',
                tbar:[{
                      text:'����',
                      iconCls: 'goback',
                      tooltip: {title:'������һҳ',text:'������һ��ҳ��'},
                      handler: doGoBack
                   },
                   '-',
                   {
                      text:'ˢ��',
                      iconCls: 'refresh',
                      tooltip: {title:'ˢ��',text:'ˢ�µ�ǰҳ�棬�������ύҳ������'},
                      handler: doRefresh
                   },
                   '-',
                   {
                      text:'�Զ�ˢ��',
                      iconCls: 'autorefresh_s',
                      enableToggle:true,
                      tooltip: {title:'�Զ�ˢ��',text:'�ܹ��Զ���ʱˢ�½��棬�Զ���ˢ��ʱ���������'},
                      toggleHandler: doAutoRefresh
                   }]
            },{
                    region:'east',
                    id: 'rightpanel',
                    title: '������Ϣ',
                    iconCls: 'tabs',
                    //contentEl:'east-div',
                    collapsible: true,
                    //collapsed: true,
                    split:true,
                    width: 200,
                    minSize: 140,
                    maxSize: 400,
                    useSplitTips: true,
                    collapseMode: 'mini',
                    layout:'fit',
                    margins:'0 5 0 0',
                    items:msgGrid
            },
            
            
            new Ext.BoxComponent({
                region:'south',
                el:'south-div',
                height:24
            })]
        });
    
        
    function ChangePassword() {
       win.show();
    }
    
    function Logout(){   
        Ext.MessageBox.confirm('�˳�', 
		    	    	'�����Ҫ�˳���ϵͳ��?', 
		    	    	function(btn) {
			    	     if(btn == 'yes') {// ѡ�����ǰ�ť
			    	     	 window.location.href='<%=path %>/login.do?status=loginExit';
						 }
						}
					);
    }
  	
  	function AboutClick(item){
  		Ext.Msg.alert("����","��վ�̳�");
  	}
  	
  	function doRefresh() {
  	    top.mainFrame.location.reload();
  	}
  	
  	function doGoBack() {
  	    top.mainFrame.history.go(-1);
  	}
  	
  	function doAutoRefresh(item, pressed){
  	    if(pressed) { 
  	        this.setIconClass('autorefresh_b');
  	        Ext.example.msg('�Զ�ˢ��','ע�⣬�Զ�ˢ���Ѿ��򿪣�');
            Ext.TaskMgr.start(task);
        } else {
            this.setIconClass('autorefresh_s');
            Ext.example.msg('�Զ�ˢ��','ע�⣬�Զ�ˢ���Ѿ��رգ�');
            Ext.TaskMgr.stop(task);
        }
    }
    
    
    var btn = new Ext.CycleButton({
      showText: true,
      renderTo: 'btn',
      prependText: '���',
      items: [{
            text:'��',
            iconCls:'openmsg'
          },{
            text:'�ر�',
            iconCls:'closemsg',
            checked:true
          }], 
      changeHandler:function(btn, item){
          if(item.text=="��")
             Ext.TaskMgr.start(taskMsg);
          else
             Ext.TaskMgr.stop(taskMsg);
           
          Ext.Msg.alert("ע��","��Ϣ�����Զ�����״̬�Ѿ��л���"+item.text);
      }
    });
    
    function delCookie(name){
      var date = new Date();
      date.setTime(date.getTime() - 10000);
      document.cookie = name + "=a; expires=" + date.toGMTString();
    }
    
    new Ext.Button({
        text: 'ɾ��',
        renderTo: 'btnDelCookie',
        handler: function() {
           delCookie("zycblogin");
           Ext.Msg.alert("ע��","��¼�Զ�����Cookie�Ѿ�ɾ��");
        },
        iconCls:'user-delete'
    });
    
    Ext.get('showmsgtab').on('click', function(){
         var RightPanel=Ext.getCmp('rightpanel');
         if(RightPanel.collapsed)
            RightPanel.expand();
         else
            RightPanel.collapse();
    });
    

});






-->
</SCRIPT> 


</head>
<BODY  scroll="no" >

  <div id="north-div">
   	<div id='north-center'> 	
   	    <table width="100%" height="80" cellspacing="0" cellPadding="0" border="0">
          <tr>
             <td background="<%=path %>/images/banner.jpg">
             </td>
             
          </tr>
        </table>
    </div>
  	<div id='north-south'><div id='toolbar-div'></div></div>
  </div>
  <div id="west-div"></div>
  <div id="center-div" >
  
     <IFRAME frameBorder="0" width="100%"  height="100%" id="mainFrame" name="mainFrame" scrolling="auto" src="<%=path %>/JspForm/welcome.jsp" style="HEIGHT:100%;VISIBILITY:inherit;WIDTH:100%;">
     </IFRAME>
     
  </div>
  <div id="south-div">
  
      <table width="98%" align="center" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px;">
         <tr>
             <td>
                ��ӭ����¼&nbsp;
             </td>
             <td align="right">
                <div id="showmsgtab" style="cursor:pointer;">
                   <img src="<%=path %>/images/ext/user_comment.png" align="absmiddle">����ǰ��&nbsp;
                   <span id="msgcount">0</span>&nbsp;������Ϣ
                </div>
             </td>
          </tr>
      </table>
  </div>
  
  
  
  
  
  
  
  
  <div id="settings-div">
      <div style="margin-top:6px; margin-left:5px;">
        <table border="0" cellspacing="5" cellpadding="5">
          <tr>
            <td>
              ����ϵͳ��ʽ��
            </td>
          </tr>
          <tr>
            <td>
               <div id="skin" style="width:120"></div>
		    </td>
		  </tr>
		  <tr>
            <td height="5">
		    </td>
		  </tr>
		  <tr>
		    <td>
		      �Զ�ˢ�¼����
		    </td>
		  </tr>
		  <tr>
		    <td>
		      <select id="RefreshInterval" name="RefreshInterval">
		       <option value="5">5��</option>
		       <option value="10">10��</option>
		       <option value="30" selected>30��</option>
		       <option value="60">1����</option>
		       <option value="300">5����</option>
		       <option value="600">10����</option>
		      </select>
		    </td>
		  </tr>
		  <tr>
            <td height="5">
		    </td>
		  </tr>
		  <tr>
		    <td>
		      ɾ����¼�Զ������Cookie��
		    </td>
		  </tr>
		  <tr>
            <td>
              <div id="btnDelCookie"></div>
		    </td>
		  </tr>
		  <tr>
            <td height="5">
		    </td>
		  </tr>
		  <tr>
		    <td>
		      ��Ϣ�����Զ���⣺
		    </td>
		  </tr>
		  <tr>
            <td>
              <div id="btn"></div>
		    </td>
		  </tr>
		</table>
    </div>
  </div>

</body>
</html>
