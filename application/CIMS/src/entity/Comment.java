package entity;

public class Comment {
    private Integer comment_id;
    private String comment_title;
    private String comment_content;
    private String comment_time;
    private Integer customer_id;
    private Integer movie_id;
    private String customer_name;
    public Integer getComment_id() {
        return comment_id;
    }

    public void setComment_id(Integer comment_id) {
        this.comment_id = comment_id;
    }

    public String getComment_title() {
        return comment_title;
    }

    public void setComment_title(String comment_title) {
        this.comment_title = comment_title;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public String getComment_time() {
        return comment_time;
    }

    public void setComment_time(String comment_time) {
        this.comment_time = comment_time;
    }

    public Integer getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(Integer customer_id) {
        this.customer_id = customer_id;
    }

    public Integer getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(Integer movie_id) {
        this.movie_id = movie_id;
    }

    

    @Override
    public String toString() {
        return "Comment [comment_id=" + comment_id + ", comment_title=" + comment_title + ", comment_content="
                + comment_content + ", comment_time=" + comment_time + ", customer_id=" + customer_id + ", movie_id="
                + movie_id + ", customer_name=" + customer_name + "]";
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }
    
}
