package com.ruoyi.leave.domain;

public class UserList {
    private String value;
    public Long address;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Long getAddress() {
        return address;
    }

    public void setAddress(Long address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "UserList{" +
                "value='" + value + '\'' +
                ", address=" + address +
                '}';
    }
}
