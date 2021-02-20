package com.bitwork.sign.controller;

import com.bitwork.member.vo.MemberVO;
import com.bitwork.sign.dao.SignDAO;
import com.bitwork.sign.vo.SignVO;
import com.bitwork.sign.vo.SignWriteForm;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "SignWriteController", value = "/sign/write")
public class SignWriteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
        request.setAttribute("date", sdf.format(date));

        String docNo = request.getParameter("docNo");
        if (docNo != null && docNo.length() > 0) {
            SignVO vo = SignDAO.findByDocNo(Integer.parseInt(docNo));
            MemberVO user = (MemberVO) request.getSession().getAttribute("user");

            if (user.getGrade() == 3 && vo.getUserRead() == 0) {
                SignDAO.updateReadStatus(vo.getDocNo(), 3);
            } else if (user.getGrade() == 4 && vo.getBossRead() == 0) {
                SignDAO.updateReadStatus(vo.getDocNo(), 4);
            }
            request.setAttribute("vo", vo);
        }

        request.getRequestDispatcher("write_detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String dataFolder = request.getServletContext().getRealPath("upload/sign");
        File file = new File(dataFolder);
        if (!file.exists()) {
            boolean mkdirs = file.mkdirs();
            if (mkdirs) {
                System.out.println("폴더가 생성되었습니다");
            }
        }

        MultipartRequest mr = new MultipartRequest(request, dataFolder, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

        MemberVO user = (MemberVO) request.getSession().getAttribute("user");
        String subject = mr.getParameter("subject");
        String content = mr.getParameter("content");
        String writer = mr.getParameter("writer");
        String fileName = mr.getFilesystemName("file");
        String oriName = mr.getOriginalFileName("file");

        String sign = mr.getParameter("sign");
        System.out.println("sign = " + sign);
        String docNo = mr.getParameter("docNo");
        System.out.println("docNo = " + docNo);
        if (sign != null) {
            // 업데이트 처리 (승인, 거절)
            if ("true".equals(sign)) {
                sign = "완료";
            } else {
                sign = "반려";
            }
            int result = SignDAO.updateSign(Integer.parseInt(docNo), sign);
            String encodedStatus = URLEncoder.encode(sign, "UTF-8");
            response.sendRedirect("list?docStatus=" + encodedStatus);
        } else {
            // 작성 처리
            SignWriteForm formData = new SignWriteForm(user.getId(), user.getName(), subject, content, fileName, oriName, user.getGrade());

            int result = SignDAO.insertDocument(formData);
            response.sendRedirect("list");
        }

    }
}
