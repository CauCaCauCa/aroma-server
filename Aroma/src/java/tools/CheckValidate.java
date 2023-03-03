package tools;

/**
 *
 * @author dotie
 */
public class CheckValidate {

    public static boolean length(int min, int max, String sample) {
        if (sample.length() >= min && sample.length() <= max) {
            return true;
        }
        return false;
    }
}
