package com.home.app.util;

import java.net.InetAddress;

public class Func {
	
	public Func()
	{
	}	
	
	public static String replaceBR(String strText) throws Exception {
		String strReturn = "";
		
		if (strText != null && !strText.equals("")) {
			strReturn = strText.replace("\r\n", "<br />");
		}
		
		return strReturn;
	}
	
	public static String getReplyImage(int intDepNo, String strMode) throws Exception {
		String strReturn = "";
		
		String strBlankImage = "/resources/images/icon/icon_dummy.gif";
		String strReplyImage = "/resources/images/icon/icon_reply.gif";
		
        if (intDepNo != 0)
        {
            if (strMode.equals("List"))
            {
                strReturn = "<img src='" + strBlankImage + "' width='" + 15 * (intDepNo - 1) + "' height='1' border='0' style='vertical-align: middle;' />";
                strReturn += "<img src='" + strReplyImage + "' border='0' style='vertical-align: middle;' />";
            }
            else if (strMode.equals("Comment"))
            {
                strReturn = "<img src='" + strReplyImage + "' border='0' style='float: left; vertical-align: middle; margin-top: 2px;' />";
            }
            else
            {
                strReturn = "<img src='" + strBlankImage + "' width='" + 15 * (intDepNo - 1) + "' height='1' border='0' style='float: left; vertical-align: middle; margin-top: 2px;' />";
                strReturn += "<img src='" + strReplyImage + "' border='0' style='float: left; vertical-align: middle; margin-top: 2px;' />";
            }
        }
		
		return strReturn;
	}
	
	public static String getUserIp() throws Exception {
		String strReturn = "";
		
		InetAddress address = InetAddress.getLocalHost();
		
		strReturn = address.getHostAddress();
		
		return strReturn;
	}

}
