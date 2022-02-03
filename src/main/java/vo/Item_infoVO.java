 package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Item_infoVO { //form, VO, table column 이름 동일하게 만들기 -> 자동화때문
	private int item_seq;
	private String item_name;
	private int item_price;
	private String content;
	private int inventory;
	private String uploadfile;
	private int category_code;
	private String com_id;
	private String item_date;
	
	private MultipartFile uploadfilef;
} //class
