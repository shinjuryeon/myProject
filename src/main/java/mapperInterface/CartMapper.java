package mapperInterface;

import vo.Cart_infoVO;

public interface CartMapper {
	
	int insert(Cart_infoVO vo);
	
	int update(Cart_infoVO vo);
	
	int delete(Cart_infoVO vo);

}
