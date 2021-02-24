package com.bitwork.config;

import com.bitwork.member.vo.MemberVO;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String requestURI = ((HttpServletRequest) request).getRequestURI();
        MemberVO user = (MemberVO) ((HttpServletRequest) request).getSession().getAttribute("user");
        if (!requestURI.equals("/member/login")) {
            if (user == null) {
                System.out.println(requestURI);
                ((HttpServletResponse)response).sendRedirect("/member/login");
                return;
            }
        } else {
            if (user != null) {
                ((HttpServletResponse)response).sendRedirect("/main");
                return;
            }
        }

        chain.doFilter(request, response);
    }
}
