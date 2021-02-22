package com.bitwork.member.controller;

import com.bitwork.main.controller.RequestForwarder;
import com.bitwork.member.dao.MemberDAO;
import com.bitwork.member.vo.MemberVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "LeaveController", value = "/member/leave")
public class LeaveController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestForwarder.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");

        String pw = request.getParameter("pw");
        MemberVO user = (MemberVO) request.getSession().getAttribute("user");

        Map<String, String> map = new HashMap<>();
        map.put("id", user.getId());
        map.put("pw", pw);

        MemberDAO dao = new MemberDAO();
        int result = dao.deleteMember(map);
        if (result > 0) {
            request.getSession().invalidate();
        }

        response.getWriter().write(String.valueOf(result > 0));
    }
}
