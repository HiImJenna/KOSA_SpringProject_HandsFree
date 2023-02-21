package service.file;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import controller.admin.dto.AdminRegisterDto;
import controller.admin.dto.StoreInfoUpdateDto;

@Service
public class FileService {
	
	// 임시 사라질 수 있음
	private final String PATH = "/files/upload";
	
	// 사업자 등록증 저장
	public void saveAdminBusinesslicense(AdminRegisterDto dto) {
		if (!dto.getFile().getOriginalFilename().equals("")) {
			FileOutputStream fs = null;
			try {
				File dir = new File(dto.getRealFilePath());
				if (!dir.isDirectory()) {
					dir.mkdir();
				}
				dir = new File(dto.getRealFilePath() + dto.getEmail());
				if (!dir.isDirectory()) {
					dir.mkdir();
				}
				fs = new FileOutputStream(dto.getRealFilePath() + dto.getEmail() + "\\" + dto.getFile().getOriginalFilename());
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
	
	// 프로필 이미지 변경 변경
	public void updateAdminProfile(StoreInfoUpdateDto dto, String userId) {
		if (!dto.getFile().getOriginalFilename().equals("")) {
			FileOutputStream fs = null;
			try {
				File dir = new File(dto.getProfile_path());
				if (!dir.isDirectory()) {
					dir.mkdir();
				}
				
				dir = new File(dto.getProfile_path() + userId);
				if (!dir.isDirectory()) {
					dir.mkdir();
				}
				fs = new FileOutputStream(dto.getProfile_path() + userId + "\\" + dto.getFile().getOriginalFilename());
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
