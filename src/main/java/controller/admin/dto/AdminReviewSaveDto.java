package controller.admin.dto;

import javax.servlet.http.HttpServletRequest;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class AdminReviewSaveDto {
	private int reviewIdx;
	private int reservationIdx;
	private String content;
	
	public AdminReviewSaveDto(HttpServletRequest request) {
		try {
			// 임시방편코드ㅠㅠ
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.getStackTrace();
		}
		this.reviewIdx = Integer.parseInt(request.getParameter("review"));
		this.reservationIdx = Integer.parseInt(request.getParameter("reservation"));
		this.content = request.getParameter("content");
	}
}
