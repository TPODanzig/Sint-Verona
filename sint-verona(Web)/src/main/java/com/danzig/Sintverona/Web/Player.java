package com.danzig.Sintverona.Web;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name = "users")
public class Player {
    @Id
    private String id;
    private int clicks = 0;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public int getClicks() { return clicks; }
    public void setClicks(int clicks) { this.clicks = clicks; }
}