package com.icia.myproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.myproject.dto.MemberDTO;
import com.icia.myproject.service.MemberServiceInterface;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	
	@Autowired
	private MemberServiceInterface ms;
	
	// 회원가입 페이지 출력
	@RequestMapping (value="insert", method=RequestMethod.GET)
		public String insertform() {
		return "/member/insert";
}
	// 회원가입 처리
	@RequestMapping (value="save", method=RequestMethod.POST) 
	public String MemberJoin(@ModelAttribute MemberDTO member) { 
	int insert = ms.insert(member); 
	if(insert>0) { 
		return "/member/login"; 
	} else { 
		return "/member/insert"; 
	}
	}
	// 로그인 페이지 출력
	@RequestMapping (value="login", method=RequestMethod.GET)
	public String loginform() {
		return "member/login";
	}
	
	// 로그인처리
	@RequestMapping (value="/login", method=RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO member) {
		String result = ms.login(member);
		return result;
	}
	
	// 회원가입 아이디 중복 체크
	@RequestMapping (value="/idDuplicate", method=RequestMethod.POST)
	public @ResponseBody String idDuplicate(@RequestParam("m_id")String m_id) {
	System.out.println("MemberController.idDuplicate(): " + m_id);
	String result = ms.idDuplicate(m_id);
	return result;
	}
	
	// 마이페이지 출력
	@RequestMapping (value="/mypage", method=RequestMethod.GET)
	public String mypageform(Model model, @RequestParam("m_number") long m_number) {
		MemberDTO member = ms.mypage(m_number);
		model.addAttribute("mypage", member);
		return "/member/mypage";
	}
	
	// 마이페이지 업데이트
	@RequestMapping (value="/update", method=RequestMethod.POST)
	public String update(@ModelAttribute MemberDTO member) {
		String result = ms.update(member);
		return result;
	}
	
	// 회원관리(관리자전용)
	@RequestMapping (value="/memberAll", method=RequestMethod.GET)
	public String memberAll(Model model) {
		List<MemberDTO> mList = ms.memberAll();
		model.addAttribute("mList", mList);
		return "member/memberAll";
	}
	
	// 단일 ajax 회원조회
	@RequestMapping (value="/detail", method=RequestMethod.GET)
	public String findById(@RequestParam("m_number")long m_number, Model model) {
		MemberDTO member = ms.findById(m_number);
		model.addAttribute("member", member);
		return "member/detail";
	}
	
	// 상세 ajax 회원조회
	@RequestMapping (value="/detailAjax", method=RequestMethod.POST)
	public @ResponseBody MemberDTO detailAjax(@RequestParam("m_number") long m_number) {
		MemberDTO member = ms.findById(m_number);
		return member;
	}
	
	//삭제 처리
		@RequestMapping(value="/delete", method=RequestMethod.GET)
		public String delete(@RequestParam("m_number") long m_number) {
			ms.delete(m_number);
			return "redirect:/member/memberAll";
		}
	
}
