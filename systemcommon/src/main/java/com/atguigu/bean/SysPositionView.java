package com.atguigu.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by luwan on 2018/4/25.
 */
public class SysPositionView extends SysPosition {

   private List<String> parentPosition=new ArrayList<>();

    public List<String> getParentPosition() {
        return parentPosition;
    }

    public void setParentPosition(List<String> parentPosition) {
        this.parentPosition = parentPosition;
    }
}
