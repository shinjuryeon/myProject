package com.ncs.green;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import service.ItemService;
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

        if (realPath.contains(".wtpwebapps."))
            realPath = "/Users/juryeonshin/Desktop/MyWork/GreenMart/src/main/webapp/resources/uploadImage/";
        else realPath = "/Users/juryeonshin/Desktop/MyWork/GreenMart/src/main/webapp/resources/uploadImage/";
        
        // ** 폴더 만들기
        File f1 = new File(realPath);
        if (!f1.exists()) f1.mkdir();
        
        // ** 기본 이미지 지정하기
        String file1, file2 = "/Users/juryeonshin/Desktop/MyWork/GreenMart/src/main/webapp/resources/uploadImage/basicman1.jpg";
        
        MultipartFile uploadfilef = vo.getUploadfilef();
        if (uploadfilef != null && !uploadfilef.isEmpty()) {
        	file1 = realPath + uploadfilef.getOriginalFilename(); // 전송된 File 명 추출 & 연결 
        	uploadfilef.transferTo(new File(file1)); // real 위치에 전송된 File 붙여넣기
        	file2 = "/Users/juryeonshin/Desktop/MyWork/GreenMart/src/main/webapp/resources/uploadImage/" + uploadfilef.getOriginalFilename();
        }    
        
        vo.setUploadfile(file2);
        
		// 2. Service 처리
		String uri = "item/item_joinForm"; //성공시 로그인폼으로 이동
				
		int cnt = service.insert(vo);
		
		if (cnt > 0) {
			// insert 성공
		} else {
			// 실패
			uri = "item/item_joinForm";
		}
		
		mv.setViewName(uri);
		return mv;
		
	} //itemjoin

}
