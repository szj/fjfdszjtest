<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK"
	contentType="text/html;charset=GBK"%>
<%
	request.setCharacterEncoding("GBK");
%>
<%@ include file="/common/taglibs.jsp"%>

<head>
	<script>
		Ext.onReady(function(){

       		Ext.state.Manager.setProvider(new Ext.state.CookieProvider());

	       	var viewport = new Ext.Viewport({
	            layout:'border',
	            items:[{
	                region:'center',
	                layout:'column',
	                autoScroll:true,
	                items:[
	                <tt:authority value="InceptSmsManage">
	                {
	                	columnWidth:.71,
	                    baseCls:'x-plain',
	                    bodyStyle:'padding:5px 0 5px 5px',
	                    items:[{
	                    	collapsible:true,
	                        title: "<a onclick=\"parent.addTab('�ѽ���δ����Ķ���', 'InceptSmsManage', '/system/sms/inceptSms.shtml')\" href='javascript:void(0)'>�ѽ���δ����Ķ���</a>",
	                        html: "<iframe id='inceptSmsIframe' name='inceptSmsIframe' src='/system/sms/inceptSms.shtml?search.smsState=1&action=homepage'width='100%' height='100%' frameborder=0/>"
	                    }]
	                },
	                </tt:authority>
	                {
	                    columnWidth:.29, 
	                    baseCls:'x-plain',
	                    bodyStyle:'padding:5px 0 5px 5px',
	                    items:[{
	                    	collapsible:true,
	                        title: '��ǰʱ��',
	                        html: "<div align='center'><embed src='/images/clock.swf' width='150' height='150' wmode='transparent' type='application/x-shockwave-flash'></div>"
	                    }]
	                }
	                <tt:authority value="WarningLogManage">
	                ,{
	                    columnWidth:1,
	                    baseCls:'x-plain',
	                    bodyStyle:'padding:5px',
	                    items:[{
	                    	collapsible:true,
	                        title: "<a onclick=\"parent.addTab('Ԥ������', 'WarningLogManage', '/system/warning/warningLog.shtml')\" href='javascript:void(0)'>Ԥ������</a>",
	                        html: "<iframe id='warningLogIframe' name='warningLogIframe' src='/system/warning/warningLog.shtml?action=homepage'width='100%' height='100%' frameborder=0/>"
	                    }]
	                }
	                </tt:authority>
	                ]
	            }]
	        });
    	});
	</script>
</head>

<body>
</body>