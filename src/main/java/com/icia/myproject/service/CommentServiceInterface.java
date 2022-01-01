package com.icia.myproject.service;

import java.util.List;

import com.icia.myproject.dto.CommentDTO;

public interface CommentServiceInterface {

	List<CommentDTO> tripBoardAll(long b_number);

	void save(CommentDTO comment);

	List<CommentDTO> cookBoardAll(long b_number);

	String delete(long c_number, long b_number, int page);

	String deletec(long c_number, long b_number, int page);

}
