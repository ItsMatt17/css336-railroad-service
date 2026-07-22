package com.cs336.pkg;

public enum TicketType {
    ROUND_TRIP("ROUND_TRIP"),
    ONE_WAY("ONE_WAY");
    public final String label;
    TicketType(String label){
        this.label = label;
    }


}
