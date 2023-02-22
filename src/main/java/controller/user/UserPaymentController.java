package controller.user;

import java.security.Principal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String userBook(Model model, 
						   @RequestParam("STOREID") String storeId, @RequestParam("sDate") String sDate, @RequestParam("eDate") String eDate){
		
		Store store = paymentservice.findStoreByUserId(storeId);
//		System.out.println(sdate);
//		System.out.println(edate);
//		System.out.println(cnt);
		
		model.addAttribute("storeName", store.getName());
		model.addAttribute("address", store.getAddress());
		model.addAttribute("phone", store.getPhone());
		model.addAttribute("storeId", storeId);
		model.addAttribute("sDate", sDate);
		model.addAttribute("eDate", eDate);

		return "user/book";
	}
	
	//결제 처리
	@RequestMapping("/users/paymentreserve") 
	public String userBook (HttpServletRequest request, Principal pri,
							Model model, Payment payment,
							@RequestParam("userid") String userid) {
		
		System.out.println("파라미터로 받아온  " + userid);
		
		int result = 0;
		result = paymentservice.insertPayment(payment);
		
		String icon = "";
		String msg = "";
		String url = "";
		
//		String cnt = request.getParameter("cnt");		
//		String dropDate = request.getParameter("dropDate");
//		String pickupDate = request.getParameter("pickupDate");
//
//		System.out.println("cnt"+cnt);
//		System.out.println("dropDate"+dropDate);
//		System.out.println("pickupDate"+pickupDate);
		
		Users users =  usermyinfoservice.userDetail(userid);
	
		String lastname = users.getLast_name(); //이름
		String firstname = users.getFirst_name(); //성
		String fullname = firstname + lastname; //풀네임
		
//		payment.setIdx(1);
//		payment.setUserid(userid);
//		payment.setStoreid("shop@naver.com");
//		payment.setName(fullname);
//		payment.setCnt(1);
//		payment.setPrice(2000);
//		payment.setPayment_method("toss");
//		payment.setPayment_date(new Date());
//		payment.setSdate(new Date());
//		payment.setEdate(new Date());
//		payment.setStatus(1);
		
		
		
		//결제 됐는지 확인
	      if (result < 1) {
	         icon = "error";
	         msg = "결제 실패 ㅠㅠ";
	         url = "/";
	      } else {
	         icon = "success";
	         msg = "결제 성공!";
	         url = "/users/myreserve";
	      }
	      
//	      model.addAttribute("idx", 0);
//	      model.addAttribute("userid", "dddd");
//	      model.addAttribute("storeId", "shop@naver.com");
	      model.addAttribute("name", fullname);	    
//	      model.addAttribute("cnt", 2);	
//	      model.addAttribute("price", 2000);	
//	      model.addAttribute("sdate", "2023-02-21");	
//	      model.addAttribute("edate", "2023-02-25");
//	      
	      model.addAttribute("msg", msg);
	      model.addAttribute("url", url);
	      model.addAttribute("icon", icon);
	      
//		  model.addAttribute("cnt", cnt);
//		  model.addAttribute("dropDate", dropDate);
//		  model.addAttribute("pickupDate", pickupDate);


		return "common/redirect"; 
	}
}
