package com.fh.service.web.contents.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.web.contents.ContentsManager;

/** 
 * 说明： 新闻内容管理
 * 创建人：xiehonglun
 * 创建时间：2018-03-16
 * @version
 */
@Service("contentsService")
public class ContentsService implements ContentsManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("ContentsMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("ContentsMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("ContentsMapper.edit", pd);
	}
	public void editByType(PageData pd)throws Exception{
		dao.update("ContentsMapper.editByType", pd);
	}
	public void editByCount(PageData pd)throws Exception{
		dao.update("ContentsMapper.editByCount", pd);
	}
	public void editRight(PageData pd)throws Exception{
		dao.update("ContentsMapper.editRight", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ContentsMapper.datalistPage", page);
	}
	@SuppressWarnings("unchecked")
	public List<PageData> list0(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ContentsMapper.datalistPage0", page);
	}
	@SuppressWarnings("unchecked")
	public List<PageData> list1(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ContentsMapper.datalistPage1", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ContentsMapper.listAll", pd);
	}
	@SuppressWarnings("unchecked")
	public List<PageData> listByTime(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ContentsMapper.listByTime", pd);
	}
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ContentsMapper.findById", pd);
	}
	//
	public PageData findPreNext(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ContentsMapper.findPreNext", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ContentsMapper.deleteAll", ArrayDATA_IDS);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> listByType(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("ContentsMapper.listByType",pd);
	}
	@SuppressWarnings("unchecked")
	public List<PageData> listByType0(Page page) throws Exception {
		return (List<PageData>)dao.findForList("ContentsMapper.listByType0", page);
	}
	@SuppressWarnings("unchecked")
	public List<PageData> listByType1(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("ContentsMapper.listByType1", pd);
	}
	
}

