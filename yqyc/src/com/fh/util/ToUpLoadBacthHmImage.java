package com.fh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


public class ToUpLoadBacthHmImage {

	 public static String FILEDIR = null;
	    /**
	     * 上传
	     * @param request
	     * @throws IOException
	     */
	    public static String upload(HttpServletRequest request) throws IOException{       
	        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
	        String path = "";
	        Map<String, MultipartFile> fileMap = mRequest.getFileMap();       
	        File file = new File(FILEDIR);
	        MultipartFile mFile = null;
	        if (!file.exists()) {
	            file.mkdir();
	        }
	        Iterator<Map.Entry<String, MultipartFile>> it = fileMap.entrySet().iterator();
	        while(it.hasNext()){
	            Map.Entry<String, MultipartFile> entry = it.next();
	            mFile = entry.getValue();
	            if(mFile.getSize() != 0 && !"".equals(mFile.getName())){
	            	Long num = new Date().getTime();
	            	Double d = Math.random()*num;
	                write(mFile.getInputStream(), new FileOutputStream(initFilePath(mFile.getOriginalFilename(),num,d)));
	                path =path+initFilePath(mFile.getOriginalFilename(),num,d).split("uploadImgs")[1].toString()+"yq";
	            }
	        }
	        return path;
	        //1531284892560
	        //\12/1531284892560 359944084359_指针.pngyq
	    }
	    private static String initFilePath(String name,Long num,Double d) {
	        String dir = getFileDir(name) + "";
	        File file = new File(FILEDIR + dir);
	        if (!file.exists()) {
	            file.mkdir();
	        }
	        return (file.getPath() + "/" + num + d.longValue() + "_" + name).replaceAll(" ", "-");
	    }
	    private static int getFileDir(String name) {
	        return name.hashCode() & 0xf;
	    }
    //下载
//    public static void download(String downloadfFileName, ServletOutputStream out) {
//        try {
//            FileInputStream in = new FileInputStream(new File(FILEDIR + "/" + downloadfFileName));
//            write(in, out);
//        } catch (FileNotFoundException e) {
//            try {
//                FileInputStream in = new FileInputStream(new File(FILEDIR + "/"
//                        + new String(downloadfFileName.getBytes("iso-8859-1"),"utf-8")));
//                write(in, out);
//            } catch (IOException e1) {              
//                e1.printStackTrace();
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }       
//    }
	    /**
	     * 写入数据
	     * @param in
	     * @param out
	     * @throws IOException
	     */
	    public static void write(InputStream in, OutputStream out) throws IOException{
	    	try{
	            byte[] buffer = new byte[1024];
	            int bytesRead = -1;
	            while ((bytesRead = in.read(buffer)) != -1) {
	                out.write(buffer, 0, bytesRead);
	            }
	            out.flush();
	        } finally {
	            try {
	                in.close();
	            }
	            catch (IOException ex) {
	            }
	            try {
	                out.close();
	            }
	            catch (IOException ex) {
	            }
	        }
	    }  
	      
}
