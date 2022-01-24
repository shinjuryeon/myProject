package mapperInterface;

import java.util.List;

import vo.Company_infoVO;

public interface CompanyMapper {
	
	List<Company_infoVO> selectList(); //selectList

	Company_infoVO selectOne(Company_infoVO vo); //selectOne

	int insert(Company_infoVO vo); //insert

	int update(Company_infoVO vo); //insert

	int delete(Company_infoVO vo);
	

}
