package service.file;

import java.io.File;
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
			FileOutputStream fs = null;
			try {
				
				File dir = new File(dto.getRealFilePath());
				if (!dir.isDirectory()) {
					dir.mkdir();
				}
				
				fs = new FileOutputStream(fpath + dto.getFile().getOriginalFilename());
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
