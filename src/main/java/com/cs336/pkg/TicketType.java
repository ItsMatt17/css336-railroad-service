package com.cs336.pkg;

public enum TicketType {
    ROUND_TRIP("ROUND_TRIP", 2),
    ONE_WAY("ONE_WAY", 1);

    public final int factor;
    public final String label;
    TicketType(String label, int factor){
        this.label = label;
        this.factor = factor;
    }


    public static TicketType valueOfOrDefault(String label) {
        try {
            return TicketType.valueOf(label);
        } catch (IllegalArgumentException | NullPointerException ex) {
            return ONE_WAY;
        }
    }


}
