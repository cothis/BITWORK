package com.bitwork.addressbook.controller;

import com.bitwork.addressbook.dao.AddressBookDAO;
import com.bitwork.addressbook.vo.AddressBookVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ListController", value = "/addressbook/list")
public class ListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String nowPageStr = request.getParameter("nowPage");
        int nowPage = 1;
        if (nowPageStr != null) {
            nowPage = Integer.parseInt(nowPageStr);
        }

        int companyIdx = 15;
        Map<String, Object> returnMap = AddressBookDAO.findByCompanyIdx(companyIdx, name, nowPage);

        request.setAttribute("list", returnMap.get("list"));
        request.setAttribute("paging", returnMap.get("paging"));
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
