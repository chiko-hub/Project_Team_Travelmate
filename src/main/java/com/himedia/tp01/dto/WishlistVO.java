package com.himedia.tp01.dto;

import lombok.Data;

@Data
public class WishlistVO {
    private int wishlist_seq;
    private String wishlist_title;
    private String wishlist_category;
    private String userid;
}
