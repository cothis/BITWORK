package com.bitwork.member.controller;

import com.bitwork.member.dao.MemberDAO;
import com.bitwork.member.dto.JoinForm;
import com.bitwork.member.vo.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "UpdateController", value = "/member/update")
public class UpdateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("UpdateController.doGet");
        request.getRequestDispatcher("update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("UpdateController.doPost");

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

        String resultStr = "fail";
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
            
            MemberVO user = (MemberVO) request.getSession().getAttribute("user");

            //filename이 null이 아니고 기존 파일이 있으면 삭제
            if (fileName != null && fileName.length() > 0 && user.getFileName() != null) {
                File oldFile = new File(folder, user.getFileName());
                boolean delete = oldFile.delete();
                if (delete) {
                    System.out.println("기존 파일이 삭제되었습니다");
                }
            }

            //filename이 null이면 기존 정보 사용
            if (fileName == null || fileName.length() == 0) {
                fileName = user.getFileName();
                oriName = user.getOriName();
            }

            System.out.println("user = " + user);

            JoinForm joinForm = new JoinForm(userId, userPw, userName, userPhone, userEmail, userPosition, fileName, oriName);
            MemberDAO memberDAO = new MemberDAO();
            int result = memberDAO.updateMemberInfo(joinForm);
            if (result > 0) {
                resultStr = "ok";
                user.setId(userId);
                user.setName(userName);
                user.setPhone(userPhone);
                user.setEmail(userEmail);
                user.setPosition(userPosition);
                user.setFileName(fileName);
                user.setOriName(oriName);
            }
        } catch (Exception ignore) {
        }

        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"success\":\"" + resultStr + "\"}");
    }
}
