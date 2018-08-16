package com.fh.controller.web.contents;

import java.io.PrintWriter;
import java.math.BigInteger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.Menu;
import com.fh.entity.system.Role;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.RightsHelper;
import com.fh.util.Tools;
import com.fh.service.system.dictionaries.DictionariesManager;
import com.fh.service.system.menu.MenuManager;
import com.fh.service.web.contents.ContentsManager;
import com.fh.service.web.share.ShareManager;

/** 
 * 说明：新闻内容管理
 * 创建人：JFaith2018
 * 创建时间：2018-03-16
 */
@Controller
@RequestMapping(value="/contents")
public class ContentsController extends BaseController {
	String menuUrl = "contents/list.do"; //菜单地址(权限用)
	@Resource(name="contentsService")
	private ContentsManager contentsService;
	@Resource(name="dictionariesService")
	private DictionariesManager dictionariesService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="shareService")
	private ShareManager shareService;
	
	
	/**保存
	 * @param 
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Contents");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String  number = pd.getString("NUMBER");
		if(number==null){
		pd.put("NUMBER", 0);
		}
		pd.put("CONTENTS_ID", this.get32UUID());	//主键
		pd.put("CRE_TIME", Tools.date2Str(new Date()));	//创建时间
		contentsService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Contents");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		contentsService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param 
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Contents");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		contentsService.edit(pd);
		String PUB_TYPE = pd.getString("PUB_TYPE");
		mv.addObject("msg","success");
		mv.addObject("PUB_TYPE",PUB_TYPE);
		mv.setViewName("save_result");
		return mv;
	}
	//文章分享保存文章内容
	@RequestMapping(value="/saveShare")
	public ModelAndView saveShare(@RequestParam String CONTENTS_ID,@RequestParam String ARTICAL_TYPE,@RequestParam String menuIds) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Contents状态");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		if(null != menuIds && !"".equals(menuIds.trim())){
		BigInteger rights = RightsHelper.sumRights(Tools.str2StrArray(menuIds));//用菜单ID做权处理
		pd.put("CONTENTS_ID", CONTENTS_ID);
		pd.put("ARTICAL_TYPE", ARTICAL_TYPE);
		pd.put("RIGHTDATE", rights);
		contentsService.editByType(pd);
		contentsService.editRight(pd);
		}else{
			pd.put("CONTENTS_ID", CONTENTS_ID);
			pd.put("ARTICAL_TYPE", "");
			pd.put("RIGHTDATE", "");
			contentsService.editByType(pd);
			contentsService.editRight(pd);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	//文章分享
	@RequestMapping(value="/goShareEdit")
	public ModelAndView goShareEdit(Model model,@RequestParam("CONTENTS_ID")String CONTENTS_ID )throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			List<Menu> menuList = menuService.listAllMenuQx("80");	//获取所有菜单
			PageData pds = new PageData();
			pds.put("CONTENTS_ID", CONTENTS_ID);
			pds = contentsService.findById(pds);
			String qx = (String)pds.get("RIGHTDATE");
			menuList = this.readMenu0(menuList,qx);
			JSONArray arr = JSONArray.fromObject(menuList);
			String json = arr.toString();
			json = json.replaceAll("MENU_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("MENU_NAME", "name").replaceAll("subMenu", "nodes").replaceAll("hasMenu", "checked");
			model.addAttribute("zTreeNodes", json);
			model.addAttribute("CONTENTS_ID", CONTENTS_ID);
			mv.setViewName("web/contents/share_edit");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}	
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Contents");
//		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");
		String PUB_TYPE = pd.getString("PUB_TYPE");
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = contentsService.list(page);	//列出Contents列表
		if(PUB_TYPE.equals("xygk")||pd.getString("PUB_TYPE").equals("zzjg")){//学院概况/组织架构
			mv.setViewName("web/contents/introduction");	
			}else if(PUB_TYPE.equals("bd27")){
				mv.setViewName("web/contents/lxwm");
			}else{
			mv.setViewName("web/contents/contents_list");
			}
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		Map<String, String> str = Jurisdiction.getHC();
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> subList = dictionariesService.subListPage("job");
		//栏目
		List<PageData> menu = dictionariesService.subListPage("menu");
		if(pd.getString("PUB_TYPE").equals("xygk")||pd.getString("PUB_TYPE").equals("zzjg")){
			mv.setViewName("web/contents/introduction_edit");	
			}else if(pd.getString("PUB_TYPE").equals("lxwm")){
				mv.setViewName("web/contents/lxwm_edit");
			}else{
			mv.setViewName("web/contents/contents_edit");
			}
		//获取系统管理登录用户名
		PageData pds = new PageData();
		Session session = Jurisdiction.getSession();
		pds = (PageData)session.getAttribute(Const.SESSION_userpds);
		mv.addObject("pds", pds);
		mv.addObject("msg", "save");
		mv.addObject("type", "0");
		mv.addObject("pd", pd);
		mv.addObject("subList", subList);
		mv.addObject("menu", menu);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = contentsService.findById(pd);	//根据ID读取
		List<PageData> subList = dictionariesService.subListPage("job");
		//栏目
		List<PageData> menu = dictionariesService.subListPage("menu");
		if(pd.getString("PUB_TYPE").equals("xygk")||pd.getString("PUB_TYPE").equals("zzjg")){
			mv.setViewName("web/contents/introduction_edit");	
			}else if(pd.getString("PUB_TYPE").equals("bd27")){
				mv.setViewName("web/contents/lxwm_edit");
			}else{
			mv.setViewName("web/contents/contents_edit");
		}
		mv.addObject("msg", "edit");
		//获取系统管理登录用户名
		PageData pds = new PageData();
		Session session = Jurisdiction.getSession();
		pds = (PageData)session.getAttribute(Const.SESSION_userpds);
		mv.addObject("pds", pds);
		mv.addObject("pd", pd);
		mv.addObject("subList", subList);
		mv.addObject("menu", menu);
		return mv;
	}	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Contents");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			contentsService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Contents到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("标题");	//1
		titles.add("发布人");	//2
		titles.add("发布类型");	//3
		titles.add("创建时间");	//4
		titles.add("发布时间");	//5
		titles.add("发布内容");	//6
		titles.add("链接");	//7
		titles.add("缩略图");	//8
		titles.add("发布状态");	//9
		titles.add("新闻位置");	//10
		dataMap.put("titles", titles);
		List<PageData> varOList = contentsService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("TITLE"));	    //1
			vpd.put("var2", varOList.get(i).getString("PUBLISHER"));	    //2
			vpd.put("var3", varOList.get(i).getString("PUB_TYPE"));	    //3
			vpd.put("var4", varOList.get(i).getString("CRE_TIME"));	    //4
			vpd.put("var5", varOList.get(i).getString("PUB_TIME"));	    //5
			vpd.put("var6", varOList.get(i).getString("CONTENT"));	    //6
			vpd.put("var7", varOList.get(i).getString("PUB_LINK"));	    //7
			vpd.put("var8", varOList.get(i).getString("THUMNAIL"));	    //8
			vpd.put("var9", varOList.get(i).getString("PUB_STATE"));	    //9
			vpd.put("var10", varOList.get(i).getString("PUB_POSITION"));	    //10
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	/**
	 * 根据web_contents表中的相关字段来改变状态
	 * @param menuList
	 * @param roleRights
	 * @return
	 */
	public List<Menu> readMenu0(List<Menu> menuList,String ARTICAL_TYPE){
		for(int i=0;i<menuList.size();i++){
			menuList.get(i).setHasMenu(RightsHelper.testRights(ARTICAL_TYPE, menuList.get(i).getMENU_ID()));
			this.readMenu0(menuList.get(i).getSubMenu(), ARTICAL_TYPE);					//是：继续排查其子菜单
		}
		return menuList;
	}
	//更具列表中选中的分享菜单改变菜单状态
	public static boolean getFlag(){
		return false;
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	//测试权限的判断方法，详情请进个人博客honglun.top;
//	public static void main(String[] args) {
//		int i = 1;
//		BigInteger b = new BigInteger("0");
//		b = b.setBit(i);
//		System.out.println(ContentsController.testRights(b, 1));
//	}
//	public static boolean testRights(BigInteger sum,int targetRights){  
//        return sum.testBit(targetRights);  
//    } 
	
	
}
