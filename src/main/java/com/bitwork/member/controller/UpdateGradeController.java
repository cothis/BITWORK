package com.bitwork.member.controller;

import com.bitwork.member.dao.MemberDAO;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "UpdateGradeController", value = "/member/updateGrade")
public class UpdateGradeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, Object> map = new Gson().fromJson(request.getReader(), Map.class);
        System.out.println("map = " + map);

        MemberDAO dao = new MemberDAO();
        int result = dao.updateGrade(map);

        response.setContentType("application/json;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.getWriter().write(result + "");
    }
}
