package com.icia.myproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.myproject.dto.CommentDTO;
import com.icia.myproject.service.CommentServiceInterface;

@Controller
@RequestMapping("/comment/*")
public class CommentController {
	
	@Autowired
	private CommentServiceInterface cs;

//	댓글등록
	@RequestMapping (value="save", method=RequestMethod.POST)
	public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO comment){
		System.out.println("CommentController.save():" + comment);
		cs.save(comment);
		List<CommentDTO> commentList = cs.tripBoardAll(comment.getB_number());
		System.out.println("commentList 출력() : " + commentList);
		return commentList;
	}
	
	@RequestMapping (value="delete", method=RequestMethod.GET)
	public String delete(@RequestParam("c_number") long c_number,
						 @RequestParam("b_number") long b_number,
						 @RequestParam(value="page", required=false, defaultValue="1")int page) {
		String result = cs.delete(c_number, b_number, page);
		return result;
	}
	
	@RequestMapping (value="deletec", method=RequestMethod.GET)
	public String deletec(@RequestParam("c_number") long c_number,
						  @RequestParam("b_number") long b_number,
						  @RequestParam(value="page", required=false, defaultValue="1")int page) {
		String result = cs.deletec(c_number, b_number, page);
		return result;
	}
	

}
