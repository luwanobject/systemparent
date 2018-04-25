package com.atguigu.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SysOrganization  implements Serializable{
    private String id;

    private Date createTime;

    private Date modifyTime;

    private Integer version;

    private Integer status;

    private String name;

    private String parentId;

    private String address;

    private String phone;

    private String postCode;

    private String fax;

    private Integer type;

    private Integer orderNo;

    private String code;

    private String principalId;

    private String path;

    private String pdName;

    private Integer _parentId;

    public String getPdName() {

        return pdName;
    }

    public void setPdName(
            String pdName) {
        this.pdName = pdName;
    }


    public Integer get_parentId() {
        return Integer.parseInt(parentId);
    }

    public void set_parentId(Integer _parentId) {
        this._parentId = _parentId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this._parentId=Integer.parseInt(parentId);
        this.parentId = parentId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }



    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPrincipalId() {
        return principalId;
    }

    public void setPrincipalId(String principalId) {
        this.principalId = principalId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "SysOrganization{" +
                "id='" + id + '\'' +
                ", createTime=" + createTime +
                ", modifyTime=" + modifyTime +
                ", version=" + version +
                ", status=" + status +
                ", name='" + name + '\'' +
                ", parentId='" + parentId + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", postCode='" + postCode + '\'' +
                ", fax='" + fax + '\'' +
                ", type=" + type +
                ", orderNo=" + orderNo +
                ", code='" + code + '\'' +
                ", principalId='" + principalId + '\'' +
                ", path='" + path + '\'' +
                ", pdName='" + pdName + '\'' +
                ", _parentId=" + _parentId +
                '}';
    }
}