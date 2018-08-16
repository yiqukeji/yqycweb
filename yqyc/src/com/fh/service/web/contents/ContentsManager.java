package com.fh.service.web.contents;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 新闻内容管理接口
 * 创建人：xiehonglun
 * 创建时间：2018-03-16
 * @version
 */
public interface ContentsManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	public void editByType(PageData pd)throws Exception;
	public void editByCount(PageData pd)throws Exception;
	public void editRight(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	public List<PageData> list0(Page page)throws Exception;
	public List<PageData> list1(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
     //	
	public List<PageData> listByTime(PageData pd)throws Exception;
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	//上一页和下一页
	public PageData findPreNext(PageData pd)throws Exception;
	 /**
	  * 查询组织机构中数据
	  * @param pd
	  * @return
	  * @throws Exception
	  */
	public List<PageData> listByType(PageData pd)throws Exception;
	public List<PageData> listByType0(Page page)throws Exception;
	public List<PageData> listByType1(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
}

