package com.himedia.tp01.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class PlaceVO {
    @NotNull
    private int place_seq;
    @NotNull
    private String place_name;
    @NotNull
    private String place_location;
    @NotNull
    private String place_description;
    @NotNull
    private String place_image;
    @NotNull
    private String savefilename;
    @NotNull
    private String category;
    @NotNull
    private String bestyn;
    private String hotyn;
}
