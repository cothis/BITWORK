<%@page import="java.util.Map"%>
<%@page import="com.bitwork.addressbook.vo.AddressBookVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.bitwork.addressbook.dao.AddressBookDAO"%>
<%@page import="com.bitwork.addressbook.paging.Paging"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
/*	Map<String, Integer> map = new HashMap<>();
	map.put("begin", p.getBegin());
	map.put("end", p.getEnd());
	
	//DB에서 현재페이지 표시할 게시글 조회
	List<AddressBookVO> list = AddressBookDAO.getList(map);
	System.out.println("> 현재 페이지 글목록(list) : " + list);*/
 %>

<!DOCTYPE html>
<html>
<head>
    <title>주소록 메인페이지</title>
    <link rel="stylesheet" href="../../css/normalize.css">
    <link rel="stylesheet" href="../../css/style.css">
    <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <h2>주소록</h2>
    <form action="index.jsp" method="post">
		검색 : <input type="search" name="title" /><br/>
		<input type="submit" />
	</form>
    <table border>
    <thead>
    	<tr>
    		<th>이름</th>
    		<th>전화번호</th>
    		<th>이메일</th>
    		<th>회사</th>
    	</tr>
    </thead>
    <tbody>
    
	<c:forEach var="vo" items="${addrlist}">
         <tr>
            <td>${vo.name }</td>
            <td>${vo.phone }</td>
            <td>${vo.email }</td>
            <td>${vo.company }</td>
            

         </tr>
      </c:forEach>
    
	
    </tbody>
    	
    <tfoot>
		<tr>
			<td colspan="4">
				<ol class="paging">
			<%--[이전으로]에 대한 사용여부 처리 시작페이지번호가 1인 경우 비활성화 --%>
			<c:choose>
				<c:when test="${pvo.beginPage == 1 }">		
					<li class="disable">이전으로</li>
				</c:when>
				<c:otherwise>
					<li><a href="list.jsp?cPage=${pvo.beginPage - 1}">이전으로</a></li>
				</c:otherwise>	
			</c:choose>		
			<%-- 블록내에 표시할 페이지 태그 작성(시작페이지 ~ 끝페이지)
				현재페이지와 페이지 번호 같으면 현재페이지 처리--%>
			<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:if test="${pageNo == pvo.nowPage }">
					<li class="now">${pageNo }</li>
				</c:if>
				<c:if test="${pageNo != pvo.nowPage }">
					<li>
						<a href="list.jsp?cPage=${pageNo }">${pageNo }</a>
					</li>
				</c:if>		
			</c:forEach>		
				<%--[다음으로]에 대한 사용여부 처리
				endPage가 전체페이지수(totalPage)보다 작은경우 활성화 --%>	
				<c:if test="${pvo.endPage < pvo.totalPage }">	
					<li>
						<a href="list.jsp?cPage=${pvo.endPage + 1}">다음으로</a>
					</li>
				</c:if>
				<c:if test="${pvo.endPage >= pvo.totalPage }">	
					<li class="disable">다음으로</li>
				</c:if>
				</ol>
			</td>
			
		</tr>
	</tfoot>	
    	
    </table>
    
    <td>
		<input type="button" value="주소추가"
			onclick="location.href='detail.jsp'">
	</td>
	<td>
		<input type="button" value="주소삭제"
			onclick="javascript:location.href='delete.jsp'">
	</td>
    		
    
    
    
	
	
	
	
	
</body>
</html>














