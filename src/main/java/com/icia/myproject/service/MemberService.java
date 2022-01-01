package com.icia.myproject.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.myproject.dto.MemberDTO;
import com.icia.myproject.repository.MemberRepository;

@Service
public class MemberService implements MemberServiceInterface {

	@Autowired
	private MemberRepository mr;
	@Autowired
	private HttpSession session;
	
//	회원가입 처리	
	@Override 
	public int insert(MemberDTO member) { 
	// insert 메서드 호출 후 리턴값을 받아와서리턴값을 출력해봅시다. 
	int result = mr.insert(member); System.out.println(result);
	return result; 
	}
	
	// 로그인 처리
	@Override
	public String login(MemberDTO member) {
		MemberDTO loginMember = mr.login(member); 
		if (loginMember != null) {
			// 로그인 성공 (로그인 정보(아이디)를 세션에 저장)
			session.setAttribute("loginId", member.getM_id());
			session.setAttribute("loginNumber", loginMember.getM_number());
			//로그인성공 
		return "/board/main";
		} else {
			//로그인 실패
		return "/member/login";
	}
	}
	
	// 아이디 중복체크
	@Override
	public String idDuplicate (String m_id) {
		String result = mr.idDuplicate(m_id);
		if (result == null) {
			return "ok";
		} else {
			return "no";
		}
	}
	
	// 마이페이지 출력
	@Override
	public MemberDTO mypage(long m_number) {
		MemberDTO member = mr.mypage (m_number);
		return member;
	}
	
	// 마이페이지 업데이트
	public String update(MemberDTO member) {
		mr.update(member);
		return  "redirect:/board/main";
	}
	
	// 회원관리(관리자전용)
	public List<MemberDTO> memberAll() {
		List<MemberDTO> mList = mr.memberAll();
		return mList;
	}
	
	public MemberDTO findById(long m_number) {
		MemberDTO member = mr.findById(m_number);
		return member;
	}

	@Override
	public void delete(long m_number) {
		mr.delete(m_number);
	}
		
	}
	

