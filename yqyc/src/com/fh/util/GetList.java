package com.fh.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 获取不重复的数组元素
 * @author MrXieTao
 *
 */
public class GetList {
	 public static List<String> getNoRepeatList(List<String> sorts){
		 List<String> temp = new ArrayList<String>(); 
		 Iterator<String> it = sorts.listIterator();  
	        while (it.hasNext()) {  
	            Object o = it.next();  
	            if (!temp.contains(o)) { // 如果temp还没有这个元素，就添加  
	                temp.add((String) o);  
	            }  
	        }  
	        return temp;  
	 }
}
