/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package HibernateBeans.cms;

import java.util.List;
import java.util.Map;

/**
 *
 * @author James
 */
public class newEntity {
    private cmsClass cls;
    public newEntity(cmsClass cls)
    {
     this.cls=cls;
    }
    public newEntity(String path)
    {
     search sh=new search();
     this.cls=sh.searchClassByName(path);
    }
    /**
     * ���ر����html
     * @param attributeName
     * @return
     */
    public String getFieldHtml(String attributeName)
    {
     addEntity ade=new addEntity();
     return ade.getFormHTML(cls, attributeName);
    }
    /**
     * ���ر����ID
     * @param attributeName
     * @return
     */
    public int getFieldId(String attributeName)
    {
     return cls.getAttributeByName(attributeName).getId();
    }
    /**
     * ���ر����Ĭ��ֵ
     * @param attributeName
     * @return
     */
    public String getFieldValue(String attributeName)
    {
     return cls.getAttributeByName(attributeName).getDefaultValue();
    }
/**
 * ���ı����ͱ���
 * @param attributeName ������
 * @param width �༭�����
 * @param height �༭���߶�
 * @param ToolbarSet ���������
 * @param ToolbarStartExpanded �������Ƿ�չ��
 * @return
 */
    public String getTextFieldHtml(String attributeName,String width,String height,String ToolbarSet,String ToolbarStartExpanded)
    {
    return "<textarea id=\""+getFieldId(attributeName)+"\" name=\""+getFieldId(attributeName)+"\" style=\"WIDTH:"+width+";HEIGHT:"+height+"px\">"+getFieldValue(attributeName)+"</textarea>" +
                "<script type=\"text/javascript\">" +
                "var oFCKeditor = new FCKeditor(\""+getFieldId(attributeName)+"\");" +
                //"oFCKeditor.BasePath=\""+vpath+"FCKeditor/\";" +
                ((width.endsWith("%"))?"":("oFCKeditor.Width="+width+";"))+
                "oFCKeditor.Height="+height+";" +
                "oFCKeditor.ToolbarSet=\""+ToolbarSet+"\";" +
                "oFCKeditor.Config['ToolbarStartExpanded']='"+ToolbarStartExpanded+"';"+
                "oFCKeditor.ReplaceTextarea();" +
                "</script>";
    }
/**
 * ���ı����ͱ���
 * @param attributeName
 * @return
 */
 public String getTextFieldHtml(String attributeName)
 {
  return getTextFieldHtml(attributeName,"100%","400","Default","true");
 }
/**
 * �������ֵ����:name-attribute
 * @return
 */
    public Map attributeMap()
    {
      return cls.allAttributesMap();
    }
/**
 * �ų���Ӧ���Ƶ����ԣ�����ʣ�����Լ���
 * String filterName[]={"name1","name2","name3"};
 * @param filterName
 * @return
 */
    public Map attributeMap(String filterName[])
    {
      Map map=cls.allAttributesMap();
      for(int i=0;i<filterName.length;i++)
      {
       if(map.containsKey(filterName[i]))map.remove(filterName[i]);
      }
      return map;
    }
/**
 * ��������list
 * @return
 */
    public List attributeList()
    {
      return cls.allAttributes();
    }
}
