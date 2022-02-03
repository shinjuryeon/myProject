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
	@RequestMapping(value="/itemlist")
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
		
		mv.setViewName("item/item_list");
		return mv;
	} //itemlist
	
	@RequestMapping(value="/itemcomdetail")
	public ModelAndView itemcomdetail(HttpServletRequest request, ModelAndView mv, Item_infoVO vo) {
		
		//request.getSession().setAttribute("logincID", vo.getCom_id());
		
		List<Item_infoVO> list = new ArrayList<Item_infoVO>();
		
		String uri = "item/item_comdetail";
		
		list = service.selectItemListbyComId(vo);
		
		vo = service.selectOne(vo);
		
		if (list != null) {
			mv.addObject("apple", list);
			if ("U".equals(request.getParameter("jcode"))) {
				uri = "item/item_updateForm";
				mv.addObject("peach", vo);
			}
		} else {
			mv.addObject("message", "** 출력할 자료가 없습니다 **");
		}
		
		mv.setViewName(uri);
		return mv;
	} //itemcomdetail
	
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
			uri = "redirect:home";
		} else {
			// 실패
			rttr.addFlashAttribute("message", "** 수정에 실패했습니다 **");
			uri = "redirect:itemcomdetail?jcode=U&item_seq="+vo.getItem_seq();
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

}
