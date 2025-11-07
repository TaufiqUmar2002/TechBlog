package com.tech.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "category_fis")
public class Category {
    @Id
    @SequenceGenerator(name = "category_seq",sequenceName = "category_seq",allocationSize = 20)
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "category_seq")
    private Integer id;
    private String name;
    private String description;
    @OneToOne(mappedBy = "category",cascade = CascadeType.ALL)
    private Post post;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }
}
