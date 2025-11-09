package com.tech.entities;

import com.tech.dao.CommonDao;

public class PostDTO {
    private int id;
    private String title;
    private String summary;
    private String imageName;
    private Long likeCount;

    public PostDTO(Post p) {
        this.id = p.getId();
        this.title = p.getTitle();
        this.summary = p.getContent();
        this.imageName =p.getPic();
        this.likeCount = new CommonDao().likeCount(p.getId()) ==null ?0:new CommonDao().likeCount(p.getId());
    }


}
