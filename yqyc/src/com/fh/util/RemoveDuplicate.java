package com.fh.util;

import java.util.ArrayList;
import java.util.List;

import com.fh.entity.system.Menu;


/**
 * 去除list集合中的重复的数据
 * @author MrXieTao
 *
 */
public  class RemoveDuplicate {
	public static List<Menu> list(List<Menu> listMenu){
	List<Menu> repeatList = new ArrayList<Menu>();
	for(int i = 0;i<listMenu.size()-1;i++){
		for(int j = listMenu.size()-1;j>i;j--){
			if(listMenu.get(j).getMENU_NAME().equals(listMenu.get(i).getMENU_NAME())){
				repeatList.add(listMenu.get(j));
				listMenu.remove(j);
			}
		}
	}
	return listMenu;
	}
}
