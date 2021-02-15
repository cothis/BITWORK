package com.bitwork.member.controller;

import com.bitwork.member.dao.MemberDAO;
import com.bitwork.member.vo.MemberVO;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "LoginController", value = "/member/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String userId = request.getParameter("user_id");
        String userPw = request.getParameter("user_pw");

        Map<String, Object> resultMap = new HashMap<>();

        MemberDAO dao = new MemberDAO();
        MemberVO vo = dao.findById(userId);
        String result = "";
        if (vo != null && userPw.equals(vo.getPw())) {
            vo.setPw(null);
            request.getSession().setAttribute("user", vo);

            resultMap.put("hasCompany", vo.getCompanyIdx() != null);
            result = new Gson().toJson(resultMap);
        } else {
            resultMap.put("result", false);
        }
        response.getWriter().write(result);
    }
}
