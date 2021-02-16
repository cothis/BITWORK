package com.bitwork.company.controller;

import com.bitwork.company.dao.CompanyDAO;
import com.bitwork.company.dto.MakeCompanyForm;
import com.bitwork.member.vo.MemberVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MakeCompanyController", value = "/company/makeCompany")
public class MakeCompanyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("makeCompany.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String companyName = request.getParameter("companyName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        MakeCompanyForm makeCompanyForm = new MakeCompanyForm(companyName, phone, email);
        MemberVO user = (MemberVO) request.getSession().getAttribute("user");

        boolean result = CompanyDAO.addCompany(makeCompanyForm, user) > 0;

        response.setContentType("application/json;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.getWriter().write(String.valueOf(result));
    }
}
