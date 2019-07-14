package mapper;

import java.util.List;

import entity.Media;
import entity.Movie;
import entity.Page;
import entity.User;
import entity.UserCinema;

public interface UserMapper {
	User login(User user);
	List<UserCinema> userList();
	List<UserCinema> userPage(Page page);
	UserCinema findUser(int noId);
	int addUser(User user);
	int count();
	int deleteUser(int noId);
	int updateUser(User user);     
}
