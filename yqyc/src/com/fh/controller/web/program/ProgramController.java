package com.fh.controller.web.program;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
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
import com.fh.service.web.program.ProgramManager;

/** 
 * 说明：业务方案
 * 创建人：xiehonglun
 * 创建时间：2018-07-09
 */
@Controller
@RequestMapping(value="/program")
public class ProgramController extends BaseController {
	
	String menuUrl = "program/list.do"; //菜单地址(权限用)
	@Resource(name="programService")
	private ProgramManager programService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(HttpServletRequest request,
			@RequestParam(value="PROGRAM_ID",required=false) String PROGRAM_ID,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="PUB_TIME",required=false) String PUB_TIME,
			@RequestParam(value="TYPE",required=false) String TYPE,
			@RequestParam(value="CONTENTS",required=false) String CONTENTS,
			@RequestParam(value="IMG1",required=false) String image_file1,
			@RequestParam(value="IMG2",required=false) String image_file2,
			@RequestParam(value="DESCRIPT",required=false) String DESCRIPT) throws Exception{
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
		logBefore(logger, Jurisdiction.getUsername()+"新增Program");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String  number = pd.getString("NUMBER");
		if(number==null){
		pd.put("NUMBER", 0);
		}
		pd.put("PROGRAM_ID", this.get32UUID());	//主键
		if(img1.equals("")||img2.equals("")){
			pd.put("IMG1", image_file1);
			pd.put("IMG2", image_file2);	
		}else{
			pd.put("IMG1", img1);
			pd.put("IMG2", img2);
		}
		pd.put("TITLE", TITLE);
		pd.put("PUB_TIME", PUB_TIME);
		pd.put("PUB_TIME", PUB_TIME);
		pd.put("TYPE", TYPE);
		pd.put("CONTENTS", CONTENTS);
		pd.put("DESCRIPT", DESCRIPT);
		programService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Program");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		programService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping( value="/edit")
	public ModelAndView edit(HttpServletRequest request,
			@RequestParam(value="PROGRAM_ID",required=false) String PROGRAM_ID,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="PUB_TIME",required=false) String PUB_TIME,
			@RequestParam(value="TYPE",required=false) String TYPE,
			@RequestParam(value="CONTENTS",required=false) String CONTENTS,
			@RequestParam(value="IMG1",required=false) String image_file1,
			@RequestParam(value="IMG2",required=false) String image_file2,
			@RequestParam(value="state1",required=false) String state1,
			@RequestParam(value="state2",required=false) String state2,
			@RequestParam(value="DESCRIPT",required=false) String DESCRIPT) throws Exception{
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
	        		if(state1.equals(image_file1)){
	        			pd.put("IMG1", state1);
	        			pd.put("IMG2", img1);
	        		}else if(state2.equals(image_file2)){
	        			pd.put("IMG2", state2);
	        			pd.put("IMG1", img1);
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
		logBefore(logger, Jurisdiction.getUsername()+"修改Program");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		
		String PUB_TYPE = pd.getString("PUB_TYPE");
		if(img1.equals("")&&img2.equals("")){
			pd.put("IMG1", image_file1);
			pd.put("IMG2", image_file2);	
		}if(img1.length()>0&&img2.length()>0){
			pd.put("IMG1", img1);
			pd.put("IMG2", img2);
		}
		pd.put("PROGRAM_ID", PROGRAM_ID);
		pd.put("TITLE", TITLE);
		pd.put("PUB_TIME", PUB_TIME);
		pd.put("PUB_TIME", PUB_TIME);
		pd.put("TYPE", TYPE);
		pd.put("CONTENTS", CONTENTS);
		pd.put("DESCRIPT", DESCRIPT);
		programService.edit(pd);
		mv.addObject("msg","success");
		mv.addObject("PUB_TYPE",PUB_TYPE);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Program");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		String type = pd.getString("TYPE");
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = programService.list(page);	//列出Program列表
		if(type.equals("04")){
		mv.setViewName("web/program/optimal_list");	
		}else{
		mv.setViewName("web/program/program_list");
		}
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
		mv.setViewName("web/program/program_edit");
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
		pd = programService.findById(pd);	//根据ID读取
		if(pd.getString("TYPE").equals("04")){
		mv.setViewName("web/program/optimal_edit");		
		}else{
		mv.setViewName("web/program/program_edit");
		}
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Program");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			programService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Program到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("标题");	//1
		titles.add("发布时间");	//2
		titles.add("内容");	//3
		dataMap.put("titles", titles);
		List<PageData> varOList = programService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("TITLE"));	    //1
			vpd.put("var2", varOList.get(i).getString("PUB_TIME"));	    //2
			vpd.put("var3", varOList.get(i).getString("CONTENTS"));	    //3
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
	//测试用
	@RequestMapping(value="/test1")
	public ModelAndView test()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("web/program/test");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	@RequestMapping( value="/totest1")
	public ModelAndView totest(@RequestParam("file") CommonsMultipartFile[] files,HttpServletRequest request) throws Exception{
		for(int i = 0;i<files.length;i++){
			System.out.println("fileName---------->" + files[i].getOriginalFilename());
			if(!files[i].isEmpty()){
				int pre = (int) System.currentTimeMillis();
				try {
					//拿到输出流，同时重命名上传的文件
					FileOutputStream os = new FileOutputStream("H:/" + new Date().getTime() + files[i].getOriginalFilename());
					//拿到上传文件的输入流
					FileInputStream in = (FileInputStream) files[i].getInputStream();
					
					//以写字节的方式写文件
					int b = 0;
					while((b=in.read()) != -1){
						os.write(b);
					}
					os.flush();
					os.close();
					in.close();
					int finaltime = (int) System.currentTimeMillis();
					System.out.println(finaltime - pre);
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("上传出错");
				}
		}
		}
	return null;	
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
