/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package HibernateBeans.cms;

/**
 *
 * @author James
 */
public class C {
private cmsClass cls;
public C(int cid)
{
  org.hibernate.Session s=util.HibernateUtil.getSession();
  util.HibernateUtil.beginTransaction();
  cls=(cmsClass)s.load(cmsClass.class, new Integer(cid));
  util.HibernateUtil.commitTransaction();
}
public C(String path)
{
 search sh=new search();
 cls=sh.searchClassByName(path);
}
/**
 * ���cmsClass����
 * @return
 */
public cmsClass getC()
{
 return cls;
}
/**
 * ���cmsClass Id
 * @return
 */
public int getId()
{
 return cls.getId();
}
/**
 * ���cmsClass Name
 * @return
 */
public String getName()
{
 return cls.getName();
}
}
