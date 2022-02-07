package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.CartMapper;
import vo.CartVO;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartMapper dao;

	@Override
	public List<CartVO> selectList() {
		return dao.selectList();
	}

	@Override
	public int insert(CartVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int update(CartVO vo) {
		return dao.update(vo);
	}

	@Override
	public int delete(CartVO vo) {
		return dao.delete(vo);
	}
	
	

}
