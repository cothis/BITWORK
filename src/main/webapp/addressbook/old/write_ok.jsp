<%@page import="com.bitwork.addressbook.dao.AddressBookDAO"%>
<%@page import="com.bitwork.addressbook.vo.AddressBookVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	//���޹��� ������ VO�� ������ DB�� �Է� ó��(DB���� �۾�)
	AddressBookVO addrvo = new AddressBookVO();
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String company = request.getParameter("company");
	
	
	
	//DB�� �Է�(����) ó��
	AddressBookDAO.insert(addrvo);
	
	//ȭ����ȯ(����������� �̵�)
	response.sendRedirect("addressbook_main.jsp");
%>