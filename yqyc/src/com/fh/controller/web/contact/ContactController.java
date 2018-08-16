package com.fh.controller.web.contact;

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
import com.fh.service.web.contact.ContactManager;

/** 
 * 说明：联系我们
 * 创建人：JFaith
 * 创建时间：2018-06-30
 * 这是测试文件提交
 */
@Controller
@RequestMapping(value="/contact")
public class ContactController extends BaseController {
	
	String menuUrl = "contact/list.do"; //菜单地址(权限用)
	@Resource(name="contactService")
	private ContactManager contactService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(HttpServletRequest request,
			@RequestParam(value="CONTACT_ID",required=false) String CONTACT_ID,
			@RequestParam(value="TEL",required=false) String TEL,
			@RequestParam(value="WB",required=false) String WB,
			@RequestParam(value="WX",required=false) String WX,
			@RequestParam(value="EMAIL",required=false) String EMAIL,
			@RequestParam(value="ADDRESS",required=false) String ADDRESS
			) throws Exception{
		String img1 = "";
		String img2 = "";
		this.init(request);
	        try {
	        	String imgPath = ToUpLoadBacthHmImage.upload(request);
	        	imgPath = imgPath.substring(0, imgPath.length()-2);
	        	String imgUrl = Const.FILEPATHIMG;
	        	int j = imgPath.split("yq").length;
	        	if(j==1){
	        		img1 = imgUrl.substring(0, imgUrl.length()-1)+imgPath.split("yq")[0];
	        	}else if(j==2){
	        		img1 = imgUrl.substring(0, imgUrl.length()-1)+imgPath.split("yq")[0];
	        		img2 = imgUrl.substring(0, imgUrl.length()-1)+imgPath.split("yq")[1];
	        	}
	            request.setAttribute("msg", "ok");
	            request.setAttribute("map", this.getMap());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		logBefore(logger, Jurisdiction.getUsername()+"新增Contact");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CONTACT_ID", this.get32UUID());	//主键
		pd.put("TEL",TEL);
		pd.put("WB", img1);	
		pd.put("WX", img2);	
		pd.put("EMAIL", EMAIL);	
		pd.put("ADDRESS", ADDRESS);	
		contactService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Contact");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		contactService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(HttpServletRequest request,
			@RequestParam(value="CONTACT_ID",required=false) String CONTACT_ID,
			@RequestParam(value="TEL",required=false) String TEL,
			@RequestParam(value="WB",required=false) String WB,
			@RequestParam(value="WX",required=false) String WX,
			@RequestParam(value="state1",required=false) String state1,
			@RequestParam(value="state2",required=false) String state2,
			@RequestParam(value="EMAIL",required=false) String EMAIL,
			@RequestParam(value="ADDRESS",required=false) String ADDRESS) throws Exception{
		String img1 = "";
		String img2 = "";
		PageData pd = new PageData();
		pd = this.getPageData();
		this.init(request);
	        try {
	        	String imgPath = ToUpLoadBacthHmImage.upload(request);
	        	imgPath = imgPath.substring(0, imgPath.length()-2);
	        	String imgUrl = Const.FILEPATHIMG;
	        	int j = imgPath.split("yq").length;
	        	if(j==1){
	        		img1 = imgUrl.substring(0, imgUrl.length()-1)+imgPath.split("yq")[0];
	        		if(state1.equals(WB)){
	        			pd.put("WB", state1);
	        			pd.put("WX", img1);
	        		}else if(state2.equals(WX)){
	        			pd.put("WX", state2);
	        			pd.put("WB", img1);
	        		}
	        	}else if(j==2){
	        		img1 = imgUrl.substring(0, imgUrl.length()-1)+imgPath.split("yq")[0];
	        		img2 = imgUrl.substring(0, imgUrl.length()-1)+imgPath.split("yq")[1];
	        	}
	            request.setAttribute("msg", "ok");
	            request.setAttribute("map", this.getMap());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
		logBefore(logger, Jurisdiction.getUsername()+"修改Contact");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		
		
		if(img1.equals("")&&img2.equals("")){//当都没有上传东西时，但是有有东西
			pd.put("WB", WB);
			pd.put("WX", WX);	
		}if(img1.length()>0&&img2.length()>0){
			pd.put("WB", img1);
			pd.put("WX", img2);
		}
		pd.put("CONTACT_ID", CONTACT_ID);
		pd.put("TEL",TEL);
		pd.put("EMAIL", EMAIL);	
		pd.put("ADDRESS", ADDRESS);	
		contactService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Contact");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = contactService.list(page);	//列出Contact列表
		mv.setViewName("web/contact/contact_list");
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
		mv.setViewName("web/contact/contact_edit");
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
		pd = contactService.findById(pd);	//根据ID读取
		mv.setViewName("web/contact/contact_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Contact");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			contactService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Contact到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("标题");	//1
		titles.add("创建时间");	//2
		titles.add("发布时间");	//3
		titles.add("文章来源");	//4
		titles.add("浏览次数");	//5
		titles.add("内容");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = contactService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("TITLE"));	    //1
			vpd.put("var2", varOList.get(i).getString("C_TIME"));	    //2
			vpd.put("var3", varOList.get(i).getString("P_TIME"));	    //3
			vpd.put("var4", varOList.get(i).getString("A_SOURCE"));	    //4
			vpd.put("var5", varOList.get(i).getString("NUMBER"));	    //5
			vpd.put("var6", varOList.get(i).getString("CONTENTS"));	    //6
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
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
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
		System.out.println("");
	}
	
}
