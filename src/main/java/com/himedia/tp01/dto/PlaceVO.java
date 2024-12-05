package com.himedia.tp01.dto;

import lombok.Data;

@Data
public class PlaceVO {
    private int place_seq;
    private String place_name;
    private String place_location;
    private String place_description;
    private String place_image;
    private String category;
}
