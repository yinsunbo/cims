package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Comment;
import mapper.CommentMapper;

@Service
public class CommentService {
    @Resource
    CommentMapper commentMapper;

    public boolean addComment(Comment comment) {
        // TODO Auto-generated method stub
        return commentMapper.addComment(comment)==1;
    }

    public List<Comment> getComment(int movie_id) {
        // TODO Auto-generated method stub
        return commentMapper.getComment(movie_id);
    }

    public List<Comment> getCommentList(int movie_id) {
        // TODO Auto-generated method stub
        return commentMapper.getCommentList(movie_id);
    }

    public List<Comment> getMyComment(int customer_id) {
        // TODO Auto-generated method stub
        return commentMapper.getMyComment(customer_id);
    }

    public boolean delComment(int comment_id) {
        // TODO Auto-generated method stub
        return commentMapper.delComment(comment_id)==1;
    }

    public Comment findComment(int comment_id) {
        // TODO Auto-generated method stub
        return commentMapper.findComment(comment_id);
    }
}
