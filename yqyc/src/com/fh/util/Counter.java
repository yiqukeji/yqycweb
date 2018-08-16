package com.fh.util;
/**
 * 计术器
 * @author MrXieTao
 *
 */
public class Counter{
	private int click;//点击次数
	public int getClick() {
		return click;
	}

	public void setClick(int click) {
		this.click = click;
	}
	public  static String getCounts(String number){
		if(number == null||number.equals("")){
			number="0";
		}
		int num = Integer.parseInt(number);
		int counts = num+1;
		String count  = Integer.toString(counts);
		
		return count;
	}
}
