package service.file;

import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileService {
	
	private final String PATH = "/files/upload";
	
	// 사업자 등록증 저장 후 경로 반환
	public String saveAdminBusinesslicense(MultipartFile file, String userId,
										   HttpServletRequest request) 
	{
		String fileName = file.getOriginalFilename();
		String path = request.getServletContext().getRealPath(PATH);
		String fpath = "";
		
		if (!fileName.equals("")) {
			fpath = path + "\\" + userId + "\\" + fileName;
			System.out.println("파일 저장 경로");
			System.out.println(fpath);
			FileOutputStream fs = null;
			try {
				fs = new FileOutputStream(fpath);
				fs.write(file.getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					fs.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		return fpath;
	}
}
