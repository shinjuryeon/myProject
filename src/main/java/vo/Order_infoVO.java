package vo;

import lombok.Data;

@Data
public class Order_infoVO { //form, VO, table column 이름 동일하게 만들기 -> 자동화때문
	private int group_seq;
	private int order_seq;
	private String user_id;
	private int cart_seq;
	private int order_price;
	private int order_count;
	private String order_date;
} //class
