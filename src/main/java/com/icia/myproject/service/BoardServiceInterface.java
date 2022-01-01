package com.icia.myproject.service;

import java.io.IOException;
import java.util.List;

import com.icia.myproject.dto.BoardDTO;
import com.icia.myproject.dto.BoardLikeDTO;
import com.icia.myproject.dto.PageDTO;

public interface BoardServiceInterface {

	List<BoardDTO> pagingList(int page);

	PageDTO paging(int page);

	void tripBoard(BoardDTO board);

	void tripSavefile(BoardDTO board) throws IllegalStateException, IOException;

	List<BoardDTO> tripBoard();

	BoardDTO findById(long b_number);

	void delete(long b_number);

	BoardDTO updateShow(long b_number);

	void update(BoardDTO board)throws IllegalStateException, IOException;

	List<BoardDTO> search(String searchtype, String keyword);

	void cookBoard(BoardDTO board);

	void cookSavefile(BoardDTO board) throws IllegalStateException, IOException;

	List<BoardDTO> pagingListc(int pagec);

	PageDTO pagingc(int pagec);

	List<BoardDTO> cookBoard();

	void deletec(long b_number);

	BoardDTO findByIdc(long b_number);

	BoardDTO updateShowc(long b_number);

	void updatec(BoardDTO board) throws IllegalStateException, IOException;

	List<BoardDTO> searchc(String searchtypec, String keywordc);



}
