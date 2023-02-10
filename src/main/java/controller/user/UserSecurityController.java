package controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import dao.user.UserRegisterDao;
import service.user.UserRegisterService;

@Controller
public class UserSecurityController {
	//memberDao  의존
	private UserRegisterDao registerdao;
	
	@Autowired
	private UserRegisterService registerservice;

//	@Autowired
//	private BCryptPasswordEncoder bCryptPasswordEncoder;


	//POST 요청	**회원가입 처리**
	@PostMapping("/users/register")
	public String join(vo.user.Users users) {
		
		String rawPwd = users.getUserpwd();
//		String encodedPwd = bCryptPasswordEncoder.encode(rawPwd);
		
		System.out.println("RAW : " + rawPwd);
//		System.out.println("encodedPwd : " + encodedPwd);
		
		users.setUserpwd(rawPwd);
		registerservice.insert(users);
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/users/main.htm";
    }

}
