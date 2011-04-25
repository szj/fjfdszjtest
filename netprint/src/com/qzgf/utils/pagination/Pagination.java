package com.qzgf.utils.pagination;

/**
 *
 * <p>Title: ��ҳ�ӿ�</p>
 * @version 1.0<br>
 */
public interface Pagination {

  /**
   * ��һҳ
   */
  public void firstPage();

  /**
   * ���һҳ
   */
  public void lastPage();

  /**
   * ��һҳ
   */
  public void nextPage();

  /**
   * ǰһҳ
   */
  public void previousPage();

  /**
   * ת��ָ��ҳ��
   * @param i Ҫת��ҳ��
   */
  public void gotoPage(int i);

  /**
   * ת��ָ��ҳ��,�������next,����ת����һҳ,�������previous,����ת����һҳ,
   * �������first,����ת����һҳ,�������last,����ת�����һҳ,������������
   * �ַ���ת������,Ȼ����ת��ָ����ҳ��
   * @param s
   */
  public void turnPage(String s);

  /**
   * ȡ�õ�ǰҳ�ǵڼ�ҳ
   * @return
   */
  public int getCurrentPage();

  /**
   * ȡ�õ�ǰҳ�ļ�¼��
   * @return
   */
  public int getCurrentPageRecord();

  /**
   * ȡ�õ�ǰҳ��ʼ�ļ�¼�ǵڼ�����¼
   * @return ǰҳ��ʼ��¼�ǵڼ�����¼
   */
  public int getPageStart();

  /**
   * ȡ�õ�ǰҳ���һ���ǵڼ�����¼
   * @return ǰҳ���һ���ǵڼ�����¼
   */
  public int getPageEnd();

  /**
   * ȡ��ÿһҳ�ļ�¼��
   * @return
   */
  public int getPageRecord();

  /**
   * ȡ���ܵ�ҳ��
   * @return �ܵ�ҳ��
   */
  public int getTotalPage();
  /**
   * �����ܵļ�¼��
   * @param iTotalRecord
   */
  public void setTotalRecord(int iTotalRecord) ;

  /**
   * ȡ���ܵļ�¼��
   * @return ��¼��
   */
  public int getTotalRecord();

  /**
   * ����ÿҳ�ļ�¼��
   * @param i ÿҳ�ļ�¼��
   */
  public void setPageRecord(int i);



}
