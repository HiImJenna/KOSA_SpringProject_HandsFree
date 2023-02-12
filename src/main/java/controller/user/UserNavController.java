package controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserNavController {
	@GetMapping("/users/myinfo")
	public String myinfo() {
		return "user/myinfo";
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
