package com.ncs.green;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.ItemService;
import vo.CategoryVO;
import vo.Item_infoVO;

@Controller
public class ItemController {
	
	@Autowired
	ItemService service;
	
	@RequestMapping(value="/itemjoinf")
	public ModelAndView itemjoinf(ModelAndView mv) {
		mv.setViewName("item/item_joinForm");
		return mv;
	} //itemjoinf
	
	@RequestMapping(value="/itemjoin")
	public ModelAndView itemjoin(HttpServletRequest request, ModelAndView mv, Item_infoVO vo) 
							throws IOException {
		
        String realPath = request.getRealPath("/");
        System.out.println("realPath => "+realPath);

        if (realPath.contains("/wtpwebapps/"))
            realPath = "/Users/juryeonshin/Desktop/MyWork/GreenMart/src/main/webapp/resources/uploadImage/";
        else realPath += "resources\\uploadImage\\";
        
        // ** 폴더 만들기
        File f1 = new File(realPath);
        if (!f1.exists()) f1.mkdir();
        
        // ** 기본 이미지 지정하기
        String file1, file2 = "resources/uploadImage/basicman1.jpg";
        
        MultipartFile uploadfilef = vo.getUploadfilef();
        if (uploadfilef != null && !uploadfilef.isEmpty()) {
        	file1 = realPath + uploadfilef.getOriginalFilename(); // 전송된 File 명 추출 & 연결 
        	uploadfilef.transferTo(new File(file1)); // real 위치에 전송된 File 붙여넣기
        	file2 = "resources/uploadImage/" + uploadfilef.getOriginalFilename();
        }    
        
        vo.setUploadfile(file2);
        
		// 2. Service 처리
		String uri = "item/item_joinForm"; //성공시 조인폼으로 이동
				
		if (service.insert(vo) < 1) {
			uri = "item/item_joinForm";
		}
		
		mv.setViewName(uri);
		return mv;
		
	} //itemjoin
	
	// 카테고리별 상품출력
	@RequestMapping(value="/itemcodelist")
	public ModelAndView itemlist(HttpServletRequest request, ModelAndView mv, Item_infoVO vo, CategoryVO cvo) {
		List<Item_infoVO> list = new ArrayList<Item_infoVO>();
		vo.setCategory_code(Integer.parseInt(request.getParameter("category_code")));
		list = service.selectCode(vo);
		
		cvo.setCategory_code(Integer.parseInt(request.getParameter("category_code")));
		String name = service.selectKor(cvo);
		
		if (list != null) {
			mv.addObject("mango", list);
			mv.addObject("item_name", name);
		} else {
			mv.addObject("message", "** 출력할 자료가 없습니다 **");
		}
		
		mv.setViewName("item/item_codelist");
		return mv;
	} //itemcodelist
	
	@RequestMapping(value="/itemcomlist")
	public ModelAndView itemcomlist(HttpServletRequest request, ModelAndView mv, Item_infoVO vo) {
		
		HttpSession session = request.getSession(false);
		if (vo.getCom_id() == null || vo.getCom_id().length()<1) {
			if (session != null && session.getAttribute("logincID") != null) {
				vo.setCom_id((String)session.getAttribute("logincID"));
			}
		}
		
		List<Item_infoVO> list = new ArrayList<Item_infoVO>();
		list = service.selectItemListbyComId(vo);
		
		if (list != null) {
			mv.addObject("apple", list);
		} else {
			mv.addObject("message", "** 출력할 자료가 없습니다 **");
		}
		
		mv.setViewName("item/item_comdetail");
		return mv;
	} //itemcomlist
	
	@RequestMapping(value="/itemcomdetail")
	public ModelAndView itemcomdetail(HttpServletRequest request, ModelAndView mv, Item_infoVO vo) {
		vo = service.selectOne(vo);
		
		if (vo != null) {
			mv.addObject("peach", vo);
		} else {
			mv.addObject("message", "** 출력할 자료가 없습니다 **");
		}
		
		mv.setViewName("item/item_updateForm");
		return mv;
	}
	
