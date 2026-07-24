package com.cs336.pkg;

import java.time.LocalDateTime;
import java.util.Map;

public class Tuple {

    private final Map<String, Object> data;

    public Tuple(Map<String, Object> data){
        this.data = data;
    }


    String getString(String col, String fallback ){
        Object o = data.get(col);
        return (o != null) ? o.toString() : fallback;
    }

    LocalDateTime getDateTime(String col, LocalDateTime fallback ){
        Object o = data.get(col);
        return (o != null) ? (LocalDateTime) o : fallback;
    }

    int getInteger(String col, int fallback ){
        Object o = data.get(col);
        return (o instanceof Number) ?  ((Number) o).intValue() : fallback;
    }

    float getFloat(String col, float fallback ){
        Object o = data.get(col);
        return (o instanceof Number) ?  ((Number) o).floatValue() : fallback;
    }



}
