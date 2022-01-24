package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.CompanyMapper;
import vo.Company_infoVO;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	CompanyMapper dao;
	
	@Override
	public List<Company_infoVO> selectList() {
		return dao.selectList();
	}

	@Override
	public Company_infoVO selectOne(Company_infoVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public int insert(Company_infoVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int update(Company_infoVO vo) {
		return dao.update(vo);
	}

	@Override
	public int delete(Company_infoVO vo) {
		return dao.delete(vo);
	}

	
	
}
