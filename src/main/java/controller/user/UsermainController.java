package controller.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.user.UserSearchService;

@Controller
public class UsermainController {
	
	@Autowired
	private UserSearchService userSearchService;
	
	@GetMapping("search")
	public String home(HttpServletRequest httpServletRequest, Model model) {
		String destination = httpServletRequest.getParameter("destination");		
		String dropDate = httpServletRequest.getParameter("dropDate");
		String pickupDate = httpServletRequest.getParameter("pickupDate");
		
		model.addAttribute("destination", destination);
		model.addAttribute("dropDate", dropDate);
		model.addAttribute("pickupDate", pickupDate);
		
		return "/user/search";
	}
	
	@GetMapping("selectStore")
	public ResponseEntity<?> getStore(@RequestParam Map<String, String> position){
		System.out.println(position);
		System.out.println(position.get("latitude"));
		System.out.println(position.get("longitude"));
		String latitude = position.get("latitude");
		String longitude = position.get("longitude");
		List<Map<String, String>> list =  userSearchService.getStore("127.458855318689", "36.6371176461081");
		System.out.println(list);
		System.out.println(list.toString());

		
		return new ResponseEntity<>(list, HttpStatus.OK);
		
	}
}
