package com.bitwork.member.command;

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
        try {
            MemberDAO dao = new MemberDAO();
            MemberVO vo = dao.findById(id);

            String gson = new Gson().toJson(vo);

            response.setContentType("application/json");
            response.getWriter().write(gson);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
