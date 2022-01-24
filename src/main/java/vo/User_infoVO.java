package vo;

import lombok.Data;

@Data
public class User_infoVO { //form, VO, table column 이름 동일하게 만들기 -> 자동화때문
	private String user_id;
	private String user_password;
	private String user_name;
	private String address1;
	private String address2;
	private String address3;
} //class
