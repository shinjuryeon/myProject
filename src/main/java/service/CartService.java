package service;

import java.util.List;

import vo.CartVO;

public interface CartService {
	
	List<CartVO> selectList();
	
	int insert(CartVO vo);
	
	int update(CartVO vo);
	
	int delete(CartVO vo);

}
