package com.bitwork.config;


import javax.servlet.*;
import java.io.IOException;

public class CharacterEncodingFilter implements Filter {
    private String encoding;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        encoding = filterConfig.getInitParameter("encoding");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if (request.getCharacterEncoding() == null) {
            if (encoding != null) {
                request.setCharacterEncoding(encoding);
            }
        }

        chain.doFilter(request, response);
    }
}