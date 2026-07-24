package com.cs336.pkg;

public enum Permission {
    NONE(),
    REP(),
    ADMIN();

    public static Permission valueOfOrDefault(String label) {
        try {
            return Permission.valueOf(label);
        } catch (IllegalArgumentException | NullPointerException ex) {
            return NONE;
        }
    }
}
