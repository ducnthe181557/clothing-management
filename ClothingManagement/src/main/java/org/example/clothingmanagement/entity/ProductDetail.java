package org.example.clothingmanagement.entity;


import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
public class ProductDetail {
    private String id;
    private Integer quantity;
    private Double weight;
    private String color;
    private String size;
    private String image;
    private String productId;
    private int status;

    private String productName;




}
