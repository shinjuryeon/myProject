package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.UserMapper;
import vo.User_infoVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper dao;
	
	@Override
	public List<User_infoVO> selectList() {
		return dao.selectList();
	}

	@Override
	public User_infoVO selectOne(User_infoVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public int insert(User_infoVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int update(User_infoVO vo) {
		return dao.update(vo);
	}

	@Override
	public int delete(User_infoVO vo) {
		return dao.delete(vo);
	}


}
