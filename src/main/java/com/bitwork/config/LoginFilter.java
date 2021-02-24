package com.bitwork.config;

import com.bitwork.member.vo.MemberVO;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) {

        System.out.print("Authentication: Request received ...");
        try {
            boolean authorized = false;
            if (request instanceof HttpServletRequest) {
                HttpSession session = ((HttpServletRequest) request).getSession(false);
                if (session != null) {
                    MemberVO user = (MemberVO) session.getAttribute("user");
                    if ((user != null))
                        authorized = true;
                }
            }
            if (authorized) {
                chain.doFilter(request, response);
            } else {
                ServletContext context = request.getServletContext();
                context.getRequestDispatcher("/member/login").forward(request, response);
            }
        } catch (IOException io) {
            System.out.println("IOException raised in AuthenticationFilter");
        } catch (ServletException se) {
            System.out.println("ServletException raised in AuthenticationFilter");
        }
        System.out.print("Authentication: Response dispatched ...");
    }
}
