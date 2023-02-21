package vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Reservation {
	private int idx;
	private String userid;
	private String storeid;
	private String name;
	private int cnt;
	private int price;
	private String paymentmethod;
	private Date paymentdate;
	private Date sdate;
	private Date edate;
	private int status;
}
