package com.himedia.tp01.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class StartVO {
    @NotNull
    private int hotel_seq;
    @NotNull
    private String hotel_name;
    @NotNull
    private String hotel_location;
    private String hotel_description;
    @NotNull
    private String hotel_image;
    @NotNull
    private String category;
}
