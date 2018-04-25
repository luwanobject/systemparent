package com.atguigu.bean;

import java.util.Date;

public class EmployeeInfo {
    private String id;

    private String salt;

    private Date createTime;

    private Date modifyTime;

    private Integer version;

    private String number;

    private Integer status;

    private String userName;

    private String personalId;

    private Boolean sex;

    private Date birthday;

    private String nation;

    private String password;

    private String loginName;

    private Boolean married;

    private String province;

    private String city;

    private String email;

    private Date joinTime;

    private String positionId;

    private String orgId;

    private String ccLogin;

    private String ccPwd;

    private String ccServer;

    private String ccPhone;

    private String contactMode;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt == null ? null : salt.trim();
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

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPersonalId() {
        return personalId;
    }

    public void setPersonalId(String personalId) {
        this.personalId = personalId == null ? null : personalId.trim();
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation == null ? null : nation.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName == null ? null : loginName.trim();
    }

    public Boolean getMarried() {
        return married;
    }

    public void setMarried(Boolean married) {
        this.married = married;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Date getJoinTime() {
        return joinTime;
    }

    public void setJoinTime(Date joinTime) {
        this.joinTime = joinTime;
    }

    public String getPositionId() {
        return positionId;
    }

    public void setPositionId(String positionId) {
        this.positionId = positionId == null ? null : positionId.trim();
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId == null ? null : orgId.trim();
    }

    public String getCcLogin() {
        return ccLogin;
    }

    public void setCcLogin(String ccLogin) {
        this.ccLogin = ccLogin == null ? null : ccLogin.trim();
    }

    public String getCcPwd() {
        return ccPwd;
    }

    public void setCcPwd(String ccPwd) {
        this.ccPwd = ccPwd == null ? null : ccPwd.trim();
    }

    public String getCcServer() {
        return ccServer;
    }

    public void setCcServer(String ccServer) {
        this.ccServer = ccServer == null ? null : ccServer.trim();
    }

    public String getCcPhone() {
        return ccPhone;
    }

    public void setCcPhone(String ccPhone) {
        this.ccPhone = ccPhone == null ? null : ccPhone.trim();
    }

    public String getContactMode() {
        return contactMode;
    }

    public void setContactMode(String contactMode) {
        this.contactMode = contactMode == null ? null : contactMode.trim();
    }
}