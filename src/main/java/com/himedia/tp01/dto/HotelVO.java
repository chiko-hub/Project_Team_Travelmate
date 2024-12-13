package com.himedia.tp01.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class HotelVO {
    @NotNull
    private int hotel_seq;
    @NotNull
    private String hotel_name;
    @NotNull
    private String hotel_location;
    private String hotel_description;
    @NotNull
    private String hotel_image;
    private String hotel_savefilename;
    private int hotel_price;
    @NotNull
    private String category;
    private String hotel_bestyn;
    private String hotel_hotyn;
}
