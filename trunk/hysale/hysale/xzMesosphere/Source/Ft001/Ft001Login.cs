using System;
using System.Collections.Generic;
using XzzLibrary.Source;
using System.Text;
using System.Collections;

namespace xzMesosphere.Source
{
    public class Ft001Login
    {
        public static void Login(xzServerManage FServerManage)
        {
            HyTradeArchives.Login(FServerManage); //��������
            HyTradeOrder.Login(FServerManage);    //ҵ�񶩵�   
            HyTradeSample.Login(FServerManage);   //��Ʒ���  
        }
    }
}
