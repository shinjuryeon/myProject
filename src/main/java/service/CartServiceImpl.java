package service;

import org.springframework.stereotype.Service;

import mapperInterface.CartMapper;
import vo.Cart_infoVO;

@Service
public class CartServiceImpl implements CartService {
	
	CartMapper dao;

	@Override
	public int insert(Cart_infoVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int update(Cart_infoVO vo) {
		return dao.update(vo);
	}

	@Override
	public int delete(Cart_infoVO vo) {
		return dao.delete(vo);
	}
	
	

}
