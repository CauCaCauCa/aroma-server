package tools;

/**
 *
 * @author dotie
 */
public class CheckValidate {
    public static void main(String[] args) {
        System.out.println(setFomatID("34", 5));
    }

    public static boolean length(int min, int max, String sample) {
        if (sample.length() >= min && sample.length() <= max) {
            return true;
        }
        return false;
    }

    public static String setFomatID(String sample, int size) {
        String s = sample;
        if (sample.length() >= size) {
            return sample;
        } else {
            for (int i = sample.length(); i < size; i++) {
                s = "0" + s;
            }
        }
        return s;
    }
}
