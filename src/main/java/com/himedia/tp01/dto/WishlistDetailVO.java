package com.himedia.tp01.dto;

import lombok.Data;

@Data
public class WishlistDetailVO {
    private int wishlist_detail_seq;
    private int wishlist_seq;
    private String wish_name;
    private String wish_location;
    private String wish_description;
    private String wish_image;
    private String wish_category;
}
