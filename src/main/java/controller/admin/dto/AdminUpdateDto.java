package controller.admin.dto;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.AllArgsConstructor;
import lombok.Getter;
import vo.admin.Admin;

@Getter
@AllArgsConstructor
public class AdminUpdateDto {
	private String email;
	private String password;
	private String firstName;
	private String lastName;
	
	public Admin toAdmin(BCryptPasswordEncoder bCryptPasswordEncoder) {
		return Admin.builder()
				.userId(email)
				.password(bCryptPasswordEncoder.encode(password))
				.firstName(firstName)
				.lastName(lastName)
				.build();
	}
}
