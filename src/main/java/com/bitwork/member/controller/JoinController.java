package com.bitwork.member.controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;

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

        String path = request.getServletContext().getRealPath("/data/member");
        System.out.println("path = " + path);

        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }

        MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 100, "UTF-8", new DefaultFileRenamePolicy());

        File user_picture = mr.getFile("user_picture");
        String filesystemName = mr.getFilesystemName("user_picture");

        int dot = filesystemName.lastIndexOf(".");
        String ext = filesystemName.substring(dot);
        String userId = mr.getParameter("user_id");

        String newName = userId + ext;
        System.out.println("newName = " + newName);

        System.out.println("userId = " + userId);
        System.out.println("filesystemName = " + filesystemName);

        System.out.println("user_picture.getParent() = " + user_picture.getParent());

        File newFile = new File(user_picture.getParent(), newName);
        try {
            boolean b = user_picture.renameTo(newFile);
            System.out.println("b = " + b);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("user_picture.getAbsolutePath() = " + user_picture.getAbsolutePath());

    }
}
