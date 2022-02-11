package com.ncs.green;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		
		if (vo.getUser_id() == null || vo.getUser_id().length()<1) { 
			rttr.addFlashAttribute("message", "** 구매자 로그인 후 이용하세요! **");
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
		
		mv.setViewName(uri);
		return mv;
	} //cartinsert
	
	@RequestMapping(value="/cartlist")
	public ModelAndView cartlist(HttpServletRequest request, ModelAndView mv, CartVO vo) {
		
		vo.setUser_id(request.getParameter("user_id"));
		List<CartVO> list = service.selectOne(vo);
						
		if (list != null && list.size()>0) {
			mv.addObject("banana", list);
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
	} //cartdelete
	
	@RequestMapping(value="/cartupdatef")
	public ModelAndView cartupdatef(HttpServletRequest request, ModelAndView mv, CartVO vo) {
		int a = Integer.parseInt(request.getParameter("item_seq"));
		mv.addObject("item_seq", a);
		mv.setViewName("cart/cart_updateForm");
		return mv;
	} //cartupdatef
	
	@RequestMapping(value="/cartupdate")
	public ModelAndView cartupdate(HttpServletRequest request, ModelAndView mv, CartVO vo, RedirectAttributes rttr) {
		
		vo.setUser_id(request.getParameter("user_id"));
		vo.setItem_seq(Integer.parseInt(request.getParameter("item_seq")));
		
		String uri = null;
		
		if (service.updatepm(vo) > 0) {
			rttr.addFlashAttribute("message", "** 수정에 성공했습니다! **");
			uri = "redirect:cartlist?user_id="+vo.getUser_id();
		} else {
			mv.addObject("message", "** 수정에 실패했습니다! **");
			uri = "cartlist?user_id="+vo.getUser_id();
		}
		
		mv.setViewName(uri);
		return mv;
	} //cartupdate

}
