package com.icia.myproject.repository;

import java.io.IOException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.myproject.dto.BoardLikeDTO;

@Repository
public class BoardLikeRepository {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public long getBoardLike(BoardLikeDTO like) throws  IllegalStateException, IOException {
		 return sql.selectOne("boardLike.getBoardLike", like);
	}

	public void deleteBoardLike(BoardLikeDTO like) throws  IllegalStateException, IOException {
		sql.delete("boardLike.deleteBoardLike", like);
		
	}

	public void updateBoardLike(long b_number) throws  IllegalStateException, IOException {
		sql.update("boardLike.updateBoardLike", b_number);
		
	}

	public void insertBoardLike(BoardLikeDTO like) throws  IllegalStateException, IOException {
		 sql.insert("boardLike.createBoardLike",like);
		
	}

	
 
}
