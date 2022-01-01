package com.icia.myproject.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.myproject.service.CommentServiceInterface;
import com.icia.myproject.dto.BoardDTO;
import com.icia.myproject.dto.BoardLikeDTO;
import com.icia.myproject.dto.CommentDTO;
import com.icia.myproject.dto.MemberDTO;
import com.icia.myproject.dto.PageDTO;
import com.icia.myproject.service.BoardLikeServiceInterface;
import com.icia.myproject.service.BoardServiceInterface;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {
	@Autowired
	private BoardServiceInterface bs;
	@Autowired
	private CommentServiceInterface cs;
	@Autowired
	private BoardLikeServiceInterface bls;

	// 메인화면 출력
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main() {
		return "/board/main";
	}
		
	// 여행게시판 페이징처리
	@RequestMapping(value = "paging", method = RequestMethod.GET)
	// value: 파라미터 이름, required: 필수여부, defaultValue: 기본값(page 요청값이 없으면 1로 세팅)
	public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
		List<BoardDTO> bList = bs.pagingList(page);
		PageDTO paging = bs.paging(page);
		model.addAttribute("bList", bList);
		model.addAttribute("paging", paging);
		return "board/tripBoard";	
	}
	
	 //여행 게시판 출력
	 @RequestMapping(value="tripBoard", method=RequestMethod.GET) 
	 public String tripBoard(Model model) { 
		List<BoardDTO> bList = bs.tripBoard();
		model.addAttribute("bList", bList);
	 return "/board/paging"; 
		 }
	 

	// 게시판 글쓰기 출력
	@RequestMapping(value = "save", method = RequestMethod.GET)
	public String saveForm() {
		return "/board/save";
	}

	// 여행게시판 글쓰기 처리
	@RequestMapping(value = "tripBoardSave", method = RequestMethod.POST)
	public String boardWriting(@ModelAttribute BoardDTO board) {
		bs.tripBoard(board);
		return "redirect:/board/tripBoard";
	}

	// 여행 게시판 글저장
	@RequestMapping(value = "tripSavefile", method = RequestMethod.POST)
	public String tripSavefile(@ModelAttribute BoardDTO board) throws IllegalStateException, IOException {
		bs.tripSavefile(board);
		return "redirect:/board/paging";
	}
	
	// 게시판 글 삭제
	@RequestMapping (value="delete", method=RequestMethod.GET)
	public String delete(@RequestParam("b_number") long b_number, Model model) {
		bs.delete(b_number);
		return "redirect:/board/paging";
	}

	
	/*
	 * // 여행게시판 글목록보기
	 * 
	 * @RequestMapping(value = "tripBoard", method = RequestMethod.GET) public
	 * String tripBoardAll(Model model) { List<BoardDTO> bList = bs.tripBoardAll();
	 * model.addAttribute("bList", bList); System.out.println("어디가문제냐 3"); //
	 * 페이징처리로인해서 tripboard를 paging 으로 넘어가게함 return "/board/paging"; }
	 */
	 
	
	// 글읽기 (디테일 출력)
	@RequestMapping (value="tripdetail", method=RequestMethod.GET)
	public String findById(@RequestParam("b_number") long b_number,
						   @RequestParam("m_number") long m_number, Model model,
						   @RequestParam(value="page", required=false, defaultValue="1") int page)
								   throws IllegalStateException, IOException {
	BoardDTO board = bs.findById(b_number);
	model.addAttribute("board",board);
	model.addAttribute("page",page); // detail.jsp 로 갈때 page값을 가지고 감
	List<CommentDTO> commentList = cs.tripBoardAll(b_number); // 댓글리스트를 가져옴
	model.addAttribute("commentList", commentList); // 댓글을 가져가는 메소드
	// ----------------------------------------------
	BoardLikeDTO vo = new BoardLikeDTO(); 
	 vo.setB_number(b_number);
	 vo.setM_number(m_number);
	 long boardlike = bls.getBoardLike(vo);
	 System.out.println(b_number + m_number);
	 model.addAttribute("heart",boardlike);
	 model.addAttribute("member", m_number);
	
	return "board/tripdetail";
	}
	
	// 업데이트 처리
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateform(@RequestParam("b_number") long b_number, Model model,
							 @RequestParam(value="page" , required=false, defaultValue="1")int page)
							 throws IllegalStateException, IOException {
		BoardDTO board = bs.updateShow(b_number);
		model.addAttribute("board", board);
		model.addAttribute("page", page);
		return "board/update";
	}
	
	//업데이트후 detail 출력
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@ModelAttribute BoardDTO board, Model model,
				@RequestParam(value="page", required=false, defaultValue="1")int page)
				throws IllegalStateException, IOException {
	bs.update(board);
	return "redirect:/board/tripdetail?b_number=" + board.getB_number() + "&page=" + page + "&m_number=" + board.getM_number();
	}
	
	// 좋아요
	@RequestMapping(value = "heart", method=RequestMethod.POST)
    public @ResponseBody long heart(@ModelAttribute BoardLikeDTO BoardLike,
    		@RequestParam("m_number") long m_number, @RequestParam("b_number") long b_number, 
    		@RequestParam("heart") long heart) throws  IllegalStateException, IOException {
    BoardLikeDTO like = new BoardLikeDTO();
    like.setB_number(b_number);
    like.setM_number(m_number);
    like.setHeart(heart);
    if(heart >= 1) {
        bls.deleteBoardLike(like);
        heart=0;
    } else {
        bls.insertBoardLike(like);
        heart=1;
   }
	return heart; 
	
	}
	
	// 검색기능
	@RequestMapping (value="search", method=RequestMethod.GET)
	public String search(@RequestParam("searchtype") String searchtype,
						 @RequestParam("keyword") String keyword, Model model) {
	List<BoardDTO> bList = bs.search(searchtype, keyword);
	model.addAttribute("bList", bList);
	return "/board/tripBoard";
	}
	

