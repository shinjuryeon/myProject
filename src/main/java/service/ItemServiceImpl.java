package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.ItemMapper;
import vo.CategoryVO;
import vo.Item_infoVO;

@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	ItemMapper dao;

	@Override
	public List<Item_infoVO> selectList() {
		return dao.selectList();
	}
	
	@Override
	public List<Item_infoVO> selectCode(Item_infoVO vo) {
		return dao.selectCode(vo);
	}
	
	@Override
	public String selectKor(CategoryVO cvo) {
		return dao.selectKor(cvo);
	}

	@Override
	public Item_infoVO selectOne(Item_infoVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public int insert(Item_infoVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int update(Item_infoVO vo) {
		return dao.update(vo);
	}

	@Override
	public int delete(Item_infoVO vo) {
		return dao.delete(vo);
	}
		

}
