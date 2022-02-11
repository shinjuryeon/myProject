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
	public List<CartVO> selectList(CartVO vo) {
		return dao.selectList(vo);
	}
	
	@Override
	public List<CartVO> selectOne(CartVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public int selectSeqCount(CartVO vo) {
		return dao.selectSeqCount(vo);
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
	public int updatepm(CartVO vo) {
		return dao.updatepm(vo);
	}

	@Override
	public int delete(CartVO vo) {
		return dao.delete(vo);
	}
	
	

}
