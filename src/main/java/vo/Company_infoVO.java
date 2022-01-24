package vo;

import lombok.Data;

@Data
public class Company_infoVO { //form, VO, table column 이름 동일하게 만들기 -> 자동화때문
	private String com_id;
	private String com_password;
	private String com_name;
	private int com_num;

} //class
