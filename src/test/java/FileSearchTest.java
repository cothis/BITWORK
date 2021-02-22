import org.junit.jupiter.api.Test;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.stream.Stream;

public class FileSearchTest {

    @Test
    public void fileSearch() throws Exception {
        //given
        String folderPath = "/Users/cothis/study/BitWork/";
        File folder = new File(folderPath);
        if (!folder.exists()) {
            boolean isNewFolder = folder.mkdirs();
            if (isNewFolder) {
                System.out.println("데이터 폴더가 생성되었습니다.");
            }
        }

        String target = "Bonobono";

        Stream<Path> pathStream = Files.find(folder.toPath(), 5, ((path, attr) -> {
            String filename = path.getFileName().toString();
            return filename.equals(target + ".png") || filename.equals(target + ".jpg");
        }));

        pathStream.forEach(path -> {
            System.out.println("path.getFileName() = " + path.getFileName());
        });

        //when

        //then
    }
}
