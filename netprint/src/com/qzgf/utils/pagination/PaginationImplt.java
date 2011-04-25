package com.qzgf.utils.pagination;

public class PaginationImplt implements Pagination {
    protected int pageRecord; //ÿҳ�ļ�¼��
    protected int currentPage; //��ǰ�ǵڼ�ҳ
    protected int totalRecord; //�ܵļ�¼��
    protected int totalPage; //�ܵ�ҳ��
    protected int iMaxRowCount = 200; //��ʾ���������

    public PaginationImplt(){
        pageRecord = 15;
        currentPage = 1;
        totalRecord = 0;
        totalPage = 0;
    }
    /**
     * ���
     */
    public void clear(){
        pageRecord = 15;
        currentPage = 1;
        totalRecord = 0;
        totalPage = 0;    	
    }
    /**
     * ��һҳ
     */
    public void firstPage() {
        currentPage = 1;
    }

    /**
     * ���һҳ
     */
    public void lastPage() {
        currentPage = totalPage;
    }

    /**
     * ��һҳ
     */
    public void nextPage() {
        currentPage++;
        rationalPage();
    }

    /**
     * ǰһҳ
     */
    public void previousPage() {
        currentPage--;
        rationalPage();
    }

    /**
     * ת��ָ��ҳ��
     * @param i Ҫת��ҳ��
     */
    public void gotoPage(int i) {
        currentPage = i;
        rationalPage();
    }

    /**
     * ת��ָ��ҳ��,�������next,����ת����һҳ,�������previous,����ת����һҳ,
     * �������first,����ת����һҳ,�������last,����ת�����һҳ,������������
     * �ַ���ת������,Ȼ����ת��ָ����ҳ��
     * @param s
     */
    public void turnPage(String str) {
        if (str != null && !str.equals("")) {
            str = str.toLowerCase();
            if (str.equals("next")) {
                nextPage();
            }
            else if (str.equals("previous")) {
                previousPage();
            }
            else if (str.equals("first")) {
                firstPage();
            }
            else if (str.equals("last")) {
                lastPage();
            }
            else {
                try {
                    int i = Integer.parseInt(str);
                    gotoPage(i);
                }
                catch (NumberFormatException ex) {
                }
            }
        }
    }

    /**
     * ȡ�õ�ǰҳ�ǵڼ�ҳ
     * @return
     */
    public int getCurrentPage() {
        return currentPage;
    }

    /**
     * ȡ�õ�ǰҳ�ļ�¼��
     * @return
     */
    public int getCurrentPageRecord() {
        int i;
        if (getCurrentPage() < getTotalPage()) {
            i = getPageRecord();
        }
        else {//��������һҳ��ȡ�ü�¼������getPageRecord()Ҳ�п���������
            i = getTotalRecord() % getPageRecord();
            if (i == 0) {
                i = getPageRecord();
            }
        }
        return i;
    }

    /**
     * ȡ�õ�ǰҳ��ʼ�ļ�¼�ǵڼ�����¼
     * @return ǰҳ��ʼ��¼�ǵڼ�����¼
     */
    public int getPageStart() {
        return getPageStartReal() + 1;
    }

    /**
     * ȡ�õ�ǰҳ���һ���ǵڼ�����¼
     * @return ǰҳ���һ���ǵڼ�����¼
     */
    public int getPageEnd() {
        return getPageEndReal() + 1;
    }

    /**
     * ȡ��ÿһҳ�ļ�¼��
     * @return
     */
    public int getPageRecord() {
        return pageRecord;
    }

    /**
     * ȡ���ܵ�ҳ��
     * @return �ܵ�ҳ��
     */
    public int getTotalPage() {
        return totalPage;
    }

    /**
     * ȡ���ܵļ�¼��
     * @return ��¼��
     */
    public int getTotalRecord() {
        return totalRecord;
    }
    /**
     * �����ܵļ�¼��
     * @param totalRecord
     */
    public void setTotalRecord(int totalRecord) {
        currentPage = 1;
        this.totalRecord = totalRecord;
        totalPage = ( (totalRecord + pageRecord) - 1) / pageRecord;
    }
    /**
     * ����ÿҳ�ļ�¼��
     * @param i ÿҳ�ļ�¼��
     */
    public void setPageRecord(int i) {
        if (i != pageRecord && i >= 1) {
            pageRecord = i;
            totalPage = ( (totalRecord + pageRecord) - 1) / pageRecord;
            currentPage = 1;
        }
    }
    /**
     * ������ʵ���ǵڼ�ҳ,ʹ��ǰ��ҳ����С��0�ʹ�������¼ҳ��
     */
    private void rationalPage() {
        if(currentPage < 1)
            currentPage = 1;
        else if(currentPage > totalPage)
            currentPage = totalPage;
    }

    //ȡ�õ�ǰҳ��ʼ�ļ�¼�ǵڼ�����¼,��������±����
    public int getPageStartReal() {
        int i = (currentPage - 1) * pageRecord;
        return i;
    }

    //ȡ�õ�ǰҳ���һ���ǵڼ�����¼,��������±����
    public int getPageEndReal(){
        int i = Math.min(currentPage * pageRecord - 1, totalRecord - 1);
        return i;
    }
    
    //�Ƿ��ǵ�һҳ
    public boolean isFirst(){
    	if(currentPage<=1)
    		return true;
    	else 
    		return false;
    }
    
    //�Ƿ������һҳ
    public boolean isLast(){
    	if(currentPage>=totalPage)
    		return true;
    	else 
    		return false;
    }
}
