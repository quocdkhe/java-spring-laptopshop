package vn.quocdk.laptopshop.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull
    @NotEmpty(message = "Tên sản phẩm không được để trống")
    private String name;

    @NotNull
    @Min(value = 10000, message = "Giá sản phẩm phải từ 10.000 VNĐ trở lên")
    private double price;

    private String image;

    @NotNull
    @NotEmpty(message = "Thông tin sản phẩm không được để trống")
    @Column(columnDefinition = "MEDIUMTEXT")
    private String detailDesc;

    @NotNull
    @NotEmpty(message = "Thông tin ngắn không được để trống")
    private String shortDesc;

    @NotNull
    @Min(value = 1, message = "Số lượng kho phải từ 1")
    private long quantity;

    private long sold;
    private String factory;
    private String purpose;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getSold() {
        return sold;
    }

    public void setSold(long sold) {
        this.sold = sold;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", price=" + price + ", image=" + image + ", detailDesc="
                + detailDesc + ", shortDesc=" + shortDesc + ", quantity=" + quantity + ", sold=" + sold + ", factory="
                + factory + ", purpose=" + purpose + "]";
    }
}
