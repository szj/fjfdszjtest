var swf_width=320;
var swf_height=200;
var config='3|0xffffff|0x0099ff|50|0xffffff|0x0099ff|0x000000';
//-- config �������� -- �Զ�����ʱ��(��)|������ɫ|���ֱ���ɫ|���ֱ���͸����|����������ɫ|��ǰ������ɫ|��ͨ����ɫ�� --
var files='images/ad/001.jpg|images/ad/002.jpg|images/ad/003.jpg';
var links='#|#|#';
var texts='|';
document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'">');
document.write('<param name="movie" value="<%= request.getContextPath()%>/images/test/focus.swf" />');
document.write('<param name="quality" value="high" />');
document.write('<param name="menu" value="false" />');
document.write('<param name=wmode value="opaque" />');
document.write('<param name="FlashVars" value="config='+config+'&bcastr_flie='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'" />');
document.write('<embed src="<%= request.getContextPath()%>/images/test/focus.swf" wmode="opaque" FlashVars="config='+config+'&bcastr_flie='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'& menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
document.write('</object>');