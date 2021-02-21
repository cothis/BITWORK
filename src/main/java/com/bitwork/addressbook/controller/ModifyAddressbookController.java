package com.bitwork.addressbook.controller;

import com.bitwork.addressbook.dao.AddressBookDAO;
import com.bitwork.addressbook.vo.AddressBookVO;
import com.bitwork.main.controller.RequestForwarder;
import com.bitwork.member.vo.MemberVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "InsertController", value = "/addressbook/modify")
public class ModifyAddressbookController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idxString = request.getParameter("idx");
        int idx = 0;
        if (idxString != null && idxString.trim().length() > 0) {
            idx = Integer.parseInt(idxString);
            AddressBookVO vo = AddressBookDAO.findByIdx(idx);

            request.setAttribute("vo", vo);
        }
        RequestForwarder.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String company = request.getParameter("company");
        String phone = request.getParameter("phone");
        MemberVO user = (MemberVO) request.getSession().getAttribute("user");
        AddressBookVO vo = new AddressBookVO(name, phone, email, company, user.getCompanyIdx());
        int result = 0;

        String idxString = request.getParameter("idx");
        if (idxString == null || idxString.trim().length() == 0) { // insert 로직
            result = AddressBookDAO.insertAddress(vo);
        } else { // update 로직
            int idx = Integer.parseInt(idxString);
            vo.setAddressbookIdx(idx);
            result = AddressBookDAO.updateAddress(vo);
            System.out.println("result = " + result);
        }
        response.sendRedirect("list");
    }
}