	@RequestMapping(value="/itemupdate")
	public ModelAndView itemupdate(HttpServletRequest request, ModelAndView mv, Item_infoVO vo, RedirectAttributes rttr) throws IOException {

		String uri = null;
		
		MultipartFile uploadfilef = vo.getUploadfilef();
		String file1, file2;
		if (uploadfilef != null && !uploadfilef.isEmpty()) {
			String realPath = request.getRealPath("/");
			
	        if (realPath.contains("/wtpwebapps/"))
	            realPath = "/Users/juryeonshin/Desktop/MyWork/GreenMart/src/main/webapp/resources/uploadImage/";
	        else realPath += "resources\\uploadImage\\";
	        
	        // ** 폴더 만들기
	        File f1 = new File(realPath);
	        if (!f1.exists()) f1.mkdir();
	        file1 = realPath + uploadfilef.getOriginalFilename();
	        uploadfilef.transferTo(new File(file1));
	        
	        file2 = "resources/uploadImage/" + uploadfilef.getOriginalFilename();
	        vo.setUploadfile(file2);
		}
		
		if (service.update(vo) > 0) {
			// update 성공
			rttr.addFlashAttribute("message", "** 수정에 성공했습니다 **");
			uri = "redirect:itemcomlist?com_id="+vo.getCom_id();
		} else {
			// 실패
			rttr.addFlashAttribute("message", "** 수정에 실패했습니다 **");
			uri = "redirect:itemcomdetail?item_seq="+vo.getItem_seq();
		}
		
		mv.setViewName(uri);
		return mv;
		
		
//		String uri = "";
//		String id = null;	
//		
//		HttpSession session = request.getSession(false);
//		if (session != null && session.getAttribute("logincID") != null) { 
//			id = (String)session.getAttribute("logincID");	
//		
//			if (!id.equals("admin")) {
//				if (service.update(vo) > 0) {
//					rttr.addFlashAttribute("message", "** 수정에 성공했습니다 **");
//					uri = "item/itemcomdetail?com_id="+id;
//				} else {
//					rttr.addFlashAttribute("message", "** 수정에 실패했습니다 **");
//					uri = "item/itemcomdetail?com_id="+id;
//				}
//			} else if (id.equals("admin")) {
//				if (service.update(vo) > 0) {
//					uri = "item/itemadmindetail";
//					rttr.addFlashAttribute("message", "** 수정에 성공했습니다 **");
//				} else {
//					rttr.addFlashAttribute("message", "** 수정에 실패했습니다 **");
//					uri = "home";
//				}
//			}
//		}
//		
//		mv.setViewName(uri);
//		return mv;
	} //itemupdate
	
	@RequestMapping(value="/itemdelete")
	public ModelAndView itemdelete(HttpServletRequest request, ModelAndView mv, Item_infoVO vo, RedirectAttributes rttr) {
		
		String uri = "redirect:home";
		
		if (service.delete(vo) > 0) {
			rttr.addFlashAttribute("message", "** 상품이 삭제되었습니다 **");
		} else {
			mv.addObject("message", "** 상품 삭제 실패했습니다 **");
			uri = "redirect:itemcomdetail";
		}
		
		mv.setViewName(uri);
		return mv;
	} //itemdelete
	
	// 관리자 판매상품조회
	@RequestMapping(value="/itemlist") 
	public ModelAndView itemlist(ModelAndView mv) {
		List<Item_infoVO> list = new ArrayList<Item_infoVO>();
		
		list = service.selectList();
		
		if (list != null) {
			mv.addObject("banana", list);
		} else {
			mv.addObject("message", "** 출력할 자료가 없습니다 **");
		}
		
		mv.setViewName("item/item_list");
		return mv;
	} //itemdelete
	
	@RequestMapping(value="/itemexplain")
	public ModelAndView itemexplain(HttpServletRequest request, ModelAndView mv, Item_infoVO vo) {
		
		vo = service.selectOne(vo);
		vo.setCom_id(request.getParameter("com_id"));
		String comName = service.selectComName(vo);
		
		if (vo != null && comName != null) {
			mv.addObject("cherry", vo);
			mv.addObject("comName", comName);
		} else {
			mv.addObject("message", "** 출력할 자료가 없습니다 **");
		}
		
		mv.setViewName("item/item_explain");
		return mv;
	} //itemexplain

}
