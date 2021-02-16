package com.bitwork.member.controller;

import com.bitwork.member.dao.MemberDAO;
import com.bitwork.member.enumdef.MemberGrade;
import com.bitwork.member.vo.MemberVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CancelJoinCompanyController", value = "/member/cancelJoinCompany")
public class CancelJoinCompanyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MemberDAO dao = new MemberDAO();
        MemberVO user = (MemberVO) request.getSession().getAttribute("user");

        boolean result = dao.updateCompanyInfo(null, MemberGrade.EMPTY, user);

        response.setContentType("application/json;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.getWriter().write(String.valueOf(result));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
