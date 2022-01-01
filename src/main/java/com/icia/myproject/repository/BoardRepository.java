package com.icia.myproject.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.myproject.dto.BoardDTO;
import com.icia.myproject.dto.BoardLikeDTO;

@Repository
public class BoardRepository {

	@Autowired
	private SqlSessionTemplate sql;
	
	 //페이징 시작 
	public List<BoardDTO> pagingList(int pagingStart) { 
		return sql.selectList("Board.pagingList", pagingStart); 
	}
	 
	//페이징
	public List<BoardDTO> pagingList1(Map<String, Integer> pagingParam) {
		return sql.selectList("Board.pagingList1", pagingParam);
	}
	
//	게시글 개수
	public int boardCount() {
		return sql.selectOne("Board.count");
	}

//	여행 게시판 글쓰기
	public void tripBoard(BoardDTO board) {
		sql.insert("Board.tripBoardSave", board);
		
	}
//	여행게시판 파일저장
	public void tripSavefile(BoardDTO board) {
		sql.insert("Board.tripSavefile", board);
		
	}
	
//	여행게시판 출력
	public List<BoardDTO> tripBoard() {
		return sql.selectList("Board.tripBoard");
	}
	
//	조회수
	public void hits(long b_number) {
		sql.update("Board.hits", b_number);
	}
	
//	게시글 디테일
	public BoardDTO findById(long b_number) {
		return sql.selectOne("Board.findById", b_number);
	}
// 삭제
	public void delete(long b_number) {
		sql.delete("Board.delete", b_number);
		
	}

	public BoardDTO updateShow(long b_number) {
		return sql.selectOne("Board.findById", b_number);
	}

	public void update(BoardDTO board) {
		sql.update("Board.update",board);
		
	}

	public List<BoardDTO> search(Map<String, String> searchParam) {
		return sql.selectList("Board.search", searchParam);
	}

//	요리
	
	//요리게시판 글쓰기
	public void cookBoard(BoardDTO board) {
		sql.insert("Board.cookBoardSave", board);
		
	}
	
	// 요리게시판 파일저장
	public void cookSavefile(BoardDTO board) {
		sql.insert("Board.cookSavefile", board);
		
	}
	// 요리 페이징시작
	public List<BoardDTO> pagingListc(int pagingStartc) {
		return sql.selectList("Board.pagingListc", pagingStartc);
	}

//	요리페이징
	public List<BoardDTO> pagingListco(Map<String, Integer> pagingParamc) {
		return sql.selectList("Board.pagingListco", pagingParamc);
	}
	

	// 요리게시판 조회수
	public int cookboardCount() {
		return sql.selectOne("Board.cookcount");
	}
//	요리게시판 출력
	public List<BoardDTO> cookBoard() {
		return sql.selectList("Board.cookBoard");
	}

	public void deletec(long b_number) {
		sql.delete("Board.deletec", b_number);
		
	}

	public BoardDTO findByIdc(long b_number) {
		return sql.selectOne("Board.findById", b_number);
	}

	public BoardDTO updateShowc(long b_number) {
		return sql.selectOne("Board.findByIdc", b_number);
		
	}

	public void updatec(BoardDTO board) {
		sql.update("Board.updatec",board);
		
	}

	public List<BoardDTO> searchc(Map<String, String> searchParamc) {
		return sql.selectList("Board.searchc", searchParamc);
	}

	
}
