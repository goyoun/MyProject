package com.icia.myproject.service;

import java.io.IOException;

import com.icia.myproject.dto.BoardLikeDTO;

public interface BoardLikeServiceInterface {

	long getBoardLike(BoardLikeDTO like) throws  IllegalStateException, IOException;

	void deleteBoardLike(BoardLikeDTO like) throws  IllegalStateException, IOException;

	void insertBoardLike(BoardLikeDTO like) throws  IllegalStateException, IOException;


}
