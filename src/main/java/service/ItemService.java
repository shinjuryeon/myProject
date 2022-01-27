package service;

import java.util.List;

import vo.Item_infoVO;

public interface ItemService {
	
	List<Item_infoVO> selectList(); //selectList

	Item_infoVO selectOne(Item_infoVO vo); //selectOne

	int insert(Item_infoVO vo); //insert

	int update(Item_infoVO vo); //insert

	int delete(Item_infoVO vo);

}