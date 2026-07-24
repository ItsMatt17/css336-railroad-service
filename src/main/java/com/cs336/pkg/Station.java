package com.cs336.pkg;

import java.util.Map;

public record Station(int id, String name, String city, String state) {


    public static Station fromRow(Map<String, Object> row){ 
        Tuple tuple = new Tuple(row);
        return new Station(
                tuple.getInteger("id", 0),
                tuple.getString("sname", "Unknown"),
                tuple.getString("city", "Unknown"),
                tuple.getString("state", "Unknown")
        );
        
        
    }
        
        

}
