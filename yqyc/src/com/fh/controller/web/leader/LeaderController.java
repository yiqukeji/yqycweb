package com.fh.controller.web.leader;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.system.dictionaries.DictionariesManager;
import com.fh.service.web.leader.LeaderManager;

/** 
 * 说明：现任领导
 * 创建人：xiehonglun
 * 创建时间：2018-06-12
 */
@Controller
@RequestMapping(value="/leader")
public class LeaderController extends BaseController {
	
	String menuUrl = "leader/list.do"; //菜单地址(权限用)
	@Resource(name="leaderService")
	private LeaderManager leaderService;
	@Resource(name="dictionariesService")
	private DictionariesManager dictionariesService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(@RequestParam String y,@RequestParam String m,@RequestParam String d) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Leader");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String  number = pd.getString("NUMBER");
		if(number==null){
		pd.put("NUMBER", 0);
		}
		pd.put("LEADER_ID", this.get32UUID());	//主键
		pd.put("C_TIME", Tools.date2Str(new Date()));	//创建时间
		String ymd = y+"-"+m+"-"+d;
		pd.put("OLD", ymd);
		leaderService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Leader");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		leaderService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(@RequestParam String y,@RequestParam String m,@RequestParam String d) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Leader");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		String ymd = y+"-"+m+"-"+d;
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("OLD", ymd);
		leaderService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Leader");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = leaderService.list(page);	//列出Leader列表
		mv.setViewName("web/leader/leader_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
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
		mv.setViewName("web/leader/leader_edit");
		List<PageData> subList = dictionariesService.subListPage("job");
		//获取系统管理登录用户名
		PageData pds = new PageData();
		Session session = Jurisdiction.getSession();
		pds = (PageData)session.getAttribute(Const.SESSION_userpds);
		mv.addObject("pds", pds);
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		mv.addObject("subList", subList);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = leaderService.findById(pd);	//根据ID读取
		mv.setViewName("web/leader/leader_edit");
		List<PageData> subList = dictionariesService.subListPage("job");
	   //获取系统管理登录用户名
		PageData pds = new PageData();
		Session session = Jurisdiction.getSession();
		pds = (PageData)session.getAttribute(Const.SESSION_userpds);
		mv.addObject("pds", pds);
		//获取出生年月日
		String ymd = pd.getString("OLD");
		String y = ymd.split("-")[0];
		String m = ymd.split("-")[1];
		String d = ymd.split("-")[2];
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("y", y);
		mv.addObject("m", m);
		mv.addObject("d", d);
		mv.addObject("subList", subList);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Leader");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			leaderService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Leader到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("姓名");	//1
		titles.add("职位");	//2
		titles.add("描述");	//3
		titles.add("性别");	//4
		titles.add("年龄");	//5
		titles.add("邮箱");	//6
		titles.add("联系电话");	//7
		titles.add("内容");	//8
		titles.add("创建时间");	//9
		titles.add("发布时间");	//10
		titles.add("发布人");	//11
		titles.add("发布来源");	//12
		titles.add("浏览次数");	//13
		dataMap.put("titles", titles);
		List<PageData> varOList = leaderService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("NAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("JOB"));	    //2
			vpd.put("var3", varOList.get(i).getString("DESCRIPTION"));	    //3
			vpd.put("var4", varOList.get(i).getString("GENDER"));	    //4
			vpd.put("var5", varOList.get(i).getString("OLD"));	    //5
			vpd.put("var6", varOList.get(i).getString("EMAIL"));	    //6
			vpd.put("var7", varOList.get(i).getString("TEL"));	    //7
			vpd.put("var8", varOList.get(i).getString("CONTENTS"));	    //8
			vpd.put("var9", varOList.get(i).getString("C_TIME"));	    //9
			vpd.put("var10", varOList.get(i).getString("PUB_TIME"));	    //10
			vpd.put("var11", varOList.get(i).getString("PUB_USER"));	    //11
			vpd.put("var12", varOList.get(i).getString("PUB_SOURCE"));	    //12
			vpd.put("var13", varOList.get(i).get("NUMBER").toString());	//13
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
