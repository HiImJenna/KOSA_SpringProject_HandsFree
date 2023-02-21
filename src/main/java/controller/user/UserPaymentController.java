package controller.user;

import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.user.PaymentService;
import service.user.UserMyinfoService;
import vo.admin.Store;
import vo.user.Payment;
import vo.user.Users;

@Controller
public class UserPaymentController {
	
	@Autowired
	private PaymentService paymentservice;
	@Autowired
	private UserMyinfoService usermyinfoservice;

	@GetMapping("/users/userBook")
	public String userBook(Model model, Principal principal, 
							@RequestParam("STOREID") String storeId){
		
		
		
		Store store = paymentservice.findStoreByUserId(storeId);
		model.addAttribute("storeName", store.getName());
		model.addAttribute("address", store.getAddress());
		model.addAttribute("phone", store.getPhone());

		return "user/book";
	}
	
	@PostMapping("/users/userBook") 
	public String userBook (Principal pri, Model model, Payment payment) {
		int result = 0;
		String userid = pri.getName();
		
		String icon = "";
		String msg = "";
		String url = "";
		
		Users users =  usermyinfoservice.userDetail(userid);
		
		String lastname = users.getLast_name(); //이름
		System.out.println("UserPaymentController lastname : " + lastname);
		String firstname = users.getFirst_name(); //성
		System.out.println("UserPaymentController firstname : " + firstname);

		String fullname = firstname + lastname;
		System.out.println("UserPaymentController username(fullname) : " + fullname);
		
		payment.setName(fullname);
		model.addAttribute("username", fullname);

		result = paymentservice.insertPayment(payment);
		
		//결제 됐는지 확인
	      if (result < 1) {
	         icon = "error";
	         msg = "결제 실패 ㅠㅠ";
	         url = "/";
	      } else {
	         icon = "success";
	         msg = "결제 실패 ㅠㅠ결제 성공!";
	         url = "/users/myreserve";
	      }
	      
	      model.addAttribute("fullname", fullname);
	      model.addAttribute("userid", userid);

	      model.addAttribute("msg", msg);
	      model.addAttribute("url", url);
	      model.addAttribute("icon", icon);

		return "common/redirect"; 
	}
}