//	요리게시판
	
	// 게시판 글쓰기 출력
	@RequestMapping(value = "cooksave", method = RequestMethod.GET)
	public String cookSaveForm() {
	return "/board/cooksave";
}
	// 요리게시판 출력
	@RequestMapping(value = "cookBoard", method = RequestMethod.GET)
	public String cookBoard(Model model) throws Exception {
		List<BoardDTO> bList = bs.cookBoard();
		model.addAttribute("bList",bList);
	return "/board/cookBoard";
}
	
	// 요리게시판 글쓰기 처리
	@RequestMapping(value = "cookBoardSave", method = RequestMethod.POST)
	public String cookBoardWriting(@ModelAttribute BoardDTO board) {
		bs.cookBoard(board);
		return "redirect:/board/cookBoard";
	}
	
	// 요리 게시판 글저장
	@RequestMapping(value = "cookSavefile", method = RequestMethod.POST)
	public String cookSavefile(@ModelAttribute BoardDTO board) throws IllegalStateException, IOException {
	bs.cookSavefile(board);
	return "redirect:/board/pagingc";
		}
	
	// 요리 페이징처리
	@RequestMapping(value = "pagingc", method = RequestMethod.GET)
	// value: 파라미터 이름, required: 필수여부, defaultValue: 기본값(page 요청값이 없으면 1로 세팅)
	public String pagingc(@RequestParam(value = "pagec", required = false, defaultValue = "1") int pagec, Model model) {
			List<BoardDTO> bListc = bs.pagingListc(pagec);
			PageDTO pagingc = bs.pagingc(pagec);
			model.addAttribute("bListc", bListc);
			model.addAttribute("pagingc", pagingc);
			return "board/cookBoard";	
		}
	
	// 요리게시판 글 삭제
	@RequestMapping (value="deletec", method=RequestMethod.GET)
	public String deletec(@RequestParam("b_number") long b_number, Model model) {
		bs.deletec(b_number);
		return "redirect:/board/pagingc";
		}
		
// 요리글읽기 (디테일 출력)
	@RequestMapping (value="cookdetail", method=RequestMethod.GET)
	public String findByIdc(@RequestParam("b_number") long b_number,
						   @RequestParam("m_number") long m_number, Model model,
						   @RequestParam(value="page", required=false, defaultValue="1") int page)
								   throws IllegalStateException, IOException {
		BoardDTO board = bs.findByIdc(b_number);
		model.addAttribute("board",board);
		model.addAttribute("page",page); // detail.jsp 로 갈때 page값을 가지고 감
		List<CommentDTO> commentList = cs.cookBoardAll(b_number); // 댓글리스트를 가져옴
		model.addAttribute("commentList", commentList); // 댓글을 가져가는 메소드
		// ----------------------------------------------
		BoardLikeDTO vo = new BoardLikeDTO(); 
		 vo.setB_number(b_number);
		 vo.setM_number(m_number);
		 long boardlike = bls.getBoardLike(vo);
		 System.out.println(b_number + m_number);
		 model.addAttribute("heart",boardlike);
		 model.addAttribute("member", m_number);
		
		return "board/cookdetail";
		}
	
	// 업데이트 처리
		@RequestMapping(value="updatec", method=RequestMethod.GET)
		public String updateformc(@RequestParam("b_number") long b_number, Model model,
								 @RequestParam(value="pagec" , required=false, defaultValue="1")int pagec)
								 throws IllegalStateException, IOException {
			BoardDTO board = bs.updateShowc(b_number);
			model.addAttribute("board", board);
			model.addAttribute("pagec", pagec);
			return "board/updatecook";
		}
		
		//업데이트후 detail 출력
		@RequestMapping(value="updatec", method=RequestMethod.POST)
		public String updatec(@ModelAttribute BoardDTO board, Model model,
					@RequestParam(value="pagec", required=false, defaultValue="1")int pagec)
					throws IllegalStateException, IOException {
		bs.updatec(board);
		return "redirect:/board/cookdetail?b_number=" + board.getB_number() + "&pagec=" + pagec + "&m_number=" + board.getM_number();
		}
		
		// 요리 검색
		@RequestMapping (value="searchc", method=RequestMethod.GET)
		public String searchc(@RequestParam("searchtypec") String searchtypec,
							 @RequestParam("keywordc") String keywordc, Model model) {
		List<BoardDTO> bListc = bs.searchc(searchtypec, keywordc);
		model.addAttribute("bListc", bListc);
		return "/board/cookBoard";
		}
		
}



