package com.bitwork.company.controller;

import com.bitwork.member.dao.MemberDAO;
import com.bitwork.member.vo.MemberVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CompanyManageController", value = "/company/manage")
public class CompanyManageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 유저의 회사 직원목록을 가져온다.
        MemberVO user = (MemberVO) request.getSession().getAttribute("user");

        MemberDAO dao = new MemberDAO();
        List<MemberVO> employees = dao.findMembersByCompanyId(user.getCompanyIdx(), null);

        // 직원목록을 request Attribute에 담아서 manage.jpg로 이동
        request.setAttribute("employees", employees);
        request.getRequestDispatcher("manage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
