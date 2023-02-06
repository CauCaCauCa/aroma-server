package modules;

/**
 *
 * @author dotie
 */
public class Product {

    private final String proID;
    private final String name;
    private final String brandID;
    private final double price;
    private final int quantity;
    private final String intro;
    private final String origin;
    private final String typeID;
    private final String img_path1;
    private final String img_path2;
    private final String img_path3;

    public Product(String proID, String name, String brandID, double price, int quantity, String intro, String origin, String typeID, String img_path1, String img_path2, String img_path3) {
        this.proID = proID;
        this.name = name;
        this.brandID = brandID;
        this.price = price;
        this.quantity = quantity;
        this.intro = intro;
        this.origin = origin;
        this.typeID = typeID;
        this.img_path1 = img_path1;
        this.img_path2 = img_path2;
        this.img_path3 = img_path3;
    }

    public String getProID() {
        return proID;
    }

    public String getName() {
        return name;
    }

    public String getBrandID() {
        return brandID;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getIntro() {
        return intro;
    }

    public String getOrigin() {
        return origin;
    }

    public String getTypeID() {
        return typeID;
    }

    public String getImg_path1() {
        String str = "./";
        for (int i = 1; i < img_path1.length(); i++) {
            if (img_path1.charAt(i) == '\\') {
                str += "/";
            } else {
                str += img_path1.charAt(i) + "";
            }
        }
        return str;
    }

    public String getImg_path2() {
        return img_path2;
    }

    public String getImg_path3() {
        return img_path3;
    }

    @Override
    public String toString() {
        return "Products{" + proID + ", " + name + ", " + brandID + ", " + price + ", " + quantity + ", " + intro + ", " + origin + ", " + typeID + ", " + img_path1 + ", " + img_path2 + ", " + img_path3 + '}';
    }

}
