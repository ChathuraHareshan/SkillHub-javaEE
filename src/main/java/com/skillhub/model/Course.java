package com.skillhub.model;

import java.io.Serializable;


public class Course implements Serializable {

    private int id;
    private String code;
    private String name;
    private String description;
    private int durationWeeks;
    private Integer trainerId;
    private String status = "ACTIVE";

    public Course() { }

    public Course(int id, String code, String name, String description, int durationWeeks, Integer trainerId) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.description = description;
        this.durationWeeks = durationWeeks;
        this.trainerId = trainerId;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getDurationWeeks() { return durationWeeks; }
    public void setDurationWeeks(int durationWeeks) { this.durationWeeks = durationWeeks; }

    public Integer getTrainerId() { return trainerId; }
    public void setTrainerId(Integer trainerId) { this.trainerId = trainerId; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
