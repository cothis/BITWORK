package com.bitwork.member.command;

import com.bitwork.member.dao.MemberDAO;
import com.bitwork.member.vo.MemberVO;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class FindListByIdCommand implements MemberCommand {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        MemberDAO dao = new MemberDAO();
        List<MemberVO> list = dao.findListById(id);

        String gson = new Gson().toJson(list);

        response.setContentType("application/json;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.getWriter().write(gson);
    }
}
