package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.CategoryMapper;
import vo.CategoryVO;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryMapper dao;

	@Override
	public List<CategoryVO> selectList() {
		return dao.selectList();
	}
	
	@Override
	public CategoryVO selectOne(CategoryVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public int insert(CategoryVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int update(CategoryVO vo) {
		return dao.update(vo);
	}

	@Override
	public int delete(CategoryVO vo) {
		return dao.delete(vo);
	}
		

}
