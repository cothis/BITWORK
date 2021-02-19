package com.bitwork.member.controller;

import com.bitwork.company.dao.CompanyDAO;
import com.bitwork.member.dao.MemberDAO;
import com.bitwork.member.vo.MemberVO;
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
        MemberVO user = (MemberVO) request.getSession().getAttribute("user");
        if (!map.containsKey("memberIdList")) {
            map.put("id", user.getId());
        }
/*
        MemberDAO dao = new MemberDAO();
        int result = dao.updateGrade(map);
        if (result > 0) {
            if ((boolean) map.get("isApply")) {
                // 회사 인원 증가 로직
                CompanyDAO.upEmpCnt(user.getCompanyIdx());
            }
        }

        response.setContentType("application/json;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.getWriter().write(result + "");*/
    }
}
