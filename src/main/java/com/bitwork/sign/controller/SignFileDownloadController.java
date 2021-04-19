package com.bitwork.sign.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet("/sign/download")
public class SignFileDownloadController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리 UTF-8 설정
		request.setCharacterEncoding("UTF-8");

		// 전달받은 파라미터 값 추출
		String fileName = request.getParameter("fileName");
		String dataFolder = request.getServletContext().getRealPath("/upload/sign");
		File f = new File(dataFolder);
		if (!f.exists()) {
			boolean mkdirs = f.mkdirs();
			if (mkdirs) {
				System.out.println("폴더가 생성되었습니다");
			}
		}
		String oriname = request.getParameter("oriName");

		// 다운로드 받을 수 있도록 클라이언트 응답 문서타입 변경
		response.setContentType("application/x-msdownload");

		// 클라이언트 헤더 정보를 첨부파일이 있는 곳으로 변경
		response.setHeader("Content-Disposition", "attachment;filename=" + oriname);

		/*** 실제 파일을 읽고 쓰기 작업 ***
		// 물리적으로 실제 파일을 복사하는 작업 구현(바이트계열 처리)
		// 원본파일에서 읽고(input) 대상파일에 쓰기(output)
		*/
		File file = new File(dataFolder + "/" + fileName);
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		if (file.isFile()) {	// 속성이 파일이냐
			try {
				// 파일을 읽기 위한 객체 생성
				fis = new FileInputStream(file);
				bis = new BufferedInputStream(fis);
				
				// 파일에 쓰기 위한 객체 생성
				bos = new BufferedOutputStream(response.getOutputStream());
				
				// 파일로부터 읽고 쓰기
				int readValue = bis.read();
				while (readValue != -1) {
					bos.write(readValue);
					readValue = bis.read();
				}
				bos.flush(); 	// 버퍼에 남아있는게 있으면 출력
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				bos.close();
				bis.close();
			}
		}
	}
	
}
