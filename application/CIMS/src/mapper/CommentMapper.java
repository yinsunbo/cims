package mapper;

import java.util.List;

import entity.Comment;

public interface CommentMapper {

    int addComment(Comment comment);

    List<Comment> getComment(int movie_id);

    List<Comment> getCommentList(int movie_id);

    List<Comment> getMyComment(int customer_id);

    Comment findComment(int comment_id);

    int delComment(int comment_id);

}
