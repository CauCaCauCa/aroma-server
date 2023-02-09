package data;

import javax.servlet.http.Cookie;

/**
 *
 * @author dotie
 */
public class CookieMng {

    public static String find(String name, Cookie cookies[]) {
        String cookie = "";
        for (Cookie c : cookies) {
            if (name.matches(c.getName())) {
                cookie += c.getValue();
                break;
            }
        }
        return cookie;
    }
}
