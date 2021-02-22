package com.bitwork.main.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RequestForwarder {
    public static void forward(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/layout.jsp?dest=" + request.getRequestURI() + ".jsp").forward(request, response);
    }
}
