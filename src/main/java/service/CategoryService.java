package service;

import java.util.List;

import vo.CategoryVO;

public interface CategoryService {
	
	List<CategoryVO> selectList(); //selectList
	
	CategoryVO selectOne(CategoryVO vo);

	int insert(CategoryVO vo); //insert

	int update(CategoryVO vo);

	int delete(CategoryVO vo);
	
}
