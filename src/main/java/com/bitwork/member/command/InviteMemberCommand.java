package com.bitwork.member.command;

import com.bitwork.member.dao.MemberDAO;
import com.bitwork.member.vo.MemberVO;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class InviteMemberCommand implements MemberCommand {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        MemberVO user = (MemberVO) request.getSession().getAttribute("user");
        String id = request.getParameter("id");
        MemberDAO dao = new MemberDAO();
        int result = dao.inviteMember(user.getCompanyIdx(), id);

        Map<String, Object> map = new HashMap<>();
        map.put("result", result > 0);

        response.getWriter().write(new Gson().toJson(map));
    }
}
