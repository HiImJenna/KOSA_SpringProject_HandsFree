package controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import service.user.UserRegisterService;
import vo.user.Users;

@Controller
public class UserSecurityController {
	
	@Autowired
	private UserRegisterService registerservice;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	//POST 요청	**회원가입 처리**
	@PostMapping("/users/register")
	public String join(Users users) {
		
		String rawPwd = users.getUserpwd();
		String encodedPwd = bCryptPasswordEncoder.encode(rawPwd);

		users.setUserpwd(encodedPwd);
		registerservice.insert(users);
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
    }

}
