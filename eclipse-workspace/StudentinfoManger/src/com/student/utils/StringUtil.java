package com.student.utils;

public class StringUtil {
	
	public static boolean checkNull(String ... strs) {
		//空字符串数组
		if(null == strs || strs.length <= 0) {
			return true;
		}
		//数组中含有空字符串
		for(String str : strs) {
			if(null == str || "".equals(str)) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 判断表格中的数据内容是否为空 map.get(XX).toString -> null
	 * @param obj
	 * @return
	 */
	public static String toString(Object obj) {
		if(null == obj) {
			return "";
		}
		return obj.toString();
	}
}
