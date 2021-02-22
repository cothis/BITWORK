package com.bitwork;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "TestServlet", value = "/test")
public class TestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String testParam = request.getParameter("testParam");
        System.out.println("doGet 내의 testParam = " + testParam);
        request.getRequestDispatcher("layout.jsp?dest=include1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println("doPost 내의 id = " + id);
        request.getRequestDispatcher("layout.jsp?dest=include2.jsp").forward(request, response);
    }
}
