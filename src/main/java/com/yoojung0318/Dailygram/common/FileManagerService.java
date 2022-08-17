package com.yoojung0318.Dailygram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
//BO의 한 부분
	
	//임의 변경 못하게 final , upload 뒤에 / 꼭 붙이기(뒤에 다른 경로가 더 들어옴), static 사용하여 객체생성없이 사용하능한 멤버변수로 만듬
	public final static String FILE_UPLOAD_PATH ="D:\\김유정\\springProject\\dailygram\\upload/";
	//사용법
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
	//파일을 저장하고 접근가능한 경로 리턴하는 기능 [핵심]
		public static String saveFile(int userid, MultipartFile file) { //userId도 같이 넘기게 만들기(파라미터 두개 같이 넘기게) , static 사용하여 객체생성없이 사용하능한 멤버변수로 만듬
			
			//정상적인 file인지 확인
			if(file == null) {
				logger.error("FileManagerService - saveFile : file 객체 null");
				return null;
				
			}
			//파일을 어디에 저장할지
			
			//"D:\\김유정\\springProject\\dailygram\\upload/3_34551451742/asdf.jpg	
			//동일 파일이름 올라와도 구분이 돼야함 
			//파일 올라올 때마다, 디렉토리를 새로 만든다.
			//디렉토리 이름 규칙
			//사용자 (userId) - 파일 이름 중복 가능
			//시간 정보 포함 - UNIX 타임: 1970년 1월 1일을 기준으로 몇 millisecond가 지났는지를 표현 - 한 사용자가 같은 이름의 게시글
			// 3_34551451742/
			
			String directoryName = userid + "_" + System.currentTimeMillis();
			
			//디렉토리 생성
			String filePath = FILE_UPLOAD_PATH + directoryName;//사용법(실제 경로가 저장될 곳)
			File directory = new File(filePath);
			if( directory.mkdir() == false) {
				//디렉토리 생성 실패
				return null;
				
			}
			 //파일저장
			
			
			try {
				//정상 작동 -> try 부분으로 정상호출
				byte[] bytes = file.getBytes();
				//D:\\김유정\\springProject\dailygram\\upload/3_34551451742/asdf.jpg
				Path path = Paths.get(filePath + file.getOriginalFilename()); //아래의 path가 위의 path
				Files.write(path, bytes); // 이 경로에 파일을 저장하세요 bytes=경로, path라는 이름으로 쓰겠다.
			} catch (IOException e) {
				
				// 오류 -> 파일처리 예외사황
				logger.error("FileManagerService - saveFile : 파일 저장 실패");
				e.printStackTrace();
				return null;
			}
			
			//외부에서 접근 가능한 경로 리턴
			//규칙정하기
			//images/3_34551451742/asdf.jpg (localhost뒤에 images를 통해 접근가능 하도록)
			//DB에 저장된 경로 가져와서, 태그 붙이면
			//<img src="images/3_34551451742/asdf.jpg" >
			
			return "/images/" + directoryName + file.getOriginalFilename();
			
		
		}
}
