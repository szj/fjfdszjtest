
namespace QzgfFrame.Webservice.Service
{
    public interface WsenterFacade
    {
        /// <summary>
        /// 170���ݵ���
        /// </summary>
        /// <param name="datajson">170���ݵ�json��ʽ</param>
        /// <returns>true:����ɹ�,false:����ʧ��</returns>
        bool Import170(string datajson);

    }
}
