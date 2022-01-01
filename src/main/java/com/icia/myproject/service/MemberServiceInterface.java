package com.icia.myproject.service;

import java.util.List;

import com.icia.myproject.dto.MemberDTO;

public interface MemberServiceInterface {

	String login(MemberDTO member);

	int insert(MemberDTO member);

	String idDuplicate(String m_id);

	MemberDTO mypage(long m_number);

	String update(MemberDTO member);

	List<MemberDTO> memberAll();

	MemberDTO findById(long m_number);

	void delete(long m_number);

}
