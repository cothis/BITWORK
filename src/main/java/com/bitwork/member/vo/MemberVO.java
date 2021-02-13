package com.bitwork.member.vo;

import lombok.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Date;
import java.util.stream.Stream;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class MemberVO {
    private String id;
    private String pw;
    private String name;
    private Integer picture;
    private String phone;
    private String email;
    private String position;
    private Date regdate;
    private Integer companyIdx;
    private Date joindate;
    private Integer grade;

    public MemberVO(String id, String pw, String name, Integer picture, String phone, String email, String position) {
        this.id = id;
        this.pw = pw;
        this.name = name;
        this.picture = picture;
        this.phone = phone;
        this.email = email;
        this.position = position;
    }

    public String getImgPath(HttpServletRequest request) throws IOException {
        String folderPath = request.getServletContext().getRealPath("/data/member");
        File folder = new File(folderPath);
        if (!folder.exists()) {
            boolean isNewFolder = folder.mkdirs();
            if (isNewFolder) {
                System.out.println("데이터 폴더가 생성되었습니다.");
            }
        }

        Stream<Path> pathStream = Files.find(folder.toPath(), 5, ((path, attr) -> {
            String filename = path.getFileName().toString();
            return filename.equals(id + ".png") || filename.equals(id + ".jpg");
        }));

        if (pathStream.findAny().isPresent()) {
            Path path = pathStream.findAny().get();
            return path.toString();
        }

        return null;
    }
}
