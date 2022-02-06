package com.davaohome.utils.convert;

import java.io.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ZipMaker {
	
	ZipOutputStream zipOs = null;
	String zipFileName = null;
	 private static final int COMPRESSION_LEVEL = 8;
	
	public ZipMaker(String zipFileName, OutputStream outputStream) throws FileNotFoundException{
		this.zipFileName = zipFileName;
		zipOs = new ZipOutputStream(new BufferedOutputStream(outputStream));
		zipOs.setLevel(COMPRESSION_LEVEL); 
	}
	
	public void addFile(File f) throws IOException{
		byte[] buffer = new byte[1024];
		BufferedInputStream bis = null;
		try{ 
			bis = new BufferedInputStream(new FileInputStream(f));
			ZipEntry zentry = new ZipEntry(f.getName());
            zentry.setTime(f.lastModified());
			zipOs.putNextEntry(zentry);
			
			int len;
			while ((len = bis.read(buffer)) > 0) {
				zipOs.write(buffer, 0, len);
			}
			zipOs.closeEntry();
		}finally{
			if( bis != null )
				bis.close();
		}
	}
	
	public void endZip() throws IOException{
		if( zipOs != null ){
			zipOs.finish();
			zipOs.close();
		}
	}
}
