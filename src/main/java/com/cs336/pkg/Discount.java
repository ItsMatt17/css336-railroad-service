package com.cs336.pkg;

import java.util.HashMap;

public enum Discount {
    DISABLED("DISABLED", 0.5F),
    ELDERLY("ELDERLY", 0.35F),
    CHILD("CHILD", 0.25F),
    NONE("NONE", 0F);


    public final float percent;
    public final String label;

    Discount(String label, float percent) {
        this.label = label;
        this.percent = percent;
    }


    public static Discount valueOfOrDefault(String label) {
        try {
            return Discount.valueOf(label);
        } catch (IllegalArgumentException | NullPointerException ex) {
            return NONE;
        }
    }
}