package controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import service.user.UserMyinfoService;
import vo.Notice;
import vo.user.Users;

@Controller
public class UserNavController {
	
	private UserMyinfoService usermyinfoservice;
	
	@GetMapping("/users/myinfo")
	public String myinfo() {
		return "user/myinfo";
	}
	
//	@PostMapping("/users/myinfo")
//	public String myinfoEdit(Users users , HttpServletRequest request) {
//		return usermyinfoservice.userUpdate(users, request);
//		
//	}
	
	@GetMapping("/users/myreserve")
	public String myreserve() {
		return "user/myreserve";
	}
	
	@GetMapping("/users/shopregister")
	public String shopregister() {
		return "user/shopregister";
	}
	

}
