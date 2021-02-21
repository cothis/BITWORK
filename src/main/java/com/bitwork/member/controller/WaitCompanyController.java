package com.bitwork.member.controller;

import com.bitwork.company.dao.CompanyDAO;
import com.bitwork.company.vo.CompanyVO;
import com.bitwork.main.controller.RequestForwarder;
import com.bitwork.member.vo.MemberVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "WaitCompanyController", value = "/member/waitCompany")
public class WaitCompanyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MemberVO user = (MemberVO) request.getSession().getAttribute("user");
        CompanyVO companyVO = CompanyDAO.findById(user.getCompanyIdx());

        request.setAttribute("company", companyVO);
        RequestForwarder.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
