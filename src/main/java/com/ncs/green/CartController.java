package com.ncs.green;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.CartService;
import vo.Cart_infoVO;

@Controller
public class CartController {
	
	@Autowired
	CartService service;
	
	@RequestMapping(value="/cartinsert")
	public ModelAndView cartinsert(HttpServletRequest request, ModelAndView mv, Cart_infoVO vo, RedirectAttributes rttr)
							throws IOException {
		
		String uri = "redirect:itemexplain";
		
		if (service.insert(vo) > 0) {
			// insert 성공
			rttr.addFlashAttribute("message", "** 장바구니에 추가했습니다! **");
		} else {
			// 실패
			rttr.addFlashAttribute("message", "** 다시 시도해주세요 **");
			uri = "home";
		}
		
		mv.setViewName(uri);
		return mv;
	} //cartin

}
