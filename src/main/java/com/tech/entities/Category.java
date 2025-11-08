package com.tech.entities;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "category_fis")
public class Category  {
    @Id
    @SequenceGenerator(name = "category_seq",sequenceName = "category_seq",allocationSize = 20,initialValue = 5000)
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "category_seq")
    private Integer id;
    private String name;
    private String description;
    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL)
    private List<Post> posts;

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

    public List<Post> getPost() {
        return posts;
    }

    public void setPost(List<Post> post) {
        this.posts = post;
    }
}
