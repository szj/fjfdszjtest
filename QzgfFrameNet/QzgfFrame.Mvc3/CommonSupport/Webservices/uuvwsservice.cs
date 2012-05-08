#region License

/*
 * Copyright ?2002-2006 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#endregion


#region Imports

using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Services;
using System.Xml.Serialization;

#endregion

namespace QzgfFrame.Mvc3.CommonSupport.Webservices
{
    [WebServiceBinding(ConformsTo = WsiProfiles.None)]
    public class uuvwsservice : Iuuvwsservice
    {

        #region WX_HongYueFeng Powered 2009-08-10!

        [WebMethod(Description = "���ݡ���ɫ���ơ�����Ӧ�ó���ID������Ӧ�ó�����Կ����ȡ���û������ϡ�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�{{\"12\",\"31\",...},{\"usr01\",\"isr02\",...}}</font>��")]
        public string[][] GetADUserNameByRoleAndAppId(string roleName, string appID, string appKey)
        {
//wp ��֧�ֽ�ɫ�е���֯��
            var ds = new string[5][];
            return ds;
        }

        [WebMethod(Description = "���ݡ���ɫID������Ӧ�ó���ID������Ӧ�ó�����Կ����ȡ���û������ϡ�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable UP_GetUsersInfoByRoleIDAndAppId(string roleID, string appID, string appKey)
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "���ݡ��û�AD��������Ӧ�ó���ID������Ӧ�ó�����Կ����ȡ�û���ϵͳ�еġ���ɫ���ơ����ϡ�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�{\"�鿴��\",\"�����\",...}</font>��")]
        public string[] GetRoleNameByADUserNameAndAppId(string adUserName, string appID, string appKey)
        {
            //wp ��֧�ֽ�ɫ�е���֯��
            var ds = new string[5];
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "���ݡ������û���������������ɫID������Ӧ�ó���ID������Ӧ�ó�����Կ����������ƥ����û���<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable QueryARole(string userNamePart, string roleID, string appID, string appKey)
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "���ݡ�һ��UserID������Ӧ�ó���ID������Ӧ�ó�����Կ��������Щ�û���Ӧ�Ľ�ɫ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable QueryByUserIDList(List<int> userIDLst, string appID, string appKey)
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "��ȡ��ǰ�û����ع�˾���ž�����й�˾���ľ���<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�{\"usr02\",\"31\"}</font>����ע��ʧ�ܷ��ش�����Ϣ{\"���û������ڣ��޷���ȡ�䲿�ž�������ľ���\",\"���û������ڣ��޷���ȡ�䲿�ž�������ľ���\"}��")]
        public string[] GetDeptManagerByADUserName(string adUserName)
        {
            var ds = new string[5];
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "��ȡָ����֯���²���֯���ϡ�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>����<font color=\"red\">ע��Ҫ��ȡ�����ڵ㡯�봫�� 0 </font>��")]
        public DataTable GetSecondLayerByDeptID(string deptID)
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "��ȡȪ���ƶ�������֯���ϡ�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>����<font color=\"red\">ע���޲��� </font>��")]
        public DataTable GetAllDeptInfo()
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "����AD�û�����ȡ�û��������Ϣ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable GetUserInfoByADUserName(string adUserName)
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "�����û�ID��ȡ�û��������Ϣ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable GetUserInfoById(int userID)
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "����Ա�����MIS_UserId��ȡ�û��������Ϣ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable GetUserInfoByMIS_UserId(string MIS_UserId)
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "����Ա��������ȡ�û��������Ϣ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable GetUserInfoByUsername(string username)
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "��ȡ��ǰ�û���ֱ����˾���ġ�Dept_ID���͡���˾���ơ���<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�{\"20\",\"�����ֹ�˾\"}</font>����ע��ʧ�ܷ��ش�����Ϣ{\"���û������ڣ��޷���ȡ��ֱ����˾��\",\"���û������ڣ��޷���ȡ��ֱ����˾��\"}��")]
        public string[] GetDirectlyUnderCompanyByADUser(string adUserName)
        {
            var ds = new string[5];
            //ds.Tables =new DataTable();
            ds[0] = "hello ";
            ds[1] = "world";
            ds[2] = "say no";
            return ds;
        }


        [WebMethod(Description = "��ȡ��ǰ�û���ֱ����˾���򡰲��š��ġ�Dept_ID���͡���˾���ơ�(��֯�ܹ��ڶ���)��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�{\"20\",\"�����ֹ�˾\"}</font>����ע��ʧ�ܷ��ش�����Ϣ{\"���û������ڣ��޷���ȡ��ֱ����˾��\",\"���û������ڣ��޷���ȡ��ֱ����˾��\"}��")]
        public string[] GetDirectlyUnderCompanyOrDeptByADUser(string adUserName)
        {
            var ds = new string[5];
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "������֯ID��ȡ��֯�������Ϣ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable GetDeptInfoById(string deptID)
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        //Сл���� 2009��9��11��16:26:19
        // [WebMethod(Description = "�����û�ID����ȡ�û�������Ȩ���ʵ�ϵͳ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable GetAppByUserID(int userID)
        {
//wp ��֧�ֽ�ɫ�е���֯��
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        //Сл����2009��9��15��9:45:47
        [WebMethod(Description = "��ȡ����Ӧ��ϵͳ���<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable GetAppTypes()
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        //Сл���� 2010��1��4��15:08:01

        #region �û�����ϵͳ��WebService

        [WebMethod(Description = "��ȡ�û����Ƶ�ϵͳ�б�(��ҳ12��)��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable get_flowRss(int v_userid)
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "��ȡ�û����Ƶ�ȫ��ϵͳ�б�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable get_flowRssAll(int v_userid)
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "��ȡ�û����Ƶ�ϵͳ��Ϣ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable get_userAppRss_ByappId(string v_appid, int v_userid)
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        // [WebMethod(Description = "��ȡ�û����Ƶ�ϵͳ���������<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�Int32</font>��")]
        public Int32 get_appMaxOrder(int v_userid)
        {
            return 16;
        }

        // [WebMethod(Description = "�û�����ϵͳ���ơ�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�bool</font>��")]
        public bool Insert_flowrss(int v_userid, int v_orderNum, string v_appid)
        {
            return true;
        }

        [WebMethod(Description = "�û�����ϵͳ���Ƹ��¡�<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�bool</font>��")]
        public bool Update_flowRss(int v_userid, int v_orderNum, string v_appid, int v_rssid)
        {
            return true;
        }

        [WebMethod(Description = "�û�����ϵͳ����ȡ����<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�bool</font>��")]
        public bool delete_flowRss(int v_userid, string v_appid)
        {
            return true;
        }

        #endregion

        //Сл����2009��9��15��9:45:47
        // [WebMethod(Description = "��ȡȫ��Ӧ��ϵͳ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable GetAllApp()
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "��ȡӦ��ϵͳ�е������û���<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable GetUsersByAppId(string appID, string appKey)
        {
//wp ��֧�ֽ�ɫ�е���֯��
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        [WebMethod(Description = "��ȡӦ��ϵͳ�����С���Ч���ҡ�δ���ڡ��Ľ�ɫ��<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�DataTable</font>��")]
        public DataTable GetAllRolesByAppId(string appID, string appKey)
        {
            var ds = new DataTable();
            //ds.Tables =new DataTable();
            return ds;
        }

        // [WebMethod(Description = "�ж�ָ����Ա�Ƿ�Ϊ���ع�˾���ž���������쵼����<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�true �� false</font>��")]
        public bool IsDeptManagerAndUpwards(string adUserName)
        {
            return true;
        }

        [WebMethod(Description = "�ж�ָ����Ա�Ƿ�Ϊ���й�˾���ľ���������쵼����<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�true �� false</font>��")]
        public bool IsCenterManagerAndUpwards(string adUserName)
        {
            return true;
        }

        [WebMethod(Description = "�ж�ָ���ļ��Ƿ������ϴ���<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�true �� false</font>��")]
        public bool IsFileAllowedToUpload(string fileName)
        {
            return true;
        }

        [WebMethod(Description = "�Ƿ�Ϊ��Ȫ���ƶ�����֯�µ�Ա����<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�true �� false</font>��", MessageName = "IsQZMCCEmployeeByUserID")]//IsQZMCCEmployeeByUserID
        public bool IsQZMCCEmployee(int userID)
        {
            return true;
        }

         [WebMethod(Description = "�Ƿ�Ϊ��Ȫ���ƶ�����֯�µ�Ա����<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�true �� false</font>��", MessageName = "IsQZMCCEmployeeByUserName")]
        public bool IsQZMCCEmployee(string userName)
        {
            return true;
        }

        [WebMethod(Description = "�Ƿ�Ϊ��Ȫ���ƶ�����֯�µ�Ա����<font color=\"gray\">��<a href=\"mailto:13905068831@139.com;15980018216@139.com;hyf@xminfoport.com?subject=[UUV Web Services]\">����֧��</a>��</font><br/>��<font color=\"red\">���أ�true �� false</font>��", MessageName = "TT")]
        public bool IsFileAllowedToUpload(int fileName)
         {
             return true;
         }


        #endregion


        #region

        /// <summary>
        /// ��ȡϵͳ�а����Ľ�ɫ
        /// </summary>
        /// <param name="appId">Ӧ��ϵͳappid</param>
        /// <returns></returns>
        public DataSet GetRoleByAppId(string appId)
        {
            var ds = new DataSet();
            //ds.Tables =new DataTable();
            return ds;
        }



        public string GetUserStrIdByUserId(int userId)
        {
            return "GetUserStrIdByUserId";
        }

        #endregion
    }
}
