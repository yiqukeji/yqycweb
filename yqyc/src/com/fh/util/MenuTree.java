package com.fh.util;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.fh.entity.system.Menu;
/**
 * 实现无限极菜单结构
 * @author MrXieTao
 *
 */
public class MenuTree {
	public static Map<String,Object> mapArray = new LinkedHashMap<String, Object>();  
    public List<Menu> menuCommon;  
    public List<Object> list = new ArrayList<Object>(); 
    public List<Object> menuList(List<Menu> menu){      
        this.menuCommon = menu;  
        for (Menu x : menu) {     
            Map<String,Object> mapArr = new LinkedHashMap<String, Object>();  
            if(x.getPARENT_ID()=="0"){  
                mapArr.put("id", x.getMENU_ID());  
                mapArr.put("name", x.getMENU_NAME());  
                mapArr.put("pid", x.getPARENT_ID());    
                mapArr.put("child", menuChild(x.getMENU_ID()));    
                list.add(mapArr);  
            }  
        }     
        return list;  
    }  
    public List<?> menuChild(String id){  
        List<Object> lists = new ArrayList<Object>();  
        for(Menu a:menuCommon){  
            Map<String,Object> childArray = new LinkedHashMap<String, Object>();  
            if(a.getPARENT_ID()=="0"){  
                childArray.put("id", a.getMENU_ID());  
                childArray.put("name", a.getMENU_NAME());  
                childArray.put("pid", a.getPARENT_ID());  
                childArray.put("child", menuChild(a.getMENU_ID()));    
                lists.add(childArray);  
            }  
        }  
        return lists;  
          
    }  
}
