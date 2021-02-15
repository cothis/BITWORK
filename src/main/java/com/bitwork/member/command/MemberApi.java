package com.bitwork.member.command;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MemberApi", value = "/member/api")
public class MemberApi extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        String command = request.getParameter("command");

        MemberCommand memberCommand = null;

        switch (command) {
            case "findById" : {
                memberCommand = new FindByIdCommand();
                memberCommand.execute(request, response);
                break;
            }
            case "searchCompany" : {
                memberCommand = new SearchCompanyCommand();
                memberCommand.execute(request, response);
            }
            default: {
                break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}