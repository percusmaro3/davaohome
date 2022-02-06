package com.davaohome.utils;

public class DataByteUtil {
	
	public static int getOverSize(float maxGbSize, int useKbSize){
		float maxKbSize = maxGbSize*1024*1024;
		return useKbSize - (int)maxKbSize;
	}
	
	public static double getConverToMB(int kbSize){
		return kbSize/1024;
	}
	
	public static double getConverToGB(int kbSize){
		return kbSize/(1024*1024);
	}
}
