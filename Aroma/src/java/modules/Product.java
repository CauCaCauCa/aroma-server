package modules;

/**
 *
 * @author dotie
 */
public class Product {

    private String proID;
    private String name;
    private String brandID;
    private double price;
    private int quantity;
    private String intro;
    private String origin;
    private String typeID;
    private String img_path1;
    private String img_path2;
    private String img_path3;

    // only for cart
    public int amount = 0;

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
    
    public String getPriceS() {
        String s = "";
        int num = (int) price;
        String priceS = num + "";
        int count = 0;
        for (int i = priceS.length() - 1; i >= 0; i--) {
            if (count == 3) {
                count = 0;
                s = "." + s;
            }
            s = priceS.charAt(i) + s;
            count++;
        }
        return s;
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

    public int getAmount() {
        return amount;
    }

    public void setProID(String proID) {
        this.proID = proID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setBrandID(String brandID) {
        this.brandID = brandID;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public void setTypeID(String typeID) {
        this.typeID = typeID;
    }

    public void setImg_path1(String img_path1) {
        this.img_path1 = img_path1;
    }

    public void setImg_path2(String img_path2) {
        this.img_path2 = img_path2;
    }

    public void setImg_path3(String img_path3) {
        this.img_path3 = img_path3;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
    

    @Override
    public String toString() {
        return "Products{" + proID + ", " + name + ", " + brandID + ", " + price + ", " + quantity + ", " + intro + ", " + origin + ", " + typeID + ", " + img_path1 + ", " + img_path2 + ", " + img_path3 + '}';
    }

}
