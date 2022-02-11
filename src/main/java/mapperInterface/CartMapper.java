package mapperInterface;

import java.util.List;

import vo.CartVO;

public interface CartMapper {
	
	List<CartVO> selectList(CartVO vo);
	
	List<CartVO> selectOne(CartVO vo);
	
	int selectSeqCount(CartVO vo);
	
	int insert(CartVO vo);
	
	int update(CartVO vo);
	
	int updatepm(CartVO vo);
	
	int delete(CartVO vo);

}
