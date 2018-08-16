//package com.fh.util;
//
//import java.io.IOException;
//import java.io.PrintStream;
//import java.util.ArrayList;
//import java.util.List;
//
//public class TransfMediaTool {
//	/**
//	* 视频转码flv
//	* 
//	* @param ffmpegPath
//	*            转码工具的存放路径
//	* @param upFilePath
//	*            用于指定要转换格式的文件,要截图的视频源文件
//	* @param codcFilePath
//	*            格式转换后的的文件保存路径
//	* @return
//	* @throws Exception
//	*/
//	public void processFLV(String ffmpegPath, String upFilePath, String codcFilePath) {
//	// 创建一个List集合来保存转换视频文件为flv格式的命令
//	List<String> convert = new ArrayList<String>();
//	convert.add(ffmpegPath); // 添加转换工具路径
//	convert.add("-i"); // 添加参数＂-i＂，该参数指定要转换的文件
//	convert.add(upFilePath); // 添加要转换格式的视频文件的路径
//	convert.add("-ab");
//	convert.add("56");
//	convert.add("-ar");
//	convert.add("22050");
//	convert.add("-q:a");
//	convert.add("8");
//	convert.add("-r");
//	convert.add("15");
//	convert.add("-s");
//	convert.add("600*500");
//
//
//	/*
//	* convert.add("-qscale"); // 指定转换的质量 convert.add("6");
//	* convert.add("-ab"); // 设置音频码率 convert.add("64"); convert.add("-ac");
//	* // 设置声道数 convert.add("2"); convert.add("-ar"); // 设置声音的采样频率
//	* convert.add("22050"); convert.add("-r"); // 设置帧频 convert.add("24");
//	* convert.add("-y"); // 添加参数＂-y＂，该参数指定将覆盖已存在的文件
//	*/
//	convert.add(codcFilePath);
//
//
//	try {
//	Process videoProcess = new ProcessBuilder(convert).redirectErrorStream(true).start();
//	new PrintStream(videoProcess.getInputStream()).start();
//	videoProcess.waitFor();
//
//
//	} catch (IOException e1) {
//	e1.printStackTrace();
//	} catch (InterruptedException e) {
//	e.printStackTrace();
//	}
//
//}
//	}
