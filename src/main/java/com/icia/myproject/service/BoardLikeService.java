package com.icia.myproject.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.myproject.dto.BoardLikeDTO;
import com.icia.myproject.repository.BoardLikeRepository;

@Service
public class BoardLikeService implements BoardLikeServiceInterface {

	@Autowired
	private BoardLikeRepository blr;
	
	//좋아요
	@Override
	public long getBoardLike(BoardLikeDTO like) throws  IllegalStateException, IOException {
		return blr.getBoardLike(like);
	}

	@Override
	public void deleteBoardLike(BoardLikeDTO like) throws  IllegalStateException, IOException {
		blr.deleteBoardLike(like);
        blr.updateBoardLike(like.getB_number());
		
	}

	@Override
	public void insertBoardLike(BoardLikeDTO like) throws  IllegalStateException, IOException{
		blr.insertBoardLike(like);
	     blr.updateBoardLike(like.getB_number());
		
	}

	


	
}
