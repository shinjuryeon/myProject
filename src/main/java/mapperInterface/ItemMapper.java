package mapperInterface;

import java.util.List;

import vo.CategoryVO;
import vo.Item_infoVO;

public interface ItemMapper {
	
	List<Item_infoVO> selectList(); //selectList
	
	List<Item_infoVO> selectCode(Item_infoVO vo);
	
	String selectKor(CategoryVO cvo);

	Item_infoVO selectOne(Item_infoVO vo); //selectOne

	List<Item_infoVO> selectItemListbyComId(Item_infoVO vo);
	
	int insert(Item_infoVO vo); //insert

	int update(Item_infoVO vo); //insert

	int delete(Item_infoVO vo);
	

}
