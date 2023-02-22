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
import service.ReviewService;


@RestController
@RequestMapping("/item")
public class UserSearchController {
	
	@Autowired
	private ReviewService reviewservice;

	
	@RequestMapping(value="", method=RequestMethod.GET)
	public ResponseEntity<?> itemDetail(@RequestParam Map<String, Object> map){
		return new ResponseEntity<>(map, HttpStatus.OK); 
	}
	
	@GetMapping("information")
	public ResponseEntity<?> itemInformation(@RequestParam Map<String, Object> map){
//		List<Map<String, String>> list = usersearchservice.getStore(storeId);
//		System.out.println("######"+list);
		return new ResponseEntity<>(map, HttpStatus.OK); 
	}
	
	@GetMapping("review")
	public ResponseEntity<?> itemReview(@RequestParam Map<String, Object> map){
		System.out.println();
		String storeid = (String)map.get("storeId");
		List<Map<String, String>> list = reviewservice.getReviewListUser(storeid);
		System.out.println("@GetMapping(\"review\") : " + list.toString());
		return new ResponseEntity<>(map, HttpStatus.OK);
		
	}	
}
