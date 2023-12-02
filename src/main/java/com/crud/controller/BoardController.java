package com.crud.controller;

import com.crud.bean.BoardVO;
import com.crud.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class BoardController {

    @Autowired
    BoardService boardService;

    @RequestMapping("/")
    public String Home() {
        return "redirect:list";
    }

    @RequestMapping("/list")
    public String boardList(Model model) {
        model.addAttribute("list", boardService.getBoardList());
        return "posts";
    }

    @GetMapping("/add")
    public String getAddpostform() {
        return "addpostform";
    }

    @PostMapping("/addok")
    public String addPostOk(BoardVO vo) {
        int result = boardService.insertBoard(vo);
        return "redirect:list";
    }

    @GetMapping("/editform/{id}")
    public String editPost(@PathVariable("id") int id, Model model){
        BoardVO boardVO = boardService.getBoard(id);
        model.addAttribute("u", boardVO);
        return "editform";
    }

    @GetMapping("/view/{id}")
    public String getPost(@PathVariable("id") int id, Model model) {
        BoardVO boardVO = boardService.getBoard(id);
        model.addAttribute("u", boardVO);
        return "view";
    }

    @PostMapping("/editok")
    public String editPostOk(BoardVO vo){
        if(boardService.updateBoard(vo)==0) {
            System.out.println("Fail to update");
        }
        else {
            System.out.println("Success to update");
        }
        return "redirect:list";
    }

    @GetMapping(value = "/deleteok/{id}")
    public String deletePost(@PathVariable("id") int id) {
        if(boardService.deleteBoard(id)==0) {
            System.out.println("Fail to delete");
        }
        else {
            System.out.println("Success to delete");
        }
        return "redirect:../list";
    }

}
