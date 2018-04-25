package com.atguigu.bean;

public class EmployeeInfoWithBLOBs extends EmployeeInfo {
    private String attachOrgId;

    private String attachEntrustId;

    public String getAttachOrgId() {
        return attachOrgId;
    }

    public void setAttachOrgId(String attachOrgId) {
        this.attachOrgId = attachOrgId == null ? null : attachOrgId.trim();
    }

    public String getAttachEntrustId() {
        return attachEntrustId;
    }

    public void setAttachEntrustId(String attachEntrustId) {
        this.attachEntrustId = attachEntrustId == null ? null : attachEntrustId.trim();
    }
}