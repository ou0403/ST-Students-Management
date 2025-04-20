package com.ruoyi.leave.domain;

public class RoomSeat {

    private String title;
    private Long id;
    private String name;
    private String dept;

    private String username;

    private String color;

    private Long score;

    private String image;

    private Long rollCall;

    public String getImage() {
        return image;
    }

    public Long getRollCall() {
        return rollCall;
    }

    public void setRollCall(Long rollCall) {
        this.rollCall = rollCall;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Long getScore() {
        return score;
    }

    public void setScore(Long score) {
        this.score = score;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

}
