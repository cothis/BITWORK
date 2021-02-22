package com.bitwork.member.command;

import com.bitwork.company.dao.CompanyDAO;
import com.bitwork.company.vo.CompanyVO;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class SearchCompanyCommand implements MemberCommand {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String companyName = request.getParameter("companyName");
        List<CompanyVO> list = CompanyDAO.findByName(companyName);
        String gson = new Gson().toJson(list);

        response.getWriter().write(gson);
    }
}
