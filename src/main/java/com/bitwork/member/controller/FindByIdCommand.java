package com.bitwork.member.controller;

import com.bitwork.member.dao.MemberDAO;
import com.bitwork.member.vo.MemberVO;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FindByIdCommand implements MemberCommand {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println("id = " + id);

        MemberDAO dao = new MemberDAO();
        MemberVO vo = dao.findById(id);
        System.out.println("vo = " + vo);

        String gson = new Gson().toJson(vo);
        System.out.println("gson = " + gson);

        response.setContentType("application/json");
        response.getWriter().write(gson);
    }
}
