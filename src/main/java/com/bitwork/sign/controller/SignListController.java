package com.bitwork.sign.controller;

import com.bitwork.main.controller.RequestForwarder;
import com.bitwork.member.vo.MemberVO;
import com.bitwork.sign.dao.SignDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "SignListController", value = "/sign/list")
public class SignListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 테스트용 로그인 유저
        // request.getSession().setAttribute("user", new MemberVO("cothis", "1234", "민호", "010-1234-5678", "abc@abc.com", "사원", null, 15, null, 4, null, null));

        MemberVO user = (MemberVO) request.getSession().getAttribute("user");
        String nowPageStr = request.getParameter("nowPage");

        int nowPage = 1;
        if (nowPageStr != null && nowPageStr.trim().length() > 0) {
            nowPage = Integer.parseInt(nowPageStr);
        }
        System.out.println("nowPage = " + nowPage);

        String docStatus = request.getParameter("docStatus");

        Map<String, Object> resultMap = SignDAO.list(nowPage, docStatus, user);

        request.setAttribute("list", resultMap.get("list"));
        request.setAttribute("paging", resultMap.get("paging"));
        request.setAttribute("docStatus", docStatus);

        System.out.println("resultMap = " + resultMap);
        RequestForwarder.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
