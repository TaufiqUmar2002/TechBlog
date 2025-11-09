package com.tech.entities;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "post_fis")
public class Post {
    @Id
    @SequenceGenerator(name = "post_seq",sequenceName = "pos_seq",allocationSize = 20,initialValue = 5000)
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "post_seq")
    private Integer id;
    private String title;
    @Lob
    private String content;
    private String code;
    private String pic;
    private LocalDate creationTimeStamp;
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public LocalDate getCreationTimeStamp() {
        return creationTimeStamp;
    }

    public void setCreationTimeStamp(LocalDate creationTimeStamp) {
        this.creationTimeStamp = creationTimeStamp;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
