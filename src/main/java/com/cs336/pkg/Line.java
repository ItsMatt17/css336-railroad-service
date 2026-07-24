package com.cs336.pkg;

import java.util.Map;

public record Line(String name, float fare, int duration_mins, Station origin, Station dest) {
    private static final String COL_NAME = "lname";
    private static final String COL_FARE = "fare";
    private static final String COL_DURATION_MINS = "duration_mins";
    private static final String COL_ORIGIN_ID = "origin";
    private static final String COL_DEST_ID = "dest";


    public static Line fromRow(Map<String, Object> row){
        Tuple tuple = new Tuple(row);
        return new Line(
                tuple.getString(COL_NAME, "Unknown"),
                tuple.getFloat(COL_FARE, 0.0F),
                tuple.getInteger(COL_DURATION_MINS, 0),
                //TODO: Give these real fallbacks
                ApplicationDB.getStation(tuple.getInteger(COL_ORIGIN_ID, 0)).get(),
                ApplicationDB.getStation(tuple.getInteger(COL_DEST_ID, 0)).get()
        );
    }
}
