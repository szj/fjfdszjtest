/*
 * cmsInfo.java
 *
 * Created on 2008��5��19��, ����6:00
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package HibernateBeans.cms;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class cmsInfo {
    
    /** Creates a new instance of cmsInfo */
    String version="2.0";
    public cmsInfo() {
    }
    
    public String getVersion()
    {
     return version;
    }
    
    public List getHistory()
    {
     List history=new ArrayList();
     history.add("AICMS1.0,����ʱ�䣺2008��5��10�ա�ϵͳ�������ܿ�����ɡ�");
     history.add("AICMS1.01,����ʱ�䣺2008��5��12�ա������ࡢ���Կ����������/ɾ����������");
     history.add("AICMS1.02,����ʱ�䣺2008��5��19�ա������¼�����ϼ������Եļ̳й���");
     history.add("AICMS1.03,����ʱ�䣺2008��5��21�ա��޸�ʵ���ѯģ�飬�ݹ��ѯ��ʽ���ø���������ʽ�Ĳ�ѯ����С���������������˲�ѯЧ�ʡ�");
     history.add("AICMS1.04,����ʱ�䣺2008��5��23�ա�ʵ���ѯ�����ڲ���ҳ���ܡ���������������Bug������ʵ��ɾ��ʱ��Ӧ�ࡢ���ԡ����ݼ��ϵ�ͬ����������");
     history.add("AICMS1.05,����ʱ�䣺2008��5��28�ա�ϵͳ��ѯ���ö������棬��������hibernate��lazy����������Bug������ÿһ��ĺ�̨�����ƹ���(�����趨�ں�̨�����������������������/�޸�����/�����б����Ƿ���ʾ)");
     history.add("AICMS1.06,����ʱ�䣺2008��6��10�ա��޸����ݲ�ѯ�����ܣ�֧�ְ������������ͽ�������");
     history.add("AICMS1.07,����ʱ�䣺2008��6��13�ա��޸����ݹ�����ѯʱ����cache���������Ŀ�ָ��Bug");
     history.add("AICMS1.08,����ʱ�䣺2008��6��14�ա�����������Bug");
     history.add("AICMS1.09,����ʱ�䣺2008��6��25�ա�ȫ���޸Ĳ�ѯģ�飬���ݲ�ѯ���԰����Կ������������ٶ��������.");
     history.add("AICMS1.1,����ʱ�䣺2008��7��25�ա�����������״̬��ͬ��������.");
     history.add("AICMS1.2,����ʱ�䣺2008��9��1�ա�����fckeditor�༭�������ļ����������,fckeditor(jar)�汾Ϊ2.4");
     history.add("AICMS2.0,����ʱ�䣺2008��9��8�ա�����CAEV���׼Ƕ���ʹ��AICMS���Ӽ򵥣�����hibernate���ݿ����ӹر�Bug");
     return history;
    }
}
