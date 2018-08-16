package com.fh.controller.system.createhtml;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.web.aboutus.AboutusManager;
import com.fh.service.web.contact.ContactManager;
import com.fh.service.web.contents.ContentsManager;
import com.fh.service.web.cooperation.CooperationManager;
import com.fh.service.web.corporatephilosophy.CorporatephilosophyManager;
import com.fh.service.web.cource.CourceManager;
import com.fh.service.web.honor.HonorManager;
import com.fh.service.web.idea.IdeaManager;
import com.fh.service.web.image.ImageManager;
import com.fh.service.web.information.InformationManager;
import com.fh.service.web.introduce.IntroduceManager;
import com.fh.service.web.leader.LeaderManager;
import com.fh.service.web.news.NewsManager;
import com.fh.service.web.ourbusiness.OurBusinessManager;
import com.fh.service.web.program.ProgramManager;
import com.fh.service.web.view.ViewManager;
import com.fh.service.web.work.WorkManager;
import com.fh.service.web.xiehonglun.XiehonglunManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DelAllFile;
import com.fh.util.Freemarker;
import com.fh.util.GetList;
import com.fh.util.GetPinyin;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Tools;

/** 
 * 类名称： 页面静态化
 * 创建人：
 * 修改时间：2016年12月27日
 * @version
 */
@Controller
@RequestMapping(value="/createHtml")
public class CreateHtmlController extends BaseController {
	
