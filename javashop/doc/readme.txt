index ${widget_2}:��˵�         goods_cat             widget.goodscat

      ${widget_5}: jquery����.    jqueryAdAdvance      widget.adv.jqueryAdAdvance

      ${widget_3}:��Ʒ����     goods_list {tagid:'1'}  widget.goods.list

      ${widget_6}:����ϵ��     ad  <acid>4</acid>
      ${widget_13}:�۸��      goods_list  term{tagid:'4'}
      ${widget_12}:tab         goods_list {type:'morediv',goodsImgPosition:'top',changeEffect:0,columnnum:5,
				goodsNum:10}

      ${widget_7}:��Ʒ�Ƽ�      goods_list   {tagid:'3'}
{type:'default',goodsImgPosition:'top',
				thumbnail_pic_width:'202px',thumbnail_pic_height:'268px',
				showGoodsName:'on', columnnum:5, goodsNum:10}







header ${widget_menu}:ͷ�˵�   shop_menu   widget.menu   site_menu


footer: ${widget_footer1}:����   30


       FootMenu: ${widget_footer2} 31


       Copyright:${widget_footer3} 32


                 ${widget_footer}    partZone 33      widget.partZone   


�˵� menu
select * from es_menu where menutype=2 and pid=0

select * from es_menu where menutype=2 and pid=90

select * from es_menu where menutype=2 and pid in(select id from es_menu where pid=90)

������� emstype   emstypeAction

����б� emscat   emscatAction

����б� emsgoods  emsgoodsAction
==============================================================
��ע:
�˵��޸ı�



�����б�:es_goods_type

���:es_goods_cat


��̨�˵�:
select * from es_menu where menutype=2 and pid=0
��̨����:
select * from es_menu where menutype=1 and pid=0

ǰ̨վ��˵�
select * from es_ems_site_menu

���˵�:
ems_goods_cat,ems_goods_type

<a href="search-cat{${cat.cat_id }}.html">

<page id="/default.html">
<widget id="/search-(.*).html">
			<overflow>visible</overflow>
			<border />
			<type>goods_search</type>
</widget>


---��̨ͼƬ���.


--�޸�ҳͷ

--�޸�ҳβ
ems_article,ems_article_cat


/********************************************2010.12.13********************************/
�޸�����
��װ����
1.������������.
framework.util.stringutil==>filePath = filePath.replaceAll("%20", " ");
2.src:eop.properties���������Ϣ(product·������)
3.��ȡxml�ļ��쳣
ProfileLoaderImpl.java     ========profile.xml
AdminThemeinfoloaderimp.java ======themeini.xml
4.��ҳ�޷���
com.enation.eop.core.facade.widget.widgetxmlutil.paseparamdo==>widgets.xml
com.enation.eop.impl.facade.widgetXmlWidgetParamParser==>
5.��ҳ��ʾԭ��
<widget id="/search-(.*).html">
			<overflow>visible</overflow>
			<border />
			<type>goods_search</type>
</widget>
GoodsSearchWidget
GoodssearchWidget.html
com.enation.javashop.widget.goods.search


6.127.0.0.1
com.enation.eop.impl.resource.AccessRecorder����ͳ��

7.ͼƬ����.\mm\statics\attachment\goods

8.������ʾԭ��
������==ͨ����̨.

select* from es_site_menu

use javashop

select* from es_ems_site_menu

use javashopex

13,5,2
select* from es_site_menu where parentid=0

select * from es_site_menu where  parentid=21

select * from es_site_menu where parentid in(select menuid from es_site_menu where parentid=0) order by parentid,sort,menuid


update es_goods_type a,es_goods_cat b set a.name=b.name where a.type_id=b.cat_id

select * from es_goods_cat where parent_id=0

