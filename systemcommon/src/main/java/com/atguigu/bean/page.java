package com.atguigu.bean;

import java.util.List;

/**
 * Created by luwan on 2018/4/22.
 */
public class page<T> {
    private int total;

    private List<T> rows;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }
}
