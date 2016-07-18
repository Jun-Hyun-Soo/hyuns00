package com.home.app.util;

public class Util 
{			
	/**
	 * 배열에 문자가 존재하는지 체크
	 * @param targetArr
	 * @param indexOfStr
	 * @return
	 */
	public static boolean isIndexOf(String[] targetArr, String indexOfStr) 
	{		
		
		boolean returnFlag = false;
		
		for (int i = 0, li_size = targetArr.length; i < li_size; i++) 
		{
			
			if (targetArr[i].indexOf(indexOfStr) != -1) 
			{
				returnFlag = true;
				
				break;
			}
		}
		
		return returnFlag;
	}
	
	/**
	 * null, 공백, undefined 체크
	 * @param targetStr
	 * @return
	 */
	public static boolean isEmpty(String targetStr) 
	{		

		return (targetStr != null && !targetStr.toLowerCase().equals("null") && !targetStr.toLowerCase().equals("undefined") && targetStr.length() > 0) ? false : true;
	}
	
	/**
	 * null, 공백 체크
	 * @param targetArr
	 * @return
	 */
	public static boolean isEmpty(String[] targetArr) 
	{		
		
		return (targetArr != null && targetArr.length > 0) ? false : true;
	}
	
	/**
	 * 두 문자열이 값이 같은지 체크
	 * @param targetStr
	 * @param equalsStr
	 * @return
	 */
	public static boolean isEquals(String targetStr, String equalsStr) 
	{		

		return (!isEmpty(targetStr) && !isEmpty(equalsStr) && targetStr.equals(equalsStr)) ? true : false;
	}

}
