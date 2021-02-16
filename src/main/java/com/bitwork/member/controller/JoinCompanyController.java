package com.bitwork.member.controller;

import com.bitwork.member.dao.MemberDAO;
import com.bitwork.member.enumdef.MemberGrade;
import com.bitwork.member.vo.MemberVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "JoinCompanyController", value = "/member/joinCompany")
public class JoinCompanyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("joinCompany.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer companyIdx = Integer.parseInt(request.getParameter("companyIdx"));
        System.out.println("companyIdx = " + companyIdx);
        MemberVO user = (MemberVO) request.getSession().getAttribute("user");

        MemberDAO dao = new MemberDAO();
        boolean result = dao.updateCompanyInfo(companyIdx, MemberGrade.APPLY, user);

        response.setContentType("application/json;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.getWriter().write(String.valueOf(result));
    }
}
