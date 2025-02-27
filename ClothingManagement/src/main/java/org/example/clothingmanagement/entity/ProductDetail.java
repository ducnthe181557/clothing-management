package org.example.clothingmanagement.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductDetail {
    private String id;
    private Integer quantity;
    private Double weight;
    private String color;
    private String size;
    private String image;
    private String productId; // trước để kiểu Long
    private int Status;



}
