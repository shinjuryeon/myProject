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

import service.CategoryService;
import vo.CategoryVO;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryService service;
	
	@RequestMapping(value="/categorylist")
	public ModelAndView categorylist(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws ServletException, IOException {
		// MemberList
		List<CategoryVO> list = new ArrayList<CategoryVO>();		
		list = service.selectList();
		if (list != null) {
			mv.addObject("banana", list);
		} else {
			mv.addObject("message", "** 출력할 자료가 없습니다 **");
		}		
		
		mv.setViewName("category/category_list");
		return mv;
	} //categorylist
	
	@RequestMapping(value="/categoryjoin")
	public ModelAndView categoryjoin(ModelAndView mv) {
		mv.setViewName("category/category_joinForm");
		return mv;
	} //categoryjoin
	
	@RequestMapping(value="/codecheck")
	public ModelAndView codecheck(HttpServletRequest request, ModelAndView mv, CategoryVO vo) {
		// 입력한 newID 보관
		mv.addObject("newID", vo.getCategory_code());
		
		if (service.selectOne(vo) != null) {
			request.setAttribute("codeUse", "F"); // 사용불가
		} else {
			request.setAttribute("codeUse", "T"); // 사용가능
		}
		
		mv.setViewName("category/codeDupCheck");
		return mv;
	} //comidcheck
	
	@RequestMapping(value="/codejoin")
	public ModelAndView codejoin(HttpServletRequest request, ModelAndView mv, CategoryVO vo) 
						throws IOException {
        
		String uri = "category/category_list";
		
		if (service.insert(vo) > 0) {
			// insert 성공
			mv.addObject("message", "** 상품코드등록에 성공했습니다 **");
		} else {
			// 실패
			mv.addObject("message", "** 상품코드등록에 실패했습니다 **");
			uri = "category/category_joinForm";
		}
		
		mv.setViewName(uri);
		return mv;
	} //codejoin
	
	@RequestMapping(value="/codedetail")
	public ModelAndView codedetail(HttpServletRequest request, ModelAndView mv, CategoryVO vo) {
		
		String uri = "category/category_detail";
		
		vo.setCategory_code(Integer.parseInt(request.getParameter("category_code")));
		vo = service.selectOne(vo);
		
		if (vo != null) {
			mv.addObject("apple", vo);
		} else {
			mv.addObject("message", "** 출력할 자료가 없습니다 **");
		}
		
		mv.setViewName(uri);
		return mv;
	} //codedetail

	@RequestMapping(value="/codeupdate")
	public ModelAndView codeupdate(ModelAndView mv, CategoryVO vo, RedirectAttributes rttr) {
	
		String uri = "redirect:categorylist";
		
		if (service.update(vo) > 0) {
			// update 성공
			rttr.addFlashAttribute("message", "** 수정에 성공했습니다 **");
		} else {
			// 실패
			rttr.addFlashAttribute("message", "** 수정에 실패했습니다 **");
			uri = "redirect:codedetail?category_code="+vo.getCategory_code();
		}
		
		mv.setViewName(uri);
		return mv;
	} //codeupdate
	
	@RequestMapping(value="/codedelete")
	public ModelAndView codedelete(ModelAndView mv, CategoryVO vo, RedirectAttributes rttr) {
		
		String uri = "redirect:categorylist";
		
		if (service.delete(vo) > 0) {
			// delete 성공
			rttr.addFlashAttribute("message", "** 삭제되었습니다 **");
		} else {
			// 실패
			rttr.addFlashAttribute("message", "** 삭제 실패했습니다 **");
		}
		
		mv.setViewName(uri);
		return mv;
	} //codedelete
	
}
