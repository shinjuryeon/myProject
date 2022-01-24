package mapperInterface;

import java.util.List;

import vo.User_infoVO;

public interface UserMapper {

	List<User_infoVO> selectList(); //selectList

	User_infoVO selectOne(User_infoVO vo); //selectOne

	int insert(User_infoVO vo); //insert

	int update(User_infoVO vo); //insert

	int delete(User_infoVO vo);
	
	
}