select * from es_goods_cat where parent_id in (select cat_id from  es_goods_cat where parent_id=0) order by parent_id,cat_id
1,0,��ҳ,index.html,0
2,0,��������,search-cat{3}.html,3
3,2,�ʻ�����,search-cat{16}.html,0
5,0,��������,search-cat{2}.html,2
6,5,��������,search-cat{13}.html,0
7,5,��������,search-cat{14}.html,1
10,4,���,\N,0
13,0,��������,search-cat{1}.html,1
15,13,��������1,search-cat{6}.html,0
16,13,��������2,search-cat{7}.html,0
17,13,��������3,search-cat{8}.html,0
18,5,��������,search-cat{15}.html,2
19,2,���µ���,search-cat{17}.html,0
20,2,������Ʒ,search-cat{18}.html,0
25,0,Ʒ��ר��,brand.html,5
26,28,�������,package.html,0
27,0,�ͻ�����,guestbook.html,7
28,0,����ר��,#,6
29,28,�һ���Ʒ,giftlist.html,1
30,0,��������,help-1.html,9
--��Ʒ�������.

select * from es_menu where menutype=2 and pid=14

select * from es_brand

select * from es_goods_type

delete from es_goods 

SELECT last_insert_id() as id

/*��ʱ����ͳ��*/
com.enation.eop.impl.resource.AccessExporter
select * from eop_site 

select * from es_access

delete from es_car_article where id=76
INSERT INTO es_car_article  VALUES ('76','0','2010-09-21 10:33:15.0',null,null,null,null,'14',null,'��������','','<p>	<img alt="" src="fs:/attachment/ckeditor/201009211045114188.jpg" style="width: 571px; height: 120px;" /></p>')

delete from es_site_menu

INSERT INTO `es_site_menu` VALUES ('1', '0', '��ҳ', 'index.html', '0');
INSERT INTO `es_site_menu` VALUES ('2', '0', '��������', 'search-cat{3}.html', '3');
INSERT INTO `es_site_menu` VALUES ('3', '2', '�ʻ�����', 'search-cat{16}.html', '0');
INSERT INTO `es_site_menu` VALUES ('5', '0', '��������', 'search-cat{2}.html', '2');
INSERT INTO `es_site_menu` VALUES ('6', '5', '��������', 'search-cat{13}.html', '0');
INSERT INTO `es_site_menu` VALUES ('7', '5', '��������', 'search-cat{14}.html', '1');
INSERT INTO `es_site_menu` VALUES ('10', '4', '���', null, '0');
INSERT INTO `es_site_menu` VALUES ('13', '0', '��������', 'search-cat{1}.html', '1');
INSERT INTO `es_site_menu` VALUES ('15', '13', '��������1', 'search-cat{6}.html', '0');
INSERT INTO `es_site_menu` VALUES ('16', '13', '��������2', 'search-cat{7}.html', '0');
INSERT INTO `es_site_menu` VALUES ('17', '13', '��������3', 'search-cat{8}.html', '0');
INSERT INTO `es_site_menu` VALUES ('18', '5', '��������', 'search-cat{15}.html', '2');
INSERT INTO `es_site_menu` VALUES ('19', '2', '���µ���', 'search-cat{17}.html', '0');
INSERT INTO `es_site_menu` VALUES ('20', '2', '������Ʒ', 'search-cat{18}.html', '0');
INSERT INTO `es_site_menu` VALUES ('25', '0', 'Ʒ��ר��', 'brand.html', '5');
INSERT INTO `es_site_menu` VALUES ('26', '28', '�������', 'package.html', '0');
INSERT INTO `es_site_menu` VALUES ('27', '0', '�ͻ�����', 'guestbook.html', '7');
INSERT INTO `es_site_menu` VALUES ('28', '0', '����ר��', '#', '6');
INSERT INTO `es_site_menu` VALUES ('29', '28', '�һ���Ʒ', 'giftlist.html', '1');
INSERT INTO `es_site_menu` VALUES ('30', '0', '��������', 'help-1.html', '9');

1.��ʽ
ems.css <--index.css
2.�ű�


select * from es_article

9.��ǰλ�õ���
com.enation.javashop.widget.nav.SiteNavWidget


select rel_id from tag_rel where tag_id in {tagid:'1'}

select * from es_tag_rel

select * from es_goods

select * from es_goods_cat

select * from eop_site

mm/core/admin/solution!toImport.do
com.enation.app.saler.action.backend.SolutionAction

com.enation.app.saler.service.impl.ProductServiceImpl
д�ⶳ