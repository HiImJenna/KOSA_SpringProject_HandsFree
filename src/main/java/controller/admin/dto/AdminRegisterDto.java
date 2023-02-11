package controller.admin.dto;

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
}
