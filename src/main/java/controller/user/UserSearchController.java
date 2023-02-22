package controller.user;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import service.user.UserSearchService;

@RestController
@RequestMapping("/item")
public class UserSearchController {

	@Autowired
	private UserSearchService usersearchservice;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public ResponseEntity<?> itemDetail(@RequestParam Map<String, Object> map){
		return new ResponseEntity<>(map, HttpStatus.OK); 
	}
	
	@GetMapping("information")
	public ResponseEntity<?> itemInformation(@RequestParam Map<String, Object> map){
		List<Map<String, String>> list = usersearchservice.getStore();
		System.out.println(list);
		return new ResponseEntity<>(list, HttpStatus.OK); 
	}
	
	@GetMapping("review")
	public ResponseEntity<?> itemReview(@RequestParam Map<String, Object> map){
		return new ResponseEntity<>(map, HttpStatus.OK);
	}	
//	
//	//가게 상세 정보 
//	@GetMappig("/users/shopDetail")
//	public shopDetail(Model model) {
//		return shop
//	}
}
