package com.fh.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;

public class GetRWUTF {
	public static String readUTF(String fn) throws Exception{
		File f = new File(fn);
		InputStreamReader  read = new InputStreamReader (new FileInputStream(f),"UTF-8");	
		BufferedReader reader=new BufferedReader(read);
		String msg = "";
		String info = reader.readLine();
		msg  = info;   
		while(true){ 
		info  = reader.readLine();
		if(info==null) break; 
		msg =  msg + info; 
		} 
		return msg;

		}
}
