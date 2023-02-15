package controller.user;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import service.user.UserMyinfoService;
import vo.user.Users;

@Controller
public class UserNavController {
	
	@Autowired
	private UserMyinfoService usermyinfoservice;
	
	@GetMapping("/users/userDetail")
	public String userDetail(Principal pri, Model model) {
		String userid = pri.getName();
		 Users users = usermyinfoservice.userDetail(userid);
		 model.addAttribute("users", users);
		 System.out.println("users : " + users);
		 return "user/myinfo";
	}
	
	@PostMapping("userUpdate") //여기까지 탐
	public Users userUpdate(String userid, HttpServletRequest request) {
		return usermyinfoservice.userUpdate(userid);
	}
	
	@GetMapping("/users/myreserve")
	public String myreserve() {
		return "user/myreserve";
	}
	
	@GetMapping("/users/shopregister")
	public String shopregister() {
		return "user/shopregister";
	}
}
