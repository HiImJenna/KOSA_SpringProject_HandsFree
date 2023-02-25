package controller.admin;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.admin.AdminSchedulerService;
import vo.admin.AdminReview;

@Controller
@RequestMapping("/OracleData")
public class AdminScheduler {
	
	@Autowired
	private AdminSchedulerService adminSchedulerService;
	
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("scheduler")
	public void runStoredProcedure() {
		System.out.println("들어옴");
		sqlSession.update("BEGIN delete_review_date: END;");
	}
	
	@GetMapping("schedulerView")
	public String schedulerView(Model model, Principal principal) {
		String storeId = principal.getName();
		List<AdminReview> list = adminSchedulerService.getReviewScheduler(storeId);
		model.addAttribute("list", list);
		System.out.println(list.toString());
		return "admin/mainInc/schedulerView";
	}
}
