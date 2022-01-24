package com.ncs.green;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.UserService;
import vo.CategoryVO;
import vo.User_infoVO;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
	
	@RequestMapping(value="/userjoinf")
	public ModelAndView userjoinf(ModelAndView mv) {
		mv.setViewName("user/user_joinForm");
		return mv;
	} //userjoinf
	
	@RequestMapping(value="/userjoin")
	public ModelAndView userjoin(HttpServletRequest request, ModelAndView mv, User_infoVO vo, RedirectAttributes rttr) 
						throws IOException {
        
		String uri = "redirect:home";
		
		if (service.insert(vo) > 0) {
			// insert 성공
			rttr.addFlashAttribute("message", "** 회원가입에 성공했습니다! **");
		} else {
			// 실패
			rttr.addFlashAttribute("message", "** 회원가입에 실패했습니다 **");
			uri = "user/user_joinForm";
		}
		
		mv.setViewName(uri);
		return mv;
	} //userjoin
	
	@RequestMapping(value="/useridcheck")
	public ModelAndView useridcheck(HttpServletRequest request, ModelAndView mv, User_infoVO vo) {
		// 입력한 newID 보관
		mv.addObject("newID", vo.getUser_id());
		
		if (service.selectOne(vo) != null) {
			request.setAttribute("idUse", "F"); // 사용불가
		} else {
			request.setAttribute("idUse", "T"); // 사용가능
		}
		
		mv.setViewName("user/idDupCheck");
		return mv;
	} //useridcheck
	
	@RequestMapping(value="/userloginf")
	public ModelAndView userloginf(ModelAndView mv) {
		mv.setViewName("user/user_loginForm");
		return mv;
	} //userloginf
	
	@RequestMapping(value="/userlogin")
	public ModelAndView userlogin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, User_infoVO vo) throws ServletException, IOException {
		String id = vo.getUser_id();
		String password = vo.getUser_password();
		String uri = "user/user_loginForm";
		
		vo = service.selectOne(vo);
		if (vo != null) {
			// id 일치 -> password 확인
			if (vo.getUser_password().equals(password)) {
			
//			// BCryptPasswordEncoder 적용
//	        // => passwordEncoder.matches(rawData, digest) -> (입력값, DB에보관된값_digest)
//			if (passwordEncoder.matches(password, vo.getPassword())) {
//				// Login 성공 -> login 정보를 Session에 보관 -> home
				request.getSession().setAttribute("loginID", id);
				request.getSession().setAttribute("loginName", vo.getUser_name());
//				
//				// BCryptPasswordEncoder 로 암호화 되면 복호화가 불가능함.
//	            // => password 수정을 별도로 처리해야 함.
//	            // => 그러나 기존의 update Code 를 활용하여 updateForm.jsp 에서 수정을 위해
//	            //    User가 입력한 raw_password 를 보관함.
//				// => 이 session에 보관한 값은 detail 에서 "Update" 요청시 사용함
				request.getSession().setAttribute("loginPW", password);				
				
				uri = "redirect:home";			
			} else { 
				// password 오류
				mv.addObject("message", "** password가 일치하지 않습니다! **");
			}
		} else { 
			// id 오류
			mv.addObject("message", "** id가 일치하지 않습니다! **");
		}
		
		mv.setViewName(uri);
		return mv;
	} //userlogin
	
	@RequestMapping(value="/userlist")
	public ModelAndView userlist(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws ServletException, IOException {
		List<User_infoVO> list = new ArrayList<User_infoVO>();		
		list = service.selectList();
		if (list != null) {
			mv.addObject("banana", list);
		} else {
			mv.addObject("message", "** 출력할 자료가 없습니다 **");
		}		
		
		mv.setViewName("user/user_list");
		return mv;
	} //userlist
	
	@RequestMapping(value="/userdelete")
	public ModelAndView userdelete(ModelAndView mv, User_infoVO vo, RedirectAttributes rttr) {
		
		String uri = "redirect:userlist";
		
		if (service.delete(vo) > 0) {
			// delete 성공
			rttr.addFlashAttribute("message", "** 삭제되었습니다 **");
		} else {
			// 실패
			rttr.addFlashAttribute("message", "** 삭제 실패했습니다 **");
		}
		
		mv.setViewName(uri);
		return mv;
	} //userdelete
	
	@RequestMapping(value="/userdetail")
	public ModelAndView userdetail(HttpServletRequest request, ModelAndView mv, User_infoVO vo) {
		
		String uri = "user/user_detail";
		
		vo.setUser_id(request.getParameter("user_id"));
		vo = service.selectOne(vo);
		
		if (vo != null) {
			mv.addObject("apple", vo);
		} else {
			mv.addObject("message", "** 출력할 자료가 없습니다 **");
		}
		
		mv.setViewName(uri);
		return mv;
	} //userdetail
	
}
