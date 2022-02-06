package com.davaohome.http;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.http.client.protocol.HttpClientContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.github.sardine.DavResource;
import com.github.sardine.Sardine;
import com.github.sardine.SardineFactory;
import com.github.sardine.impl.SardineException;

public class WebDAVClient {
	private static final Logger log = LoggerFactory.getLogger(WebDAVClient.class);

	protected HttpClientContext context = HttpClientContext.create();

	Sardine sardine = SardineFactory.begin();

	private final String webDAVLoaction;

	public WebDAVClient(String davLocation) {
		this.webDAVLoaction = davLocation;
	}

	public boolean isPath(String uri) throws IOException {
		String dir = this.webDAVLoaction + uri;

		return sardine.exists(dir);
	}

	public void createDirectory(String uri) throws IOException {
		String dir = this.webDAVLoaction + uri;

		sardine.createDirectory(dir);
	}

	/**
	 * <pre>
	 *
	 * @param file
	 * @throws IOException
	 * @Method put
	 * @ReturnType : void
	 * @Comment :
	 * </pre>
	 */
	public void put(String saveUri, File file, String contentType) throws IOException {
		String dir = String.format("%s%s", this.webDAVLoaction, saveUri);
		String fileName = file.getName();

		log.debug("webDAV put url {}{}", dir, fileName);
		log.debug("isPath(dir) : {}", isPath(saveUri));

		if (!isPath(saveUri)) {
			sardine.createDirectory(saveUri);
		}

		sardine.put(String.format("%s%s", dir, fileName), file, contentType);
	}

	public String put(String saveUri, String fileName, byte[] bytes) throws IOException {
		String dir = String.format("%s%s", this.webDAVLoaction, saveUri);

		if (!isPath(saveUri)) {
			sardine.createDirectory(saveUri);
		}
		String fileUrl = String.format("%s%s", dir, fileName);
		sardine.put(fileUrl, bytes);

		return fileUrl;
	}

	public String put(String saveUri, String fileName, InputStream is) throws IOException {
		String dir = String.format("%s%s", this.webDAVLoaction, saveUri);

		log.debug("webDAV put url {}{}", dir, fileName);
		log.debug("isPath(dir) : {}", isPath(saveUri));

		if (!isPath(saveUri)) {
			sardine.createDirectory(saveUri);
		}
		String fileUrl = String.format("%s%s", dir, fileName);
		sardine.put(fileUrl, is);

		return fileUrl;
	}

	public void put(String saveUri, File file, String contentType, boolean expectContinue) throws IOException {
		String dir = String.format("%s%s", this.webDAVLoaction, saveUri);
		String fileName = file.getName();
		String fileRepository = String.format("%s%s", dir, fileName);

		log.debug("webDAV fileRepository : {}", fileRepository);

		if (!isPath(saveUri)) {
			sardine.createDirectory(saveUri);
		}
		sardine.put(fileRepository, sardine.get("http://dav.tket.co.kr/dav/service/naverShopping/briefEp_alpha_addData.txt"), contentType,
					expectContinue);
	}

	public void getToFile(String saveLocalLocation, String remoteUri, String fileName) throws IOException {
		InputStream is = getToInputStream(remoteUri, fileName);
		File saveFile = new File(String.format("%s%s", saveLocalLocation, fileName));
		OutputStream os = new FileOutputStream(saveFile);

		int len;
		byte buf[] = new byte[1024];
		while ((len = is.read(buf)) > 0) {
			os.write(buf, 0, len);
		}
		os.close();
		is.close();
	}

	public StringBuilder getToStringBuffer(String remoteUri, String fileName) throws IOException {
		StringBuilder sb = new StringBuilder(1024);
		InputStream is = getToInputStream(remoteUri, fileName);

		int i;
		byte buf[] = new byte[4096];
		while ((i = is.read(buf)) != -1) {
			sb.append(new String(buf, 0, i, "UTF-8"));
		}

		return sb;
	}

	public InputStream getToInputStream(String remoteUri, String fileName) throws IOException {

		return sardine.get(String.format("%s%s%s", this.webDAVLoaction, remoteUri, fileName));
	}

	/*	public void delete(String fileName) throws IOException {
			String dir = this.webDAVLoaction + "/service/naverShopping/";
			sardine.delete(String.format("%s%s", dir, fileName));
		}
	*/
	public List<String> getResourceList(String uri) throws IOException {
		List<String> returnList = new ArrayList<String>();

		List<DavResource> resources = sardine.list(String.format("%s%s", this.webDAVLoaction, uri));
		for (DavResource res : resources) {
			returnList.add(res.getName());
		}

		return returnList;
	}

	public List<DavResource> getFileList(String uri) throws IOException {

		return sardine.list(String.format("%s%s", this.webDAVLoaction, uri));
	}

	public DavResource getFileData(String uri, String fileName) throws IOException {
		DavResource returnFile = null;
		List<DavResource> resources = sardine.list(String.format("%s%s", this.webDAVLoaction, uri));
		for (DavResource res : resources) {
			if (res.getName().equals(fileName)) {
				returnFile = res;
				break;
			}
		}
		return returnFile;
	}

	/**
	 * 원격주소에 파일이 존재하는지 확인
	 *
	 * @param uri
	 * @return
	 * @throws IOException
	 */
	public boolean isExist(String uri) throws IOException {
		return sardine.exists(uri);
	}

	/**
	 * 원격주소에 지정한 input 스트림으로 파일 생성
	 *
	 * @param uri
	 * @param inputStream
	 * @throws IOException
	 */
	public void uploadFile(String uri, InputStream inputStream) throws IOException {
		sardine.put(uri, inputStream);
	}

	/**
	 * 원격주소에서 파일 다운받아서 파일 객체 생성(이미 존재할경우 삭제하고 생성)
	 * 파일생성에 실패할 경우 null 파일 리턴
	 *
	 * @param remoteUri
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	public File downloadFile(String remoteUri, String fileName) throws IOException {

		if (!isExist(remoteUri)) {
			return null;
		}

		File saveFile = new File(fileName);

		if (saveFile.exists()) {
			FileUtils.deleteQuietly(saveFile);
		}

		try (
				InputStream is = sardine.get(remoteUri);
				OutputStream os = new FileOutputStream(saveFile)
		) {
			int len;
			byte buf[] = new byte[1024];
			while ((len = is.read(buf)) > 0) {
				os.write(buf, 0, len);
			}
		}

		return saveFile;
	}

	/**
	 * 원격 주소에 존재하는 파일 삭제
	 * 존재하지 않을 경우에도 익셉션 발생하지 않음
	 *
	 * @param uri
	 * @throws IOException
	 */
	public void deleteFileQuietly(String uri) throws IOException {
		//404 Not Found를 무시하기 위해 try-catch

		try {
			sardine.delete(uri);
		} catch (SardineException e) {
			if (e.getStatusCode() != 404) {
				throw e;
			}
		}
	}

}
