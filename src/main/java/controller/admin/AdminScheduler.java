package controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/OracleData")
public class AdminScheduler {

	/*
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@GetMapping("scheduler")
	public void runStoredProcedure() {
		jdbcTemplate.update("BEGIN delete_review_date: END;");
	}
	*/
	
	@GetMapping("schedulerView")
	public String schedulerView() {
		return "admin/mainInc/schedulerView";
	}
}
