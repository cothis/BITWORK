package com.bitwork.member.command;

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
import java.util.Map;

@WebServlet(name = "MemberApi", value = "/member/api")
public class MemberApi extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        
        String command = request.getParameter("command");
        System.out.println("command = " + command);

        MemberVO user = (MemberVO) request.getSession().getAttribute("user");
        CompanyVO companyVO = null;
        if (user != null) {
            companyVO = CompanyDAO.findById(user.getCompanyIdx());
        }
        Map<String, Object> map = new HashMap<>();

        MemberCommand memberCommand = null;
        switch (command) {
            case "findById": {
                memberCommand = new FindByIdCommand();
                memberCommand.execute(request, response);
                break;
            }
            case "findInvitable": {
                memberCommand = new FindInvitableLikeIdCommand();
                memberCommand.execute(request, response);
                break;
            }
            case "findApplyList": {
                memberCommand = new FindApplyListCommand();
                memberCommand.execute(request, response);
                break;
            }
            case "searchCompany": {
                memberCommand = new SearchCompanyCommand();
                memberCommand.execute(request, response);
                break;
            }
            case "invite": {
                memberCommand = new InviteMemberCommand();
                memberCommand.execute(request, response);
                break;
            }
            case "inviteCompanyName": {
                if (companyVO != null) {
                    map.put("companyName", companyVO.getCompanyName());
                } else {
                    map.put("result", false);
                    map.put("cause", "companyVO가 null입니다");
                }
                response.getWriter().write(new Gson().toJson(map));
                break;
            }
            case "applyRefuseInvite": {
                if (user != null) {
                    MemberDAO dao = new MemberDAO();
                    Map<String, Object> parameterMap = new HashMap<>();
                    parameterMap.put("isApply", request.getParameter("isApply"));
                    parameterMap.put("id", user.getId());
                    int result = dao.updateGrade(parameterMap);
                    map.put("result", result);
                } else {
                    map.put("result", false);
                    map.put("cause", "memberVO가 null입니다");
                }
                response.getWriter().write(new Gson().toJson(map));
                break;
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
