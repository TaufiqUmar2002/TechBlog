package com.tech.entities;

public class PostDTO {
    private int id;
    private String title;
    private String summary;
    private String imageName;

    public PostDTO(Post p) {
        this.id = p.getId();
        this.title = p.getTitle();
        this.summary = p.getContent();
        this.imageName =p.getPic();
    }


}
