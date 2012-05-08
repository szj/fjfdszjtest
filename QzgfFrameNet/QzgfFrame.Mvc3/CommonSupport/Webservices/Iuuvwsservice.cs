

using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Services;

namespace QzgfFrame.Mvc3.CommonSupport.Webservices
{
    //[WebServiceBinding(ConformsTo = WsiProfiles.None)]
    public interface Iuuvwsservice
    {

        //[WebMethod(Description = "���ݡ���ɫ���ơ�����Ӧ�ó���ID������Ӧ�ó�����Կ����ȡ���û������ϡ�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�{{\"12\",\"31\",...},{\"usr01\",\"isr02\",...}}</font>��")]
         string[][] GetADUserNameByRoleAndAppId(string roleName, string appID, string appKey);

        //[WebMethod(Description = "���ݡ���ɫID������Ӧ�ó���ID������Ӧ�ó�����Կ����ȡ���û������ϡ�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable UP_GetUsersInfoByRoleIDAndAppId(string roleID, string appID, string appKey);

        //[WebMethod(Description = "���ݡ��û�AD��������Ӧ�ó���ID������Ӧ�ó�����Կ����ȡ�û���ϵͳ�еġ���ɫ���ơ����ϡ�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�{\"�鿴��\",\"�����\",...}</font>��")]
         string[] GetRoleNameByADUserNameAndAppId(string adUserName, string appID, string appKey);

        //[WebMethod(Description = "���ݡ������û���������������ɫID������Ӧ�ó���ID������Ӧ�ó�����Կ����������ƥ����û���<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable QueryARole(string userNamePart, string roleID, string appID, string appKey);

        //[WebMethod(Description = "���ݡ�һ��UserID������Ӧ�ó���ID������Ӧ�ó�����Կ��������Щ�û���Ӧ�Ľ�ɫ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable QueryByUserIDList(List<int> userIDLst, string appID, string appKey);

        //[WebMethod(Description = "��ȡ��ǰ�û����ع�˾���ž�����й�˾���ľ���<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�{\"usr02\",\"31\"}</font>����ע��ʧ�ܷ��ش�����Ϣ{\"���û������ڣ��޷���ȡ�䲿�ž�������ľ���\",\"���û������ڣ��޷���ȡ�䲿�ž�������ľ���\"}��")]
         string[] GetDeptManagerByADUserName(string adUserName);

        //[WebMethod(Description = "��ȡָ����֯���²���֯���ϡ�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>����<font color=\"red\">ע��Ҫ��ȡ�����ڵ㡯�봫�� 0 </font>��")]
         DataTable GetSecondLayerByDeptID(string deptID);

        //[WebMethod(Description = "��ȡȪ���ƶ�������֯���ϡ�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>����<font color=\"red\">ע���޲��� </font>��")]
         DataTable GetAllDeptInfo();

        //[WebMethod(Description = "����AD�û�����ȡ�û��������Ϣ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable GetUserInfoByADUserName(string adUserName);

        //[WebMethod(Description = "�����û�ID��ȡ�û��������Ϣ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable GetUserInfoById(int userID);

        //[WebMethod(Description = "����Ա�����MIS_UserId��ȡ�û��������Ϣ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable GetUserInfoByMIS_UserId(string MIS_UserId);

        //[WebMethod(Description = "����Ա��������ȡ�û��������Ϣ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable GetUserInfoByUsername(string username);

        //[WebMethod(Description = "��ȡ��ǰ�û���ֱ����˾���ġ�Dept_ID���͡���˾���ơ���<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�{\"20\",\"�����ֹ�˾\"}</font>����ע��ʧ�ܷ��ش�����Ϣ{\"���û������ڣ��޷���ȡ��ֱ����˾��\",\"���û������ڣ��޷���ȡ��ֱ����˾��\"}��")]
         string[] GetDirectlyUnderCompanyByADUser(string adUserName);