	@Resource(name="informationService")
	private InformationManager informationService;
	@Resource(name="imageService")
	private ImageManager imageService;
	@Resource(name="ourbusinessService")
	private OurBusinessManager ourbusinessService;
	@Resource(name="corporatephilosophyService")
	private CorporatephilosophyManager corporatephilosophyService;
	@Resource(name="aboutusService")
	private AboutusManager aboutusService;
	@Resource(name="cooperationService")
	private CooperationManager cooperationService;
	@Resource(name="newsService")
	private NewsManager newsService;
	@Resource(name="contentsService")
	private ContentsManager contentsService;
	@Resource(name="xiehonglunService")
	private XiehonglunManager xiehonglunService;
	@Resource(name="viewService")
	private ViewManager viewService;
	@Resource(name="introduceService")
	private IntroduceManager introduceService;
	@Resource(name="leaderService")
	private LeaderManager leaderService;
	@Resource(name="courceService")
	private CourceManager courceService;
	@Resource(name="honorService")
	private HonorManager honorService;
	@Resource(name="programService")
	private ProgramManager programService;
	@Resource(name="ideaService")
	private IdeaManager ideaService;
	@Resource(name="workService")
	private WorkManager workService;
	@Resource(name="contactService")
	private ContactManager contactService;
	/**选择模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/setMoban")
	@ResponseBody
	public Object setMoban() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"选择模版");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		Tools.writeFile(Const.FTLPATH,pd.getString("moban"));	//模版配置
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**生成首页html
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/proHome")
	@ResponseBody
	public Object proCode(HttpServletResponse response,Page page,@RequestParam(required = false, value = "typeArr[]") List<String> typeArr) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"执行页面静态化");
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		this.getInfo(root);				//网站基本信息
		this.getImg(root,"1");			//首页轮播图
		this.getView(root);
		this.getCource(root,page);//发展历程
		this.getHonor(root,page);//荣誉资质
		this.getService(root,"01");
		this.getService(root,"02");
		this.getService(root,"03");
		this.getService(root,"05");
		this.getService(root,"06");
		this.getService(root,"07");
		this.getService(root,"08");
		this.getService(root,"09");
		this.getService(root,"10");
		this.getOptimal(root,page);
		this.getIntroduce(root);//简介
		this.getContact(root);
		this.getIdea(root);//简介
		this.getTeam(root,page);
		this.getWork(root,page);
		if(typeArr.size()>0){
			for(int i=0;i<typeArr.size();i++){
				this.getDate(root,page,typeArr.get(i),"");
			}
		}
		DelAllFile.delFolder(PathUtil.getClasspath()+"index.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("indexTemplate.ftl", root, "index.html", "", getFtlPath());
        
//		for(int i=0;i<typeArr.size()-6;i++){
//			DelAllFile.delFolder(PathUtil.getClasspath()+"web_"+i+".html"); //生成代码前,先清空之前生成的文件
//			Freemarker.printFile("web-"+i+"Template.ftl", root, "web_"+i+".html", "", getFtlPath());	
//		}
//		//介绍
		DelAllFile.delFolder(PathUtil.getClasspath()+"webintroduce.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("introduceTemplate.ftl", root, "webintroduce.html", "", getFtlPath());
		//发展历程
		DelAllFile.delFolder(PathUtil.getClasspath()+"webcourse.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("courseTemplate.ftl", root, "webcourse.html", "", getFtlPath());
        //荣誉资质
		DelAllFile.delFolder(PathUtil.getClasspath()+"webhonor.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("honorTemplate.ftl", root, "webhonor.html", "", getFtlPath());
     	//业务方案
		DelAllFile.delFolder(PathUtil.getClasspath()+"webservice.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("ywfaTemplate.ftl", root, "webservice.html", "", getFtlPath());
        // 优选方案
		DelAllFile.delFolder(PathUtil.getClasspath()+"weboptimal.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("yxfaTemplate.ftl", root, "weboptimal.html", "", getFtlPath());
//		//人才理念
		DelAllFile.delFolder(PathUtil.getClasspath()+"webidea.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("ideaTemplate.ftl", root, "webidea.html", "", getFtlPath());
//		//团队文化
		DelAllFile.delFolder(PathUtil.getClasspath()+"webteam.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("teamTemplate.ftl", root, "webteam.html", "", getFtlPath());
		//招贤纳士
		DelAllFile.delFolder(PathUtil.getClasspath()+"webzp.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("zpTemplate.ftl", root, "webzp.html", "", getFtlPath());
		//云创未来
		DelAllFile.delFolder(PathUtil.getClasspath()+"webfuture.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("ycwlTemplate.ftl", root, "webfuture.html", "", getFtlPath());
		//新闻列表
		DelAllFile.delFolder(PathUtil.getClasspath()+"webnew.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("newlistTemplate.ftl", root, "webnew.html", "", getFtlPath());
		//新闻详情
		DelAllFile.delFolder(PathUtil.getClasspath()+"webdetail.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("newDetailTemplate.ftl", root, "webdetail.html", "", getFtlPath());
////		//
//		DelAllFile.delFolder(PathUtil.getClasspath()+"websoudetail.html"); //生成代码前,先清空之前生成的文件
//		Freemarker.printFile("sousuodetailTemplate.ftl", root, "websoudetail.html", "", getFtlPath());
//		//搜索页面
//		DelAllFile.delFolder(PathUtil.getClasspath()+"websearch.html"); //生成代码前,先清空之前生成的文件
//		Freemarker.printFile("sousuoTemplate.ftl", root, "websearch.html", "", getFtlPath());
//		//信箱
//		DelAllFile.delFolder(PathUtil.getClasspath()+"webmailbox.html"); //生成代码前,先清空之前生成的文件
//		Freemarker.printFile("mailboxTemplate.ftl", root, "webmailbox.html", "", getFtlPath());
		return AppUtil.returnObject(new PageData(), map);
	}
	/** 图片
	 * @param root
	 * @throws Exception
	 */
	public void getImg(Map<String,Object> root, String TYPE) throws Exception{
		PageData pdImg = new PageData();
		pdImg.put("TYPE", TYPE);
		List<PageData> listImg1 = imageService.listAll(pdImg);
		List<String[]> fieldList = new ArrayList<String[]>(); 
		for(int i=0;i<listImg1.size();i++){
			String[] array = new String[4]; 
			array[0] = listImg1.get(i).getString("TITLE");	//图片标题
			array[1] = listImg1.get(i).getString("IMGURL");	//图片地址
			array[2] = listImg1.get(i).getString("TOURL");	//图片链接
			array[3] = listImg1.get(i).getString("BZ");		//图片备注
			fieldList.add(array);
		}
		root.put("fieldList"+TYPE, fieldList);	
	}
	/**
	 * 可视化数据
	 * @param root
	 * @param TYPE
	 * @throws Exception
	 */
	public void getView(Map<String,Object> root) throws Exception{
		PageData pdView = new PageData();
		List<PageData> listView = viewService.listAll(pdView);
		List<String[]> fieldList = new ArrayList<String[]>(); 
		for(int i=0;i<listView.size();i++){
			String[] array = new String[5]; 
			
			array[0] = listView.get(i).getString("VIDEO_NAME");	
			array[1] = listView.get(i).getString("PUB_TIME");	
			array[2] = listView.get(i).getString("FILE_SOURCE");	
			array[3] = listView.get(i).getString("CONTENTS").replaceAll("</?[^>]+>", "").trim();;		
			array[4] = listView.get(i).getString("VIEW_ID");	
			fieldList.add(array);
		}
		root.put("fieldList"+2, fieldList);	
	}
	//人员
	public void getRy(Map<String,Object> root,String type,Page page) throws Exception{
		PageData pdRy = new PageData();
		pdRy = this.getPageData();
		pdRy.put("TYPE", type);
		page.setPd(pdRy);
		List<PageData> listRy =null;
		if(type.equals("bd04")||type.equals("bd05")||type.equals("bd06")){
		page.setShowCount(100);
		listRy = leaderService.list(page);
		}
		if(type.equals("b4")||type.equals("b5")||type.equals("b6")){
		page.setShowCount(100);
		listRy = leaderService.listByType(page);
		}

		List<String[]> fieldList = new ArrayList<String[]>(); 
		List<String> fieldList1 = new ArrayList<String>();
		List<String[]> fieldList2 = new ArrayList<String[]>();
		//副教授
		List<String> fieldList3 = new ArrayList<String>();
		List<String[]> fieldList4 = new ArrayList<String[]>();
		//助教授教师
		List<String> fieldList5 = new ArrayList<String>();
		List<String[]> fieldList6 = new ArrayList<String[]>();
		//全体成员
		List<String> fieldList7 = new ArrayList<String>();
		List<String[]> fieldList8 = new ArrayList<String[]>();
		if(listRy!=null){
		for(int i=0;i<listRy.size();i++){
			String[] array = new String[25]; 
			String[] array0 = new String[1]; 
			String[] array1 = new String[1]; 
			String[] array2 = new String[1];
			String[] array3 = new String[1];
			array[0] = listRy.get(i).getString("LEADER_ID");	
			array[1] = listRy.get(i).getString("NAME");	
			array[2] = listRy.get(i).getString("JOB");
				if(listRy.get(i).getString("JOB").equals("教授")){
					array0[0] = GetPinyin.getPinYinHeadChar(listRy.get(i).getString("NAME").substring(0,1));
					fieldList1.add(array0[0]);
					fieldList2.add(array0);
				}else if(listRy.get(i).getString("JOB").equals("副教授")){
					array1[0] = GetPinyin.getPinYinHeadChar(listRy.get(i).getString("NAME").substring(0,1));
					fieldList3.add(array1[0]);
					fieldList4.add(array1);
				}else if(listRy.get(i).getString("JOB").equals("助教授/讲师")){
					array2[0] = GetPinyin.getPinYinHeadChar(listRy.get(i).getString("NAME").substring(0,1));
					fieldList5.add(array2[0]);
					fieldList6.add(array2);
				}
			array3[0] = GetPinyin.getPinYinHeadChar(listRy.get(i).getString("NAME").substring(0,1));
			fieldList7.add(array3[0]);
			fieldList8.add(array3);
			array[3] = listRy.get(i).getString("DESCRIPTION");
			array[4] = listRy.get(i).getString("GENDER");
			array[5] = listRy.get(i).getString("OLD");
			array[6] = listRy.get(i).getString("EMAIL");
			array[7] = listRy.get(i).getString("TEL");
			array[8] = listRy.get(i).getString("C_TIME");
			array[9] = listRy.get(i).getString("PUB_TIME");
			array[10] = listRy.get(i).getString("PUB_USER");
			array[11] = listRy.get(i).getString("PUB_SOURCE");
			array[12] = listRy.get(i).getString("NUMBER");
			array[13] = listRy.get(i).getString("PHOTO");
			array[14] = listRy.get(i).getString("TYPE");
			array[15] = listRy.get(i).getString("ADDRESS");
			array[16] = listRy.get(i).getString("FAX");
			array[17] = listRy.get(i).getString("HONOR");
			array[18] = listRy.get(i).getString("EXP");
			array[19] = listRy.get(i).getString("WORKEXP");
			array[20] = listRy.get(i).getString("RD");
			array[21] = listRy.get(i).getString("COURSE");
			array[22] = listRy.get(i).getString("ACHIEVEMENT");
			array[23] = listRy.get(i).getString("DEPARTMENT");
			if(listRy.get(i).getString("CONTENTS")!=null){
			array[24] = listRy.get(i).getString("CONTENTS").replaceAll("</?[^>]+>", "").trim();		
			}else{
            array[24] = listRy.get(i).getString("CONTENTS");
			}
			
			fieldList.add(array);
		
	}
	 }
		root.put("fieldList"+type, fieldList);
		fieldList1 =  GetList.getNoRepeatList(fieldList1);
		root.put("p1"+type, fieldList1);
		root.put("p2"+type, fieldList2);
		fieldList3 =  GetList.getNoRepeatList(fieldList3);
		root.put("p3"+type, fieldList3);
		root.put("p4"+type, fieldList4);
		fieldList5 =  GetList.getNoRepeatList(fieldList5);
		root.put("p5"+type, fieldList5);
		root.put("p6"+type, fieldList6);
		fieldList7 =  GetList.getNoRepeatList(fieldList7);
		root.put("p7"+type, fieldList7);
		root.put("p8"+type, fieldList8);
	}
	/**
	 * 发展历程
	 */
	public void getCource(Map<String,Object> root,Page page) throws Exception{
		PageData pdDate = new PageData();
		pdDate = this.getPageData();
		page.setPd(pdDate);
		List<PageData> listDate = null;
		listDate = courceService.list(page);
		List<String[]> fieldList = new ArrayList<String[]>();
		for(int i=0;i<listDate.size();i++){
			String[] array = new String[5]; 
			array[0] = listDate.get(i).getString("COURCE_ID");	//id
			array[1] = listDate.get(i).getString("TITLE");	//标题
			array[2] = listDate.get(i).getString("IMG");	
			array[3] = listDate.get(i).getString("CONTENT");	
			array[4] = listDate.get(i).getString("TIME");	
			fieldList.add(array);
		}
		root.put("fieldListCource", fieldList);	
	}
	
