<%@page import="com.bitwork.addressbook.dao.AddressBookDAO"%>
<%@page import="com.bitwork.addressbook.vo.AddressBookVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	//전달받은 데이터 VO에 저장후 DB에 입력 처리(DB연동 작업)
	AddressBookVO addrvo = new AddressBookVO();
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String company = request.getParameter("company");
	
	
	
	//DB에 입력(저장) 처리
	AddressBookDAO.insert(addrvo);
	
	//화면전환(목록페이지로 이동)
	response.sendRedirect("addressbook_main.jsp");
%>