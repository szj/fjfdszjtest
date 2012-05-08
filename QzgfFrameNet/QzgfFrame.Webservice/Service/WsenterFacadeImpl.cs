using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Services;
using Newtonsoft.Json;
using QzgfFrame.Utility.Core.Repository;
using QzgfFrame.Webservice.Models;

namespace QzgfFrame.Webservice.Service
{
    //[WebServiceBinding(ConformsTo = WsiProfiles.None)]
    public class WsenterFacadeImpl : WsenterFacade
    {
        private IRepository<Yd170data> wsenterRepository { set; get; }
        protected log4net.ILog Logger = log4net.LogManager.GetLogger("Wsenter");
        /// <summary>
        /// 170���ݵ���
        /// </summary>
        /// <param name="datajson">170���ݵ�json��ʽ</param>
        /// <returns>true:����ɹ�,false:����ʧ��</returns>
        [WebMethod(Description = "����:����170����.����˵��:170���ݵ�json��ʽ��<br/>��<font color=\"red\">���أ�true:����ɹ�,false:����ʧ��</font>��")]
        public bool Import170(string datajson)
        {
            bool result = false;
            try
            {
                Logger.Info("(ʱ��:"+DateTime.Now+")170��������:" + datajson);
                var data = JsonConvert.DeserializeObject<Yd170data>(datajson);
                //var data = JsonConvert.DeserializeObject<IList<Yd170data>>(datajson);��������,��ʱ����.
                //һЩ��Ϣ��ʼ��
                data.Id = wsenterRepository.NewSequence("Yd170data");
                data.State = "1";
                //����
                result = wsenterRepository.Save(data);


                Logger.Info("170�������" + result);
            }
            catch (Exception ex)
            {
                Logger.Error("170�쳣��Ϣ:"+ex.ToString());
            }

    return result;
        }
        /*��������
         {"Id":"","Citycountryno":"","Ensuregrade":"","Clientgrade":"","Importlevel":"","Managertel":"","Name":"","Isflyover":"","Intendmoney":"","Expressremark":"","Operationtype":"","Applyman":"","Applytel":"","Applyfax":"34","Clienttype":"","Communicateaddress":"","Groupid":"","Clientcompanyname":"","Citycounty":"","Projectexpository":"","Completetime13":"\/Date(-62135596800000+0800)\/","Completetime14":"\/Date(-62135596800000+0800)\/","Completetime15":"\/Date(-62135596800000+0800)\/","Completetime16":"\/Date(-62135596800000+0800)\/","Wanequipment":"","Wanequipmentport":"","Bandwidth":"","Circuitno":"","Transfersequipment":"","Transfersequipmentport":"","Coreinformation":"","Orgnetmode":"","Vlan":"","Wanswitchequipment":"","Wanswitchequipmentport":"","Basestation":"","Clientip":"","Clientgateway":"","Clientsubnetmask":"","Accesstothebasestation":"123","Noresource":"","Wanbossfactorymode":"","Userfirstfactory":"","Userfirstmode":"","Usersencodefactory":"","Usersencodemode":"","Userthirdfactory":"","Userthirdmode":"","Userfourfactory":"","Userfourmode":"","Userfivefactory":"","Userfivemode":"","Basestationfirstfactory":"","Basestationfirstmode":"","Basestationsencodefactory":"","Basestationsencodemode":"","Groupinnet":"","Maintenancecompany":"","Isintegratebeforehand":"","Islinepipebefordhand":"","Isintegrateindue":"","Islinepipeindue":"","State":"","IsChanged":true,"IsDeleted":false}
         */
    }
}
