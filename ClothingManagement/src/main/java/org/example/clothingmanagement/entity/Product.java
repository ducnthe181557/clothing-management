package org.example.clothingmanagement.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@NoArgsConstructor
@Data
@AllArgsConstructor
@Builder
public class Product {
    private String id;
    private String name;
    private Double price;
    private String material;
    private String gender;
    private String seasons;
    private Integer minQuantity;
    private Date createdDate;
    private String description;
    private String madeIn;
    private Integer binId;
    private Integer categoryId;
    private String createdBy;
    private String supplierId;
    private int Status;


    //Thừa
    private Integer totalQuantity;
    private String urlImage;

    public Product(String name, Double price, String seasons, String supplierId, String material, String madeIn, String gender, String description, Integer categoryId, Integer minQuantity,Integer BinId,String createdBy) {
        this.name = name;
        this.price = price;
        this.seasons = seasons;
        this.supplierId = supplierId;
        this.material = material;
        this.madeIn = madeIn;
        this.gender = gender;
        this.description = description;
        this.categoryId = categoryId;
        this.minQuantity = minQuantity;
        this.binId = BinId;
        this.createdBy = createdBy;
    }
    public Product(String name, Double price, String seasons, String supplierId, String material, String madeIn, String gender, String description, Integer categoryId, Integer minQuantity,Integer BinId,String createdBy, int Status) {
        this.name = name;
        this.price = price;
        this.seasons = seasons;
        this.supplierId = supplierId;
        this.material = material;
        this.madeIn = madeIn;
        this.gender = gender;
        this.description = description;
        this.categoryId = categoryId;
        this.minQuantity = minQuantity;
        this.binId = BinId;
        this.createdBy = createdBy;
        this.Status = Status;
    }
}
