package controller.admin.dto;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class AdminRegisterDto {
	private String email;
	private String validateNumber;
	private String password;
	private String lastName;
	private String firstName;
	private String address;
	private MultipartFile file;
	
	// 실제 파일 경로 얻기
	public String getFileRealPath(HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/files/upload");
		String fileName = file.getOriginalFilename();
		return path + "\\" + email + "\\" + fileName;
	}
}
