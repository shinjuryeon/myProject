package com.ncs.green;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.CartService;
import vo.CartVO;
import vo.Item_infoVO;

@Controller
public class CartController {
	
	@Autowired
	CartService service;
	
	@RequestMapping(value="/cartinsert")
	public ModelAndView cartinsert(HttpServletRequest request, ModelAndView mv, CartVO vo, RedirectAttributes rttr)
							throws IOException {
		
		if (vo.getUser_id() == null || vo.getUser_id().length()<1) { 
			rttr.addFlashAttribute("message", "** 로그인 후 이용하세요! **");
		} else {
			vo.setUser_id(request.getParameter("user_id")); //db로 먼저 넘어가서 item_seq가 동일한게 있는지 t, f 확인 후, update/insert 진행
			
			if (service.selectSeqCount(vo) > 0) {
				if(service.update(vo) > 0) {
					rttr.addFlashAttribute("message", "** 장바구니에 "+vo.getCart_count()+"개가 추가되었습니다! **");
				} else {
					rttr.addFlashAttribute("message", "** 다시 시도해주세요 **");
				}
			} else {
				if (service.insert(vo) > 0) {
					rttr.addFlashAttribute("message", "** 장바구니에 추가했습니다! **");
				} else {
					rttr.addFlashAttribute("message", "** 다시 시도해주세요 **");
				}
			}
		}
		
		String uri = "redirect:home"; 
		
		mv.setViewName(uri);
		return mv;
	} //cartinsert
	
	@RequestMapping(value="/cartlist")
	public ModelAndView cartlist(HttpServletRequest request, ModelAndView mv, CartVO vo) {
		List<CartVO> list = new ArrayList<CartVO>();
		List<CartVO> list2 = new ArrayList<CartVO>();
		
		list = service.selectOne(vo);
		
		vo.setUser_id(request.getParameter("user_id"));
		list2 = service.selectList(vo);
		
		if (list != null && list2 != null) {
			mv.addObject("banana", list);
			mv.addObject("apple", list2);
		} else {
			mv.addObject("message", "** 출력할 자료가 없습니다 **");
		}
		 
		mv.setViewName("cart/cart_list");
		return mv;
	} //cartlist
	
	@RequestMapping(value="/cartdelete")
	public ModelAndView cartdelete(HttpServletRequest request, ModelAndView mv, CartVO vo, RedirectAttributes rttr) {
		
		String uri = "redirect:cartlist?user_id="+request.getParameter("user_id");
		vo.setCart_seq(Integer.parseInt(request.getParameter("cart_seq")));
		
		if (service.delete(vo) > 0) {
			rttr.addFlashAttribute("message", "** 삭제되었습니다! **");
		} else {
			rttr.addFlashAttribute("message", "** 삭제 실패했습니다! **");
		}
		
		mv.setViewName(uri);
		return mv;
	}

}
