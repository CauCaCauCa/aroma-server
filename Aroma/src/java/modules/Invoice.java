package modules;

/**
 *
 * @author dotie
 */
public class Invoice {

    private String phone;
    private String detail;
    private long time_order;
    private String address;
    private String payment;
    private String isInvoice;

    public Invoice(String phone, String detail, long time_order, String address, String payment, String isInvoice) {
        this.phone = phone;
        this.detail = detail;
        this.time_order = time_order;
        this.address = address;
        this.payment = payment;
        this.isInvoice = isInvoice;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public long getTime_order() {
        return time_order;
    }

    public void setTime_order(long time_order) {
        this.time_order = time_order;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getIsInvoice() {
        return isInvoice;
    }

    public void setIsInvoice(String isInvoice) {
        this.isInvoice = isInvoice;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    @Override
    public String toString() {
        return "Invoice{" + "phone=" + phone + ", detail=" + detail + ", time_order=" + time_order + ", address=" + address + ", payment=" + payment + ", isInvoice=" + isInvoice + '}';
    }

    

}
