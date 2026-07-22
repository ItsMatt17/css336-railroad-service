package com.cs336.pkg;

public enum Discount {
    DISABLED("DISABLED"),
    ELDERLY("ELDERLY"),
    CHILD("CHILD"),
    NONE("NONE");
    public final String label;
    Discount(String label){
        this.label = label;
    }

}