	public void getOptimal(Map<String,Object> root,Page page) throws Exception{
		PageData pdDate = new PageData();
		pdDate = this.getPageData();
		pdDate.put("TYPE", "04");
		page.setPd(pdDate);
		List<PageData> listDate = null;
		page.setShowCount(12);
		listDate = programService.list(page);
		List<String[]> fieldList = new ArrayList<String[]>();
		for(int i=0;i<listDate.size();i++){
			String[] array = new String[7]; 
			array[0] = listDate.get(i).getString("PROGRAM_ID");	//id
			array[1] = listDate.get(i).getString("TITLE");	//标题
			array[2] = listDate.get(i).getString("PUB_TIME");	
			array[3] = listDate.get(i).getString("CONTENTS");	
			array[4] = listDate.get(i).getString("TYPE");	
			array[5] = listDate.get(i).getString("IMG1");	
			array[6] = listDate.get(i).getString("IMG2");	
			fieldList.add(array);
		}
		root.put("page", page);	
		root.put("currentPage", page.getCurrentPage());	
		root.put("totalPage", page.getTotalPage());	
		root.put("fieldListOptimal", fieldList);	
	}
	public void getTeam(Map<String,Object> root,Page page) throws Exception{
		PageData pdDate = new PageData();
		pdDate = this.getPageData();
		pdDate.put("TYPE", "01");
		page.setPd(pdDate);
		List<PageData> listDate = null;
		listDate = leaderService.list(page);
		List<String[]> fieldList = new ArrayList<String[]>();
		for(int i=0;i<listDate.size();i++){
			String[] array = new String[4]; 
			array[0] = listDate.get(i).getString("LEADER_ID");	//id
			array[1] = listDate.get(i).getString("NAME");	//标题
			array[2] = listDate.get(i).getString("CONTENTS");	
			array[3] = listDate.get(i).getString("PHOTO");	
			fieldList.add(array);
		}
		root.put("fieldListTeam", fieldList);	
	}
	public void getWork(Map<String,Object> root,Page page) throws Exception{
		PageData pdDate = new PageData();
		pdDate = this.getPageData();
		page.setPd(pdDate);
		List<PageData> listDate = null;
		listDate = workService.list(page);
		List<String[]> fieldList = new ArrayList<String[]>();
		for(int i=0;i<listDate.size();i++){
			String[] array = new String[7]; 
			array[0] = listDate.get(i).getString("WORK_ID");	//id
			array[1] = listDate.get(i).getString("JOBTITLE");	//标题
			array[2] = listDate.get(i).getString("SALARY");	
			array[3] = listDate.get(i).getString("NP");	
			array[4] = listDate.get(i).getString("PUB_TIME");	
			array[5] = listDate.get(i).getString("SOURCE");	
			array[6] = listDate.get(i).getString("CONTENS");	
			fieldList.add(array);
		}
		root.put("fieldListWork", fieldList);	
	}
	public void getHonor(Map<String,Object> root,Page page) throws Exception{
		PageData pdDate = new PageData();
		pdDate = this.getPageData();
		page.setPd(pdDate);
		List<PageData> listDate = null;
		listDate = honorService.list(page);
		List<String[]> fieldList = new ArrayList<String[]>();
		for(int i=0;i<listDate.size();i++){
			String[] array = new String[5]; 
			array[0] = listDate.get(i).getString("HONOR_ID");	//id
			array[1] = listDate.get(i).getString("TITLE");	//标题
			array[2] = listDate.get(i).getString("IMG");	
			array[3] = listDate.get(i).getString("CONTENT");	
			array[4] = listDate.get(i).getString("TIME");	
			fieldList.add(array);
		}
		root.put("fieldListHonor", fieldList);	
	}
	
