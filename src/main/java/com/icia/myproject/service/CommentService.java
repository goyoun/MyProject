package com.icia.myproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.myproject.dto.CommentDTO;
import com.icia.myproject.repository.CommentRepository;

@Service
public class CommentService implements CommentServiceInterface {
	
	@Autowired
	private CommentRepository cr;
	
	@Override
	public void save(CommentDTO comment) {
		cr.save(comment);
	}
	@Override
	public List<CommentDTO> tripBoardAll(long b_number){
		return cr.tripBoardAll(b_number);

}
	@Override
	public List<CommentDTO> cookBoardAll(long b_number) {
		return cr.cookBoardAll(b_number);
	}
	@Override
	public String delete(long c_number, long b_number, int page) {
		int result = cr.delete(c_number);
		if(result>0) {
			return "redirect:/board/paging";
		} else {
		}
		return "/board/paging";
	}
	@Override
	public String deletec(long c_number, long b_number, int page) {
		int result = cr.deletec(c_number);
		if(result>0) {
			return "redirect:/board/pagingc";
		} else {
		}
		return "/board/pagingc";
	}
}
