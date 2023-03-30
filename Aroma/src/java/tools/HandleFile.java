package tools;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

/**
 *
 * @author dotie
 */
public class HandleFile {

    public static void main(String[] args) {
        System.out.println();
    }

    public static LinkedList<String> recordFileFromClient(HttpServletRequest request, String type, String name) {
        String subPath = File.separator + "perfume" + File.separator
                + (type.matches("1") ? "man" : type.matches("2") ? "women" : "unisex")
                + File.separator + name;
        String realPath = request.getServletContext().getRealPath(subPath);
        System.out.println(realPath);
        LinkedList<String> path_imgs = new LinkedList<>();
        try {

            for (int i = 1; i <= 3; i++) {

                // get each file upload from client
                Part part = request.getPart("img" + i);

                String filename = part.getSubmittedFileName();
                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectory(Paths.get(realPath));
                }

                part.write(realPath + "/" + "img" + i + ".png");
                path_imgs.add("." + subPath + "/img" + i + ".png");
            }

            return path_imgs;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

}
