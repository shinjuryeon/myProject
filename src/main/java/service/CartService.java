package service;

import vo.Cart_infoVO;

public interface CartService {
	
	int insert(Cart_infoVO vo);
	
	int update(Cart_infoVO vo);
	
	int delete(Cart_infoVO vo);

}