        //[WebMethod(Description = "��ȡ��ǰ�û���ֱ����˾���򡰲��š��ġ�Dept_ID���͡���˾���ơ�(��֯�ܹ��ڶ���)��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�{\"20\",\"�����ֹ�˾\"}</font>����ע��ʧ�ܷ��ش�����Ϣ{\"���û������ڣ��޷���ȡ��ֱ����˾��\",\"���û������ڣ��޷���ȡ��ֱ����˾��\"}��")]
         string[] GetDirectlyUnderCompanyOrDeptByADUser(string adUserName);

        //[WebMethod(Description = "������֯ID��ȡ��֯�������Ϣ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable GetDeptInfoById(string deptID);

        //Сл���� 2009��9��11��16:26:19
        // [WebMethod(Description = "�����û�ID����ȡ�û�������Ȩ���ʵ�ϵͳ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable GetAppByUserID(int userID);

        //Сл����2009��9��15��9:45:47
        //[WebMethod(Description = "��ȡ����Ӧ��ϵͳ���<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable GetAppTypes();

        //Сл���� 2010��1��4��15:08:01


        //[WebMethod(Description = "��ȡ�û����Ƶ�ϵͳ�б�(��ҳ12��)��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable get_flowRss(int v_userid);

        //[WebMethod(Description = "��ȡ�û����Ƶ�ȫ��ϵͳ�б�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable get_flowRssAll(int v_userid);

        //[WebMethod(Description = "��ȡ�û����Ƶ�ϵͳ��Ϣ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable get_userAppRss_ByappId(string v_appid, int v_userid);

        // [WebMethod(Description = "��ȡ�û����Ƶ�ϵͳ���������<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�Int32</font>��")]
         Int32 get_appMaxOrder(int v_userid);

        // [WebMethod(Description = "�û�����ϵͳ���ơ�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�bool</font>��")]
         bool Insert_flowrss(int v_userid, int v_orderNum, string v_appid);

        //[WebMethod(Description = "�û�����ϵͳ���Ƹ��¡�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�bool</font>��")]
         bool Update_flowRss(int v_userid, int v_orderNum, string v_appid, int v_rssid);
        //[WebMethod(Description = "�û�����ϵͳ����ȡ����<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�bool</font>��")]
         bool delete_flowRss(int v_userid, string v_appid);


        //Сл����2009��9��15��9:45:47
        // [WebMethod(Description = "��ȡȫ��Ӧ��ϵͳ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable GetAllApp();

        //[WebMethod(Description = "��ȡӦ��ϵͳ�е������û���<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable GetUsersByAppId(string appID, string appKey);

        //[WebMethod(Description = "��ȡӦ��ϵͳ�����С���Ч���ҡ�δ���ڡ��Ľ�ɫ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
         DataTable GetAllRolesByAppId(string appID, string appKey);

        // [WebMethod(Description = "�ж�ָ����Ա�Ƿ�Ϊ���ع�˾���ž���������쵼����<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�true �� false</font>��")]
         bool IsDeptManagerAndUpwards(string adUserName);

        //[WebMethod(Description = "�ж�ָ����Ա�Ƿ�Ϊ���й�˾���ľ���������쵼����<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�true �� false</font>��")]
         bool IsCenterManagerAndUpwards(string adUserName);

        //[WebMethod(Description = "�ж�ָ���ļ��Ƿ������ϴ���<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�true �� false</font>��")]
         bool IsFileAllowedToUpload(string fileName);

        // [WebMethod(Description = "�Ƿ�Ϊ��Ȫ���ƶ�����֯�µ�Ա����<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�true �� false</font>��", MessageName = "IsQZMCCEmployeeByUserID")]
         bool IsQZMCCEmployee(int userID);

        // [WebMethod(Description = "�Ƿ�Ϊ��Ȫ���ƶ�����֯�µ�Ա����<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�true �� false</font>��", MessageName = "IsQZMCCEmployeeByUserName")]
        // bool IsQZMCCEmployee(string userName);
         bool IsFileAllowedToUpload(int fileName);

        /// <summary>
        /// ��ȡϵͳ�а����Ľ�ɫ
        /// </summary>
        /// <param name="appId">Ӧ��ϵͳappid</param>
        /// <returns></returns>
         DataSet GetRoleByAppId(string appId);



         string GetUserStrIdByUserId(int userId);

    }
}
