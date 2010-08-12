 /*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

 /**
 * Project  : MapleFetion
 * Package  : net.solosky.maplefetion.protocol.notify
 * File     : UserEnteredConversationNotifyHandler.java
 * Author   : solosky < solosky772@qq.com >
 * Created  : 2009-11-26
 * License  : Apache License 2.0 
 */
package net.solosky.maplefetion.protocol.notify;

import net.solosky.maplefetion.protocol.ChatDialog;
import net.solosky.maplefetion.sip.SIPNotify;
import net.solosky.maplefetion.util.XMLHelper;

import org.jdom.Element;

/**
 *
 *	用户进入对话后的通知
 *
 * @author solosky <solosky772@qq.com> 
 */
public class ConversationNotifyHandler extends AbstractSIPNotifyHandler
{

	/* (non-Javadoc)
     * @see net.solosky.maplefetion.protocol.ISIPNotifyHandler#handle(net.solosky.maplefetion.sip.SIPNotify)
     */
    @Override
    public void handle(SIPNotify notify) throws Exception
    {
    	Element root   = XMLHelper.build(notify.getBody().toSendString());
    	Element event  = XMLHelper.find(root, "/events/event");
    	String type = event.getAttributeValue("type");
    	if(type.equals("UserEntered")) {    	//这里只是处理了好友进入会话请求
    		this.userEntered(event);
    	}else if(type.equals("UserLeft")){
    		this.userLeft(event);
    	}else {
    		logger.warn("Unknown converstion event type:"+type);
    	}    	
    }
    
    
    /**
     * 用户进入了会话
     */
    private void userEntered(Element event)
    {
    	if(this.dialog instanceof ChatDialog) {
    		ChatDialog cd = (ChatDialog) this.dialog;
    		Element member = event.getChild("member");
    		String uri = member.getAttributeValue("uri");
    		cd.buddyEntered(uri);
    		
    		logger.debug("Buddy entered this dialog:"+uri);
    	}
    }
    
    
    /**
     * 用户离开了回话
     * @throws Exception 
     */
    private void userLeft(Element event) throws Exception
    {
    	if(this.dialog instanceof ChatDialog) {
    		ChatDialog cd = (ChatDialog) this.dialog;
    		Element member = event.getChild("member");
    		String uri = member.getAttributeValue("uri");
    		cd.buddyLeft(uri);
    		
    		logger.debug("Buddy left this dialog:"+uri);
    	}
    	
    }
    
    
}
