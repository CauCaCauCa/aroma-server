package data;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dotie
 */
public class CookieMng {

    public static String find(String name, Cookie cookies[]) {
        String cookie = "";
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().matches(name)) {
                    cookie += c.getValue();
                    break;
                }
            }
        }
        return cookie;
    }

}
