package com.tech.entities;

import jakarta.persistence.*;
import oracle.sql.TIMESTAMP;

@Entity
@Table(name = "post_fis")
public class Post {
    @Id
    @SequenceGenerator(name = "post_seq",sequenceName = "pos_seq",allocationSize = 20)
    @GeneratedValue(strategy = GenerationType.IDENTITY,generator = "post_seq")
    private Integer id;
    private String title;
    private String content;
    private String code;
    private String pic;
    private TIMESTAMP creationTimeStamp;
    @OneToOne
    @JoinColumn(name = "category_id",referencedColumnName = "id")
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
}
