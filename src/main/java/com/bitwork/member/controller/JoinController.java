package com.bitwork.member.controller;

import com.bitwork.member.dao.MemberDAO;
import com.bitwork.member.dto.JoinForm;
import com.bitwork.member.vo.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

@WebServlet(name = "JoinController", value = "/member/join")
public class JoinController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("JoinController.doGet");
        request.getRequestDispatcher("join.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("JoinController.doPost");

        // 파일 처리
        String folderPath = request.getServletContext().getRealPath("/data/member");
        File folder = new File(folderPath);
        if (!folder.exists()) {
            boolean isNewFolder = folder.mkdirs();
            if (isNewFolder) {
                System.out.println("데이터 폴더가 생성되었습니다.");
            }
        }

        MultipartRequest mr = new MultipartRequest(request, folderPath, 1024 * 1024 * 100, "UTF-8", new DefaultFileRenamePolicy());

        boolean result = false;
        // 데이터 처리
        try {
            String userId = mr.getParameter("user_id");
            String userPw = mr.getParameter("user_pw");
            String userName = mr.getParameter("user_name");
            String userPhone = mr.getParameter("user_phone");
            String userEmail = mr.getParameter("user_email");
            String userPosition = mr.getParameter("user_position");
            String fileName = mr.getFilesystemName("user_picture");
            String oriName = mr.getOriginalFileName("user_picture");

            JoinForm joinForm = new JoinForm(userId, userPw, userName, userPhone, userEmail, userPosition, fileName, oriName);
            MemberDAO memberDAO = new MemberDAO();
            result = memberDAO.addMember(joinForm) > 0;
        } catch (Exception ignore) {
        }

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.getWriter().write(String.valueOf(result));
    }
}
