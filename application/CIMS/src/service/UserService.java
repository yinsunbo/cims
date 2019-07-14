package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Cinema;
import entity.Media;
import entity.Movie;
import entity.Page;
import entity.User;
import entity.UserCinema;
import mapper.CinemaMapper;
import mapper.MediaMapper;
import mapper.MovieMapper;
import mapper.UserMapper;

@Service
public class UserService {
	
	@Resource
	private UserMapper userMapper;
	
	@Resource
	private CinemaMapper cinemaMapper;
	
	public User login(User u) {
		User user=userMapper.login(u);
		if(user==null) {
			return null;
		}else {
			return user;
		}
		
	}
	
	public List<UserCinema> userList(){
		
		return userMapper.userList();
	}
	public List<UserCinema> userPage(Page page){
		
		return userMapper.userPage(page);
	}
	
	
	public UserCinema findUser(int noId) {
		return userMapper.findUser(noId);
	}
	
	public boolean addUser(User user) {
		return userMapper.addUser(user)==1;
	}
	
	public List<Cinema> addUserCinema(){
		return cinemaMapper.addUserCinema();
	}
	public int count() {
		return userMapper.count();
	}
	
	public boolean deleteUser(int noId) {
		return userMapper.deleteUser(noId)==1;
	}
	public boolean updateUser(User user) {
		return userMapper.updateUser(user)==1;
	}
}
