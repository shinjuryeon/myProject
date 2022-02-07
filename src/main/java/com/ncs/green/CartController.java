package com.ncs.green;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.CartService;
import vo.CartVO;

@Controller
public class CartController {
	
	@Autowired
	CartService service;
	
	@RequestMapping(value="/cartinsert")
	public ModelAndView cartinsert(HttpServletRequest request, ModelAndView mv, CartVO vo, RedirectAttributes rttr)
							throws IOException {
		
		String uri = "redirect:home";
//		vo.setItem_seq(Integer.parseInt(request.getParameter("item_seq")));
		
		HttpSession session = request.getSession(false);
		
		if (vo.getUser_id() == null || vo.getUser_id().length()<1) {
			if (session != null && session.getAttribute("loginID") != null) {
				vo.setUser_id((String)session.getAttribute("loginID"));
				
				if (service.insert(vo) > 0) {
					// insert 성공
					rttr.addFlashAttribute("message", "** 장바구니에 추가했습니다! **");
				} else {
					// 실패
					rttr.addFlashAttribute("message", "** 다시 시도해주세요 **");
				}
			}
		}
		mv.setViewName(uri);
		return mv;
	} //cartinsert
	
	@RequestMapping(value="/cartlist")
	public ModelAndView cartlist(ModelAndView mv, CartVO vo) {
		List<CartVO> list = new ArrayList<CartVO>();
		
		list = service.selectList();
		
		 
		String uri = null;
		mv.setViewName(uri);
		return mv;
	}

}
