package com.fh.controller.web.view;

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

import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.DelAllFile;
import com.fh.util.FileUpload;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.PathUtil;
import com.fh.util.Tools;
import com.fh.util.Watermark;
import com.fh.service.web.view.ViewManager;

/** 
 * 说明：可视化数据
 * 创建人：xiehonglun
 * 创建时间：2018-06-13
 */
@Controller
@RequestMapping(value="/view")
public class ViewController extends BaseController {
	
	String menuUrl = "view/list.do"; //菜单地址(权限用)
	@Resource(name="viewService")
	private ViewManager viewService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public ModelAndView save(
			MultipartHttpServletRequest request,
			@RequestParam(value="CONTENTS",required=false) String CONTENTS,
			@RequestParam(value="VIDEO_NAME",required=false) String VIDEO_NAME,
			@RequestParam(value="PUB_TIME",required=false) String PUB_TIME,
			@RequestParam(value="TOP",required=false) String TOP,
			@RequestParam(value="PUB_USER",required=false) String PUB_USER,
			@RequestParam(value="THUMNAIL",required=false) String THUMNAIL,
			@RequestParam(value="PUB_SOURCE",required=false) String PUB_SOURCE
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增View");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		Map<String,String> map = new HashMap<String,String>();
		String  ffile = DateUtil.getDays(), fileName = "";
		List<MultipartFile> files = request.getFiles("tp");
//		if(Jurisdiction.buttonJurisdiction(menuUrl, "add")){
		for (MultipartFile file : files) {
			if (null != file && !file.isEmpty()) {
				String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE + ffile;		//文件上传路径
				fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
			}else{
				System.out.println("上传失败");
			}
		}
			Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHFILE + ffile + "/" + fileName);//加水印
//		}
		map.put("msg", "success");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		String  number = pd.getString("NUMBER");
		if(number==null){
		pd.put("NUMBER", 0);
		}
		pd.put("VIEW_ID", this.get32UUID());	//主键
		pd.put("C_TIME", Tools.date2Str(new Date()));	//创建时间
		pd.put("VIDEO_NAME", VIDEO_NAME);
		pd.put("PUB_TIME", PUB_TIME);
		pd.put("TOP", TOP);
		pd.put("PUB_USER", PUB_USER);
		pd.put("CONTENTS", CONTENTS);
		pd.put("THUMNAIL",THUMNAIL);
		String url =ffile + "/" + fileName;
		pd.put("FILE_SOURCE", url);
		viewService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除View");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		viewService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(
			MultipartHttpServletRequest request,
			@RequestParam(value="VIEW_ID",required=false) String VIEW_ID,
			@RequestParam(value="tpz",required=false) String tpz,
			@RequestParam(value="CONTENTS",required=false) String CONTENTS,
			@RequestParam(value="VIDEO_NAME",required=false) String VIDEO_NAME,
			@RequestParam(value="PUB_TIME",required=false) String PUB_TIME,
			@RequestParam(value="TOP",required=false) String TOP,
			@RequestParam(value="PUB_USER",required=false) String PUB_USER,
			@RequestParam(value="THUMNAIL",required=false) String THUMNAIL,
			@RequestParam(value="PUB_SOURCE",required=false) String PUB_SOURCE
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改View");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		String  ffile = DateUtil.getDays(), fileName = "";
		List<MultipartFile> files = request.getFiles("tp");
		
//		MultipartFile file = files.get(0);
//		if(Jurisdiction.buttonJurisdiction(menuUrl, "add")){
		for (MultipartFile file : files) {
			if (null != file && !file.isEmpty()) {
				String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE + ffile;		//文件上传路径
				fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
			}else{
				System.out.println("上传失败");
			}
//		}
//			Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHFILE + ffile + "/" + fileName);//加水印
		}
		String url ="";
		if(files.size()==0){
			url=tpz;
		}else{
			url = ffile + "/" + fileName;
		}
		PageData pd = new PageData();
		String  number = pd.getString("NUMBER");
		if(number==null){
		pd.put("NUMBER", 0);
		}
		pd.put("VIEW_ID", VIEW_ID);
		pd.put("VIDEO_NAME", VIDEO_NAME);
		pd.put("PUB_TIME", PUB_TIME);
		pd.put("TOP", TOP);
		pd.put("PUB_USER", PUB_USER);
		pd.put("CONTENTS", CONTENTS);
		pd.put("FILE_SOURCE",url);
		pd.put("THUMNAIL",THUMNAIL);
		viewService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表View");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = viewService.list(page);	//列出View列表
		PageData pds = new PageData();
		Session session = Jurisdiction.getSession();
		pds = (PageData)session.getAttribute(Const.SESSION_userpds);
		mv.addObject("pds", pds);
		mv.setViewName("web/view/view_list");
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
		mv.setViewName("web/view/view_edit");
		//获取系统管理登录用户名
		PageData pds = new PageData();
		Session session = Jurisdiction.getSession();
		pds = (PageData)session.getAttribute(Const.SESSION_userpds);
		mv.addObject("pds", pds);
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
		pd = viewService.findById(pd);	//根据ID读取
		PageData pds = new PageData();
		Session session = Jurisdiction.getSession();
		pds = (PageData)session.getAttribute(Const.SESSION_userpds);
		
		mv.addObject("pds", pds);
		mv.setViewName("web/view/view_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除View");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			viewService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	/**删除视频
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/deltp")
	public void deltp(PrintWriter out) throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		String FILE_SOURCE = pd.getString("FILE_SOURCE");													 		//视频路径
		DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHFILE + pd.getString("FILE_SOURCE")); 	//删除视频
		if(FILE_SOURCE != null){
			viewService.delTp(pd);																//删除数据视频数据
		}	
		out.write("success");
		out.close();
	}
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出View到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("标题");	//1
		titles.add("创建时间");	//2
		titles.add("发布时间");	//3
		titles.add("发布人");	//4
		titles.add("是否置顶");	//5
		titles.add("文件来源");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = viewService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("VIDEO_NAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("C_TIME"));	    //2
			vpd.put("var3", varOList.get(i).getString("PUB_TIME"));	    //3
			vpd.put("var4", varOList.get(i).getString("PUB_USER"));	    //4
			vpd.put("var5", varOList.get(i).getString("TOP"));	    //5
			vpd.put("var6", varOList.get(i).getString("FILE_SOURCE"));	    //6
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
