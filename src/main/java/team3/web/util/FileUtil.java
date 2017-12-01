package team3.web.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	static String path = "C:/hs/eclipse/workspace/Spring-Board/store";
	
	
	
	public static String getPath() {
		return path;
	}

	public static void setPath(String path) {
		FileUtil.path = path;
	}

	public static String upload(MultipartFile mf) {
		return upload(mf, mf.getOriginalFilename());
	}
	
	public static String upload(MultipartFile mf, String f_name) {
		FileRenamePolicy rp = new FileRenamePolicy();
		File dest = new File(path + "/" + f_name);
		dest = rp.rename(dest);
		try {
			mf.transferTo(dest);
		} catch (IOException ioe) {
			return null;
		}
		return dest.getName();
	}
	
	public static void down(HttpServletRequest req, HttpServletResponse res, String originalFileName, String fileName) {
		File file = new File(path+"/"+fileName);
		res.setContentType("application/octet-stream");
		String Agent = req.getHeader("USER-AGENT");

		try {
			if (Agent.indexOf("MSIE") >= 0) {
				int i = Agent.indexOf('M', 2);
				String IEV = Agent.substring(i + 5, i + 8);
				if (IEV.equalsIgnoreCase("5.5")) {
					res.setHeader("Content-Disposition",
							"filename=" + new String(originalFileName.getBytes("euc-kr"), "8859_1"));
				} else {
					res.setHeader("Content-Disposition",
							"attachment;filename=" + new String(originalFileName.getBytes("euc-kr"), "8859_1"));
				}
			} else {
				res.setHeader("Content-Disposition",
						"attachment;filename=" + new String(originalFileName.getBytes("euc-kr"), "8859_1"));
			}
		} catch (UnsupportedEncodingException uee) {
			uee.printStackTrace();
		}

		byte b[] = new byte[1024];

		if (file.isFile()) {
			try {
				BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
				BufferedOutputStream outs = new BufferedOutputStream(res.getOutputStream());

				int read = 0;

				while ((read = fin.read(b)) != -1) {
					outs.write(b, 0, read);
				}

				outs.flush();
				outs.close();
				fin.close();
			} catch (Exception e) {
			}
		}
	}

	public static void delete(String fileName) {
		File file = new File(path+"/"+fileName);
		if (file.exists()) file.delete();
	}
}