	public void getDate(Map<String,Object> root,Page page,String TYPE,String j) throws Exception{
		PageData pdDate = new PageData();
		pdDate = this.getPageData();
		pdDate.put("PUB_TYPE", TYPE);
		page.setPd(pdDate);
		List<PageData> listDate = null;
		if(TYPE.equals("m24")){//新闻动态-通知公告
			 page.setShowCount(8);
			 listDate = contentsService.list(page);
		}if(TYPE.equals("yqzx")){//最新的一条数据
			 listDate = contentsService.list1(page);
		}else{
			 page.setShowCount(10);
			 listDate = contentsService.list(page);
		}
		List<String[]> fieldList = new ArrayList<String[]>();
		if(listDate!=null){
		for(int i=0;i<listDate.size();i++){
			String[] array = new String[16]; 
			array[0] = listDate.get(i).getString("CONTENTS_ID");	//id
			array[1] = listDate.get(i).getString("TITLE");	//标题
			String c = listDate.get(i).getString("CONTENT");
			if(c==null||c.equals("")){
			array[2] = listDate.get(i).getString("CONTENT");
			}else{
				array[2] = listDate.get(i).getString("CONTENT").replaceAll("</?[^>]+>", "").trim();	//内容	
			}
			array[3] = listDate.get(i).getString("THUMNAIL");		//图片
			array[4] = listDate.get(i).getString("PUB_TIME");		//发布时间
			array[5] = listDate.get(i).getString("PUB_LINK");		//链接
			array[6] = listDate.get(i).getString("DESCRIPTION");	//描述
			array[7] = listDate.get(i).getString("NUMBER");	//描述
			array[8] = listDate.get(i).getString("PUB_SOURCE");	
			array[9] = listDate.get(i).getString("ADDRESS");	
			array[10] = listDate.get(i).getString("YB");	
			array[11] = listDate.get(i).getString("EMAIL");	
			array[12] = listDate.get(i).getString("TEL");	
			array[13] = listDate.get(i).getString("PUBLISHER");	
			array[14] = listDate.get(i).getString("PUB_TYPE");	
			array[15] = listDate.get(i).getString("MENU");	
			fieldList.add(array);
		}
		}
		root.put("fieldList"+TYPE, fieldList);	
		root.put("totalPage"+TYPE, page.getTotalPage());
		root.put("totalResult"+TYPE, page.getTotalResult());
		root.put("currentPage"+TYPE, page.getCurrentPage());
		root.put("page", page);
	}
	/** 网站基本信息
	 * @param root
	 * @throws Exception
	 */
	public void getInfo(Map<String,Object> root) throws Exception{
		PageData pdInfo = new PageData();
		pdInfo.put("INFORMATION_ID", "1");
		pdInfo = informationService.findById(pdInfo);
		root.put("NAME", pdInfo.getString("NAME"));					//网站名称
		root.put("TITLE1", pdInfo.getString("TITLE"));				//网站标题
		root.put("KEYWORDS", pdInfo.getString("KEYWORDS"));			//网站关键词
		root.put("DESCRIPTION", pdInfo.getString("DESCRIPTION"));	//网站描述
		root.put("LOGO", pdInfo.getString("LOGO"));					//LOGO
		root.put("TEL", pdInfo.getString("TEL"));					//电话
		root.put("EMAIL", pdInfo.getString("EMAIL"));				//邮箱
		root.put("QQ", pdInfo.getString("QQ"));						//QQ
		root.put("FAX", pdInfo.getString("FAX"));					//传真
		root.put("WEBURL", pdInfo.getString("WEBURL"));				//官网
		root.put("ADDRESS", pdInfo.getString("ADDRESS"));			//地址
		root.put("COPYRIGHT", pdInfo.getString("COPYRIGHT"));		//版权
		root.put("TECHNOLOGY", pdInfo.getString("TECHNOLOGY"));		//技术支持
		root.put("BEIAN", pdInfo.getString("BEIAN"));				//备案
		root.put("ABOUTUS1", pdInfo.getString("ABOUTUS1"));			//关于我们上
		root.put("ABOUTUS2", pdInfo.getString("ABOUTUS2"));			//关于我们下
		root.put("NEW1", pdInfo.getString("NEW1"));					//最新消息1
		root.put("NEW2", pdInfo.getString("NEW2"));	
		root.put("BACK_IMGS", pdInfo.getString("BACK_IMGS"));	//网站登陆背景图
	}
	//简介
	public void getIntroduce(Map<String,Object> root) throws Exception{
		PageData pdInfo = new PageData();
		pdInfo.put("INTRODUCE_ID", "1");
		pdInfo = introduceService.findById(pdInfo);
		root.put("TITLE", pdInfo.getString("TITLE"));					
		root.put("PUB_TIME", pdInfo.getString("PUB_TIME"));				
		root.put("SOURCE", pdInfo.getString("SOURCE"));			
		root.put("NUMBER", pdInfo.get("NUMBER"));
		root.put("PUB_USER", pdInfo.getString("PUB_USER"));				
		root.put("CONTENTS", pdInfo.getString("CONTENTS"));					
	}
	public void getIdea(Map<String,Object> root) throws Exception{
		PageData pdInfo = new PageData();
		pdInfo.put("IDEA_ID", "1");
		pdInfo = ideaService.findById(pdInfo);
		root.put("ITITLE", pdInfo.getString("TITLE"));					
		root.put("IPUB_TIME", pdInfo.getString("PUB_TIME"));				
		root.put("ICONTENTS", pdInfo.getString("CONTENTS"));			
	}
	public void getContact(Map<String,Object> root) throws Exception{
		PageData pdInfo = new PageData();
		pdInfo.put("CONTACT_ID", "1");
		pdInfo = contactService.findById(pdInfo);
		root.put("C_TEL", pdInfo.getString("TEL"));					
		root.put("C_EMAIL", pdInfo.getString("EMAIL"));				
		root.put("WB", pdInfo.getString("WB"));	
		root.put("WX", pdInfo.getString("WX"));	
	}
	public void getService(Map<String,Object> root,String type) throws Exception{
		PageData pdInfo = new PageData();
		pdInfo.put("TYPE", type);
		pdInfo = programService.findByType(pdInfo);
		root.put("STITLE"+type, pdInfo.getString("TITLE"));					
		root.put("SPUB_TIME"+type, pdInfo.getString("PUB_TIME"));				
		root.put("SIMG1"+type, pdInfo.get("IMG1"));
		root.put("SIMG2"+type, pdInfo.getString("IMG2"));				
		root.put("SCONTENTS"+type, pdInfo.getString("CONTENTS"));
		root.put("DESCRIPT"+type, pdInfo.getString("DESCRIPT"));
	}
	
	
	/**
	 * 获取路径
	 */
	public String getFtlPath(){
		return Tools.readTxtFile(Const.FTLPATH);
	}
	
}
