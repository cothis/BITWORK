package com.bitwork.main.controller;

import com.bitwork.board.dao.BoardDAO;
import com.bitwork.board.vo.BoardVO;
import com.bitwork.commute.dao.CommuteDAO;
import com.bitwork.commute.vo.CommuteVO;
import com.bitwork.member.vo.MemberVO;
import com.bitwork.sign.dao.SignDAO;
import com.bitwork.sign.vo.NoReadCount;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@WebServlet(name = "MainController", value = "/main")
public class MainController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            MemberVO user = (MemberVO) request.getSession().getAttribute("user");
            if (user.getGrade() == 0) {
                response.sendRedirect("/member/noCompany");
            } else if (user.getGrade() == 1) { // 초대
                response.sendRedirect("/member/invite");
            } else if (user.getGrade() == 2) { // 신청
                response.sendRedirect("/member/waitCompany");
            } else {
                // Board
                List<BoardVO> boardList = BoardDAO.lastNormal();

                List<BoardVO> noticeList = boardList.stream()
                        .filter(boardVO -> boardVO.getStatus() == 0)
                        .collect(Collectors.toList());
                List<BoardVO> normalList = boardList.stream()
                        .filter(boardVO -> boardVO.getStatus() == 1)
                        .collect(Collectors.toList());
                request.setAttribute("noticeList", noticeList);
                request.setAttribute("normalList", normalList);

                // Sign
                NoReadCount noReadCount = SignDAO.findNoReadCount(user);
                request.setAttribute("noReadCount", noReadCount);
                System.out.println("request.getRequestURI() = " + request.getRequestURI());
                RequestForwarder.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
