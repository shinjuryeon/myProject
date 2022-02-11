package vo;

import lombok.Data;

@Data
public class CartVO extends Item_infoVO { //form, VO, table column 이름 동일하게 만들기 -> 자동화때문
	private int cart_seq;
	private String user_id;
	private int item_seq;
	private int cart_count; //담은갯수

} //class
