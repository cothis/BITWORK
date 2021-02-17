package com.bitwork.member.command;

import com.bitwork.member.dao.MemberDAO;
import com.bitwork.member.vo.MemberVO;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FindApplyListCommand implements MemberCommand {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MemberVO user = (MemberVO) request.getSession().getAttribute("user");

        Map<String, Object> map = new HashMap<>();
        map.put("result", false);

        try {
            MemberDAO dao = new MemberDAO();
            List<MemberDAO> list = dao.findApplyList(user.getCompanyIdx());
            map.put("list", list);
            map.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.getWriter().write(new Gson().toJson(map));
    }
}
