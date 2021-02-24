package com.bitwork.commute.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitwork.commute.dao.CommuteDAO;
import com.bitwork.commute.vo.CommuteVO;
import com.bitwork.main.controller.RequestForwarder;
import com.bitwork.member.vo.MemberVO;

@WebServlet("/commute/list")
public class CommuteListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String startDay;
	String endDay;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			MemberVO mvo = (MemberVO) request.getSession().getAttribute("user");

			String nowPageStr = request.getParameter("nowPage");
			int nowPage = 1;
			if (nowPageStr != null && nowPageStr.length() > 0) {
				nowPage = Integer.parseInt(nowPageStr);
			}

			String start = request.getParameter("startDay");
			String end = request.getParameter("endDay");
			if (end == null || end.length() == 0) {
				// 파라미터가 다 없을떄
				Date _today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("YYYY/MM/01");
				start = sdf.format(_today);

				sdf = new SimpleDateFormat("YYYY/MM/dd");
				end = sdf.format(_today);

			}

			Map<String, Object> resultMap = CommuteDAO.getCommuteList(start, end, mvo.getId(), nowPage);

			String searchStart = start.replaceAll("/", "-");
			String searchEnd = end.replaceAll("/", "-");

			Map<String, String> searchOption = new HashMap<>();
			searchOption.put("start", searchStart);
			searchOption.put("end", searchEnd);
			request.setAttribute("searchOption", searchOption);
			request.setAttribute("list", resultMap.get("list"));
			request.setAttribute("paging", resultMap.get("paging"));

			RequestForwarder.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
}
