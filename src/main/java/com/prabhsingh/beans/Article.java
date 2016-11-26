package com.prabhsingh.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.time.LocalDate;

/**
 * Created by prabh on 2016-11-25.
 */
@Entity
public class Article {
    @Id
    @GeneratedValue
    private int Id;
    private String title;
    @Column(length=55555)
    private String source;
    private LocalDate lastModifiedDate;
    private String user;

    public Article(String title, String source, LocalDate lastModifiedDate, String user) {
        this.title = title;
        this.source = source;
        this.lastModifiedDate = lastModifiedDate;
        this.user = user;
    }

    public Article() {
    }

    public String getTitle() {
        return title;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public LocalDate getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(LocalDate lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
}
