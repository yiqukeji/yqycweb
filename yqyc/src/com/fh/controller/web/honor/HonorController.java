package com.fh.controller.web.honor;

import java.io.File;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import com.fh.util.ToUpLoadBacthHmImage;
import com.fh.util.Tools;
import com.fh.service.web.honor.HonorManager;

/** 
 * 说明：荣誉资质
 * 创建人：xiehonglun
 * 创建时间：2018-07-06
 */
@Controller
@RequestMapping(value="/honor")
public class HonorController extends BaseController {
	
	String menuUrl = "honor/list.do"; //菜单地址(权限用)
	@Resource(name="honorService")
	private HonorManager honorService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(HttpServletRequest request,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="TIME",required=false) String TIME,
			@RequestParam(value="CONTENT",required=false) String CONTENT) throws Exception{
		String img1 = "";
		this.init(request);
	        try {
	        	String imgPath = ToUpLoadBacthHmImage.upload(request);
	        	imgPath = imgPath.substring(0, imgPath.length()-2);
	        	String imgUrl = Const.FILEPATHIMG;
	        	img1 = imgUrl.substring(0, imgUrl.length()-1)+imgPath.split("yq")[0];
	            request.setAttribute("msg", "ok");
	            request.setAttribute("map", this.getMap());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		logBefore(logger, Jurisdiction.getUsername()+"新增Honor");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("HONOR_ID", this.get32UUID());	//主键
		pd.put("TITLE", TITLE);
		pd.put("TIME", TIME);
		pd.put("CONTENT", CONTENT);
		pd.put("IMG", img1);
		honorService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Honor");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		honorService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(HttpServletRequest request,
			@RequestParam(value="HONOR_ID",required=false) String HONOR_ID,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="TIME",required=false) String TIME,
			@RequestParam(value="CONTENT",required=false) String CONTENT,
			@RequestParam(value="IMG",required=false) String IMG) throws Exception{
		String img1 = "";
		this.init(request);
	        try {
	        	String imgPath = ToUpLoadBacthHmImage.upload(request);
	        	imgPath = imgPath.substring(0, imgPath.length()-2);
	        	String imgUrl = Const.FILEPATHIMG;
	        	img1 = imgUrl.substring(0, imgUrl.length()-1)+imgPath.split("yq")[0];
	            request.setAttribute("msg", "ok");
	            request.setAttribute("map", this.getMap());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		logBefore(logger, Jurisdiction.getUsername()+"修改Honor");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(img1==null||img1.equals("")){
			pd.put("IMG", IMG);
		}else{
			pd.put("IMG", img1);
		}
		pd.put("HONOR_ID", HONOR_ID);	//主键
		pd.put("TITLE", TITLE);
		pd.put("TIME", TIME);
		pd.put("CONTENT", CONTENT);
		honorService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Honor");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = honorService.list(page);	//列出Honor列表
		mv.setViewName("web/honor/honor_list");
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
		mv.setViewName("web/honor/honor_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
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
		pd = honorService.findById(pd);	//根据ID读取
		mv.setViewName("web/honor/honor_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Honor");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			honorService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Honor到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("标题");	//1
		titles.add("焦点图");	//2
		titles.add("发布时间");	//3
		titles.add("内容");	//4
		dataMap.put("titles", titles);
		List<PageData> varOList = honorService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("TITLE"));	    //1
			vpd.put("var2", varOList.get(i).getString("IMG"));	    //2
			vpd.put("var3", varOList.get(i).getString("TIME"));	    //3
			vpd.put("var4", varOList.get(i).getString("CONTENT"));	    //4
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
	 public void init(HttpServletRequest request) {
	        if(ToUpLoadBacthHmImage.FILEDIR == null){
	        	ToUpLoadBacthHmImage.FILEDIR = request.getSession().getServletContext().getRealPath("/") + Const.FILEPATHIMG;
	        }
	    }
	    public Map<String, String> getMap(){
	        Map<String, String> map = new HashMap<String, String>();
	        File[] files = new File(ToUpLoadBacthHmImage.FILEDIR).listFiles();
	        if(files != null){
	            for (File file : files) {
	                if(file.isDirectory()){
	                    File[] files2 = file.listFiles();
	                    if(files2 != null){
	                        for (File file2 : files2) {
	                            String name = file2.getName();
	                            map.put(file2.getParentFile().getName() + "/" + name, name.substring(name.lastIndexOf("_")+1));
	                        }
	                    }
	                }
	            }
	        }
	        return map;
	    }
}
