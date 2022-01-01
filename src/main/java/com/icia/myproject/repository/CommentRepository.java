package com.icia.myproject.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.myproject.dto.CommentDTO;

@Repository
public class CommentRepository {
	@Autowired
	private SqlSessionTemplate sql;

	public void save(CommentDTO comment) {
		sql.insert("Comment.save", comment);	
	}

	public List<CommentDTO> tripBoardAll(long b_number) {
		return sql.selectList("Comment.tripBoardAll", b_number);
	}

	public List<CommentDTO> cookBoardAll(long b_number) {
		return sql.selectList("Comment.cookBoardAll", b_number);
	}

	public int delete(long c_number) {
		return sql.delete("Comment.delete", c_number);
	}

	public int deletec(long c_number) {
		return sql.delete("Comment.deletec", c_number);
	}
}
