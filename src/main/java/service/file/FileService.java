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
	
	// 대표이미지 변경
	public void updateAdminProfile(StoreInfoUpdateDto dto, HttpServletRequest request, String userId) {
		String fileName = dto.getFile().getOriginalFilename();
		String path = request.getServletContext().getRealPath(PATH);
		if (!fileName.equals("")) {
			FileOutputStream fs = null;
			try {
				fs = new FileOutputStream(path + dto.getProfile_path());
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
