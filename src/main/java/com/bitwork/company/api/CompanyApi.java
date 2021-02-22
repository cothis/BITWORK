package com.bitwork.company.api;

import com.bitwork.common.Paging;
import com.bitwork.company.dao.CompanyDAO;
import com.bitwork.company.vo.CompanyVO;
import com.bitwork.member.dao.MemberDAO;
import com.bitwork.member.vo.MemberVO;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CompanyApi", value = "/company/api")
public class CompanyApi extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        MemberVO user = (MemberVO) request.getSession().getAttribute("user");
        MemberDAO memberDAO = new MemberDAO();
        Map<String, Object> result = new HashMap<>();

        String type = request.getParameter("type");
        switch (type) {
            case "employees" : {
                String name = request.getParameter("name");
                String page = request.getParameter("page");
                if (page == null) {
                    page = "1";
                }
                result = memberDAO.findMembersByCompanyId(user.getCompanyIdx(), name, page, result);
                break;
            }
        }

        response.setContentType("application/json;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.getWriter().write(new Gson().toJson(result));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
