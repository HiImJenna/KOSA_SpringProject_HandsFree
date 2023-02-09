package controller.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/item")
public class UserSearchController {


	
	@RequestMapping(value="", method=RequestMethod.GET)
	public ResponseEntity<?> itemDetail(@RequestParam Map<String, Object> map){
		return new ResponseEntity<>(map, HttpStatus.OK); 
	}
	
	@GetMapping("information")
	public ResponseEntity<?> itemInformation(@RequestParam Map<String, Object> map){
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@GetMapping("review")
	public ResponseEntity<?> itemReview(@RequestParam Map<String, Object> map){
		return new ResponseEntity<>(map, HttpStatus.OK);
	}	
}
