package com.icia.myproject.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.icia.myproject.dto.BoardDTO;
import com.icia.myproject.dto.BoardLikeDTO;
import com.icia.myproject.dto.PageDTO;
import com.icia.myproject.repository.BoardRepository;

@Service
public class BoardService implements BoardServiceInterface {

	@Autowired
	private BoardRepository br;
	
	@Override
	public BoardDTO findById(long b_number) {
		br.hits(b_number);
		BoardDTO board = br.findById(b_number);
		return board;
		
	}
	
		
	private static final int PAGE_LIMIT = 9;
	private static final int BLOCK_LIMIT = 3;
	
	//페이징 숫자표기
	@Override
	public List<BoardDTO> pagingList(int page) {
	int pagingStart = (page-1) * PAGE_LIMIT;
	Map<String, Integer> pagingParam = new HashMap<String, Integer>();
	pagingParam.put("start", pagingStart);
	pagingParam.put("limit", PAGE_LIMIT);
	List<BoardDTO> pagingList = br.pagingList1(pagingParam);
	for(BoardDTO b: pagingList) {
	}
		return pagingList;
	}
	
	//페이징
	@Override
	public PageDTO paging(int page) {
	int boardCount = br.boardCount();
	int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
	int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT)))-1) * BLOCK_LIMIT + 1;
	int endPage = startPage + BLOCK_LIMIT -1;
	if(endPage > maxPage)
		endPage = maxPage;
	PageDTO paging = new PageDTO();
	paging.setPage(page);
	paging.setStartPage(startPage);
	paging.setEndPage(endPage);
	paging.setMaxPage(maxPage);
	return paging;
	}
	
	//여행게시판 글쓰기
	@Override
	public void tripBoard(BoardDTO board) {
		br.tripBoard(board);
	}
	
	//여행게시판 파일저장
	@Override
	public void tripSavefile(BoardDTO board) throws IllegalStateException, IOException {
		MultipartFile b_file = board.getB_file();
		String b_filename = b_file.getOriginalFilename();
		b_filename = System.currentTimeMillis() + "-" + b_filename;
		String savePath = "C:\\Development\\source\\spring_sts\\MyProject\\src\\main\\webapp\\resources\\tripimage\\" + b_filename;
		if(!b_file.isEmpty()) {
			b_file.transferTo(new File(savePath));
	}
		board.setB_filename(b_filename);
		br.tripSavefile(board);
	}

	//여행게시판 글목록 보기
	@Override
	public List<BoardDTO> tripBoard() {
		List<BoardDTO> bList = br.tripBoard();
		return bList;
	}

	@Override
	public void delete(long b_number) {
		br.delete(b_number);
		
	}

	//수정화면 보여주기
	@Override
	public BoardDTO updateShow(long b_number) {
		BoardDTO board=br.updateShow(b_number);
		return board;
	}
	
	@Override
	public void update(BoardDTO board) throws IllegalStateException, IOException {
		MultipartFile b_file = board.getB_file();
		// 파일 이름을 가져옴(파일이름을 DB에 저장하기 위해)
		String b_filename = b_file.getOriginalFilename();
		// 파일명 중복을 피하기 위해 파일이름앞에 현재 시간값을 붙임. 
		b_filename = System.currentTimeMillis() + "-" + b_filename;
		// 파일 저장경로 세팅
		String savePath = "C:\\Development\\source\\spring_sts\\MyProject\\src\\main\\webapp\\resources\\tripimage\\"+b_filename;
		// bfile이 비어있지 않다면(즉 파일이 있으면) savePath에 저장을 하겠다.
		if(!b_file.isEmpty()) {
		b_file.transferTo(new File(savePath));
		}
		// 여기까지의 내용은 파일을 저장하는 과정 
		//DB에 저장하기 위해 DTO에 파일 이름을 담는다.
		board.setB_filename(b_filename);
		// Repository로 호출
		// DB의 board 에 파일이름을 저장할 b_filename 이라는 컬럼 추가 (타입은 varchar(100))
		br.update(board);
			}
	
	//검색
	@Override
	public List<BoardDTO> search(String searchtype, String keyword) {
		Map<String, String> searchParam = new HashMap<String, String>();
		searchParam.put("type", searchtype);
		searchParam.put("word", keyword);
		List<BoardDTO> bList = br.search(searchParam);
		return bList;
	}

	
	//요리게시판 글쓰기
	@Override
	public void cookBoard(BoardDTO board) {
		br.cookBoard(board);
		
	}
	// 요리게시판 파일저장
	@Override
	public void cookSavefile(BoardDTO board) throws IllegalStateException, IOException {
		MultipartFile b_file = board.getB_file();
		String b_filename = b_file.getOriginalFilename();
		b_filename = System.currentTimeMillis() + "-" + b_filename;
		String savePath = "C:\\Development\\source\\spring_sts\\MyProject\\src\\main\\webapp\\resources\\cookimage\\" + b_filename;
		if(!b_file.isEmpty()) {
			b_file.transferTo(new File(savePath));
	}
		board.setB_filename(b_filename);
		br.cookSavefile(board);
	}
	
	private static final int PAGE_LIMITc = 9;
	private static final int BLOCK_LIMITc = 3;
	
	//요리게시판 페이징 숫자표기
	@Override
	public List<BoardDTO> pagingListc(int pagec) {
		int pagingStartc = (pagec-1) * PAGE_LIMITc;
		Map<String, Integer> pagingParamc = new HashMap<String, Integer>();
		pagingParamc.put("startc", pagingStartc);
		pagingParamc.put("limitc", PAGE_LIMITc);
		List<BoardDTO> pagingListc = br.pagingListco(pagingParamc);
		for(BoardDTO b: pagingListc) {
		}
			return pagingListc;
	}
	
	//페이징
		@Override
		public PageDTO pagingc(int pagec) {
		int boardCountc = br.cookboardCount();
		int maxPagec = (int)(Math.ceil((double)boardCountc / PAGE_LIMITc));
		int startPagec = (((int)(Math.ceil((double)pagec / BLOCK_LIMITc)))-1) * BLOCK_LIMITc + 1;
		int endPagec = startPagec + BLOCK_LIMITc -1;
		if(endPagec > maxPagec)
			endPagec = maxPagec;
		PageDTO pagingc = new PageDTO();
		pagingc.setPagec(pagec);
		pagingc.setStartPagec(startPagec);
		pagingc.setEndPagec(endPagec);
		pagingc.setMaxPagec(maxPagec);
		return pagingc;
		}

		@Override
		public List<BoardDTO> cookBoard() {
			List<BoardDTO> bList = br.cookBoard();
			return bList;
		}

		@Override
		public void deletec(long b_number) {
			br.deletec(b_number);
			
		}

		@Override
		public BoardDTO findByIdc(long b_number) {
			br.hits(b_number);
			BoardDTO board = br.findByIdc(b_number);
			return board;
		}

		@Override
		public BoardDTO updateShowc(long b_number) {
			BoardDTO board=br.updateShowc(b_number);
			return board;
		}

		@Override
		public void updatec(BoardDTO board) throws IllegalStateException, IOException {
			MultipartFile b_file = board.getB_file();
			String b_filename = b_file.getOriginalFilename();
			b_filename = System.currentTimeMillis() + "-" + b_filename;
			String savePath = "C:\\Development\\source\\spring_sts\\MyProject\\src\\main\\webapp\\resources\\cookimage\\"+b_filename;
			if(!b_file.isEmpty()) {
			b_file.transferTo(new File(savePath));
			}
			board.setB_filename(b_filename);
			br.updatec(board);
				}

		@Override
		public List<BoardDTO> searchc(String searchtypec, String keywordc) {
			Map<String, String> searchParamc = new HashMap<String, String>();
			searchParamc.put("type", searchtypec);
			searchParamc.put("word", keywordc);
			List<BoardDTO> bListc = br.searchc(searchParamc);
			return bListc;
		}
			
		}
		
		

	

	
	
	

