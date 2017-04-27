package com.home.app.util;

import java.net.InetAddress;

public class Util {
	/**
	 * 배열에 문자가 존재하는지 체크
	 * 
	 * @param arrTarget
	 * @param strIndexOf
	 * @return
	 */
	public static boolean isIndexOf(String[] arrTarget, String strIndexOf) {
		boolean returnFlag = false;

		for (int i = 0, li_size = arrTarget.length; i < li_size; i++) {
			if (arrTarget[i].indexOf(strIndexOf) != -1) {
				returnFlag = true;

				break;
			}
		}

		return returnFlag;
	}

	/**
	 * null, 공백, undefined 체크
	 * 
	 * @param strTarget
	 * @return
	 */
	public static boolean isEmpty(String strTarget) {
		return (strTarget != null && !strTarget.toLowerCase().equals("null") && !strTarget.toLowerCase().equals("undefined") && strTarget.length() > 0) ? false : true;
	}

	/**
	 * null, 공백 체크
	 * 
	 * @param arrTarget
	 * @return
	 */
	public static boolean isEmpty(String[] arrTarget) {
		return (arrTarget != null && arrTarget.length > 0) ? false : true;
	}

	/**
	 * 두 문자열이 값이 같은지 체크
	 * 
	 * @param strTarget
	 * @param strEquals
	 * @return
	 */
	public static boolean isEquals(String strTarget, String strEquals) {
		return (!isEmpty(strTarget) && !isEmpty(strEquals) && strTarget.equals(strEquals)) ? true : false;
	}

	/**
	 * \r\n => <br />
	 * 교체
	 * 
	 * @param strText
	 * @return
	 */
	public static String replaceBR(String strText) throws Exception {
		String strReturn = "";

		if (strText != null && !strText.equals("")) {
			strReturn = strText.replace("\r\n", "<br />");
		}

		return strReturn;
	}

	/**
	 * 아이피 가져오기
	 * 
	 * @param
	 * @return
	 */
	public static String getUserIp() throws Exception {
		String strReturn = "";

		InetAddress address = InetAddress.getLocalHost();

		strReturn = address.getHostAddress();

		return strReturn;
	}

}
