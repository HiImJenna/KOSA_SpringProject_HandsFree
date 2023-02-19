package vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	private int idx;
	private int rsIdx;
	private int parent;
	private String name;
	private String content;
	private int grade;
	private int number;
	private Date edate;
	
	
	
	
}