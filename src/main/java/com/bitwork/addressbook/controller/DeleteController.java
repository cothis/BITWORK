package com.bitwork.addressbook.controller;

import com.bitwork.addressbook.dao.AddressBookDAO;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DeleteController", value = "/addressbook/delete")
public class DeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        Map<String, List<Integer>> map = new Gson().fromJson(request.getReader(), Map.class);

        List<Integer> list = map.get("idxArr");

        int result = AddressBookDAO.deleteByIdxList(list);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("result", result);

        response.getWriter().write(new Gson().toJson(resultMap));
    }
}
