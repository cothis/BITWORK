package com.bitwork.member.controller;

import com.bitwork.commute.dao.CommuteDAO;
import com.bitwork.commute.vo.CommuteVO;
import com.bitwork.main.controller.RequestForwarder;
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
        RequestForwarder.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String userId = request.getParameter("user_id");
        String userPw = request.getParameter("user_pw");

        try {
            Map<String, Object> resultMap = new HashMap<>();

            MemberDAO dao = new MemberDAO();
            MemberVO vo = dao.findById(userId);
            String result = "";
            if (vo != null && userPw.equals(vo.getPw())) {
                vo.setPw(null);
                request.getSession().setAttribute("user", vo);
                CommuteVO commuteToday = CommuteDAO.getCommuteToday(vo);
                request.getSession().setAttribute("commute", commuteToday);
                resultMap.put("grade", vo.getGrade());
                result = new Gson().toJson(resultMap);
            } else {
                result = "false";
            }
            response.getWriter().write(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
