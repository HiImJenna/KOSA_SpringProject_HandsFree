package service.file;

import java.io.FileOutputStream;

import org.springframework.stereotype.Service;

import controller.admin.dto.AdminRegisterDto;

@Service
public class FileService {
	
	// 임시 사라질 수 있음
	private final String PATH = "/files/upload";
	
	// 사업자 등록증 저장 후 경로 반환
	public void saveAdminBusinesslicense(AdminRegisterDto dto) {
		if (!dto.getFile().getOriginalFilename().equals("")) {
			String fpath = dto.getRealFilePath();
			System.out.println("파일 저장 경로");
			System.out.println(fpath);
			FileOutputStream fs = null;
			try {
				fs = new FileOutputStream(fpath);
				fs.write(dto.getFile().getBytes());
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
	}
}
